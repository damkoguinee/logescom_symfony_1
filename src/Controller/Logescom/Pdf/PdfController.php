<?php

namespace App\Controller\Logescom\Pdf;

use Dompdf\Dompdf;
use Dompdf\Options;
use App\Entity\LieuxVentes;
use App\Repository\UserRepository;
use App\Repository\StockRepository;
use App\Repository\CaisseRepository;
use App\Repository\ChequeEspeceRepository;
use App\Repository\ClientRepository;
use App\Repository\ClotureCaisseRepository;
use App\Repository\DeviseRepository;
use App\Repository\RegionRepository;
use App\Repository\RecetteRepository;
use App\Repository\DepensesRepository;
use App\Repository\PersonnelRepository;
use App\Repository\VersementRepository;
use App\Repository\EntrepriseRepository;
use App\Repository\ListeStockRepository;
use Doctrine\ORM\EntityManagerInterface;
use App\Repository\FacturationRepository;
use App\Repository\LieuxVentesRepository;
use App\Repository\ModePaiementRepository;
use App\Repository\CommandeProductRepository;
use App\Repository\DecaissementRepository;
use App\Repository\EchangeDeviseRepository;
use App\Repository\LivraisonRepository;
use App\Repository\MouvementCaisseRepository;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Repository\MouvementCollaborateurRepository;
use App\Repository\TransfertFondRepository;
use Symfony\Component\HttpFoundation\Session\SessionInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

#[Route('/logescom/pdf/pdf')]
class PdfController extends AbstractController
{

    #[Route('/stock', name: 'app_logescom_pdf_pdf_stock')]
    public function stockPdf(Request $request, StockRepository $stockRep, ListeStockRepository $listeStockRep, EntityManagerInterface $em)
    {
        $lieu_vente = $this->getUser()->getLieuVente();        
        $logoPath = $this->getParameter('kernel.project_dir') . '/public/images/img-logos/'.$lieu_vente->getEntreprise()->getLogo();
        $logoBase64 = base64_encode(file_get_contents($logoPath));

        if ($request->get("magasin")){
            $magasin = $listeStockRep->find($request->get("magasin"));
        }else{
            $magasin = $listeStockRep->findOneBy([]);
        }

        if ($request->get("search")){
            $search = $request->get("search");
        }else{
            $search = "";
        }

        if ($request->get('type') and $request->get('type') != 'général') {
            $stocks = $stockRep->stockParTypePaginated($magasin, $request->get('type'), 1, 2000); 
            $type = $request->get('type');
        }else{
            $stocks = $stockRep->findStocksPaginated($magasin, $search, 1, 2000); 
            $type = 'général';
        }

        $html = $this->renderView('logescom/pdf/pdf_stock.html.twig', [
            'stocks' => $stocks,            
            'logoPath' => $logoBase64,
            'lieu_vente' => $lieu_vente,
        ]);

        // Configurez Dompdf
        $options = new Options();
        $options->set('isHtml5ParserEnabled', true);
        $options->set('isPhpEnabled', true);
        $options->set("isPhpEnabled", true);
        $options->set("isHtml5ParserEnabled", true);

        // Instancier Dompdf
        $dompdf = new Dompdf($options);

        // Charger le contenu HTML
        $dompdf->loadHtml($html);

        // Définir la taille du papier (A4 par défaut)
        $dompdf->setPaper('A4', 'portrait');

        // Rendre le PDF (stream le PDF au navigateur)
        $dompdf->render();

        // Renvoyer une réponse avec le contenu du PDF
        return new Response($dompdf->output(), 200, [
            'Content-Type' => 'application/pdf',
            'Content-Disposition' => 'inline; filename=stock_'.date("d/m/Y à H:i").'".pdf"',
        ]);
    }


    #[Route('/compte/{lieu_vente}', name: 'app_logescom_pdf_pdf_compte')]
    public function ComptePdf(Request $request, LieuxVentes $lieu_vente, MouvementCollaborateurRepository $mouvementRep, DeviseRepository $deviseRep, ClientRepository $clientRep, UserRepository $userRep, RegionRepository $regionRep, PersonnelRepository $personnelRep, EntityManagerInterface $em)
    {       
        $logoPath = $this->getParameter('kernel.project_dir') . '/public/images/img-logos/'.$lieu_vente->getEntreprise()->getLogo();
        $logoBase64 = base64_encode(file_get_contents($logoPath));
        if ($request->get("id_client_search")){
            $search = $request->get("id_client_search");
        }else{
            $search = "";
        }

        if ($request->get("date1")){
            $date1 = $request->get("date1");
            $date2 = $request->get("date2");

        }else{
            $date1 = date("Y-01-01");
            $date2 = date("Y-m-d");
        }
        $type1 = $request->get('type1') ? $request->get('type1') : 'client';
        $type2 = $request->get('type2') ? $request->get('type2') : 'client-fournisseur';

        $regions = $regionRep->findBy([], ['nom' => 'ASC']);
        $devises = $deviseRep->findAll();
        
        if (($type1 == 'personnel' and $type2 == 'personnel') or $request->get('id_personnel')) {
            $type1 = 'personnel';
            $type2 = 'personnel';
            if ($request->get("id_personnel")) {
                $clients = $personnelRep->findPersonnelByTypeBySearchByLieu($type1, $type2, $lieu_vente, $request->get("id_personnel"));
            }elseif ($request->get("region")) {
                $clients = $personnelRep->findPersonnelByTypeBySearchByLieuByRegion($type1, $type2, $lieu_vente, $request->get("region"));
            }else{
                $clients = $personnelRep->findPersonnelByTypeByLieu($type1, $type2, $lieu_vente);
    
            }
        }else{

            if ($request->get("id_client_search")) {
                $clients = $clientRep->findClientSearchByTypeByLieu($type1, $type2, $lieu_vente, $request->get("id_client_search"));
            }elseif ($request->get("region")) {
                $clients = $clientRep->findClientSearchByTypeByLieuByRegion($type1, $type2, $lieu_vente, $request->get("region"));
            }else{
                $clients = $clientRep->findClientByTypeByLieu($type1, $type2, $lieu_vente);    
            }
        }
        $comptes = [];
        foreach ($clients as $client) {
            $mouvements = $mouvementRep->findSoldeCompteCollaborateur($client->getUser(), $devises);
               // Filtrer les mouvements pour ne garder que ceux avec au moins un montant différent de zéro
            $filteredMouvements = array_filter($mouvements, function($mouvement) {
                return $mouvement['montant'] != 0;
            });
            
            // Si des mouvements non nuls existent
            if (!empty($filteredMouvements)) {
                foreach ($devises as $devise) {
                    // Ajouter le nom de devise à la liste
                    $codesDevises[] = $devise->getNomDevise();
                }
                
                // Obtenir les codes de devise uniques à partir des mouvements filtrés
                $devisesExistants = array_column($filteredMouvements, 'devise');
                
                // Combiner les devises existantes avec les devises de référence
                $devisesPossibles = array_unique(array_merge($codesDevises, $devisesExistants));
                // Ajouter les montants manquants avec une valeur de 0.00
                $updatedMouvements = [];
                foreach ($devisesPossibles as $devise) {
                    $montant = '0.00';
                    foreach ($filteredMouvements as $mouvement) {
                        if ($mouvement['devise'] === $devise) {
                            $montant = $mouvement['montant'];
                            break;
                        }
                    }
                    $updatedMouvements[] = [
                        'montant' => $montant,
                        'devise' => $devise
                    ];
                }
                
                // Vérifier si au moins un montant est différent de zéro
                $hasNonZeroMontant = false;
                foreach ($updatedMouvements as $mouvement) {
                    if ($mouvement['montant'] != '0.00') {
                        $hasNonZeroMontant = true;
                        break;
                    }
                }
                
                // Ajouter seulement si des mouvements non nuls existent
                if ($hasNonZeroMontant) {
                    $comptes[] = [
                        'collaborateur' => $client->getUser(),
                        'soldes' => $updatedMouvements
                    ];
                }
            }
        }

        if ($request->get("region")){
            $region_find = $regionRep->find($request->get("region"));
        }else{
            $region_find = array();
        }
        $solde_general_type = $mouvementRep->findSoldeGeneralByType($type1, $type2, $lieu_vente, $devises);
        

        $html = $this->renderView('logescom/pdf/pdf_compte.html.twig', [
            'comptes' => $comptes,
            'devises'   => $devises,
            'regions' => $regions,
            'region_find' => $region_find,
            'type1' => $type1,
            'type2' => $type2,
            'solde_general_type' => $solde_general_type,          
            'logoPath' => $logoBase64,
            'lieu_vente' => $lieu_vente,
        ]);

        // Configurez Dompdf
        $options = new Options();
        $options->set('isHtml5ParserEnabled', true);
        $options->set('isPhpEnabled', true);
        $options->set("isPhpEnabled", true);
        $options->set("isHtml5ParserEnabled", true);

        // Instancier Dompdf
        $dompdf = new Dompdf($options);

        // Charger le contenu HTML
        $dompdf->loadHtml($html);

        // Définir la taille du papier (A4 par défaut)
        $dompdf->setPaper('A4', 'portrait');

        // Rendre le PDF (stream le PDF au navigateur)
        $dompdf->render();

        // Renvoyer une réponse avec le contenu du PDF
        return new Response($dompdf->output(), 200, [
            'Content-Type' => 'application/pdf',
            'Content-Disposition' => 'inline; filename=compte_'.date("d/m/Y à H:i").'".pdf"',
        ]);
    }

    #[Route('/detail/compte/{lieu_vente}', name: 'app_logescom_pdf_pdf_detail_compte')]
    public function detailComptePdf(Request $request, LieuxVentes $lieu_vente, UserRepository $userRep, DeviseRepository $deviseRep, MouvementCollaborateurRepository $mouvementRep, EntityManagerInterface $em)
    {       
        $logoPath = $this->getParameter('kernel.project_dir') . '/public/images/img-logos/'.$lieu_vente->getEntreprise()->getLogo();
        $logoBase64 = base64_encode(file_get_contents($logoPath));

        if ($request->get("date1")){
            $date1 = $request->get("date1");
            $date2 = $request->get("date2");

        }else{
            $date1 = date("Y-01-01");
            $date2 = date("Y-m-d");
        }
        $user = $userRep->find($request->get('user'));
        $devise = $deviseRep->findOneBy(['nomDevise' => $request->get('devise')]);
        $pageEncours = $request->get('pageEncours', 1);

        $mouvements = $mouvementRep->SoldeDetailByCollaborateurByDeviseByDate($user, $devise, $date1, $date2, $pageEncours, 2000);
        
        $solde_init = $mouvementRep->sumMontantBeforeStartDate($user, $devise, $date1);

        $html = $this->renderView('logescom/pdf/pdf_detail_compte.html.twig', [
            'mouvements' => $mouvements,
            'solde_init' => $solde_init,
            'user' => $user,
            'devise' => $devise,
            'date1' => $date1,            
            'date2' => $date2,           
            'logoPath' => $logoBase64,
            'lieu_vente' => $lieu_vente,
        ]);

        // Configurez Dompdf
        $options = new Options();
        $options->set('isHtml5ParserEnabled', true);
        $options->set('isPhpEnabled', true);
        $options->set("isPhpEnabled", true);
        $options->set("isHtml5ParserEnabled", true);

        // Instancier Dompdf
        $dompdf = new Dompdf($options);

        // Charger le contenu HTML
        $dompdf->loadHtml($html);

        // Définir la taille du papier (A4 par défaut)
        $dompdf->setPaper('A4', 'portrait');

        // Rendre le PDF (stream le PDF au navigateur)
        $dompdf->render();

        // Renvoyer une réponse avec le contenu du PDF
        return new Response($dompdf->output(), 200, [
            'Content-Type' => 'application/pdf',
            'Content-Disposition' => 'inline; filename=détail_compte_'.date("d/m/Y à H:i").'".pdf"',
        ]);
    }

    #[Route('/compte/inactif/{lieu_vente}', name: 'app_logescom_pdf_pdf_compte_inactif')]
    public function CompteInactifPdf(Request $request, LieuxVentes $lieu_vente, MouvementCollaborateurRepository $mouvementRep, DeviseRepository $deviseRep, ClientRepository $clientRep, UserRepository $userRep, RegionRepository $regionRep, PersonnelRepository $personnelRep, EntityManagerInterface $em)
    {     
        $logoPath = $this->getParameter('kernel.project_dir') . '/public/images/img-logos/'.$lieu_vente->getEntreprise()->getLogo();
        $logoBase64 = base64_encode(file_get_contents($logoPath));
        
        
        $limit = $request->get("limit", 30);
        
        $regions = $regionRep->findBy([], ['nom' => 'ASC']);
        $devises = $deviseRep->findBy(['id' => 1]);
        
        $type1 = $request->get('type1') ? $request->get('type1') : 'client';
        $type2 = $request->get('type2') ? $request->get('type2') : 'client-fournisseur';  

        $clients = $clientRep->findClientByTypeByLieu($type1, $type2, $lieu_vente);  
        
        $comptesInactifs = [];
        foreach ($clients as $client) {
            $soldes = $mouvementRep->findSoldeCompteCollaborateurInactif($client->getUser(), $limit, $devises);
            if ($soldes) {
                $comptesInactifs[] = [
                    'collaborateur' => $client->getUser(),
                    'soldes' => $mouvementRep->findSoldeCompteCollaborateurInactif($client->getUser(), $limit, $devises),
                    'derniereOp' => $mouvementRep->findOneBy(['collaborateur' => $client->getUser()], ['id' => 'DESC'])
                ];
            }
        }
        $html = $this->renderView('logescom/pdf/pdf_compte_inactif.html.twig', [
            'comptes' => $comptesInactifs,
            'devises'   => $devises,
            'regions' => $regions,
           
            'type1' => $type1,
            'type2' => $type2,         
            'logoPath' => $logoBase64,
            'lieu_vente' => $lieu_vente,
            'limit' => $limit,
        ]);

        // Configurez Dompdf
        $options = new Options();
        $options->set('isHtml5ParserEnabled', true);
        $options->set('isPhpEnabled', true);
        $options->set("isPhpEnabled", true);
        $options->set("isHtml5ParserEnabled", true);

        // Instancier Dompdf
        $dompdf = new Dompdf($options);

        // Charger le contenu HTML
        $dompdf->loadHtml($html);

        // Définir la taille du papier (A4 par défaut)
        $dompdf->setPaper('A4', 'portrait');

        // Rendre le PDF (stream le PDF au navigateur)
        $dompdf->render();

        // Renvoyer une réponse avec le contenu du PDF
        return new Response($dompdf->output(), 200, [
            'Content-Type' => 'application/pdf',
            'Content-Disposition' => 'inline; filename=compte_inactif_'.date("d/m/Y à H:i").'".pdf"',
        ]);
    }

    #[Route('/bilan/{lieu_vente}', name: 'app_logescom_pdf_pdf_bilan')]
    public function bilanPdf(LieuxVentes $lieu_vente, Request $request, SessionInterface $session, MouvementCaisseRepository $mouvementRep, UserRepository $userRep, DeviseRepository $deviseRep, CaisseRepository $caisseRep, FacturationRepository $facturationRep, VersementRepository $versementRepository, CommandeProductRepository $commandeProdRep, DepensesRepository $depenseRep, RecetteRepository $recetteRepository, ModePaiementRepository $modePaieRep, DecaissementRepository $decaissementRep, TransfertFondRepository $transfertFondRep, ClotureCaisseRepository $clotureRep, EchangeDeviseRepository $echangeDeviseRep, ChequeEspeceRepository $chequeEspeceRep, LivraisonRepository $livraisonRep)
    {        
        $logoPath = $this->getParameter('kernel.project_dir') . '/public/images/img-logos/'.$lieu_vente->getEntreprise()->getLogo();
        $logoBase64 = base64_encode(file_get_contents($logoPath));

        if ($request->get("date1")){
            $date1 = $request->get("date1");
            $date2 = $request->get("date2");

        }else{
            $date1 = date("Y-m-d");
            $date2 = date("Y-m-d");
        }

        if ($request->get("search_devise")){
            $search_devise = $deviseRep->find($request->get("search_devise"));
        }else{
            $search_devise = $deviseRep->find(1);
        }

        
        $caisses = $caisseRep->findCaisseByLieu($lieu_vente);
        $devises = $deviseRep->findAll();

        $solde_caisses = $mouvementRep->soldeCaisseParPeriodeParLieu($date1, $date2, $lieu_vente, $devises, $caisses);
        $caisses_lieu = [];
        foreach ($solde_caisses as $solde) {
            foreach ($caisses as $caisse) {
                if ($solde['id_caisse'] == $caisse->getId()) {
                    $caisses_lieu[$caisse->getDesignation()][] = $solde;
                } 
            }
        }
        $solde_caisses_devises = $mouvementRep->soldeCaisseParDeviseParLieu($date1, $date2, $lieu_vente, $devises);

        $solde_types = $mouvementRep->soldeCaisseParPeriodeParTypeParLieuParDevise($date1, $date2, $lieu_vente, $search_devise);

        $modesPaie = $modePaieRep->findAll();
        $facturations_data = $mouvementRep->mouvementCaisseParTypeParPeriodeParLieu('facturation', $date1, $date2, $lieu_vente, $devises, $modesPaie);

        $facturations = [];
        foreach ($facturations_data as $value) {
            foreach ($modesPaie as $modePaie) {
                if ($value['id_mode_paie'] == $modePaie->getId()) {
                    $facturations[$value['typeMouvement']][$value['typeMouvement']." ".$value['modePaiement']][] = $value;
                }
            }

        }


        $versements_data = $mouvementRep->mouvementCaisseParTypeParPeriodeParLieu('versement', $date1, $date2, $lieu_vente, $devises, $modesPaie);

        $versements = [];
        foreach ($versements_data as $value) {
            foreach ($modesPaie as $modePaie) {
                if ($value['id_mode_paie'] == $modePaie->getId()) {
                    $versements[$value['typeMouvement']][$value['typeMouvement']." ".$value['modePaiement']][] = $value;
                }
            }

        }

        $echanges_data = $mouvementRep->mouvementCaisseParTypeParPeriodeParLieu('echange', $date1, $date2, $lieu_vente, $devises, $modesPaie);
        // dd($echanges_data);

        $echanges = [];
        foreach ($echanges_data as $value) {
            foreach ($modesPaie as $modePaie) {
                if ($value['id_mode_paie'] == $modePaie->getId()) {
                    if ($modePaie->getId() == 1) {
                        $echanges[$value['typeMouvement']][$value['typeMouvement']." ".$value['modePaiement']][] = $value;
                    }
                }
            }

        }
        

        $transferts_data = $mouvementRep->mouvementCaisseParTypeParPeriodeParLieu('transfert', $date1, $date2, $lieu_vente, $devises, $modesPaie);

        $transferts = [];
        foreach ($transferts_data as $value) {
            foreach ($modesPaie as $modePaie) {
                if ($value['id_mode_paie'] == $modePaie->getId()) {
                    if ($value['montantTotal'] > 0) {
                        $transferts[$value['typeMouvement']][$value['typeMouvement']." ".$value['modePaiement']][] = $value;
                    }
                }
            }

        }

        $recettes_data = $mouvementRep->mouvementCaisseParTypeParPeriodeParLieu('recette', $date1, $date2, $lieu_vente, $devises, $modesPaie);

        $recettes = [];
        foreach ($recettes_data as $value) {
            foreach ($modesPaie as $modePaie) {
                if ($value['id_mode_paie'] == $modePaie->getId()) {
                    if ($value['montantTotal'] > 0) {
                        $recettes[$value['typeMouvement']][$value['typeMouvement']." ".$value['modePaiement']][] = $value;
                    }
                }
            }

        }

        $clotures_data = $mouvementRep->mouvementCaisseParTypeParPeriodeParLieu('cloture', $date1, $date2, $lieu_vente, $devises, $modesPaie);

        $clotures = [];
        foreach ($clotures_data as $value) {
            foreach ($modesPaie as $modePaie) {
                if ($value['id_mode_paie'] == $modePaie->getId()) {
                    if ($value['montantTotal'] > 0) {
                        $clotures[$value['typeMouvement']][$value['typeMouvement']." ".$value['modePaiement']][] = $value;
                    }
                }
            }

        }

        $clotures_manquant = [];
        foreach ($clotures_data as $value) {
            foreach ($modesPaie as $modePaie) {
                if ($value['id_mode_paie'] == $modePaie->getId()) {
                    if ($value['montantTotal'] < 0) {
                        $clotures_manquant[$value['typeMouvement']][$value['typeMouvement']." ".$value['modePaiement']][] = $value;
                    }
                }
            }

        }

        $decaissements_data = $mouvementRep->mouvementCaisseParTypeParPeriodeParLieu('decaissement', $date1, $date2, $lieu_vente, $devises, $modesPaie);

        $decaissements = [];
        foreach ($decaissements_data as $value) {
            foreach ($modesPaie as $modePaie) {
                if ($value['id_mode_paie'] == $modePaie->getId()) {
                    $decaissements[$value['typeMouvement']][$value['typeMouvement']." ".$value['modePaiement']][] = $value;
                }
            }

        }

        $depenses_data = $mouvementRep->mouvementCaisseParTypeParPeriodeParLieu('depenses', $date1, $date2, $lieu_vente, $devises, $modesPaie);

        $depenses = [];
        foreach ($depenses_data as $value) {
            foreach ($modesPaie as $modePaie) {
                if ($value['id_mode_paie'] == $modePaie->getId()) {
                    $depenses[$value['typeMouvement']][$value['typeMouvement']." ".$value['modePaiement']][] = $value;
                }
            }

        }

        $solde_caisses_type = $mouvementRep->soldeCaisseParDeviseParLieuParType('facturation', $date1, $date2, $lieu_vente, $devises);
        $chiffre_affaire = $facturationRep->chiffreAffaireParPeriodeParLieu($lieu_vente, $date1, $date2);
        $facturationPayees = $facturationRep->facturationsPayeesParPeriodeParLieu($lieu_vente, $date1, $date2);
        $totauxEncaissements = $mouvementRep->totauxEncaissementsParPeriodeParLieu($date1, $date2, $lieu_vente, $devises);
        $totalEntrees = $mouvementRep->totalEntreesParPeriodeParLieu($date1, $date2, $lieu_vente, $devises);
        $totauxDecaissements = $mouvementRep->totauxDecaissementsParPeriodeParLieu($date1, $date2, $lieu_vente, $devises);
        $nombreDeVentes = $facturationRep->nombreDeVentesParPeriodeParLieu($date1, $date2, $lieu_vente);
        $totalDepenses = $depenseRep->totalDepensesParPeriodeParLieu($lieu_vente, $date1, $date2);
        $totalDepensesParDevise = $depenseRep->totalDepensesParPeriodeParLieuParDevise($date1, $date2, $lieu_vente, $deviseRep->find(1));
        $beneficeVentes = $commandeProdRep->beneficeDesVentesParPeriodeParLieu($date1, $date2, $lieu_vente);


        $pageEncours = 1;
        $details_facturations = $facturationRep->findFacturationByLieuPaginated($lieu_vente, $date1, $date2, $pageEncours, 100000000);    

        $details_versements = $versementRepository->findVersementByLieuPaginated($lieu_vente, $date1, $date2, $pageEncours, 100000000);

        $details_recettes = $recetteRepository->findRecetteByLieuPaginated($lieu_vente, $date1, $date2, $pageEncours, 100000000);

        $details_decaissements  = $decaissementRep->findDecaissementByLieuPaginated($lieu_vente, $date1, $date2, $pageEncours, 100000000);

        $details_depenses = $depenseRep->findDepensesByLieuPaginated($lieu_vente, $date1, $date2, $pageEncours, 100000000);

        $details_transferts = $transfertFondRep->findTransfertByLieuPaginated($lieu_vente, $date1, $date2, $pageEncours, 100000000);

        $details_clotures = $clotureRep->listeDesCloturesParPeriodeParLieuPaginated($lieu_vente, $date1, $date2, $pageEncours, 100000000);
        $details_echanges = $echangeDeviseRep->findTransfertByLieuPaginated($lieu_vente, $date1, $date2, $pageEncours, 100000000);

        $details_cheques_especes = $chequeEspeceRep->findVersementByLieuPaginated($lieu_vente, $date1, $date2, $pageEncours, 100000000);

        $cumul_facturations = $mouvementRep->soldeCaisseParDeviseParLieuParType('facturation', $date1, $date2, $lieu_vente, $devises);
        $cumul_versements = $mouvementRep->soldeCaisseParDeviseParLieuParType('versement', $date1, $date2, $lieu_vente, $devises);
        $cumul_recettes = $mouvementRep->soldeCaisseParDeviseParLieuParType('recette', $date1, $date2, $lieu_vente, $devises);
        $cumul_decaissements = $mouvementRep->soldeCaisseParDeviseParLieuParType('decaissement', $date1, $date2, $lieu_vente, $devises);
        $cumul_depenses = $mouvementRep->soldeCaisseParDeviseParLieuParType('depenses', $date1, $date2, $lieu_vente, $devises);
        $cumul_transferts = $mouvementRep->soldeCaisseParDeviseParLieuParType('transfert', $date1, $date2, $lieu_vente, $devises);
        $cumul_clotures = $mouvementRep->soldeCaisseParDeviseParLieuParType('cloture', $date1, $date2, $lieu_vente, $devises);
        $cumul_echanges = $mouvementRep->soldeCaisseParDeviseParLieuParType('echange', $date1, $date2, $lieu_vente, $devises);
        $cumul_cheques_especes = $mouvementRep->soldeCaisseParDeviseParLieuParType('cheques-especes', $date1, $date2, $lieu_vente, $devises);


        $commandes_groupes = $commandeProdRep->listeDesProduitsVendusGroupeParPeriodeParLieu($date1, $date2, $lieu_vente);

        $livraisons_groupes = $livraisonRep->listeDesProduitsLivresGroupeParPeriodeParLieu($date1, $date2, $lieu_vente);

        $pageEncours = $request->get('pageEncours', 1);
        $commandes = $commandeProdRep->listeDesProduitsVendusParPeriodeParLieuPagine($date1, $date2, $lieu_vente, $pageEncours, 10000000000);
        $pageEncoursLiv = $request->get('pageEncoursLiv', 1);
        $livraisons = $livraisonRep->listeDesProduitsLivresParPeriodeParLieuPagine($date1, $date2, $lieu_vente, $pageEncoursLiv, 10000000000);


        
            

        $html = $this->renderView('logescom/pdf/bilan_pdf.html.twig', [
            'solde_caisses' => $caisses_lieu,
            'solde_types' => $solde_types,
            'search_devise' => $search_devise,
            'solde_caisses_devises' => $solde_caisses_devises,
            'devises' => $devises,
            'caisses' => $caisses,

            'chiffre_affaire' => $chiffre_affaire,
            'nombre_ventes' => $nombreDeVentes,
            'total_depenses' => $totalDepenses,
            'total_depenses_devise' => $totalDepensesParDevise,
            'benefice_ventes' => $beneficeVentes,

            'facturations' => $facturations,
            'solde_caisses_type' => $solde_caisses_type,
            'facturations_payees' => $facturationPayees,
            'versements' => $versements,
            'clotures' => $clotures,
            'clotures_manquant' => $clotures_manquant,
            'echanges' => $echanges,
            'transferts' => $transferts,
            'recettes' => $recettes,
            'decaissements' => $decaissements,
            'totauxEncaissements' => $totauxEncaissements,
            'totalEntrees' => $totalEntrees,
            'totauxDecaissements' => $totauxDecaissements,
            'depenses' => $depenses,

            'details_facturations' => $details_facturations,
            'details_versements' => $details_versements,
            'details_recettes' => $details_recettes,
            'details_decaissements' => $details_decaissements,
            'details_depenses' => $details_depenses,
            'details_transferts' => $details_transferts,
            'details_clotures' => $details_clotures,
            'details_echanges' => $details_echanges,
            'details_cheques_especes' => $details_cheques_especes,

            'cumul_facturations' => $cumul_facturations,
            'cumul_versements' => $cumul_versements,
            'cumul_recettes' => $cumul_recettes,
            'cumul_decaissements' => $cumul_decaissements,
            'cumul_depenses' => $cumul_depenses,
            'cumul_transferts' => $cumul_transferts,
            'cumul_clotures' => $cumul_clotures,
            'cumul_echanges' => $cumul_echanges,
            'cumul_cheques_especes' => $cumul_cheques_especes,

            'commandes_groupes' => $commandes_groupes,
            'commandes' => $commandes,
            'livraisons' => $livraisons,
            'livraisons_groupes' => $livraisons_groupes,

            'date1' => $date1,            
            'date2' => $date2,           
            'logoPath' => $logoBase64,
            'lieu_vente' => $lieu_vente,
        ]);

        // Configurez Dompdf
        $options = new Options();
        $options->set('isHtml5ParserEnabled', true);
        $options->set('isPhpEnabled', true);
        $options->set("isPhpEnabled", true);
        $options->set("isHtml5ParserEnabled", true);

        // Instancier Dompdf
        $dompdf = new Dompdf($options);

        // Charger le contenu HTML
        $dompdf->loadHtml($html);

        // Définir la taille du papier (A4 par défaut)
        $dompdf->setPaper('A4', 'portrait');

        // Rendre le PDF (stream le PDF au navigateur)
        $dompdf->render();

        // Renvoyer une réponse avec le contenu du PDF
        return new Response($dompdf->output(), 200, [
            'Content-Type' => 'application/pdf',
            'Content-Disposition' => 'inline; filename=bilan_'.date("d/m/Y à H:i").'".pdf"',
        ]);
    }
}

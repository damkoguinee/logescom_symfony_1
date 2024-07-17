<?php

namespace App\Controller\Admin;

use App\Repository\CommandeProductRepository;
use App\Repository\UserRepository;
use App\Repository\EntrepriseRepository;
use App\Repository\ProductsRepository;
use App\Repository\StockRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

#[Route('/admin/reajustement/donnees')]
class ReajustementDonnesController extends AbstractController
{
    #[Route('/maj/prix', name: 'app_admin_reajustement_donnees_maj_prix')]
    public function majPrixRevient(StockRepository $stockRep, CommandeProductRepository $commandeProductRep, EntityManagerInterface $em): Response
    {
        $stocks = $stockRep->findAll();
        foreach ($stocks as $value) {
            $commandes = $commandeProductRep->findBy(['product' => $value->getProducts()]);
            foreach ($commandes as $cmd) {
                $difference = $cmd->getPrixVente() - $cmd->getPrixRevient();
                if ($difference <= 0) {
                    $cmd->setPrixRevient($value->getPrixRevient());
                }
                if (empty($cmd->getPrixRevient())) {
                    $cmd->setPrixRevient($value->getPrixRevient());
                }
                // $cmd->setPrixRevient($value->getPrixRevient());

                $em->persist($cmd);
            }
        }
        $em->flush();
        return $this->redirectToRoute('app_logescom_home', [], Response::HTTP_SEE_OTHER);
    }

    #[Route('/maj/accent', name: 'app_admin_reajustement_donnees_maj_accent')]
    public function MajAccentCollaborateur(UserRepository $userRep, ProductsRepository $productsRep, EntityManagerInterface $em, EntrepriseRepository $entrepriseRep): Response
    {       
        $maj_client = $userRep->findAll();
        foreach ($maj_client as $client) {
            $client->setNom(str_replace('&eacute;', 'é', $client->getNom()));
            $client->setPrenom(str_replace('&eacute;', 'é', $client->getPrenom()));
            $em->persist($client);
        }

        $maj_product = $productsRep->findAll();
        foreach ($maj_product as $product) {
            $product->setDesignation(str_replace('&eacute;', 'é', $product->getDesignation()));
            $product->setDesignation(str_replace('&egrave;', 'è', $product->getDesignation()));
            $product->setDesignation(str_replace('&agrave;', 'à', $product->getDesignation()));
            $product->setDesignation(str_replace('&ecirc;', 'ê', $product->getDesignation()));
            $product->setDesignation(str_replace('&ccedil;', 'ç', $product->getDesignation()));
            $product->setDesignation(str_replace('&ocirc;', 'ô', $product->getDesignation()));
            $product->setDesignation(str_replace('&times;', 'x', $product->getDesignation()));
            $em->persist($product);
        }
        $em->flush();

        return $this->redirectToRoute('app_logescom_home', [], Response::HTTP_SEE_OTHER);

    }
}

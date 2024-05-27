<?php 

/** 
 * Class Controller Comptable
 * 
 * Liste des méthodes qui correspondent à une action demandée par le Comptable
 */
 class Comptable
 {
     public function c_accueil($params)
     {
         // Extraction des paramètres pour récupérer action à faire et autres (GET|POST)
         extract($params);
         // Affichage de la vue accueil Visiteur
         $myView = new View('c_accueil');
         $myView->render(array('estConnecte' => true));
     }
 
     public function validerFrais($params)
     {
         $idComptable = $_SESSION['id'];
         $pdo = GsbManager::getPdoGsb();
         extract($params);
 
         $lesFichesFrais = $pdo->getLesFichesFrais();
         $lesVisiteurs = $pdo->getLesVisiteurs();
 
         if (isset($visiteur) || isset($idVisiteur)) {
             $idVisiteur = $visiteur ?? $idVisiteur;
         }
             if ($action == 'selectionnerMois') {
                 $lesMois = $pdo->getLesMoisDisponibles($idVisiteur);
                 $lesCles = array_keys($lesMois);
                 $moisASelectionner = $lesCles[0];
 
                 $myView = new View('v_listeMois');
                 $myView->render(array(
                     'estConnecte' => true,
                     'lesMois' => $lesMois,
                     'idVisiteurSelectionne' => $idVisiteur
                 ));
                 return;  // Ajouter un return pour éviter de passer à la vue par défaut après l'action
             } elseif ($action == 'voirEtatFrais') {
                var_dump($idVisiteur); 
                 // Récupérer les informations et fiches du visiteur
                 $lesMois = $pdo->getLesMoisDisponibles($idVisiteur);
                 $leMois = $lstMois;
                 $lesFraisHorsForfait = $pdo->getLesFraisHorsForfait($idVisiteur, $leMois);
                 $lesFraisForfait = $pdo->getLesFraisForfait($idVisiteur, $leMois);
                 $lesInfosFicheFrais = $pdo->getLesInfosFicheFrais($idVisiteur, $leMois);
                 $numAnnee = substr($leMois, 0, 4);
                 $numMois = substr($leMois, 4, 2);
                 $libEtat = $lesInfosFicheFrais['libEtat'];
                 $montantValide = $lesInfosFicheFrais['montantValide'];
                 $nbJustificatifs = $lesInfosFicheFrais['nbJustificatifs'];
                 $dateModif = dateAnglaisVersFrancais($lesInfosFicheFrais['dateModif']);
 
                 // Appel de la vue v_etatFrais
                 $myView = new View('v_etatFrais');
                 $myView->render(array(
                     'estConnecte' => true,
                     'lesMois' => $lesMois,
                     'numMois' => $numMois,
                     'numAnnee' => $numAnnee,
                     'libEtat' => $libEtat,
                     'dateModif' => $dateModif,
                     'montantValide' => $montantValide,
                     'nbJustificatifs' => $nbJustificatifs,
                     'lesFraisForfait' => $lesFraisForfait,
                     'lesFraisHorsForfait' => $lesFraisHorsForfait
                 ));
                 return;  // Ajouter un return pour éviter de passer à la vue par défaut après l'action
             }
         
         
         // Initialisation de la vue sans sélection d'employé
         $myView = new View('c_validerFrais');
         $myView->render(array(
             'estConnecte' => true,
             'lesFichesFrais' => $lesFichesFrais,
             'lesVisiteurs' => $lesVisiteurs,
             'idVisiteurSelectionne' => $visiteur ?? null
         ));
     }
 }
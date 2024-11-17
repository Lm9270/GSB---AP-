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

         if (isset($visiteur))
         {
            $idVisiteur = $visiteur;
            $infosVisiteur = $pdo->getInfosVisiteur($idVisiteur); 
         } else {
            $idVisiteur = null; 
         }
 
         switch($action)
         {
             case 'selectionnerMois':
                 $lesMois = $pdo->getLesMoisDisponibles($idVisiteur);
                 // Afin de sélectionner par défaut le dernier mois dans la zone de liste
                 // on demande toutes les clés, et on prend la première,
                 // les mois étant triés décroissants
                 $lesCles = array_keys($lesMois);
                 $moisASelectionner = $lesCles[0];
                 //Affichage de la vue actualisée
                 $myView = new View('c_listeMois');
                 $myView->render(array('estConnecte' => true, 
                                 'lesMois' => $lesMois,
                                 'idVisiteur' => $idVisiteur,
                                 'infosVisiteur' => $infosVisiteur));
                 break;
            case 'valider':
                    $pdo->validerFicheFrais($idVisiteur, $mois); 
                    ajouterInformation("La fiche de frais du visiteur " . $infosVisiteur['nom'] . " " . $infosVisiteur['prenom'] . " du " . $mois . " a bien été validée"); 
                    $myView = new View('c_confirmationValidation');
                    $myView->render(array('estConnecte' => true, 
                    'mois' => $mois, 
                )); 
            break; 
             case 'voirEtatFrais' :
                 //Récupérer les informations et fiches du visiteur
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
                 //Appel de la vue v_etatFrais
                 $myView = new View('c_etatFrais');
                 $myView->render(array('estConnecte' => true, 
                             'lesMois' => $lesMois,
                             'numMois' => $numMois, 
                             'numAnnee' => $numAnnee,
                             'libEtat' => $libEtat,
                             'dateModif' => $dateModif,
                             'montantValide' => $montantValide,
                             'nbJustificatifs' => $nbJustificatifs,
                             'lesFraisForfait' => $lesFraisForfait,
                             'lesFraisHorsForfait' => $lesFraisHorsForfait,
                             'idVisiteur' => $idVisiteur,
                             'infosVisiteur' => $infosVisiteur,
                             'lstMois' => $lstMois,
                             ));

                 if ($action == 'modifierFicheFrais')
                 {
                    $pdo->majFraisForfait($idVisiteur, $mois, $lesFrais); 
                 }
                 break;
             case 'modifierFicheFrais' :
                // Effectuer les modifications du comptable : 
                $lesFraisForfait = $pdo->modifierElementForfait($idVisiteur, $mois, $lesFrais); 
                //Récupérer les informations et fiches du visiteur
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
                // Message de confirmation : 
                ajouterInformation('Les éléments forfaitisés de la fiche de frais ont bien étés mis a jours');
                //Appel de la vue v_etatFrais
                $myView = new View('c_etatFrais'); 
                $myView->render(array('estConnecte' => true,
                             'lesMois' => $lesMois,
                             'numMois' => $numMois, 
                             'numAnnee' => $numAnnee,
                             'libEtat' => $libEtat,
                             'dateModif' => $dateModif,
                             'montantValide' => $montantValide,
                             'nbJustificatifs' => $nbJustificatifs,
                             'lesFraisForfait' => $lesFraisForfait,
                             'lesFraisHorsForfait' => $lesFraisHorsForfait,
                             'idVisiteur' => $idVisiteur,
                             'infosVisiteur' => $infosVisiteur,
                             'lstMois' => $lstMois,
                             'message' => 'modifier',
                             
             ));

                break; 
                case 'refuserHF' : 

                if ((int)$refuse == 0)
                {
                    var_dump($idHF); 
                    $pdo->refuserHF($idHF); 
                    ajouterInformation('Ligne de frais hors forfait refusée');
                } else {
                    ajouterInformation('La ligne de frais sélectionnée a déjà été refusée');
                }

                //Récupérer les informations et fiches du visiteur
                 
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
                 //Appel de la vue v_etatFrais
                 $myView = new View('c_etatFrais');
                 $myView->render(array('estConnecte' => true, 
                             'lesMois' => $lesMois,
                             'numMois' => $numMois, 
                             'numAnnee' => $numAnnee,
                             'libEtat' => $libEtat,
                             'dateModif' => $dateModif,
                             'montantValide' => $montantValide,
                             'nbJustificatifs' => $nbJustificatifs,
                             'lesFraisForfait' => $lesFraisForfait,
                             'lesFraisHorsForfait' => $lesFraisHorsForfait,
                             'idVisiteur' => $idVisiteur,
                             'infosVisiteur' => $infosVisiteur,
                             'lstMois' => $lstMois,
                             'message' => 'refuserHF'));

                 if ($action == 'modifierFicheFrais')
                 {
                    $pdo->majFraisForfait($idVisiteur, $mois, $lesFrais); 
                 }
                break;
                case 'reporterHF':
                
                 if ((int)$refuse == 1) 
                 {
                    ajouterInformation("Il est impossible de reporter une ligne de frais ayant déjà été refusée"); 
                 } else {
                    $pdo->reporterHF($idHF, $idVisiteur, (int)$mois); 
                    ajouterInformation("La ligne de frais hors forfait a été reportée au mois prochain"); 
                 }

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
                 //Appel de la vue v_etatFrais
                 $myView = new View('c_etatFrais');
                 $myView->render(array('estConnecte' => true, 
                             'lesMois' => $lesMois,
                             'numMois' => $numMois, 
                             'numAnnee' => $numAnnee,
                             'libEtat' => $libEtat,
                             'dateModif' => $dateModif,
                             'montantValide' => $montantValide,
                             'nbJustificatifs' => $nbJustificatifs,
                             'lesFraisForfait' => $lesFraisForfait,
                             'lesFraisHorsForfait' => $lesFraisHorsForfait,
                             'idVisiteur' => $idVisiteur,
                             'infosVisiteur' => $infosVisiteur,
                             'lstMois' => $lstMois,
                             'message' => 'refuserHF'));


                if ($action == 'modifierFicheFrais')
                 {
                    $pdo->majFraisForfait($idVisiteur, $mois, $lesFrais); 
                 }

                break; 

             default:
                $myView = new View('c_selectionnerVisiteur');
                $myView->render(array('estConnecte' => true,
                                'idVisiteurSelectionne' => $idVisiteur,
                                'lesVisiteurs' => $lesVisiteurs,)); 
                break;
         }
     }

     public function consulterFrais($params)
     {

      $idComptable = $_SESSION['id'];
         $pdo = GsbManager::getPdoGsb();
         extract($params);
 
         $lesFichesFrais = $pdo->getLesFichesFrais();
         $lesVisiteurs = $pdo->getLesVisiteurs();

         if (isset($visiteur))
         {
            $idVisiteur = $visiteur;
            $infosVisiteur = $pdo->getInfosVisiteur($idVisiteur); 
         } else {
            $idVisiteur = null; 
         }

         switch ($action)
         {
            default:
                $myView = new View('c_selectionnerVisiteur');
                $myView->render(array('estConnecte' => true,
                                'idVisiteurSelectionne' => $idVisiteur,
                                'lesVisiteurs' => $lesVisiteurs,)); 
                break;
         }
     }
 }
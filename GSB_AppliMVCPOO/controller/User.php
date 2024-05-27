<?php 
/*
 * Class Controller User
 * 
 * Liste des méthodes en commuenes entre le comptable et le visiteur 
 */

 class User
 {

    public function connexion($params)
    {
        $myView = new View('v_connexion');
        $myView->render(array('estConnecte' => null));
    }

    public function validerConnexion($params)
    {   
        //extraction des paramètres pour récupérer action à faire et autres (GET|POST)
        extract($params);
        //Le visiteur existe-t-il ?
        $pdo = GsbManager::getPdoGsb();
        
        $user = $pdo->getInfosUser($login, $mdp, $metier);
        if (!is_array($user)) {
            //Vue erreur informations erronnées
            ajouterErreur('Login ou mot de passe incorrect');
            $myView = new View('v_erreurs');
            $myView->render(array('estConnecte' => null, 'retour' => "/"));
        } else {
            //Récupérer les données extraites de la BD
            $id = $user['id'];
            $nom = $user['nom'];
            $prenom = $user['prenom'];
            //Appel de la méthode connecter()
            if ($metier == 'visiteur')
            {
                connecter($id, $nom, $prenom, $metier); 
                //Affichage de la vue accueil Visiteur
                $myView = new View('v_accueil');
                $myView->render(array('estConnecte' => true));
            }
            else if ($metier == 'comptable')
            {
                connecter($id, $nom, $prenom, $metier); 
                //Affichage de la vue accueil Visiteur
                $myView = new View('c_accueil');
                $myView->render(array('estConnecte' => true));
            } 

        }
    }

    public function deconnexion($params)
    {
        //Appel de la vue
        $myView = new View('v_deconnexion');
        deconnecter();
        $myView->render(array('estConnecte' => true));
    }


 }
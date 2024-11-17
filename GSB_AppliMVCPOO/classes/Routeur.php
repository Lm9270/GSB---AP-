<?php

/**
 * Création des routes et activer le bon sous/contrôleur avec sa méthode
 */
class Routeur
{
    //La requête demandée
    private $request;
    //Tableau des routes
    private $routes =  [ 
                            "connexion"             => ["controller" => "User", "method" => "connexion"], 
                            "valider"               => ["controller" => "User", "method" => "validerConnexion"], 
                            "deconnexion"           => ["controller" => "User", "method" => "deconnexion"],
                            "accueil"               => ["controller" => "Visiteur", "method" => "v_accueil"],
                            "c_accueil"             => ['controller' => "Comptable", "method" => "c_accueil"],
                            "gererFrais"            => ["controller" => "Visiteur", "method" => "gererFrais"],
                            "etatFrais"             => ["controller" => "Visiteur", "method" => "etatFrais"],
                            "consulterFrais"        => ["controller" => "Comptable", "method" => "consulterFrais"],
                            "validerFrais"          => ["controller" => "Comptable", "method" => "validerFrais"],
                        ];

    public function __construct($request)
    {
        if($request == null)
        {
            $this->request = "connexion";
        }
        else
        {
            $this->request = $request;
        }
    }

    public function getRoute()
    {
        //Fonction explode pour extraire la valeur de l'url
        $elements=explode('/', $this->request);
        //Retourne uniquement la valeur de uc
        return $elements[0];
    }

    public function getParams()
    {
        $params=null;

        //On extrait GET params
        $elements=explode('/', $this->request);
        //unset($elements[0]);
        $params['uc'] = $elements[0];
        //Parcourir le tableau en comptant le nb élts dedans et associer 2 à 2 les paramètres (ex : id => 2 si on avait .../id/2)
        for($i = 1; $i<count($elements); $i++)
        {
            $params[$elements[$i]] = $elements[$i+1];
            $i++;
        }
        
        //On extrait POST params
        if($_POST)
        {
            foreach($_POST as $key => $val)
            {
                $params[$key] = $val;
            }
        }
        //Retourne le tableau des paramètres (GET ou POST)
        return $params;
    }

    public function renderController()
    {
        //Extraire la route et les paramètres
        $route = $this->getRoute();
        $params = $this->getParams();
        //Si la route existe bien dans le tableau attribut $routes
        if (key_exists($route, $this->routes))
        {
            //Récupérer le contrôleur et la méthode
            $controller = $this->routes[$route]['controller'];
            $method = $this->routes[$route]['method'];
            //création du contrôleur courant et appel de sa méthode
            $currentController = new $controller();
            $currentController->$method($params);
        }
        else
        {
            echo 'Erreur 404';
        }
    }

}
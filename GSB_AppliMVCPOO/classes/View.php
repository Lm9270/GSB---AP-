<?php

/**
 * Création de la vue et générer la vue ou rediriger vers une autre route
 */
class View
{
    private $template;

    public function __construct($template=null)
    {
        $this->template = $template;
    }

    public function render($params=array())
    {
        //Extraire le nom de la variable du paramètre
        extract($params);
        $template = $this->template;
        //Récupérer la vue sous forme de variable
        ob_start();

        //Si vue v_etatFrais demandée inclure avant v_listeMois
        if($template == 'v_etatFrais' )
        {
            include(VIEW.'v_listeMois.php');
        } elseif ($template == 'c_etatFrais')
        {
            include(VIEW.'c_listeMois.php'); 
        }

        // Template principal 
        include(VIEW.$template.'.php');


        //Si vue v_listeFraisForfait demandée inclure après v_listeFraisHorsForfait
        if($template == 'v_listeFraisForfait')
        {
            include(VIEW.'v_listeFraisHorsForfait.php');
        }
         //Valoriser $contentPage par le contenu de la/les vues générées
        $contentPage = ob_get_clean();

        //Afficher le gabarit approprié 
        if (isset($_SESSION['metier']) && $_SESSION['metier'] == 'visiteur')
        {
            include_once(VIEW.'_gabarit.php');
        }
        else 
        {
            include_once(VIEW.'c_gabarit.php'); 
        }
    
        

    }

    public function redirect($route)
    {
        header("Location: ".HOST.$route);
        exit;
    }
}

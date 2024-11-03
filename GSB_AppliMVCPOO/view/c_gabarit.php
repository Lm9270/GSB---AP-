<?php
/**
 * Gabarit des vues
 *
 * PHP Version 8
 *
 */
?>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta charset="UTF-8">
        <title>Intranet du Laboratoire Galaxy-Swiss Bourdin</title>
        <meta name="description" content="">
        <meta name="author" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="<?= ASSETS; ?>styles/bootstrap/bootstrap.css" rel="stylesheet">
        <link href="<?= ASSETS; ?>styles/style.css" rel="stylesheet">
    </head>
    <body>
            <?php 
            if (isset($message))
            {
                echo "<div class='message'>";

                switch ($message) {
                    case "modifier":
                        echo $_REQUEST['informations'][0];
                        break;
                    case 'refuserHF' : 
                        echo $_REQUEST['informations'][0];
                        break; 
                }

                echo '</div>';
            }
            ?> 
        </div>
        <div class="container">
            <?php
            $uc = filter_input(INPUT_GET, 'uc', FILTER_SANITIZE_SPECIAL_CHARS);
            if ($estConnecte) {
                ?>
            <div class="header">
                <div class="row vertical-align">
                    <div class="col-md-4">
                        <h1>
                            <img src="<?= ASSETS; ?>images/logo.jpg" class="img-responsive"
                                 alt="Laboratoire Galaxy-Swiss Bourdin"
                                 title="Laboratoire Galaxy-Swiss Bourdin">
                        </h1>
                    </div>
                    <div class="col-md-8">
                        <ul class="nav nav-pills pull-right" role="tablist">
                            <li <?php if (!$uc || $uc == 'c_accueil') { ?>class="active" <?php } ?>>
                                <a href="<?= HOST; ?>c_accueil">
                                    <span class="glyphicon glyphicon-home"></span>
                                    Accueil
                                </a>
                            </li>
                            <li <?php if ($uc == 'validerFrais') { ?>class="active"<?php } ?>>
                                <a href="<?= HOST; ?>validerFrais/action/">
                                    <span class="glyphicon glyphicon-pencil"></span>
                                    Valider une fiche de frais
                                </a>
                            </li>

                            <li
                            <?php if ($uc == 'deconnexion') { ?>class="active"<?php } ?>>
                                <a href="<?= HOST; ?>deconnexion">
                                    <span class="glyphicon glyphicon-log-out"></span>
                                    Déconnexion
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <?php
            } else {
                ?>
                <h1>
                    <img src="<?= ASSETS; ?>images/logo.jpg"
                         class="img-responsive center-block"
                         alt="Laboratoire Galaxy-Swiss Bourdin"
                         title="Laboratoire Galaxy-Swiss Bourdin">
                </h1>
                <?php
            }

            echo $contentPage; ?>
        </div>
    </body>
</html>
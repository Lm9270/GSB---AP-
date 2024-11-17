<?php
/**
 * Vue Liste des mois
 *
 * PHP Version 8
 *
 * @category  AP
 * @package   GSB
 * @link      Contexte « Laboratoire GSB »
 */
?>

<h2>Mes fiches de frais</h2>
<i class="lead tetx-muted"><?= (isset($_SESSION['metier']) && $_SESSION['metier'] == 'comptable') ? $infosVisiteur['nom'] . ' ' . $infosVisiteur['prenom'] : '' ?></i><div class="row">
    <div class="col-md-4">
        <h3>Sélectionner un mois :</h3>
    </div>
    <div class="col-md-4">
        <form action="<?= HOST; ?>validerFrais/action/voirEtatFrais" method="POST" role="form">
            <div class="form-group">
                <label for="lstMois" accesskey="n">Mois : </label>
                <select name="lstMois" class="form-control">
                    <?php
                        foreach ($lesMois as $unMois) 
                        {

                                $mois = $unMois['mois'];
                                $numA = $unMois['numAnnee'];
                                $numM = $unMois['numMois'];
                                
                                if ($mois == $leMois) {
                                    ?>
                                    <option selected value="<?php echo $mois ?>">
                                        <?php echo $numM . '/' . $numA ?> </option>
                                    <?php
                                } else 
                                {
                                    if(isset($numMois) && isset($numAnnee) && $numM == $numMois && $numA == $numAnnee)
                                    {
                                        ?>
                                        <option selected value="<?php echo $mois ?>">
                                            <?php echo $numMois . '/' . $numAnnee ?> </option>
                                        <?php
                                    }
                                    else
                                    {
                                        ?>
                                        <option value="<?php echo $mois ?>">
                                            <?php echo $numM . '/' . $numA ?> </option>
                                        <?php
                                    }
                            }
                        }
                    ?>
                </select>
            </div>
            <input type="hidden" name="visiteur" value="<?= $idVisiteur ?>">
            <div class="form-group">
                <button type="submit" id="ok" class="btn btn-success" role="button">Valider</button>
            </div>
        </form>
        <form action="<?= HOST; ?>validerFrais/action/" method="POST">
            <input type="hidden" name="visiteur" value="<?= $idVisiteur ?>">
            <div class="form-group">
                <button type="submit" id="retour" class="btn btn-danger" role="button">Annuler</button>
            </div>
        </form>
    </div>
</div>
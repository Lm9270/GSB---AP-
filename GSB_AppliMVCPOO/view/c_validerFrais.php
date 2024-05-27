<div class="row">
    <form action="<?=HOST; ?>validerFrais/action/selectionnerMois/idVisiteur/<?=$idVisiteurSelectionne;?>" method="POST">
        <label for="visiteur" class="form-label">Sélectionner un visiteur : </label>
        <select name="visiteur" class="form-control" aria-label="Default select example">
            <?php foreach($lesVisiteurs as $visiteur) :?> 
                <option value="<?= $visiteur['id'] ;?>" <?= isset($idVisiteurSelectionne) && $idVisiteurSelectionne == $visiteur['id'] ? 'selected' : '' ?>>
                    <?= $visiteur['nom'] . ' ' . $visiteur['prenom']; ?>
                </option>
            <?php endforeach; ?> 
        </select>

        <input id="ok" type="submit" value="Valider" class="btn btn-success" role="button">
    </form>
</div>
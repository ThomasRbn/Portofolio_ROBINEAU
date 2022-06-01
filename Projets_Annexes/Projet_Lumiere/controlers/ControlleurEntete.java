package Projet_Lumiere.controlers;

import Projet_Lumiere.models.ModelJeu;
import Projet_Lumiere.views.VueEntete;
import Projet_Lumiere.views.VueLumiere;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.scene.control.*;

import static Projet_Lumiere.Constantes.NBLUMIERES_ALEATOIRE;

/**
 * Controlleur associé à l'entete
 */
public class ControlleurEntete implements EventHandler<ActionEvent> {

    /**
     * Modèle du jeu
     */
    private final ModelJeu jeu;

    /**
     * Vue associée à l'entete
     */
    private final VueEntete vueEntete;

    /**
     * Vue associée aux lumières
     */
    private final VueLumiere vueLumiere;


    /**
     * Constructeur avec paramètres
     *
     * @param jeu Modèle du jeu
     * @param ve  Vue associée à l'entete
     * @param vl  Vue associées aux lumières
     */
    public ControlleurEntete(ModelJeu jeu, VueEntete ve, VueLumiere vl) {
        this.jeu = jeu;
        this.vueEntete = ve;
        this.vueLumiere = vl;
    }

    /**
     * Méthode de gestion de l'évènement + mise à jour des vues
     *
     * @param action Evenement lors du clic
     */
    @Override
    public void handle(ActionEvent action) {
        Button source = (Button) action.getSource();
        if (source.getId().equals("valider")) {
            NBLUMIERES_ALEATOIRE = Integer.parseInt(vueEntete.getChamp().getText());
            jeu.randomize();
        }
        vueEntete.update();
        vueLumiere.update();
    }
}

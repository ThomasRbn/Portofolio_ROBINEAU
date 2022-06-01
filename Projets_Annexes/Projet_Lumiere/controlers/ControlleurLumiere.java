package Projet_Lumiere.controlers;

import Projet_Lumiere.models.ModelJeu;
import Projet_Lumiere.views.VueEntete;
import Projet_Lumiere.views.VueLumiere;
import javafx.event.EventHandler;
import javafx.scene.input.*;

import static Projet_Lumiere.Constantes.*;

/**
 * Controlleur associé aux lumières
 */
public class ControlleurLumiere implements EventHandler<MouseEvent> {

    //#########
    //ATTRIBUTS
    //#########

    /**
     * Vue associée aux lumières
     */
    private final VueLumiere vueLumiere;

    /**
     * Modèle du jeu
     */
    private final ModelJeu modelJeu;

    /**
     * Vue associée à l'entete
     */
    private final VueEntete vueEntente;

    //############
    //CONSTRUCTEUR
    //############

    /**
     * Constructeur avec paramètres
     *
     * @param vl Vue associée aux lumières
     * @param mj Modèle du jeu
     * @param ve Vue aossicée à l'entete
     */
    public ControlleurLumiere(VueLumiere vl, ModelJeu mj, VueEntete ve) {
        this.vueLumiere = vl;
        this.vueEntente = ve;
        this.modelJeu = mj;
    }

    //########
    //MÉTHODES
    //########

    /**
     * Méthode de gestion de l'évènement + mise à jour de la vueLumiere
     *
     * @param mouseEvent Evenement lors du clic sur une lumière
     */
    @Override
    public void handle(MouseEvent mouseEvent) {
        //Si la partie est terminée ou qu'il ne reste plus de coups, on ne peut plus interagir avec les lumières
        if ((modelJeu.isFini() && modelJeu.getModeConfig() == 0) || NBCOUPS_RESTANTS == 0) {
            return;
        }

        //Calcul des coordonnées du clic
        int x = (int) (mouseEvent.getX() / TAILLE_CARRE);
        int y = (int) (mouseEvent.getY() / TAILLE_CARRE);

        if (modelJeu.getModeConfig() == 1) { //Si l'utilisateur a activé le mode configuration en cliquant sur le bouton
            this.modelJeu.inverserEtat(x, y);
        } else if (modelJeu.getModeConfig() == 0) { //Si le jeu se lance normalement
            this.modelJeu.inverserEtat(x, y);

            //Gestion des cas où la case est une bordure
            if (x + 1 <= TAILLE_JEU - 1)
                this.modelJeu.inverserEtat(x + 1, y);
            if (x - 1 >= 0)
                this.modelJeu.inverserEtat(x - 1, y);
            if (y + 1 <= TAILLE_JEU - 1)
                this.modelJeu.inverserEtat(x, y + 1);
            if (y - 1 >= 0)
                this.modelJeu.inverserEtat(x, y - 1);

            //Décrémentation du nombre de coups restants
            NBCOUPS_RESTANTS--;
        }

        //Mise à jour des vues
        vueLumiere.update();
        vueEntente.update();
    }
}

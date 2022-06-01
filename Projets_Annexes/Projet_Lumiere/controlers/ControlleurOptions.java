package Projet_Lumiere.controlers;

import Projet_Lumiere.models.ModelJeu;
import Projet_Lumiere.views.VueEntete;
import Projet_Lumiere.views.VueLumiere;
import Projet_Lumiere.views.VueOptions;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.scene.control.*;
import javafx.scene.layout.*;
import javafx.scene.paint.*;

import static Projet_Lumiere.Constantes.NBCOUPS_MAXIMUM;
import static Projet_Lumiere.Constantes.NBCOUPS_RESTANTS;

/**
 * Controlleur associé au boutons
 */
public class ControlleurOptions implements EventHandler<ActionEvent> {

    //#########
    //ATTRIBUTS
    //#########

    /**
     * Vue associée aux boutons
     */
    private final VueOptions vueOptions;

    /**
     * Vue associée aux lumières
     */
    private final VueLumiere vueLumiere;

    /**
     * Vue associée à l'entete
     */
    private final VueEntete vueEntete;

    /**
     * Modèle du jeu
     */
    private final ModelJeu jeu;

    //############
    //CONSTRUCTEUR
    //############

    /**
     * Constructeur avec paramètres
     *
     * @param vo vue associée aux boutons
     * @param mj modèle du jeu
     * @param vl vue associée aux lumières
     * @param ve vue associée à l'entete
     */
    public ControlleurOptions(VueOptions vo, ModelJeu mj, VueLumiere vl, VueEntete ve) {
        this.vueOptions = vo;
        this.jeu = mj;
        this.vueLumiere = vl;
        this.vueEntete = ve;
    }

    //########
    //MÉTHODES
    //########

    /**
     * Méthode de gestion de l'évènement + mise à jour de la vueOptions
     *
     * @param action Evenement lors du clic
     */
    @Override
    public void handle(ActionEvent action) {
        Button source = (Button) action.getSource();
        if (source.getId().equals("jouer")) {
            //On quitte le mode de configuration
            jeu.setModeConfig(0);

            //On met à jour les variables associées aux coups maximum / restants
            NBCOUPS_MAXIMUM = Integer.parseInt(vueOptions.getNbCoupsMax().getText());
            NBCOUPS_RESTANTS = NBCOUPS_MAXIMUM;

            //On met à jour la visibilité des éléments de l'entete
            vueEntete.getInfosCoups().setVisible(true);
            jeu.setModeAleatoire(false);

            //On désactive les boutons et on met leur couleur par défaut
            vueOptions.getJouer().setDisable(true);
            vueOptions.getJouer().setBackground(new Background(new BackgroundFill(Color.YELLOW, null, null)));

            vueOptions.getConfig().setDisable(true);
            vueOptions.getConfig().setBackground(new Background(new BackgroundFill(Color.YELLOW, null, null)));

            vueOptions.getAleatoire().setDisable(true);
            vueOptions.getAleatoire().setBackground(new Background(new BackgroundFill(Color.YELLOW, null, null)));

            vueOptions.getNbCoupsMax().setDisable(true);

        } else if (source.getId().equals("config")) {
            //On change la couleur du bouton et le mode de configuration
            if (jeu.getModeConfig() == -1 || jeu.getModeConfig() == 0) {
                vueOptions.getConfig().setBackground(new Background(new BackgroundFill(Color.ORANGE, null, null)));
                jeu.setModeConfig(1);
            } else if (jeu.getModeConfig() == 1) {
                vueOptions.getConfig().setBackground(new Background(new BackgroundFill(Color.YELLOW, null, null)));
                jeu.setModeConfig(-1);
            }

        } else if (source.getId().equals("aleatoire")) {
            //Mise à jour du mode aléatoire et affichage de l'entete associé en fonction
            if (!jeu.getModeAleatoire()) {
                vueOptions.getAleatoire().setBackground(new Background(new BackgroundFill(Color.ORANGE, null, null)));
                jeu.setModeAleatoire(true);
            } else {
                vueOptions.getAleatoire().setBackground(new Background(new BackgroundFill(Color.YELLOW, null, null)));
                jeu.setModeAleatoire(false);
            }

        } else if (source.getId().equals("quitter")) {
            jeu.setModeConfig(-1); // Le joueur ne peut plus interagir avec les lampes

            //On réactive les différents boutons et champs
            vueOptions.getJouer().setDisable(false);
            vueOptions.getConfig().setDisable(false);
            vueOptions.getAleatoire().setDisable(false);
            vueOptions.getNbCoupsMax().setDisable(false);
            vueEntete.getInfosCoups().setVisible(false);

            //On rallume toutes les lampes
            jeu.reset();

            //On met les variables avec un valeur temporaire (attente du lancement d'une partie)
            NBCOUPS_RESTANTS = -1;
            NBCOUPS_MAXIMUM = -1;
        }

        //Mise à jour de toutes les vues
        vueOptions.update();
        vueLumiere.update();
        vueEntete.update();
    }
}

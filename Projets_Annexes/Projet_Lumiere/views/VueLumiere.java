package Projet_Lumiere.views;

import Projet_Lumiere.models.ModelJeu;
import javafx.scene.layout.*;
import javafx.scene.paint.*;
import javafx.scene.shape.*;

import static Projet_Lumiere.Constantes.*;

/**
 * Vue qui correspond à l'ensemble des carrés représentant des lumières
 */
public class VueLumiere extends GridPane {

    //#########
    //ATTRIBUTS
    //#########

    /**
     * Modèle du jeu
     */
    public ModelJeu jeu;

    /**
     * Tableau à 2 dimensions de rectangles, avec l'état (allumée/éteinte) associé aux coordonnées du tableau de booleans du modèle
     */
    private Rectangle[][] listeRect;

    //############
    //CONSTRUCTEUR
    //############

    /**
     * Constructeur qui associe le modele de jeu passé en paramètre avec l'attribut
     * et initialise la grille avec ses carrés
     *
     * @param mj modèle du jeu
     */
    public VueLumiere(ModelJeu mj) {
        jeu = mj;
        initGrille();
        update();
    }

    //########
    //MÉTHODES
    //########

    /**
     * Méthode qui initalise la grille du gridpane, avec les lumières allumées par défaut
     */
    void initGrille() {
        //On force la taille des colonnes et lignes pour correspondre à la taille des carrés
        this.listeRect = new Rectangle[TAILLE_JEU][TAILLE_JEU];
        for (int i = 0; i < TAILLE_JEU; i++) {
            ColumnConstraints tailleColonne = new ColumnConstraints(TAILLE_CARRE);
            RowConstraints tailleLigne = new RowConstraints(TAILLE_CARRE);
            this.getColumnConstraints().add(tailleColonne);
            this.getRowConstraints().add(tailleLigne);
        }

        //Ajout des carrés au gridpane
        for (int i = 0; i < this.getColumnCount(); i++) {
            for (int j = 0; j < this.getRowCount(); j++) {
                Rectangle lumiereAllumee = new Rectangle(TAILLE_CARRE, TAILLE_CARRE, COULEUR_ALLUMEE);
                lumiereAllumee.setStroke(Color.BLACK);
                lumiereAllumee.setArcHeight(ARRONDI_CARRE);
                lumiereAllumee.setArcWidth(ARRONDI_CARRE);

                this.add(lumiereAllumee, i, j);
                listeRect[i][j] = lumiereAllumee;
            }
        }

        //Configuration du gridpane
        this.setHgap(1);
        this.setVgap(1);
        this.setBackground(new Background(new BackgroundFill(Color.BLACK, null, null)));
    }

    /**
     * Méthode qui actualise la vue et place les lumières (allumées ou éteintes)
     * en fonction du tableau de boolean du modèle en attribut
     */
    public void update() {
        for (int i = 0; i < TAILLE_JEU; i++) {
            for (int j = 0; j < TAILLE_JEU; j++) {

                if (jeu.getAllume(i, j)) { //Mise à jour de la couleur des cases
                    listeRect[i][j].setFill(COULEUR_ALLUMEE); //Si true (allumée), on met la couleur en vert clair
                } else {
                    listeRect[i][j].setFill(COULEUR_ETEINTE); //Si false (éteinte), on met la couleur en vert foncé
                }

                if (NBCOUPS_RESTANTS == 0 && !jeu.isFini()) { // Si le joueur a utilisé tous ses coups sans éteindre toutes les lumières
                    listeRect[i][j].setFill(Color.RED); //Les cases passent toutes en rouge
                }

                if (jeu.isFini() && jeu.getModeConfig() == 0) { // Affichage d'un V comme victoire
                    listeRect[0][0].setFill(Color.YELLOW);      // si le joueur éteint toutes les lumières
                    listeRect[0][1].setFill(Color.YELLOW);
                    listeRect[1][2].setFill(Color.YELLOW);
                    listeRect[1][3].setFill(Color.YELLOW);
                    listeRect[2][4].setFill(Color.YELLOW);
                    listeRect[3][3].setFill(Color.YELLOW);
                    listeRect[3][2].setFill(Color.YELLOW);
                    listeRect[4][1].setFill(Color.YELLOW);
                    listeRect[4][0].setFill(Color.YELLOW);
                }
            }
        }
    }
}

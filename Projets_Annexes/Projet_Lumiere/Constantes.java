package Projet_Lumiere;

import javafx.scene.paint.*;

/**
 * Classe contenant toutes les constantes du jeu (pour plus d'ergonomie)
 */
public class Constantes {

    /**
     * Constante qui définit le nombre de carrés en longueur et hauteur
     */
    public final static int TAILLE_JEU = 5;

    /**
     * Constante qui représente la couleur des lumières éteintes
     */
    public final static Color COULEUR_ETEINTE = Color.rgb(0, 112, 25);

    /**
     * Constante qui représente la couleur des lumières allumées
     */
    public final static Color COULEUR_ALLUMEE = Color.rgb(0, 255, 72);

    /**
     * Constante qui représente la taille des carrés de la vue
     */
    public final static int TAILLE_CARRE = 125;

    /**
     * Constante qui fixe la taille des arrondis des coins des carrés
     */
    public final static int ARRONDI_CARRE = 15;

    /**
     * Nombre de coups maximum définis par l'utilisateur
     */
    public static int NBCOUPS_MAXIMUM = -1;

    /**
     * Nombre de coups restants à l'utilisateur
     */
    public static int NBCOUPS_RESTANTS = -1;

    /**
     * Nombre de lumières qui seront allumées si l'utilisateur utilise le mode aléatoire
     */
    public static int NBLUMIERES_ALEATOIRE = 0;
}

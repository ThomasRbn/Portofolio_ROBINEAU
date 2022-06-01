package Projet_Lumiere.models;

import java.util.ArrayList;
import java.util.Random;

import static Projet_Lumiere.Constantes.NBLUMIERES_ALEATOIRE;
import static Projet_Lumiere.Constantes.TAILLE_JEU;

/**
 * Modèle du jeu qui contient toutes les informations globales du jeu
 */
public class ModelJeu {

    //#########
    //ATTRIBUTS
    //#########

    /**
     * Tableau de boolean qui indique si la lampe i,j est allumée ou non
     */
    private final boolean[][] allume;

    /**
     * Boolean qui représente si le jeu est en mode configuration ou non
     * Vaut 1 si le jeu est en mode configuration, le joueur peut interagir avec les lampes sans allumer celles adjacentes
     * Vaut 0 si le jeu n'est pas en mode configuration, le joueur allume les lampes adjacentes lorsqu'il clique sur l'une d'elles
     * Vaut -1 si le joueur ne peut pas interagir avec les lampes (rien ne se passe si il clique sur un lampe)
     */
    private int modeConfig;

    /**
     * Boolean qui gère l'affichage de l'entête si le jouer a appuyé sur le bouton aléatoire
     * true : l'entete associé s'affiche
     * false : l'entete associé est masqué
     */
    private boolean modeAleatoire;

    //############
    //CONSTRUCTEUR
    //############

    /**
     * Constructeur sans paramètre qui allume toutes les lumières et empeche le joueur d'interagir avec les lumières
     */
    public ModelJeu() {
        this.allume = new boolean[TAILLE_JEU][TAILLE_JEU];

        //On allume toute les lampes
        for (int i = 0; i < allume.length; i++) {
            for (int j = 0; j < allume[0].length; j++) {
                allume[j][i] = true;
            }
        }

        //Au lancement de l'application, on empeche le joueur d'interagir avec les lampes
        this.modeConfig = -1;
    }

    //################
    //GETTER / SETTERS
    //################

    /**
     * Getter qui retourne le tableau à 2 dimensions de boolean
     *
     * @return tableau de boolean
     */
    public boolean getAllume(int x, int y) {
        return allume[x][y];
    }

    /**
     * Méthode qui éteint / allume la lampe à la colonne x et ligne y
     *
     * @param x colonne de la lumière
     * @param y ligne de la lumière
     */
    public void inverserEtat(int x, int y) {
        this.allume[x][y] = !this.allume[x][y];
    }

    /**
     * Méthode qui retourne l'attribut config
     *
     * @return attribut config
     */
    public int getModeConfig() {
        return modeConfig;
    }

    /**
     * Méthode qui affecte le paramètre c à l'attribut config
     *
     * @param c etat de la configuration
     */
    public void setModeConfig(int c) {
        this.modeConfig = c;
    }

    /**
     * Getter du mode aléatoire
     *
     * @return mode aléatoire
     */
    public boolean getModeAleatoire() {
        return modeAleatoire;
    }

    /**
     * Setter du mode aleatoire
     *
     * @param modeAleatoire boolean associé au mode aléatoire
     */
    public void setModeAleatoire(boolean modeAleatoire) {
        this.modeAleatoire = modeAleatoire;
    }

    //########
    //MÉTHODES
    //########

    /**
     * Méthode qui vérifie que toutes les lumières sont éteintes
     * On recherche une lampe allumée, la méthode retourne false dès qu'elle en a trouvée une.
     * Si elle n'en trouve pas, elle retourne true
     *
     * @return vrai si toutes les lumières sont éteintes, faux sinon
     */
    public boolean isFini() {
        for (int i = 0; i < allume.length; i++) {
            for (int j = 0; j < allume[0].length; j++) {
                if (allume[j][i]) {
                    return false;
                }
            }
        }
        return true;
    }

    /**
     * Méthode qui génère une suite aléatoire de lumières allumées et éteintes
     */
    public void randomize() {
        //Si le nombre de cases aléatoires voulues est supérieure au nombre de cases
        //Afin d'éviter la levée d'exception
        if (NBLUMIERES_ALEATOIRE > TAILLE_JEU * TAILLE_JEU)
            return;

        Random ran = new Random();
        ArrayList<String> tablum = new ArrayList<>(); // String car impossible de vérifier qu'une arraylist contient un tableau d'entiers

        reset();

        int nbLum = 0;
        while (nbLum < NBLUMIERES_ALEATOIRE) {
            int x = ran.nextInt(TAILLE_JEU);
            int y = ran.nextInt(TAILLE_JEU);
            String coordonnes = "" + x + y;

            while (tablum.contains(coordonnes)) { //Si la lumière a déjà été éteinte
                x = ran.nextInt(TAILLE_JEU);
                y = ran.nextInt(TAILLE_JEU);
                coordonnes = "" + x + y;
            }

            inverserEtat(x, y);
            tablum.add(coordonnes);
            nbLum++;
        }
    }

    /**
     * Méthode qui rallume toutes les lumières
     */
    public void reset() {
        for (int i = 0; i < allume.length; i++) {
            for (int j = 0; j < allume[0].length; j++) {
                allume[j][i] = true;
            }
        }
    }
}

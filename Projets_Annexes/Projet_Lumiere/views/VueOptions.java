package Projet_Lumiere.views;

import Projet_Lumiere.controlers.ControlleurOptions;
import Projet_Lumiere.models.ModelJeu;
import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.control.*;
import javafx.scene.image.*;
import javafx.scene.layout.*;
import javafx.scene.paint.*;
import javafx.scene.text.*;

import java.io.FileInputStream;
import java.io.FileNotFoundException;

import static Projet_Lumiere.Constantes.TAILLE_JEU;

/**
 * Vue qui correspond à l'ensemble des boutons se trouvant en bas du gridpane
 */
public class VueOptions extends HBox {

    //#########
    //ATTRIBUTS
    //#########

    /**
     * Modèle du jeu
     */
    private final ModelJeu jeu;

    /**
     * Vue associée aux lumières
     */
    private final VueLumiere vueLumiere;

    /**
     * Vue associée à l'entete
     */
    private final VueEntete vueEntete;

    /**
     * Champ qui définit le nombre de coups maximum que le joueur peut effectuer
     */
    private TextField nbCoupsMax;

    /**
     * Bouton qui lance la partie quand on clique dessus
     */
    private Button jouer;

    /**
     * Bouton qui fait rentrer le jeu en mode configuration
     */
    private Button config;

    /**
     * Bouton qui génère un pattern alétoire de lumières allumées dans le jeu
     */
    private Button aleatoire;

    /**
     * Bouton qui réinitialise les boutons et la grille
     */
    private Button quitter;

    //############
    //CONSTRUCTEUR
    //############

    /**
     * Constructeur qui associe le modèle passé en paramètre avec l'attribut
     * et initialise le conteneur et ses boutons via initOptions
     *
     * @param mj modèle du jeu
     */
    public VueOptions(ModelJeu mj, VueLumiere vl, VueEntete ve) throws FileNotFoundException {
        jeu = mj;
        this.vueLumiere = vl;
        this.vueEntete = ve;
        initOptions();
        update();
    }

    //######
    //GETTER
    //######

    /**
     * Getter du modèle
     *
     * @return modèle
     */
    public ModelJeu getJeu() {
        return jeu;
    }

    /**
     * getter du bouton jouer
     *
     * @return bouton jouer
     */
    public Button getJouer() {
        return jouer;
    }

    /**
     * getter du textfield nbcoupsmax
     *
     * @return textfield nbcoupsmax
     */
    public TextField getNbCoupsMax() {
        return nbCoupsMax;
    }

    /**
     * getter du bouton config
     *
     * @return bouton config
     */
    public Button getConfig() {
        return config;
    }

    /**
     * getter du bouton aleatoire
     *
     * @return bouton aleatoire
     */
    public Button getAleatoire() {
        return aleatoire;
    }

    //#########
    //MÉTHODES
    //#########

    /**
     * Méthode d'initalisation des boutons au lancement du programme
     */
    public void initOptions() throws FileNotFoundException {
        FileInputStream input = new FileInputStream("src/main/java/Projet_Lumiere/images/jouer.png");
        Image logo = new Image(input);
        ControlleurOptions co = new ControlleurOptions(this, jeu, vueLumiere, vueEntete);

        //Création du bouton jouer
        jouer = new Button();
        jouer.setBackground(new Background(new BackgroundFill(Color.YELLOW, null, null)));
        jouer.setPrefSize((TAILLE_JEU * 100) / 5, (TAILLE_JEU * 100) / 5);
        jouer.setGraphic(new ImageView(logo));
        jouer.setId("jouer");
        jouer.setOnAction(co);


        //Création du champ nbCoupsMax
        nbCoupsMax = new TextField("30");
        nbCoupsMax.setFont(new Font("verdana", 30));
        nbCoupsMax.setPrefColumnCount(2);
        nbCoupsMax.setPrefHeight((TAILLE_JEU * 100) / 5);
        nbCoupsMax.setPrefWidth((TAILLE_JEU * 100) / 5);

        //Création du bouton config
        input = new FileInputStream("src/main/java/Projet_Lumiere/images/config.png");
        logo = new Image(input);
        config = new Button();
        config.setPrefSize((TAILLE_JEU * 100) / 5, (TAILLE_JEU * 100) / 5);
        config.setBackground(new Background(new BackgroundFill(Color.YELLOW, null, null)));
        config.setGraphic(new ImageView(logo));
        config.setId("config");
        config.setOnAction(co);

        //Création du bouton aléatoire
        input = new FileInputStream("src/main/java/Projet_Lumiere/images/aleatoire.png");
        logo = new Image(input);
        aleatoire = new Button();
        aleatoire.setPrefSize((TAILLE_JEU * 100) / 5, (TAILLE_JEU * 100) / 5);
        aleatoire.setBackground(new Background(new BackgroundFill(Color.YELLOW, null, null)));
        aleatoire.setGraphic(new ImageView(logo));
        aleatoire.setId("aleatoire");
        aleatoire.setOnAction(co);

        //Création du bouton quitter
        input = new FileInputStream("src/main/java/Projet_Lumiere/images/quitter.png");
        logo = new Image(input);
        quitter = new Button();
        quitter.setPrefSize((TAILLE_JEU * 100) / 5, (TAILLE_JEU * 100) / 5);
        quitter.setBackground(new Background(new BackgroundFill(Color.YELLOW, null, null)));
        quitter.setGraphic(new ImageView(logo));
        quitter.setId("quitter");
        quitter.setOnAction(co);

        //Ajout de tous les éléments et ajustement de la disposition
        this.getChildren().addAll(jouer, nbCoupsMax, config, aleatoire, quitter);
        this.setPadding(new Insets(10));
        this.setSpacing(5);
        this.setBackground(new Background(new BackgroundFill(Color.BLACK, null, null)));
        this.setAlignment(Pos.CENTER);
    }

    /**
     * Mise à jour de la désactivation des boutons
     */
    public void update() {
        jouer.setDisable(jouer.isDisable());
        nbCoupsMax.setDisable(nbCoupsMax.isDisable());
        config.setDisable(config.isDisable());
        aleatoire.setDisable(aleatoire.isDisable());
    }
}

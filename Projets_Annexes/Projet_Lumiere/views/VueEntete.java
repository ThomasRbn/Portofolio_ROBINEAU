package Projet_Lumiere.views;

import Projet_Lumiere.controlers.ControlleurEntete;
import Projet_Lumiere.models.ModelJeu;
import javafx.geometry.HPos;
import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.control.*;
import javafx.scene.layout.*;
import javafx.scene.paint.*;
import javafx.scene.text.*;

import static Projet_Lumiere.Constantes.NBCOUPS_RESTANTS;

/**
 * Vue associée à l'entete
 */
public class VueEntete extends GridPane {

    //#########
    //ATTRIBUTS
    //#########

    /**
     * Bouton valider
     */
    private Button valider;

    /**
     * Label qui affiche le nombre de coups restants
     */
    private Label infosCoups;

    /**
     * Label explicatif du TextField champ
     */
    private Label texteChamp;

    /**
     * Champ de saisie du nombre de lumières aléatoires
     */
    private TextField champ;

    /**
     * Modèle du jeu
     */
    private final ModelJeu jeu;

    /**
     * Vue associée aux lumières
     */
    private final VueLumiere vueLumiere;

    //############
    //CONSTRUCTEUR
    //############

    /**
     * Constructeur avec paramètres
     *
     * @param j  Modèle du jeu
     * @param vl Vue associée aux lumières
     */
    public VueEntete(ModelJeu j, VueLumiere vl) {
        vueLumiere = vl;
        jeu = j;
        initEntete();
        update();
    }

    //######
    //GETTER
    //######

    /**
     * Getter du label infosCoups
     *
     * @return label infosCoups
     */
    public Label getInfosCoups() {
        return infosCoups;
    }

    /**
     * Getter du Textfield champ
     *
     * @return textfield champ
     */
    public TextField getChamp() {
        return champ;
    }

    /**
     * Getter du modèle
     *
     * @return modèle du jeu
     */
    public ModelJeu getJeu() {
        return jeu;
    }

    //########
    //MÉTHODES
    //########

    /**
     * Méthode d'initialisation de l'entete avec ses éléments
     */
    public void initEntete() {
        //On force la taille des colonnes et des lignes
        this.getColumnConstraints().add(new ColumnConstraints(200));
        this.getColumnConstraints().add(new ColumnConstraints(50));
        this.getColumnConstraints().add(new ColumnConstraints(50));
        for (int i = 0; i < 2; i++) {
            RowConstraints tailleLigne = new RowConstraints(30);
            this.getRowConstraints().add(tailleLigne);
        }

        //Création du controlleur
        ControlleurEntete ce = new ControlleurEntete(jeu, this, vueLumiere);

        //Création du label qui va afficher le nombre de coups restants à l'utilisateur
        infosCoups = new Label("Coups restants : Pas de partie lancée");
        infosCoups.setTextFill(Color.WHITE);
        infosCoups.setVisible(false);
        infosCoups.setFont(Font.font("Verdana", 15));

        //Création du bouton qui sera utilisé lors de la génération aléatoire
        valider = new Button("OK");
        valider.setVisible(false);
        valider.setId("valider");
        valider.setOnAction(ce);

        //Label explicatif du TextField champ
        texteChamp = new Label("Nombre de lumières allumées");
        texteChamp.setVisible(false);
        texteChamp.setTextFill(Color.WHITE);

        //Champ utilisé pour la saisie du nombre de lumières allumées générées aléatoirement
        champ = new TextField("8");
        champ.setPrefColumnCount(2);
        champ.setPrefSize(50, 50);
        champ.setVisible(false);

        //Ajout des nodes
        this.addRow(0, infosCoups);
        this.addRow(1, texteChamp, champ, valider);
        GridPane.setColumnSpan(infosCoups, 3);
        GridPane.setHalignment(infosCoups, HPos.CENTER);

        //Configuration du gridpane
        this.setAlignment(Pos.CENTER);
        this.setPadding(new Insets(15, 0, 15, 0));
        this.setHgap(5);
        this.setBackground(new Background(new BackgroundFill(Color.BLACK, null, null)));
    }

    /**
     * Méthodes de mise à jour des éléments avec les évènements
     */
    public void update() {
        //Mise à jour de la visibilité des différents éléments
        this.champ.setVisible(jeu.getModeAleatoire());
        this.valider.setVisible(jeu.getModeAleatoire());
        this.texteChamp.setVisible(jeu.getModeAleatoire());

        //Mise à jour du nombre de coups restants
        infosCoups.setText("Coups restants : " + NBCOUPS_RESTANTS);
    }
}



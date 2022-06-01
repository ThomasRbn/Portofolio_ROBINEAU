package Projet_Lumiere;

import Projet_Lumiere.controlers.ControlleurLumiere;
import Projet_Lumiere.models.ModelJeu;
import Projet_Lumiere.views.VueEntete;
import Projet_Lumiere.views.VueLumiere;
import Projet_Lumiere.views.VueOptions;
import javafx.application.Application;
import javafx.scene.*;
import javafx.scene.input.*;
import javafx.scene.layout.*;
import javafx.stage.Stage;

import java.io.FileNotFoundException;

import static Projet_Lumiere.Constantes.TAILLE_CARRE;
import static Projet_Lumiere.Constantes.TAILLE_JEU;

public class EteinsLaLumiere extends Application {

    public static void main(String[] args) {
        launch(args);
    }

    @Override
    public void start(Stage primaryStage) throws FileNotFoundException {

        //Création du conteneur global
        BorderPane root = new BorderPane();

        //Création des différents éléments
        ModelJeu mj = new ModelJeu();
        VueLumiere vl = new VueLumiere(mj);
        VueEntete ve = new VueEntete(mj, vl);
        VueOptions vo = new VueOptions(mj, vl, ve);

        //Création du controlleur requis
        ControlleurLumiere cl = new ControlleurLumiere(vl, mj, ve);

        //Placement des éléments
        root.setTop(ve);
        root.setCenter(vl);
        root.setBottom(vo);

        //Création de la scène
        Scene scene = new Scene(root, TAILLE_JEU * TAILLE_CARRE + 5, TAILLE_JEU*TAILLE_CARRE + 215);
        vl.addEventHandler(MouseEvent.MOUSE_CLICKED, cl);

        primaryStage.setScene(scene);
        primaryStage.setTitle("Éteins la lumière !");
        primaryStage.show();
    }
}

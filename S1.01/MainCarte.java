public class MainCarte {
    public static void main(String[] args) {

        // Lecture du fichier puis création du tableau de lignes
        LectureFichier bibdate = new LectureFichier("timeline.txt");
        String[] tabtimeline = bibdate.lireFichier();

        
        for (int i = 0; i < tabtimeline.length; i++) {
            Carte cartejeu = new Carte(tabtimeline[i]);
            System.out.println(cartejeu);
            cartejeu.retournerFace();
            System.out.println(cartejeu);
        }
        
    }
}

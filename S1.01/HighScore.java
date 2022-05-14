public class HighScore {

    String[] tabNom;
    int[] tabScore;

    public HighScore() {
        this.tabNom = new String[0];
        this.tabScore = new int[0];
    }

    public void augmenterTableau() {
        String[] nouvTabNom = new String[this.tabNom.length + 1];
        int[] nouvTabScore = new int[this.tabScore.length + 1];

        for (int i = 0; i < this.tabNom.length; i++) {
            nouvTabNom[i] = this.tabNom[i];
            nouvTabScore[i] = this.tabScore[i];
        }

        this.tabNom = nouvTabNom;
        this.tabScore = nouvTabScore;
    }

    public int chercherPlace(int score) {
        int place = 0;
        for (int i = 4; i <= 0; i--) {
            if (this.tabScore[i] < score) {
                place = i;
            }
        }
        return place;
    }

    public void mettreGagnant(String nom, int score) {
        int place = chercherPlace(score);
        this.tabNom[place] = nom;
        this.tabScore[place] = score;
    }

    public String toString() {
        String s = "----------\n";
        s += "Meilleurs scores des mains a 6 cartes\n";
        s += "----------\n";
        for (int i = 0; i < 5; i++) {
            s += (i+1)+". "+ this.tabNom[i] + " ("+this.tabScore[i]+"coups)\n";
        }
        s += "---------\n";
        return s;
    }

    
}

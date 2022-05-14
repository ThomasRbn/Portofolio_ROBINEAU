public class ListeChainee implements Liste {

    private MaillonEntier[] tab;
    private int tete;

    public ListeChainee(int tailletab) {
        this.tab = new MaillonEntier[tailletab];
        this.tete = -1;
        for (int i = 0; i < this.tab.length; i++) {
            this.tab[i] = new MaillonEntier(null, -2);
        }
    }

    /**
     * permet de supprimer un element d'une liste
     *
     * @param p place de l'element supprimer
     */
    public void suplis(int p) {
        this.libererPlace(p);
    }

    /**
     * ajoute un element en tete de Liste
     *
     * @param s Element a ajouter en tete
     */
    public void adjtlis(String s) {
        int pl = this.retournerPlaceLibre();
        this.tab[pl].setVal(s);
        this.tab[pl].setSuc(this.tete);
        this.tete = pl;
    }

    /**
     * ajoute un element a un endroit quelconque dans la liste
     *
     * @param p place apres laquelle inserer
     * @param s element a inserer
     */
    public void adjlis(int p, String s) {
        int pl = this.retournerPlaceLibre();
        this.tab[pl].setVal(s);
        this.tab[pl].setSuc(this.tab[p].getSuc()); //La place libre prend le successeur de p
        this.tab[p].setSuc(pl); //Le successeur de p est mtn pl
    }

    /**
     * permet de savoir si on se trouve en fin de liste
     *
     * @param p place ou on se trouve
     * @return true si et seuelement si p est fin de liste
     */
    public boolean finliste(int p) {
        return p == -1;
    }

    /**
     * retourne la premiere place de la liste
     *
     * @return tete de liste
     */
    public int tete() {
        return this.tete;
    }

    /**
     * permet de connaitre la place suivante dans la liste
     *
     * @param p place en cours
     * @return place derriere p dans la liste
     */
    public int suc(int p) {
        return this.tab[p].getSuc();
    }

    /**
     * retourne la valeur associee a la place p
     *
     * @param p place de la liste
     * @return la valeur associee a p
     */
    public String val(int p) {
        return this.tab[p].getVal();
    }

    public int retournerPlaceLibre() {
        int pl = -2;
        int i = 0;
        boolean trouve = false;
        while (!trouve || i < this.tab.length) {
            if (this.tab[i].getSuc() == -2) {
                pl = i;
                trouve = true;
            }
            i++;
        }
        return pl;
    }   

    public void libererPlace(int p) {
        int i = 0;
        boolean trouve = false;
        int prede = this.tete;

        int sucp = this.tab[p].getSuc(); // On cherche le successeur de p et on le sauvegarde

        if (p != this.tete) {
            while (!trouve || i < this.tab.length) { // On cherche le prédécesseur de p
                if (this.tab[i].getSuc() == p) {
                    prede = i;
                    trouve = true;
                }
                i++;
            }
            this.tab[prede].setSuc(sucp); // On change le successeur du prédécesseur de p pour le successeur de p
        } else {
            this.tete = sucp;
        }
        // On rend la place p libre
        this.tab[p] = new MaillonEntier(null, -2);
    }
}

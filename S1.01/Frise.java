public class Frise {

    private Carte[] tabCartes;

    /**
     * Constructeur vide qui construit une frise vide
     */
    public Frise() {
        this.tabCartes = new Carte[0];
    }

    /**
     * Constructeur qui construit une frise a partir d'un tableau de carte passé en paramètre
     * @param tab Carte[], tableau de cartes avec lequel on veut construire la frise
     */
    public Frise(Carte[] tab) {
        Carte[] tmp = new Carte[tab.length];
        for (int i = 0; i < tab.length; i++) {
            tmp[i] = tab[i];
            tmp[i].retournerFace(); //Les dates des cartes d'un frise sont visibles
        }
        this.tabCartes = tmp;
    }

    
    /** 
     * Méthode qui ajoute une carte <c> à la frise, qui sera placée au bon endroit dans l'ordre chronologique
     * @param c Carte, carte que l'on veut ajouter à la frise
     */
    public void ajouterCarteTrie(Carte c) {
        Carte[] tmp = new Carte[this.tabCartes.length + 1]; //On crée un tableau de taille supérieure
        int i = 0;

        for (i = 0; i < this.tabCartes.length; i++){
            if (this.tabCartes[i].getDate() > c.getDate()) { //On cherche la position de la carte de la frise dont la date est postérieure à la carte <c>
                break; //On s'arrête lorqu'on l'a trouvé
            }
        }
        for (int j = 0; j < i; j++) { 
            tmp[j] = this.tabCartes[j]; //Connaissant l'indice i, on recopie les cartes dont on sait que leurs dates sont antérieurs à celle de <c>
        }
        tmp[i] = c; //On insère la carte <c> au bon endroit
        for (int j = i; j < this.tabCartes.length; j++) { //On recopie le reste des cartes
            tmp[j + 1] = this.tabCartes[j];
        }
        this.tabCartes = tmp; //On associe le nouveau tableau à la frise
    }

    
    /** 
     * Méthode qui vérifie que l'on peut ajouter la carte <c> à la place <p> en respectant l'ordre chronologique, retourne true si c'est possible, false sinon
     * @param c Carte, carte que l'on veut ajouter
     * @param p int, place à laquelle on veut ajouter la carte
     * @return boolean, true si on peut mettre la carte c à la place p, false sinon
     */
    public boolean verifierCarteApres(Carte c, int p) {
        boolean possible = false;
        if (p < this.tabCartes.length - 1 && p >= 0) { //Si p n'est pas une extrémite de la frise
            possible = this.tabCartes[p].getDate() < c.getDate() && this.tabCartes[p + 1].getDate() > c.getDate(); //On vérifie les dates des cartes entre lesquelles on veut ajouter <c>
        } else if (p == this.tabCartes.length - 1) { //Si p est la fin de la frise
            possible = this.tabCartes[p].getDate() < c.getDate();
        } else if (p == -1) { //Si p est le début de la frise
            possible = this.tabCartes[p + 1].getDate() > c.getDate();
        }
        return possible;
    }

    
    /** 
     * Méthode qui vérifie si l'on peut insérer la carte <c> après la place <p>
     * @param c Carte, carte que l'on veut ajouter
     * @param p int, place avant laquelle on veut ajouter la carte c
     * @return boolean, true si on peut insérer la carte <c> à la place <p>, false sinon
     */
    public boolean insererCarteApres(Carte c, int p) {
        Carte[] tmp = new Carte[this.tabCartes.length + 1];
        int i = 0;

        if (this.tabCartes[p].getDate() < c.getDate() && this.tabCartes[p + 1].getDate() > c.getDate()) { //On vérifie les dates avant et après <c>. Si elle est correcte, on continue
            while (i <= p) { //On recopie les valeurs jusqu'a p inclus
                tmp[i] = this.tabCartes[i];
                i++;
            }
            tmp[i] = c; //On insère c
            while (i < this.tabCartes.length) { //On recopie le reste
                tmp[i + 1] = this.tabCartes[i];
                i++;
            }
            this.tabCartes = tmp;
            return true;
        }
        return false;
    }

    
    /** 
     * Getter qui retourne le tableau de carte de la frise
     * @return Carte[] retourne le tableau de carte de la frise
     */
    public Carte[] getTabCartes() {
        return this.tabCartes;
    }

    
    /** 
     * Getter qui retourne le nombre de cartes présentes sur la frise
     * @return int
     */
    public int getNbCartes() {
        return this.tabCartes.length;
    }

}

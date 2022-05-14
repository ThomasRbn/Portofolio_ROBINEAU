import java.util.Random;

public class Paquet {

    private Carte[] cartes;

    /**
     * Constructeur vide qui construit un paquet vide
     */
    public Paquet() {
        this.cartes = new Carte[0];
    }

    /**
     * Constructeur qui construit un paquet à partir d'un tableau de cartes
     * @param tab Cartes, tableau de cartes avec lequel on veut créer un paquet
     */
    public Paquet(Carte[] tab) {
        this.cartes = tab;
    }

    
    /** 
     * Getter qui retourne le nombre de cartes du paquet
     * @return int, Nombre de cartes dans le paquet
     */
    public int getNbCartes() {
        return this.cartes.length;
    }

    
    /** 
     * Getter qui retourne la carte du paquet à la place <place> 
     * @param place int, position de la carte dans le paquet dont on veut obtenir les informations
     * @return Carte, Carte du paquet
     */
    public Carte getCarte(int place) {
        if (place < this.cartes.length) {
            return this.cartes[place];
        } else {
            return null;
        }
    }

    
    /** 
     * Méthode qui retire la carte du paquet appelant la méthode, à la place <place>
     * @param place int, place du paquet où l'on veut retirer la carte
     * @return Carte, Carte retirée
     */
    public Carte retirerCarte(int place) {
        Carte efface;
        if (place < this.cartes.length) {
            efface = this.cartes[place]; // On sauvegarde la carte qui va être retirée

            Carte[] newtab;
            newtab = new Carte[this.cartes.length - 1]; // On crée un tableau d'une taille inférieure

            for (int i = 0; i < this.cartes.length; i++) {
                if (i < place) {
                    newtab[i] = this.cartes[i];
                } else if (i > place) {
                    newtab[i - 1] = this.cartes[i];
                }
            }
            this.cartes = newtab; // On attribue le nouveau tableau

        } else {
            efface = null;
        }
        return efface; // On retourne la carte éffacée
    }

    
    /** 
     * Méthode d'affichage
     * @return String Affichage
     */
    public String toString() {
        String s = "";
        for (int i = 0; i < this.cartes.length; i++) {
            s += i + ". " + this.cartes[i].toString() + "\n";
        }
        return s;
    }

    
    /** 
     * Méthode qui ajoute la carte <nouvC> en début de paquet
     * @param nouvC Carte, Nouvelle carte que l'on veut ajouter au début du paquet
     */
    public void ajouterCarteDebut(Carte nouvC) {
        Carte[] tmp = new Carte[this.cartes.length + 1];
        tmp[0] = nouvC;

        for (int i = 0; i < this.cartes.length; i++) {
            tmp[i + 1] = this.cartes[i];
        }

        this.cartes = tmp;
    }

    
    /** 
     * Méthode qui ajouter la carte <nouv> en fin de paquet appelant la méthode
     * @param nouv Carte, Nouvelle carte que l'on veut ajouter au paquet
     */
    public void ajouterCarteFin(Carte nouv) {
        // Créer un nouveau tableau de taille supérieure
        Carte[] tab;
        tab = new Carte[this.cartes.length + 1];
        for (int i = 0; i < this.cartes.length; i++) {
            tab[i] = this.cartes[i];
        }
        tab[tab.length - 1] = nouv;
        this.cartes = tab;
    }

    
    /** 
     * Méthode qui ajoute une carte <c> à la place <place> du paquet appelant la méthode
     * @param c Carte, Nouvelle carte que l'on veut ajouter au paquet
     * @param place int, place où l'on veut insérer la nouvelle carte dans le paquet
     */
    public void ajouterCarte(Carte c, int place) {
        Carte[] tmp = new Carte[this.cartes.length + 1];

        for (int i = 0; i < this.cartes.length; i++) {
            if (i < place) {
                tmp[i] = this.cartes[i];
            } else if (i > place) {
                tmp[i + 1] = this.cartes[i];
            } else if (i == place) {
                tmp[i] = this.cartes[place];
                tmp[i + 1] = c;
            }
        }
        this.cartes = tmp;
    }

    
    /** 
     * Méthode qui pioche une carte au hasard dans le paquet appelant la méthode
     * @return Carte, carte piochée au hasard
     */
    public Carte piocherHasard() {
        int hasard;
        Carte tiree= null;
        Random random = new Random();
        if (this.cartes.length != 0) {
            hasard = random.nextInt(this.cartes.length - 1);
            tiree = this.cartes[hasard];
            retirerCarte(hasard);
        }
        return tiree;
    }
}

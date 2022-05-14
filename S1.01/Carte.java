public class Carte {

    /**
     * Attibuts
     */
    private String evenement; //Evènement de la carte
    private int datev; //Date de la carte
    private boolean solution; //true si la date est visible, false sinon
    

    /**
     * Constructeur qui construit une carte à partir d'une chaine de caractère avec un évènement et une date séparés par ":"
     * @param c String, Chaine de caractères contenant un évènement et une date
     */
    public Carte(String c) {
        int i = 0;
        String datecourante="";
        String evcourant="";

        char lettre = c.charAt(i);
        while (lettre != ':') { //On continue le parcours de <c> tant que l'on a pas atteint le séparateur
            evcourant += lettre;
            i++;
            lettre = c.charAt(i);
        }
        i++; // On passe le séparateur
        while (i < c.length()) { //On continue tant que l'on a pas atteint la fin de <c>
            lettre = c.charAt(i);
            datecourante += lettre;
            i++;
        }
        this.evenement = evcourant; //On attribue l'évènement de la carte
        this.datev = Integer.parseInt(datecourante); // On attibue la date de la carte
        this.solution = false; // Par défaut, la date de la carte est cachée
    }

    
    /** 
     * Méthode d'affichage
     * @return String Affichage
     */
    public String toString() {
        String s;
        if (!solution) {
            s = "???? => "+this.evenement; //Si la date est cachée
        } else {
            s = this.datev + " => "+ this.evenement; //Si la date est visible
        }
        return s;
    }

    /**
     * Méthode qui retourne la carte, cache la date si elle était visible, et inversement
     */
    public void retournerFace(){
        if (this.solution) {
            this.solution = false; //Si la date est visible, alors on la cache
        } else {
            this.solution = true; //Si la date est cachée, alors on la révèle
        }
    }

    
    /** 
     * Getter qui retourne l'évènement de la carte appelant la méthode
     * @return String, évènement de la carte
     */
    public String getEvenement(){
        return this.evenement;
    }

    
    /** 
     * Getter qui retourne la date de la carte appelant la méthode
     * @return int, année de l'évènement de la carte
     */
    public int getDate(){
        return this.datev;
    }

    
    /** 
     * Getter qui retourne la face de la carte
     * @return boolean vrai si la date est visible, faux sinon
     */
    public boolean getFace(){
        return this.solution;
    }
}
import java.util.Scanner;

public class Jeu {

	Paquet mainJ; // Main du joueur
	Paquet pioche; // Pioche
	Frise table; // Frise sur la table
	int score;

	/**
	 * Constructeur d'une partie de Timeline
	 * 
	 * @param tailleMain int, Nombre de cartes que le joueur possède au début de la
	 *                   partie
	 * @param timeline   Nom du fichier contenant les informations des cartes
	 */
	public Jeu(int tailleMain, String timeline) {
		LectureFichier fichier = new LectureFichier(timeline); // On lit le fichier
		String[] tempo = fichier.lireFichier(); // On stocke le tableau de String

		Carte[] tabDeCartes = new Carte[tempo.length]; // Tableau de cartes qui contient toutes la cartes du jeu
		Carte carteCourante;
		Carte[] frisedepart = new Carte[1]; // La frise de départ contient une carte

		this.mainJ = new Paquet();
		this.pioche = new Paquet();

		for (int i = 0; i < tempo.length; i++) {
			carteCourante = new Carte(tempo[i]);
			tabDeCartes[i] = carteCourante; // On ajoute les cartes créées au tableau
		}
		this.pioche = new Paquet(tabDeCartes); // On crée la pioche à partir de ce nouveau tableau

		for (int i = 0; i < tailleMain; i++) {
			this.mainJ.ajouterCarteDebut(pioche.piocherHasard()); // On constitue la main du joueur avec le nombre de
																	// cartes choisi
		}

		carteCourante = pioche.piocherHasard(); // On ajoute une carte à la frise de départ pour jouer
		frisedepart[0] = carteCourante;
		this.table = new Frise(frisedepart);

	}

	/**
	 * @return String Affichage de la partie
	 */
	public String toString() {
		String s = "";

		// Affichage Frise
		s = "----------\n";
		s += "Frise :\n";
		s += "----------\n";

		for (int i = 0; i < this.table.getTabCartes().length; i++) {
			s += i + ". " + this.table.getTabCartes()[i].toString() + "\n";
		}
		s += "----------\n";

		// Affichage main du joueur
		s += "Main du joueur\n";
		s += "----------\n";
		s += this.mainJ;
		s += "----------\n";
		s += "Il y a " + this.pioche.getNbCartes() + " cartes dans la pioche.";

		return s;
	}

	/**
	 * Méthode qui lance une partie et désigne le vainqueur
	 */
	public void jouer() {
		Scanner sc = new Scanner(System.in);
		int choix = 0;
		int place = 0;
		Carte cartejouee;

		while (this.mainJ.getNbCartes() != 0 && this.pioche.getNbCartes() != 0) {

			System.out.println(this); // On affiche le jeu au début du tour

			// Le joueur entre le numero de la carte qu'il veut jouer, si incorrect, il doit
			// rentrer une nouvelle valeur tant que celle ci n'est pas correcte
			System.out.print("Quelle carte voulez vous jouer ? : ");
			choix = sc.nextInt();
			while (!(choix >= 0 && choix <= this.mainJ.getNbCartes() - 1)) {
				System.out.print(
						"\nCarte inexistante, veuillez entrer un numero de ligne\nQuelle carte voulez vous jouer ? : ");
				choix = sc.nextInt();
			}
			cartejouee = this.mainJ.getCarte(choix);

			// Le joueur décide de la place où il veut mettre la carte
			System.out.print(
					"Apres quelle carte du jeu voulez vous placer votre carte ? (Entrer -1 si vous voulez la placer a la premiere place) : ");
			place = sc.nextInt();
			while (!(place >= -1 && place <= this.table.getNbCartes())) {
				System.out.print(
						"\nPlace inexistante, veuillez entrer le numero de la carte apres laquelle vous souhaitez placer la votre.\nApres quelle carte du jeu voulez vous placer votre carte ? (Entrer -1 si vous voulez la placer a la premiere place): \n");
				place = sc.nextInt();
			}

			// On vérifie si le joueur peut placer la carte à l'endroit indiqué
			// Si correct, on place la carte au bon endroit sur la frise
			// Sinon le joueur pioche une carte et son ancienne carte est perdue
			if (this.table.verifierCarteApres(cartejouee, place)) {
				cartejouee.retournerFace();
				table.ajouterCarteTrie(cartejouee);
				mainJ.retirerCarte(choix);
				this.score++;
				System.out.println("\nCORRECT !");
			} else {
				System.out.println("\nINCORRECT ! Vous piochez une carte");
				mainJ.retirerCarte(choix);
				if (this.pioche.getNbCartes() == 1) {
					pioche.retirerCarte(0);
				}
				this.mainJ.ajouterCarteDebut(pioche.piocherHasard());
				this.score++;
			}
		}

		// On détermine le vainqueur en fonction de la condition qui a quitté la boucle
		if (this.mainJ.getNbCartes() == 0) {
			System.out.println("VICTOIRE ! Vous avez place toutes vos cartes.");
			System.out.println("Votre score : " + this.score);
		} else {
			System.out.println("DEFAITE ! La pioche est vide.");
		}

	}

	public int getScore(){
		return this.score;
	}
}

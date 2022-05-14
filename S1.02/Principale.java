/**
 * Classe principale de la SAE 1.02
 * 
 * @author Etienne Andre
 * @since 2021-11-04
 *
 */

public class Principale {

	private static final String[] ELEMENTS_DE_DEBUT = { "A", "AA", "AAA ",
			" AAAA ", " AAAAA ", " AAAAAA ", " AAAAAAA ", " AAAAAAAA ", " AAAAAAAAA ",
			" AAAAAAAAAA " };

	private static final String[] ELEMENTS_DE_FIN = { " RABIN ", " RIVEST ",
			" SHAMIR ", " SIFAKIS ", " TORVALDS ", " TURING ", " ULLMAN ", " VALIANT ",
			" WIRTH ", "YAO" };

	/**
	 * Exemple d'utilisation de LectureFichier et remplissage d'une liste
	 * 
	 * @author Etienne Andre
	 */
	public static void remplir_liste(ListeTriee liste, String nom_fichier) {
		LectureFichier lf = new LectureFichier(nom_fichier);
		//
		String[] liste_noms = lf.lireFichier();
		for (String s : liste_noms) {
			liste.adjlisT(s);
		}
	}

	public static void main(String[] args) {

		System.out.println("-----\nAjout de 10 chaines\n-----");
		long debut = System.nanoTime();

		ListeChainee l = new ListeChainee(10);
		for (int i = 0; i < 10; i++) {
			l.adjtlis(ELEMENTS_DE_DEBUT[i]);
		}
		System.out.println("Liste chainee DEBUT : "+ (System.nanoTime() - debut)/1000+" microsecondes");

		debut = System.nanoTime();
		ListeContigue l2 = new ListeContigue(10);
		for (int i = 0; i < 10; i++){
			l2.adjtlis(ELEMENTS_DE_DEBUT[i]);
		}
		System.out.println("Liste contigue DEBUT: "+ (System.nanoTime() - debut)/1000+" microsecondes");

		debut = System.nanoTime();
		ListeChainee l3 = new ListeChainee(10);
		for (int i = 0; i < 10; i++) {
			l3.adjtlis(ELEMENTS_DE_FIN[i]);
		}
		System.out.println("Liste chainee FIN : "+ (System.nanoTime() - debut)/1000+" microsecondes");

		debut = System.nanoTime();
		ListeContigue l4 = new ListeContigue(10);
		for (int i = 0; i < 10; i++){
			l4.adjtlis(ELEMENTS_DE_FIN[i]);
		}
		System.out.println("Liste contigue FIN: "+ (System.nanoTime() - debut)/1000+" microsecondes");
		System.out.println("-----\nSuppression de 10 chaines\n-----");

		debut = System.nanoTime();
		for(int i = 0; i < 10; i++){
			l.suplis(i);
		}
		System.out.println("Liste chainee DEBUT : "+ (System.nanoTime() - debut)/1000+" microsecondes");

		debut = System.nanoTime();
		for(int i = 0; i < 10; i++){
			l2.suplis(i);
		}
		System.out.println("Liste contigue DEBUT: "+ (System.nanoTime() - debut)/1000+" microsecondes");

		debut = System.nanoTime();
		for(int i = 0; i < 10; i++){
			l3.suplis(i);
		}
		System.out.println("Liste chainee FIN : "+ (System.nanoTime() - debut)/1000+" microsecondes");

		debut = System.nanoTime();
		for(int i = 0; i < 10; i++){
			l4.suplis(i);
		}
		System.out.println("Liste contigue FIN: "+ (System.nanoTime() - debut)/1000+" microsecondes");
	}
}

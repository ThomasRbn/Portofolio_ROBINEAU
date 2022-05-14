import java.util.Scanner;

public class ProgJeu {
    public static void main(String[] args) {
        int rejouer = 1;

        Scanner sc = new Scanner(System.in);
        System.out.print("Combien de cartes doit avoir le joueur ? :");

        int nb = sc.nextInt();
        Jeu partie;
        while (rejouer == 1) {
            partie = new Jeu(nb, args[0]);
            partie.jouer();
            System.out.print("Voulez vous rejouer une partie ? (Entrer 1 pour rejouer, 0 pour arreter : ");
            rejouer = sc.nextInt();
            while(rejouer != 1 && rejouer != 0){
                System.out.print("Saisie incorrecte. Voulez vous rejouer une partie ? (Entrer 1 pour rejouer, 0 pour arreter) : ");
                rejouer = sc.nextInt();
            }

        }

    }
}

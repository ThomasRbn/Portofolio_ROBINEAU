public class ListeTriee {

	// Attribut de liste sous-jacente
	private Liste liste;

	public ListeTriee(Liste listevide) {
		// Affectation de la liste vide a l'attribut prive
		liste = listevide;
	}

	/**
	 * ajoute un element au bon endroit dans la liste triee
	 * 
	 * @param chaine element a inserer
	 */
	public void adjlisT(String chaine) {
		int p = this.liste.tete();
		if (this.liste.finliste(p)){
			this.liste.adjtlis(chaine);
		} else {
			int pprec = p;
			boolean trouve = false;
			while (!this.liste.finliste(p) && !trouve){
				String courant = this.liste.val(p);
				if (courant.compareTo(chaine) > 0){
					trouve = true;
				} else {
					pprec = p;
					p = this.liste.suc(p);
				}
			}

			if (p == pprec){
				this.liste.adjtlis(chaine);
			} else {
				this.liste.adjlis(pprec, chaine);
			}
		}
	}

	/**
	 * permet de supprimer un element d'une liste. Supprime le premier element dont
	 * la valeur est egale a "chaine" ; ne fait rien si "chaine" n'appartient pas a
	 * la liste
	 * 
	 * @param chaine l'element a supprimer
	 */
	public void suplisT(String chaine) {
		int p = this.liste.tete();
		boolean depasse = false;
		while (!this.liste.finliste(p) && !depasse){
			String courant = this.liste.val(p);
			if (courant.compareTo(chaine) == -1 || courant.compareTo(chaine) == 0){
				depasse = true;
				if (courant.equals(chaine)){
					this.liste.suplis(p);
				}

			} else {
				p = this.liste.suc(p);
			}
		}
	}

	/**
	 * Retourne vrai si au moins un element de la liste a une valeur egale a
	 * "chaine", et retourne faux sinon.
	 * 
	 * @param chaine l'element que l'on recherche
	 */
	public boolean memlisT(String chaine) {
		int p = this.liste.tete();
		boolean depasse = false;
		boolean trouve = false;

		while (!this.liste.finliste(p) && !depasse){
			String courant = this.liste.val(p);
			if (courant.compareTo(chaine) == -1 || courant.compareTo(chaine) == 0){
				depasse = true;
				if (courant.equals(chaine)){
					trouve = true;
				}
			} else {
				p = this.liste.suc(p);
			}
		}
		return trouve;
	}

	public String toString(){
		String s ="";
		int p = this.liste.tete();
		while (!this.liste.finliste(p)){
			s += this.liste.val(p);
			p = this.liste.suc(p);
		}
		return s;
	}
}

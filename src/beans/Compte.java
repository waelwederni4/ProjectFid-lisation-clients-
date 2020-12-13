package beans;

import java.io.Serializable;

public class Compte implements Serializable {
	private String idCompte;
	private String nom;
	private String prenom;
	private float points;
	
	public Compte() {
		
	}
	public String getIdCompte() {
		return idCompte;
	}
	public void setIdCompte(String idCompte) {
		this.idCompte = idCompte;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getPrenom() {
		return prenom;
	}
	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}
	public float getPoints() {
		return points;
	}
	public void setPoints(float points) {
		this.points = points;
	}
	public void incrementerPoints(int montant) {
		points+=getPointsMontant(montant);
	}
	private float getPointsMontant(int montant) {
		return montant/20;
	}
	
	@Override
	public String toString() {
		return "Compte [idCompte=" + idCompte + ", nom=" + nom + ", prenom=" + prenom + ", points=" + points + "]";
	} 
	
}

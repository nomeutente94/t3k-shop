package model;

public class Articolo {
	public Articolo(){}
	
	public void setId(String id){
		this.id = id;
	}
	
	public String getId(){
		return id;
	}
	
	public void setQuantita(int quantita){
		this.quantita = quantita;
	}
	
	
	public int getQuantita(){
		return quantita;
	}
	
	private String id;
	private int quantita;
}

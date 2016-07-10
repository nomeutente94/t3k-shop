package model;

import java.text.DecimalFormat;

public class Prodotto {
	public Prodotto(){}
	
	public void setId(String id){
			this.id = id;
	}

	public void setNome(String nome){
		this.nome = nome;
	}
	
	public void setModello(String modello){
		this.modello = modello;
	}
	
	public void setMarca(String marca){
		this.marca = marca;
	}
	
	public void setCategoria(String categoria){
		this.categoria = categoria;
	}
	public void setImmagine(String immagine){
		this.immagine = immagine;
	}
	
	public void setBreveDescrizione(String brevedescrizione){
		this.breveDescrizione = brevedescrizione;
	}
	public void setDescrizione(String descrizione){
		this.descrizione = descrizione;
	}
	
	public void setQuantita(int quantita){
		this.quantita = quantita;
	}
	public void setPrezzo(double prezzo){
		DecimalFormat df = new DecimalFormat("#.00");
		this.prezzo = df.format(prezzo);
	}
	
	public void setnVolteAcquistato(int nvolteacquistato){
		this.nvolteAcquistato = nvolteacquistato;
	}
	
	public String getId(){
		return id;
	}
	
	public String getNome(){
		return nome;
	}
	
	public String getModello(){
		return modello;
	}
	
	public String getMarca(){
		return marca;
	}
	
	public String getCategoria(){
		return categoria;
	}
	
	public String getImmagine(){
		return immagine;
	}
	
	public String getBreveDescrizione(){
		return breveDescrizione;
	}
	
	public String getDescrizione(){
		return descrizione;
	}
	
	public int getQuantita(){
		return quantita;
	}
	
	public String getPrezzo(){
		return prezzo;
	}
	
	public int getVolteAcquistato(){
		return nvolteAcquistato;
	}
	
	private String id,nome,modello,marca,categoria,immagine,breveDescrizione,descrizione, prezzo;
	private int quantita, nvolteAcquistato;
}

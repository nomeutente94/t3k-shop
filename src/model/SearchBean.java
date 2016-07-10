package model;
import java.sql.SQLException;
import java.util.ArrayList;


public class SearchBean {
	private String searchInput, type;
	private ArrayList<Prodotto> prodotti, prodottiFiltrati, prodottiFiltratiPerPagina;
	public static int MAX_RESULTS = 27;
	private int page = 1;
	
	public SearchBean(){}
	
	public void setSearchInput(String searchInput)throws SQLException{
		this.searchInput=searchInput;
		InsiemeProdotti catalogo = new InsiemeProdotti();
		prodottiFiltrati = new ArrayList<Prodotto>();
		prodottiFiltratiPerPagina = new ArrayList<Prodotto>();
		
		if(type.equalsIgnoreCase("nome")){
			catalogo.setSqlAppend("");
			prodotti = catalogo.getProdotti();
			
			for(int i=0; i<prodotti.size();i++){
				if(prodotti.get(i).getNome().toLowerCase().contains(searchInput.toLowerCase()))
					prodottiFiltrati.add(prodotti.get(i));
			}	
		}
		else{
			catalogo.setSqlAppend("where " + type + "='" + searchInput + "'");
			prodottiFiltrati = catalogo.getProdotti();
		}
		
		for(int i=MAX_RESULTS*(page-1); i<prodottiFiltrati.size() && i<MAX_RESULTS*(page-1)+(MAX_RESULTS); i++){
			prodottiFiltratiPerPagina.add(prodottiFiltrati.get(i));
		}
	}
	
	public void setType(String type){
		this.type=type;
	}
	
	public void setPage(String pageNumber){
		this.page=Integer.parseInt(pageNumber);;
	}
	
	public String getSearchInput(){
		return this.searchInput;
	}
	
	public int getPage(){
		return this.page;
	}
	
	public ArrayList<Prodotto> getResultSearch() {
		return prodottiFiltratiPerPagina;
	}
	
	public int getSizeOfResults(){
		return prodottiFiltrati.size();
	}

}

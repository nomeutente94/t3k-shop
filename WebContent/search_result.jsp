<%@ page language="java" contentType="text/html; charset=ISO-8859-15" pageEncoding="UTF-8" session="true"%>
<jsp:useBean id="results" class="model.SearchBean" scope="page" />
<jsp:useBean id="prodotti" class="model.InsiemeProdotti" scope="page" />
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Articolo" %>

<!doctype html>
<html lang="it">
	<head>
		<link rel="stylesheet" type="text/css" href="index.css">
		<meta charset="UTF-8">
		<title>t3k-shop</title>
	</head>
	<body>
		<div id="main">
			<header>
				<div id="logoblock">
						<img id="logo" src="images/logo.png" alt="logo">
				</div>	
				<div id="side">
						<form action="search" id="search-form">
							<input type="hidden" name="page" value="1">
							<input type="hidden" name="type" value="nome">
							<input type="submit" value="Vai" style=" float: right;">
							<input name="text-search" id="text-search" type="text" placeholder="Cerca">
						</form>
						<% 
							if((String)session.getAttribute("username")==null){
						%>
								<div id="welcome">Effettua l'<a href="login.jsp">accesso</a> o <a href="register.jsp">registrati</a></div>
						<%}else{%>
							<div id="welcome">Benvenuto, <a href=""><%=(String)session.getAttribute("username")%></a> 
								<span>-</span>
								<form style="float: right; display: inline-block; margin-top: -2px;" action="Logout" method="post">
									<input id=actionLogout type="submit" name="logout" value="Logout">
								</form>
							</div>
						<% }%>
						
						<div id="userpanel">
							<img style="width: 13px;" src="images/star06.gif">
							<% 	ArrayList<String> currentWishlist = (ArrayList<String>)session.getAttribute("wishlist"); 
								if(currentWishlist==null || currentWishlist.size()==0){%>
									<a id="wishlist" href="wishlist.jsp">Wishlist</a>
							<% 	}else{%>
									<a id="cart" href="cart.jsp">Wishlist (<%=currentWishlist.size()%>)</a>
							<% 	}%>
							<img style="width: 13px;" id="cartimg" src="images/carrello.gif">
							<%
								ArrayList<Articolo> currentCart = (ArrayList<Articolo>)session.getAttribute("carrello"); 
							%>
							<% 	if(currentCart==null || currentCart.size()==0){%>
									<a id="cart" href="cart.jsp">Carrello</a>
							<% 	}else{%>
									<% 	int count=0;
										for(int i=0; i<currentCart.size(); i++)	
											count += currentCart.get(i).getQuantita();
									%>
									<a id="cart" href="cart.jsp">Carrello (<%=count%>)</a>
							<% 	}%>
						</div>
						
					</div>
			</header>
			<div id="centralblock">
				<section id=categories>
					<h4>Componenti</h4>
					<ul style="list-style-type:none;">
						<li><a href="search?page=1&type=categoria&text-search=Case">Case</a></li>
						<li><a href="search?page=1&type=categoria&text-search=Cuffie-Mic">Cuffie/Mic</a></li>
						<li><a href="search?page=1&type=categoria&text-search=Dissipatori">Dissipatori</a></li>
						<li><a href="search?page=1&type=categoria&text-search=Gaming">Gaming</a></li>
						<li><a href="search?page=1&type=categoria&text-search=Lettori">Lettori BD/DVD/CD</a></li>
						<li><a href="search?page=1&type=categoria&text-search=Hard+Disk+Interni">Hard Disk Interni</a></li>
						<li><a href="search?page=1&type=categoria&text-search=Hard+Disk+Esterni">Hard Disk Esterni</a></li>
						<li><a href="search?page=1&type=categoria&text-search=Monitor">Monitor</a></li>
						<li><a href="search?page=1&type=categoria&text-search=Memorie">Memorie</a></li>
						<li><a href="search?page=1&type=categoria&text-search=Processori">Processori</a></li>
						<li><a href="search?page=1&type=categoria&text-search=Schede+Audio">Schede Audio</a></li>
						<li><a href="search?page=1&type=categoria&text-search=Schede+Madri">Schede Madri</a></li>
						<li><a href="search?page=1&type=categoria&text-search=Schede+Video">Schede Video</a></li>
						<li><a href="search?page=1&type=categoria&text-search=Software">Software</a></li>
						<li><a href="search?page=1&type=categoria&text-search=Speaker">Speaker</a></li>
						<li><a href="search?page=1&type=categoria&text-search=Stampanti">Stampanti</a></li>
						<li><a href="search?page=1&type=categoria&text-search=Tastiere+Mouse">Tastiere Mouse</a></li>
						<li><a href="search?page=1&type=categoria&text-search=Webcam">Webcam</a></li>
					</ul>
					<h4>Computer Assemblati</h4>
					<ul style="list-style-type:none;">
						<li><a href="search?page=1&type=categoria&text-search=Desktop">Desktop</a></li>
						<li><a href="search?page=1&type=categoria&text-search=Notebook">Notebook</a></li>
						<li><a href="search?page=1&type=categoria&text-search=Netbook">Netbook</a></li>
					</ul>
					<h4>I più venduti</h4>
					<ol>
						<jsp:setProperty name="prodotti" property="sqlAppend" value="order by nVolteAcquistato asc"/>
						<% for(int i=0; i<5;i++){ %>
							<li><a href="<%="product?id=" + (prodotti.getProdotti()).get(i).getId() %>"><%=(prodotti.getProdotti()).get(i).getNome()%></a></li>
						<%} %>
					</ol>
				</section>
				<div id="navigationbar">
					<nav>
						<ul>
							<li><a id=selected href="index.jsp">Home</a></li>
							<li><a href="">Promozioni</a></li>
							<li><a href="">Buoni Regalo</a></li>
							<li><a href="">Servizio Clienti</a></li>
							<li><a href="register.jsp">Registrati</a></li>
							<li><a href="login.jsp">Accedi</a></li>
						</ul>
					</nav>
				</div>
				<aside id="centrale">
					<section id="searchresults">
						<h4>Ricerca prodotti per "<%=(String)request.getAttribute("searchKey")%>"</h4>
						<% int currentpage = Integer.parseInt((String)request.getAttribute("page"));%>
						<% results.setPage((String)request.getAttribute("page")); %>
						<% results.setType((String)request.getAttribute("type")); %>
						<jsp:setProperty name="results" property="searchInput" value='<%=(String)request.getAttribute("searchKey")%>'/>
						
						<% for(int i=0; i<27 && i<results.getResultSearch().size(); i++){ %>
							<div id=product>
								<a href="<%="product?id=" + (prodotti.getProdotti()).get(i).getId() %>"><img id=productPic width="100" height="100" src="<%="images/products/" + (results.getResultSearch()).get(i).getImmagine()%>" alt="product"></a>
								<div id=productdescblock>
									<a href="<%="product?id=" + (prodotti.getProdotti()).get(i).getId() %>"><h5><%=(results.getResultSearch()).get(i).getNome()%></h5></a>
									<p id=desc><%=(results.getResultSearch()).get(i).getBreveDescrizione()%></p>
								</div>
								<div id=productprice>
									<p id=price>€ <%=(results.getResultSearch()).get(i).getPrezzo()%></p>
								</div>
								<div id=productactions>
									<% if ((results.getResultSearch()).get(i).getQuantita()<= 0){ %>
										<img id=available width="14" height="14" src="images/non_disponibile.png" alt="product">
										<p id=action>Non disponibile</p>
									<% } else {%>
										<a href=""><img id=addimg width="14" height="14" src="images/buy_now.png" alt="product"></a>
										<form action="addCart" method="post">
											<input type="hidden" name="id" value="<%=(prodotti.getProdotti()).get(i).getId()%>">
											<input type="hidden" name="quantita" value="1">
											<input id=action type="submit" name="aggiungi" value="Aggiungi">
										</form>
										<img id=available width="14" height="14" src="images/stock_disponibile.png" alt="product">
										<p id=actionavailable>Disponibile</p>
									<% } %>
								</div>
							</div>
						<%} %>
						<% int F_INDEX = 1+(27*(currentpage-1));%>
						<% int L_INDEX = results.getResultSearch().size() + 27*(currentpage-1);%>
						
						<%if(results.getSizeOfResults()>0){%>
							<span id=numberofresultproducts>Da <%=F_INDEX%> a <%=L_INDEX%> su <%=results.getSizeOfResults()%> prodotti</span>
							<div id=pagesblock>
								<div style="text-align: center;">
									<% if(currentpage==1){ %>
										<span id=pagescontrol>« Prec</span>
									<% }else{ %>
										<span id=pagescontrol><a href="<%="search?page=" + (currentpage-1) + "&type=" + (String)request.getAttribute("type") + "&text-search=" + results.getSearchInput()%>">« Prec</a></span>
									<% } %>
									
									<% 	int j; 
										for(j=1; currentpage>=j+4; j+=4){}
										int pagesToDisplay = 1;
										
										for(int k=j; results.getSizeOfResults()>27*k && pagesToDisplay<4; k++)
											pagesToDisplay++;
									%>
									<% if (j>1){ %>
										<p id=dotsnumberedpage><a href="<%="search?page=" + (j-1) + "&type=" + (String)request.getAttribute("type") + "&text-search=" + results.getSearchInput()%>">...</a></p>
									<% } %>
									<% int i; for(i=0; i<pagesToDisplay; i++){ %>
										<% if(j==currentpage){%>
											<p id=activenumberedpage><%=j%></p>
										<% } else {%>
											<p id=numberedpage><a href="<%="search?page=" + j + "&type=" + (String)request.getAttribute("type") + "&text-search=" + results.getSearchInput()%>"><%=j%></a></p>
										<% }%>
										<% j++; %>
									<%} %>
									<% if (results.getSizeOfResults()>27*(j-1)){ %>
										<p id=dotsnumberedpage><a href="<%="search?page=" + j + "&type=" + (String)request.getAttribute("type") + "&text-search=" + results.getSearchInput()%>">...</a></p>
									<% } %>
									
									<% if(27*currentpage >= results.getSizeOfResults()){ %>
										<span id=pagescontrol>Succ »</span>
									<% } else { %>
										<span id=pagescontrol><a href="<%="search?page=" + (currentpage+1) + "&type=" + (String)request.getAttribute("type") + "&text-search=" + results.getSearchInput()%>">Succ »</a></span>
									<% } %>
								</div>
							</div>
						<%} else {%>
						<h4>Nessun prodotto trovato.<br><br>Riprova la ricerca facendo attenzione a scrivere correttamente il nome del prodotto.</h4>
						<%} %>						
					</section>
				</aside>
			</div>
			<footer>
				<table id="footer">
					<th>Informazioni</th>
					<th>Pagamenti e Consegna</th>
					<th>Garanzie</th>
					<th>Area Clienti</th> 
					<tr>
						<td><a href="">Chi Siamo</a></td>
						<td><a href="">Modalità di Pagamento</a></td>
						<td><a href="">Diritto di Recesso</a></td>
						<td id="area"><a href="">I tuoi Dati</a></td>
					</tr>
					<tr>
						<td><a href="">Contatti</a></td>
						<td><a href="">Modalità di Consegna</a></td>
						<td><a href="">Condizioni di Garanzia</a></td>
						<td id="area"><a href="">Stato ordini</a></td>
					</tr>
					<tr>
						<td><a href="">Condizioni di Vendita</a></td>
						<td><a href="">Tempi di evasione</a></td>
						<td><a href="">Anomalie alla consegna</a></td>
						<td id="area"><a href="">Iscriviti alla Newsletter</a></td>
					</tr>
					<tr>
						<td><a href="">Come Acquistare</a></td>
						<td><a href="">Tempi di consegna</a></td>
						<td></td>
						<td></td>
					</tr>
				</table>
			</footer>
		</div>
	</body>
</html>
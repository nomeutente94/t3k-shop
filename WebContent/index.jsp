<%@ page language="java" contentType="text/html; charset=ISO-8859-15" pageEncoding="UTF-8" session="true"%>
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
					<% if((String)session.getAttribute("username")==null){%>
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
								<a id="cart" href="wishlist.jsp">Wishlist (<%=currentWishlist.size()%>)</a>
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
					<section id="internalsection">
						<h4>Prodotti in evidenza</h4>
						<jsp:setProperty name="prodotti" property="sqlAppend" value="where id='1' OR id='5'"/>
						<% for(int i=0; i<9 && i<(prodotti.getProdotti()).size();i++){ %>
							<div id=product>
								<a href="<%="product?id=" + (prodotti.getProdotti()).get(i).getId() %>"><img id=productPic width="100" height="100" src="<%="images/products/" + (prodotti.getProdotti()).get(i).getImmagine()%>" alt="product"></a>
								<div id=productdescblock>
									<a href="<%="product?id=" + (prodotti.getProdotti()).get(i).getId() %>"><h5 id=producttitle><%=(prodotti.getProdotti()).get(i).getNome()%></h5></a>
									<p id=desc><%=(prodotti.getProdotti()).get(i).getBreveDescrizione()%></p>
								</div>
								<div id=productprice>
									<p id=price>€ <%=(prodotti.getProdotti()).get(i).getPrezzo()%></p>
								</div>
								<div id=productactions>
									<% if ((prodotti.getProdotti()).get(i).getQuantita()<= 0){ %>
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
					</section>
					<section id="internalsection">
						<h4>Novità in catalogo</h4>
						<jsp:setProperty name="prodotti" property="sqlAppend" value="order by id desc"/>
						<% for(int i=0; i<9 && i<(prodotti.getProdotti()).size();i++){ %>
							<div id=product>
								<a href="<%="product?id=" + (prodotti.getProdotti()).get(i).getId() %>"><img id=productPic width="100" height="100" src="<%="images/products/" + (prodotti.getProdotti()).get(i).getImmagine()%>" alt="product"></a>
								<div id=productdescblock>
									<a href="<%="product?id=" + (prodotti.getProdotti()).get(i).getId() %>"><h5 id=producttitle><%=(prodotti.getProdotti()).get(i).getNome()%></h5></a>
									<p id=desc><%=(prodotti.getProdotti()).get(i).getBreveDescrizione()%></p>
								</div>
								<div id=productprice>
									<p id=price>€ <%=(prodotti.getProdotti()).get(i).getPrezzo()%></p>
								</div>
								<div id=productactions>
									<% if ((prodotti.getProdotti()).get(i).getQuantita()<= 0){ %>
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
					</section>
					<section id="squaresection1">
						<h4>I nostri punti vendita!</h4>
						<div id=address1>
							<img src="images/map-lu.JPG" width=140 height=90 alt="map1">
							<h4>Avellino</h4>
							<p id=address>Via Leonardo da Vinci 22<br>83040 Conza della C. (AV)<br>+39-3458281495</p>
						</div>
						<div id=address2>
							<img src="images/map-lu.JPG" width=140 height=90 alt="map1">
							<h4>Salerno</h4>
							<p id=address>Via Giovanni XXIII 44<br>84025 Eboli (SA)<br>+39-3669764463</p>
						</div>
						<div id=social>
						<h4>Seguici su</h4>
							<img width="15" height="15" style="float:left; margin-right: 5px;" src="images/twitter.png" alt="twitter">
							<p><a href="">twitter.com/t3k-shop-it</a><br><img width="15" height="15" style="float:left; margin-right: 5px;" src="images/fb.png" alt="facebook"><a href="">facebook.it/t3k-shop-it</a></p>
						</div>
					</section>
					<section id="squaresection2">
						<h4>I nostri brand</h4>
						<div id="brandblock">
							<div id=brand>
								<a href="search?page=1&type=marca&text-search=Asus"><img width="100" height="100" src="images/Asus.png" alt="brand"></a>
							</div>
							<div id=brand>
								<a href="search?page=1&type=marca&text-search=Corsair"><img width="100" height="100" src="images/corsair.png" alt="brand"></a>
							</div>
							<div id=brand>
								<a href="search?page=1&type=marca&text-search=MSI"><img width="100" height="100" src="images/msi.jpg" alt="brand"></a>
							</div>
							<div id=brand>
								<a href="search?page=1&type=marca&text-search=Asus"><img width="100" height="100" src="images/Asus.png" alt="brand"></a>
							</div>
							<div id=brand>
								<a href="search?page=1&type=marca&text-search=Asus"><img width="100" height="100" src="images/Asus.png" alt="brand"></a>
							</div>
							<div id=brand>
								<a href="search?page=1&type=marca&text-search=Asus"><img width="100" height="100" src="images/Asus.png" alt="brand"></a>
							</div>
							<div id=brand>
								<a href="search?page=1&type=marca&text-search=Asus"><img width="100" height="100" src="images/Asus.png" alt="brand"></a>
							</div>
							<div id=brand>
								<a href="search?page=1&type=marca&text-search=Asus"><img width="100" height="100" src="images/Asus.png" alt="brand"></a>
							</div>
							<div id=brand>
								<a href="search?page=1&type=marcatext-search=Asus"><img width="100" height="100" src="images/Asus.png" alt="brand"></a>
							</div>
						</div>
					</section>
				</aside>
			</div>
			<footer>
				<table align="center" id="footer">
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
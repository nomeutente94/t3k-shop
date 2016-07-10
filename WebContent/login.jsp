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
			<div id="mincentralblock">
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
							<li><a href="index.jsp">Home</a></li>
							<li><a href="">Promozioni</a></li>
							<li><a href="">Buoni Regalo</a></li>
							<li><a href="">Servizio Clienti</a></li>
							<li><a href="register.jsp">Registrati</a></li>
							<li><a id=selected href="login.jsp">Accedi</a></li>
						</ul>
					</nav>
				</div>
				<aside id="centrale">
					<div id="loginTable">
						<h3>Login</h3>
						<p id="registerdesc">
							Se vuoi utilizzare tutte le funzionalitá del nostro sito web effettua il Login. Verrai riconosciuto dal sito come nostro cliente e di conseguenza potrai consultare la situazione dei tuoi ordini, acquistare i prodotti ed altro ancora. 
							<br><br>Se non sei ancora nostro cliente complila il breve modulo di registrazione ed ottieni l'accesso la nostro sito.
						</p>
						<form action="LogServlet" method="post" name="LoginForm" onsubmit="return LoginForm()">
							<div id=loginattributes>
								<div id="registerattribute">Username</div>
								<div id="registerattribute">Password</div>
							</div>
							<div id=loginfields>
								<input id=registerfield type="text" name="username">
								<input id=registerfield type="text" name="password">
							</div>
							<h4 style="margin-left: 40%"><input id="loginbutton" type="submit" name="Invia" value="Invia"></h4>
						</form>
						<div id=loginblock>
							<h4>Dimenticato la password?</h4>
							<div id="logindescblock">
								<img style="margin-bottom: 5px; margin-left: 5px; margin-top: 8px; padding: 5px; padding-right: 10px; float: left;" width="50", height="50" src="images/pass.png">
								<p>In caso di smarrimento delle password è possibile resettare completamente la password relativa al tuo account utilizzando il modulo apposito.</p>
								<a href="password_forgotten.jsp"><input type="button" value="Recupero Password"></input></a>
							</div>
						</div>
						<div id=loginblock>
							<h4>Nuova Iscrizione</h4>
							<div id="logindescblock">
								<img style="margin-bottom: 5px; margin-left: 5px; margin-top: 8px; padding: 5px; padding-right: 10px; float: left;" width="50", height="50" src="images/register.png">
								<p>Con la registrazione sarai in grado di ordinare in maniera veloce, semplice e sicura. Nel tuo pannello di controllo avrai la possibilità di controllare lo stato degli ordini e altro ancora.</p>
								<a href="register.jsp"><input type="button" value="Nuova Registrazione"></input></a>
							</div>
						</div>
					</div>
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
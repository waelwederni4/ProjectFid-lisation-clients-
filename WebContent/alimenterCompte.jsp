<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Fidélisation Clients </title>

<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="css/style.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<%@ page import="java.util.*, beans.Compte" %>
<%!
Hashtable<String, Compte> listCompte = null;
String visibCard="hidden";
Compte compte=null;
%>
<body class="form-fc">
<div class="page-content">
<div class="form-fc-content">
<div class="form-left">
<img src="images/screen.jpg" alt="form">
</div>
<div class="form-right">
<h2>Alimenter Un Compte</h2>
<form action="alimenterCompte.jsp" method="post">
    <div class="wrap">
      <div class="search">
        <input type="text" class="searchTerm" name="idCompte" placeholder="Entrer l'idCompte du client">
        <button type="submit" class="searchButton">
        <i class="fa fa-search"></i>
        </button>
      </div>
    </div>
    </form>
     <%
 		String idCompte=request.getParameter("idCompte");
     	if(idCompte!=null && !idCompte.isEmpty()){
     		listCompte=(Hashtable<String, Compte>)application.getAttribute("listComptes");
         if (listCompte != null) {
				if(listCompte.containsKey(idCompte)){
					compte=listCompte.get(idCompte);
					visibCard="visible";
				}else{
					compte=null;%>
					<div class="alert">
  <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
  <strong>Compte N'existe pas!</strong> Il n'y a pas de client avec ça idCompte : <%= idCompte %>
</div>
					<%
					visibCard="hidden";
				}
			}
         }
			%>
    <div  id="card" class="card" style="visibility: <%= visibCard%>;">
    <span class="closebtncard" onclick="this.parentElement.style.display='none';">&times;</span> 
  <h2><b>Compte : <% if(compte!=null)out.println(compte.getIdCompte()); %></b></h2> 
  <div class="container">
    <form class="form-detail" action="alimenterCompte.jsp" onsubmit="document.getElementById('card').style.display = 'none';" method="post">
<div class="form-row">
<label class="form-row-inner">
<input type="number" name=montant class="input-text" required>
<span class="label">Montant</span>
<span class="border"></span>
</label>
</div>
<div class="form-row-last">
<input type="submit" name="register" class="register" value="Submit">
</div>
</form>
 <%
 		String montant=request.getParameter("montant");
     	if(montant!=null && !montant.isEmpty() && compte!=null){
     		listCompte=(Hashtable<String, Compte>)application.getAttribute("listComptes");
         if (listCompte != null) {
        	 listCompte.remove(compte.getIdCompte());
        	 compte.incrementerPoints(Integer.parseInt(montant));
        	 listCompte.put(compte.getIdCompte(), compte);
        	 application.setAttribute("listComptes", listCompte);
        	 %>
				<div class="alert success">
<span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
<strong>opération terminée avec succès!</strong></div>
				<%
			}
         }
			%>
  </div>
</div>
<div id="submitYourConcernBack">
      <a href="ajoutcompte.jsp"><img alt="right" src="images/left-arrow.png"></a>
    </div>
</div>
</div>
</div>
</body>
</html>
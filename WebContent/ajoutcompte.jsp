<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:useBean id="compte" class="beans.Compte"/>
<jsp:setProperty name= "compte" property="idCompte"/>
<jsp:setProperty name= "compte" property="nom"/>
<jsp:setProperty name= "compte" property="prenom"/>
<jsp:setProperty name= "compte" property="points"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Fidélisation Clients </title>

<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="css/style.css" />
</head>
<%@ page import="java.util.*, beans.Compte" %>
<%@ page session="true" %>

<%!
Hashtable<String, Compte> listCompte = null;
Hashtable<String, Compte> listAffiche = null;
%>
<body class="form-fc">
<div class="page-content">
<div class="form-fc-content">
<div class="form-left">
<img src="images/screen.jpg" alt="form">
</div>
<div class="form-right">
<div class="tab">
<div class="tab-inner">
<button class="tablinks" onclick="openTab(event, 'ajouter-compte')" id="defaultOpen">Ajouter Compte</button>
</div>
<div class="tab-inner">
<button class="tablinks" onclick="openTab(event, 'consulter-list')">Consulter List</button>
</div>
</div>
<form class="form-detail" action="ajoutcompte.jsp" method="post">
<div class="tabcontent" id="ajouter-compte">
<div class="form-row">
<label class="form-row-inner">
<input type="text" name=idCompte class="input-text" required>
<span class="label">ID Compte</span>
<span class="border"></span>
</label>
</div>
<div class="form-row">
<label class="form-row-inner">
<input type="text" name=nom class="input-text" required>
<span class="label">Nom</span>
<span class="border"></span>
</label>
</div>
<div class="form-row">
<label class="form-row-inner">
<input type="text" name=prenom class="input-text" required>
<span class="label">Prenom</span>
<span class="border"></span>
</label>
</div>
<div class="form-row">
<label class="form-row-inner">
<input type="number" name=points class="input-text" required>
<span class="label">Points</span>
<span class="border"></span>
</label>
</div>
<div class="form-row-last">
<input type="submit" name="register" class="register" value="Ajouter">
</div>
</div>
<div id="submitYourConcern">
     <a href="alimenterCompte.jsp"><img alt="right" src="images/right-arrow.png"></a>
     
    </div>
</form>
<% 
if (compte != null && compte.getIdCompte()!=null ) {
	Object o = application.getAttribute("listComptes");
	if (o == null) {
		listCompte = new Hashtable<String, Compte>();
	} else {
		listCompte = (Hashtable<String, Compte>) o;
	}
	listCompte.put(compte.getIdCompte(),compte);
	application.setAttribute("listComptes", listCompte);
} 
	
  %>
<div class="tabcontent" id="consulter-list">
<table class="responstable">
  <tr>
    <th data-th="Driver details"><span>#Idcompte</span></th>
    <th>Nom</th>
    <th>Prenom</th>
    <th>Points</th>
  </tr>
  <%
  listAffiche=(Hashtable<String, Compte>)application.getAttribute("listComptes");
  if (listAffiche != null) {
		List<String> list = new ArrayList<String>(listAffiche.keySet());
		for (String key : list) {
			Compte cmp = listAffiche.get(key);
			out.println("<TR>");
			out.println("<TD>" + cmp.getIdCompte()+ "</TD>");
			out.println("<TD>" + cmp.getNom() + "</TD>");
			out.println("<TD>" + cmp.getPrenom()+ "</TD>");
			if(cmp.getPoints() == Math.floor(cmp.getPoints())){
				out.println("<TD>" + (int)cmp.getPoints() + "</TD>");
			}else{
			out.println("<TD>" + cmp.getPoints() + "</TD>");
			}
			out.println("</TR>");
		}
	}
  %>
</table>
<div id="submitYourConcern">
           
       <a href="alimenterCompte.jsp"><img alt="right" src="images/right-arrow.png"></a>
    </div>
</div>
</div>
</div>
</div>
<script type="text/javascript">
		function openTab(evt, cityName,liste) {
		    var i, tabcontent, tablinks;
		    tabcontent = document.getElementsByClassName("tabcontent");
		    for (i = 0; i < tabcontent.length; i++) {
		        tabcontent[i].style.display = "none";
		    }
		    tablinks = document.getElementsByClassName("tablinks");
		    for (i = 0; i < tablinks.length; i++) {
		        tablinks[i].className = tablinks[i].className.replace(" active", "");
		    }
		    document.getElementById(cityName).style.display = "block";
		    evt.currentTarget.className += " active";
			}
		// Get the element with id="defaultOpen" and click on it
		document.getElementById("defaultOpen").click();
		
	</script>

<script async src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'UA-23581568-13');
</script>
</body>
</html>
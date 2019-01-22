<%@ include file="init.jsp" %>
<%@page import="java.util.HashMap"%>

<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="https://cdn.datatables.net/1.10.7/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.7/css/jquery.dataTables.css">
<liferay-ddm:template-renderer className="<%= Entry.class.getName() %>"
	contextObjects="<%= new HashMap<String, Object>() %>"
	displayStyle="<%= displayStyle %>"
	displayStyleGroupId="<%= displayStyleGroupId %>" entries="${entry}">

 <style> 
 .message-container{ 
  padding:10px; 
	margin:2px; 
  display:none;  
  background: rgba(128, 128, 128, 0.33); 
  border: 1px solid #0A0A0C; 
  } 
 </style> 



<table id="userTable" class="display" cellspacing="0" width="100%">
        <thead>
            <tr>
                <th>Name</th>
                
                <th>Message</th>
                 </tr>
        </thead>
        <tfoot>
            <tr>
                <th>Name</th>
                
                <th>message</th>
            </tr>
        </tfoot>
        <tbody>
         <tr>
                <td>${entry.get(0).getName()}</td>
                <td>${entry.get(0).getMessage()}</td> 
                 
                  </tr>
        
        </tbody>
    </table>


</liferay-ddm:template-renderer>
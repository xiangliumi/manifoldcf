<%@ include file="../../adminDefaults.jsp" %>

<%

/* $Id$ */

/**
* Licensed to the Apache Software Foundation (ASF) under one or more
* contributor license agreements. See the NOTICE file distributed with
* this work for additional information regarding copyright ownership.
* The ASF licenses this file to You under the Apache License, Version 2.0
* (the "License"); you may not use this file except in compliance with
* the License. You may obtain a copy of the License at
* 
* http://www.apache.org/licenses/LICENSE-2.0
* 
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
%>

<%
	// This file is included in the head section by every place that the configuration information for the Solr connector
	// needs to be edited.  When it is called, the parameter Map object is placed in the thread context
	// under the name "Parameters".

	// The coder can presume that this jsp is executed within a head section.  The purpose would be to provide javascript
	// functions needed by the editconfig.jsp for this connector.
	//
	// The method checkConfigOnSave() is called prior to the form being submitted for save.  It should return false if the
	// form should not be submitted.


	ConfigParams parameters = (ConfigParams)threadContext.get("Parameters");
	ArrayList tabsArray = (ArrayList)threadContext.get("Tabs");

	if (parameters == null)
		out.println("No parameters!!!");
	if (tabsArray == null)
		out.println("No tabs array!");

	tabsArray.add("Server");
        tabsArray.add("Arguments");


%>

<script type="text/javascript">
<!--
	function checkConfig()
	{
		if (editconnection.servername.value == "")
		{
			alert("Please supply a valid Solr server name");
			editconnection.servername.focus();
			return false;
		}
		if (editconnection.serverport.value != "" && !isInteger(editconnection.serverport.value))
		{
			alert("Solr server port must be a valid integer");
			editconnection.serverport.focus();
			return false;
		}
		if (editconnection.webappname.value != "" && editconnection.webappname.value.indexOf("/") != -1)
		{
			alert("Web application name cannot have '/' characters");
			editconnection.webappname.focus();
			return false;
		}
		if (editconnection.updatepath.value != "" && editconnection.updatepath.value.substring(0,1) != "/")
		{
			alert("Update path must start with a  '/' character");
			editconnection.updatepath.focus();
			return false;
		}
		if (editconnection.removepath.value != "" && editconnection.removepath.value.substring(0,1) != "/")
		{
			alert("Remove path must start with a  '/' character");
			editconnection.removepath.focus();
			return false;
		}
		if (editconnection.statuspath.value != "" && editconnection.statuspath.value.substring(0,1) != "/")
		{
			alert("Status path must start with a  '/' character");
			editconnection.statuspath.focus();
			return false;
		}
		return true;
	}

	function checkConfigForSave()
	{
		if (editconnection.servername.value == "")
		{
			alert("Please supply a valid Solr server name");
			SelectTab("Server");
			editconnection.servername.focus();
			return false;
		}
		if (editconnection.serverport.value != "" && !isInteger(editconnection.serverport.value))
		{
			alert("Solr server port must be a valid integer");
			SelectTab("Server");
			editconnection.serverport.focus();
			return false;
		}
		if (editconnection.webappname.value != "" && editconnection.webappname.value.indexOf("/") != -1)
		{
			alert("Web application name cannot have '/' characters");
			SelectTab("Server");
			editconnection.webappname.focus();
			return false;
		}
		if (editconnection.updatepath.value != "" && editconnection.updatepath.value.substring(0,1) != "/")
		{
			alert("Update path must start with a  '/' character");
			SelectTab("Server");
			editconnection.updatepath.focus();
			return false;
		}
		if (editconnection.removepath.value != "" && editconnection.removepath.value.substring(0,1) != "/")
		{
			alert("Remove path must start with a  '/' character");
			SelectTab("Server");
			editconnection.removepath.focus();
			return false;
		}
		if (editconnection.statuspath.value != "" && editconnection.statuspath.value.substring(0,1) != "/")
		{
			alert("Status path must start with a  '/' character");
			SelectTab("Server");
			editconnection.statuspath.focus();
			return false;
		}
		return true;
	}

	function deleteArgument(i)
	{
		// Set the operation
		eval("editconnection.argument_"+i+"_op.value=\"Delete\"");
		// Submit
		if (editconnection.argument_count.value==i)
			postFormSetAnchor("argument");
		else
			postFormSetAnchor("argument_"+i)
		// Undo, so we won't get two deletes next time
		eval("editconnection.argument_"+i+"_op.value=\"Continue\"");
	}

	function addArgument()
	{
		if (editconnection.argument_name.value == "")
		{
			alert("Argument name cannot be an empty string");
			editconnection.argument_name.focus();
			return;
		}
		editconnection.argument_op.value="Add";
		postFormSetAnchor("argument");
	}

//-->
</script>


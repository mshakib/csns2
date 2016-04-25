<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="csns" uri="http://cs.calstatela.edu/csns" %>

<script>
$(function(){
    $("#preregStart").datepicker();
    $("#preregEnd").datepicker();
    $("div.help").dialog({
        autoOpen: false,
        modal: true
    });
});
function help( name )
{
    $("#help-"+name).dialog("open");
}
</script>

<ul id="title">
<li><a class="bc" href="list">Schedules</a></li>
<li>Create Schedule</li>
</ul>

<form:form modelAttribute="schedule">
<table class="general autowidth">
  <tr>
    <th>Term</th>
    <td>
      <form:select path="term" items="${terms}" itemValue="code" itemLabel="fullName" />
    </td>
  </tr>

  <tr>
    <th><csns:help name="start">Pre-Registration Start</csns:help></th>
    <td>
      <form:input path="preregStart" cssClass="leftinput" size="10" maxlength="10" />
    </td>
  </tr>

  <tr>
    <th><csns:help name="end">Pre-Registration End</csns:help></th>
    <td>
      <form:input path="preregEnd" cssClass="leftinput" size="10" maxlength="10" />
    </td>
  </tr>

  <tr>
    <th>Default Section Capacity</th>
    <td>
      <form:input path="defaultSectionCapacity" cssClass="leftinput" size="5" maxlength="5" />
    </td>
  </tr>

  <tr>
    <th><csns:help name="undergradLimit">Default Registration Limit for Undergrad</csns:help></th>
    <td>
      <form:input path="defaultUndergradRegLimit" cssClass="leftinput" size="5" maxlength="5" />
    </td>
  </tr>

  <tr>
    <th><csns:help name="gradLimit">Default Registration Limit for Grad</csns:help></th>
    <td>
      <form:input path="defaultGradRegLimit" cssClass="leftinput" size="5" maxlength="5" />
    </td>
  </tr>

  <tr><th></th><td><input class="subbutton" type="submit" value="Create" /></td></tr>
</table>
</form:form>

<div id="help-start" class="help">
The date when the students can start pre-registration.
</div>

<div id="help-end" class="help">
The date when pre-registration closes.
</div>

<div id="help-undergradLimit" class="help">
The max number of classes an undergraduate student can pre-register.
</div>

<div id="help-gradLimit" class="help">
The max number of classes a graduate student can pre-register.
</div>

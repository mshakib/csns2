<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<script>
$(function(){
    $("#tabs").tabs({
        cache: false
    });
    $(".add").each(function(){
        $(this).autocomplete({
            source: "<c:url value='/course/autocomplete' />",
            select: function(event, ui) {
                if( ui.item )
                    $("<input>").attr({
                        type: "hidden",
                        name: "courseId",
                        value: ui.item.id
                    }).appendTo($(this).parent());
            }
        });
    });
    $(".clear").each(function(){
       $(this).click(function(event){
           event.preventDefault();
           $("input[name='courseId']").remove();
           $(".add").each(function(){
              $(this).val("");
           });
       });
    });
});
</script>

<ul id="title">
<li><a class="bc" href="<c:url value='/course/search' />">Courses</a></li>
<li>${department.name}</li>
<security:authorize access="authenticated and principal.isAdmin('${dept}')">
<li class="align_right"><a href="<c:url value='/course/add' />"><img title="Add"
    alt="[Add]" src="<c:url value='/img/icons/table_add.png' />" /></a></li>
</security:authorize>
</ul>

<div id="tabs">
<ul>
  <li><a href="#undergraduate">Undergraduate Courses</a></li>
  <li><a href="#graduate">Graduate Courses</a></li>
</ul>

<div id="undergraduate">
<table class="viewtable">
<tr>
  <th>Code</th><th>Name</th><th>Coordinator</th>
  <security:authorize access="authenticated and principal.isAdmin('${dept}')">
    <th></th>
  </security:authorize>
</tr>
<c:forEach items="${department.undergraduateCourses}" var="course">
<tr>
  <td>${course.code}</td>
  <td><a href="<c:url value='/course/view?id=${course.id}' />">${course.name}</a></td>
  <td>${course.coordinator.name}</td>
  <security:authorize access="authenticated and principal.isAdmin('${dept}')">
  <td class="center"><a href="course/undergraduate/remove?courseId=${course.id}"><img
    title="Remove" alt="[Remove]" border="0" src="<c:url value='/img/icons/delete.png' />" /></a></td>
  </security:authorize>
</tr>
</c:forEach>
<c:forEach items="${department.additionalUndergraduateCourses}" var="course">
<tr>
  <td>${course.code}</td>
  <td><a href="<c:url value='/course/view?id=${course.id}' />">${course.name}</a></td>
  <td>${course.coordinator.name}</td>
  <security:authorize access="authenticated and principal.isAdmin('${dept}')">
  <td class="center"><a href="course/undergraduate/remove?courseId=${course.id}"><img
    title="Remove" alt="[Remove]" border="0" src="<c:url value='/img/icons/delete.png' />" /></a></td>
  </security:authorize>
</tr>
</c:forEach>
</table>

<security:authorize access="authenticated and principal.isAdmin('${dept}')">
<form action="course/undergraduate/add" method="post"><p>
<input type="text" class="forminput add" name="name" size="40" />
<input type="submit" class="subbutton" name="add" value="Add" />
<button class="subbutton clear">Clear</button>
</p></form>
</security:authorize>
</div>

<div id="graduate">
<table class="viewtable">
<tr>
  <th>Code</th><th>Name</th><th>Coordinator</th>
  <security:authorize access="authenticated and principal.isAdmin('${dept}')">
  <th></th>
  </security:authorize>
</tr>
<c:forEach items="${department.graduateCourses}" var="course">
<tr>
  <td>${course.code}</td>
  <td><a href="<c:url value='/course/view?id=${course.id}' />">${course.name}</a></td>
  <td>${course.coordinator.name}</td>
  <security:authorize access="authenticated and principal.isAdmin('${dept}')">
  <td class="center"><a href="course/graduate/remove?courseId=${course.id}"><img
    title="Remove" alt="[Remove]" border="0" src="<c:url value='/img/icons/delete.png' />" /></a></td>
  </security:authorize>
</tr>
</c:forEach>
<c:forEach items="${department.additionalGraduateCourses}" var="course">
<tr>
  <td>${course.code}</td>
  <td><a href="<c:url value='/course/view?id=${course.id}' />">${course.name}</a></td>
  <td>${course.coordinator.name}</td>
  <security:authorize access="authenticated and principal.isAdmin('${dept}')">
  <td class="center"><a href="course/graduate/remove?courseId=${course.id}"><img
    title="Remove" alt="[Remove]" border="0" src="<c:url value='/img/icons/delete.png' />" /></a></td>
  </security:authorize>
</tr>
</c:forEach>
</table>

<security:authorize access="authenticated and principal.isAdmin('${dept}')">
<form action="course/graduate/add" method="post"><p>
<input type="text" class="forminput add" name="name" size="40" />
<input type="submit" class="subbutton" name="add" value="Add" />
<button class="subbutton clear">Clear</button>
</p></form>
</security:authorize>
</div>

</div> <!-- end of tabs -->
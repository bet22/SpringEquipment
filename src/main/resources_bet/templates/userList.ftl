<#import "path/common.ftl" as c>

<@c.page>
List of users

<table border="1">
    <tr>
        <th>Name user</th>
        <th>Role user</th>
        <th></th>
    </tr>
    <#list users as user>
    <tr>
        <td>${user.username}</td>
        <td><#list user.roles as role>${role}<#sep>,</#list></td>
        <td><a href="/user/${user.id}">Edit</a></td>
    </tr>

    </#list>
</table>
</@c.page>
<#import "path/common.ftl" as c>
<#import "path/login.ftl" as l>
<@c.page>
<div>
    <@l.logout />
    <span><a href = "/user">User list</a></span>
</div>

<div>
    <form method="post">
        <input type="text" name="name" placeholder="Введите имя камеры">
        <input type="text" name="ip" placeholder="Введите ip камеры">
        <input type="text" name="mac" placeholder="Введите mac камеры">
        <input type="hidden" name="_csrf" value="{{_csrf.token}}">
        <button type="submit">Ввести данные</button>
    </form>
</div>
<div>Список камер</div>
    <form method="get" action="main">
        <input type="text" name="ipFilter" value="${ipFilter?ifExists}">
        <button type="submit">Фильтровать</button>
    </form>

<#list messages as message>
<div>

        ${message.id}
        ${message.name}
        ${message.ip}
        ${message.mac}
        ${message.authorName}
</div>
    <#else>
    No equipment
    </#list>

</@c.page>
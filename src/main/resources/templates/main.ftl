<#import "paths/common.ftl" as c>
<#import "paths/login.ftl" as l>
<@c.page>
<!--<div class="form-row">
    <div class="form-group col-md-6">
        <form method="get" action="/main" class="form-inline">
            <input type="text" name="filter" class="form-control" value="${filter?ifExists}" placeholder="Search by Company" >
            <button type="submit" class="btn btn-primary ml-2">Search</button>
        </form>
    </div>
</div>-->
<div class="form-row">
    <div class="input-group mb-6">
        <form method="get" action="/main" class="form-inline">
            <select name="filter" class="custom-select" id="inputGroupSelect02">
                <option value="" selected>Company...</option>
                <#list company as inc>
                <option value="${inc}">${inc}</option>
                <#else>
                <option value="${inc}">No company</option>
                </#list>
            </select>

            <select name="filterEquip" class="custom-select ml-2" id="inputGroupSelect03">
                <option value="" selected>Type of equipment...</option>
                <#list types as type>
                <option value="${type}">${type}</option>
                <#else>
                <option value="${type}">No type of equipment</option>
            </#list>
            </select>

            <button type="submit" class="btn btn-primary ml-2">Search</button>
        </form>
    </div>
</div>
<a class="btn btn-primary mt-2" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
   Add new equipment
</a>
<div class="collapse" id="collapseExample">
    <div class="form-group mt-2">
        <form method="post" class="form-inline">
            <div class="form-group mr-2 mb-1">
                <input type="text" name="title" class="form-control" placeholder="Title" />
            </div>
            <div class="form-group mr-2">
                <input type="text" name="company" class="form-control" placeholder="Company">
            </div>
            <div class="form-group mr-2">
                <input type="text" name="typeOfEquipment" class="form-control" placeholder="Type Of Equipment">
            </div>
            <div class="form-group mr-2">
                <input type="text" name="ip" class="form-control" placeholder="ip">
            </div>
            <div class="form-group mr-2">
                <input type="text" name="mac" class="form-control" placeholder="MAC">
            </div>
            <div class="form-group mr-2">
                <input type="text" name="login" class="form-control" placeholder="Login">
            </div>
            <div class="form-group mr-2">
                <input type="text" name="password" class="form-control" placeholder="Password">
            </div>
            <div class="form-group mr-2">
                <input type="text" name="location" class="form-control" placeholder="Location">
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}" />
            <button type="submit" class="btn btn-primary">Добавить</button>
        </form>
    </div>
</div>
<div class="table-responsive-xl">
    <table class="table">
        <thead class="thread-light">
        <tr>
            <th scope="col">Title</th>
            <th scope="col">Company</th>
            <th scope="col">Type of Equipment</th>
            <th scope="col">IP</th>
            <th scope="col">MAC</th>
            <th scope="col">Login</th>
            <th scope="col">Password</th>
            <th scope="col">Location</th>
        </tr>
        </thead>
    <#list messages as message>
        <tbody>
        <tr>
            <td>${message.title}</td>
            <td>${message.company}</td>
            <td>${message.typeOfEquipment}</td>
            <td>${message.ip}</td>
            <td>${message.mac}</td>
            <td>${message.login}</td>
            <td>${message.password}</td>
            <td>${message.location}</td>
        </tr>
        </tbody>
    <#else>
    No message
    </#list>
    </table>
</div>
</@c.page>
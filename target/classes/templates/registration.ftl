<#import "paths/common.ftl" as c>
<#import "paths/login.ftl" as l>

<@c.page>
<div class="mb-2">Add new user</div>
${message?ifExists}
<@l.login "/registration" true/>
</@c.page>
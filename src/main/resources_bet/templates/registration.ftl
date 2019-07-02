<#import "path/common.ftl" as c>
<#import "path/login.ftl" as l>

<@c.page>
Add new user
${message?ifExists}
<@l.login "/registration" />
</@c.page>
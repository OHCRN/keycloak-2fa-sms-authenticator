<#import "template.ftl" as layout>
<@layout.emailLayout>
	${kcSanitize(msg(code))?no_esc}
</@layout.emailLayout>

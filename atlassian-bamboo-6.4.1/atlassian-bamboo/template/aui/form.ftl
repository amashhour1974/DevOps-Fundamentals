[#include "/${parameters.templateDir}/xhtml/form-validate.ftl" /]
[#if parameters.cssClass??]
    ${tag.addParameter("cssClass", "aui ${parameters.cssClass}") }
[#else]
    ${tag.addParameter("cssClass", "aui") }
[/#if]
[#include "/${parameters.templateDir}/simple/form.ftl" /]

<div class="form-content-container">

[#if parameters.title?has_content || parameters.titleKey?has_content]
    <h2>[#rt/]
        [#if parameters.title?has_content]
            ${parameters.title?trim}[#t/]
        [#else]
            [@ww.text name=parameters.titleKey /][#t/]
        [/#if]
    </h2>[#lt/]
[/#if]
[#if parameters.smallTitle?has_content || parameters.smallTitleKey?has_content]
    <h3>[#rt/]
        [#if parameters.smallTitle?has_content]
            ${parameters.smallTitle?trim}[#t/]
        [#else]
            [@ww.text name=parameters.smallTitleKey /][#t/]
        [/#if]
    </h3>[#lt/]
[/#if]
[#if (parameters.description?? && parameters.description?trim?has_content) || parameters.descriptionKey??]
<p class="description">[#rt/]
        [#if parameters.description??]
            ${parameters.description?trim}[#t/]
        [#else]
            [@ww.text name=parameters.descriptionKey /][#t/]
        [/#if]
    </p>[#lt/]
[/#if]

[#if action.hasActionErrors()]
    [#if !(parameters.showActionErrors?? && parameters.showActionErrors = 'false')]
        [@ww.actionerror /]
    [/#if]
[/#if]

[#if action.hasActionWarnings()]
    [#if !(parameters.showActionWarnings?? && parameters.showActionWarnings = 'false')]
        [@ui.actionwarning /]
    [/#if]
[/#if]

[#if action.hasActionMessages()]
    [#if !(parameters.showActionMessages?? && parameters.showActionMessages = 'false')]
        [@ww.actionmessage /]
    [/#if]
[/#if]

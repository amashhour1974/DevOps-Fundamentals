[#assign cssClass = 'text short-field periodPicker' /]
[#assign periodList = parameters.periodList!['days', 'weeks', 'months'] /]
[#include "/${parameters.templateDir}/${parameters.theme}/controlheader.ftl" /]
[#include "/${parameters.templateDir}/simple/text.ftl" /]
[@ww.select name=parameters.periodField value=parameters.periodValue list=periodList theme='simple' cssClass="select" mediumField=true /]
[#include "/${parameters.templateDir}/${parameters.theme}/controlfooter.ftl" /]

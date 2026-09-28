{{- $hours := .Day.Hours .Cfg.Layout.Numbers.DailyBottomHour .Cfg.Layout.Numbers.DailyTopHour -}}
{{- $rowUnits := mul (len $hours) 2 -}}
{{- if .Cfg.AddLastHalfHour -}}{{- $rowUnits = add $rowUnits 1 -}}{{- end -}}
\myUnderline{Schedule\textcolor{white}{g}}\vskip-\myLenLineThicknessDefault
\setlength{\myLenScheduleTotal}{ {{- $rowUnits -}} \myLenLineHeightButLine}
\smash{\makebox[0pt][l]{\hspace{.5\linewidth}\rule[-\myLenScheduleTotal]{\myLenLineThicknessDefault}{\myLenScheduleTotal}}}%
{{range $hour := $hours -}}
\myLineHeightButLine%
{{if $.Cfg.AMPMTime -}}
\parbox{9mm}{\hfill\small {{- $hour.FormatHour $.Cfg.AMPMTime -}} }%
{{- else -}}
{\small {{- $hour.FormatHour $.Cfg.AMPMTime -}} }
{{- end}}
\myLineLightGray\vskip\myLenLineHeightButLine\myLineGray
{{- end}}
{{if $.Cfg.AddLastHalfHour}}\vskip\myLenLineHeightButLine\vbox to 0pt{\myLineLightGray}{{end}}

{{- $today := .Body.Day -}}
{{- if $today.IsWeekend -}}
\begin{minipage}[t]{\myLenTriCol}
{{template "schedule.tpl" dict "Cfg" .Cfg "Day" .Body.Day "Divide" false}}
  \vspace{\dimexpr4mm+.3pt}

{{- if .Cfg.CalAfterSchedule -}}
{{- template "monthTabularV2.tpl" dict "Month" .Body.Month "Today" $today -}}
{{- end -}}
\end{minipage}%
\hspace{\myLenTriColSep}%
\begin{minipage}[t]{\dimexpr2\myLenTriCol+\myLenTriColSep}
  \myUnderline{Notes $\vert$ {{ $today.LinkLeaf "More" "More" }}\hfill{}{{ $today.LinkLeaf "Reflect" "Reflect" }}\hfill{}\hyperlink{Notes Index}{All notes}}
  \myMash[\myDailySpring]{ {{- add .Cfg.Layout.Numbers.DailyNotes .Cfg.Layout.Numbers.DailyTodos -}} }{\myNumDotWidthTwoThirds}
\end{minipage}
\par\pagebreak
{{- else -}}
\begin{minipage}[t]{\myLenTwoCol}
  \myUnderline{Notes $\vert$ {{ $today.LinkLeaf "More" "More" }}\hfill{}{{ $today.LinkLeaf "Reflect" "Reflect" }}\hfill{}\hyperlink{Notes Index}{All notes}}
  \myMash[\myDailySpring]{\myNumDailyNotes}{\myNumDotWidthHalf}

  \myUnderline{To Dos}
  \myMash[\myDailySpring]{\myNumDailyTodos}{\myNumDotWidthHalf}
\end{minipage}%
\hspace{\myLenTwoColSep}%
\begin{minipage}[t]{\myLenTwoCol}
{{template "schedule.tpl" dict "Cfg" .Cfg "Day" .Body.Day "Divide" true}}
  \vspace{\dimexpr4mm+.3pt}

  \myUnderline{Metrics}
  \myMash[\myDailySpring]{\myNumDailyMetrics}{\myNumDotWidthHalf}

  \vspace{\dimexpr4mm+.3pt}

  Shutdown complete: $\square$
  \par\vspace{\dimexpr1mm+.3pt}

{{- if .Cfg.CalAfterSchedule -}}
{{- template "monthTabularV2.tpl" dict "Month" .Body.Month "Today" $today -}}
{{- end -}}
\end{minipage}
\par\pagebreak
{{- end -}}

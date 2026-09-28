{{- $today := .Body.Day -}}

\begin{minipage}[t]{\myLenTwoCol}
  \myUnderline{Notes $\vert$ {{ $today.LinkLeaf "More" "More" }}\hfill{}{{ $today.LinkLeaf "Reflect" "Reflect" }}\hfill{}\hyperlink{Notes Index}{All notes}}
  \myMash[\myDailySpring]{\myNumDailyNotes}{\myNumDotWidthHalf}

  \myUnderline{To Dos}
  \myMash[\myDailySpring]{\myNumDailyTodos}{\myNumDotWidthHalf}
\end{minipage}%
\hspace{\myLenTwoColSep}%
\begin{minipage}[t]{\myLenTwoCol}
{{template "schedule.tpl" dict "Cfg" .Cfg "Day" .Body.Day}}
  \vspace{\dimexpr4mm+.3pt}

  \myUnderline{Metrics}
  \myMash[\myDailySpring]{\myNumDailyMetrics}{\myNumDotWidthHalf}

  Shutdown complete: $\square$

  \vspace{\dimexpr4mm+.3pt}

{{- if .Cfg.CalAfterSchedule -}}
{{- template "monthTabularV2.tpl" dict "Month" .Body.Month "Today" $today -}}
{{- end -}}
\end{minipage}
\par\pagebreak

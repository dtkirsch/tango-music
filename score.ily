\score {
 <<
 \new ChordNames {
 \set chordChanges = ##t
 \transpose \transposeTo c \harmonies
 }
 \new Staff <<
 \new Voice = "melody" { \transpose \transposeTo c \songKey \clef \melodyClef \relative \melodyRelative \transpose \transposeTo c \melody  }
 
 \new Voice = "effects" { \relative \melodyRelative \effects}
 >>
 \new Staff <<
 \new Voice = "rhythm" { \clef percussion \improvisationOn \relative c' \rhythm}
 >>

 \new PianoStaff <<
    \set PianoStaff.instrumentName = #"Piano  "
    \new Staff = "pianoUp" \pianoUp
    \new Staff = "pianoDown" \pianoDown
  >>

 \counters

  \new Staff <<
  \new Voice = "bass" {\clef bass \bass }
  >>


% \new Staff = "fill" { \clef bass \fill}
% \new Staff = "effects" { \clef bass \effects}
% \new Lyrics \lyricsto "one" \text
 >>
 \layout { }
 \midi { }
}
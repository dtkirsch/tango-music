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

 \new PianoStaff <<
    \set PianoStaff.instrumentName = #"Piano  "
    \new Staff = "pianoUp" \pianoUp
    \new Staff = "pianoDown" \pianoDown
  >>
 
 \counters
% \new Staff = "fill" { \clef bass \fill}
% \new Staff = "effects" { \clef bass \effects}
% \new Lyrics \lyricsto "one" \text
 >>
 \layout { }
 \midi { }
}
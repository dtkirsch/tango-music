\include "global.ily"

\header {
 title = "Title"
 % subtitle = "[Subtitle]" 
 composer = "Composer"
}

songKey = \key d \minor
emptyVerse = \repeat volta 2 {s1 s1 s1 s1 s1 s1 s1} \alternative {{s1}{s1}}

counters = <<
  % more counter lines can be added here, add a \new Voice line for each
  \new Voice = "counter" { \clef \melodyClef \transpose \transposeTo c 
			   { \relative \melodyRelative {
			     \songKey
			   }}}
>>

harmonies = \chordmode {
 % Chord changes here
}

effects = \relative \melodyRelative {
  % e.g. s1\arr \hideNotes d8 \glissando \zigzag d'1. \glissando  d,,8   c4  \unHideNotes
}

fill = \relative \melodyRelative {
  % notes (and rests!) in this section will show up as tiny cue notes
  s1
}
\addQuote "fill" { \fill }

melody = \relative \melodyRelative {
 \time 4/4
 \set Score.markFormatter = #format-mark-box-letters
 % count bars properly across alternate endings:
 \set Score.alternativeNumberingStyle = #'numbers-with-letters
 
 \tempo "Tango"
% \tempo 4 = 120 % for midi generatiion only, this doesn't appear on the score.

 % add the fill cues
 \cueDuring #"fill" #UP {

 % Melody here
 
   \mark \default % Section A
   \repeat volta 2 {
     r1 r1 r1 r1 \break
     r1 r1 r1} \alternative {{r1}{r1}}
   \break

 
   \mark \default % Section B
   
   \mark \default % Section C
 } 
 
}

text = \lyricmode {
 % Lyrics here
}


pianoUp = \relative c' {
  \clef treble
  \songKey
  \time 4/4

  % can contain notes: d4 e a g
  % spelled chords: <d f a>4 <d f gis> 
  % or named chords: \chordmode{ a,4:7 a,:6 a,:7 a,:8^7 d4:m/a r2.}

  \emptyVerse
}

pianoDown = \relative c, {
  \clef bass
  \songKey
  \time 4/4

}

\include "score.ily"
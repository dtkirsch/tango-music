\include "global.ily"

\header {
 title = "Felicia" 
 % subtitle = "[Subtitle]" 
 composer = "Enrique Saborido" 
}

songKey = \key d \minor
emptyVerse = \repeat volta 2 {s1 s1 s1 s1 s1 s1 s1} \alternative {{s1}s1}

fresedoCounter = \relative \melodyRelative {
  \songKey
  \repeat volta 2 {
  d2 a4 f    e1    e'4. cis8 \times 2/3 {bes4 a g}     f1
  d4. e8 \times 2/3 {f4 g a}   bes8 e,2. d8   cis2 a2 } \alternative {{f1} {d4 r2.}}
}

counters = <<
  \new Voice = "counter" { \clef \melodyClef \transpose \transposeTo c 
			   { \relative \melodyRelative {
			     \songKey
			     \repeat volta 2 {
			       f2 e4 d    bes1    a2 cis2     d8 cis d e f2 
			       f2 g8 f e d   bes1   a2 cis2} \alternative {{d1} {d4 r2.}}
			     }}}
  \new Voice = "fresedoCounter" { \clef \melodyClef \transpose \transposeTo c 
				  { \relative \melodyRelative {
				    \songKey
				    \repeat volta 2 {
				      d2 a4 f    e1    e'4. cis8 \times 2/3 {bes4 a g}     f1
				      d4. e8 \times 2/3 {f4 g a}   bes8 e,2. d8   cis2 a2 } \alternative {{f1} {d4 r2.}}
				  }}}
>>

effects = \relative \melodyRelative {
  \emptyVerse
  \repeat volta 2 {s1 s1 s1\arr
    \hideNotes d8 \glissando \zigzag d'1. \glissando  d,,8   c4  \unHideNotes 
s1 s1\arr} \alternative {{s1}{s1}}
}

fill = \transpose \transposeTo c { \relative \melodyRelative {
  \emptyVerse
  \emptyVerse
  \repeat volta 2 {s1    s4 r8 fis, g fis g4    s1   s4 r8 e f e f4
  s1    s4 r8 a, cis e a4   s1 } \alternative { {s1} { r8 d8 c bes a g f e} }
}}
\addQuote "fill" { \fill }

melody = \relative \melodyRelative {
 \time 4/4
 \set Score.markFormatter = #format-mark-box-letters
 % count bars properly across alternate endings:
 \set Score.alternativeNumberingStyle = #'numbers-with-letters
 
 \tempo "Tango"
 \tempo 4 = 120 % for midi generatiion only, this doesn't appear on the score.
 
 \cueDuring #"fill" #UP {

 % Melody here
 
 \mark \default % Section A
 
 \repeat volta 2 {
 {r8\p\< d a f   r d' a f   r bes a g   r bes a g   r cis a g   r cis a g   r d' a f   r d' a f\f}
 \break
 r8d'\sp\< a f   r d' a f   r bes a g   r bes a g   r a gis a bes b c cis\f }
 \alternative { {d8 d'\sp c bes a g f e} {d4 r r8 d4 d8} }
 \break
 
 \mark \default % Section B
 \repeat volta 2 {
 \slurUp d4( f e4.) d8   d8 cis4 d8 e cis a4   r a gis4. a8  bes4 r8 a gis a bes4  \break
 r4 a g f   a4 r8 g fis g a4   r4 g f4. e8   }
 \alternative { {g4 f r8 d'4 d8} {d,4 r8 gis a gis a4} } \break
 
 \mark \default % Section C
 \repeat volta 2 {
 r4 gis a bes   g r4 r r   r4 fis g a   f r r r
 \break
 r4 e f g   e r4 r r   r4 g f e}
 \alternative { {g f8 gis a gis a4} {d,4 r r r  } } \break
 
 } 
 
}

text = \lyricmode {
 % Lyrics here
}

harmonies = \chordmode {
 % Chord changes here
 \repeat volta 2 {d1:m g:m a:7 d:m   d:m g:m a:7 } \alternative { {d4:m r2.} { \once \set chordChanges = ##f d4:m a4:7 d2:m } }
 \repeat volta 2 {d1:m a:7 a:7 d:m   d:m a:7 a:7 } \alternative { {d:m} {\once \set chordChanges = ##f d:m } }
 \repeat volta 2 {d1:m a:7 a:7 d:m   d:m a:7 a:7 } \alternative { {d:m} {\once \set chordChanges = ##f d4:m r r r} }
}

pianoUp = \relative c' {
  \clef treble
  \songKey
  \time 4/4

  \emptyVerse
  \emptyVerse
  \repeat volta 2 {
    <d f a>4 <d f gis> <d f a> <d f bes> <cis e g a> r2. 
    \chordmode{ a,4:7 a,:6 a,:7 a,:8^7 d4:m/a r2.}
    <a d f>4 <a d e> <a d f> <a d g> <a cis e g> r2. 
%    <cis e g a> <cis e fis a> <cis e g a> <cis e a> <d f a> r r r  
%    \chordmode{ a,4:7 a,:7 a,:7 a,:7 }
    <cis e g a>4 <cis e g a> <cis e g a> <cis e g a>
  } \alternative {{<d f a>4 r r r}{<d f a>4 r r r}}
  
}

pianoDown = \relative c, {
  \clef bass
  \songKey
  \time 4/4

  \emptyVerse
  \emptyVerse
  \repeat volta 2 {
    r8 <d d'> r <d d'> r <d d'> r d \glissando a4 r2.
    r8 <a a'> r <a a'> r <a a'> r a \glissando d4 r2.
    r8 <d d'> r <d d'> r <d d'> r d \glissando a4 r2.
    a'4 g f e} \alternative {{d r2.}{d4 r2.}}

}

\include "score.ily"
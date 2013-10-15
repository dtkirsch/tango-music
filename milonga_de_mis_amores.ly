\include "global.ily"

\header {
 title = "Milonga de mis Amores"
 % subtitle = "[Subtitle]" 
 composer = "Pedro Laurenz"
}

songKey = \key a \minor
songKeyAlt = \key a \major
emptyVerse = \repeat volta 2 {s2 s2 s2 s2 s2 s2 s2} \alternative {{s2}{s2}}

counters = <<
  % more counter lines can be added here, add a \new Voice line for each
  \new Voice = "C solo" { \clef \melodyClef \transpose \transposeTo c 
			   { \relative \melodyRelative {
			     \songKey
			     \partial 8. s8.
			     \emptyVerse

			     s2 s s s
			     
				%B
			     s s s s s s s s
			     s s s s s s s s
			     
				%C
			     r16 a c b d8 c16 b  c b ais b d cis e8  r dis d cis  d c r4
			     r8 a16 c b d c b    c b ais b d cis c8  r b   a gis  b a r4 

			   }}}
  \new Voice = "C solo 2" { \clef \melodyClef \transpose \transposeTo c 
			   { \relative \melodyRelative {
			     \songKey
			     \partial 8. s8.
			     \emptyVerse

			     s2 s s s
			     
				%B
			     s s s s s s s s
			     s s s s s s s s
			     
				%C
			     r16 \acciaccatura gis8 a8 c16 b d c b  c b ais b d cis e d
			     f8 e~e a16 g  b a g a c b d8
			     r16 a c gis b f a e  gis d f c e4  r8 b a gis  a r4. 

			   }}}

>>

harmonies = \chordmode {
 % Chord changes here

  %A
  \partial 8. s8.
  \repeat volta 2{ a2:m e:7 e:7 a:m a:m e:7 e:7}\alternative{{a8:m r4.}{a8:m r4.}}

  r2 r r r
  % B
  r2 e:7 e:7 a4 cis:7 fis4:m cis:7 fis2:m e:7 a4 r4 r2 e:7 e:7

  a2:m a:m e:7 e:7 a:m

  %C
  \repeat volta 2{a:m e:7 e:7 a:m a:m e:7} \alternative{{e:7 a:m}{e:7 a:m}}
}

effects = \relative \melodyRelative {
  % e.g. s1\arr \hideNotes d8 \glissando \zigzag d'1. \glissando  d,,8   c4  \unHideNotes
}

fill = \relative \melodyRelative {
  % notes (and rests!) in this section will show up as tiny cue notes
  \partial 8. s8.
  \repeat volta 2 {s2 s s s s s s}\alternative{{r16 e, a c e8 s8}{r16 e, a c e8 s8}}

  s2 s s r8. e16 cis d e8

  %B
  s2 s s s \stemDown fis,4 gis a s
}
\addQuote "fill" { \fill }


ariff = {<a e>16(e)e <c' e>(e,)e <a c>(e)}
eriffa = {<gis b>16(e)e <b' d>(e,)e <gis c>(e)}
eriffb = {<gis b>16(e)e <gis c>(e)e <gis b>(e)}

melody = \relative \melodyRelative {
 \time 2/4
 \set Score.markFormatter = #format-mark-box-letters
 % count bars properly across alternate endings:
 \set Score.alternativeNumberingStyle = #'numbers-with-letters
 #(set-accidental-style 'modern) % this puts cancelling naturals across octave changes

 \tempo "Milonga"
% \tempo 4 = 120 % for midi generatiion only, this doesn't appear on the score.

 % add the fill cues
 \cueDuring #"fill" #UP {

 % Melody here
   \partial 8. e16 dis e 
 
   \mark \default % Section A
   \repeat volta 2 {
     a16 e dis e c' e, dis e  b' e, dis e d' e, dis e  c' e, dis e b' e, dis e  a e dis e c' e, dis e \break
     b' e, dis e a e dis e  gis e dis e f d cis d  e c b c d b ais b} \alternative {{c8 r r16 e dis e}{c'4 r16 gis a b}}
   \break
   
   % Bridge to B
   c16 b a g f e d cis  d8 cis(d) dis(  e) a(gis)b(a) r4. \break

   \mark \default % Section B
   \songKeyAlt
   r8 e16 cis d e d cis  e8 d cis e  d cis d b  d cis r b
   a cis16 cis cis cis cis cis  d cis b cis fis8 f  e r16 e16 e e e e  fis e cis a d8 cis
   b a gis fis  e r16 gis16 b d cis8  r8 e d b  
   
   \songKey
   \ariff % C bridge rhythm is last measure of B
   \ariff \eriffa \eriffb \ariff \break
   \mark \default % Section C
   \repeat volta 2 {
     \ariff \eriffa \eriffb \ariff
     \ariff \eriffa} \alternative{{\eriffb \ariff}{<gis b>8 r f(e)  e r r16 e16 dis e}}\break
   % Bridge to A -- wait, where did that come from?
   % c16 b a g f e d cis  d8 cis(d) dis(  e) a(gis)b(a) r4. 
   
 } 
 
}

text = \lyricmode {
 % Lyrics here
}

bass = \relative c, {
  \songKey
  \time 2/4

  \partial 8. s8.
  \repeat volta 2 {
  a'8. c16 e8 e,  gis8. d'16 e8 e,  b'8. d16 e8 e,  a8. c16 e8 e,
  a8. c16 e8 e,  b'8. d16 e8 e,  b'8. d16 e8 e,  } \alternative {{a \acciaccatura dis16 e8 a, r}{a r4.}}

  a16 b c cis d e f e  d4 c b e a, r8 e

  \songKeyAlt
  a r4.  b8. d16 e8 e,  b'8. d16 e8 e,  a8 r cis r fis, r gis r  
  a8. cis16 d8 dis  e8 r e, r  a r a ais  b cis d dis e r4.  b8. d16 e8 e,

  \songKey
  a8. e' e,8  a8. e' e,8  b'8. e e,8  b'8. e e,8  a8. e' e,8  

  \repeat volta 2 {
    a8. e' e,8  b'8. e e,8  b'8. e e,8  a8. e' e,8  
    a8. e' e,8  b'8. e e,8}  \alternative{{b'8. e e,8  a8. e' e,8}{b'8 r dis(d)  a16 b c d e8 r}}

  % bridge to A -- wait, where did that come from?
  %c16 b a g f e d cis  d8 cis(d) dis(  e) a(gis)b(a) r4. 
}  


pianoUp = \relative c' {
  \clef treble
  \songKey
  \time 2/4

  % can contain notes: d4 e a g
  % spelled chords: <d f a>4 <d f gis> 
  % or named chords: \chordmode{ a,4:7 a,:6 a,:7 a,:8^7 d4:m/a r2.}
  \partial 8. s8.
  \emptyVerse
}

pianoDown = \relative c, {
  \clef bass
  \songKey
  \time 2/4

  \partial 8. s8.

}

\include "score.ily"
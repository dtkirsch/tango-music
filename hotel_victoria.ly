\version "2.16.0"
\include "global.ily"

\header {
 title = "Hotel Victoria"
 % subtitle = "[Subtitle]" 
 composer = "[composer unknown]"
}

% This has an odd form: ABCDCA(A)
% A: 8x2
% B: 4x2
% C: 15
% D: 9

songKey = \key a \minor
songKeyx = \key a \major
emptyVerse = \repeat volta 2 {s1 s1 s1 s1 s1 s1 s1} \alternative {{s1}{s1}}

counters = <<
  % more counter lines can be added here, add a \new Voice line for each
  \new Voice = "counter" { \clef \melodyClef \transpose \transposeTo c 
			   { \relative \melodyRelative {
			     \songKey
			     \repeat volta 2 {e,2 ~ \times 2/3 {e4 g b} e1   e,2~e8 g b d  f4 e2. 
					      e4 c a e  e' d d dis  e2 gis} \alternative {{a4 s2.}{s1}}
			     \repeat volta 2 {s1*3} \alternative{{s1}{s1}}
			     s1*15
%			     s1 s2 s8 des,, des c  b2 dis  e s2  s1 
			   }}}
>>

harmonies = \chordmode {
 % Chord changes here, e.g. d1:m g:m d:m \once \set chordChanges = ##f d4:m a4:7 d2:m
  \repeat volta 2 {a1:m e:7 e:7 a:m a:m e:7 e:7} \alternative{{a:m}{ \once \set chordChanges = ##f a:m}}
  \repeat volta 2 {a1:m d:m e:7} \alternative {{a1:m}{a1}}
}

effects = \relative \melodyRelative {
  % e.g. s1\arr \hideNotes d8 \glissando \zigzag d'1. \glissando  d,,8   c4  \unHideNotes
}

fill = \relative \melodyRelative {
  % notes (and rests!) in this section will show up as tiny cue notes
  %A
  \repeat volta 2 {s1 s1 s1 s2. c16 cis d dis s1 s1 s1} \alternative {{s8 e,8 dis e f fis g gis}{s1}}
  %B
  \repeat volta 2 {s1 s1 s1} \alternative{{r8 e'8 c' b a4 s4}{r8 cis,8 d dis e4 s4}}
  %C
  s1 s1 s1 s4 s16 e, gis b e4 s4 s1 s1 s1 s4. fis8 e s4. s1 s1 s1 s1 s1 s1 s1
  %D
  s1 s2 s8 des,\tenuto des\tenuto c\tenuto  b2 dis  e s2  
  s1 s2 s8 des\tenuto des\tenuto c\tenuto  b2 dis  e s2  s1
  
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

   \slurUp

 % Melody here
 
   \mark \default % Section A
   \repeat volta 2 {
     e8 c a e f' e c a   e' d b gis e'4 d   r8 d b gis e' d b gis   d' c a e d'4 c \break
     e8 c a e f' e c a   e' d b gis e'4 d   r8 d b gis e' d b gis} \alternative {{a4 r4 r2}{a4 c r b}}
   \break

 
   \mark \default % Section B
   \repeat volta 2 {
     b8 a a gis gis a a e  g f e f b r r a  gis4 b r8 gis e d} 
   \alternative{{d4 c r8 c'4 b8}{\songKeyx cis,4 r4 r8  a' b cis}} \break
   
   \mark \default % Section C
   \repeat volta 2 {
     b4^\mordent^\markup{staccato} a r8 gis a b  a4^\mordent gis r8 fis gis a  gis4^\mordent fis e fis  fis8 gis d4 r8 gis a b \break
     a4^\mordent gis r8 fis8 gis a  gis4^\mordent fis r8 e fis gis  fis4^\mordent e d e  e8 fis cis8 r8 r8 a'( b cis) \break
     b4(a) r8 e( fis g)  fis4(d) r8 fis( gis a)  r8 gis( b gis) e4 r8 d  d4 cis r8 a'^\markup{staccato} b cis \break
     b4^\mordent a r8 e fis g  fis4^\mordent d r8 fis gis a \songKey gis8 b dis, e f fis g gis^\markup{\right-align \bold {2x to A}}
   }
   \mark \default % Section D
   a4 c16( d c d) b8 d a c  gis8 b gis e b r4.  r8 b' b b dis4 b  r8 c b a c4 b \break
   r4 c16( d c d) b8 d a c  gis8 b gis e b r4.  r8 b' b b fis'4 dis  e4 f fis g  \songKeyx gis r4 r8 a, b cis^\markup{\bold{to C}} \break
 } 
 
}

rhythm = {
  \repeat volta 2 {
    c4 c c c  c c c c  c c c c  c c c c
    c4. c4. c4  c4. c4. c4  c4 c c c } \alternative{{c4 r2.}{c4 c r c}}

  \repeat volta 2 {
    c4 c c c  c c c r8 c  c4 c r c } \alternative{{ c r2.}{c4 r r c}}

  s1*15
  c4 c c c  c r r r  c c c c  c r r c
  c4 r c c  c c c c  c c c c  c c c c  c r r r 
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
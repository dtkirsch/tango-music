

\header {
 tagline = "--->: arrastre"  % blank footer
}

\layout { 
  indent = 0.0\cm 
  \context{ 
    % Hide empty staff lines
    \RemoveEmptyStaffContext
    % Even at the beginning
    \override VerticalAxisGroup #'remove-first = ##t
  }
}

arr = ^\tweak #'X-offset #-4 ^\tweak #'Y-offset #4  ^\markup{\large \bold ---> }

zigzag = \once \override Glissando #'style = #'zigzag 

bassMelodyClef = bass
bassMelodyRelative = c'

% for transposing options at compile time
#(use-modules (guile-user))
#(format #t "Using style sheet: ~a\n" style)
\include #style


% blank default parts, intended to be overridden:
rhythm = {}
bass = {}



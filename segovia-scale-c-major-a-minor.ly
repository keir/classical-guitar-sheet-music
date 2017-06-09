% Author: mierle@gmail.com (Keir Mierle)

\version "2.18.2"
\header {
  title = "Diatonic key study of C major & A minor"
  arranger = "Engraved by Keir Mierle"
  composer = "Andrés Segovia"
}

\paper {
  % Remove indent on first line.
  indent = 0
}

\layout {
  % Remove the fingering engraver for the main staff, since it is not necessary
  % with the strings already indicated on the tab notation below.
  \context {
    \Voice
    \remove New_fingering_engraver
  }
  % Default note spacing is too tight, so globally increase it.
  \context {
    \Score
    \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/16)
  }
}

root_color = #red

scales = \relative c {
  \key c \major

  \tweak color \root_color
  c\5-2_\markup { \teeny "2nd pos." }  % root
  \mark "C major"
  d\5-4
  e\4-1
  f\4-2
  g\4-4

  a\3-1
  b\3-3 
  \tweak color \root_color
  c\3-1_\markup { \teeny "5th pos." }  % root
  d\3-3

  e\2-1
  f\2-2
  g\2-4

  a\1-1
  b\1-3

  \tweak color \root_color
  c4\1-4  % root; start descending.
  b4\1-3
  a\1-1

  g\2-4
  f\2-2
  e\2-1

  d\3-3
  \tweak color \root_color
  c\3-1  % root
  b\3-3_\markup { \teeny "2nd pos." }
  a\3-1

  g\4-4
  f\4-2
  e\4-1

  d\5-4
  \tweak color \root_color
  c4\5-2  % root

  \repeat volta 1 { }
  \set Score.doubleRepeatType = #":|.|:"

  \tweak color \root_color
  a4\6-1_\markup { \teeny "5th pos." }   % root
  \mark "A melodic minor"
  b\6-3
  c\6-4

  d\5-1
  e\5-3
  fis\5-1
  gis\5-3
  \tweak color \root_color
  a\5-4  % root

  b\4-1_\markup { \teeny "9th pos." }
  c\4-2
  d\4-4

  e\3-1
  fis\3-1

  gis\2-1
  \tweak color \root_color
  a\2-1_\markup { \teeny "10th pos." }  % root

  b\2-3
  c\2-4

  d\1-1
  e\1-3
  fis\1-1_\markup { \teeny "14th pos." }
  gis\1-3

  \tweak color \root_color
  a\1-4  % root; start descending.
  \mark "A natural minor"
  g\1-2
  f\1-4
  e\1-3
  d\1-1_\markup { \teeny "10th pos." }

  c\2-4
  b\2-3
  \tweak color \root_color
  a\2-1   % root

  g\3-3
  f\3-1
  e\3-3
  d\3-1_\markup { \teeny "7th pos." }

  c\4-4
  b\4-3
  \tweak color \root_color
  a\4-1   % root

  g\5-4
  f\5-2
  e\5-1

  d\6-4
  c\6-4_\markup { \teeny "5th pos." }
  b\6-3
  \tweak color \root_color
  a\6-1   % root

  \repeat volta 1 { }
}

\new StaffGroup  <<
  \new Staff {
    \clef "treble_8" << \scales >>
  }
  \new TabStaff \with {
    \tabFullNotation
    \clef moderntab
    stringTunings = #guitar-tuning
  }
  \scales
>>


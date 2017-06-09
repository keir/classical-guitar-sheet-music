% Author: mierle@gmail.com (Keir Mierle)

\version "2.18.2"
\header {
  title = "Diatonic key study of G major & E minor"
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
  \key g \major

  % G major.
  \tweak color \root_color
  g\6-2_\markup { \teeny "2nd pos." }  % root
  \mark "G major"
  a\6-4

  b\5-1
  c\5-2
  d\5-4

  e\4-1
  fis\4-3 
  \tweak color \root_color
  g\4-1_\markup { \teeny "5th pos." }  % root

  a\3-1
  b\3-3
  c\3-1
  d\3-3

  e\2-1
  fis\2-3
  \tweak color \root_color
  g\2-4  % root

  a\1-1
  b\1-3
  c\1-1_\markup { \teeny "8th pos." }
  d\1-3
  e\1-1_\markup { \teeny "12th pos." }
  fis\1-3

  \tweak color \root_color
  g\1-4 % root; start descending.

  fis\1-3
  e\1-1
  d\1-4_\markup { \teeny "7th pos." }
  c\1-2
  b\1-1

  a\2-4 % Note: This 4th finger choice was guessed.
  \tweak color \root_color
  g\2-2  % root
  fis\2-1

  e\3-3
  d\3-1

  c\4-4
  b\4-3
  a\4-1

  \tweak color \root_color
  g\5-4  % root
  fis\5-3
  e\5-1
  d\5-4_\markup { \teeny "2nd pos." }
  c\5-2
  b\5-1

  a\6-4
  \tweak color \root_color
  g\6-2

  \repeat volta 1 { }
  \set Score.doubleRepeatType = #":|.|:"

  % E minor
  \tweak color \root_color
  e\6-0_\markup { \teeny "2nd pos." }   % root
  \mark "E melodic minor"
  fis\6-2
  g\6-3
  a\6-4

  b\5-1
  cis\5-3
  dis\5-3_\markup { \teeny "4th pos." }   % root
  \tweak color \root_color
  e\5-4  % root

  f\4-1
  g\4-2
  a\4-4
  b\4-2_\markup { \teeny "8th pos." }
  cis\4-4

  dis\3-1
  e\3-2
  fis\3-4

  g\2-1
  a\2-3
  b\2-2_\markup { \teeny "11th pos." }

  cis\2-4

  dis\1-1
  \tweak color \root_color
  e\1-2  % root; start descending.
  \mark "E natural minor"

  d\1-4_\markup { \teeny "7th pos." }
  c\1-2
  b\1-1

  a\2-4
  g\2-2
  f\2-1

  \tweak color \root_color
  e\3-3  % root
  d\3-1

  c\4-4
  b\4-3
  a\4-1

  g\5-4
  fis\5-3
  \tweak color \root_color
  e\5-1  % root
  d\5-4_\markup { \teeny "2nd pos." }
  c\5-2
  b\5-1

  a\6-4
  g\6-2
  fis\6-1  % root
  \tweak color \root_color
  e\6-0

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


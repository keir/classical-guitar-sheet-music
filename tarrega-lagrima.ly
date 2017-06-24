% Author: mierle@gmail.com (Keir Mierle)

\version "2.18.2"
\header {
  title = "Lagrima"
  arranger = "Engraved by Keir Mierle"
  composer = "Francisco Tárrega"
}

\paper {
  % Remove indent on first line.
  indent = 0
}

\layout {
  % Remove the fingering engraver for the main staff, since it is not necessary
  % with the strings already indicated on the tab notation below.
  \context {
    %\Voice
    %\remove New_fingering_engraver
  }
  % Default note spacing is too tight, so globally increase it.
  \context {
    \Score
    \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/48)
  }
}

music = \relative c' {
  \key e \major
  \time 3/4

  % Remember Lilypond needs the weird alternating voice order: highest, lowest,
  % second highest, second lowest, etc.
  <<
  { gis'4-4 a-4 b-4 }
  \\
  { e,,4 fis gis\4 }
  \\
  { c8\rest b c\rest b e\rest b }
  % { r8 b r8 b r8 b }
  >>

}

\new StaffGroup  <<
  \new Staff {
    \clef "treble_8" << \music >>
  }
  \new TabStaff \with {
    %\tabFullNotation
    \clef moderntab
    stringTunings = #guitar-tuning
  }
  \music
>>


set segment_separator \uE0B0
set right_arrow \uE0B1
set segment_separator_rev \uE0B2
set left_arrow \uE0B3

function __update_right_promt --on-event __update_right_promt
  commandline -f repaint
end

function fish_right_prompt
  set_color -b normal
  set_color blue
  echo -n " $segment_separator_rev"
  set_color -b blue
  set_color black
  echo -n " "(date +"%T")" "#$segment_separator_rev
  set_color -b normal
  set_color normal
end

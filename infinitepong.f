
(new x).
  ((new y).
    (on x send y).!(on y recv y).(on y send y).end
  | !(on x recv z).(on z send z).end);
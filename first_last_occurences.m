function [first, last] = first_last_occurences(A)
  first = [1, find(diff([A(1) A A(end)]))]
  last = [first_occurences(2:end) - 1, length(A)]

end


def verify_input_contains_only_integers(string)
  string.scan(/\D/).empty?
end

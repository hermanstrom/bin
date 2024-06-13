#!/bin/bash
#

# Code duplicate finder;
find_dups() {
  # Validate Code: Must be an integer between four and eight digits;
  [[ ! ${1} =~ ^[0-9]{4,8}$ ]] && {
    echo "Code must be an integer between 4 and 8 digits." 1>&2;
    exit 8; };

  # Validate Variant;
  [[ ${2} =~ ^-?[0-9]+$ ]] && [[ ${2} -ge 0 ]] && [[ ${2} -le $((2**${#1}-1)) ]] || {
    echo "Variant must be a decimal integer from zero to the highest binary value of ${#1} bits or specifically a decimal integer of $((2**${#1}-1))." 1>&2;
    exit 4; };

  # 1=code; 2=variant number;
  local c=${1}; local v=${2:-0};

  # Convert Variant to binary map;
  local bin=({0..1}{0..1}{0..1}{0..1}{0..1}{0..1}{0..1}{0..1}); b=${bin[${v}]};

  # Backward loop to iterate through the map;
  for ((i=0; i<${#c}; i++)); do
    # Check if binary digit is set, start code digit converter;
    [[ ${b:$((${#b}-${#c}+${i})):1} -eq 1 ]] && case ${c:${i}:1} in
      1) c="${c:0:${i}}2${c:$((i+1))}"; ;;
      2) c="${c:0:${i}}1${c:$((i+1))}"; ;;
      3) c="${c:0:${i}}4${c:$((i+1))}"; ;;
      4) c="${c:0:${i}}3${c:$((i+1))}"; ;;
      5) c="${c:0:${i}}6${c:$((i+1))}"; ;;
      6) c="${c:0:${i}}5${c:$((i+1))}"; ;;
      7) c="${c:0:${i}}8${c:$((i+1))}"; ;;
      8) c="${c:0:${i}}7${c:$((i+1))}"; ;;
      9) c="${c:0:${i}}0${c:$((i+1))}"; ;;
      0) c="${c:0:${i}}9${c:$((i+1))}"; ;;
    esac;
  done;

  # Return the converted code;
  echo -n ${c};
}

# Derive default code from the date;
c=${1:-$(date +%d%m)};

# Create a loop based on the length of the code in a binary fashion;
for ((i=0; i<$((2**${#c})); i++)); do echo -n "$(find_dups ${c} ${i}) "; done; echo;

exit 0;

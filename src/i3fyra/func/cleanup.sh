#!/bin/bash

cleanup() {

  ((_o[verbose])) && ERM "f ${FUNCNAME[0]}()"

  ((${#mark_vars[@]})) && varset

  [[ -n $_msgstring ]] \
    && >&2 i3-msg "$_qflag" "${_msgstring%;}"

  ((${#new_size[@]})) && {
    for k in "${!new_size[@]}"; do
      _sizestring+="[$k] ${new_size[$k]};"
    done
    i3-msg >&2 "${qflag:-}" "${_sizestring%;}"
  }
}

window.serialize = (f) ->
  return if not f or f.nodeName isnt "FORM"
  i = undefined
  j = undefined
  q = []
  i = f.elements.length - 1
  while i >= 0
    if f.elements[i].name is ""
      i = i - 1
      continue
    switch f.elements[i].nodeName
      when "INPUT"
        switch f.elements[i].type
          when "text", "hidden", "password", "button", "reset", "submit"
            q.push f.elements[i].name + "=" + encodeURIComponent(f.elements[i].value)
          when "checkbox", "radio"
            q.push f.elements[i].name + "=" + encodeURIComponent(f.elements[i].value)  if f.elements[i].checked
          when "file" then break
      when "TEXTAREA"
        q.push f.elements[i].name + "=" + encodeURIComponent(f.elements[i].value)
      when "SELECT"
        switch f.elements[i].type
          when "select-one"
            q.push f.elements[i].name + "=" + encodeURIComponent(f.elements[i].value)
          when "select-multiple"
            j = f.elements[i].options.length - 1
            while j >= 0
              q.push f.elements[i].name + "=" + encodeURIComponent(f.elements[i].options[j].value)  if f.elements[i].options[j].selected
              j = j - 1
      when "BUTTON"
        switch f.elements[i].type
          when "reset", "submit", "button"
            q.push f.elements[i].name + "=" + encodeURIComponent(f.elements[i].value)
    i = i - 1
  q.join "&"


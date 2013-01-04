window.serialize = (form) ->
  return if not form or form.nodeName isnt "FORM"
  i = undefined
  j = undefined
  q = []
  i = form.elements.length - 1
  while i >= 0
    if form.elements[i].name is ""
      i = i - 1
      continue
    switch form.elements[i].nodeName
      when "INPUT"
        switch form.elements[i].type
          when "text", "hidden", "password", "button", "reset", "submit"
            q.push form.elements[i].name + "=" + encodeURIComponent(form.elements[i].value)
          when "checkbox", "radio"
            q.push form.elements[i].name + "=" + encodeURIComponent(form.elements[i].value)  if form.elements[i].checked
          when "file" then break
      when "TEXTAREA"
        q.push form.elements[i].name + "=" + encodeURIComponent(form.elements[i].value)
      when "SELECT"
        switch form.elements[i].type
          when "select-one"
            q.push form.elements[i].name + "=" + encodeURIComponent(form.elements[i].value)
          when "select-multiple"
            j = form.elements[i].options.length - 1
            while j >= 0
              q.push form.elements[i].name + "=" + encodeURIComponent(form.elements[i].options[j].value)  if form.elements[i].options[j].selected
              j = j - 1
      when "BUTTON"
        switch form.elements[i].type
          when "reset", "submit", "button"
            q.push form.elements[i].name + "=" + encodeURIComponent(form.elements[i].value)
    i = i - 1
  q.join "&"


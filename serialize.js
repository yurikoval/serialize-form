window.serialize = function(form) {
  var i, j, q;
  if (!form || form.nodeName !== "FORM") {
    return;
  }
  i = void 0;
  j = void 0;
  q = [];
  i = form.elements.length - 1;
  while (i >= 0) {
    if (form.elements[i].name === "") {
      i = i - 1;
      continue;
    }
    switch (form.elements[i].nodeName) {
      case "INPUT":
        switch (form.elements[i].type) {
          case "text":
          case "hidden":
          case "password":
          case "button":
          case "reset":
          case "submit":
            q.push(form.elements[i].name + "=" + encodeURIComponent(form.elements[i].value));
            break;
          case "checkbox":
          case "radio":
            if (form.elements[i].checked) {
              q.push(form.elements[i].name + "=" + encodeURIComponent(form.elements[i].value));
            }
            break;
          case "file":
            break;
        }
        break;
      case "TEXTAREA":
        q.push(form.elements[i].name + "=" + encodeURIComponent(form.elements[i].value));
        break;
      case "SELECT":
        switch (form.elements[i].type) {
          case "select-one":
            q.push(form.elements[i].name + "=" + encodeURIComponent(form.elements[i].value));
            break;
          case "select-multiple":
            j = form.elements[i].options.length - 1;
            while (j >= 0) {
              if (form.elements[i].options[j].selected) {
                q.push(form.elements[i].name + "=" + encodeURIComponent(form.elements[i].options[j].value));
              }
              j = j - 1;
            }
        }
        break;
      case "BUTTON":
        switch (form.elements[i].type) {
          case "reset":
          case "submit":
          case "button":
            q.push(form.elements[i].name + "=" + encodeURIComponent(form.elements[i].value));
        }
    }
    i = i - 1;
  }
  return q.join("&");
};

Port to CoffeeScript from [http://code.google.com/p/form-serialize/][adaptation] with bugfixes.

# Serialize HTML Form

## Download
- [CoffeeScript](https://raw.github.com/yurikoval/serialize-form/master/serialize.js.coffee)
- [Javascript](https://raw.github.com/yurikoval/serialize-form/master/serialize.js)
- [Minified](https://raw.github.com/yurikoval/serialize-form/master/serialize.min.js)
- [Packed](https://raw.github.com/yurikoval/serialize-form/master/serialize.packed.js)

```html
<form action="" method="get">
  <input type="text" name="fullname" value="James Bond" />
  <input type="text" name="email" value="email@example.com" />
</form>
```


```js
var form = document.getElementsByTagName('form')[0];
var serialized = serialize(form);
```

will become

```js
fullname=James%20Bond&email=email%40example.com
```
# Demo
[View Demo][demo]

 [adaptation]: http://code.google.com/p/form-serialize/
 [demo]: http://yurikoval.github.com/serialize-form/

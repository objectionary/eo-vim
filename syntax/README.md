## Highlight setting

You can change colors in syntax highlighting on your own by using `highlight` command in vim, for example:

```
:highlight Comment term=bold ctermfg=Cyan guifg=#80a0ff gui=bold
```

Here is the list of highlight groups and examples in code:

```
Group          | Example
-------------- | ---------------
Keyword        | @, &, $, ^
Comment        | #Here is comment
Number         | Ints and floats
String         | "Hello, world"
Boolean        | TRUE, FALSE and bytes literals
Todo           | TODO FIXME NOTE
DotName        | .plus .write .smth etc.
ObjectName     | All objects except abstract and dot-notation
AbstractName   | Abstact objects
Define         | alias package rt etc.
Statement      | +rt jvm org.eolang...
```

More information by `:highlight` and `:help 'highlight'`

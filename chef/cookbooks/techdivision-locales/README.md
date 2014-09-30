Chef Cookbook: Locales
======================
This simple cookbook allows for setting and generating locales for an Ubuntu or
Debian machine.

Requirements
------------
The recipe of this cookbook has only been tested with Ubuntu and Debian Wheezy. It relies on the
locale-gen command and the fact that supported locales are listed in
/var/lib/locales/supported.d/ or /etc/locale.gen respectively.

Attributes
----------
By setting attributes for your node you can define which locales should be generated.

#### techdivision-locales::default
<table>
	<tr>
		<th>Key</th>
		<th>Type</th>
		<th>Description</th>
		<th>Default</th>
	</tr>
	<tr>
		<td><tt>node['techdivision-locales']['locales']</tt></td>
		<td>Array</td>
		<td>A list of locales</td>
		<td><tt>default['techdivision-locales']['locales'] = [
		'en_US UTF-8', 'en_US.UTF-8 UTF-8', 'en_US ISO-8859-1',
		'de_DE UTF-8', 'de_DE.UTF-8 UTF-8', 'de_DE ISO-8859-1'
		]</tt></td>
	</tr>
</table>

Usage
-----
#### techdivision-locales::default

Just define the attributes and then include `techdivision-locales` in your node's
`run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[techdivision-locales]"
  ]
}
```

License and Author
------------------
Copyright (c) 2014 Robert Lemke, TechDivision GmbH

Permission is hereby granted, free of charge, to any person obtaining a copy of this
software and associated documentation files (the "Software"), to deal in the
Software without restriction, including without limitation the rights to use, copy,
modify, merge, publish, distribute, sublicense, and/or sell copies of the Software,
and to permit persons to whom the Software is furnished to do so, subject to the
following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF
CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE
OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

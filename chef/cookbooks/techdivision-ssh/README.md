Chef Cookbook: SSH
======================
This simple cookbook allows for setting authorized keys to a server's SSH configuration.

Requirements
------------
The recipe of this cookbook has only been tested with Debian and Ubuntu but should work with
most other systems.

Usage
-----
### LWRP

Use the LWRP `techdivision_ssh_authorized_keys_entry` to append an entry for the
specified host in `{user}/.ssh/authorized_keys`. For example:

```ruby
techdivision_ssh_authorized_keys_entry "john@example.com" do
  key "ssh-rsa AAAAB3Nza11C1yc2EAAAADAQABAAABAQDxZFQmywH5HT55fKiqkSJZ45HPLzdN8inGWsp0tAljb7r/mvQGV/xWqO4Ixy3WZs6OXJLIEufpjFtp3cCSRBw3f0dW3QiiAmABSQBkP/JGjOxdpHPKh7fPaEbuzDIJYME/wc1MoMkRyoAGyDfBM6oBhvCCmkSpIoFnzbwiHMzwOKcYUPWImCtqXF4fbl+xOtEnJfH1QVTwvDAhfeqZ7YzegT+mvWf80y+KqgvRbC1niL1O1VVx459AhfPRr4iaZcbh5nXyxhzRmTXQvXUiNgpCnfci+tsSSeZfBIiAXHhOA2sDL0+Ehl01fOQuQzxg65LIymtqMXh0iO++c5Bd53 john@example.net"
  user "root"
end
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

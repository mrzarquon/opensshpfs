opensshpfs
==========

This is a quick and dirty demonstration of Puppet's Packfile/File/Service management paradigm.

tests/centosonly.pp and tests/ubuntuonly.pp are meant to show everything in a single file, no templates, to be run locally via a puppet apply

tests/centostemplate.pp and tests/ubuntutemplate.pp are almost the same as above, except the sshd config file is stored as a template, with variables set in the file.

manifests/init.pp is the ubuntu template turned directly into a class to be applied in an ENC. It should break on a centos box.

manifests/generic.pp is a paramaterized class, where there is conditional logic in params.pp for a case selection of things like package name and service name

manifests/hiera.pp is the same as generic, except it changes the PermitRootLogin and PasswordAuthentication variables by hiera data. A stupid use of Hiera, but builds on the params work. Could just replace params entirely with it.

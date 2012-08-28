Description
===========
Definitions contains nxensite & nxdissite actions.

Requirements
============
Nginx root dir must be created.
Nginx sites-enables & sites-available must be created.

Attributes
==========

Usage
=====

nginx_site "some.conf" do
	action :enable
end

or

nginx_site "some.conf" do
	action :disable
end
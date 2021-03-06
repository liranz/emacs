About
=====

.. image:: https://secure.travis-ci.org/vmalloc/emacs.png
   :alt: Build Status


This is my revised and rewritten emacs setup. The goals I had for this is:

* As little configuration code as possible
* First-class support for emacs in-the-terminal (-nw)

Requirements
============
* Emacs 24

Installation
============
A daily snapshot of the repository, all dependencies included, can be `found here <http://rotemy.com/vmalloc_dot_emacs_dot_d.tgz>`_.

If you want to install from a git checkout, just clone into ~/.emacs.d, and update the submodules::

 git submodule update --init

You can write your own customizations in ~/.emacs-site.el. It is also recommended that you set your favorite font and theme in that file.

Suggestions/Improvements/Feedback?
==================================
Feel free to issue a pull request at http://github.com/vmalloc/emacs, I promise I will take care of every single one.

Credit and Thanks
=================
Many special thanks go to `r-darwish <https://github.com/r-darwish>`_ for many awesome pull requests and bug reporting.

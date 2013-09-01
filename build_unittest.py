#!/usr/bin/python
#
# build_unittest.py
# We were all influenced by Brando's early movies. - Dennis Hopper
#
# abstract: create test class from template
#
#TODO allow user to select the path from which templates and configs should be read
#TODO read directories from config file
#TODO support these languages: JavaScript, Ruby, Perl
#TODO allow it to either gen files or to return the string (helpful in vim)
#TODO do we really need a config file?
#TODO checking that templates exist
#
import os
import string
import sys
from time import strftime

import logging
from ConfigParser import ConfigParser

SUPPORTED_LANGUAGES = ('python', 'html', 'php', 'java', 'ruby')
NOT_SUPPORTED_WARNING = "!! Sorry, file write is not yet supported for %s. Check later !!"

logging.basicConfig(
    #filename ="/tmp/python.log",
    format="%(levelname)-10s %(asctime)s %(filename)s %(lineno)d %(message)s",
    level=logging.ERROR
)
log = logging.getLogger(sys.argv[0])

class Codebuilder(object):
    """Class that has methods for building classes and tests from template
    files. Future implentations give you choose btwn writing files vs just echoing
    a string."""

    def __init__(self, classname, abstract, lang):
        #populate the template vars
        now = strftime("%Y-%m-%d %H:%M:%S")
        self.data = { 'classname': classname, 
                 'abstract': abstract,
                 'now'    : now,
                 'lc_class' : classname.lower() 
                 }
        self.language = lang
        self.templates = {}

    def set_template_path(self, template_path):
        self.template_dir = template_path
        self.set_template_names()

    def set_template_names(self):
        """Build the set of template paths """
        self.templates['test'] = "%s/%s.test.template" % (self.template_dir, self.language)
        self.templates['class'] = "%s/%s.class.template" % (self.template_dir, self.language)
        log.debug("class template path is %s" % self.templates['class'])

    def set_template_type(self, type):
        self.type = type

    def get_code(self):
        """Echo the code"""
        try:
            template_file = open(self.templates[self.type], 'r')
            template_str = template_file.read()
            template = string.Template(template_str)
        except IOError:
            print "cannot read file %s into string" % template

        try:
            sys.stdout.write(template.safe_substitute(self.data))
        except KeyError:
            print "Key error, keys are %s" % ', '.join(self.data.keys())

if __name__ == '__main__':

    if len(sys.argv) != 5:
        sys.stderr.write("Usage: classname abstract type language\n")
        raise SystemExit(1)

    #grab the classname, where, why, and what
    classname = sys.argv[1]
    abstract  = sys.argv[2]
    type      = sys.argv[3]
    language  = sys.argv[4]
    try:
        mode = sys.argv[5]      # file mode makes a file; stream mode echoes 
    except IndexError:
        mode = 'stream'         #as of now, optional

    if language not in SUPPORTED_LANGUAGES:
        sys.stderr.write("Sorry, language '%s' is not supported\n" % language);
        raise SystemExit(1)

    #read basic config
    cfg = ConfigParser({})
    log.debug("the path is %s and when we split it's %s" % (sys.path[0], os.path.split(sys.path[0])))

    #read the config vars
    inifile = os.path.join(os.path.abspath(sys.path[0]), 'template.cfg') 
    cfg.read(inifile)
    basedir = cfg.get('basic','basedir')
    templates = cfg.get('basic', 'templates')

    one_level_up = os.path.split(sys.path[0])[0]
    templates = os.path.join(one_level_up, templates)
    log.debug("templates path is %s" % templates)

    builder = Codebuilder(classname, abstract, language)
    builder.set_template_path(templates)
    builder.set_template_type(type)
    #echo
    if mode == 'stream':
        builder.get_code()
    else:
        print "%s" % NOT_SUPPORTED_WARNING % str(mode)

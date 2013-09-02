#!/usr/bin/python
#
# echoes test class or unit test class from template;
# very helpful in vim
#
# TODO support JavaScript
# TODO support commandline scripts (Python, Ruby, bash)

import os
import string
import sys
from time import strftime
import logging
from ConfigParser import ConfigParser

SUPPORTED_LANGUAGES = ('python', 'html', 'php', 'java', 'ruby')


logging.basicConfig(
    format="%(levelname)-10s %(asctime)s %(filename)s %(lineno)d %(message)s",
    level=logging.ERROR
)
log = logging.getLogger(sys.argv[0])


def get_template_path():
    cfg = ConfigParser({})
    inifile = os.path.join(os.path.abspath(sys.path[0]), 'template.cfg')
    cfg.read(inifile)
    return cfg.get('basic', 'templates')


class Codebuilder(object):
    """
    Codebuilder echoes class and test code,
    compiled from templates.
    """

    def __init__(self, classname, abstract, lang):
        """Populate template vars"""
        now = strftime("%Y-%m-%d %H:%M:%S")
        self.data = {'classname': classname,
                     'abstract': abstract,
                     'now': now,
                     'lc_class': classname.lower()}
        self.language = lang
        self.templates = {}

    def set_template_path(self, template_path):
        self.template_dir = template_path
        self.set_template_names()

    def set_template_names(self):
        """Build the set of template paths """
        self.templates['test'] = self._test_template(self.template_dir,
                                                     self.language)

        self.templates['class'] = self._class_template(self.template_dir,
                                                       self.language)

    def set_template_type(self, type):
        self.type = type

    def get_code(self):
        """Echo the code"""
        template = None
        try:
            template_file = open(self.templates[self.type], 'r')
            template_str = template_file.read()
            template = string.Template(template_str)
        except IOError:
            errstring = "Error: cannot turn file {0} into string"
            print errstring.format(self.templates[self.type])
        try:
            sys.stdout.write(template.safe_substitute(self.data))
        except KeyError:
            errstring = "Error: check your keys: {0}"
            print errstring.format(', '.join(self.data.keys()))
        except AttributeError:
            errstring = "Error: Could not build template from file {0}"
            print errstring.format(self.templates[self.type])

    def _test_template(self, template_dir, language):
        return "{0}/{1}.test.template".format(template_dir, language)

    def _class_template(self, template_dir, language):
        return "{0}/{1}.class.template".format(template_dir, language)


if __name__ == '__main__':

    if len(sys.argv) != 5:
        sys.stderr.write("Usage: classname abstract type language\n")
        raise SystemExit(1)

    classname = sys.argv[1]
    abstract = sys.argv[2]
    type = sys.argv[3]
    language = sys.argv[4]

    if language not in SUPPORTED_LANGUAGES:
        sys.stderr.write("Sorry, language '%s' is not supported\n" % language)
        raise SystemExit(1)

    templates = get_template_path()

    builder = Codebuilder(classname, abstract, language)
    builder.set_template_path(templates)
    builder.set_template_type(type)

    builder.get_code()

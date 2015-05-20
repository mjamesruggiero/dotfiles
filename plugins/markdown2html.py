try:
    import markdown
    import vim
    import string

    html = string.join(vim.current.buffer, "\n")
    html = markdown.markdown(html, output_format='html5')

    filename = "{n}.html".format(n=vim.current.buffer.name)

    f = open(filename, 'w')
    f.write(html)
    f.close()

    print("HTML output written to {f}".format(f=filename))

except ImportError, e:
    print "Markdown package not installed, please run: pip install markdown"

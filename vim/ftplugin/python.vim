" Indentation
setlocal tabstop=4 expandtab shiftwidth=4 softtabstop=4
setlocal autoindent nosmartindent cinwords=if,elif,else,for,while,with,try,except,finally,def,class

" Auto-complete
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
python setlocal omnifunc=RopeCompleteFunc
let g:pep8_args = "--ignore=E501,W191"
"autocmd BufWritePost *.py call Pep8()

" Add the virtualenv's site-packages to vim path
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin', 'activate_this.py')
    try:
        execfile(activate_this, dict(__file__=activate_this))
    except:
        print "ERROR activating virtualenv's '%s'. VIRTUAL_ENV is '%s'."%(activate_this, project_base_dir,)
EOF

let $DJANGO_SETTINGS_MODULE='settings'

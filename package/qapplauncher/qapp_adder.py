import os
import sys
import ConfigParser

target_dir = sys.argv[1]
settings_path = sys.argv[2]
app_path = sys.argv[3]

if not os.path.exists(target_dir):
    raise Exception('target_dir:%s does not exist.' % target_dir)

app_full_path = os.path.join(target_dir, app_path[1:])

if not os.path.exists(app_full_path):
    raise Exception('app_path:%s does not exist.' % app_path)

settings_path = os.path.join(target_dir, settings_path[1:])

if not os.path.exists(settings_path):
    raise Exception('settings_path: %s does not exist.', settings_path)

cfg = ConfigParser.ConfigParser()
cfg.optionxform=str
cfg.readfp(open(settings_path))

app_base = 'app'
app_new = 'app0'

if not cfg.has_section('launchButtonPaths'):
    cfg.add_section('launchButtonPaths')

if not cfg.has_section('launchButtonIconPaths'):
    cfg.add_section('launchButtonIconPaths')

not_found = True
app_list = cfg.options('launchButtonPaths')
app_cnt = 0
app_new = 'app0'

while not_found:
    app_new = '%s%s' % (app_base, app_cnt)
    app_cnt += 1
    print app_new
    for app in app_list:
        if app_new == app:
            break
    else:
        not_found = False

cfg.set('launchButtonPaths', app_new, app_path)

icon_path = os.path.join(os.path.dirname(app_path), 'logo.png')

if os.path.exists(os.path.join(os.path.dirname(app_full_path), 'logo.png')):
    cfg.set('launchButtonIconPaths', app_new, icon_path)

with open(settings_path, 'w') as cfile:
    cfg.write(cfile)

    

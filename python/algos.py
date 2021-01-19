import json

f = open('./app-config.json', 'r')
app_config = f.read()
app_config = json.loads(app_config)

app_config['background'] = '#333333'

# app_config.pop('background')

app_config = json.dumps(app_config, indent=4)

f = open('./app-config.json', 'w')
print(app_config, end='\n', file=f, flush=True)


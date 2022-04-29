import shlex
import subprocess
import json

cmd = 'curl -u "trupti45:9fNqHzpy9EooAfU5wqDW" -X POST "https://api-cloud.browserstack.com/app-automate/upload" -F ' \
      '"file=@/Users/sumods/Desktop/wazirx-test-automation-suite-master/Common/Keywords/WazirX-stage495.apk" '
args = shlex.split(cmd)
process = subprocess.Popen(args, shell=False, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
stdout, stderr = process.communicate()
response = json.loads(stdout.decode('utf-8'))
print(response)


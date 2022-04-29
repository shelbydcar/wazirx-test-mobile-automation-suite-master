__author__ = "Trupti Salvi"
__version__ = "1.0.1"
__maintainer__ = "Trupti Salvi"
__updatedFor__ = "Crowdfire"
__email__ = "trupti@crowdfireapp.com"


import sys, os, time, argparse, json, datetime
from subprocess import call, Popen, list2cmdline, STDOUT
from pprint import pprint
from tempfile import TemporaryFile 

parser = argparse.ArgumentParser()
parser.add_argument("-env", "--environment", choices=['LOCAL', 'SAUCE', 'REMOTE', 'BROWSERSTACK'],help="Select the environment to run test suite", default= 'LOCAL')
parser.add_argument("Testsuite",help="Path to the Alltest suite files")
parser.add_argument("-conf","--Configurator", help="Path to configurator JSon file")
args = parser.parse_args()
crs = open(args.Testsuite, "r")
columns = [raw.strip().split() for raw in crs]
crs.close()
columns = []
print (columns)
suite = ['Funds']
ts = time.time()

# TimeStamp Code to Create Timestamp Folder at Runtime
def folder_timestamp():
    global timestamp, rootdir
    timestamp = datetime.datetime.fromtimestamp(ts).strftime('%m-%d-%Y_%H-%M-%S-%p')
    rootdir = os.getcwd()    
folder_timestamp()

#--------------------------------------------For LOCAL Environment----------------------------------------------

if args.environment == 'LOCAL':
    print('------------------------------------------------\nUsing '+args.environment+' Environment\n-------------------------------------')
    for column in columns:
        output_dir = rootdir +'/Results/'+args.environment+'/'+timestamp
        report_file = str(column[0]) + '_Auto_Suite_report.html'
        log_file = str(column[0]) + '_Auto_Suite_log.html'
        xml_file = str(column[0]) + '_Auto_Suite_output.xml'
        #call('pybot.bat '+' -i '+ str(column) +' --variable '+' Login_Type:'+args.environment+' -d '+ output_dir+' -o '+xml_file+' -l '+ log_file+' -r '+ report_file+ rootdir)
        # print 'pybot'+' -i '+ str(column) +' --variable '+' Login_Type:'+args.environment
        # print "pybot -i " + str(column[0]) + " --variable Login_Type:" + args.environment + "-d " + output_dir + "-o " + xml_file + " -l " + log_file + " -r "+ report_file + " -s " + rootdir + "/*.txt"
        os.system("pybot  --variable Login_Type:" + args.environment + "  -d " + output_dir + " -o " + xml_file + " -l " + log_file + " -r "+ report_file + " -i " + str(column[0]) + " " +rootdir + "/TestSuites/")
        #call('robot'+' -i '+ 'Smoke')

#--------------------------------------------For REMOTE Environment----------------------------------------------
elif args.environment == 'REMOTE':
    # print '------------------------------------------------\nUsing '+args.environment+' Environment\n-------------------------------------'
    json_data=open(args.Configurator)
    data = json.load(json_data)
    json_data.close()
    JasonConfig=list(data["testfiles"])
    for configIteraor in JasonConfig:
        Command_Executor = 'http:'+configIteraor["Remote url"]
        report_file = 'Auto_Suite_report.html'
        log_file = 'Auto_Suite_log.html'
        xml_file = 'Auto_Suite_output.xml'
        #output_dir = '.\Results\\'+args.environment+'\\'+timestamp+'\\'+configIteraor["DESIRED_CAPABILITIES"]["name"]
        output_dir = '.\Results\\'+args.environment+'\\'+timestamp
        RunCommand = ['pybot.bat','--variable','REMOTE_URL:'+Command_Executor,'--variable','Login_Type:'+args.environment, '-d', output_dir, '-r', report_file, '-l', log_file, '-o', xml_file,rootdir]
        for column in columns:
            RunCommand[1:1] = ['-i',column[0]]
        call(RunCommand)

#-------------------------------------------For BrowserStack Environment----------------------------
elif args.environment == 'BROWSERSTACK':   
    print ('------------------------------------------------\nUsing '+args.environment+' Environment\n-------------------------------------')
    json_data=open(args.Configurator)
    data = json.load(json_data)
    json_data.close()
    JasonConfig=list(data["testfiles"])
    for configIteraor in JasonConfig:
        Command_Executor = 'http://'+configIteraor["Username"]+configIteraor["Separator1"]+configIteraor["Access_key"]+configIteraor["Separator2"]+configIteraor["Remote url"]
        # Desired_Capabilities = 'browser:'+configIteraor["DESIRED_CAPABILITIES"]["browser"]+','+'browser_version:'+configIteraor["DESIRED_CAPABILITIES"]["browser_version"]+','+'os:'+configIteraor["DESIRED_CAPABILITIES"]["os"]+','+'os_version:'+configIteraor["DESIRED_CAPABILITIES"]["os_version"]+','+'browserstack.local:'+configIteraor["DESIRED_CAPABILITIES"]["browserstack.local"]
        report_file = configIteraor["DESIRED_CAPABILITIES"]["name"]+'Auto_Suite_report.html'
        log_file = configIteraor["DESIRED_CAPABILITIES"]["name"]+'Auto_Suite_log.html'
        xml_file = configIteraor["DESIRED_CAPABILITIES"]["name"]+'Auto_Suite_output.xml'
        #output_dir = '.\Results\\'+args.environment+'\\'+timestamp+'\\'+configIteraor["DESIRED_CAPABILITIES"]["name"]
        output_dir = rootdir +'/Results/'+args.environment+'/'+timestamp
        #RunCommand = ['pybot.bat','--variable','COMMAND_EXECUTOR:'+Command_Executor, '--variable','DESIRED_CAPABILITIES:'+Desired_Capabilities,'--variable','Login_Type:'+args.environment,'-d',output_dir, '-N', configIteraor["DESIRED_CAPABILITIES"]["name"],'-r', report_file, '-l', log_file, '-o', xml_file,rootdir]
        #RunCommand = "pybot  --variable Login_Type:" + args.environment + " --variable COMMAND_EXECUTOR:'" +  Command_Executor +"' --variable DESIRED_CAPABILITIES:'" + Desired_Capabilities +"' -N " + configIteraor["DESIRED_CAPABILITIES"]["name"] + " -d " + output_dir + " -o " + xml_file + " -l " + log_file + " -r "+ report_file + " -i " + str(columns[0][0]) + " " +rootdir + "/TestSuites/"
        RunCommand = "robot --variable BrowserStackDeviceName:'" + configIteraor["DESIRED_CAPABILITIES"]["DeviceName"] + "' -d " + output_dir + " -o " + xml_file + " -l " + log_file + " -r "+ report_file + " -s " + suite[0] + " " + rootdir + "/TestSuites/"

        #for column in columns:
         #   RunCommand[1:1] = ['-i',column[0]]
        # os.system(RunCommand)
        print("--------RunCommmand >> "+ RunCommand)
        call(RunCommand, shell=True)

#--------------------------------------------For SAUCE Environment----------------------------------			
else:
    print('------------------------------------------------\nUsing '+args.environment+' Environment\n-------------------------------------')
    json_data=open(args.Configurator)
    data = json.load(json_data)
    json_data.close()
    JasonConfig=list(data["testfiles"])
    for configIteraor in JasonConfig:
        #Command_Executor = 'http://'+configIteraor["Username"]+configIteraor["Separator1"]+configIteraor["Access_key"]+configIteraor["Separator2"]+configIteraor["Remote url"]
        Command_Executor = 'http://'+configIteraor["Remote url"]
        Desired_Capabilities = 'name:'+configIteraor["DESIRED_CAPABILITIES"]["name"]+','+'platformName:'+configIteraor["DESIRED_CAPABILITIES"]["platformName"]+','+'platformVersion:'+configIteraor["DESIRED_CAPABILITIES"]["platformVersion"]+','+'DeviceName:'+configIteraor["DESIRED_CAPABILITIES"]["DeviceName"]+','+'phoneOnly:'+configIteraor["DESIRED_CAPABILITIES"]["phoneOnly"]
        report_file = configIteraor["DESIRED_CAPABILITIES"]["name"]+'Auto_Suite_report.html'
        log_file = configIteraor["DESIRED_CAPABILITIES"]["name"]+'Auto_Suite_log.html'
        xml_file = configIteraor["DESIRED_CAPABILITIES"]["name"]+'Auto_Suite_output.xml'
        #output_dir = '.\Results\\'+args.environment+'\\'+timestamp+'\\'+configIteraor["DESIRED_CAPABILITIES"]["name"]
        output_dir = rootdir +'/Results/'+args.environment+'/'+timestamp
        #RunCommand = ['pybot.bat','--variable','COMMAND_EXECUTOR:'+Command_Executor, '--variable','DESIRED_CAPABILITIES:'+Desired_Capabilities,'--variable','Login_Type:'+args.environment,'-d',output_dir, '-N', configIteraor["DESIRED_CAPABILITIES"]["name"],'-r', report_file, '-l', log_file, '-o', xml_file,rootdir]
        RunCommand = "pybot  --variable Login_Type:" + args.environment + " --variable COMMAND_EXECUTOR:'" +  Command_Executor +"' --variable DESIRED_CAPABILITIES:'" + Desired_Capabilities +"' -N " + configIteraor["DESIRED_CAPABILITIES"]["name"] + " -d " + output_dir + " -o " + xml_file + " -l " + log_file + " -r "+ report_file + " -i " + str(columns[0][0]) + " " +rootdir + "/TestSuites/"
        #for column in columns:
         #   RunCommand[1:1] = ['-i',column[0]]
        # os.system(RunCommand)
        call(RunCommand, shell= True)
   
# Generating a Consolidated Report using 'REBOT'       
def consolidate_report():
    consolidatereport_dir = rootdir +'/Results/'+args.environment+'/'+timestamp
    #call(['rebot.bat', '-d', consolidatereport_dir,'--Report', 'CrowdFire_Summary Test Execution','-N','Consolidated Report','--ReportTitle','CrowdFire Test Execution Summary','--Log','_Test_Summary_Log', consolidatereport_dir+'\*.xml'])
    os.system("rebot -d " + consolidatereport_dir + " --Report CrowdFire_Summary_Test_ExecutionReport -N ConsolitatedReport --ReportTitle CrowdFire_TestExecutionSummary --Log Test_Summary_Log "+ consolidatereport_dir + "/*.xml")

consolidate_report()

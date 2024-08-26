# Continue VS Code Server 

The provided VS Code Server elements were modified and initially inspired by 
[OSC's Code Server setup.](https://github.com/OSC/bc_osc_codeserver). We appreciate 
all of the hard work this team has done. Without them, creating apps such as this 
would not be possible! 

## How does this work? 

All data is put in continue_data
- VS code extension 
- settings 


## Testing that submitted job 

To ensure that all elemets in submit.yml.erb were set correctly, one can use the 
following Slurm command: 
```
sacct -j 7446531 --format=jobid,jobname,cluster,account,partition,qos,timelimit,alloccpus,allocnodes,reservation,alloctres -p -X
```

./extensions/continue.continue-0.9.174/out/extension.js

init_completionProvider comment out init_onboarding();


## Things to note: 
- Welcome press skip 
- Converations should probably be deleted every so often 
- if they "delete" a model 
- Functionality, link to continue documentation 
    - tab autocomplete 
    - ^L
    - ^I
- mapping buttons (up and down arrows)

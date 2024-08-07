# So you want to deploy, huh? 

Alrighty. Let's do it! 

First let's talk about the structure of our Open OnDemand servers. These servers have symlinks to items in either
`/curc/admin/ood/development` or `/curc/admin/ood/production`. As you can tell by these folder 
names, one is meant for the development environment while the other is meant for production. Both 
of these directories are pointing to our [open_ondemand repo](https://github.com/ResearchComputing/open_ondemand) 
on GitHub. However, the folder `development` points to the `dev` branch while the folder `production` 
points to the `main` branch. This is the "best" solution I could think of, given we do not each have 
access to our own `ondemand-dev` server. Additionally, each ondemand server will need to symlink to the 
applications, thus, we need two different directories.

## Making changes 

To make changes on the production version of OOD, you should first create a branch of the `dev` branch 
in `/curc/admin/ood/development` e.g. 
```
cd /curc/admin/ood/development
git checkout -b add-deployment dev
```

You should then make your changes on this new branch (e.g. `add-deployment`). Once you are satisfied with the changes, 
you can then create a PR to the `dev` branch. 

Once we are ready to bring `dev` into `main`, we will then do a PR that merges the `dev` branch into `main`. We will then follow the steps in the section "Deploying to production server" below to deploy this new version of OOD on the production server. For steps on deploying to the development server, see the section "Deploying to development server" below.

## Deploying to development server

To make deploying the changes into development easy, I have created the script `deploy_development.sh`.
This script automates the following steps (and has safety checks): 
- Removes all symlinks in `/var/www/ood/apps/sys` 
- Creates a new symlink in `/var/www/ood/apps/sys` for each application in `/curc/admin/ood/development/apps`

The following steps should be performed: 
1. Go to the directory `/curc/admin/ood/development` and switch to the branch you want to use.
2. Make sure the branch you switched to is up-to-date e.g. do `git pull`, if 
necessary. 
3. Make sure the ICS Core Desktop application has the appropriate permissions:
```
sudo chgrp -R icsgrp /curc/admin/ood/development/apps/ics_desktop
sudo chmod -R o-r /curc/admin/ood/development/apps/ics_desktop
```
4. Jump onto `ondemand-dev`
5. Run the deploy script for the development server:
```
./deploy_development.sh 
```

## Deploying to production server

Finally, we are here! 

(In progress ...)

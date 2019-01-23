Role Name
=========

Installs NSclient++ on target hosts.
The installation is designed so that the local nsclient.ini does not contain any parameters, but rather points to a central config file.
The central config file is hosted on a file share in the network. All changes to this config file will affect all the nsclient installations


Requirements
------------

The file server that will store the central config and scripts must be placed in a group named 'nsclient-fileserver'
The nagios server must be placed in a group named 'monitoring-servers'

Role Variables
--------------
Variables that must be defined:
- nsclient_central_config_path
    Where is the centrally hosted nsclient.ini located on the file server (do not include file name in path)
- nsclient_port
    What port is to be used for the nsclient web server
- nsclient_user
    What user to connect to the folder with centrally hosted config and scripts
- nsclient_password
    Password for the above mentioned user
- nsclient_scripts_unc_path
    UNC path to the central config (not including the file name)
- nsclient_query_password
    Password that nagios will use when querying nsclient

Dependencies
------------



Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: username.rolename, x: 42 }

License
-------

BSD

Author Information
------------------

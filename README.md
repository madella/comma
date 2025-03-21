# Comma

Embrace the power of simplicity
```                      
               ,,,,,,,,,,           
            ,,,,,,,,,,,,,,,        
           ,,,,,,,,,,,,,,,,,       
           ,,,,,,,,,,,,,,,,,,       
           ,,,,,,,,,,,,,,,,,,       
           ,,,,,,,,,,,,,,,,,,       
             ,,,,,,,,,,,,,,,       
               ,,,,,,,,,,,,       
                   ,,,,,,        
                    ,,,,         
                    ,,,          
                   ,,,           
                 ,,,             
               ,,,               

```

## Overview
Comma is a simple command-line utility that allows users to execute commands with elevated privileges using a convenient alias.

## Installation
To install Comma, run the installation script provided in the `src` directory:

```bash
. src/install.sh
```

This will set up the necessary permissions and configurations for the command.

## Usage
Once installed, you can use the command `,` followed by any command you wish to run with `su` privileges. For example:

```bash
, apt update
```

This will execute `apt update` with elevated privileges.

## License
This project is licensed under the terms of the MIT License. See the LICENSE file for details.

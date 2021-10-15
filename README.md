## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

Cybersecurity_Projects/Diagrams

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the file may be used to install only certain pieces of it, such as Filebeat.

  - _Cybersecurity_Projects/Ansible_

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly reliable, as well as redistribute traffic on network as needed.
- Load balancing ensures reliability of a web application by restricting and redirecting traffic as needed based on load. If the Web-1 machine's load is too high, the load balancer can redirect traffic to Web-2. The Jump-Box Provisioner acts as a hub for the network. The main instance of Docker is run from this machine and thus Ansible is accessed via the Jump-Box. As such, an administrator is able to configure all other machines on the network through this central point._

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the network and system files.
- _Filebeat collects data and logs pertaining to the Apache webserver._
- _Metric beat collects performance data from the operating system and services._

The configuration details of each machine may be found below.
_Note: Use the [Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables) to add/remove values from the table_.

| Name                 | Function    | IP Address    | Operating System |
|----------------------|-------------|---------------|------------------|
| Jump-Box-Provisioner | Gateway     | 23.100.33.157 | Linux            |
| ELK                  | ELK Stack   | 13.89.229.72  | Linux            |
| Web-1                | Web Server  | 10.0.0.5      | Linux            |
| Web-2                | Web Server  | 10.0.0.6      | Linux            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump-Box-Provisioner machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- _67.189.39.32_

Machines within the network can only be accessed by the Jump-Box-Provsioner._

- _The Jump-Box-Provisioner can access the ELK server via internal IP of 10.0.0.4_

A summary of the access policies in place can be found in the table below.

| Name                 | Publicly Accessible | Allowed IP Addresses     |
|----------------------|---------------------|--------------------------|
| Jump-Box-Provisioner | Yes                 | 67.189.39.32             |
| ELK-Stack            | No                  | 10.0.0.0/16 67.189.39.32 |
| Web-1                | No                  | 10.0.0.4                 |
| Web-2                | No                  | 10.0.0.4                 |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
- _Automating through Ansible provides a great deal of efficiency. Multiple machines can be configured at one time. Additionally, new machines can be created and configured very quickly through the use of Ansible._

The playbook implements the following tasks:
- Installs Docker on the ELK machine
- Installs Python on the ELK machine
- Increases memory usage on the ELK machine
- Installs Docker pip module
- Configures Docker on the ELK machine
- Enables Docker launching on boot

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

!(Cybersecurity_Projects/Ansible)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- 10.0.0.5/10.0.0.6

We have installed the following Beats on these machines:
- _Filebeat and Metricbeat_

These Beats allow us to collect the following information from each machine:
- Metricbeat beats collects performance information pertaining to the operating system and services running. Filebeat records log data from specified files (such as Apache) and aggregates them. 

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Create a Filebeat and Metricbeat configuration file in the Ansible container.
- Update the configuration file to include the correct IP address for your web server(s) and the correct username/password.
- Run the playbook, and navigate to Filebeat installation page on Kibana to check that the installation worked as expected.

- _The Filebeat and Metricbeat files are filebeat-playbook.yml and metricbeat-playbook.yml respectively. They should be saved in /etc/ansible/files_
- The hosts file located in /etc/ansible must be updated in order to tell Ansible which hosts to update with a given playbook. Multiple hosts can be grouped together under one name (such as 'webserers' for Web-1 and Web-2). Once the hosts are set in the host file, Ansible playbooks require you to designate the specified host(s). 
- _Once all configurations are complete. Visit  http://yourelkstackip:5601. (http://13.89.229.72:5601 in my case specifically)._
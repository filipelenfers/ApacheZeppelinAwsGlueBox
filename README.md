# ApacheZeppelinAwsGlueBox
A vagrant file with Java and Zeppelin installed though provision, in the correct version, to use with `AWS Glue development endpoint`, as this tutorial needs: https://docs.aws.amazon.com/glue/latest/dg/dev-endpoint-tutorial-local-notebook.html. 

## Requirements

1. [Virtual](https://www.virtualbox.org/) box installed.
1. [Vagrant](https://www.vagrantup.com/) installed.

## Usage
You have two choises here:
 * You can clone this repository and let vagrant install everything through [provision](#running-the-vm-(Provision)), 
 * or you can use the [box already generated](#using-already-generated-vagrant-box).

### Running the VM (Provision)

1. Clone this repository.
1. Inside the cloned repository directory run `vagrant up`
1. Access the VM: `vagrant ssh`
1. Start Zeppelin: `startZeppelin`
1. Continue this tutorial: [https://docs.aws.amazon.com/glue/latest/dg/dev-endpoint-tutorial-local-notebook.html
](https://docs.aws.amazon.com/glue/latest/dg/dev-endpoint-tutorial-local-notebook.html) on the ***"Initiating SSH Port Forwarding to Connect to Your DevEndpoint"*** session. All the instalation and configturation of Apache Zeppelin is already done inside the VM. 
1. You can access Zeppelin on you host opening a browser and accessing the address `http://localhost:8080`.

### Using already generated vagrant box

1. Acces a directory where you want to start you VM.
1. Init vagrant: `vagrant init filipelenfers/zeppelinGlue`
1. Start the VM: `vagrant up`
1. Access the VM: `vagrant ssh`
1. Start Zeppelin: `startZeppelin`
1. Continue this tutorial: [https://docs.aws.amazon.com/glue/latest/dg/dev-endpoint-tutorial-local-notebook.html
](https://docs.aws.amazon.com/glue/latest/dg/dev-endpoint-tutorial-local-notebook.html) on the ***"Initiating SSH Port Forwarding to Connect to Your DevEndpoint"*** session. All the instalation and configturation of Apache Zeppelin is already done inside the VM. 
1. You can access Zeppelin on you host opening a browser and accessing the address `http://localhost:8080`.

Link to Vagrant Cloud: [https://app.vagrantup.com/filipelenfers/boxes/zeppelinGlue](https://app.vagrantup.com/filipelenfers/boxes/zeppelinGlue)
An embarrassingly parallel or pleasingly parallel problem is a part of parallel computing problem, where there is almost no effort needed to separate the problem into number of parallel tasks.

Work Stealing is a very popular approach for distributing work across various workers in an embarrassingly parallel distributed computing problem. In this, the manager does not assign tasks to the workers by directly sending the task to them. The manager creates tasks and keeps it in a task or job queue. The workers on the other hand have to keep polling the queue to get the tasks from it. care has to be taken while fetching tasks from the task queue as multiple workers can pick a task at the same time. So there must be synchronisation between the workers while they pick the tasks from the task queue. It is very helpful in situation where the processing time of different worker nodes is not same which is the case with almost every distributed process.

The embarrassingly parallel distributed computing problem that has been considered here is to find the overall complexity project. The complexity of the project is calculated based on the number of lines of code present in the project. The experiment consists of a set of worker nodes which completes the given task and a single manager node which creates tasks for the workers and gets the result from them and acts on that task. The manager first reads a file containing the list of all the paths to files which contain code. These files are then distributed among the worker nodes to calculate the complexity. Each worker node finds the complexity of the individual file that to gets based on the lines of code present and sends back the result to the manager. The manager after receiving the responses for all the assigned tasks calculates the overall complexity of the project by adding the responses of all the worker nodes.

Due to the advantages Work Stealing Approach over Static Load Balancing approach, the embarrassingly parallel distributed computing problem which has been considered is solved using Work Stealing Approach. For the experiment, 10000 files containing code are considered. The experiment is performed to calculate the time of execution of manager process for varying number of worker processes. The experiment is performed for the entire distributed system running on both single and multiple machines.


To use, build and do somethign like the following to start some clients:

```
stack exec mapred-haskell-exe worker localhost 8000 &
stack exec mapred-haskell-exe worker localhost 8001 &
stack exec mapred-haskell-exe worker localhost 8002 &
stack exec mapred-haskell-exe worker localhost 8003 &
```
Or alternative, a docker-compose.yml file is provided that supports the launching of a set of workers:

```
docker-compose up
```

And then start the manager as follows:

```
stack exec mapred-haskell-exe manager localhost 8005 filepath
```

You will see console output of this form from from the manager node:

```
Starting Node as Manager
[Manager] Workers spawned
1376
```

and console output of this form from the worker nodes:

```
[Node pid://localhost:8000:0:12] given work: "/Users/xyz/Documents/TestHaskellProject/use-cloudhaskell/src/Lib.hs"
[Node pid://localhost:8000:0:12] finished work.
Terminating node: pid://localhost:8000:0:12
```


To understand the ouput, consult the code.

__Docker-Compose__

The basic architecture of the work stealing pattern has a manager node as a central component surrounded by a set of
worker nodes. Each worker node is presumed to execute on a different node such that the total computational capacity of
the worker node set are available to us to deliver processing. 

Launching worker nodes individually is inconvenient and so I have added a `docker-compose.yml` file to the project. To
launch a set of worker nodes, run:

```
docker-compose up
```

One may now launch a manager node to passwork for these nodes:

``` 
stack exec mapred-haskell-exe manager localhost 8085 filepath
```

where the final parameter is the size of the number range (see the code to see the specifics on what the project is calculating). Note that when you execute the system in this way you will not see console output from the worker nodes as the worker function has not been written to gather output to the console.

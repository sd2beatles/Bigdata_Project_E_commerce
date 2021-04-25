:<<'END'
Here,we provide a configuration file, describing a single ndoe flume deployment. If you want to obtain a further information on how each configuaration is made.
Please visit the website,https://flume.apache.org/FlumeUserGuide.html 
END


# Define source,channel,and sinks
SmartCar_Agent.sources=SmartCarInfo_SpoolSource
SmartCar_Agent.channels=SmartCarInfo_Channel
SmartCar_Agent.sinks=SmartCarInfo_LoggerSink

# placing files to be ingested into a 'spooling'  directory on disk. Specify the directory from which to read files
SmartCar_Agent.sources.SmartCarInfo_SpoolSource.type=spooldir
SmartCar_Agent.sources.SmartCarInfo_SpoolSource.spoolDir=/home/pilot/working/car-batch-log
#specify when to delete completed files. Two options are available, either 'never' or 'immediate'.
SmartCar_Agent.sources.SmartCarInfo_SpoolSoure.deletePolicy=immediate
SmartCar_Agent.sources.SmartCarInfo_SpoolSource.pollDelay=5000
#Granuality at which to batch trasfer to the channel
SmartCar_Agent.sources.SmartCarInfo_SpoolSource.batchSize=1000

#use a source channel which buffers events in memory
SmartCar_Agent.channels.SmartCarInfo_Channel.type=memory
SmartCar_Agent.Channels.SmartCarInfo_Channel.capacity=100000
SmartCar_Agent.Channels.SmartCarInfo_Chaneel.transactionalCapacity=10000



:<<'END'
If  your data pipeline is broken for some reasons, w
END

#use a sink channel 









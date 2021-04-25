:<<'END'
Here,we provide a configuration file, describing a single ndoe flume deployment. If you want to obtain a further information on how each configuaration is made.
Please visit the website,https://flume.apache.org/FlumeUserGuide.html 
END


# Define source,channel,and sinks
# Remember that we prepare multiple data flows in this agent, one of which deals with batch information and the other for real-time data
SmartCar_Agent.sources=SmartCarInfo_SpoolSource DriverCarInfo_TailSource
SmartCar_Agent.channels=SmartCarInfo_Channel DriverCarInfo_Channel
SmartCar_Agent.sinks=SmartCarInfo_LoggerSink DriverCarInfo_KafkaSink

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


#sinle-line data comes in,starting with 14 integer-digits.Anything contradicting to the format would be excluded
SmartCar_Agent.sources.SmartCarInfo_SpoolSource.interceptors.filterInterceptor.type=regex_filter
SmartCar_Agent.sources.SmartCarInfo_SpoolSource.interceptors.filterInterceptor.regex=^//d{14}
SmartCar_Agent.sources.SmartCarInfo_SpoolSource.interceptors.filterInterceptor.excludeEvent=false

SmartCar_Agent.sources.DriverCarInfo_TailSource.interceptors.filterInterceptor.type=regex_filter
SmartCar_Agent.sources.DriverCarInfo_TailSource.interceptors.filterInterceptor.regex=^//d{14}
SmartCar_Agent.sources.DriverCarInfo_TailSource.interceptors.filterInterceptor.excludeEvent=false


#If  your data pipeline is broken for some reasons, flume gives you some clues for debugging problems.
#To obtain some guidelines for debugging,set up an memoery channel connected to a logger sink,which output 
#all event data to the Flumne logs.
SmartCar_Agent.sinks.SmartCarInfo_LoggerSink.type=logger





#bind sources and sinks to channels
SmartCar_Agent.sources.SmartCarInfo_SpoolSource.channels=SmartCarInfo_Channel
SmartCar_Agent.sinks.SmartCarInfo_LoggerSink.channel=SmartCarInfo_Channel

#‘shell’ config is used to invoke the ‘command’ through a command shell
SmartCar_Agent.sources.DriverCarInfo_TailSource.type=exec
SmartCar_Agent.sources.DriverCarInfo_TailSource.command=tail -F /home/pilot-pjt/working/driver-realtime-log/SmartCarDriverInfo.log
SmartCar_Agent.sources.DriverCarInfo_TailSoure.restart=true
SmartCar_Agent.sources.DriverCarInfo_TailSource.batchSize=1000


#configuration for kakfka sink
SmartCar_Agent.sinks.DriverCarInfo_KafkaSink.type=org.apache.flume.sink.kafka.KafkaSink
SmartCar_Agent.sinks.DriverCarInfo_KafkaSink.topic=SmartCar-Topic
SmatrCar_Agent.sinks.DriverCarInfo_KafkaSink.requiredAcks=1
SmartCar_Agent.sinks.DriverCarInfo_KafkaSink.batchSize=1000

#use a source channel which buffers events in memory
SmartCar_Agent.channels.DriverCarInfo_Channel.type=memory
SmartCar_Agent.channels.DriverCarInfo_Channel.capacity=100000
SmartCar_Agent.channels.DriverCarInfo_Channle.transactionCapacity=10000


#bind sources and sinks to channels
SmartCar_Agent.sources.DriverCarInfo_TailSource.channels=DriverCarInfo_Channel
SmartCar_Agent.sinks.DriverCarInfo_KafkaSink.channel=DriverCarInfo_Channel 














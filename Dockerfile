# Extend vert.x image
FROM vertx/vertx3


#                                                       
ENV VERTICLE_NAME br.ufba.dcc.wiser.soft_iot.mapping_devices.controller.ControllerImpl
ENV VERTICLE_FILE /target/reactive-iot-mapping-devices-1.0.0-SNAPSHOT.jar

# Set the location of the verticles
ENV VERTICLE_HOME /home/cleberlira/NetBeansProjects/reactive-iot-mapping-devices/

#/home/cleberlira/NetBeansProjects/reactive-iot-mapping-devices/src/main/java/br/ufba/dcc/wiser/soft_iot/mapping_devices/#controller

EXPOSE 8080

# Copy your verticle to the container                   
COPY $VERTICLE_FILE $VERTICLE_HOME/

# Launch the verticle
WORKDIR $VERTICLE_HOME
ENTRYPOINT ["sh", "-c"]
CMD ["exec vertx run $VERTICLE_NAME -cp $VERTICLE_HOME/*"]


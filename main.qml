import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.4
import QMQTT 1.0


ApplicationWindow {
    visible: true
    width: 480
    height: 360
    title: qsTr("Thermostat")
//    visibility: "FullScreen"
    id: base
    property string groupId: "/group1"
    MQTTClient{
        id: qmqtt
        hostip: "192.168.0.164"
        subscribeTopic: base.groupId + "/#"

        property int messageCount: 0
        function send(topic, message){
            publishMsg(messageCount, base.groupId + topic, message)
            messageCount++
        }

        onNewMessage: {
            console.log(topic +": " + message)
            if (topic == base.groupId + "/temp/value"){
                base.temperature = parseInt(message)
                console.log("updating temp to " + message)
            }
            if (topic == base.groupId + "/humidity/value"){
                base.humidity = parseInt(message)
                console.log("updating humidity to " + message)
            }
        }
    }

    property double temperature: 20
    property double humidity: 50

    SwipeView{
        anchors.fill: parent

        NumericPage{
            temp: base.temperature
            humidity: base.humidity
            connectedIndicator: qmqtt.isConnected

        }

        VisualPage{
            temp: base.temperature
            humidity: base.humidity
            maxtemp.value: 25
            mintemp.value: 10
            maxtemp.onValueChanged: qmqtt.send("/temp/max", maxtemp.value.toFixed(2))
            mintemp.onValueChanged: qmqtt.send("/temp/min", mintemp.value.toFixed(2))
        }

    }


}

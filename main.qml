import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.4


ApplicationWindow {
    visible: true
    width: 480
    height: 360
    title: qsTr("Thermostat")
    id: base
    property double temperature: 20
    property double humidity: 50

    SwipeView{
        anchors.fill: parent
        Page{
            Column{
                anchors.fill: parent
                anchors.margins: 20
                HourPicker{
                    text: qsTr("Start")
                    width: parent.width
                    height: parent.height/2
                    hour: 8
                    minute: 0
                }
                HourPicker{
                    text: qsTr("Stop")
                    width: parent.width
                    height: parent.height/2
                    hour: 20
                    minute: 0
                }

            }
        }

        NumericPage{
            temp: base.temperature
            humidity: base.humidity
        }

        VisualPage{
            temp: base.temperature
            humidity: base.humidity
            maxtemp.value: 25
            mintemp.value: 10
        }

    }


}

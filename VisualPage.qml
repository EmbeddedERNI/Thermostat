import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.4

Page{
    id: base
    property double temp: 0
    property double humidity: 0
    property alias maxtemp: tempControl.max
    property alias mintemp: tempControl.min

    GridLayout{
        anchors.fill: parent
        anchors.margins: 10
        columns: 2
        TemperatureController{
            id: tempControl
            value: base.temp

            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter

        }
        HumidityController{
            value: base.humidity
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
        }
        Flow{
            id: pickerFlow
            Layout.fillWidth: true
            //            Layout.fillHeight: true
            Layout.columnSpan: 2
            //            flow: Flow.TopToBottom
            HourPicker{
                id: startHourPicker
                text: qsTr("Start")
                width: parent.width/2
                height: parent.height
                hour: 8
                minute: 0
            }
            HourPicker{
                id: stopHourPicker
                text: qsTr("Stop")
                width: parent.width/2
                height: parent.height
                hour: 20
                minute: 0
            }
        }
        states: [
            State {
                name: "Vertical"
                when: base.width < base.height
                PropertyChanges{
                    target: pickerFlow
                    flow: Flow.TopToBottom
                    Layout.minimumHeight: 200
                }
                PropertyChanges{
                    target: startHourPicker
                    width: startHourPicker.parent.width
                    height: startHourPicker.parent.height/2
                }
                PropertyChanges{
                    target: stopHourPicker
                    width: stopHourPicker.parent.width
                    height: stopHourPicker.parent.height/2
                }
            },
            State {
                name: "Horizontal"
                when: base.width >= base.height
                PropertyChanges{
                    target: pickerFlow
                    flow: Flow.LeftToRight
                    Layout.minimumHeight: 100
                }
                PropertyChanges{
                    target: startHourPicker
                    width: startHourPicker.parent.width/2
                    height: startHourPicker.parent.height
                }
                PropertyChanges{
                    target: stopHourPicker
                    width: stopHourPicker.parent.width/2
                    height: stopHourPicker.parent.height
                }
            }
        ]
    }
}

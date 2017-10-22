import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.4


Page{
    id: base
    property double temp: 0
    property double humidity: 0
    property bool connectedIndicator: false
    GridLayout{
        anchors.fill: parent
        anchors.margins: 10
        columns:2
        SegmentDisplay{
            id: time
            Layout.columnSpan: 2
            text: Qt.formatTime(new Date(),"hh:mm:ss")
            Timer {
                id: timer
                interval: 1000
                repeat: true
                running: true

                onTriggered:
                {
                    time.text =  Qt.formatTime(new Date(),"hh:mm:ss")
                }
            }
        }
        Rectangle{
            height: 50
            width: height
            radius: height
            anchors.verticalCenter: parent.verticalCenter
            color: base.connectedIndicator? "green" : "red"
        }
        SegmentDisplay{
            id: temp
            text: "Cº " + base.temp
        }
        SegmentDisplay{
            Layout.columnSpan: 2
            id: humidity
            text: "% " + base.humidity
        }
    }

}

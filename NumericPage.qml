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
    ColumnLayout{
        id: gridLayout
        anchors.fill: parent
        anchors.margins: 10
        SegmentDisplay{
            id: time
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
        SegmentDisplay{
            id: temp
            text: "Cº " + base.temp + " % " + base.humidity
        }
        Item{
            Layout.fillHeight: true
        }
    }

}

import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.4

CircularGauge{

    Label{
        anchors.centerIn: parent
        anchors.verticalCenterOffset: parent.height/4
        text: qsTr("Humidity") + " %" +  parent.value.toFixed(2)
    }
    Behavior on value {
        PropertyAnimation{
            duration: 500
            easing.type: "InOutCubic"
        }
    }
}

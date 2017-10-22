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

    RowLayout{
        anchors.fill: parent
        anchors.margins: 10
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
    }
}

import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3

RowLayout{
    spacing: 20
    property alias text: label.text
    property alias hour: hoursTumbler.currentIndex
    property alias minute: hoursTumbler.currentIndex
    Label{
        id: label
        text: qsTr("Start")
        font.pixelSize: parent.height/2
        horizontalAlignment: "AlignRight"
        verticalAlignment: "AlignVCenter"
        fontSizeMode: "Fit"
        Layout.fillWidth: true
        Layout.alignment: Qt.AlignHCenter

    }
    Rectangle {
        id: tumblerbase
        width: frame.implicitWidth + 10
        height: frame.implicitHeight + 10

        function formatText(count, modelData) {
            var data = count === 12 ? modelData + 1 : modelData;
            return data.toString().length < 2 ? "0" + data : data;
        }

        FontMetrics {
            id: fontMetrics
        }

        Component {
            id: delegateComponent

            Label {
                text: tumblerbase.formatText(Tumbler.tumbler.count, modelData)
                opacity: 1.0 - Math.abs(Tumbler.displacement) / (Tumbler.tumbler.visibleItemCount / 2)
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: fontMetrics.font.pixelSize * 1.25
            }
        }

        Frame {
            id: frame
            padding: 0
            property int visibleItemCount: 3
                    height: (fontMetrics.font.pixelSize * visibleItemCount)*2
            Row {
                id: row
                Tumbler {
                    id: hoursTumbler
                    model: 24
                    delegate: delegateComponent
                    visibleItemCount: frame.visibleItemCount
                    height: frame.height
                }

                Tumbler {
                    id: minutesTumbler
                    model: 60
                    delegate: delegateComponent
                    visibleItemCount: frame.visibleItemCount
                    height: frame.height
                }

            }
        }
    }
}

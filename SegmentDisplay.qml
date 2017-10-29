import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.4

Label {

    //    Layout.fillHeight: true
    Layout.fillWidth: true
    Layout.minimumHeight: 12
    Layout.maximumHeight: 1000
    Layout.preferredHeight: (width / text.length) * metrics.height/metrics.averageCharacterWidth
    fontSizeMode: "HorizontalFit"
    font.pixelSize: 500
    minimumPointSize: 12
    horizontalAlignment: Qt.AlignRight
    FontMetrics{
        id:metrics
        font.family: fixedFont.name
    }

    FontLoader { id: fixedFont; source: "qrc:/digital-7.ttf"}
    font.family: fixedFont.name

}

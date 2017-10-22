import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.4

Label {

    Layout.fillHeight: true
    Layout.fillWidth: true
    Layout.minimumHeight: 12
    Layout.maximumHeight: 1000

    fontSizeMode: "Fit"
    font.pixelSize: 1000
    minimumPointSize: 12
horizontalAlignment: Qt.AlignRight
    FontLoader { id: fixedFont; source: "qrc:/digital-7.ttf"}
    font.family: fixedFont.name

}

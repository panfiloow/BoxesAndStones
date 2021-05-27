import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
Item {
    id: comarea
    signal sum2()
    signal mult3()
    signal sum3()
    signal mult2()
    signal nextturn()
    width: 310
    height: 210
    Text {
        id: leftboxtxt
        width: 300
        height: 50
        font.pixelSize: 18
        text: "Commands for left box:"

    }
    Item {
        id:leftboxcom
        width: 305
        height: 50
        anchors.top:leftboxtxt.bottom
        Button{

            width:150
            height: 50
            Text{
            anchors.centerIn: parent
            font.pixelSize: 16
            text: "1: +2 "
            }
            onClicked: {
                sum2()
                nextturn()
            }
            anchors.left: leftboxcom.left
        }
        Button{
            width: 150
            height: 50
            Text{
            anchors.centerIn: parent
            font.pixelSize: 16
            text: "2: *3"
            }
            onClicked:{
                mult3()
                nextturn()
            }
            anchors.right: leftboxcom.right
        }
    }
    Text {
        id:rightboxtxt
        width: 300
        height: 50
        font.pixelSize: 18
        text:"Commands for right box:"
        anchors.top: leftboxcom.bottom
    }
    Item {
        id:rightboxcom
        width: 305
        height: 50
        anchors.top:rightboxtxt.bottom
        Button{

            width:150
            height: 50
            Text{
            anchors.centerIn: parent
            font.pixelSize: 15
            text: "3: +3"
            }
            onClicked:{
                sum3()
                nextturn()
            }
            anchors.left: rightboxcom.left
        }
        Button{
            width: 150
            height: 50
            Text{
            anchors.centerIn: parent
            font.pixelSize: 15
            text: "4: *2"
            }
            onClicked:{
                mult2()
                nextturn()
            }
            anchors.right: rightboxcom.right
        }
    }
    Shortcut{

    }
    Shortcut{

    }
    Shortcut{

    }
    Shortcut{

    }
}

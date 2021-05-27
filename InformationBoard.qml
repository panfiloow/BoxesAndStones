import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.5
Item {
    id: toolbar
    signal newGame()
    signal quitApp()
    signal showRules()
    signal changenames()
    width: 200
    height: 102
    Item {
        id: uppanel
        width: 200
        height: 50
        anchors.top: toolbar.top
        Button{
            width: 98
            height:50
            anchors.left: uppanel.left
            font.pixelSize: 16
            text: "New Game"
            onClicked: {
                newGame()
            }
        }
        Button{
            width: 98
            height: 50
            anchors.right: uppanel.right
            font.pixelSize: 16
            text: "Quit"
            onClicked: {
                quitApp()
            }
        }
    }
    Item {
        id: lowpanel
        width: 200
        height: 50
        anchors.bottom: toolbar.bottom
        Button{
            width: 98
            height: 50
            anchors.left: lowpanel.left
            font.pixelSize: 16
            text: "Rules"
            onClicked: {
                  showRules()
            }
        }
        Button{
            width: 98
            height: 50
            anchors.right: lowpanel.right
            font.pixelSize: 12
            text: "Change Names"
            onClicked: {
               changenames()
            }
        }
    }
}

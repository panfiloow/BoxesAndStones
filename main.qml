import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.5
Window {
    id: mainwin
    width: 1080
    height: 720
    maximumHeight: 720
    maximumWidth: 1080
    minimumHeight: 720
    minimumWidth: 1080
    visible: true
    title: qsTr("Boxes And Stones")

    Image {
        id: fon
        source: "qrc:/fon.png"
        height: 720
        width: 1080
        Commands{
            anchors.bottom: fon.bottom
            onSum2: add2()
            onMult3: multiply3()
            onSum3: add3()
            onMult2: multiply2()
            onNextturn: next()

        }
        ScoreBoard{
            id:scoreboard
            onSomeplayerwin: win()
        }
        InformationBoard{
            anchors.right: fon.right
            onNewGame: newgame()
            onQuitApp: Qt.quit()
            onShowRules: rules.vis=true
            onChangenames: change.vis=true
        }
        TurnInfo{
            id:turninfo
            anchors.bottom: fon.bottom
            anchors.right: fon.right

        }

        Rectangle{
            id: boxes
            width: 600
            height: 300
            visible: false
            anchors.centerIn: fon
        }
        Image {
            id: leftbox
            source: "qrc:/box.png"
            height: 300
            width: 250
            anchors.top: boxes.top
            anchors.left: boxes.left
            property int value: 2
            Rectangle {
                id: valuefield
                width: 150
                height: 150
                anchors.centerIn: leftbox
                visible: false
            }
            Text {
                id: value1
                property string value:  leftbox.value
                anchors.centerIn: valuefield
                font.pixelSize: 40
                text: qsTrId(value)
            }
        }
        Image {
            id: rightbox
            source: "qrc:/box.png"
            height: 300
            width: 250
            anchors.top: boxes.top
            anchors.right: boxes.right
            property int value: 1
            Rectangle {
                id: valuefield2
                width: 150
                height: 150
                anchors.centerIn: rightbox
                visible: false

            }
            Text {
                id: value2
                property string value:  rightbox.value
                anchors.centerIn: valuefield2
                font.pixelSize: 40
                text: qsTrId(value)
            }
        }
    }
    Dialog {
        id: dialog
        signal nextgame()
        property bool win: false
        property string texts: "-1"
        height: 300
        width:500
        Label {
                id: contattxt
                font.pixelSize: 20
                text:dialog.texts

        }
        Label {
         id: counttxt
         anchors.left: contattxt.right
         font.pixelSize: 20
         text: "  Кол-во ходов: "
        }
        Label {
            anchors.left: counttxt.right
            font.pixelSize: 20
            text: turninfo.takecount()
        }
        Image {
            id: salutik
            width: 500
            height: 200
            anchors.top: contattxt.bottom
            source: "qrc:/congratulation.png"
        }
        title: "Congratulation for winner!"
        modal: true
        standardButtons: Dialog.Ok
        onClosed: {
            nextgame()
            dialog.win=false
        }
        onNextgame: newgame()
        anchors.centerIn: parent
        visible: win
    }
    Dialog{
        id: rules
        width: 600
        height: 300
        modal: true
        property bool vis: false
        title: "Rules"
        standardButtons: Dialog.Ok
        Label{
            id: rulestxt
            font.pixelSize: 12
            text: "Игра рассчитана для двух человек.\nИгроки ходят по очереди, и у них есть 4 команды, которые изменяют количество камней в коробках.\nДля использования команд мы можете мышкой нажимать на соответсвующую кнопку \nили нажимать кнопки на клавиатуре (1, 2, 3, 4)\nВыигрывает тот, на чьем ходу превысится максимальная сумма в двух коробках! Удачи :)"
        }
        onClosed: {
            vis=false
        }
        anchors.centerIn: parent
        visible: vis
        Image{
            source: "qrc:/rulespng.png"
            width: 600
            height: 150
            anchors.top: rulestxt.bottom
        }
    }
    Dialog {
        id: change
        width: 500
        height: 200
        modal: true
        title: "Enter your names"
        standardButtons: Dialog.Ok
        property bool vis: false
        property string player1newname: "Badass player :)"
        property string player2newname: "Crazy gamer -_-"
        Text {
            id: player1text
            font.pixelSize: 20
            text: "Enter name first player: "
        }
        TextInput{
            id: player1textinput
            font.pixelSize: 20
            text: "Badass player :)"
            anchors.left: player1text.right
            onAccepted: {
                change.player1newname=player1textinput.text
                turninfo.newname1()
            }
        }
        Text {
            id: player2text
            font.pixelSize: 20
            anchors.top: player1text.bottom
            text: "Enter name second player: "
        }
        TextInput{
            id: player2textinput
            font.pixelSize: 20
            text: "Crazy gamer -_-"
            anchors.left: player2text.right
            anchors.top: player1textinput.bottom
            onAccepted: {
                change.player2newname=player2textinput.text
                turninfo.newname2()
            }
        }
        Text {
            anchors.top: player2text.bottom
            font.pixelSize: 20
            text: "Press Enter after you enter the name !!!"
        }
        onClosed: {
            vis=false
        }

        anchors.centerIn: parent
        visible:  vis
    }

    function newgame(){
        leftbox.value=randhelp.randboxvalue()
        rightbox.value=randhelp.randboxvalue()
        scoreboard.newmax()
        turninfo.reset()
    }
    function add2(){
        leftbox.value=leftbox.value+2
    }
    function multiply3(){
        leftbox.value= leftbox.value*3
    }
    function add3(){
        rightbox.value= rightbox.value+3
    }
    function multiply2(){
        rightbox.value = rightbox.value*2
    }
    function next(){
        turninfo.addcount()
        scoreboard.compare()
    }
    function win(){
       dialog.win=true
       dialog.texts=turninfo.namewin()

    }
}

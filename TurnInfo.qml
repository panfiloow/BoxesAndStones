import QtQuick 2.0
import QtQuick.Controls 2.12
Item {
    id: turninf
    width: 500
    height: 210
    Item {
        id: nameplayers
        width: 500
        height: 50
        Text {
            id: player1
            font.pixelSize: 20
            text: "Player 1: "
        }
        Text {
            id: nameplayer1
            anchors.left: player1.right
            property string name: "Badass player :)"
            font.pixelSize: 20
            text: qsTr(name)
        }
        Text {
            id: player2
            anchors.left: nameplayer1.right
            font.pixelSize: 20
            text: "  Player 2: "
        }
        Text {
            id:nameplayer2
            property string name: "Crazy gamer -_-"
            anchors.left: player2.right
            font.pixelSize: 20
            text: qsTr(name)
        }

    }
    Item {
        id: turn
        anchors.top: nameplayers.bottom

        Text {
            id: turntxt
            font.pixelSize: 20
            text: qsTr("Player's turn:  ")
        }

        Text {
            id: playerturn
            anchors.left: turntxt.right
            property string name: nameplayer1.name
            font.pixelSize: 20
            text: qsTr(name)
        }
    }
    Item {
        id: countarea
        width: 500
        height: 130

        anchors.bottom: turninf.bottom
        Text {
            id: countturn
            anchors.centerIn: countarea
            property int count: 1
            property string strcount: countturn.count
            font.pixelSize: 60
            text: strcount
        }
    }

    function addcount(){
        countturn.count++
        if(playerturn.name === nameplayer1.name){
            playerturn.name=nameplayer2.name
        }else{
            playerturn.name=nameplayer1.name
        }
    }
    function reset(){
        countturn.count=1
        playerturn.name= nameplayer1.name
    }
    function namewin(){
        if(playerturn.name === nameplayer1.name){
            playerturn.name=nameplayer2.name
        }else{
            playerturn.name=nameplayer1.name
        }
        return playerturn.name
    }
    function takecount(){
        return countturn.strcount
    }
    function newname1(){
        nameplayer1.name=change.player1newname
    }
    function newname2(){
        nameplayer2.name=change.player2newname
    }
}

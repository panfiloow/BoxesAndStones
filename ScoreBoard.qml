import QtQuick 2.0

Item {
    id: scoreboard
    signal someplayerwin()

    function newmax(){
       maxsum=randhelp.randmaxvalue();
    }
    function compare(){
       if(currentSum >= maxsum){
           someplayerwin()
       }
    }
    width: 450
    height: 100
    property int currentSum: leftbox.value+rightbox.value
    property int maxsum: 150
    Item {
        id: max
        width: 450
        height: 50
        Text{
            id: maxsumtxt
            font.pixelSize: 22
            text: qsTr("Maximum number of stones in boxes: ");
            anchors.left: max.left
        }
        Text{
            property string maxSum: scoreboard.maxsum
            font.pixelSize: 22
            text: qsTrId(maxSum)
            anchors.left: maxsumtxt.right
        }
    }
    Item {
        id: cur
        width: 450
        height: 50
        anchors.top: max.bottom
        Text{
            id: cursumtxt
            font.pixelSize: 22
            text: qsTr("Current number of stones in boxes: ");
            anchors.left: cur.left
        }
        Text{
            property string curSum: scoreboard.currentSum
            font.pixelSize: 22
            text: qsTrId(curSum)
            anchors.left: cursumtxt.right
        }
    }

}

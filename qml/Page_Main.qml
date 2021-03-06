import QtQuick 2.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.12
import "custom"
import "../"

Item
{
    id: page_Main

    Text
    {
        id: textTankName
        anchors.top: parent.top
        anchors.topMargin: AppTheme.margin * app.scale * 2
        anchors.horizontalCenter: parent.horizontalCenter
        verticalAlignment: Text.AlignVCenter
        font.family: AppTheme.fontFamily
        font.pixelSize: AppTheme.fontSuperBigSize * app.scale
        color: AppTheme.blueColor
        text: tanksList.model[0].name
    }

    TanksList
    {
        id: tanksList
        anchors.top: parent.top
        anchors.topMargin: AppTheme.rowHeightMin * app.scale * 2
        anchors.horizontalCenter: parent.horizontalCenter
        model: tanksListModel
        onSigCurrentIndexChanged:
        {
            textTankName.text = model[id].name
            app.sigTankSelected(currentIndex)
        }
    }

    Flickable
    {
        id: flickableContainer
        anchors.top:tanksList.bottom
        anchors.topMargin: AppTheme.compHeight * app.scale * 3
        anchors.left: parent.left
        anchors.leftMargin: AppTheme.padding * app.scale
        anchors.right: parent.right
        anchors.rightMargin: AppTheme.padding * app.scale
        anchors.bottom: parent.bottom
        //anchors.bottomMargin: AppTheme.rowHeight * app.scale

        contentWidth: width
        contentHeight: 700 * app.scale
        clip: true

        CurrentParamsMainTable
        {
            id: currParamsMainTable
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            model: curValuesListModel
            height: 300 * app.scale
        }

        /*
        Rectangle
        {
            id: rectActivitiesTableHeader
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: currParamsMainTable.bottom
            anchors.topMargin: AppTheme.compHeight * app.scale
            height: AppTheme.compHeight * app.scale
            color: "#00000000"

            Text
            {
                verticalAlignment: Text.AlignVCenter
                width: 80 * app.scale
                font.family: AppTheme.fontFamily
                font.pixelSize: AppTheme.fontNormalSize * app.scale
                color: AppTheme.greyColor
                text: qsTr("CURRENT ACTIVITIES: ")
            }
        }


        CurrrentActivities
        {
            id: currActivities
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: rectActivitiesTableHeader.bottom
            anchors.topMargin: AppTheme.padding * app.scale
            height: 200 * app.scale
        }
        */

        ScrollBar.vertical: ScrollBar
        {
            policy: ScrollBar.AlwaysOn
            parent: flickableContainer.parent
            anchors.top: flickableContainer.top
            anchors.left: flickableContainer.right
            anchors.leftMargin: AppTheme.padding * app.scale
            anchors.bottom: flickableContainer.bottom

            contentItem: Rectangle
            {
                implicitWidth: 2
                implicitHeight: 100
                radius: width / 2
                color: AppTheme.hideColor
            }
        }
    }

/*
    IconSimpleButton
    {
        id: buttonDetails
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: AppTheme.margin * app.scale
        height: AppTheme.compHeight * app.scale
        width: height
        image: "qrc:/resources/img/icon_arrow_right.png"

        onSigButtonClicked:
        {
            var tankParams = [tanksListModel[tanksList.currentIndex].name,
                              tanksListModel[tanksList.currentIndex].desc,
                              tanksListModel[tanksList.currentIndex].type,
                              tanksListModel[tanksList.currentIndex].typeName,
                              tanksListModel[tanksList.currentIndex].volume,
                              tanksListModel[tanksList.currentIndex].img];

            page_TankData.showPage(true, tankParams)
        }
    }
    */

    StandardButton
    {
        id: butShowMore
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: AppTheme.margin * app.scale
        width: 120 * app.scale
        bText: qsTr("SEE DETAILS")

        onSigButtonClicked:
        {
            var tankParams = [tanksListModel[tanksList.currentIndex].name,
                              tanksListModel[tanksList.currentIndex].desc,
                              tanksListModel[tanksList.currentIndex].type,
                              tanksListModel[tanksList.currentIndex].typeName,
                              tanksListModel[tanksList.currentIndex].volume,
                              tanksListModel[tanksList.currentIndex].img];
            page_TankData.showPage(true, tankParams)
        }
    }
}

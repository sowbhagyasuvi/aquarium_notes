import QtQuick 2.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.12
import "../"

Item
{
    id: currentParamsTable

    property alias model: curParamsListView.model

    function formattedValue(val)
    {
        var str = ""

        if (val !== -1)
        {
            if (val > 50)
                str += Math.round(val)
            else
                str += Math.round(val * 100) / 100
        }
        else
            str = "-"

        return str
    }

    function formattedDiffValue(val_prev, val_curr)
    {
        var str = ""

        if (val_curr !== -1 && val_prev !== -1)
        {
            if (val_curr > val_prev)
                str = "+"

            str += Math.round((val_curr - val_prev) * 100) / 100
        }
        else
            str = "-"

        return str
    }

    Rectangle
    {
        anchors.fill: parent
        color: "#00000000"

        Rectangle
        {
            id: rectDataHeader
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            height: AppTheme.compHeight * app.scale
            color: "#00000000"

            Row
            {
                anchors.left: parent.left
                anchors.right: parent.right

                Text
                {
                    verticalAlignment: Text.AlignVCenter
                    width: 75 * app.scale
                    font.family: AppTheme.fontFamily
                    font.pixelSize: AppTheme.fontBigSize * app.scale
                    color: AppTheme.blueColor
                    text: ""
                }

                Text
                {
                    verticalAlignment: Text.AlignVCenter
                    width: 50 * app.scale
                    font.family: AppTheme.fontFamily
                    font.pixelSize: AppTheme.fontNormalSize * app.scale
                    color: AppTheme.greyColor
                    text: ""
                }

                Text
                {
                    width: 65 * app.scale
                    verticalAlignment: Text.AlignVCenter
                    font.family: AppTheme.fontFamily
                    font.pixelSize: AppTheme.fontBigNormalSize * app.scale
                    color: AppTheme.greyColor
                    visible: (curParamsListView.model.length > 0)
                    text: "[" + qsTr("current") + "]"
                }

                Text
                {
                    width: 65 * app.scale
                    verticalAlignment: Text.AlignVCenter
                    font.family: AppTheme.fontFamily
                    font.pixelSize: AppTheme.fontBigNormalSize * app.scale
                    color: AppTheme.greyColor
                    visible: (curParamsListView.model.length > 0)
                    text: "[" + qsTr("previous") + "]"
                }

                Text
                {
                    width: 40 * app.scale
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignRight
                    font.family: AppTheme.fontFamily
                    font.pixelSize: AppTheme.fontBigSize * app.scale
                    color: AppTheme.blueColor
                    text: ""
                }
            }
        }

        ListView
        {
            id: curParamsListView
            anchors.fill: parent
            anchors.topMargin: AppTheme.compHeight * app.scale
            spacing: 0

            delegate: Rectangle
            {
                width: parent.width
                height: AppTheme.compHeight * app.scale
                color: "#00000000"

                Row
                {
                    anchors.left: parent.left
                    anchors.right: parent.right

                    Text
                    {
                        verticalAlignment: Text.AlignVCenter
                        width: 90 * app.scale
                        font.family: AppTheme.fontFamily
                        font.pixelSize: AppTheme.fontNormalSize * app.scale
                        color: AppTheme.blueColor
                        text: app.getParamById(paramId).shortName
                    }

                    Text
                    {
                        verticalAlignment: Text.AlignBottom
                        width: 55 * app.scale
                        font.family: AppTheme.fontFamily
                        font.pixelSize: AppTheme.fontNormalSize * app.scale
                        color: AppTheme.greyColor
                        text: app.getParamById(paramId).unitName
                    }

                    Text
                    {
                        width: 60 * app.scale
                        verticalAlignment: Text.AlignVCenter
                        font.family: AppTheme.fontFamily
                        font.pixelSize: AppTheme.fontNormalSize * app.scale
                        color: AppTheme.blueColor
                        text: formattedValue(valueNow)
                    }

                    Text
                    {
                        width: 60 * app.scale
                        verticalAlignment: Text.AlignVCenter
                        font.family: AppTheme.fontFamily
                        font.pixelSize: AppTheme.fontNormalSize * app.scale
                        color: AppTheme.greyColor
                        text: formattedValue(valuePrev)
                    }

                    Text
                    {
                        width: 40 * app.scale
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignRight
                        font.family: AppTheme.fontFamily
                        font.pixelSize: AppTheme.fontNormalSize * app.scale
                        color: AppTheme.blueColor
                        text: formattedDiffValue(valuePrev, valueNow)
                    }
                }

                Rectangle
                {
                    width: parent.width
                    height: 1 * app.scale
                    anchors.bottom: parent.bottom
                    color: ((index + 1) === curParamsListView.model.count) ? "#00000000" : AppTheme.shideColor
                }
            }
        }
    }
}

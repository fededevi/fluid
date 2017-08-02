pragma Singleton

import QtQuick 2.0
import QtQuick.Window 2.2
import Fluid.Core 1.0
import QtQuick.Controls.Material 2.0
/*!
    \qmltype Config
    \inqmlmodule Fluid.Controls
    \ingroup fluidcontrols

    \brief Config.
*/
Item {

    // Material design

    property var material: Material

    Material.primary: "#00838F" //Material.Red//Material.Blue
    Material.foreground: "white"
    Material.background: "#EEEEEE" //Material.Grey
    Material.accent: "#0097A7"
    Material.theme: Material.Dark
    Material.elevation: 2

    property var secondaryBackground: material.accent
    property var secondaryForeground: material.foreground

    property var searchBackground: secondaryBackground
    property var searchIconColor: secondaryBackground
    property var searchForeground: secondaryForeground
    property var searchAccentColor: material.accent

    property var editForeground: "black"
    property var editTheme: Material.Light

    property var cardBackground: "#f7f7f7"

    property var rowHighlightColor: secondaryBackground
    property var rowHooverColor: "#EEEEEE"

    //Sizes
    property int iconSize: 20 //(Device.gridUnit <= 48 ? 20 : 24) //* Screen.devicePixelRatio

    property int appBarHeight: 56 // (Device.gridUnit + 8) //* Screen.devicePixelRatio

    property int toolBarHeight: 48 //Device.gridUnit //* Screen.devicePixelRatio

    property int menuItemHeight: 30

    //Margins
    property int marginToBorder: 16 //* Screen.devicePixelRatio
    property int marginRow: 16 //* Screen.devicePixelRatio
    property int marginColumn: 16 //* Screen.devicePixelRatio

    //Spacing
    property int spacing: 16 //* Screen.devicePixelRatio

    //Font Sizes
    property int fontHeading: 20 //* Screen.devicePixelRatio
    property int fontButton: 14 //* Screen.devicePixelRatio

    property int fontSubHeadingDevice: 16 //* Screen.devicePixelRatio
    property int fontSubHeadingDesktop: 15 //* Screen.devicePixelRatio
    property int fontSubHeading: Device.formFactor === Device.Computer || Device.formFactor === Device.TV ? fontSubHeadingDesktop: fontSubHeadingDevice

    property int fontBodyDevice: 14 //* Screen.devicePixelRatio
    property int fontBodyDesktop: 13 //* Screen.devicePixelRatio
    property int fontBody: Device.formFactor === Device.Computer || Device.formFactor === Device.TV ? fontBodyDesktop: fontBodyDevice

    property int gridHeaderFontSize: 12
    property int gridHeaderIconSize: 16
    property int gridContentFontSize: 13
    property int gridHeaderHight: 56
    property int gridRowHeight: 48

    //Colors
    property var menuBackground: Material.background
    property var primaryTitleColor: Material.primaryTextColor

    property color primaryTextColor: Qt.darker(Material.background, 1.87)
    property color secondaryTextColor: Qt.darker(Material.background, 1.54)
    property color disabledTextColor: Qt.darker(Material.background, 1.38)

}

import QtQuick 2.0
import QtQuick.Window 2.2
import Fluid.Core 1.0
import QtQuick.Controls.Material 2.0

pragma Singleton

/*!
    \qmltype Config
    \inqmlmodule Fluid.Controls
    \ingroup fluidcontrols

    \brief Config.
*/
Item {

    // Material design

    property var material: Material

    Material.primary: Material.Blue
    Material.foreground: "white"
    Material.background: "#EEEEEE" //Material.Grey
    Material.accent: Material.Red
    Material.theme: Material.Dark
    Material.elevation: 2

    //Sizes
    property int iconSize: (Device.gridUnit <= 48 ? 20 : 24) //* Screen.devicePixelRatio

    property int appBarHeight: (Device.gridUnit + 8) //* Screen.devicePixelRatio

    property int toolBarHeight: Device.gridUnit //* Screen.devicePixelRatio

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

    //Colors
    property var menuBackground: Material.background
    property var primaryTitleColor: Material.primaryTextColor

    property color primaryTextColor: Qt.darker(Material.background, 1.87)
    property color secondaryTextColor: Qt.darker(Material.background, 1.54)
    property color disabledTextColor: Qt.darker(Material.background, 1.38)
}

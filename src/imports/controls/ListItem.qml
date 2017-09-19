/*
 * This file is part of Fluid.
 *
 * Copyright (C) 2017 Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>
 * Copyright (C) 2017 Michael Spencer <sonrisesoftware@gmail.com>
 *
 * $BEGIN_LICENSE:MPL2$
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *
 * $END_LICENSE$
 */

import QtQuick 2.4
import QtQuick.Layouts 1.0
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0
import Fluid.Core 1.0 as FluidCore
import Fluid.Controls 1.0 as FluidControls

/*!
   \qmltype ListItem
   \inqmlmodule Fluid.Controls
   \ingroup fluidcontrols

   \brief A standard list item, with one or more lines of text and optional left and right items.
 */
ItemDelegate {
    id: listItem

    property int dividerInset: leftItem.visible ? listItem.height : 0
    property alias showDivider: divider.visible

    property int maximumLineCount: 2

    property alias subText: subLabel.text
    property alias valueText: valueLabel.text

    property alias iconName: icon.name
    property alias iconSource: icon.source

    property alias leftItem: leftItem.children
    property alias rightItem: rightItem.children
    property alias secondaryItem: secondaryItem.children

    leftPadding: FluidControls.Units.smallSpacing * 2
    rightPadding: FluidControls.Units.smallSpacing * 2
    topPadding: 0
    bottomPadding: 0

    width: parent ? parent.width : undefined

    hoverEnabled: FluidCore.Device.hoverEnabled

    opacity: enabled ? 1.0 : 0.6

    Layout.fillWidth: true

    FluidControls.ThinDivider {
        id: divider

        x: dividerInset
        y: parent.height - height

        width: parent.width - x

        visible: false
    }

    contentItem: RowLayout {
        implicitHeight: {
            var height = 0;

            if (subText != "") {
                if (maximumLineCount == 2)
                    height = 72;
                else
                    height = 88;
            } else {
                if (secondaryItem.showing)
                    height = secondaryItem.childrenRect.height + (label.visible ? FluidControls.Units.largeSpacing * 2 : FluidControls.Units.smallSpacing * 2);
                else
                    height = 48;
            }

            var leftHeight = leftItem.childrenRect.height + FluidControls.Units.smallSpacing * 2;
            var rightHeight = rightItem.childrenRect.height + FluidControls.Units.smallSpacing * 2;

            return Math.max(height, leftHeight, rightHeight);
        }

        spacing: FluidControls.Units.smallSpacing * 2

        Item {
            id: leftItem

            property bool showing: visibleChildren.length > 0

            objectName: "leftItem"

            Layout.preferredWidth: showing ? 40 : 0
            Layout.preferredHeight: width
            Layout.alignment: Qt.AlignCenter

            FluidControls.Icon {
                id: icon
                objectName: "icon"

                anchors {
                    verticalCenter: parent.verticalCenter
                    left: parent.left
                }

                visible: icon.valid
                color: listItem.highlighted ? FluidControls.Config.secondaryForeground : enabled ? FluidControls.Config.material.foreground : FluidControls.Config.material.iconDisabledColor
            }
        }

        ColumnLayout {
            Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
            Layout.fillWidth: true

            spacing: 0

            RowLayout {
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter

                visible: label.text != "" || valueLabel.text != ""
                spacing: FluidControls.Units.smallSpacing

                FluidControls.SubheadingLabel {
                    id: label
                    objectName: "textLabel"

                    Layout.alignment: Qt.AlignVCenter
                    Layout.fillWidth: true

                    // XXX: Hack to vertically center the label
                    Layout.topMargin: subLabel.visible ? 0 : ((listItem.height - height) / 2) - FluidControls.Units.smallSpacing

                    text: listItem.text
                    elide: Text.ElideRight
                    color: listItem.highlighted ? FluidControls.Config.secondaryForeground
                                                : FluidControls.Config.material.foreground
                    visible: text != ""
                }

                FluidControls.BodyLabel {
                    id: valueLabel
                    objectName: "valueLabel"

                    Layout.alignment: Qt.AlignVCenter
                    Layout.preferredWidth: visible ? implicitWidth : 0
                    Layout.preferredHeight: visible ? implicitHeight : 0

                    color: listItem.highlighted ? FluidControls.Config.secondaryForeground
                                                : FluidControls.Config.material.foreground
                    elide: Text.ElideRight

                    visible: text != ""
                }
            }

            FluidControls.BodyLabel {
                id: subLabel
                objectName: "subTextLabel"

                Layout.fillWidth: true
                Layout.preferredHeight: visible ? implicitHeight * maximumLineCount/lineCount : 0

                color: listItem.highlighted ? FluidControls.Config.secondaryForeground
                                            : FluidControls.Config.material.foreground
                elide: Text.ElideRight
                wrapMode: Text.WordWrap

                visible: text != "" && !contentItem.showing
                maximumLineCount: visible ? listItem.maximumLineCount - 1 : 0
            }

            Item {
                id: secondaryItem

                property bool showing: visibleChildren.length > 0

                objectName: "secondaryItem"

                Layout.fillWidth: true
                Layout.preferredHeight: showing ? childrenRect.height + (label.visible ? FluidControls.Units.smallSpacing : FluidControls.Units.largeSpacing) : 0
            }
        }

        Item {
            id: rightItem

            property bool showing: visibleChildren.length > 0

            objectName: "rightItem"

            Layout.preferredWidth: showing ? childrenRect.width : 0
            Layout.preferredHeight: parent.height
        }
    }
}

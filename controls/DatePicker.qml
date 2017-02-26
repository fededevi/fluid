/*
 * This file is part of Fluid.
 *
 * Copyright (C) 2017 Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>
 *
 * $BEGIN_LICENSE:MPL2$
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *
 * $END_LICENSE$
 */

import QtQml 2.2
import QtQuick 2.0
import QtQuick.Controls 2.1
import QtQuick.Controls.Material 2.1
import QtQuick.Layouts 1.0
import Qt.labs.calendar 1.0
import Fluid.Controls 1.0 as FluidControls

/*!
    \qmltype DatePicker
    \inqmlmodule Fluid.Controls
    \ingroup fluidcontrols

    \brief Alert dialogs are urgent interruptions to inform the user about a situation.

    An alert dialog is used to interrupt the user's workflow to inform them about
    a situation that requires their acknowledgement.

    Most alert don't need a title and they summarize a decision in a sentence or two
    by either asking a question or making a statement related to the action buttons.
*/
Dialog {
    id: datePickerDialog

    property alias from: calendarModel.from
    property alias to: calendarModel.to

    property alias orientation: listView.orientation

    modal: true
    standardButtons: Dialog.Ok | Dialog.Cancel

    x: (parent.width - width) / 2
    y: (parent.height - height) / 2

    width: orientation == ListView.Horizontal ? 500 : 340
    height: orientation == ListView.Horizontal ? 280 : 440

    header: ToolBar {
        Material.elevation: 0

        Column {
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.margins: 8
            spacing: 8

            FluidControls.BodyLabel {
                text: listView.currentItem.year
                level: 2
                color: Material.primaryTextColor
                width: parent.width
            }

            Label {
                text: listView.currentItem.date.toLocaleDateString(datePicker.locale, "ddd, MMM dd")
                font.pixelSize: 36
                lineHeight: 0.9
                wrapMode: Text.Wrap
                width: parent.width
            }
        }
    }

    Control {
        id: datePicker

        anchors.fill: parent

        ListView {
            id: listView

            anchors.fill: parent

            clip: true
            snapMode: ListView.SnapOneItem
            orientation: ListView.Horizontal
            highlightRangeMode: ListView.StrictlyEnforceRange
            currentIndex: 0

            model: CalendarModel {
                id: calendarModel

                from: new Date(2015, 0, 1)
                to: new Date(2015, 11, 31)
            }
            move: Transition {
                NumberAnimation { properties: "x,y"; duration: 1000 }
            }
            delegate: ColumnLayout {
                property date date: model.date

                width: listView.width
                height: listView.height

                Item {
                    Layout.preferredWidth: listView.orientation == ListView.Horizontal ? listView.width : undefined
                    Layout.preferredHeight: listView.orientation == ListView.Horizontal ? 72 : 80

                    FluidControls.IconButton {
                        id: prevMonthButton

                        anchors.top: parent.top
                        anchors.left: parent.left
                        anchors.leftMargin: 16

                        iconName: "navigation/chevron_left"
                    }

                    FluidControls.SubheadingLabel {
                        anchors.verticalCenter: prevMonthButton.verticalCenter
                        //anchors.verticalCenterOffset: -1
                        anchors.horizontalCenter: parent.horizontalCenter

                        text: datePicker.locale.standaloneMonthName(model.month)
                    }

                    FluidControls.IconButton {
                        id: nextMonthButton

                        iconName: "navigation/chevron_right"

                        anchors.top: parent.top
                        anchors.right: parent.right
                        anchors.topMargin: listView.orientation == ListView.Horizontal ? 12 : 16
                        anchors.rightMargin: 16
                    }
                }

                DayOfWeekRow {
                    locale: datePicker.locale
                    delegate: Label {
                        text: model.shortName
                        font.weight: Font.DemiBold
                        font.pixelSize: 14
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        color: Material.secondaryTextColor
                    }

                    Layout.fillWidth: true
                }

                MonthGrid {
                    id: monthGrid
                    locale: datePicker.locale
                    month: model.month
                    year: model.year
                    delegate: Label {
                        text: model.day
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        opacity: model.month === monthGrid.month ? 1 : 0
                        color: model.today ? Material.secondaryTextColor : Material.primaryTextColor

                        Rectangle {
                            anchors.centerIn: parent
                            width: 24
                            height: width
                            radius: width
                            color: Material.accentColor
                            z: -1
                            visible: model.today
                        }
                    }

                    Layout.fillWidth: true
                    Layout.fillHeight: true
                }
            }
        }
    }
}

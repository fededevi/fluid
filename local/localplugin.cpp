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

#include <QtQml/qqml.h>

#include "clipboard.h"
#include "device.h"
#include "iconsimageprovider.h"
#include "qmldateutils.h"
#include "qqmlsortfilterproxymodel.h"
#include "standardpaths.h"

static QObject *dateUtilsProvider(QQmlEngine *engine, QJSEngine *jsEngine)
{
    Q_UNUSED(engine);
    Q_UNUSED(jsEngine);

    return new DateUtils();
}

static QObject *deviceProvider(QQmlEngine *engine, QJSEngine *jsEngine)
{
    Q_UNUSED(engine);
    Q_UNUSED(jsEngine);

    return new Device();
}

static QObject *standardPathsProvider(QQmlEngine *engine, QJSEngine *jsEngine)
{
    Q_UNUSED(engine);
    Q_UNUSED(jsEngine);

    return new StandardPaths();
}

static void registerFluidTypes()
{
    qmlRegisterType<QAbstractItemModel>();

    qmlRegisterType<Clipboard>("Fluid.Core", 1, 0, "Clipboard");
    qmlRegisterType<QQmlSortFilterProxyModel>("Fluid.Core", 1, 0, "SortFilterProxyModel");
    qmlRegisterSingletonType<DateUtils>("Fluid.Core", 1, 0, "DateUtils", dateUtilsProvider);
    qmlRegisterSingletonType<Device>("Fluid.Core", 1, 0, "Device", deviceProvider);
    qmlRegisterSingletonType<StandardPaths>("Fluid.Core", 1, 0, "StandardPaths", standardPathsProvider);
    qmlRegisterType(QUrl("qrc:/Fluid/Core/Object.qml"), "Fluid.Core", 1, 0, "Object");
    qmlRegisterType(QUrl("qrc:/Fluid/Core/PlatformExtensions.qml"), "Fluid.Core", 1, 0, "PlatformExtensions");
    qmlRegisterSingletonType(QUrl("qrc:/Fluid/Core/Utils.qml"), "Fluid.Core", 1, 0, "Utils");

    qmlRegisterType(QUrl("qrc:/Fluid/Controls/Action.qml"), "Fluid.Controls", 1, 0, "Action");
    qmlRegisterType(QUrl("qrc:/Fluid/Controls/AlertDialog.qml"), "Fluid.Controls", 1, 0, "AlertDialog");
    qmlRegisterType(QUrl("qrc:/Fluid/Controls/AppBar.qml"), "Fluid.Controls", 1, 0, "AppBar");
    qmlRegisterType(QUrl("qrc:/Fluid/Controls/ApplicationWindow.qml"), "Fluid.Controls", 1, 0, "ApplicationWindow");
    qmlRegisterType(QUrl("qrc:/Fluid/Controls/AppToolBar.qml"), "Fluid.Controls", 1, 0, "AppToolBar");
    qmlRegisterType(QUrl("qrc:/Fluid/Controls/BaseListItem.qml"), "Fluid.Controls", 1, 0, "BaseListItem");
    qmlRegisterType(QUrl("qrc:/Fluid/Controls/BodyLabel.qml"), "Fluid.Controls", 1, 0, "BodyLabel");
    qmlRegisterType(QUrl("qrc:/Fluid/Controls/CaptionLabel.qml"), "Fluid.Controls", 1, 0, "CaptionLabel");
    qmlRegisterType(QUrl("qrc:/Fluid/Controls/Card.qml"), "Fluid.Controls", 1, 0, "Card");
    qmlRegisterType(QUrl("qrc:/Fluid/Controls/CircleImage.qml"), "Fluid.Controls", 1, 0, "CircleImage");
    qmlRegisterType(QUrl("qrc:/Fluid/Controls/DialogLabel.qml"), "Fluid.Controls", 1, 0, "DialogLabel");
    qmlRegisterType(QUrl("qrc:/Fluid/Controls/DisplayLabel.qml"), "Fluid.Controls", 1, 0, "DisplayLabel");
    qmlRegisterType(QUrl("qrc:/Fluid/Controls/FluidWindow.qml"), "Fluid.Controls", 1, 0, "FluidWindow");
    qmlRegisterType(QUrl("qrc:/Fluid/Controls/HeadlineLabel.qml"), "Fluid.Controls", 1, 0, "HeadlineLabel");
    qmlRegisterType(QUrl("qrc:/Fluid/Controls/Icon.qml"), "Fluid.Controls", 1, 0, "Icon");
    qmlRegisterType(QUrl("qrc:/Fluid/Controls/IconButton.qml"), "Fluid.Controls", 1, 0, "IconButton");
    qmlRegisterType(QUrl("qrc:/Fluid/Controls/InfoBar.qml"), "Fluid.Controls", 1, 0, "InfoBar");
    qmlRegisterType(QUrl("qrc:/Fluid/Controls/InputDialog.qml"), "Fluid.Controls", 1, 0, "InputDialog");
    qmlRegisterType(QUrl("qrc:/Fluid/Controls/ListItem.qml"), "Fluid.Controls", 1, 0, "ListItem");
    qmlRegisterType(QUrl("qrc:/Fluid/Controls/ListItemDelegate.qml"), "Fluid.Controls", 1, 0, "ListItemDelegate");
    qmlRegisterType(QUrl("qrc:/Fluid/Controls/Loadable.qml"), "Fluid.Controls", 1, 0, "Loadable");
    qmlRegisterType(QUrl("qrc:/Fluid/Controls/MenuItem.qml"), "Fluid.Controls", 1, 0, "MenuItem");
    qmlRegisterType(QUrl("qrc:/Fluid/Controls/NavigationDrawer.qml"), "Fluid.Controls", 1, 0, "NavigationDrawer");
    qmlRegisterType(QUrl("qrc:/Fluid/Controls/NoiseBackground.qml"), "Fluid.Controls", 1, 0, "NoiseBackground");
    qmlRegisterType(QUrl("qrc:/Fluid/Controls/Page.qml"), "Fluid.Controls", 1, 0, "Page");
    qmlRegisterType(QUrl("qrc:/Fluid/Controls/PageStack.qml"), "Fluid.Controls", 1, 0, "PageStack");
    qmlRegisterType(QUrl("qrc:/Fluid/Controls/Placeholder.qml"), "Fluid.Controls", 1, 0, "Placeholder");
    qmlRegisterType(QUrl("qrc:/Fluid/Controls/Showable.qml"), "Fluid.Controls", 1, 0, "Showable");
    qmlRegisterType(QUrl("qrc:/Fluid/Controls/Sidebar.qml"), "Fluid.Controls", 1, 0, "Sidebar");
    qmlRegisterType(QUrl("qrc:/Fluid/Controls/SmoothFadeImage.qml"), "Fluid.Controls", 1, 0, "SmoothFadeImage");
    qmlRegisterType(QUrl("qrc:/Fluid/Controls/SmoothFadeLoader.qml"), "Fluid.Controls", 1, 0, "SmoothFadeLoader");
    qmlRegisterType(QUrl("qrc:/Fluid/Controls/Subheader.qml"), "Fluid.Controls", 1, 0, "Subheader");
    qmlRegisterType(QUrl("qrc:/Fluid/Controls/SubheadingLabel.qml"), "Fluid.Controls", 1, 0, "SubheadingLabel");
    qmlRegisterType(QUrl("qrc:/Fluid/Controls/Tab.qml"), "Fluid.Controls", 1, 0, "Tab");
    qmlRegisterType(QUrl("qrc:/Fluid/Controls/TabbedPage.qml"), "Fluid.Controls", 1, 0, "TabbedPage");
    qmlRegisterType(QUrl("qrc:/Fluid/Controls/ThinDivider.qml"), "Fluid.Controls", 1, 0, "ThinDivider");
    qmlRegisterType(QUrl("qrc:/Fluid/Controls/TitleLabel.qml"), "Fluid.Controls", 1, 0, "TitleLabel");
    qmlRegisterSingletonType(QUrl("qrc:/Fluid/Controls/FluidStyle.qml"), "Fluid.Controls", 1, 0, "FluidStyle");
    qmlRegisterSingletonType(QUrl("qrc:/Fluid/Controls/Units.qml"), "Fluid.Controls", 1, 0, "Units");

    qmlRegisterType(QUrl("qrc:/Fluid/Effects/BoxShadow.qml"), "Fluid.Effects", 1, 0, "BoxShadow");
    qmlRegisterType(QUrl("qrc:/Fluid/Effects/CircleMask.qml"), "Fluid.Effects", 1, 0, "CircleMask");
    qmlRegisterType(QUrl("qrc:/Fluid/Effects/Vignette.qml"), "Fluid.Effects", 1, 0, "Vignette");

    qmlRegisterType(QUrl("qrc:/Fluid/Layouts/AutomaticGrid.qml"), "Fluid.Layouts", 1, 0, "AutomaticGrid");
    qmlRegisterType(QUrl("qrc:/Fluid/Layouts/ColumnFlow.qml"), "Fluid.Layouts", 1, 0, "ColumnFlow");

    qmlRegisterType(QUrl("qrc:/Fluid/Material/ActionButton.qml"), "Fluid.Material", 1, 0, "ActionButton");
    qmlRegisterType(QUrl("qrc:/Fluid/Material/ElevationEffect.qml"), "Fluid.Material", 1, 0, "ElevationEffect");
    qmlRegisterType(QUrl("qrc:/Fluid/Material/Ripple.qml"), "Fluid.Material", 1, 0, "Ripple");
    qmlRegisterType(QUrl("qrc:/Fluid/Material/Wave.qml"), "Fluid.Material", 1, 0, "Wave");
}

Q_COREAPP_STARTUP_FUNCTION(registerFluidTypes)

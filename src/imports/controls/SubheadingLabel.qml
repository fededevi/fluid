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

import QtQuick 2.0
import QtQuick.Controls 2.0
import Fluid.Core 1.0 as FluidCore
import Fluid.Controls 1.0 as FluidControls

/*!
    \qmltype SubheadingLabel
    \inqmlmodule Fluid.Controls
    \ingroup fluidcontrols

    \brief Text label with standard font and styling suitable to subheading.

    Text label for the Material Design subheading text style.

    \code
    import QtQuick 2.0
    import Fluid.Controls 1.0 as FluidControls

    FluidControls.SubheadingLabel {
        text: "Text to display"
    }
    \endcode
*/
Label {
    /*!
        \qmlproperty int level

        This property holds the label level that controls
        font style and size.

        Only values between 1 and 4 are allowed.

        Default value is 1.
    */
    property int level: 1

    font.pixelSize: FluidControls.Config.fontSubHeading
    onLevelChanged: {
        if (level < 1 || level > 2)
            console.error("BodyLabel level must be either 1 or 2");
    }
}

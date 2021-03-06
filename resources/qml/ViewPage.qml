// Copyright (c) 2015 Ultimaker B.V.
// Cura is released under the terms of the AGPLv3 or higher.

import QtQuick 2.1
import QtQuick.Controls 1.1
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.1

import UM 1.1 as UM

UM.PreferencesPage
{
    id: preferencesPage

    //: View configuration page title
    title: catalog.i18nc("@title:window","View");

    function reset()
    {
        UM.Preferences.resetPreference("view/show_overhang");
        UM.Preferences.resetPreference("view/center_on_select");
        overhangCheckbox.checked = boolCheck(UM.Preferences.getValue("view/show_overhang"))
        centerCheckbox.checked = boolCheck(UM.Preferences.getValue("view/center_on_select"))
    }

    GridLayout
    {
        columns: 2;
        UM.I18nCatalog { id: catalog; name:"cura"}
        CheckBox
        {
            id: overhangCheckbox
            checked: boolCheck(UM.Preferences.getValue("view/show_overhang"))
            onCheckedChanged: UM.Preferences.setValue("view/show_overhang",  checked ? "True" : "False")
        }
        Button
        {
            id: viewText //is a button so the user doesn't have to click inconveniently precise to enable or disable the checkbox

            //: Display Overhang preference checkbox
            text: catalog.i18nc("@option:check","Display Overhang");
            onClicked: overhangCheckbox.checked = !overhangCheckbox.checked

            //: Display Overhang preference tooltip
            tooltip: catalog.i18nc("@info:tooltip","Highlight unsupported areas of the model in red. Without support these areas will not print properly.")

            style: ButtonStyle
            {
                background: Rectangle
                {
                    border.width: 0
                    color: "transparent"
                }
                label: Text
                {
                    renderType: Text.NativeRendering
                    horizontalAlignment: Text.AlignLeft
                    text: control.text
                }
            }
        }

        CheckBox
        {
            id: centerCheckbox
            checked: boolCheck(UM.Preferences.getValue("view/center_on_select"))
            onCheckedChanged: UM.Preferences.setValue("view/center_on_select",  checked ? "True" : "False")
        }
        Button
        {
            id: centerText //is a button so the user doesn't have to click inconveniently precise to enable or disable the checkbox

            //: Display Center camera preference checkbox
            text: catalog.i18nc("@action:button","Center camera when item is selected");
            onClicked: centerCheckbox.checked = !centerCheckbox.checked

            //: Display Center camera preference tooltip
            tooltip: catalog.i18nc("@info:tooltip","Moves the camera so the object is in the center of the view when an object is selected")

            style: ButtonStyle
            {
                background: Rectangle
                {
                    border.width: 0
                    color: "transparent"
                }
                label: Text
                {
                    renderType: Text.NativeRendering
                    horizontalAlignment: Text.AlignLeft
                    text: control.text
                }
            }
        }
        Item { Layout.fillHeight: true; Layout.columnSpan: 2 }
    }
}

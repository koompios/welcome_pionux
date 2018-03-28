/***************************************************************************
 *   Copyright (C) 2018 Anke Boersma <demm@kaosx.us>       *
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 *   This program is distributed in the hope that it will be useful,       *
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of        *
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         *
 *   GNU General Public License for more details.                          *
 *                                                                         *
 *   You should have received a copy of the GNU General Public License     *
 *   along with this program; if not, write to the                         *
 *   Free Software Foundation, Inc.,                                       *
 *   51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.          *
 ***************************************************************************/
import QtQuick 2.7
import QtQuick.Controls 2.2
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.1

Window {
    width: 960
    height: 640
    visible: true
    minimumWidth: 960
    maximumWidth: 960
    minimumHeight: 640
    maximumHeight: 640
    title: "Guide"
    
    ScrollView {
        id: view
        hoverEnabled: true
        anchors.fill: parent
        contentHeight:10000
        ScrollBar.vertical.width: 5
        ScrollBar.vertical.policy: ScrollBar.AlwaysOn
        ScrollBar.horizontal.policy: ScrollBar.AlwaysOff
        focus: false

        Rectangle {
            id: rectangle
            x: 6
            y: 6
            width: 920
            height: 10000
            color: "#00000000"
            border.width: 0
            border.color: "#00000000"

            TextArea {
                id: intro
                x: 14
                y: 0
                width: 920
                height: 1753
                font.pointSize: 14
                textFormat: Text.RichText
                onLinkActivated: Qt.openUrlExternally(link)
                antialiasing: true
                activeFocusOnPress: false
                wrapMode: Text.WordWrap

                text: qsTr("<h3>Installation Guide</h3>

                <p>Now that you have seen some of how KaOS works in live mode, you might be ready to install. Before doing so, it is best to understand a few things.</p>

                <p>As with any rolling release, updating regularly is a must, fall too far behind, and trying to update then will likely cause issues. Recommended is to update weekly, no less than once a month. If that is something not feasible for you, it might be better to consider using a static distribution, with a six or nine month release cycle. If any instructions are needed for an update to KaOS, <a href='http://kaosx.us/news/'>kaosx.us/news/</a> will always warn you about them (which will be shown in Octopi, the package manager too). It is best to familiarize yourself with the command line <a href='https://kaosx.us/docs/pacman/'>package manager pacman</a>. Any distribution has to implement major changes at times, a rolling distribution has to rely on the package manager to interact with the users to make sure such updates are done correctly. Since rolling inherently means, no re-install at set intervals (a static distribution can use such needed re-install to introduce major changes). No GUI for pacman is as powerful as pacman itself in those situations.</p>

                <p>Calamares, the installer of KaOS is straightforward and easy to use, but lacks some features at this stage. RAID disk setups is not supported yet.</p>

                <h3>Starting the Installer</h3>

                <p>The first page gives you some information of the current status of the installer and an option to select what language will be used for the installer.</p>
                
                <p>Ensure that your system meets the minimal requirements. Not having an internet connection during the install is no deal breaker and won't stop the install from going trough.</p>
                
                <p>Having less than the shown disc space or available RAM will almost certainly fail the install. As for disc space, a minimum of 20 Gb is recommended.</p>")

                Image {
                    id: image
                    x: 8
                    y: 750
                    width: 920
                    height: 494
                    fillMode: Image.PreserveAspectFit
                    source: "images/guide/cala1.png"
                }

                Image {
                    id: image1
                    x: 8
                    y: 1250
                    width: 920
                    height: 499
                    fillMode: Image.PreserveAspectFit
                    source: "images/guide/cala2.png"
                }
            }
            
            TextArea {
                id: notes
                x: 14
                y: 1748
                width: 920
                height: 2000
                font.pointSize: 14
                textFormat: Text.RichText
                onLinkActivated: Qt.openUrlExternally(link)
                antialiasing: true
                activeFocusOnPress: false
                wrapMode: Text.WordWrap

                text: qsTr("<p>The Release Notes give you important information of what is included in this ISO</p>
                <p>If you selected non-free Nvidia during the start-up of the Live session, you will be presented with a License page.  Make sure to read and accept the license, otherwise your install will not include the non-free driver, and will fallback to Nouveau instead. You won't see this page if you selected to use the free drivers.</p>
                <p>Next is the Keyboard Setup. You can test the layout by typing something in the designated area.</p>

                <p>Use the drop-down menu to fine tune to your exact desired keyboard model.</p>")


                Image {
                    id: image3
                    x: 0
                    y: 289
                    width: 920
                    height: 494
                    fillMode: Image.PreserveAspectFit
                    source: "images/guide/cala3.png"
                }

                Image {
                    id: image4
                    x: 0
                    y: 768
                    width: 920
                    height: 499
                    fillMode: Image.PreserveAspectFit
                    source: "images/guide/cala4.png"
                }
            }

            TextArea {
                id: noteskeyboard
                x: 14
                y: 3021
                width: 920
                height: 2000
                font.pointSize: 14
                textFormat: Text.RichText
                onLinkActivated: Qt.openUrlExternally(link)
                antialiasing: true
                activeFocusOnPress: false
                wrapMode: Text.WordWrap

                text: qsTr("<p>Next is the Keyboard Setup. You can test the layout by typing something in the designated area.</p>

                <p>Use the drop-down menu to fine tune to your exact desired keyboard model.</p>")
                clip: false
                visible: true


                Image {
                    id: image5
                    x: 0
                    y: 95
                    width: 920
                    height: 494
                    fillMode: Image.PreserveAspectFit
                    source: "images/guide/cala3.png"
                }

                Image {
                    id: image6
                    x: 8
                    y: 570
                    width: 920
                    height: 499
                    fillMode: Image.PreserveAspectFit
                    source: "images/guide/cala4.png"
                }
            }
        }
    }
}

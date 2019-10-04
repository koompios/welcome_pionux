/***************************************************************************
 *   Copyright (C) 2017 Anke Boersma <demm@kaosx.us>       *
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
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Window 2.0
import QtQuick.Dialogs 1.2
import MyLang 0.1

ApplicationWindow {

    Page1 {
   id: page1
            }


    QtObject{
        id: priv
        property var text_title: qsTr("Welcome To Pionux")
        property var change_text:  qsTr("<div> Choose Language </div>")
        property var info: qsTr("<div>Thanks for trying KaOS. In need of the password file or package list?<br>
                            Want to learn more about the project? Please find the links below.<br><br>
                            Don't hesitate to give your opinion about KaOS in the Forum.</div>")
        property var button_arr: [qsTr("Documentation"),  qsTr("Guide"), qsTr("Forum"),qsTr("Package List")]
        property var switch_bar:[qsTr("Main"), qsTr("About")]
    }
    visible: true
    minimumWidth: 700
    maximumWidth: 700
    minimumHeight: 420
    maximumHeight: 420
    font.capitalization: Font.MixedCase
    x: Screen.width / 2 - width / 2
    y: Screen.height / 2 - height / 2
    title: qsTr(priv.text_title)+ Mytrans.emptyString

    Rectangle{
            anchors.fill: parent
            height: 20

        }
    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        Page1 {


            Column{
                spacing:5
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            Row{

                anchors.horizontalCenter: parent.horizontalCenter

                Label{

                        id:label_language
                        height: 20

                          anchors.verticalCenter:  parent.verticalCenter

                        text: qsTr(priv.change_text) + Mytrans.emptyString

                    }
                    ComboBox {
                        id: lang_combobox

                        model: [ "English", "ខ្មែរ", "Français" ]
    //                    onPressedChanged: console.debug("debug message")
                        onCurrentIndexChanged: {
                                    console.log("currentIndex", lang_combobox.currentIndex)
                                    if (lang_combobox.currentIndex === 0) {
                                        console.log(MyLang.ENG)
                                        Mytrans.updateLanguage(MyLang.ENG)
                                        console.log('Name before change: ' + page1Form.button4.text);
                                        page1.button5text= qsTr(priv.button_arr[2]) + Mytrans.emptyString
                                        page1.button4text=qsTr(priv.button_arr[3]) + Mytrans.emptyString
                                        page1.button6text= qsTr(priv.button_arr[0])+ Mytrans.emptyString
                                        page1.button3text=  qsTr(priv.button_arr[1])+ Mytrans.emptyString
                                    }
                                    if (lang_combobox.currentIndex === 1) {
                                        console.log("Khmer")

                                        Mytrans.updateLanguage(MyLang.KH)
//                                        new ChangeText();
                                        page1.button3Text= qsTr(priv.button_arr[2]) + Mytrans.emptyString;
                                        page1.button4Text= qsTr(priv.button_arr[3])+ Mytrans.emptyString;
                                        page1.button6Text= qsTr(priv.button_arr[0])+ Mytrans.emptyString;
                                        page1.button3Text='hello world';
                                    }
                                    if (lang_combobox.currentIndex === 2) {
                                        console.log("French")
                                        Mytrans.updateLanguage(MyLang.FR)
                                        page1.button5Text= qsTr(priv.button_arr[2]) + Mytrans.emptyString;
                                        page1.button4Text= qsTr(priv.button_arr[3])+ Mytrans.emptyString;
                                        page1.button6Text= qsTr(priv.button_arr[0])+ Mytrans.emptyString;
                                        page1.button3Text=  qsTr(priv.button_arr[1])+ Mytrans.emptyString;
                                    }

                                }

                    }
                 }

             Label {
                 horizontalAlignment: Text.AlignCenter
                anchors.horizontalCenter: parent.horizontalCenter

                text: qsTr(priv.info) + Mytrans.emptyString

            }

          }
        }

//        Page {
//            Label {
//                textFormat: Text.RichText
//                //: Do not translate root/root and live/live
//                text: qsTr("<p>Correct passwords for use in the live session:</p>
//                            <p></p>
//                            <table width=100% align=center bgcolor=#eaeaea>
//                                <tr>
//                                    <th>Username:</th>
//                                    <th>Password:</th>
//                                </tr>
//                                <tr>
//                                    <td align=center>root</td>
//                                    <td align=center>root</td>
//                                </tr>
//                                <tr>
//                                    <td align=center>live</td>
//                                    <td align=center>live</td>
//                                </tr>
//                            </table>
//                            <p>Hope you enjoy</p>")
//                anchors.centerIn: parent
//                horizontalAlignment: Text.AlignHCenter
//                Image {
//                    id: image
//                    anchors.centerIn: parent
//                    anchors.verticalCenterOffset : 100
//                    width: 22
//                    height: 22
//                    source: "images/face-smile-grin.svg"
//                }
//            }
//        }
        
        Page {
            Loader {
                id: about
                source: "about.qml"
            }
            
        }
    }

    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex
        TabButton {
            text: qsTr(priv.switch_bar[0])+ Mytrans.emptyString
        }
//        TabButton {
//            text: qsTr("Passwords")
//        }
        TabButton {
            text: qsTr(priv.switch_bar[1])+ Mytrans.emptyString
        }
    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/

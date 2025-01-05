import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    visible: true
    width: 400
    height: 250
    title: "Base Converter"

    // Application style for a soft, modern look
    color: "#F4F4F9"
    Rectangle {
        anchors.fill: parent
        radius: 12
        color: "#FFFFFF"
        border.color: "#D1D1D1"
        border.width: 1

        Column {
            anchors.centerIn: parent
            spacing: 20
            width: parent.width * 0.9

            // Base X ComboBox (from base 2 to base 36)
            ComboBox {
                id: fromBaseComboBox
                width: parent.width
                model: [
                    "Base 2 (Binary)", "Base 3", "Base 4", "Base 5", "Base 6", "Base 7",
                    "Base 8 (Octal)", "Base 9", "Base 10 (Decimal)", "Base 11", "Base 12",
                    "Base 13", "Base 14", "Base 15", "Base 16 (Hexadecimal)", "Base 17",
                    "Base 18", "Base 19", "Base 20", "Base 21", "Base 22", "Base 23",
                    "Base 24", "Base 25", "Base 26", "Base 27", "Base 28", "Base 29",
                    "Base 30", "Base 31", "Base 32", "Base 33", "Base 34", "Base 35",
                    "Base 36"
                ]
            }

            // Input field for the number
            TextField {
                id: inputField
                width: parent.width
                placeholderText: "Enter number in selected base"
                font.pixelSize: 18
                color: "#333333"
                background: Rectangle {
                    color: "#EAEAEA"
                    radius: 6
                    border.color: "#D1D1D1"
                    border.width: 1
                }
            }

            // Base Y ComboBox (from base 2 to base 36)
            ComboBox {
                id: toBaseComboBox
                width: parent.width
                model: [
                    "Base 2 (Binary)", "Base 3", "Base 4", "Base 5", "Base 6", "Base 7",
                    "Base 8 (Octal)", "Base 9", "Base 10 (Decimal)", "Base 11", "Base 12",
                    "Base 13", "Base 14", "Base 15", "Base 16 (Hexadecimal)", "Base 17",
                    "Base 18", "Base 19", "Base 20", "Base 21", "Base 22", "Base 23",
                    "Base 24", "Base 25", "Base 26", "Base 27", "Base 28", "Base 29",
                    "Base 30", "Base 31", "Base 32", "Base 33", "Base 34", "Base 35",
                    "Base 36"
                ]
            }

            // Button to trigger conversion
            Button {
                text: "Convert"
                width: parent.width
                onClicked: {
                    var number = inputField.text;
                    var fromBase = fromBaseComboBox.currentIndex + 2; // Base starts from 2
                    var toBase = toBaseComboBox.currentIndex + 2;     // Base starts from 2
                    if (number.trim() !== "") {
                        resultText.text = converter.convertBase(number, fromBase, toBase);
                    } else {
                        resultText.text = "Please enter a number.";
                    }
                }
            }

            // Text field to display the result
            Text {
                id: resultText
                width: parent.width
                color: "#4CAF50"
                font.pixelSize: 18
                font.bold: true
                horizontalAlignment: Text.AlignHCenter
            }
        }
    }
}

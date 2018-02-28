import QtQuick 2.7
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.4
import QtGraphicalEffects 1.0

/*!
 \qmltype CustomButton
 \ingroup Buttons

 \brief This is a special QML to use the Effect of a Button in many different Styles.
 */

Rectangle {
    id: buttonRoot
    /*!
     \qmlproperty string text
     */
    property string text: ""
    /*!
     \qmlproperty color contentColor
     */
    property color contentColor: "#AAAAAA"
    /*!
     \qmlproperty bool isFlickButton
     */
    property bool isFlickButton: false
    /*!
     \qmlproperty bool isFlickButton
     */
    property bool isArrowButton: false
    /*!
     \qmlproperty bool isPressAndHoldButton
     */
    property bool isPressAndHoldButton: false
    /*!
     \qmlproperty bool isHoldButtonState
     */
    property bool isHoldButtonState: false
    /*!
     \qmlproperty bool isComboButton
     */
    property bool isComboButton: false
    /*!
     \qmlproperty bool isCommonButton
     */
    property bool isCommonButton: false
    /*!
     \qmlproperty int tintingHeight
     */
    property int tintingHeight: 10
    /*!
     \qmlproperty bool topTintingVisible
     */
    property bool topTintingVisible: false
    /*!
     \qmlproperty bool bottomTintingVisible
     */
    property bool bottomTintingVisible: false
    /*!
     \qmlproperty bool borderColor
     */
    property color borderColor: "#404040"
    /*!
     \qmlproperty color okColor
     */
    property color commonInitiatorColor: "#AAAAAA"
    /*!
     \qmlproperty color clickedBorderColor
     */
    property color clickedBorderColor: "#66C4007A"
    /*!
     \qmlproperty int borderWidth
     */
    property int borderWidth: 2
    /*!
     \qmlproperty bool backgroundColor
     */
    property color backgroundColor: "#77000000"
    /*!
     \qmlproperty bool isCurrentItem
     */
    property bool isCurrentItem: false
    /*!
     \qmlsignal buttonClicked()
     */
    signal buttonClicked
    /*!
     \qmlsignal buttonPressed()
     */
    signal buttonPressed
    /*!
     \qmlsignal buttonReleased()
     */
    signal buttonReleased
    /*!
     \qmlsignal buttonFlickedDown()
     */
    signal buttonFlickedDown
    /*!
     \qmlsignal buttonFlickedUp()
     */
    signal buttonFlickedUp
    /*!
     \qmlsignal buttonHoldPressed
     */
    signal buttonHoldPressed
    /*!
     \qmlsignal buttonLeftClicked()
     */
    signal buttonLeftClicked
    /*!
     \qmlsignal buttonRightClicked()
     */
    signal buttonRightClicked
    /*!
     \qmlsignal buttonFlickedLeft()
     */
    signal buttonFlickedLeft
    /*!
     \qmlsignal buttonFlickedRight()
     */
    signal buttonFlickedRight

    radius: height / 10 > 10 ? 10 : height / 10

    color: backgroundColor

    border.width: buttonRoot.borderWidth
    border.color: isCommonButton ? backgroundColor : buttonRoot.borderColor

    opacity: enabled ? 1.0 : 0.6

    state: "released"

    onIsCurrentItemChanged: state = "pressed"

    Rectangle {
        id: flickButtonBackground
        anchors.fill: parent

        color: 'transparent'

        visible: buttonRoot.isFlickButton

        Rectangle {
            id: topFlickSign

            anchors.topMargin: buttonRoot.borderWidth
            anchors.top: parent.top

            width: parent.width - 2 * buttonRoot.radius
            height: buttonRoot.tintingHeight

            anchors.horizontalCenter: parent.horizontalCenter

            opacity: 0.5

            visible: buttonRoot.topTintingVisible

            gradient: Gradient {
                GradientStop {
                    position: 0.00;
                    color: contentColor
                }
                GradientStop {
                    position: 1.00;
                    color: 'transparent'
                }
            }

            Canvas {
                width: parent.width / 3
                height: parent.height / 2
                anchors.centerIn: parent

                renderTarget: Canvas.FramebufferObject

                onPaint: {
                    var ctx = getContext("2d")
                    ctx.save();
                    ctx.lineJoin = "round"
                    ctx.fillStyle = clickedBorderColor
                    ctx.beginPath();
                    ctx.moveTo(0,height);
                    ctx.lineTo(width,height);
                    ctx.lineTo(width/2, 0);
                    ctx.fill();
                    ctx.restore();
                }
            }
        }

        Rectangle {
            id: bottomFlickSign

            anchors.bottomMargin: buttonRoot.borderWidth
            anchors.bottom: parent.bottom

            width: parent.width - 2 * buttonRoot.radius
            height: buttonRoot.tintingHeight

            anchors.horizontalCenter: parent.horizontalCenter

            opacity: 0.5

            visible: buttonRoot.bottomTintingVisible

            gradient: Gradient {
                GradientStop {
                    position: 0.00
                    color: 'transparent'
                }
                GradientStop {
                    position: 1.00
                    color: contentColor
                }
            }

            Canvas {
                width: parent.width / 3
                height: parent.height / 2
                anchors.centerIn: parent

                renderTarget: Canvas.FramebufferObject

                onPaint: {
                    var ctx = getContext("2d")
                    ctx.save();
                    ctx.lineJoin = "round"
                    ctx.lineWidth = 2;
                    ctx.fillStyle = clickedBorderColor
                    ctx.beginPath();
                    ctx.moveTo(0,0);
                    ctx.lineTo(width,0);
                    ctx.lineTo(width/2, height);
                    ctx.closePath();
                    ctx.fill();
                    ctx.restore();
                }
            }
        }
    }

    Rectangle {
        id: arrowButtonBackground
        anchors.fill: parent

        color: 'transparent'

        visible: buttonRoot.isArrowButton

        Canvas {
            id: arrowButtonCanvas
            antialiasing: true

            anchors.fill: parent

            renderTarget: Canvas.FramebufferObject
            renderStrategy: Canvas.Cooperative

            property real wCascade: width / 30
            property real hCascade: height / 10

            onPaint: {
                var ctx = getContext("2d");
                ctx.save();
                ctx.clearRect(0, 0, width, height);
                ctx.lineWidth = 4;
                ctx.fillStyle = contentColor;
                ctx.globalAlpha = 1.0;
                ctx.lineJoin = "round";
                ctx.beginPath();

                ctx.moveTo(2 * wCascade, 5 * hCascade);
                ctx.lineTo(8 * wCascade, 2 * hCascade);
                ctx.lineTo(8 * wCascade, 8 * hCascade);
                ctx.lineTo(2 * wCascade, 5 * hCascade);

                ctx.moveTo(28 * wCascade, 5 * hCascade);
                ctx.lineTo(22 * wCascade, 2 * hCascade);
                ctx.lineTo(22 * wCascade, 8 * hCascade);
                ctx.lineTo(28 * wCascade, 5 * hCascade);
                ctx.closePath();

                ctx.fill();
                ctx.restore();
            }
        }

        Text {
            id: text
            text: buttonRoot.text

            anchors.centerIn: parent

            font.family: 'Verdana'
            font.bold: true
            font.pixelSize: parent.height / 4
            color: contentColor

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
        }
    }

    Rectangle {
        id: commonButtonBackground
        anchors.fill: parent

        color: 'transparent'

        visible: buttonRoot.isCommonButton

        Canvas {
            id: commonButtonCanvas
            antialiasing: true

            anchors.fill: parent

            property real vCascade: width / 30
            property real hCascade: height / 10
            property color color: buttonRoot.commonInitiatorColor

            onColorChanged: requestPaint();

            onPaint: {
                var ctx = getContext("2d");
                ctx.save();
                ctx.clearRect(0,0,width, height / 2);
                ctx.lineWidth = 2;

                ctx.globalAlpha = 1.0;
                ctx.lineJoin = "round";
                ctx.beginPath();

                ctx.moveTo(1 * vCascade, 2 * hCascade);
                ctx.lineTo(29 * vCascade, 2 * hCascade);
                ctx.lineTo(29 * vCascade, 1 * hCascade);
                ctx.lineTo(18 * vCascade, 1 * hCascade)
                ctx.closePath();

                var gradient = ctx.createLinearGradient(29 * vCascade, 1 * hCascade , 29 * vCascade , 2 * hCascade)
                gradient.addColorStop(0.0, commonInitiatorColor);
                gradient.addColorStop(1.0, "transparent");

                ctx.fillStyle = gradient;
                ctx.fill();
                ctx.restore();
            }
        }

        Canvas {
            id: commonButtonComboBoxPaint
            antialiasing: true

            anchors.fill: parent

            property real wCascade: width / 30
            property real hCascade: height / 10
            property string state: buttonRoot.state

            onStateChanged: requestPaint();

            onPaint: {
                var ctx = getContext("2d");
                ctx.save();
                ctx.clearRect(0, height / 2, width, height / 2);
                ctx.lineWidth = 4;
                ctx.fillStyle = contentColor;
                ctx.globalAlpha = isComboButton && buttonRoot.state !== "pressed" ? 0.6 : 0.0;
                ctx.lineJoin = "round";
                ctx.beginPath();

                ctx.moveTo(25 * wCascade, 9 * hCascade);
                ctx.lineTo(29 * wCascade, 9 * hCascade);
                ctx.lineTo(29 * wCascade, 5 * hCascade);
                ctx.closePath();

                ctx.fill();
                ctx.restore();
            }
        }

        Canvas {
            id: commonButtonPressAndHoldBoxPaint
            antialiasing: true

            anchors.fill: parent

            property real wCascade: width / 30
            property real hCascade: height / 10
            property string state: buttonRoot.state
            property bool isPressAndHold: buttonRoot.isPressAndHoldButton

            onStateChanged: requestPaint();
            onIsPressAndHoldChanged: requestPaint();

            onPaint: {
                var ctx = getContext("2d");
                ctx.save();
                ctx.clearRect(0, height / 2, width, height / 2);
                ctx.lineWidth = 4;
                ctx.fillStyle = contentColor;
                ctx.globalAlpha = isPressAndHold && state !== "hold" ? 1.0 : 0.0;
                ctx.lineJoin = "round";
                ctx.beginPath();

                ctx.moveTo(27 * wCascade, 7 * hCascade);
                ctx.arc(28 * wCascade, 8 * hCascade, wCascade, 0, 2 * Math.PI, true);

                ctx.fill();
                ctx.restore();
            }
        }

        Text {
            id: commonButtonText
            text: buttonRoot.text

            anchors.centerIn: parent

            font.family: 'Verdana'
            font.bold: true
            font.pixelSize: buttonRoot.height / 4
            color: contentColor
        }
    }

    MouseArea {
        id: buttonMouseArea
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton

        property int mouseStartPositionY: 0
        property int mouseStartPositionX: 0
        property bool signalEmitted: false
        property int mouseDelta: 100

        onPressed: {
            mouseStartPositionY = mouseY
            mouseStartPositionX = mouseX
            signalEmitted = false

            if (!isHoldButtonState)
            {
                buttonRoot.state = "pressed"
            }
            buttonRoot.buttonPressed()
        }

        onReleased: {
            if (Animation.running)
            {
                Animation.stop();
            }
            if (!signalEmitted)
            {
                if (!isHoldButtonState)
                {
                    buttonRoot.state = "released"
                }
                buttonRoot.buttonReleased()
            }
        }

        onClicked: {
            if (!signalEmitted)
            {
                if (isArrowButton)
                {
                    if (mouseX < buttonRoot.width / 2)
                    {
                        buttonRoot.buttonLeftClicked();
                    }else{
                        buttonRoot.buttonRightClicked();
                    }
                }

                if (isCommonButton)
                {
                    if (isHoldButtonState)
                    {
                        if (buttonRoot.state == "pressed")
                        {
                            buttonRoot.state = "released"
                        }else{
                            buttonRoot.state = "pressed"
                        }
                    }
                }
                buttonRoot.buttonClicked()
            }
        }

        onPressAndHold: {
            if (buttonRoot.isPressAndHoldButton)
            {
                buttonRoot.state = "hold";
            }
        }

        onPositionChanged: {
            if (isFlickButton)
            {
                if (mouseY > mouseStartPositionY)
                {
                    if (mouseY - mouseStartPositionY > mouseDelta)
                    {
                        if (!signalEmitted)
                        {
                            buttonRoot.buttonFlickedDown();
                            signalEmitted = true;
                            buttonRoot.state = "released";
                        }
                    }
                }else{
                    if (mouseStartPositionY - mouseY > mouseDelta)
                    {
                        if (!signalEmitted)
                        {
                            buttonRoot.buttonFlickedUp()
                            signalEmitted = true;
                            buttonRoot.state = "released";
                        }
                    }
                }
            }

            if (isArrowButton)
            {
                if (mouseX > mouseStartPositionX)
                {
                    if (mouseX - mouseStartPositionX > mouseDelta)
                    {
                        if (!signalEmitted)
                        {
                            buttonRoot.buttonFlickedRight()
                            signalEmitted = true;
                            buttonRoot.state = "released";
                        }
                    }
                }else{
                    if (mouseStartPositionX - mouseX > mouseDelta)
                    {
                        if (!signalEmitted)
                        {
                            buttonRoot.buttonFlickedLeft()
                            signalEmitted = true;
                            buttonRoot.state = "released";
                        }
                    }
                }
            }
        }
    }

    states: [
        State {
            name: "released"
            PropertyChanges {
                target: buttonRoot.border
                color: isCommonButton ? backgroundColor : buttonRoot.borderColor
            }
        },
        State {
            name: "pressed"
            PropertyChanges {
                target: buttonRoot.border
                color: buttonRoot.clickedBorderColor
            }
        },
        State {
            name: "hold"
            PropertyChanges {
                target: buttonRoot.border
                color: buttonRoot.isCurrentItem ? buttonRoot.borderColor : buttonRoot.clickedBorderColor
            }
            PropertyChanges {
                target: buttonRoot
                color: buttonRoot.isCurrentItem ? buttonRoot.backgroundColor : buttonRoot.clickedBorderColor
            }
        }
    ]

    transitions: [
        Transition {
            from: "*"
            to: "hold"
            ColorAnimation {
                properties: "color"
                duration: 2000
                easing.type: Easing.InOutQuad
            }
            onRunningChanged: {
                console.log(state)
                if ((state == "hold") && (!running))
                {
                    buttonRoot.buttonHoldPressed()
                    buttonMouseArea.signalEmitted = true
                    if (isCurrentItem)
                    {
                        state = "pressed";
                    }else{
                        state = "released"
                    }
                }
            }
        },
        Transition {
            from: "hold"
            to: "released"
            ColorAnimation {
                properties: "color"
                duration: 0
            }
        }
    ]
}

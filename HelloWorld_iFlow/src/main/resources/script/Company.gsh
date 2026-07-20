import com.sap.gateway.ip.core.customdev.util.Message

def Message processData(Message message) {

    message.setProperty("company", "OpenAI")

    return message
}
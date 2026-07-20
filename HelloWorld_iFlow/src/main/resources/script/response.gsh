import com.sap.gateway.ip.core.customdev.util.Message
import groovy.json.JsonSlurper
import groovy.json.JsonBuilder

def Message processData(Message message) {
    
    // Get the incoming payload
    def body = message.getBody(String)
    
    // Parse JSON input
    def jsonSlurper = new JsonSlurper()
    def input = jsonSlurper.parseText(body)
    
    // Extract value (with default fallback)
    def name = input.name ?: "Guest"
    
    // Build response JSON
    def response = [
        greeting: "Hello, ${name}!",
        timestamp: new Date().format("yyyy-MM-dd HH:mm:ss"),
        status: "success"
    ]
    
    def jsonBuilder = new JsonBuilder(response)
    
    // Set the new payload
    message.setBody(jsonBuilder.toPrettyString())
    
    // Optional: set headers/properties
    message.setHeader("Content-Type", "application/json")
    message.setProperty("processedBy", "GroovyDemo")
    
    return message
}
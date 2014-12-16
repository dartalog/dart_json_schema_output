part of json_schema_output;

class JsonSchema extends JsonSchemaTypeEntry {
  final String schema;
  
  JsonSchema(this.schema, String type): super(type) {
    
  }
  
  Map toJson() { 
    Map<String, Object> output = new Map<String,Object>();
    output["\$schema"] = schema;
    output.addAll(super.toJson());
    return output;
  }
}

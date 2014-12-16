part of json_schema_output;

class JsonSchemaCombinedEntry extends JsonSchemaEntry {
  
  final String argument; 
  final List<JsonSchemaEntry> schemas = new List<JsonSchemaEntry>();
  
  
  JsonSchemaCombinedEntry(this.argument) {
    
  }
  
  Map toJson() {
    Map<String,dynamic> output = new Map<String,dynamic>();
    output[argument] = schemas;
    return output;
  }
}
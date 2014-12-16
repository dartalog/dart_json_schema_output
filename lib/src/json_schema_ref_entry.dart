part of json_schema_output;

class JsonSchemaRefEntry extends JsonSchemaEntry {
  final String path;
  // JSON Pointer syntax: http://tools.ietf.org/html/draft-pbryan-zyp-json-pointer-02
  JsonSchemaRefEntry(this.path);
  
  Map toJson() {
    Map<String,String> output = new Map<String,String>();
    output["\$ref"] = path;
    return output;
  }
}
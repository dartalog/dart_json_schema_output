part of json_schema_output;

// An implementation for generating JSON Schema links, as defined at
// http://json-schema.org/latest/json-schema-hypermedia.html
class JsonSchemaLink {

  final String Rel;
  final String Href;
  final String Method;

  String Title;

  JsonSchemaEntry Schema;

  JsonSchemaLink(this.Rel, this.Href, [this.Method = "GET"]) {

  }

  Map toJson() { 
    Map<String, Object> output = new Map<String, Object>();

    if (this.Title != null) {
      output["title"] = this.Title;
    }

    if (this.Rel != null) {
      output["rel"] = this.Rel;
    }

    if (this.Href != null) {
      output["href"] = this.Href;
    }

    if (this.Method != null) {
      output["method"] = this.Method;
    }

    if (this.Schema != null) {
      output["schema"] = this.Schema;
    }


    return output;
  }
}

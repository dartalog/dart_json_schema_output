part of json_schema_output;

class JsonSchemaTypeEntry extends JsonSchemaEntry {
  String title = null;
  String description = null;
  bool readOnly = false;
  
  final List<String> _types = new List<String>();

  dynamic defaultValue = null;
  final List enumValues = new List();
  
  // Object-related properties
  final Map<String,JsonSchemaEntry> _objectProperties = new Map<String,JsonSchemaEntry>();
  final Map<String,JsonSchemaEntry> _objectPatternProperties = new Map<String,JsonSchemaEntry>();
  JsonSchemaEntry additionalProperties = null;
  final List<String> _requiredProperties = new List<String>();
  final Map<String,List<String>> _dependencies = new  Map<String,List<String>>();
  int _minProperties = null, _maxProperties = null;
  
  int get propertiesCount {
    return this._objectProperties.length;
  }
  int get minProperties => _minProperties;
  void set minProperties(int number) {
    if(number!=null&&number<0) {
      throw new Exception("minProperties must be set to a non-negative integer, {number} was provided");
    }
    _minProperties = number;
  }
  int get maxProperties => _maxProperties;
  void set maxProperties(int number) {
    if(number!=null&&number<0) {
      throw new Exception("maxProperties must be set to a non-negative integer, {number} was provided");
    }
    _maxProperties = number;
  }
  // End of object-related properties
  
  // String-related properties
  int _minLength = null, _maxLength = null;
  String pattern = null;
  String format = null;
//  "date-time": Date representation, as defined by RFC 3339, section 5.6.
//  "email": Internet email address, see RFC 5322, section 3.4.1.
//  "hostname": Internet host name, see RFC 1034, section 3.1.
//  "ipv4": IPv4 address, according to dotted-quad ABNF syntax as defined in RFC 2673, section 3.2.
//  "ipv6": IPv6 address, as defined in RFC 2373, section 2.2.
//  "uri": A universal resource identifier (URI), according to RFC3986.
  
  num get minLength => _minLength;
  void set minLength(num number) {
    if(number!=null&&number<0) {
      throw new Exception("minLength must be set to a non-negative number, {number} was provided");
    }
    _minLength = number;
  }
  num get maxLength => _maxLength;
  void set maxLength(num number) {
    if(number!=null&&number<0) {
      throw new Exception("maxLength must be set to a non-negative number, {number} was provided");
    }
    _maxLength = number;
  }
  // End string-related properties
  
  
  // Numeric-related properties
  num _multipleOf = null, minimum = null, maximum = null;
  bool exclusiveMinimum = false, exclusiveMaximum = false;
  
  num get multipleOf => _multipleOf;
  void set multipleOf(num number) {
    if(number!=null&&number<1) {
      throw new Exception("multipleOf must be set to a positive number, {number} was provided");
    }
    _multipleOf = number;
  }
  // End numeric-related properties
  
  // Array-related properties
  final List<JsonSchemaTypeEntry> arrayItemsSchemas = new List<JsonSchemaTypeEntry>();
  int _minItems = null, _maxItems = null;
  bool uniqueItems = false;
  
  num get minItems => _minItems;
  void set minItems(num number) {
    if(number!=null&&number<0) {
      throw new Exception("minItems must be set to a non-negative number, {number} was provided");
    }
    _minItems = number;
  }
  num get maxItems => _maxItems;
  void set maxItems(num number) {
    if(number!=null&&number<0) {
      throw new Exception("maxItems must be set to a non-negative number, {number} was provided");
    }
    _maxItems = number;
  }

  // End array-related properties
  
  JsonSchemaTypeEntry(String type) {
    addType(type);
  }
  
  void addType(String type) {
    if(!_types.contains(type)) {
      _types.add(type);
    }
  } 
  
  void addProperty(String name, JsonSchemaEntry entry, [bool required = false]) {
    this._objectProperties[name] = entry;
    if(required) {
      this._requiredProperties.add(name);
    }
  }
  
  Map toJson() { 
    Map<String, Object> output = new Map<String, Object>();
    
    if(title!=null) {
      output["title"] = title;
    }
    if(description!=null) {
      output["description"] = description;
    }
    
    if(_types.length>0) {
      if(_types.length==1) {
        output["type"] = _types[0];
      } else {
        output["type"] = _types;
      }
    }

    if(_types.contains(JsonSchemaType.STRING)) {
      if(minLength!=null) {
        output["minLength"] = minLength;
      }
      if(maxLength!=null) {
        output["maxLength"] = maxLength;
      }
      if(pattern!=null) {
        output["pattern"] = pattern;
      }
      if(format!=null) {
        output["format"] = format;
      }
    }

    if(_types.contains(JsonSchemaType.NUMBER)||
        _types.contains(JsonSchemaType.INTEGER)) {
      
      if(_multipleOf!=null) {
        output["multipleOf"] = _multipleOf;
      }
      if(minimum!=null) {
        output["minimum"] = minimum;
      }
      if(maximum!=null) {
        output["maximum"] = maximum;
      }
      if(exclusiveMinimum) {
        output["exclusiveMinimum"] = true;
      }
      if(exclusiveMaximum) {
        output["exclusiveMaximum"] = true;
      }
    }
    
    if(_types.contains(JsonSchemaType.OBJECT)) {
      if(this._objectProperties.length>0) {
        Map<String,Map> properties = new Map<String,dynamic>();
        output["properties"] = properties;
        for(String name in this._objectProperties.keys) {
          properties[name] = this._objectProperties[name].toJson();
        }
      }
      if(this._objectPatternProperties.length>0) {
        Map<String,Map> properties = new Map<String,dynamic>();
        output["patternProperties"] = properties;
        for(String name in this._objectPatternProperties.keys) {
          properties[name] = this._objectPatternProperties[name].toJson();
        }
      }
      if(this._requiredProperties.length>0) {
        output["required"] = this._requiredProperties;
      }
      if(additionalProperties!=null) {
        output["additionalProperties"] = additionalProperties;
      }
      if(_minProperties!=null) {
        output["minProperties"] = _minProperties;
      }
      if(_maxProperties!=null) {
        output["maxProperties"] = _maxProperties;
      }
      
      if(_dependencies.length>0) {
        output["dependencies"] = _dependencies;        
      }
    }
    
    if(_types.contains(JsonSchemaType.ARRAY)) {
      if(arrayItemsSchemas.length>0) {
        if(arrayItemsSchemas.length==0) {
          output["items"] = arrayItemsSchemas[0];
        } else {
          output["items"] = arrayItemsSchemas;
        }
      }
      if(_minItems!=null) {
        output["minItems"] = _minItems;
      }
      if(_maxItems!=null) {
        output["maxItems"] = _maxItems;
      }
      if(uniqueItems) {
        output["uniqueItems"] = true;
      }
    }
    
    if(readOnly) {
       output["readOnly"] = true;
    }
    
    if(defaultValue!=null) {
      output["default"] = defaultValue;
    }
    
    if(enumValues.length>0) {
      output["enum"] = enumValues;
    }
    
    return output;
    }
}
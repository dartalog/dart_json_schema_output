// Copyright (c) 2014, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library json_schema_output;


part 'src/json_schema.dart';
part 'src/json_schema_entry.dart';
part 'src/json_schema_combined_entry.dart';
part 'src/json_schema_type_entry.dart';
part 'src/json_schema_ref_entry.dart';
part 'src/json_schema_link.dart';


abstract class JsonSchemaType {
  static const String STRING = "string";
  static const String INTEGER = "integer";
  static const String NUMBER = "number";
  static const String OBJECT = "object";
  static const String ARRAY = "array";
  static const String BOOLEAN = "boolean";
  static const String NULL = "null";
}

abstract class JsonSchemaCombineCommand {
  static const String ALL_OF = "allOf";
  static const String ANY_OF = "anyOf";
  static const String ONE_OF = "oneOf";
  static const String NOT = "notOf";
}

abstract class JsonSchemaVersionURLs {
  static const String JSON_SCHEMA_LATEST_URL = "http://json-schema.org/schema#";
  //JSON Schema written against the current version of the specification.

  static const String JSON_HYPER_SCHEMA_LATEST_URL = "http://json-schema.org/hyper-schema#";
  //JSON Schema hyperschema written against the current version of the specification.

  static const String JSON_SCHEMA_DRAFT04_URL = "http://json-schema.org/draft-04/schema#";
  //JSON Schema written against JSON Schema, draft v4

  static const String JSON_HYPER_SCHEMA_DRAFT04_URL = "http://json-schema.org/draft-04/hyper-schema#";
  //JSON Schema hyperschema written against JSON Schema, draft v4

  static const String JSON_SCHEMA_DRAFT03_URL = "http://json-schema.org/draft-03/schema#";
  //JSON Schema written against JSON Schema, draft v3

  static const String JSON_HYPER_SCHEMA_DRAFT03_URL = "http://json-schema.org/draft-03/hyper-schema#";
  //JSON Schema hyperschema written against JSON Schema, draft v3
}
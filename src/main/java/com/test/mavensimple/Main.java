package com.test.mavensimple;

import tools.jackson.databind.ObjectMapper;
import tools.jackson.databind.JsonNode;

public class Main {
  public static void main(String[] args) {
    try {
      ObjectMapper mapper = new ObjectMapper();

      String jsonString = "{\"name\":\"John Doe\",\"age\":30,\"city\":\"New York\",\"hobbies\":[\"reading\",\"coding\",\"gaming\"]}";
      JsonNode jsonNode = mapper.readTree(jsonString);
      String prettyJson = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(jsonNode);
      System.out.println(prettyJson);

    } catch (Exception e) {
      System.err.println("Error parsing JSON: " + e.getMessage());
      e.printStackTrace();
    }
  }
}

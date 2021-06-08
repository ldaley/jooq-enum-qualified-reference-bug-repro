Reproducer for https://github.com/jOOQ/jOOQ/issues/11972.

### Prerequisites:

- Docker enabled environment
- JDK 8 or higher
- `grep` on `$PATH`

### To reproduce

```
$ ./gradlew :showSchemaReferences
```

Output will be similar to:

```
> Task :showSchemaReferences
jooq-enum-qualified-reference-bug-repro/build/generated-src/jooq/main/generated/tables/Moods.java:97:              Internal.createCheck(this, DSL.name("moods_mood_check"), "((mood > 'sad'::custom_schema.mood))", true)
jooq-enum-qualified-reference-bug-repro/build/generated-src/jooq/main/generated/tables/SomeProcedure.java:125:              DSL.val(mood, SQLDataType.VARCHAR.defaultValue(DSL.field("NULL::custom_schema.mood", SQLDataType.VARCHAR)).asEnumDataType(generated.enums.Mood.class))
```

That `custom_schema` dereference is problematic, given https://github.com/ldaley/jooq-enum-qualified-reference-bug-repro/blob/d1fc30c85661e002335bb14b3181db7818d39626/build.gradle#L47.

The project can be easily imported into IDEA.
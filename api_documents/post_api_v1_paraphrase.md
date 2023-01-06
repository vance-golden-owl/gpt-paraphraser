# Paraphrase paragraph

Used to paraphrase paragraph.

**URL** : `/api/v1/paraphrase`

**Method** : `POST`

**Auth required** : YES

**Permissions required** : None

**Authorization**
- type: Token

**Data constraints**

```json
{
    "paragraph": "[input paragraph for translation]",
}
```

**Data example**

```json
{
    "paragraph": "The weather is sunny",
    "from": "vi",
    "to": "en"
}
```

## Success Response

**Code** : `200 OK`

**Content example**

```json
{
    "content": "The sky is clear and the sun is shining."
}
```

## Error Response

**Condition** : If token is invalid.

**Code** : `400 BAD REQUEST`

**Content** :

```json
HTTP Token: Access denied.
```
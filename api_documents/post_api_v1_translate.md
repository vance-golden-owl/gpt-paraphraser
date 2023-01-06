# Translate paragraph

Used to translate paragraph.

**URL** : `/api/v1/translate`

**Method** : `POST`

**Auth required** : YES

**Permissions required** : None

**Authorization**
- type: Token

**Data constraints**

```json
{
    "paragraph": "[input paragraph for translation]",
    "from": "[language to translate from]",
    "to": "[language to translate to]"
}
```

**Data example**

```json
{
    "paragraph": "Hôm nay trời nắng",
    "from": "vi",
    "to": "en"
}
```

## Success Response

**Code** : `200 OK`

**Content example**

```json
{
    "content": "It's sunny today"
}
```

## Error Response

**Condition** : If token is invalid.

**Code** : `400 BAD REQUEST`

**Content** :

```json
HTTP Token: Access denied.
```
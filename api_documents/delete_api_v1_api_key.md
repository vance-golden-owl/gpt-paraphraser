# Delete API key

Used to delete API key.

**URL** : `/api/v1/api_keys/:id`

**Method** : `DELETE`

**Auth required** : YES

**Permissions required** : None

**Authorization**
- type: Token

## Success Response

**Code** : `200 OK`

**Content example**

```json
  {
    "message": "API key \"<API_KEY_NAME>\" was destroyed successfully"
  }
```

## Error Response

**Condition** : If token is invalid.

**Code** : `400 BAD REQUEST`

**Content** :

```json
HTTP Token: Access denied.
```
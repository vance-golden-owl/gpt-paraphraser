# Create API key

Used to create API key.

**URL** : `/api/v1/api_keys`

**Method** : `POST`

**Auth required** : YES

**Permissions required** : None

**Authorization**
- type: Basic
```json
{
    "username": "[valid email address]",
    "password": "[password in plain text]"
}
```

## Success Response

**Code** : `200 OK`

**Content example**

```json
{
    "id": 24,
    "bearer_id": 1,
    "bearer_type": "User",
    "created_at": "2023-01-06T09:30:57.784Z",
    "updated_at": "2023-01-06T09:30:57.784Z",
    "name": "API generated key 30-16-06-01-2023",
    "token": "8b08052796a2281c9a75b4a330dc6cb7"
}
```

## Error Response

**Condition** : If 'username' and 'password' combination is wrong.

**Code** : `400 BAD REQUEST`

**Content** :

```json
{
    "error": "Unable to login with provided credentials"
}
```
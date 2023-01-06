# Get all user's API keys

Used to get all user's API keys.

**URL** : `/api/v1/api_keys`

**Method** : `GET`

**Auth required** : YES

**Permissions required** : None

**Authorization**
- type: Token

## Success Response

**Code** : `200 OK`

**Content example**

```json
[
    {
        "id": 23,
        "bearer_id": 1,
        "bearer_type": "User",
        "created_at": "2023-01-06T08:45:11.754Z",
        "updated_at": "2023-01-06T08:45:11.754Z",
        "name": "Local Mac"
    },
    {
        "id": 24,
        "bearer_id": 1,
        "bearer_type": "User",
        "created_at": "2023-01-06T09:30:57.784Z",
        "updated_at": "2023-01-06T09:30:57.784Z",
        "name": "API generated key 30-16-06-01-2023"
    },
    {
        "id": 25,
        "bearer_id": 1,
        "bearer_type": "User",
        "created_at": "2023-01-06T09:37:51.289Z",
        "updated_at": "2023-01-06T09:37:51.289Z",
        "name": "API generated key 37-16-06-01-2023"
    }
]
```

## Error Response

**Condition** : If token is invalid.

**Code** : `400 BAD REQUEST`

**Content** :

```json
HTTP Token: Access denied.
```
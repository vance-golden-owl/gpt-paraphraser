# Chat with GPT

Used to chat with GPT AI.

**URL** : `/api/v1/chat`

**Method** : `POST`

**Auth required** : YES

**Permissions required** : None

**Authorization**
- type: Token

**Data constraints**

```json
{
    "content": "[input paragraph for chat]",
}
```

**Data example**

```json
{
    "paragraph": "How was Khalifa Tower not collapse?"
}
```

## Success Response

**Code** : `200 OK`

**Content example**

```json
{
    "content": "Khalifa Tower was designed and constructed to a very high engineering standard to ensure its stability and durability. Special measures were taken to strengthen the structure, such as the use of steel and concrete frames and high-strength mortar joints. In addition, high-quality bricks were used that could not easily be broken, and extra-strong steel beams were used to further reinforce the structure. These measures, combined with rigorous safety evaluations, ensure that the Khalifa Tower remains structurally sound and stable."
}
```

## Error Response

**Condition** : If token is invalid.

**Code** : `400 BAD REQUEST`

**Content** :

```json
HTTP Token: Access denied.
```
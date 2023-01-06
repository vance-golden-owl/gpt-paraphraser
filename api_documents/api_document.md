# GPT Paraphraser tool API document

## Endpoints that require Authentication

* [Create API key](post_api_v1_api_keys.md) : `POST /api/v1/api_keys`

## Endpoints that require API token

* [Retrieve list of user's API keys](get_api_v1_api_keys.md) : `GET /api/v1/api_keys`
* [Delete API key](delete_api_v1_api_key.md) : `DELETE /api/v1/api_keys/:id`
* [Translate paragraphs](post_api_v1_translate.md) : `POST/api/v1/translate`
* [Paraphrase paragraphs](post_api_v1_paraphrase.md) : `POST /api/v1/paraphrase`
* [GPT Chat](post_api_v1_chat.md) : `POST /api/v1/chat`
# README

Create the `.env` file based on the `.env.example`.

```bash
cp .env.example .env
```

Register your app at https://auth.sch.bme.hu/, and set the values `AUTHSCH_CLIENT`, `AUTHSCH_KEY` in the `.env`.

## Possible errors
You might encounter the following error:

```
Authentication failure! csrf_detected: OmniAuth::Strategies::OAuth2::CallbackError, csrf_detected | CSRF detected
```
Just delete the cookies for the site and reload.
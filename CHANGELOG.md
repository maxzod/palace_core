## 0.0.2

- remove mirrors
- support .env files (queen_env)
- add req.contentType

## 0.0.1+3

- no more `palace.use(BodyParser());` its now powered by `palace_body_parser` out of the box ๐
- if you register to endpoint with same path end method this will throw exception and the server will not open
- rename`res.write()` to `res.send()` โ
- more tests ๐งช
- fix โ

  - `ip` bug ๐
  - fix `router.all()` โ
  - fix validation errors now come within list of strings fixed for all failures ๐โ

- new ๐ฅ
  - support exceptions , you throw and the palace will map them to responses example => `throw notFound()`;
  - local guards support ๐ช๐โโ๏ธ
  - public files guard ๐๐โโ๏ธ

## 0.0.1+2

- add res.created and res.ok ๐
- fix validation type miss match now it convert types to the dto by default if possible
- add mongodb example ๐ฟ

## 0.0.1+1

- update dependencies โฌ
- add more tests ๐งช
- fix isOptional validation and null-able variables โ

## 0.0.1

- Initial version โญ

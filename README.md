# coctail-db-ssr
 NextJS + GraphQL + CI-CD GitHub Actions

# Modify hosts
## mac / linux
Откройте файл `/etc/hosts`
Добавьте в конец файла строку:
```
127.0.0.1 local.next-coctail-db.net
```
Сохраните с правами администратора, используя команду **sudo**
## Windows
Откройте файл `c:\windows\system32\drivers\etc\hosts`
*прим. в свойствах файла требуется снять галочку "Открывать только для чтения"*
Добавьте в конец файла строку:
```
127.0.0.1 local.next-coctail-db.net
```

# Run DEV environment

```bash
docker compose -f ./.docker/compose.dev.yml up -d
```

# Run BUILD environment

```bash
docker compose -f ./.docker/compose.prod.yml up -d
```

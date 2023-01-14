# Делаем сборку на основе официального образа node (используем стабильную версию)
FROM node:18.12.1-slim as apollo-server
# Устанавливаем рабочую директорию, создаётся автоматически
WORKDIR /server
# Указываем порт, который будет использоваться внутри контейнера
EXPOSE 4000
# Т.к. мы будем использовать не root пользователя,
# нужно установить правила доступа на рабочую директорию для пользователя node
RUN chown -R node:node /server \
  && chmod -R 755 /server
# Выполняем копирование проекта в рабочую дитекторию контейнера под пользователем node
# WARN: команда COPY работает по-умолчанию от рута вне зависимости от пользователя, установленным командой USER
COPY --chown=node:node ./server/ .
# Указываем пользователя от которго далее будут выполняться команды
USER node
# Устанавливаем зависимости и билдим проект
RUN npm ci \
  && npm run build
# Команда CMD будет выполнена при выполнении команды "docker run"
CMD [ "npm", "run", "start" ]

FROM node:18.12.1-slim as coctail-web-app
WORKDIR /web-app
EXPOSE 3000
RUN chown -R node:node /web-app \
  && chmod -R 755 /web-app
COPY --chown=node:node ./coctail-web-app/ .
USER node
RUN npm ci \
  && npm run build
CMD [ "npm", "run", "start" ]
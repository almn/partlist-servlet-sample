# Пример сервлета PartList

## 1. Разворот базы данных примера

В папке sample лежит sql-файл для разворота базы данных с тестовыми данными. Его содержимое подразумевает, что база будет развернута на СУБД PostgeSQL под пользователем **postgres** - этому пользователю автоматичесви выдаются все необходимые права.

Развернуть базу из скрипта можно командой:

`psql -U postgres < sample/partlist.sql` 

где 
**postgres** - логин пользователя с достаточными для создания базы данных правами.

После разворота базы данных требуется указать приложению данные для подключения к БД.
Адрес сервера, порт, имя базы, логин и пароль прописываются в конфигурационном файле 

`src/resources/database.properties`

Также, это можно сделать и в уже развернутом приложении.

В базе всего одна таблица, так что можно теоретически создать ее руками по скриптам из **sample/partlist.sql** 

## 2. Сборка и деплой

Проект собирается посредством Maven. 
Собрать можно как в одной из поддерживающих интеграцию c ним IDE (Intellij IDEA, Apache Netbeans, Eclipse), так и из командной строки:

`mvn package`

в каталоге с **pom.xml**.

Получившийся в результате сборки war-пакет нужно развернуть стандартными средствами Tomcat, например по контектному пути **/partlist**.

![Tomcat Deploy](../assets/deploy.png?raw=true)

Если сборка и деплой прошли гладко, а у сервиса есть доступ на чтение к развернутой базе данных, сервис становится доступен по урлу вида

`http://localhost:8080/partlist/`

где localhost - это доменное имя или ip сервиса приложений Tomcat.

![PartList Servlet](../assets/screenshot_0.png?raw=true)

![PartList Servlet](../assets/screenshot_1.png?raw=true)

![PartList Servlet](../assets/screenshot_2.png?raw=true)
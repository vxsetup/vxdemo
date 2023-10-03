МОДУЛЬ 2

НАСТРОЙКА DNS на HQ-SRV

Нужно настроить 2 зоны hq.work и branch.work (и создать к ним обратные)

![image](https://github.com/vxsetup/vxdemo/assets/146210764/4eaee89f-4f4e-402a-8254-e9f78b07b0b4)

НАСТРАИВАЕМ HQ.WORK

переходим в директорию bind

![image](https://github.com/vxsetup/vxdemo/assets/146210764/f4f90578-6009-4c1b-8343-380235065123)

создаем директорию master, в ней будут храниться базы адресов для наших зон

![image](https://github.com/vxsetup/vxdemo/assets/146210764/a723ff6a-fd24-4ec6-b8e7-9ae79b88a53c)

с помощью тач создаем named.conf.zones - конфигурационный файл наших зон

![image](https://github.com/vxsetup/vxdemo/assets/146210764/d168dd8d-af7e-495a-ae8a-56e6df0e76fe)

открываем его через нано и заполняем 

ОБРАТНАЯ ЗОНА ЭТО - ОБРАТНЫЙ АЙПИ БЕЗ ПОСЛЕДНЕГО ОКТЕТА

пример: 192.168.100.1 =100.168.192

![image](https://github.com/vxsetup/vxdemo/assets/146210764/4064ed8f-ef40-4233-831f-1230c7f0188d)

1 -  название зоны

2 - тип зоны

3 - путь к базе адресов

сохраняем выходим

открываем named.conf, добавляем строчку к файлу named.conf.zones

![image](https://github.com/vxsetup/vxdemo/assets/146210764/fd50c4b1-5444-4da9-99ba-63b8f0854974)

сохраняем выходим

заходим в named.conf.options

пишем в форвардерс айпи нашего сервера

отключаем днссек

отключаем v6

дописываем  listen-on {any;};

![image](https://github.com/vxsetup/vxdemo/assets/146210764/28f9f531-3040-46db-ab01-68677416ef9b)

теперь копируем db.empty в master с названием, которое указывали в named.conf.zones это будет наша база адресов

![Снимок экрана 2023-09-30 132434](https://github.com/vxsetup/vxdemo/assets/146210764/3c3dff2e-3391-4f1c-a09f-1835f6a40e86)

открываем, видим это

![image](https://github.com/vxsetup/vxdemo/assets/146210764/bfdf91ce-1f80-494d-941b-0ac9ebba41b6)

Добавляем $ORIGIN hq.work. это будет наша зона днс (ТОЧКА ОБЯЗАТЕЛЬНА - ЭТО ПОЛНОЕ ИМЯ)

меняем localhost. на название нашего сервака, root.localhost. по такому же принципу пишем наш сервак вместо локалхост

![image](https://github.com/vxsetup/vxdemo/assets/146210764/0cc382aa-67a8-44be-9bda-3e9215223534)

видим такую картину

теперь начинаем писать записи типа А

ПЕРВАЯ ЗАПИСЬ - НАЗВАНИЕ НАШЕЙ МАШИНЫ ВМЕСТЕ С НАЗВАНИЕМ ЗОНЫ

ВТОРАЯ - ОБЪЯВЛЯЕМ ЧТО ЭТО АЙПИШНИК ЭТОЙ МАШИНЫ

ТРЕТЬЯ - ОБЪЯВЛЯЕМ ЧТО ПО HQ-SRV МЫ ПРИЙДЕМ НА АЙПИШНИК ЭТОЙ МАШИНЫ

ЧЕТВЕРТАЯ - ОБЪЯВЛЯЕМ ИМЯ РОУТЕРА  HQ-R И ЕГО АЙПИШНИК

![image](https://github.com/vxsetup/vxdemo/assets/146210764/66f1bf56-1d97-4e9e-949d-7996b104f27b)

отлично прямая зона настроена

теперь создаем обратную

копируем только что написанный файл и называем его файлом для обратной зоны

![image](https://github.com/vxsetup/vxdemo/assets/146210764/b4481c3a-57f1-47ad-87b9-9fb6ad0690d4)

открываем и меняем названия нашей зоны днс на название обратной зоны

![image](https://github.com/vxsetup/vxdemo/assets/146210764/474d9d67-4fac-487e-8526-fd5d01168ef6)

К HQ-SRV ПРИПИСЫВАЕМ НАШУ ЗОНУ ДНС

![image](https://github.com/vxsetup/vxdemo/assets/146210764/eded7b22-5d24-4fae-9c9b-528b80d78826)

переходим к записям

![image](https://github.com/vxsetup/vxdemo/assets/146210764/12d3bd9e-70b1-44d4-ade3-9d093260273d)

1 - первый столбик это последний октет айпишника этого устройства

2 - тип записи

3 - название

то есть мы поменяли местами и дополнили название нашей зоной днс

СУПЕР МЫ НАСТРОИЛИ, ЕСЛИ ВСЕ ВЕРНО, ТО ЗАПУСТИТСЯ 

сначала рестартим наш сервис 

![image](https://github.com/vxsetup/vxdemo/assets/146210764/f614f6a2-7a86-434a-a824-5d35e515e922)

смотрим статус

![image](https://github.com/vxsetup/vxdemo/assets/146210764/c804e093-2ac2-49cd-8bc8-0a61dc11e7d8)

отлично все работает

теперь нам нужно указать в настройках на роутере и на серваке днс сервер

чтобы можно было пинговать по имени

заходим на сервере resolv.conf

![image](https://github.com/vxsetup/vxdemo/assets/146210764/aeb4c058-11f5-487b-9dd9-4e966f5c7dbc)

пишем

![image](https://github.com/vxsetup/vxdemo/assets/146210764/28c9a295-fa9e-4021-bf51-dc0ce9729118)

на HQ-R мы поднимали DHCP

так что идем в конфиг и дописываем наш сервер там

![image](https://github.com/vxsetup/vxdemo/assets/146210764/0fca080b-c338-485c-a762-ea7f0069dce4)

теперь  на этом же роутере идем в reslov.conf

![image](https://github.com/vxsetup/vxdemo/assets/146210764/a980cfa9-a17f-4baa-bb01-a390005e2ff5)

пишем нашу днс зону и айпишник сервера

![image](https://github.com/vxsetup/vxdemo/assets/146210764/50d81889-f685-4747-9308-34e0ba7293a0)

перезагружаем машины и пингуем по имени

![image](https://github.com/vxsetup/vxdemo/assets/146210764/b0f5cd08-f159-4c67-8a39-7ed74244cf87)

первая есть

![image](https://github.com/vxsetup/vxdemo/assets/146210764/942c6ae8-7e60-48ed-abf2-f596633a1581)

вторая тоже

отлично мы настроили зону hq.work

ТЕПЕПЕРЬ настраиваем br.work на этом же сервере

действия такие же, только меняются цифры и буквы

заходим в named.conf.zones и прописываем новые зоны

![image](https://github.com/vxsetup/vxdemo/assets/146210764/ddba3ac9-2f02-404d-98ff-97268332e0a1)

![image](https://github.com/vxsetup/vxdemo/assets/146210764/cdfa2063-01e3-4326-9908-c89c15863e58)

вот что у нас получилось, в обратной зоне пишем 

ОБРАТНАЯ ЗОНА ЭТО - ОБРАТНЫЙ АЙПИ БЕЗ ПОСЛЕДНЕГО ОКТЕТА

пример: 192.168.100.1 =100.168.192

теперь открываем named.conf.options и добавляем сервер br.work

![image](https://github.com/vxsetup/vxdemo/assets/146210764/9d7ac142-cdb1-40f2-9fdc-64e2f9448f61)

сохраняем выходим

заходим в директорию мастер и копируем hq.work

![image](https://github.com/vxsetup/vxdemo/assets/146210764/a67586c2-f3f7-4d2a-bee8-3b6ca4478f8f)

открываем br.work и меняем hq на br

![image](https://github.com/vxsetup/vxdemo/assets/146210764/e8930fe9-b69b-436a-85e7-8a20e2b75976)

теперь меняем записи

![image](https://github.com/vxsetup/vxdemo/assets/146210764/493b17b4-eed4-46fa-b03b-0df16487d9ae)

выглядят теперь вот так

сохраняем выходим

теперь таким же принципом копируем 20.20.20.in-addr.arpa.zone

![image](https://github.com/vxsetup/vxdemo/assets/146210764/8353c5ee-aa41-4cf3-8131-a5304c9144dc)

открываем, меняем все 20 на 30 и hq на br

![image](https://github.com/vxsetup/vxdemo/assets/146210764/1873b088-2438-45e1-bec7-9c001ccc7255)
 
выглядит это вот так

сохраняем выходим

проверяем 

![image](https://github.com/vxsetup/vxdemo/assets/146210764/97fbbeb4-0b37-4734-a8bf-8d97650af410)

все настроено нормально

теперь перезапускаем службу

![image](https://github.com/vxsetup/vxdemo/assets/146210764/a632d3e2-a967-4643-848c-180371b0b5b2)

смотрим статус

![image](https://github.com/vxsetup/vxdemo/assets/146210764/f402e8c9-4f4c-4090-af2f-89473326c825)

видим заветные слова о том что все зоны загружены

это прекрасно

теперь нам нужно перейти на роутер и сервак

для того чтобы прописать днс сервер

![image](https://github.com/vxsetup/vxdemo/assets/146210764/384dcb31-fdae-4e1d-8c8b-19de1cbfb63f)

![image](https://github.com/vxsetup/vxdemo/assets/146210764/88797d22-d185-4b8c-9eeb-4bd7e7fdbade)

перезагружаемся

идем на сервак

![image](https://github.com/vxsetup/vxdemo/assets/146210764/128d84d0-137d-4ac1-b5ef-9f9236cb6d81)

![image](https://github.com/vxsetup/vxdemo/assets/146210764/46c580e7-3b82-4d3b-a001-8d6c4dac209d)

перезагружаемся

пингуем

![image](https://github.com/vxsetup/vxdemo/assets/146210764/9ee3f4b4-5615-45b1-a035-669ad747b510)

![image](https://github.com/vxsetup/vxdemo/assets/146210764/eb35fe78-cd9d-41df-885f-c2030c69a75f)

отлично первое задание второго модуля выполнено

![image](https://github.com/vxsetup/vxdemo/assets/146210764/d47ae856-c9de-4163-9156-e429081c6b06)

НАСТРОЙКА NTP CHRONY

На всех машинах должен быть установлен chrony 

Все устройства должны синхронизировать с hq-r 

Заходим в кфг хрони

![image](https://github.com/vxsetup/vxdemo/assets/146210764/1c441714-8ed7-4108-8574-b362fccfdb49)

Объявляем имя нашенго NTP сервера, задаем локальный стратум 5, разрешаем сети, которые будут брать время

Выходим сохраняем

Теперь устанавливаем время UTC +3

![image](https://github.com/vxsetup/vxdemo/assets/146210764/886d007d-fefe-4c4b-8ad3-783edb6afd44)

Перезагружаем службу синхронизации

![image](https://github.com/vxsetup/vxdemo/assets/146210764/90f29631-8c07-4d96-9be7-0c47a859e71d)

Заходим в конфиг хрони на ISP

![image](https://github.com/vxsetup/vxdemo/assets/146210764/18af8b14-2ada-42f6-afd0-27da9a1815dd)

Ребутаем службу

![image](https://github.com/vxsetup/vxdemo/assets/146210764/ba9e7a0e-ec5e-485f-802b-20923c2614e3)

Пишем chronyc sources

![image](https://github.com/vxsetup/vxdemo/assets/146210764/5eaea6d5-67d1-42cf-b243-b05c87e61e67)

Теперь по аналогии пишем pool HQ-R iburst   на других устройствах

![image](https://github.com/vxsetup/vxdemo/assets/146210764/b34eb878-4a3b-4b02-8c49-8d4c978e1dec)

![image](https://github.com/vxsetup/vxdemo/assets/146210764/7a8fe8e6-0479-4ec0-9186-b40290647296)

![image](https://github.com/vxsetup/vxdemo/assets/146210764/4f25e224-131b-426a-ba17-2de40204902a)

3,4 ДОМЕН И ФАЙЛОВЫЙ СЕРВЕР

![image](https://github.com/vxsetup/vxdemo/assets/146210764/23da32db-2a15-49e4-bb38-0407e914337c)

Заходим nano /etc/samba/smb.conf

![image](https://github.com/vxsetup/vxdemo/assets/146210764/38cf344e-2a6e-4af4-8624-207b31e645fc)

Workgroup = это наш домен

Realm = каким будет нащ домен на винде

Server_string = описание сервера

Переходим на BR-SRV
 
Заходим nano /etc/samba/smb.conf

![image](https://github.com/vxsetup/vxdemo/assets/146210764/0bee97b7-cc55-40ea-8fbc-99598ddb154e)

![image](https://github.com/vxsetup/vxdemo/assets/146210764/d51c3647-de56-4e80-9441-35cf8cab50b1)

HQ-SRV :

Заходим nano /etc/samba/smb.conf

Листаем до конца файла

Добавляем наши сетевые папки

![image](https://github.com/vxsetup/vxdemo/assets/146210764/6bcee7a9-37dc-47ee-98e8-6c21a0f721f8)

Comment = описание в сети что это за папка

Path = путь до шареной папки на нашем серваке

Read only = no – запрещаем только чтение

Browsable = отображение в списке шар 

Valid users = ИЗБРАННЫЕ, КОМУ МОЖНО ЮЗАТЬ ПАПКУ

Создаем группы избранных

![image](https://github.com/vxsetup/vxdemo/assets/146210764/a606a272-aa3a-49a9-a62a-2b8e417835ce)

![image](https://github.com/vxsetup/vxdemo/assets/146210764/f99fd232-1a0e-481c-a4be-bad9ab50f317)

![image](https://github.com/vxsetup/vxdemo/assets/146210764/33b9dfc3-02de-4b93-b0e6-98f42c2fb5a5)

Устанавливаем сетевой пароль на пользователя (чтобы подключаться к шаре)

![image](https://github.com/vxsetup/vxdemo/assets/146210764/f700db0e-1f91-48d1-9d2f-86f2dbe86737)

![image](https://github.com/vxsetup/vxdemo/assets/146210764/4ab4e49f-7c27-40d6-8309-4f8919d09948)

![image](https://github.com/vxsetup/vxdemo/assets/146210764/c125c3c0-f4ec-46a7-b06f-488cdec319ad)

Теперь добавляем пользователей в группы избранных

![image](https://github.com/vxsetup/vxdemo/assets/146210764/3d1ce0da-35f6-47d7-83db-336d4bdbd88f)

usermod -aG admin Admin

usermod -aG network Network_admin

Создаем папки которые будут шарами

![image](https://github.com/vxsetup/vxdemo/assets/146210764/e0bbf046-7435-442c-99df-c99acc757c78)

![image](https://github.com/vxsetup/vxdemo/assets/146210764/11559894-bd1d-4698-b79a-aa82af974bef)

![image](https://github.com/vxsetup/vxdemo/assets/146210764/e8279158-b748-4d4b-be10-cc92849eb296)

Теперь меняем владельцев папок

Для каждой папки будет свой

![image](https://github.com/vxsetup/vxdemo/assets/146210764/74879945-64a8-4d93-948d-5e772f5c4583)

![image](https://github.com/vxsetup/vxdemo/assets/146210764/14c013f8-99a3-4d4b-a394-497e9ed17553)

![image](https://github.com/vxsetup/vxdemo/assets/146210764/67017846-931a-4286-b5fa-b3f7ff7339f3)

![image](https://github.com/vxsetup/vxdemo/assets/146210764/124854c0-a6a7-4446-bfc2-b1a6b2e8b0e9)

Далее изменяем доступ 

0770 это себе, группе, но не чужим

![image](https://github.com/vxsetup/vxdemo/assets/146210764/22362734-659f-40b5-9b9d-de37b183ad57)

![image](https://github.com/vxsetup/vxdemo/assets/146210764/dbc9610b-493b-4d9c-814d-808bfb4a79d2)

![image](https://github.com/vxsetup/vxdemo/assets/146210764/3bf45618-8774-46e5-94cf-0b080afdbf75)

Папки готовы, теперь их можно монтировать на других машинах

Начнем с HQ-R

Создаем юзверя Network_admin, ставим ему сетевой пароль

![image](https://github.com/vxsetup/vxdemo/assets/146210764/9051304a-0b69-4b0c-aad3-becf07898f78)

Теперь Admin

![image](https://github.com/vxsetup/vxdemo/assets/146210764/cac0ed45-8336-4e3b-924d-1b24eb18095d)

![image](https://github.com/vxsetup/vxdemo/assets/146210764/d2556060-45ca-4dfe-a880-41cdf545cc27)

Для монтирования заходим nano /etc/fstab

И пишем 

//40.40.40.30/Admin_files = адрес сетевой папки

/mnt/All_files/ = куда монтируем папку

Cifs = файловая система граничная с windows

Username = Admin = кто будет подключаться

Пароль не пишем, чтобы логиниться при mount -a 

Uid = 1001 = уникальный айди пользователя, которого мы создали

Iocharset = utf8 = хз что это, думаю что можно не писать

Nofail = без ошибок (этим все сказано)

_netdev = сетевое устройство = будет отключаться, при выключении машины

0 0 = так надо, доверьтесь

![image](https://github.com/vxsetup/vxdemo/assets/146210764/0f5d5517-b037-4a02-9ae8-e5e9c99750d3)

Для монтирования папки network = пишем то же и самое, только меняем пользователя, юид и само название папки и куда монтируем

Выходим сохраняем 

Создаем папки куда будем монтировать

![image](https://github.com/vxsetup/vxdemo/assets/146210764/ba294217-2945-402a-8aa9-04234fc3dc38)

![image](https://github.com/vxsetup/vxdemo/assets/146210764/7608900c-c1d7-433e-ae01-6e54101848d1)

Пишем mount -a 

СПЕЦИАЛЬНО РУИНИМ ПЕРВЫЙ ВВОД ПАРОЛЯ ДЛЯ ПЕРВОЙ ПАПКИ

ВТОРУЮ ПИШЕМ НОРМАЛЬНО

ОДНА ПАПКА СМОНТИРОВАЛАСЬ

ПИШЕМ mount -a ЗАНОВО 

МОНТИРУЕМ ВТОРУЮ ПАПКУ

![image](https://github.com/vxsetup/vxdemo/assets/146210764/59a3b711-c1dd-4fc7-a5ea-71a474c8f5c9)

ЭТИ МАХИНАЦИИ ДЛЯ ТОГО ЧТОБЫ СМОНТИРОВАЛОСЬ ПО ОЧЕРЕДИ ИНАЧЕ ТАМ СТРАШНО 

![image](https://github.com/vxsetup/vxdemo/assets/146210764/713f68fe-902f-42ae-84ab-caeb20a0dc56)

Чекаем папки ls -l и видим наших сетевых юзверей

Осталось повторить такие же манипуляции на других машинах, делаем так же по гайду, не забывая менять буковы и цифры 

![image](https://github.com/vxsetup/vxdemo/assets/146210764/3a4d056c-8c70-4fd0-8ca6-460b5589092d)

To be continued...

-vx



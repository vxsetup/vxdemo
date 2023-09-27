vxdemo
Решение демоэкзамена сисадминов, не идеально, но сойдет

Это +- на троечку, спустя некоторое время решение будет пополняться

![1](https://github.com/vxsetup/vxdemo/assets/146210764/9f5b84f7-f78f-4166-87ea-c64c14b4479b)

Меняем @debian на имя устройства 

![2](https://github.com/vxsetup/vxdemo/assets/146210764/166ad47d-e9f3-432b-a981-6941a093c95c)

![3](https://github.com/vxsetup/vxdemo/assets/146210764/e93eb0e5-7ec8-4d05-8764-8eac6e14efdf)

Сохраняем Ctrl + S, выходим Ctrl + X

Воспроизводим на других виртуалках

Имена присвоены

Далее рассчитываем IP-адресацию IPv4

INTERNET - 10.10.10.0/24 

Для офиса HQ нужен пул адресов в котором не более 64 хостов

Будем использовать 26 маску = 255.255.255.192

HQ = 20.20.20.0/26

Для офиса BRANCH 16 хостов 

Будем использовать 28 маску = 255.255.255.240

BRANCH = 30.30.30.0/28

![image](https://github.com/vxsetup/vxdemo/assets/146210764/01c0e470-8cc9-4c15-bdb4-108ed5ddcc89)

Раздаем ip-адреса виртуалкам

Переходим 

![image](https://github.com/vxsetup/vxdemo/assets/146210764/fa16ff30-e3c4-43ff-9144-7eef908679c5)

ISP

![image](https://github.com/vxsetup/vxdemo/assets/146210764/fd5a99a3-4338-4816-a88b-927f3a530f27)

Сохраняем, перезагружаем

![image](https://github.com/vxsetup/vxdemo/assets/146210764/5c3144c9-0390-422a-bfb0-1fa225d7069c)

Разрешаем пересылку пакетов 

![image](https://github.com/vxsetup/vxdemo/assets/146210764/6be50fd9-fced-4b80-8906-ed8c132c79bf)

![image](https://github.com/vxsetup/vxdemo/assets/146210764/9fd9327e-30e8-48d0-b611-e5bbfc95cca8)

Сохраняем

HQ-R

По заданию нам нужно сделать динамическую раздачу ip адресов на роутере HQ-R, для самого сервера адрес должен быть зарезервирован

Настройка DHCP

Выдаем ip

![image](https://github.com/vxsetup/vxdemo/assets/146210764/5a610871-c6ee-413f-bf10-2cedc0c086a1)

Нам нужно указать интерфейс с которого будет раздача dhcp

![image](https://github.com/vxsetup/vxdemo/assets/146210764/79a19806-f098-440d-8a05-c56010aca6b1)

![image](https://github.com/vxsetup/vxdemo/assets/146210764/11ee8477-49dc-41c2-8899-bb2a57c2a562)

Делаем резервную копию конфига dhcp

![image](https://github.com/vxsetup/vxdemo/assets/146210764/f9db641d-1f7f-47e8-b1e2-1b57817a2b78)

![image](https://github.com/vxsetup/vxdemo/assets/146210764/c37fac80-9f72-4182-a31e-4d735634f138)

Начинаем править dhcpd.conf 

![image](https://github.com/vxsetup/vxdemo/assets/146210764/5fb67183-51d2-47f3-8451-ff1475e7500f)

Находим # A slightly.... 

![image](https://github.com/vxsetup/vxdemo/assets/146210764/8e7a13d6-0641-4200-926b-d6c68ceafa3e)

И меняем subnet, range, routers и добавляем резерв ip сервера

![image](https://github.com/vxsetup/vxdemo/assets/146210764/41cf8709-49ee-4139-9eb9-3de05611039c)

Сохраняем dhcpd.conf 

Перезапускаем сервис dhcp

![image](https://github.com/vxsetup/vxdemo/assets/146210764/0d0e48d2-8f82-4deb-8ced-23f5c21eda17)

Разрешаем пересылку пакетов

![image](https://github.com/vxsetup/vxdemo/assets/146210764/f07edab5-5875-49b3-bcf4-c6dd2cca26ae)

![image](https://github.com/vxsetup/vxdemo/assets/146210764/e9295720-edff-4c9e-b3ea-fccab943ca55)

HQ-SRV

![image](https://github.com/vxsetup/vxdemo/assets/146210764/a515c191-7c26-402c-aa0e-42beace6bf4f)

![image](https://github.com/vxsetup/vxdemo/assets/146210764/6de57f69-459f-45bc-91a0-61faba140931)

Зарезервированный ip-адрес при настройке dhcp выдан HQ-SRV

BR-R

Выдаем ip

![image](https://github.com/vxsetup/vxdemo/assets/146210764/f3820b9f-f2f6-4b74-9ed3-f0e0c069cda0)

Разрешаем пересылку пакетов

![image](https://github.com/vxsetup/vxdemo/assets/146210764/2094a350-d348-47ba-a08f-8dc78944f0d4)

![image](https://github.com/vxsetup/vxdemo/assets/146210764/d46ffe5b-ef7c-42d5-b5fc-78d3d28c98a2)

BR-SRV

Выдаем ip

![image](https://github.com/vxsetup/vxdemo/assets/146210764/163d9955-2f4e-4951-bf02-158c9d3e5a90)

CLI

![image](https://github.com/vxsetup/vxdemo/assets/146210764/0ef3703a-dffd-4087-b26e-defdbfb8c37a)

НАСТРОЙКА ДИНАМИЧЕСКОЙ МАРШРУТИЗАЦИИ FRR

![image](https://github.com/vxsetup/vxdemo/assets/146210764/b7b0b87b-fe46-43be-8e22-0bed8a21df15)

Будем настраивать с помощью vtysh ospf

Настройка будет производиться на HQ-R, ISP, BR-R

Практически то же и самое что и цископт 

HQ-R

Переходим в каталог FRR

![image](https://github.com/vxsetup/vxdemo/assets/146210764/73a27483-20a8-4f18-992f-fe8a978d9e0e)
![image](https://github.com/vxsetup/vxdemo/assets/146210764/b966da7f-b586-4a9f-b731-6cf2b606df5e)
Открываем daemons
![image](https://github.com/vxsetup/vxdemo/assets/146210764/e71d6829-9847-495b-8515-7c4fd2784d8e)
СТАВИМ YES вместо NO чтобы оспф работал
![image](https://github.com/vxsetup/vxdemo/assets/146210764/f0bc8cbf-86c9-4906-8ca1-95e86beca4be)
сохраняем
РЕБУТИМ виртуалку
пишем в терминале vtysh
и у нас появляется такой же интерфейс как и в роутерах циско
пишем conf t, чтобы войти в привилегированный режим
![image](https://github.com/vxsetup/vxdemo/assets/146210764/fa831219-5455-4c67-a62a-5c00727ce013)
Дальше пишем router ospf, чтобы начать настройку оспф
ну по классике задаем айди, пишем сети
![image](https://github.com/vxsetup/vxdemo/assets/146210764/e4e6cdea-89f6-44ea-8e12-7cba26fc8ff3)
САМОЕ ГЛАВНОЕ ПИШЕМ DO WR  ЧТОБЫ СОХРАНИТЬ НАСТРОЙКИ
ИНАЧЕ ВСЕ СЛЕТИТ ПРИ ПЕРЕЗАГРУЗКЕ 
![image](https://github.com/vxsetup/vxdemo/assets/146210764/40336076-74c1-411a-a0b9-460c4f6a19f2)
![image](https://github.com/vxsetup/vxdemo/assets/146210764/bb0af1d3-a231-4c08-90b0-5f47a2452d1b)
Теперь повторяем эту же операцию на двух других роутерах
ISP
![image](https://github.com/vxsetup/vxdemo/assets/146210764/daab1f8f-fa61-41ae-a976-73b0a8d5ea94)
включаем
ребутаем
![image](https://github.com/vxsetup/vxdemo/assets/146210764/ac8249f1-2cb9-420e-a3ed-9127fdef17d2)
BR-R
![image](https://github.com/vxsetup/vxdemo/assets/146210764/6c9c40d7-f82c-4302-8f86-e82a6cb88328)
reboot
![image](https://github.com/vxsetup/vxdemo/assets/146210764/35fb9433-5c90-403a-91a3-37d9e0c3b6e1)
Проверим настройку оспф
Смотрим соседей
ISP
![image](https://github.com/vxsetup/vxdemo/assets/146210764/cb081960-9ab4-4b27-ae9a-d2eea147f284)
HQ-R
![image](https://github.com/vxsetup/vxdemo/assets/146210764/b6dbd4ba-2070-4950-9124-8db7c4e9f137)
BR-R
![image](https://github.com/vxsetup/vxdemo/assets/146210764/da762f0c-5aec-4aa5-a395-b027eee06fd7)
Видим, что соседи есть, значит настроенно правильно
пингуем br-srv hq-srv
![image](https://github.com/vxsetup/vxdemo/assets/146210764/6caf9adc-8c45-4d71-a10b-5c42bbb531d2)
НАСТРОЙКА УЧЕТНЫХ ЗАПИСЕЙ
![image](https://github.com/vxsetup/vxdemo/assets/146210764/9bdd2e07-f5f1-47ae-b0bc-b3dd5e03cc30)
CLI
![image](https://github.com/vxsetup/vxdemo/assets/146210764/1f12e2a5-8c43-4b8f-a38e-cbc4cc03e890)
HQ-SRV
Создаем пользователя Admin с паролем P@ssw0rd
![image](https://github.com/vxsetup/vxdemo/assets/146210764/aca7e195-94a2-4e03-b228-ae170a181819)
--force-badname это защита от дураков
![image](https://github.com/vxsetup/vxdemo/assets/146210764/797ed511-b00b-4222-9335-131b474e292b)
HQ-R
![image](https://github.com/vxsetup/vxdemo/assets/146210764/c080e6ee-ba6a-4ee3-a438-06057334e783)

![image](https://github.com/vxsetup/vxdemo/assets/146210764/89a117fa-25c0-4f79-8154-17efcc7e632a)

BR-R
![image](https://github.com/vxsetup/vxdemo/assets/146210764/22d79f0c-5fa6-47e0-b617-6db93c51b542)

![image](https://github.com/vxsetup/vxdemo/assets/146210764/4aeb22b3-83d8-406b-aaf9-73ab5c290f98)

BR-SRV

![image](https://github.com/vxsetup/vxdemo/assets/146210764/28b4b6a4-95f2-43ec-9773-f24c99176f61)

![image](https://github.com/vxsetup/vxdemo/assets/146210764/3fb20bd1-5622-42c0-9c51-f0590ae889de)

Пользователи созданы

СОЗДАЕМ БЭКАП СКРИПТ ДЛЯ СОХРАНЕНИЯ КОНФИГА СЕТЕВЫХ УСТРОЙСТВ (скрипт временный, чтобы заполнить пространство, нормальный скрипт появится, когда поднимем nfs шару)

создаем на HQ-R и BR-R

скрипт очень простой

переходим в директорию сетевых приколов чтобы сделать скрипт

![image](https://github.com/vxsetup/vxdemo/assets/146210764/d00cd703-681a-465a-9143-4d4bd9e5af37)

нам нужен файл интерфакес

прикосновением создаем interfaces.back.sh это файл скрипта

![image](https://github.com/vxsetup/vxdemo/assets/146210764/c0420aaa-bde8-47ae-bdaf-a82d89f68f5a)

пишем скрипт

открываем его через нано

![image](https://github.com/vxsetup/vxdemo/assets/146210764/fc306084-6e3a-46a4-aa19-819bc48a4c93)

все 

запускаем

![image](https://github.com/vxsetup/vxdemo/assets/146210764/42e85b33-f935-4791-8bff-44654abba373)

у нас появился новый файл 

повторяем на BR-R

![image](https://github.com/vxsetup/vxdemo/assets/146210764/f9da4f27-69b0-4c43-9672-4a1aa6d1707f)

![image](https://github.com/vxsetup/vxdemo/assets/146210764/30fba0c1-886b-437d-aac6-c59b623e31c2)

![image](https://github.com/vxsetup/vxdemo/assets/146210764/a94b6ff5-3893-4618-9bdd-f016b4a96a6b)

бэкапы сетевых устройств сделаны

НАСТРОЙКА ПОДКЛЮЧЕНИЯ SSH на HQ-SRV/ СМЕНА ПОРТА

![image](https://github.com/vxsetup/vxdemo/assets/146210764/4e332bba-a904-4faf-82ef-bc680c5abe59)

переходим в директорию ssh

![image](https://github.com/vxsetup/vxdemo/assets/146210764/85c0055e-8b18-4f7b-a304-ba14b109acfd)

открываем конфиг

![image](https://github.com/vxsetup/vxdemo/assets/146210764/f7767dae-d349-4c22-a524-6180bafea5d6)

меняем порт на 2222

![image](https://github.com/vxsetup/vxdemo/assets/146210764/51aad3ee-c059-414e-aea8-0623bd81665e)

Запрещаем CLI подключаться к ssh

![image](https://github.com/vxsetup/vxdemo/assets/146210764/eb4018f4-69aa-4be9-b0a6-6e4fbb35ee63)

отключаем вход рут пользователю

Включаем авторизацию по паролю

![image](https://github.com/vxsetup/vxdemo/assets/146210764/1bbcd6bf-16c5-4037-aeeb-1fd8ddfa5c2f)

Сохраняем, перезапускаем службу

![image](https://github.com/vxsetup/vxdemo/assets/146210764/95e4e4a9-5021-4338-9dbd-2178f9896ec5)

Подключаемся 

![image](https://github.com/vxsetup/vxdemo/assets/146210764/ff2ff915-2615-4dc2-b455-f76cad483e53)

Вводим пароль

![image](https://github.com/vxsetup/vxdemo/assets/146210764/ac27b23f-2963-4161-a827-46893a73d58c)

Мы подключились

![image](https://github.com/vxsetup/vxdemo/assets/146210764/9526cf4f-c509-4a4c-b742-0a4d27d7da97)

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

![image](https://github.com/vxsetup/vxdemo/assets/146210764/0e96eefe-fe81-48a5-a7a7-2c6be98c10ec)

теперь копируем db.empty в master с названием, которое указывали в named.conf.zones это будет наша база адресов

![image](https://github.com/vxsetup/vxdemo/assets/146210764/17324395-622d-4548-b948-78bfd9718d65)

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






















## easyComments
Надстройка для easyCollection позваляющая организовать систему комментариев на сайте под управлением Evolution CMS

### Установка
 - Устанавливаем easyCollection если он еще не установлен
 - Устанавливаем сам пакет easyComments
  - В конфигурации плагина easyComments проставляем ID модуля "комментарии", а также id шаблонов, на которых необходимо использовать комментарии
 
 ### Использование
 В чанке comments есть пример использования. 
 
 cmultiTV - обертка для multiTV (должен быть установлен), который выводит комментарии по правилам мультика
 
 в FormLister обязательно указываем &prepare=`SetComments` 
 
 publComment - публиковать по-умолчанию или нет
 
 id - уникальный id комментариев (не обязателен)

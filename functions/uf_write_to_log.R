# ..............................................................................
# uf.write.to.log()
#
# Функция записи сообщения в консоль и в лог.
#
# Source: https://tomizonor.wordpress.com/2013/04/17/file-utf8-windows/
#
# Аргументы:
#  * msg           -- текст сообщения
#  * out.file.name -- файл, в который пишем результаты
#  * silent        -- если T, то не выводить сообщение в консоль
#
# Возвращаемое значение: нет.
# 
# Создаёт / модифицирует файлы:
#  * out.file.name (путь + имя) -- текстовый лог. Файл надо создать заранее.
#                                  строки добавляются в конец.
# ..............................................................................

uf.write.to.log <- function(msg, out.file.name, silent = F) {
    # соединение с файлом
    con <- file(out.file.name, 'ab')
    # спецсимволы начала файла в Windows 
    BOM <- charToRaw('\xEF\xBB\xBF')
    if (uf.get.os() == 'windows') writeBin(BOM, con, endian = 'little')
    # пишем в файл
    writeBin(charToRaw(paste0(msg, '\r\n')), con, endian = 'little')
    # закрываем соединение
    close(con)
    # пишем сообщение в консоль
    if (!silent) message(msg)
}

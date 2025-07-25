; InputTip

/**
 * 读取配置文件
 * @param {String}key 配置文件中的键名
 * @param default 默认值
 * @param {"InputMethod" | "Config-v2"} section 配置文件中的分区名
 * @param {String} path 配置文件的路径
 * @returns {String} 配置文件中的值
 */
readIni(key, default, section := "Config-v2", path := "InputTip.ini") {
    try {
        return IniRead(path, section, key)
    } catch {
        writeIni(key, default, section, path)
        return default
    }
}
/**
 * 写入配置文件
 * @param key 配置文件中的键名
 * @param value  要写入的值
 * @param {"InputMethod" | "Config-v2"} section 配置文件中的分区名
 * @param {String} path 配置文件的路径
 */
writeIni(key, value, section := "Config-v2", path := "InputTip.ini") {
    try {
        IniWrite(value, path, section, key)
    } catch {
        createTipGui([{
            opt: "cRed",
            text: "InputTip.ini 配置文件写入失败`n- 尝试重启 InputTip 解决问题`n- 检查 InputTip.ini 配置文件是否存在系统读写权限限制`n- 移除配置文件(自行备份)，并重启以重新初始化配置文件",
        }], "InputTip - 配置文件写入失败").Show()
    }
}

/**
 * 读取配置文件(Section)
 * @param section 要读取的 Section
 * @param default 默认值
 * @param {String} path 配置文件的路径
 * @returns {String} 配置文件中的值
 */
readIniSection(section, default := "", path := "InputTip.ini") {
    try {
        return IniRead(path, section)
    } catch {
        writeIniSection(default, section, path)
        return default
    }
}
/**
 * 写入配置文件(Section)
 * @param value  要写入的值
 * @param section 要写入的 Section
 * @param {String} path 配置文件的路径
 */
writeIniSection(value, section, path := "InputTip.ini") {
    try {
        IniWrite(value, path, section)
    } catch {
        createTipGui([{
            opt: "cRed",
            text: "InputTip.ini 配置文件写入失败`n- 尝试重启 InputTip 解决问题`n- 检查 InputTip.ini 配置文件是否存在系统读写权限限制`n- 移除配置文件(自行备份)，并重启以重新初始化配置文件",
        }], "InputTip - 配置文件写入失败").Show()
    }
}

package com.gsm.easyexcel;

import com.alibaba.excel.EasyExcel;
import com.alibaba.excel.support.ExcelTypeEnum;
import com.gsm.easyexcel.dto.ExcelStudentDTO;
import com.gsm.easyexcel.listener.ExcelStudentDTOListener;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class ExcelReadTest {

    /**
     * 最简单的读
     */
    @Test
    public void simpleReadXlsx() {

        String fileName = "d:/IntelliJ IDEA 2021.1.2/finance0918/alibaba-easyexcel/src/main/resources/excel/simpleWrite.xlsx"; //需要提前新建目录

        // 这里默认读取第一个sheet
        EasyExcel.read(fileName, ExcelStudentDTO.class, new ExcelStudentDTOListener()).sheet().doRead();
    }

    @Test
    public void simpleReadXls() {

        String fileName = "d:/IntelliJ IDEA 2021.1.2/finance0918/alibaba-easyexcel/src/main/resources/excel/simpleWrite.xlsx"; //需要提前新建目录

        EasyExcel.read(fileName, ExcelStudentDTO.class, new ExcelStudentDTOListener()).excelType(ExcelTypeEnum.XLS).sheet().doRead();
    }


}

package com.gsm.finance.core.mapper;

import com.gsm.finance.core.dto.ExcelDictDTO;
import com.gsm.finance.core.entity.Dict;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

/**
 * <p>
 * 数据字典 Mapper 接口
 * </p>
 *
 * @author zzl
 * @since 2023-09-19
 */
public interface DictMapper extends BaseMapper<Dict> {
    void insertBatch(List<ExcelDictDTO> list);
}

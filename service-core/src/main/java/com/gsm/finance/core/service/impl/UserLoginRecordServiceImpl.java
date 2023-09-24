package com.gsm.finance.core.service.impl;

import com.gsm.finance.core.entity.UserLoginRecord;
import com.gsm.finance.core.mapper.UserLoginRecordMapper;
import com.gsm.finance.core.service.UserLoginRecordService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 用户登录记录表 服务实现类
 * </p>
 *
 * @author zzl
 * @since 2023-09-19
 */
@Service
public class UserLoginRecordServiceImpl extends ServiceImpl<UserLoginRecordMapper, UserLoginRecord> implements UserLoginRecordService {

}

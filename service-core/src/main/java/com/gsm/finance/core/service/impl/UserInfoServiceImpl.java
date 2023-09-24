package com.gsm.finance.core.service.impl;

import com.gsm.finance.core.entity.UserInfo;
import com.gsm.finance.core.mapper.UserInfoMapper;
import com.gsm.finance.core.service.UserInfoService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 用户基本信息 服务实现类
 * </p>
 *
 * @author zzl
 * @since 2023-09-19
 */
@Service
public class UserInfoServiceImpl extends ServiceImpl<UserInfoMapper, UserInfo> implements UserInfoService {

}

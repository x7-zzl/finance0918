package com.gsm.finance.core;

import com.gsm.finance.core.entity.Dict;
import com.gsm.finance.core.mapper.DictMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;
import java.util.concurrent.TimeUnit;

/**
 * @author nightmare
 * @date 2023/9/22 10:12
 */
@SpringBootTest
@RunWith(SpringRunner.class)
public class RedisTemplateTests {

    @Resource
    private RedisTemplate redisTemplate;

    @Resource
    private DictMapper dictMapper;

    @Test
    public void saveDict(){

        Dict dict = dictMapper.selectById(1);

        //向数据库中存储string类型的键值对, 过期时间5分钟
        redisTemplate.opsForValue().set("dict", dict, 5, TimeUnit.MINUTES);
    }

    @Test
    public void getDict(){
        Dict dict = (Dict)redisTemplate.opsForValue().get("dict");
        System.out.println(dict);
    }

}

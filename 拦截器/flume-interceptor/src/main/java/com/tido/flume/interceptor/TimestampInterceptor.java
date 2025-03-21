package com.tido.flume.interceptor;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import org.apache.flume.Context;
import org.apache.flume.Event;
import org.apache.flume.interceptor.Interceptor;

import java.nio.charset.StandardCharsets;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class TimestampInterceptor implements Interceptor {
    @Override
    public void initialize() {

    }

    @Override
    public Event intercept(Event event) {
        try {
            // 需求: 将body中的数据时间戳写入到头信息中  提供给hdfs sink使用
            // 将数据写入到正确的分区中  解决数据漂移问题
            Map<String, String> headers = event.getHeaders();
            String log = new String(event.getBody(), StandardCharsets.UTF_8);
            JsonParser jsonParser = new JsonParser();
            JsonObject jsonObject = jsonParser.parse(log).getAsJsonObject();
            // 提取时间戳
            String timestamp = jsonObject.get("timestamp").getAsString();

            // 写入到header
            headers.put("timestamp",timestamp);

            return event;
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public List<Event> intercept(List<Event> events) {
        Iterator<Event> iterator = events.iterator();
        while (iterator.hasNext()) {
            Event next = iterator.next();
            if (intercept(next)==null) {
                iterator.remove();
            }
        }
        return events;
    }

    @Override
    public void close() {

    }

    public static class Builder implements Interceptor.Builder{

        @Override
        public Interceptor build() {
            return new TimestampInterceptor();
        }

        @Override
        public void configure(Context context) {

        }
    }
}

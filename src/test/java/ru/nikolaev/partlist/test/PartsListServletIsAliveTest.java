package ru.nikolaev.partlist.test;

import java.util.ArrayList;
import java.util.List;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

/**
 *
 * @author alexander
 */
public class PartsListServletIsAliveTest {

    @Test
    public void TestServletIsAlive() throws Exception {
        HttpClient client = HttpClientBuilder.create().build();
        HttpPost method = new HttpPost("http://localhost:8080/partlist");

        List<BasicNameValuePair> nameValuePairs = new ArrayList<>();
        nameValuePairs.add(new BasicNameValuePair("part_number", "34"));
        nameValuePairs.add(new BasicNameValuePair("part_name", "IBM"));

        method.setEntity(new UrlEncodedFormEntity(nameValuePairs));
        HttpResponse httpResponse = client.execute(method);

        assertEquals("Success", httpResponse.getHeaders("IAmAlive")[0].getValue());
    }

}

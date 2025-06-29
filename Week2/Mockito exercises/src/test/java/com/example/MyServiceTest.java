package com.example;

import static org.mockito.Mockito.*;
import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;
import org.mockito.Mockito;

public class MyServiceTest {

    @Test
    public void testExternalApi() {
        // Create a mock for ExternalApi
        ExternalApi mockApi = Mockito.mock(ExternalApi.class);

        // Stub getData() to return a predefined value
        when(mockApi.getData()).thenReturn("Mock Data");

        // Inject mock into MyService
        MyService service = new MyService(mockApi);

        // Call the method
        String result = service.fetchData();

        // Verify the result
        assertEquals("Mock Data", result);
    }

    @Test
    public void testVerifyInteraction() {
        // Create a mock
        ExternalApi mockApi = Mockito.mock(ExternalApi.class);

        // Inject mock into MyService
        MyService service = new MyService(mockApi);

        // Call fetchData(), which should internally call mockApi.getData()
        service.fetchData();

        // Verify that getData() was called once
        verify(mockApi).getData();
    }
}

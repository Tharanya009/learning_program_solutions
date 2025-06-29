package com.example;

import org.junit.*;
import static org.junit.Assert.*;

public class Exercise4AAAPatternTest {

    @Before
    public void setUp() {
        System.out.println("Setup before each test...");
    }

    @After
    public void tearDown() {
        System.out.println("Cleanup after each test...");
    }

    @Test
    public void testAddition() {
        // Arrange
        int a = 2;
        int b = 3;

        // Act
        int result = a + b;

        // Assert
        assertEquals(5, result);
    }
}

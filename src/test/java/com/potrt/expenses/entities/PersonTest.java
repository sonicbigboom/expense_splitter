package com.potrt.expenses.entities;

import static org.assertj.core.api.Assertions.assertThat;

import org.junit.Before;
import org.junit.Test;

import com.potrt.expenses.TestingConstants;

public class PersonTest implements TestingConstants {
    Person person;

    @Before
    public void setup() {
        person = new Person();
    }

    /**
     * Check first name getter/setter.
     */
    @Test
    public void firstNameTest() {
        person.setFirstName(TEST_VALUE);
        assertThat(person.getFirstName()).isEqualTo(TEST_VALUE);
    }

    /**
     * Check last name getter/setter.
     */
    @Test
    public void lastNameTest() {
        person.setLastName(TEST_VALUE);
        assertThat(person.getLastName()).isEqualTo(TEST_VALUE);
    }
}

using System;
using Xunit;

namespace API.Test
{
    public class UnitTest1
    {
        [Fact]
        public void Test1()
        {
            ValuesController v = new ValuesController();
            string expected = "ABCD";
            string actual = v.Get().Value;
            Assert.Equal(expected, actual);
        }
    }
}

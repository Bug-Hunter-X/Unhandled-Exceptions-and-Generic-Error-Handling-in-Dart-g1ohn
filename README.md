# Unhandled Exceptions and Generic Error Handling in Dart

This repository demonstrates a common issue in Dart applications: generic exception handling that can make debugging difficult. The `bug.dart` file shows an example of this issue. The `bugSolution.dart` file offers an improved approach. 

**Problem:** The original code handles exceptions using a generic `catch (e)` block, losing valuable information about the specific error that occurred.  This makes it harder to diagnose and fix problems. 

**Solution:** The solution improves error handling by:

1. **More Specific Error Handling:**  Instead of a generic `catch`, handle specific exceptions where appropriate (e.g., `FormatException` for JSON parsing errors).
2. **Custom Exceptions:** Create custom exception classes to provide more context about specific errors.
3. **Enhanced Logging:** Log errors to a more robust system (e.g., a logging library) for better debugging and monitoring.

This example highlights the importance of thoughtful error handling in building reliable Dart applications.
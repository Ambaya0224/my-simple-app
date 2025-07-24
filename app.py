# app.py (on feature-y)
def greet(name):
    return f"Hello, {name}!"

if __name__ == "__main__":
    print(greet("World"))
    print("This is a conflicting change on feature-y.")  # Modified line
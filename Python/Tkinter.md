```python
from tkinter import **
```

```python
from tkinter import *
root = Tk()
```

```python
from tkinter import *
root = Tk()
root.title('Hello World')
```

```python
from tkinter import *
root = Tk()
root.title('Hello World')
root.geometry('600x400')
```

```python
from tkinter import *
root = Tk()
root.title('Hello World')
root.geometry('600x400')

l1 = Label(root, text = 'Username')
```

```python
from tkinter import *
root = Tk()
root.title('Hello World')
root.geometry('600x400')

l1 = Label(root, text = 'Username')
l1.place(x=1, y=1)
```

```python
from tkinter import *
root = Tk()
root.title('Hello World')
root.geometry('600x400')

l1 = Label(root, text = 'Username')
l1.place(x=1, y=1)

l2 = Label(root, text = 'Password')
```

```python
from tkinter import *
root = Tk()
root.title('Hello World')
root.geometry('600x400')

l1 = Label(root, text = 'Username')
l1.place(x=1, y=1)

l2 = Label(root, text = 'Password')
l2.place(x=1, y=30)
```

```python
from tkinter import *
root = Tk()
root.title('Hello World')
root.geometry('600x400')

l1 = Label(root, text = 'Username')
l1.place(x=1, y=1)

l2 = Label(root, text = 'Password')
l2.place(x=1, y=30)

e1 = Entry(root)
```

```python
from tkinter import *
root = Tk()
root.title('Hello World')
root.geometry('600x400')

l1 = Label(root, text = 'Username')
l1.place(x=1, y=1)

l2 = Label(root, text = 'Password')
l2.place(x=1, y=30)

e1 = Entry(root)
e1.place(x=80, y=3)
```

```python
from tkinter import *
root = Tk()
root.title('Hello World')
root.geometry('600x400')

l1 = Label(root, text = 'Username')
l1.place(x=1, y=1)

l2 = Label(root, text = 'Password')
l2.place(x=1, y=30)

e1 = Entry(root)
e1.place(x=80, y=3)

e2 = Entry(root)
e2.place(x=80, y=30)
```

```python
from tkinter import *
root = Tk()
root.title('Hello World')
root.geometry('600x400')

l1 = Label(root, text = 'Username')
l1.place(x=1, y=1)

l2 = Label(root, text = 'Password')
l2.place(x=1, y=30)

e1 = Entry(root)
e1.place(x=80, y=3)

e2 = Entry(root)
e2.place(x=80, y=30)

chk = Checkbutton(root, text='Stay Signed In')
```

```jupyter
from tkinter import *
root = Tk()
root.title('Hello World')
root.geometry('600x400')

l1 = Label(root, text = 'Username')
l1.place(x=1, y=1)

l2 = Label(root, text = 'Password')
l2.place(x=1, y=30)

e1 = Entry(root)
e1.place(x=80, y=3)

e2 = Entry(root)
e2.place(x=80, y=30)

chk = Checkbutton(root, text='Stay Signed In')
chk.place(x=80, y=60)
```

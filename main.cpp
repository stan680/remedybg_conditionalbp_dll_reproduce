#include <Windows.h>

int
WinMain(HINSTANCE hInstance,
        HINSTANCE hPrevInstance,
        LPSTR     lpCmdLine,
        int       nShowCmd)
{
	HMODULE library = LoadLibraryA("library.dll");
	FARPROC proc = GetProcAddress(library, "library_function");

	void (*function)() = (void(*)())proc;

	function();

	return 0;
}

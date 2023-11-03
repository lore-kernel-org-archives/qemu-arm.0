Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id k12-20020adff28c000000b0032f99801273sm2613842wro.66.2023.11.03.13.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Nov 2023 13:06:08 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id A709E65757;
	Fri,  3 Nov 2023 19:59:59 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Song Gao <gaosong@loongson.cn>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Weiwei Li <liweiwei@iscas.ac.cn>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Brian Cain <bcain@quicinc.com>,
	qemu-ppc@nongnu.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	qemu-riscv@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Alistair Francis <alistair.francis@wdc.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Cleber Rosa <crosa@redhat.com>,
	qemu-s390x@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Nicholas Piggin <npiggin@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Bin Meng <bin.meng@windriver.com>,
	Beraldo Leal <bleal@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Michael Rolnik <mrolnik@gmail.com>,
	Greg Manning <gmanning@rapitasystems.com>
Subject: [PATCH 27/29] plugins: make test/example plugins work on windows
Date: Fri,  3 Nov 2023 19:59:54 +0000
Message-Id: <20231103195956.1998255-28-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231103195956.1998255-1-alex.bennee@linaro.org>
References: <20231103195956.1998255-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: P1wfC/h06Em+

From: Greg Manning <gmanning@rapitasystems.com>

Generate a qemu_plugin_api.lib delay import lib on windows, for
windows qemu plugins to link against.

Implement an example dll load fail hook to link up the API functions
correctly when a plugin is loaded on windows.

Update the build scripts for the test and example plugins to use these
things.

Signed-off-by: Greg Manning <gmanning@rapitasystems.com>
Acked-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20231102172053.17692-3-gmanning@rapitasystems.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 configure                      |  3 +++
 contrib/plugins/win32_linker.c | 34 ++++++++++++++++++++++++++++++++++
 contrib/plugins/Makefile       | 20 ++++++++++++++++----
 plugins/meson.build            | 17 +++++++++++++++++
 tests/plugin/meson.build       | 14 +++++++++++---
 5 files changed, 81 insertions(+), 7 deletions(-)
 create mode 100644 contrib/plugins/win32_linker.c

diff --git a/configure b/configure
index f1456f6123..04f2cdd166 100755
--- a/configure
+++ b/configure
@@ -1662,6 +1662,9 @@ echo "CFLAGS=${CFLAGS-$default_cflags} $EXTRA_CFLAGS" >> contrib/plugins/$config
 if test "$targetos" = darwin; then
   echo "CONFIG_DARWIN=y" >> contrib/plugins/$config_host_mak
 fi
+if test "$targetos" = windows; then
+  echo "CONFIG_WIN32=y" >> contrib/plugins/$config_host_mak
+fi
 
 # tests/tcg configuration
 (config_host_mak=tests/tcg/config-host.mak
diff --git a/contrib/plugins/win32_linker.c b/contrib/plugins/win32_linker.c
new file mode 100644
index 0000000000..50797d616e
--- /dev/null
+++ b/contrib/plugins/win32_linker.c
@@ -0,0 +1,34 @@
+/*
+ * Copyright (C) 2023, Greg Manning <gmanning@rapitasystems.com>
+ *
+ * This hook, __pfnDliFailureHook2, is documented in the microsoft documentation here:
+ * https://learn.microsoft.com/en-us/cpp/build/reference/error-handling-and-notification
+ * It gets called when a delay-loaded DLL encounters various errors.
+ * We handle the specific case of a DLL looking for a "qemu.exe",
+ * and give it the running executable (regardless of what it is named).
+ *
+ * This work is licensed under the terms of the GNU LGPL, version 2 or later.
+ * See the COPYING.LIB file in the top-level directory.
+ */
+
+#include <Windows.h>
+#include <delayimp.h>
+
+FARPROC WINAPI dll_failure_hook(unsigned dliNotify, PDelayLoadInfo pdli);
+
+
+PfnDliHook __pfnDliFailureHook2 = dll_failure_hook;
+
+FARPROC WINAPI dll_failure_hook(unsigned dliNotify, PDelayLoadInfo pdli) {
+    if (dliNotify == dliFailLoadLib) {
+        /* If the failing request was for qemu.exe, ... */
+        if (strcmp(pdli->szDll, "qemu.exe") == 0) {
+            /* Then pass back a pointer to the top level module. */
+            HMODULE top = GetModuleHandle(NULL);
+            return (FARPROC) top;
+        }
+    }
+    /* Otherwise we can't do anything special. */
+    return 0;
+}
+
diff --git a/contrib/plugins/Makefile b/contrib/plugins/Makefile
index 8ba78c7a32..751fa38619 100644
--- a/contrib/plugins/Makefile
+++ b/contrib/plugins/Makefile
@@ -22,7 +22,14 @@ NAMES += hwprofile
 NAMES += cache
 NAMES += drcov
 
-SONAMES := $(addsuffix .so,$(addprefix lib,$(NAMES)))
+ifeq ($(CONFIG_WIN32),y)
+SO_SUFFIX := .dll
+LDLIBS += $(shell $(PKG_CONFIG) --libs glib-2.0)
+else
+SO_SUFFIX := .so
+endif
+
+SONAMES := $(addsuffix $(SO_SUFFIX),$(addprefix lib,$(NAMES)))
 
 # The main QEMU uses Glib extensively so it's perfectly fine to use it
 # in plugins (which many example do).
@@ -35,15 +42,20 @@ all: $(SONAMES)
 %.o: %.c
 	$(CC) $(CFLAGS) $(PLUGIN_CFLAGS) -c -o $@ $<
 
-lib%.so: %.o
-ifeq ($(CONFIG_DARWIN),y)
+ifeq ($(CONFIG_WIN32),y)
+lib%$(SO_SUFFIX): %.o win32_linker.o ../../plugins/qemu_plugin_api.lib
+	$(CC) -shared -o $@ $^ $(LDLIBS)
+else ifeq ($(CONFIG_DARWIN),y)
+lib%$(SO_SUFFIX): %.o
 	$(CC) -bundle -Wl,-undefined,dynamic_lookup -o $@ $^ $(LDLIBS)
 else
+lib%$(SO_SUFFIX): %.o
 	$(CC) -shared -o $@ $^ $(LDLIBS)
 endif
 
+
 clean:
-	rm -f *.o *.so *.d
+	rm -f *.o *$(SO_SUFFIX) *.d
 	rm -Rf .libs
 
 .PHONY: all clean
diff --git a/plugins/meson.build b/plugins/meson.build
index 71ed996ed3..8ed9fa270c 100644
--- a/plugins/meson.build
+++ b/plugins/meson.build
@@ -14,6 +14,23 @@ if not enable_modules
 endif
 
 if get_option('plugins')
+  if targetos == 'windows'
+    # Generate a .lib file for plugins to link against.
+    # First, create a .def file listing all the symbols a plugin should expect to have
+    # available in qemu
+    win32_plugin_def = configure_file(
+      input: files('qemu-plugins.symbols'),
+      output: 'qemu_plugin_api.def',
+      capture: true,
+      command: ['sed', '-e', '0,/^/s//EXPORTS/; s/[{};]//g', '@INPUT@'])
+    # then use dlltool to assemble a delaylib.
+    win32_qemu_plugin_api_lib = configure_file(
+      input: win32_plugin_def,
+      output: 'qemu_plugin_api.lib',
+      command: ['dlltool', '--input-def', '@INPUT@',
+                '--output-delaylib', '@OUTPUT@', '--dllname', 'qemu.exe']
+    )
+  endif
   specific_ss.add(files(
     'loader.c',
     'core.c',
diff --git a/tests/plugin/meson.build b/tests/plugin/meson.build
index 322cafcdf6..528bb9d86c 100644
--- a/tests/plugin/meson.build
+++ b/tests/plugin/meson.build
@@ -1,9 +1,17 @@
 t = []
 if get_option('plugins')
   foreach i : ['bb', 'empty', 'insn', 'mem', 'syscall']
-    t += shared_module(i, files(i + '.c'),
-                       include_directories: '../../include/qemu',
-                       dependencies: glib)
+    if targetos == 'windows'
+      t += shared_module(i, files(i + '.c') + '../../contrib/plugins/win32_linker.c',
+                        include_directories: '../../include/qemu',
+                        objects: [win32_qemu_plugin_api_lib],
+                        dependencies: glib)
+
+    else
+      t += shared_module(i, files(i + '.c'),
+                        include_directories: '../../include/qemu',
+                        dependencies: glib)
+    endif
   endforeach
 endif
 if t.length() > 0
-- 
2.39.2

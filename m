Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acab4de06sm514722166b.71.2024.07.29.07.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 07:44:19 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id E88105FA0C;
	Mon, 29 Jul 2024 15:44:15 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
	Thomas Huth <thuth@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Bin Meng <bmeng.cn@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	qemu-riscv@nongnu.org,
	Weiwei Li <liwei1518@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	qemu-s390x@nongnu.org,
	Cleber Rosa <crosa@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	qemu-arm@nongnu.org,
	Alexandre Iooss <erdnaxe@crans.org>,
	Song Gao <gaosong@loongson.cn>,
	David Hildenbrand <david@redhat.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH 09/14] tests/tcg: move test plugins into tcg subdir
Date: Mon, 29 Jul 2024 15:44:09 +0100
Message-Id: <20240729144414.830369-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240729144414.830369-1-alex.bennee@linaro.org>
References: <20240729144414.830369-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: YgSeTs+6phz8

You cannot use plugins without TCG enabled so it doesn't make sense to
have them separated off in the test directory structure. While we are
at it rename the directory to plugins to reflect the plural nature of
the directory and match up with contrib/plugins.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Suggested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 MAINTAINERS                               | 2 +-
 tests/{plugin => tcg/plugins}/bb.c        | 0
 tests/{plugin => tcg/plugins}/empty.c     | 0
 tests/{plugin => tcg/plugins}/inline.c    | 0
 tests/{plugin => tcg/plugins}/insn.c      | 0
 tests/{plugin => tcg/plugins}/mem.c       | 0
 tests/{plugin => tcg/plugins}/syscall.c   | 0
 tests/avocado/tcg_plugins.py              | 4 ++--
 tests/meson.build                         | 2 +-
 tests/tcg/Makefile.target                 | 4 ++--
 tests/{plugin => tcg/plugins}/meson.build | 6 +++---
 11 files changed, 9 insertions(+), 9 deletions(-)
 rename tests/{plugin => tcg/plugins}/bb.c (100%)
 rename tests/{plugin => tcg/plugins}/empty.c (100%)
 rename tests/{plugin => tcg/plugins}/inline.c (100%)
 rename tests/{plugin => tcg/plugins}/insn.c (100%)
 rename tests/{plugin => tcg/plugins}/mem.c (100%)
 rename tests/{plugin => tcg/plugins}/syscall.c (100%)
 rename tests/{plugin => tcg/plugins}/meson.build (70%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 98eddf7ae1..72b3c67360 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3751,7 +3751,7 @@ R: Pierrick Bouvier <pierrick.bouvier@linaro.org>
 S: Maintained
 F: docs/devel/tcg-plugins.rst
 F: plugins/
-F: tests/plugin/
+F: tests/tcg/plugins/
 F: tests/avocado/tcg_plugins.py
 F: contrib/plugins/
 
diff --git a/tests/plugin/bb.c b/tests/tcg/plugins/bb.c
similarity index 100%
rename from tests/plugin/bb.c
rename to tests/tcg/plugins/bb.c
diff --git a/tests/plugin/empty.c b/tests/tcg/plugins/empty.c
similarity index 100%
rename from tests/plugin/empty.c
rename to tests/tcg/plugins/empty.c
diff --git a/tests/plugin/inline.c b/tests/tcg/plugins/inline.c
similarity index 100%
rename from tests/plugin/inline.c
rename to tests/tcg/plugins/inline.c
diff --git a/tests/plugin/insn.c b/tests/tcg/plugins/insn.c
similarity index 100%
rename from tests/plugin/insn.c
rename to tests/tcg/plugins/insn.c
diff --git a/tests/plugin/mem.c b/tests/tcg/plugins/mem.c
similarity index 100%
rename from tests/plugin/mem.c
rename to tests/tcg/plugins/mem.c
diff --git a/tests/plugin/syscall.c b/tests/tcg/plugins/syscall.c
similarity index 100%
rename from tests/plugin/syscall.c
rename to tests/tcg/plugins/syscall.c
diff --git a/tests/avocado/tcg_plugins.py b/tests/avocado/tcg_plugins.py
index a930fca2c0..a6ff457e27 100644
--- a/tests/avocado/tcg_plugins.py
+++ b/tests/avocado/tcg_plugins.py
@@ -77,7 +77,7 @@ def test_aarch64_virt_insn(self):
                                                  suffix=".log")
 
         self.run_vm(kernel_path, kernel_command_line,
-                    "tests/plugin/libinsn.so", plugin_log.name,
+                    "tests/tcg/plugins/libinsn.so", plugin_log.name,
                     console_pattern)
 
         with plugin_log as lf, \
@@ -107,7 +107,7 @@ def test_aarch64_virt_insn_icount(self):
                                                  suffix=".log")
 
         self.run_vm(kernel_path, kernel_command_line,
-                    "tests/plugin/libinsn.so", plugin_log.name,
+                    "tests/tcg/plugins/libinsn.so", plugin_log.name,
                     console_pattern,
                     args=('-icount', 'shift=1'))
 
diff --git a/tests/meson.build b/tests/meson.build
index acb6807094..80dd3029cf 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -78,7 +78,7 @@ subdir('decode')
 
 if 'CONFIG_TCG' in config_all_accel
   subdir('fp')
-  subdir('plugin')
+  subdir('tcg/plugins')
 endif
 
 subdir('unit')
diff --git a/tests/tcg/Makefile.target b/tests/tcg/Makefile.target
index 1f8e5b3d30..452a2cde65 100644
--- a/tests/tcg/Makefile.target
+++ b/tests/tcg/Makefile.target
@@ -142,8 +142,8 @@ RUN_TESTS=$(patsubst %,run-%, $(TESTS))
 
 # If plugins exist also include those in the tests
 ifeq ($(CONFIG_PLUGIN),y)
-PLUGIN_SRC=$(SRC_PATH)/tests/plugin
-PLUGIN_LIB=../../plugin
+PLUGIN_SRC=$(SRC_PATH)/tests/tcg/plugins
+PLUGIN_LIB=../plugins
 VPATH+=$(PLUGIN_LIB)
 PLUGINS=$(patsubst %.c, lib%.so, $(notdir $(wildcard $(PLUGIN_SRC)/*.c)))
 
diff --git a/tests/plugin/meson.build b/tests/tcg/plugins/meson.build
similarity index 70%
rename from tests/plugin/meson.build
rename to tests/tcg/plugins/meson.build
index 9eece5bab5..f847849b1b 100644
--- a/tests/plugin/meson.build
+++ b/tests/tcg/plugins/meson.build
@@ -2,15 +2,15 @@ t = []
 if get_option('plugins')
   foreach i : ['bb', 'empty', 'inline', 'insn', 'mem', 'syscall']
     if host_os == 'windows'
-      t += shared_module(i, files(i + '.c') + '../../contrib/plugins/win32_linker.c',
-                        include_directories: '../../include/qemu',
+      t += shared_module(i, files(i + '.c') + '../../../contrib/plugins/win32_linker.c',
+                        include_directories: '../../../include/qemu',
                         link_depends: [win32_qemu_plugin_api_lib],
                         link_args: ['-Lplugins', '-lqemu_plugin_api'],
                         dependencies: glib)
 
     else
       t += shared_module(i, files(i + '.c'),
-                        include_directories: '../../include/qemu',
+                        include_directories: '../../../include/qemu',
                         dependencies: glib)
     endif
   endforeach
-- 
2.39.2

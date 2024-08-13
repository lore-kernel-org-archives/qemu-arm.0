Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36e4e51ebc2sm11228817f8f.83.2024.08.13.13.23.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 13:23:34 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 25FD35F9E6;
	Tue, 13 Aug 2024 21:23:30 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
	Michael Roth <michael.roth@amd.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Weiwei Li <liwei1518@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Eric Auger <eric.auger@redhat.com>,
	Song Gao <gaosong@loongson.cn>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	Peter Xu <peterx@redhat.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Eric Blake <eblake@redhat.com>,
	Fabiano Rosas <farosas@suse.de>,
	qemu-s390x@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	John Snow <jsnow@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Konstantin Kostiuk <kkostiuk@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Cleber Rosa <crosa@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	qemu-riscv@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Jason Wang <jasowang@redhat.com>,
	Bin Meng <bmeng.cn@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH v2 08/21] buildsys: Fix building without plugins on Darwin
Date: Tue, 13 Aug 2024 21:23:16 +0100
Message-Id: <20240813202329.1237572-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240813202329.1237572-1-alex.bennee@linaro.org>
References: <20240813202329.1237572-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: TgqDeoqCuk3x

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Since commit 0082475e26 the plugin symbol list is unconditionally
added to the linker flags, leading to a build failure:

  Undefined symbols for architecture arm64:
    "_qemu_plugin_entry_code", referenced from:
        <initial-undefines>
  ...
  ld: symbol(s) not found for architecture arm64
  clang: error: linker command failed with exit code 1 (use -v to see invocation)
  ninja: build stopped: subcommand failed.

Fix by restricting the whole meson file to the --enable-plugins
configure argument.

Fixes: 0082475e26 ("meson: merge plugin_ldflags into emulator_link_args")
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20240813112457.92560-1-philmd@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 plugins/meson.build | 50 +++++++++++++++++++++++----------------------
 1 file changed, 26 insertions(+), 24 deletions(-)

diff --git a/plugins/meson.build b/plugins/meson.build
index 18a0303bff..1cc039d29b 100644
--- a/plugins/meson.build
+++ b/plugins/meson.build
@@ -1,3 +1,7 @@
+if not get_option('plugins')
+  subdir_done()
+endif
+
 # Modules need more symbols than just those in plugins/qemu-plugins.symbols
 if not enable_modules
   if host_os == 'darwin'
@@ -12,29 +16,27 @@ if not enable_modules
   endif
 endif
 
-if get_option('plugins')
-  if host_os == 'windows'
-    dlltool = find_program('dlltool', required: true)
+if host_os == 'windows'
+  dlltool = find_program('dlltool', required: true)
 
-    # Generate a .lib file for plugins to link against.
-    # First, create a .def file listing all the symbols a plugin should expect to have
-    # available in qemu
-    win32_plugin_def = configure_file(
-      input: files('qemu-plugins.symbols'),
-      output: 'qemu_plugin_api.def',
-      capture: true,
-      command: ['sed', '-e', '0,/^/s//EXPORTS/; s/[{};]//g', '@INPUT@'])
-    # then use dlltool to assemble a delaylib.
-    win32_qemu_plugin_api_lib = configure_file(
-      input: win32_plugin_def,
-      output: 'libqemu_plugin_api.a',
-      command: [dlltool, '--input-def', '@INPUT@',
-                '--output-delaylib', '@OUTPUT@', '--dllname', 'qemu.exe']
-    )
-  endif
-  specific_ss.add(files(
-    'loader.c',
-    'core.c',
-    'api.c',
-  ))
+  # Generate a .lib file for plugins to link against.
+  # First, create a .def file listing all the symbols a plugin should expect to have
+  # available in qemu
+  win32_plugin_def = configure_file(
+    input: files('qemu-plugins.symbols'),
+    output: 'qemu_plugin_api.def',
+    capture: true,
+    command: ['sed', '-e', '0,/^/s//EXPORTS/; s/[{};]//g', '@INPUT@'])
+  # then use dlltool to assemble a delaylib.
+  win32_qemu_plugin_api_lib = configure_file(
+    input: win32_plugin_def,
+    output: 'libqemu_plugin_api.a',
+    command: [dlltool, '--input-def', '@INPUT@',
+              '--output-delaylib', '@OUTPUT@', '--dllname', 'qemu.exe']
+  )
 endif
+specific_ss.add(files(
+  'loader.c',
+  'core.c',
+  'api.c',
+))
-- 
2.39.2

Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 1-20020a05600c230100b003fefb94ccc9sm13477072wmo.11.2023.11.20.07.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 07:08:34 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 6132B65758;
	Mon, 20 Nov 2023 15:08:34 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	David Hildenbrand <david@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-s390x@nongnu.org,
	Beraldo Leal <bleal@redhat.com>,
	qemu-arm@nongnu.org,
	devel@lists.libvirt.org,
	qemu-ppc@nongnu.org,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Marek Vasut <marex@denx.de>,
	Thomas Huth <thuth@redhat.com>,
	Chris Wulff <crwulff@gmail.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Greg Manning <gmanning@rapitasystems.com>
Subject: [PATCH v2 04/14] plugins: fix win plugin tests on cross compile
Date: Mon, 20 Nov 2023 15:08:23 +0000
Message-Id: <20231120150833.2552739-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231120150833.2552739-1-alex.bennee@linaro.org>
References: <20231120150833.2552739-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: zSRSTrLrjVvs

From: Greg Manning <gmanning@rapitasystems.com>

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1972

Cross compile gcc is more picky about argument order than msys. Changed
the meson command to take the (now renamed) libqemu_plugin_api.a as a
lib, rather than an object. This puts it in the right place on both
native and cross compile gcc commands

Reenable plugins on crossbuilds

Signed-off-by: Greg Manning <gmanning@rapitasystems.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20231109124326.21106-2-gmanning@rapitasystems.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.d/crossbuilds.yml | 2 +-
 contrib/plugins/Makefile     | 2 +-
 plugins/meson.build          | 2 +-
 tests/plugin/meson.build     | 3 ++-
 4 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index c2af6c7f44..d19d98cde0 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -165,7 +165,7 @@ cross-win32-system:
     job: win32-fedora-cross-container
   variables:
     IMAGE: fedora-win32-cross
-    EXTRA_CONFIGURE_OPTS: --enable-fdt=internal --disable-plugins
+    EXTRA_CONFIGURE_OPTS: --enable-fdt=internal
     CROSS_SKIP_TARGETS: alpha-softmmu avr-softmmu hppa-softmmu m68k-softmmu
                         microblazeel-softmmu mips64el-softmmu nios2-softmmu
   artifacts:
diff --git a/contrib/plugins/Makefile b/contrib/plugins/Makefile
index 1783750cf6..0b64d2c1e3 100644
--- a/contrib/plugins/Makefile
+++ b/contrib/plugins/Makefile
@@ -49,7 +49,7 @@ all: $(SONAMES)
 	$(CC) $(CFLAGS) $(PLUGIN_CFLAGS) -c -o $@ $<
 
 ifeq ($(CONFIG_WIN32),y)
-lib%$(SO_SUFFIX): %.o win32_linker.o ../../plugins/qemu_plugin_api.lib
+lib%$(SO_SUFFIX): %.o win32_linker.o ../../plugins/libqemu_plugin_api.a
 	$(CC) -shared -o $@ $^ $(LDLIBS)
 else ifeq ($(CONFIG_DARWIN),y)
 lib%$(SO_SUFFIX): %.o
diff --git a/plugins/meson.build b/plugins/meson.build
index 40d24529c0..6b2d7a9292 100644
--- a/plugins/meson.build
+++ b/plugins/meson.build
@@ -28,7 +28,7 @@ if get_option('plugins')
     # then use dlltool to assemble a delaylib.
     win32_qemu_plugin_api_lib = configure_file(
       input: win32_plugin_def,
-      output: 'qemu_plugin_api.lib',
+      output: 'libqemu_plugin_api.a',
       command: [dlltool, '--input-def', '@INPUT@',
                 '--output-delaylib', '@OUTPUT@', '--dllname', 'qemu.exe']
     )
diff --git a/tests/plugin/meson.build b/tests/plugin/meson.build
index 528bb9d86c..28a929dbcc 100644
--- a/tests/plugin/meson.build
+++ b/tests/plugin/meson.build
@@ -4,7 +4,8 @@ if get_option('plugins')
     if targetos == 'windows'
       t += shared_module(i, files(i + '.c') + '../../contrib/plugins/win32_linker.c',
                         include_directories: '../../include/qemu',
-                        objects: [win32_qemu_plugin_api_lib],
+                        link_depends: [win32_qemu_plugin_api_lib],
+                        link_args: ['-Lplugins', '-lqemu_plugin_api'],
                         dependencies: glib)
 
     else
-- 
2.39.2

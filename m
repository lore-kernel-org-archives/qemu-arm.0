Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac1e7fa6246sm252666366b.167.2025.03.04.14.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 14:24:41 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 29E675FD17;
	Tue,  4 Mar 2025 22:24:40 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Li-Wen Hsu <lwhsu@freebsd.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Laurent Vivier <laurent@vivier.eu>,
	qemu-arm@nongnu.org,
	Alexandre Iooss <erdnaxe@crans.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Riku Voipio <riku.voipio@iki.fi>,
	Warner Losh <imp@bsdimp.com>,
	Brian Cain <brian.cain@oss.qualcomm.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Kyle Evans <kevans@freebsd.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Ed Maste <emaste@freebsd.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <thuth@redhat.com>
Subject: [PATCH v2 08/32] plugins: add explicit dependency in functional tests
Date: Tue,  4 Mar 2025 22:24:15 +0000
Message-Id: <20250304222439.2035603-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250304222439.2035603-1-alex.bennee@linaro.org>
References: <20250304222439.2035603-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: FUm2yzRhtbh6

From: Pierrick Bouvier <pierrick.bouvier@linaro.org>

./tests/functional/test_aarch64_tcg_plugins.py needs to have plugin
libinsn built. However, it's not listed as a dependency, so meson can't
know it needs to be built.

Thus, we keep track of all plugins, and add them as an explicit
dependency.

Fixes: 4c134d07b9e ("tests: add a new set of tests to exercise plugins")
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20250220080215.49165-2-philmd@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 meson.build                   | 1 +
 contrib/plugins/meson.build   | 2 ++
 tests/functional/meson.build  | 2 +-
 tests/tcg/plugins/meson.build | 2 ++
 4 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 0a2c61d2bf..8d0abe7f12 100644
--- a/meson.build
+++ b/meson.build
@@ -3662,6 +3662,7 @@ qtest_module_ss = ss.source_set()
 
 modules = {}
 target_modules = {}
+plugin_modules = []
 hw_arch = {}
 target_arch = {}
 target_system_arch = {}
diff --git a/contrib/plugins/meson.build b/contrib/plugins/meson.build
index 484b9a808c..fa8a426c8b 100644
--- a/contrib/plugins/meson.build
+++ b/contrib/plugins/meson.build
@@ -26,3 +26,5 @@ if t.length() > 0
 else
   run_target('contrib-plugins', command: find_program('true'))
 endif
+
+plugin_modules += t
diff --git a/tests/functional/meson.build b/tests/functional/meson.build
index 4b492135e0..008d72aed8 100644
--- a/tests/functional/meson.build
+++ b/tests/functional/meson.build
@@ -380,7 +380,7 @@ foreach speed : ['quick', 'thorough']
       # 'run_target' logic below & in Makefile.include
       test('func-' + testname,
            python,
-           depends: [test_deps, test_emulator, emulator_modules],
+           depends: [test_deps, test_emulator, emulator_modules, plugin_modules],
            env: test_env,
            args: [testpath],
            protocol: 'tap',
diff --git a/tests/tcg/plugins/meson.build b/tests/tcg/plugins/meson.build
index 87a17d67bd..c8cb0626a6 100644
--- a/tests/tcg/plugins/meson.build
+++ b/tests/tcg/plugins/meson.build
@@ -19,3 +19,5 @@ if t.length() > 0
 else
   run_target('test-plugins', command: find_program('true'))
 endif
+
+plugin_modules += t
-- 
2.39.5

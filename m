Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd882bf7sm5792382f8f.52.2025.02.26.06.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 06:03:47 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 5E6786030F;
	Wed, 26 Feb 2025 14:03:44 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Kyle Evans <kevans@freebsd.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Alexandre Iooss <erdnaxe@crans.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Li-Wen Hsu <lwhsu@freebsd.org>,
	Riku Voipio <riku.voipio@iki.fi>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Warner Losh <imp@bsdimp.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ed Maste <emaste@freebsd.org>,
	Thomas Huth <thuth@redhat.com>
Subject: [PATCH 05/25] plugins: add explicit dependency in functional tests
Date: Wed, 26 Feb 2025 14:03:23 +0000
Message-Id: <20250226140343.3907080-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250226140343.3907080-1-alex.bennee@linaro.org>
References: <20250226140343.3907080-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: M8iwZixo3kRT

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
index 0ee79c664d..4588bfd864 100644
--- a/meson.build
+++ b/meson.build
@@ -3657,6 +3657,7 @@ qtest_module_ss = ss.source_set()
 
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
index c12ee1ce41..ea4b12c054 100644
--- a/tests/functional/meson.build
+++ b/tests/functional/meson.build
@@ -366,7 +366,7 @@ foreach speed : ['quick', 'thorough']
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

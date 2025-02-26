Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd8fbcabsm5610553f8f.86.2025.02.26.06.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 06:03:47 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 8C5AB60342;
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
Subject: [PATCH 07/25] tests/functional: Allow running TCG plugins tests on non-Linux/BSD hosts
Date: Wed, 26 Feb 2025 14:03:25 +0000
Message-Id: <20250226140343.3907080-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250226140343.3907080-1-alex.bennee@linaro.org>
References: <20250226140343.3907080-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: VNrydtxgWmdd

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Not all platforms use the '.so' suffix for shared libraries,
which is how plugins are built. Use the recently introduced
dso_suffix() helper to get the proper host suffix.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2804
Suggested-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20250220080215.49165-4-philmd@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/functional/test_aarch64_tcg_plugins.py | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/tests/functional/test_aarch64_tcg_plugins.py b/tests/functional/test_aarch64_tcg_plugins.py
index 7e8beacc83..5736b60545 100755
--- a/tests/functional/test_aarch64_tcg_plugins.py
+++ b/tests/functional/test_aarch64_tcg_plugins.py
@@ -13,10 +13,11 @@
 
 import tempfile
 import mmap
+import os
 import re
 
 from qemu.machine.machine import VMLaunchFailure
-from qemu_test import LinuxKernelTest, Asset
+from qemu_test import LinuxKernelTest, Asset, dso_suffix
 
 
 class PluginKernelBase(LinuxKernelTest):
@@ -62,6 +63,10 @@ class PluginKernelNormal(PluginKernelBase):
         ('https://storage.tuxboot.com/20230331/arm64/Image'),
         'ce95a7101a5fecebe0fe630deee6bd97b32ba41bc8754090e9ad8961ea8674c7')
 
+    def plugin_file(self, plugin_name):
+        sfx = dso_suffix()
+        return os.path.join('tests', 'tcg', 'plugins', f'{plugin_name}.{sfx}')
+
     def test_aarch64_virt_insn(self):
         self.set_machine('virt')
         self.cpu='cortex-a53'
@@ -74,7 +79,7 @@ def test_aarch64_virt_insn(self):
                                                  suffix=".log")
 
         self.run_vm(kernel_path, kernel_command_line,
-                    "tests/tcg/plugins/libinsn.so", plugin_log.name,
+                    self.plugin_file('libinsn'), plugin_log.name,
                     console_pattern)
 
         with plugin_log as lf, \
@@ -100,7 +105,7 @@ def test_aarch64_virt_insn_icount(self):
                                                  suffix=".log")
 
         self.run_vm(kernel_path, kernel_command_line,
-                    "tests/tcg/plugins/libinsn.so", plugin_log.name,
+                    self.plugin_file('libinsn'), plugin_log.name,
                     console_pattern,
                     args=('-icount', 'shift=1'))
 
-- 
2.39.5

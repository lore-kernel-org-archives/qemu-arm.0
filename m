Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390df959306sm470978f8f.58.2025.02.26.06.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 06:03:47 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 77BEE60339;
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
Subject: [PATCH 06/25] tests/functional: Introduce the dso_suffix() helper
Date: Wed, 26 Feb 2025 14:03:24 +0000
Message-Id: <20250226140343.3907080-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250226140343.3907080-1-alex.bennee@linaro.org>
References: <20250226140343.3907080-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: n1Aa4Dgwe0lr

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Introduce a helper to get the default shared library
suffix used on the host.

Suggested-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20250220080215.49165-3-philmd@linaro.org>
[AJB: dropped whitespace cmd.py damage]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/functional/qemu_test/__init__.py | 2 +-
 tests/functional/qemu_test/config.py   | 6 ++++++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/tests/functional/qemu_test/__init__.py b/tests/functional/qemu_test/__init__.py
index 5c972843a6..45f7befa37 100644
--- a/tests/functional/qemu_test/__init__.py
+++ b/tests/functional/qemu_test/__init__.py
@@ -7,7 +7,7 @@
 
 
 from .asset import Asset
-from .config import BUILD_DIR
+from .config import BUILD_DIR, dso_suffix
 from .cmd import is_readable_executable_file, \
     interrupt_interactive_console_until_pattern, wait_for_console_pattern, \
     exec_command, exec_command_and_wait_for_pattern, get_qemu_img, which
diff --git a/tests/functional/qemu_test/config.py b/tests/functional/qemu_test/config.py
index edd75b7fd0..0eab1baa54 100644
--- a/tests/functional/qemu_test/config.py
+++ b/tests/functional/qemu_test/config.py
@@ -13,6 +13,7 @@
 
 import os
 from pathlib import Path
+import platform
 
 
 def _source_dir():
@@ -34,3 +35,8 @@ def _build_dir():
     raise Exception("Cannot identify build dir, set QEMU_BUILD_ROOT")
 
 BUILD_DIR = _build_dir()
+
+def dso_suffix():
+    '''Return the dynamic libraries suffix for the current platform'''
+    DSO_SUFFIXES = { 'Linux': 'so', 'Darwin': 'dylib', 'Windows': 'dll' }
+    return DSO_SUFFIXES[platform.system()]
-- 
2.39.5

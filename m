Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id y9sm19434556wmm.26.2020.04.14.13.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 13:16:11 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 31E541FF9E;
	Tue, 14 Apr 2020 21:06:34 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PATCH  v2 16/17] tests/tcg: drop inferior.was_attached() test
Date: Tue, 14 Apr 2020 21:06:30 +0100
Message-Id: <20200414200631.12799-17-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200414200631.12799-1-alex.bennee@linaro.org>
References: <20200414200631.12799-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: YP/YiJylGOUP

This test seems flaky and reports attachment even when we failed to
negotiate the architecture. However the fetching of the guest
architecture will fail tripping up the gdb AttributeError which will
trigger our early no error status exit from the test

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/aarch64/gdbstub/test-sve-ioctl.py | 3 ---
 tests/tcg/aarch64/gdbstub/test-sve.py       | 3 ---
 2 files changed, 6 deletions(-)

diff --git a/tests/tcg/aarch64/gdbstub/test-sve-ioctl.py b/tests/tcg/aarch64/gdbstub/test-sve-ioctl.py
index 984fbeb277e..5824abe09ac 100644
--- a/tests/tcg/aarch64/gdbstub/test-sve-ioctl.py
+++ b/tests/tcg/aarch64/gdbstub/test-sve-ioctl.py
@@ -58,9 +58,6 @@ def run_test():
 #
 try:
     inferior = gdb.selected_inferior()
-    if inferior.was_attached == False:
-        print("SKIPPING (failed to attach)", file=sys.stderr)
-        exit(0)
     arch = inferior.architecture()
     report(arch.name() == "aarch64", "connected to aarch64")
 except (gdb.error, AttributeError):
diff --git a/tests/tcg/aarch64/gdbstub/test-sve.py b/tests/tcg/aarch64/gdbstub/test-sve.py
index dbe7f2aa932..90201d80094 100644
--- a/tests/tcg/aarch64/gdbstub/test-sve.py
+++ b/tests/tcg/aarch64/gdbstub/test-sve.py
@@ -59,9 +59,6 @@ def run_test():
 #
 try:
     inferior = gdb.selected_inferior()
-    if inferior.was_attached == False:
-        print("SKIPPING (failed to attach)", file=sys.stderr)
-        exit(0)
     arch = inferior.architecture()
     report(arch.name() == "aarch64", "connected to aarch64")
 except (gdb.error, AttributeError):
-- 
2.20.1

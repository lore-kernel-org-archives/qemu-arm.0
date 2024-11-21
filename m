Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fd0fbdcsm27306f8f.109.2024.11.21.09.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 09:06:25 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 8231260443;
	Thu, 21 Nov 2024 16:58:08 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	qemu-ppc@nongnu.org,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	qemu-riscv@nongnu.org,
	Thomas Huth <huth@tuxfamily.org>,
	Bernhard Beschow <shentey@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	Eric Farman <farman@linux.ibm.com>,
	Bin Meng <bmeng.cn@gmail.com>,
	qemu-s390x@nongnu.org,
	Niek Linnenbank <nieklinnenbank@gmail.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	John Snow <jsnow@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	qemu-rust@nongnu.org,
	Nicholas Piggin <npiggin@gmail.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Markus Armbruster <armbru@redhat.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Ani Sinha <anisinha@redhat.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Anders Roxell <anders.roxell@linaro.org>
Subject: [PATCH 23/39] tests/functional: add a m68k tuxrun tests
Date: Thu, 21 Nov 2024 16:57:50 +0000
Message-Id: <20241121165806.476008-24-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241121165806.476008-1-alex.bennee@linaro.org>
References: <20241121165806.476008-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: JrxcqLjwhHMn

We didn't have this before and as it exercises the m68k virt platform
it seems worth adding. We don't wait for the shutdown because QEMU
will auto-exit on the shutdown.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Laurent Vivier <laurent@vivier.eu>
Cc: Anders Roxell <anders.roxell@linaro.org>
---
 tests/functional/meson.build         |  1 +
 tests/functional/test_m68k_tuxrun.py | 34 ++++++++++++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 tests/functional/test_m68k_tuxrun.py

diff --git a/tests/functional/meson.build b/tests/functional/meson.build
index 923f9e7078..3ce969066c 100644
--- a/tests/functional/meson.build
+++ b/tests/functional/meson.build
@@ -95,6 +95,7 @@ tests_m68k_system_thorough = [
   'm68k_mcf5208evb',
   'm68k_nextcube',
   'm68k_q800',
+  'm68k_tuxrun',
 ]
 
 tests_microblaze_system_thorough = [
diff --git a/tests/functional/test_m68k_tuxrun.py b/tests/functional/test_m68k_tuxrun.py
new file mode 100644
index 0000000000..7eacba135f
--- /dev/null
+++ b/tests/functional/test_m68k_tuxrun.py
@@ -0,0 +1,34 @@
+#!/usr/bin/env python3
+#
+# Functional test that boots known good tuxboot images the same way
+# that tuxrun (www.tuxrun.org) does. This tool is used by things like
+# the LKFT project to run regression tests on kernels.
+#
+# Copyright (c) 2024 Linaro Ltd.
+#
+# Author:
+#  Alex Bennée <alex.bennee@linaro.org>
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+from qemu_test import Asset
+from qemu_test.tuxruntest import TuxRunBaselineTest
+
+class TuxRunM68KTest(TuxRunBaselineTest):
+
+    ASSET_M68K_KERNEL = Asset(
+        'https://storage.tuxboot.com/buildroot/20241119/m68k/vmlinux',
+        '7754e1d5cec753ccf1dc6894729a7f54c1a4965631ebf56df8e4ce1163ad19d8')
+    ASSET_M68K_ROOTFS = Asset(
+        'https://storage.tuxboot.com/buildroot/20241119/m68k/rootfs.ext4.zst',
+        '557962ffff265607912e82232cf21adbe0e4e5a88e1e1d411ce848c37f0213e9')
+
+    def test_m68k(self):
+        self.set_machine('virt')
+        self.cpu="m68040"
+        self.common_tuxrun(kernel_asset=self.ASSET_M68K_KERNEL,
+                           rootfs_asset=self.ASSET_M68K_ROOTFS,
+                           drive="virtio-blk-device")
+
+if __name__ == '__main__':
+    TuxRunBaselineTest.main()
-- 
2.39.5

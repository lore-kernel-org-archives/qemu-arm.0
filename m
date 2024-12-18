Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aab9600dd9csm578696466b.10.2024.12.18.08.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 08:21:05 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 640F55FBC6;
	Wed, 18 Dec 2024 16:21:04 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Ed Maste <emaste@freebsd.org>,
	Eric Farman <farman@linux.ibm.com>,
	Thomas Huth <thuth@redhat.com>,
	Li-Wen Hsu <lwhsu@freebsd.org>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Fabiano Rosas <farosas@suse.de>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	qemu-riscv@nongnu.org,
	Nicholas Piggin <npiggin@gmail.com>,
	Joel Stanley <joel@jms.id.au>,
	Beraldo Leal <bleal@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Cleber Rosa <crosa@redhat.com>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	John Snow <jsnow@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Bin Meng <bmeng.cn@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Richard Henderson <richard.henderson@linaro.org>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	Halil Pasic <pasic@linux.ibm.com>,
	qemu-arm@nongnu.org,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	qemu-ppc@nongnu.org,
	Bernhard Beschow <shentey@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	qemu-s390x@nongnu.org,
	Laurent Vivier <lvivier@redhat.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Anders Roxell <anders.roxell@linaro.org>
Subject: [PATCH v2 03/27] tests/functional: add a m68k tuxrun tests
Date: Wed, 18 Dec 2024 16:20:39 +0000
Message-Id: <20241218162104.3493551-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241218162104.3493551-1-alex.bennee@linaro.org>
References: <20241218162104.3493551-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: fx+PRQgRw0t4

We didn't have this before and as it exercises the m68k virt platform
it seems worth adding. We don't wait for the shutdown because QEMU
will auto-exit on the shutdown.

Cc: Laurent Vivier <laurent@vivier.eu>
Cc: Anders Roxell <anders.roxell@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20241121165806.476008-24-alex.bennee@linaro.org>

---
v2
  - add to MAINTAINERS
---
 MAINTAINERS                          |  1 +
 tests/functional/meson.build         |  1 +
 tests/functional/test_m68k_tuxrun.py | 34 ++++++++++++++++++++++++++++
 3 files changed, 36 insertions(+)
 create mode 100644 tests/functional/test_m68k_tuxrun.py

diff --git a/MAINTAINERS b/MAINTAINERS
index 822f34344b..f7aa069d47 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1283,6 +1283,7 @@ F: include/hw/intc/goldfish_pic.h
 F: include/hw/intc/m68k_irqc.h
 F: include/hw/misc/virt_ctrl.h
 F: docs/specs/virt-ctlr.rst
+F: tests/functional/test_m68k_tuxrun.py
 
 MicroBlaze Machines
 -------------------
diff --git a/tests/functional/meson.build b/tests/functional/meson.build
index 1bc5ba5229..0e1bfb8c44 100644
--- a/tests/functional/meson.build
+++ b/tests/functional/meson.build
@@ -112,6 +112,7 @@ tests_m68k_system_thorough = [
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

Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5a21662e2f3sm295410a12.40.2024.07.18.02.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 02:45:24 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 2BD625F929;
	Thu, 18 Jul 2024 10:45:24 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Thomas Huth <thuth@redhat.com>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	Bin Meng <bmeng.cn@gmail.com>,
	qemu-riscv@nongnu.org,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Beraldo Leal <bleal@redhat.com>,
	Li-Wen Hsu <lwhsu@freebsd.org>,
	Ed Maste <emaste@freebsd.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Weiwei Li <liwei1518@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	=?UTF-8?q?Cl=C3=A9ment=20Chigot?= <chigot@adacore.com>
Subject: [PATCH 02/15] tests/avocado: Remove non-working sparc leon3 test
Date: Thu, 18 Jul 2024 10:45:10 +0100
Message-Id: <20240718094523.1198645-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240718094523.1198645-1-alex.bennee@linaro.org>
References: <20240718094523.1198645-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: LGvPn+E9JAea

From: Thomas Huth <thuth@redhat.com>

The test has been marked as broken more than 4 years ago, and
so far nobody ever cared to fix it. Thus let's simply remove it
now ... if somebody ever needs it again, they can restore the
file from an older version of QEMU.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Clément Chigot <chigot@adacore.com>
Acked-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20240710111755.60584-1-thuth@redhat.com>
[AJB: fix MAINTAINERS]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 MAINTAINERS                          |  1 -
 tests/avocado/machine_sparc_leon3.py | 37 ----------------------------
 2 files changed, 38 deletions(-)
 delete mode 100644 tests/avocado/machine_sparc_leon3.py

diff --git a/MAINTAINERS b/MAINTAINERS
index 7d9811458c..d5ff6c2498 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1727,7 +1727,6 @@ S: Maintained
 F: hw/sparc/leon3.c
 F: hw/*/grlib*
 F: include/hw/*/grlib*
-F: tests/avocado/machine_sparc_leon3.py
 
 S390 Machines
 -------------
diff --git a/tests/avocado/machine_sparc_leon3.py b/tests/avocado/machine_sparc_leon3.py
deleted file mode 100644
index e61b223185..0000000000
--- a/tests/avocado/machine_sparc_leon3.py
+++ /dev/null
@@ -1,37 +0,0 @@
-# Functional test that boots a Leon3 machine and checks its serial console.
-#
-# Copyright (c) Philippe Mathieu-Daudé <f4bug@amsat.org>
-#
-# This work is licensed under the terms of the GNU GPL, version 2 or
-# later. See the COPYING file in the top-level directory.
-
-from avocado_qemu import QemuSystemTest
-from avocado_qemu import wait_for_console_pattern
-from avocado import skip
-
-
-class Leon3Machine(QemuSystemTest):
-
-    timeout = 60
-
-    @skip("Test currently broken")
-    # A Window Underflow exception occurs before booting the kernel,
-    # and QEMU exit calling cpu_abort(), which makes this test to fail.
-    def test_leon3_helenos_uimage(self):
-        """
-        :avocado: tags=arch:sparc
-        :avocado: tags=machine:leon3_generic
-        :avocado: tags=binfmt:uimage
-        """
-        kernel_url = ('http://www.helenos.org/releases/'
-                      'HelenOS-0.6.0-sparc32-leon3.bin')
-        kernel_hash = 'a88c9cfdb8430c66650e5290a08765f9bf049a30'
-        kernel_path = self.fetch_asset(kernel_url, asset_hash=kernel_hash)
-
-        self.vm.set_console()
-        self.vm.add_args('-kernel', kernel_path)
-
-        self.vm.launch()
-
-        wait_for_console_pattern(self, 'Copyright (c) 2001-2014 HelenOS project')
-        wait_for_console_pattern(self, 'Booting the kernel ...')
-- 
2.39.2

Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id cn27-20020a0564020cbb00b00418b0c7fbbfsm777256edb.32.2022.03.15.05.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Mar 2022 05:12:52 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 23B081FFBA;
	Tue, 15 Mar 2022 12:12:52 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net,
	berrange@redhat.com,
	f4bug@amsat.org,
	aurelien@aurel32.net,
	pbonzini@redhat.com,
	stefanha@redhat.com,
	crosa@redhat.com,
	qemu-arm@nongnu.org,
	richard.henderson@linaro.org,
	sw@weilnetz.de,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Beraldo Leal <bleal@redhat.com>
Subject: [PATCH  v1 2/8] tests/avocado: update aarch64_virt test to exercise -cpu max
Date: Tue, 15 Mar 2022 12:12:45 +0000
Message-Id: <20220315121251.2280317-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220315121251.2280317-1-alex.bennee@linaro.org>
References: <20220315121251.2280317-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: p8PT8hFgkTwK

The Fedora 29 kernel is quite old and importantly fails when running
in LPA2 scenarios. As it's not really exercising much of the CPU space
replace it with a custom 5.16.12 kernel with all the architecture
options turned on. There is a minimal buildroot initramfs included in
the kernel which has a few tools for stress testing the memory
subsystem. The userspace also targets the Neoverse N1 processor so
will fail without additional v8.x+ features.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220307172249.3125779-1-alex.bennee@linaro.org>
---
 tests/avocado/boot_linux_console.py | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux_console.py
index 9c618d4809..ca3a40e91d 100644
--- a/tests/avocado/boot_linux_console.py
+++ b/tests/avocado/boot_linux_console.py
@@ -12,6 +12,7 @@
 import lzma
 import gzip
 import shutil
+import time
 
 from avocado import skip
 from avocado import skipUnless
@@ -330,25 +331,30 @@ def test_aarch64_virt(self):
         :avocado: tags=arch:aarch64
         :avocado: tags=machine:virt
         :avocado: tags=accel:tcg
-        :avocado: tags=cpu:cortex-a53
+        :avocado: tags=cpu:max
         """
-        kernel_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
-                      '/linux/releases/29/Everything/aarch64/os/images/pxeboot'
-                      '/vmlinuz')
-        kernel_hash = '8c73e469fc6ea06a58dc83a628fc695b693b8493'
+        kernel_url = ('https://fileserver.linaro.org/s/'
+                      'z6B2ARM7DQT3HWN/download')
+
+        kernel_hash = 'ed11daab50c151dde0e1e9c9cb8b2d9bd3215347'
         kernel_path = self.fetch_asset(kernel_url, asset_hash=kernel_hash)
 
         self.vm.set_console()
         kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
                                'console=ttyAMA0')
         self.require_accelerator("tcg")
-        self.vm.add_args('-cpu', 'cortex-a53',
+        self.vm.add_args('-cpu', 'max,pauth-impdef=on',
                          '-accel', 'tcg',
                          '-kernel', kernel_path,
                          '-append', kernel_command_line)
         self.vm.launch()
-        console_pattern = 'Kernel command line: %s' % kernel_command_line
-        self.wait_for_console_pattern(console_pattern)
+        self.wait_for_console_pattern('Welcome to Buildroot')
+        time.sleep(0.1)
+        exec_command(self, 'root')
+        time.sleep(0.1)
+        exec_command(self, 'cat /proc/self/maps')
+        time.sleep(0.1)
+
 
     def test_aarch64_xlnx_versal_virt(self):
         """
-- 
2.30.2

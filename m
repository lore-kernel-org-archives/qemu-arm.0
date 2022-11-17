Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id l32-20020a05600c1d2000b003cfbbd54178sm11306161wms.2.2022.11.17.09.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 09:25:36 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id B30041FFC1;
	Thu, 17 Nov 2022 17:25:33 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net,
	berrange@redhat.com,
	f4bug@amsat.org,
	aurelien@aurel32.net,
	pbonzini@redhat.com,
	stefanha@redhat.com,
	crosa@redhat.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	qemu-arm@nongnu.org (open list:Virt)
Subject: [PATCH  v3 09/13] tests/avocado: introduce alpine virt test for CI
Date: Thu, 17 Nov 2022 17:25:28 +0000
Message-Id: <20221117172532.538149-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221117172532.538149-1-alex.bennee@linaro.org>
References: <20221117172532.538149-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: tubfYF9wlb8Q

The boot_linux tests download and run a full cloud image boot and
start a full distro. While the ability to test the full boot chain is
worthwhile it is perhaps a little too heavy weight and causes issues
in CI. Fix this by introducing a new alpine linux ISO boot in
machine_aarch64_virt.

This boots a fully loaded -cpu max with all the bells and whistles in
31s on my machine. A full debug build takes around 180s on my machine
so we set a more generous timeout to cover that.

We don't add a test for lesser GIC versions although there is some
coverage for that already in the boot_xen.py tests. If we want to
introduce more comprehensive testing we can do it with a custom kernel
and initrd rather than a full distro boot.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v1
  - use "virt" image instead (even faster)
  - don't drop boot_linux (it is now disabled for CI)
  - re-phrase commit message
  - add alpine to the test name
---
 tests/avocado/machine_aarch64_virt.py | 46 ++++++++++++++++++++++++++-
 1 file changed, 45 insertions(+), 1 deletion(-)

diff --git a/tests/avocado/machine_aarch64_virt.py b/tests/avocado/machine_aarch64_virt.py
index 21848cba70..c2b2ba2cf8 100644
--- a/tests/avocado/machine_aarch64_virt.py
+++ b/tests/avocado/machine_aarch64_virt.py
@@ -1,4 +1,5 @@
-# Functional test that boots a Linux kernel and checks the console
+# Functional test that boots a various Linux systems and checks the
+# console output.
 #
 # Copyright (c) 2022 Linaro Ltd.
 #
@@ -8,19 +9,62 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
 
 import time
+import os
 
 from avocado_qemu import QemuSystemTest
 from avocado_qemu import wait_for_console_pattern
 from avocado_qemu import exec_command
+from avocado_qemu import BUILD_DIR
 
 class Aarch64VirtMachine(QemuSystemTest):
     KERNEL_COMMON_COMMAND_LINE = 'printk.time=0 '
+    timeout = 360
 
     def wait_for_console_pattern(self, success_message, vm=None):
         wait_for_console_pattern(self, success_message,
                                  failure_message='Kernel panic - not syncing',
                                  vm=vm)
 
+    # This tests the whole boot chain from EFI to Userspace
+    # We only boot a whole OS for the current top level CPU and GIC
+    # Other test profiles should use more minimal boots
+    def test_alpine_virt_tcg_gic_max(self):
+        """
+        :avocado: tags=arch:aarch64
+        :avocado: tags=machine:virt
+        :avocado: tags=accel:tcg
+        """
+        iso_url = ('https://dl-cdn.alpinelinux.org/'
+                   'alpine/v3.16/releases/aarch64/'
+                   'alpine-virt-3.16.3-aarch64.iso')
+
+        # Alpine use sha256 so I recalculated this myself
+        iso_sha1 = '0683bc089486d55c91bf6607d5ecb93925769bc0'
+        iso_path = self.fetch_asset(iso_url, asset_hash=iso_sha1)
+
+        self.vm.set_console()
+        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
+                               'console=ttyAMA0')
+        self.require_accelerator("tcg")
+
+        self.vm.add_args("-accel", "tcg")
+        self.vm.add_args("-cpu", "max,pauth-impdef=on")
+        self.vm.add_args("-machine",
+                         "virt,acpi=on,"
+                         "virtualization=on,"
+                         "mte=on,"
+                         "gic-version=max,iommu=smmuv3")
+        self.vm.add_args("-smp", "2", "-m", "1024")
+        self.vm.add_args('-bios', os.path.join(BUILD_DIR, 'pc-bios',
+                                               'edk2-aarch64-code.fd'))
+        self.vm.add_args("-drive", f"file={iso_path},format=raw")
+        self.vm.add_args('-device', 'virtio-rng-pci,rng=rng0')
+        self.vm.add_args('-object', 'rng-random,id=rng0,filename=/dev/urandom')
+
+        self.vm.launch()
+        self.wait_for_console_pattern('Welcome to Alpine Linux 3.16')
+
+
     def test_aarch64_virt(self):
         """
         :avocado: tags=arch:aarch64
-- 
2.34.1

Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp3323184njk;
        Mon, 2 Dec 2024 16:17:46 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVhDHOF8bseeTOAvtW5wrFhqNL6pYyEMZNOYn2V+7sMI80uE//974IrwTfIWa2L5WW5xtuzVbSNmid7cQ==@linaro.org
X-Received: by 2002:a17:902:ecd0:b0:215:9207:adc2 with SMTP id d9443c01a7336-215be5fd385mr5006165ad.19.1733185066711;
        Mon, 02 Dec 2024 16:17:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733185066; cv=none;
        d=google.com; s=arc-20240605;
        b=Yyeos3A6twpGYofo9D3lOWfVrErhKLuJls9ty8bEsKgcyEMhL9mqCsFY1k8fkwYGYL
         Ma0vj1FTvgClJGt12UFZ/BLNi2XQzcUiDJ5fGBJfsiqnnbVjIHy447N0HQapRLFYKOBF
         nd78U7J2kv/FjVeG+HAJ6jtfYcCGdvJE088NAfZV0+EMvOMRGfT3pZ5d41Lc/YcYT81Z
         LFQi8QF7nU6t52af7HKb4iLENsPuuEbGuxYhd1y6l8Wgv0KRm5VkVNpXF8PNw12g1g94
         /z31qpyW6I2YHCCZXHUfbPHjJ8DXznjVmsLenJQvl5FLmF6Cc7I/CVi6Aa8k6FuEA3Ms
         pjdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=xtafg9Dir4y2uIChFSy3qfJKxJ0Jsy/rXD79IqfNsb4=;
        fh=eLdFG54pV5iGWoRMRU90DRcoxJixY9nT3iKsed29Fg4=;
        b=KW8DjuDvT+rNQlbknlVxQgMPrtBn9iek2jQeeU8ipFSycVAEtUAvPOucyCrxBKdicE
         8GRkP0Ds3fzDq8DGArG/vtbcEwfIoVoyGvyvOi2GquZiES3ppSmqr5EgLSHK4KpyIyGc
         aFo6O6plI0iHvllg69L6Y6EqyaB5yEIKClkTI0AbFJ43Q7e9YqV0XKFwoQ7qIyvsOJZm
         8JLzAZrtJ7xR1g3gslSpz+5XEos/VUxz/MtnI3hLbW9cxBw8olHi0NRTpO0X1wNQc5TG
         yzI74E3fdigLi6lXS42zKqyakXK2qjObz5uPlwImrt2dReAAc9HnuChWQ4fLwC1OCX/7
         0eRQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="IW/EeUne";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-21521739f4bsor55744795ad.7.2024.12.02.16.17.46
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 02 Dec 2024 16:17:46 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="IW/EeUne";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733185066; x=1733789866; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xtafg9Dir4y2uIChFSy3qfJKxJ0Jsy/rXD79IqfNsb4=;
        b=IW/EeUnewLAlp4s1kyX9C2Ze2p0AGTpOsgDsQ5HsnnWlMpX6tVT6/X5eFTz/235rzP
         nAQpJ37C/IliSk7rrnmtEgnUYfnjIKmoiaafnqENSdweYwoe1aYNSOtGkNCfd2zBclN0
         wl1n+eUnT7JrBHVZ7UkJiQQ6e454B/t2zuYtpxPwwVLyl40IP8u821l5zoQGZhSIACla
         G/KCiyYanxNZW+zyw5GDc7APbXaaB4Posjb7WUStsCUHa4c9cZyjufZX5bePzU4U5Von
         9XE1SBmuizzFs8+Je4xAotiTXMylcK2qOnlF1WOonR/gql9wrYSfMInjId8WOc8OZpYq
         JPgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733185066; x=1733789866;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xtafg9Dir4y2uIChFSy3qfJKxJ0Jsy/rXD79IqfNsb4=;
        b=RNM943pf/vMV1yWqggq7bTayu3rS3PENM2qOzPLShkhZ6h2pS1wvtCGtfPyuyTTOSP
         hA4CBqU9YMg8oKw4IsFIjlnswCtU5JlQ9lhbIqxSNzzmVNhCePXnog1udvw8IiWwgebK
         S5IzPy3FtYgXVi9Obu7P8Fmiy7tiqX78rShMP2Ng5Qb8/pCbxfG5YPEHZCp2hN21+8PB
         bpImsvmM1joe9mix4sPuVtQKwH6GAlCJB4gRRBNSmPwwP+/WZ3pm7O72ZCdaOxtHJDV9
         vjAmByoMXb7Fcx3AKw1ThhGD4gxJLcceDQBzD2d0VXsPmie3ECXb9l4BnpHDDpUsM2Pn
         QDUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDZKbSjZ7+ZNtWzIpIi1MI/vC4+cMxPtFufrerFwuQBY3XiJXBcSVHfAKuG5nfVVsubLo5sBjMNRweEQ==@linaro.org
X-Gm-Message-State: AOJu0YzdrHxVdNSyo+XgvkaG3h7gXnMBlK9f9DkCD++ikBcv6FiO6vEn
	QUKYbpowDVogq1ILAbKrVuNj7zJKqyi7JXuRnsdsGMk9s0YwNlm53bMcHmctz6E9Lw==
X-Gm-Gg: ASbGnct+k7sEOPqzd4kCLbGibH1vBBZInwJ+UlrAuDLKH4GTrgzBh/SnpkSKzk+bLlA
	cVEz1DqCwn/vHK94+7Im2XFyUAPPQ/Voll7IGb2MdcLky0I1N2Lcjf0SLKnTmrU4rd8NIQdtBFN
	GpPmV4cMOHpIuVblLZWkZzw13+uFftAx1TzcxidIT6AkbLOlWXBffi/1d3c04xftUzS1Bn8bWrH
	caRSGn8rMWI4UmFnBSGci7gVyHx/fHRHMpqCvdfeU8YRoYdoddJ/KEOpy95w5bb+vXDnvpUFzSu
	sPnEa+Xg
X-Google-Smtp-Source: AGHT+IFTO30fnQ0nbsGpYUOrwVB+dfbfFpyxs1U0OsNewsPtItxdEOHLWMfQpgP50canlFkBB/YdRw==
X-Received: by 2002:a17:902:e809:b0:215:758c:52ea with SMTP id d9443c01a7336-215bd8435dbmr6172185ad.9.1733185066062;
        Mon, 02 Dec 2024 16:17:46 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21527a4375asm80704875ad.138.2024.12.02.16.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 16:17:45 -0800 (PST)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: marcin.juszkiewicz@linaro.org,
	gustavo.romero@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	jean-philippe@linaro.org,
	mathieu.poirier@linaro.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3] tests/functional/aarch64: add tests for FEAT_RME
Date: Mon,  2 Dec 2024 16:17:41 -0800
Message-Id: <20241203001741.2068452-1-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: qBuW6caLZLsT

This boot an OP-TEE environment, and launch a nested guest VM inside it
using the Realms feature. We do it for virt and sbsa-ref platforms.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>

-----

v2:
- move test to its own file
- add sbsa test
- check output of `cca-workload-attestation report`

v3:
- build and run test with cca-v4 images
- factorize nested guest test between both tests
- remove accel tcg option as it is the default when running tests
Note: It's a long test and there is a work in progress to understand why
debug build is so slow (x12 vs optimized).

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 tests/functional/meson.build                 |   4 +
 tests/functional/test_aarch64_rme_sbsaref.py |  70 +++++++++++++
 tests/functional/test_aarch64_rme_virt.py    | 100 +++++++++++++++++++
 3 files changed, 174 insertions(+)
 create mode 100755 tests/functional/test_aarch64_rme_sbsaref.py
 create mode 100755 tests/functional/test_aarch64_rme_virt.py

diff --git a/tests/functional/meson.build b/tests/functional/meson.build
index 5c048cfac6d..b975a1560df 100644
--- a/tests/functional/meson.build
+++ b/tests/functional/meson.build
@@ -13,6 +13,8 @@ endif
 test_timeouts = {
   'aarch64_aspeed' : 600,
   'aarch64_raspi4' : 480,
+  'aarch64_rme_virt' : 720,
+  'aarch64_rme_sbsaref' : 720,
   'aarch64_sbsaref_alpine' : 720,
   'aarch64_sbsaref_freebsd' : 720,
   'aarch64_tuxrun' : 240,
@@ -52,6 +54,8 @@ tests_aarch64_system_thorough = [
   'aarch64_aspeed',
   'aarch64_raspi3',
   'aarch64_raspi4',
+  'aarch64_rme_virt',
+  'aarch64_rme_sbsaref',
   'aarch64_sbsaref',
   'aarch64_sbsaref_alpine',
   'aarch64_sbsaref_freebsd',
diff --git a/tests/functional/test_aarch64_rme_sbsaref.py b/tests/functional/test_aarch64_rme_sbsaref.py
new file mode 100755
index 00000000000..398562c166f
--- /dev/null
+++ b/tests/functional/test_aarch64_rme_sbsaref.py
@@ -0,0 +1,70 @@
+#!/usr/bin/env python3
+#
+# Functional test that boots a Realms environment on sbsa-ref machine and a
+# nested guest VM using it.
+#
+# Copyright (c) 2024 Linaro Ltd.
+#
+# Author: Pierrick Bouvier <pierrick.bouvier@linaro.org>
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+import time
+import os
+import logging
+
+from qemu_test import QemuSystemTest, Asset
+from qemu_test import exec_command, wait_for_console_pattern
+from qemu_test import exec_command_and_wait_for_pattern
+from qemu_test.utils import archive_extract
+from test_aarch64_rme_virt import test_realms_guest
+
+class Aarch64RMESbsaRefMachine(QemuSystemTest):
+
+    # Stack is built with OP-TEE build environment from those instructions:
+    # https://linaro.atlassian.net/wiki/spaces/QEMU/pages/29051027459/
+    # https://github.com/pbo-linaro/qemu-rme-stack
+    ASSET_RME_STACK_SBSA = Asset(
+        ('https://fileserver.linaro.org/s/KJyeBxL82mz2r7F/'
+         'download/rme-stack-op-tee-4.2.0-cca-v4-sbsa.tar.gz'),
+         'dd9ab28ec869bdf3b5376116cb3689103b43433fd5c4bca0f4a8d8b3c104999e')
+
+    # This tests the FEAT_RME cpu implementation, by booting a VM supporting it,
+    # and launching a nested VM using it.
+    def test_aarch64_rme_sbsaref(self):
+        stack_path_tar_gz = self.ASSET_RME_STACK_SBSA.fetch()
+        archive_extract(stack_path_tar_gz, self.workdir)
+
+        self.set_machine('sbsa-ref')
+        self.vm.set_console()
+        self.require_accelerator('tcg')
+
+        rme_stack = os.path.join(self.workdir,
+                                 'rme-stack-op-tee-4.2.0-cca-v4-sbsa')
+        pflash0 = os.path.join(rme_stack, 'images', 'SBSA_FLASH0.fd')
+        pflash1 = os.path.join(rme_stack, 'images', 'SBSA_FLASH1.fd')
+        virtual = os.path.join(rme_stack, 'images', 'disks', 'virtual')
+        drive = os.path.join(rme_stack, 'out-br', 'images', 'rootfs.ext4')
+
+        self.vm.add_args('-cpu', 'max,x-rme=on')
+        self.vm.add_args('-m', '2G')
+        self.vm.add_args('-M', 'sbsa-ref')
+        self.vm.add_args('-drive', f'file={pflash0},format=raw,if=pflash')
+        self.vm.add_args('-drive', f'file={pflash1},format=raw,if=pflash')
+        self.vm.add_args('-drive', f'file=fat:rw:{virtual},format=raw')
+        self.vm.add_args('-drive', f'format=raw,if=none,file={drive},id=hd0')
+        self.vm.add_args('-device', 'virtio-blk-pci,drive=hd0')
+        self.vm.add_args('-device', 'virtio-9p-pci,fsdev=shr0,mount_tag=shr0')
+        self.vm.add_args('-fsdev', f'local,security_model=none,path={rme_stack},id=shr0')
+        self.vm.add_args('-device', 'virtio-net-pci,netdev=net0')
+        self.vm.add_args('-netdev', 'user,id=net0')
+
+        self.vm.launch()
+        # Wait for host VM boot to complete.
+        wait_for_console_pattern(self, 'Welcome to Buildroot')
+        exec_command_and_wait_for_pattern(self, 'root', '#')
+
+        test_realms_guest(self)
+
+if __name__ == '__main__':
+    QemuSystemTest.main()
diff --git a/tests/functional/test_aarch64_rme_virt.py b/tests/functional/test_aarch64_rme_virt.py
new file mode 100755
index 00000000000..be240c691c2
--- /dev/null
+++ b/tests/functional/test_aarch64_rme_virt.py
@@ -0,0 +1,100 @@
+#!/usr/bin/env python3
+#
+# Functional test that boots a Realms environment on virt machine and a nested
+# guest VM using it.
+#
+# Copyright (c) 2024 Linaro Ltd.
+#
+# Author: Pierrick Bouvier <pierrick.bouvier@linaro.org>
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+import time
+import os
+import logging
+
+from qemu_test import QemuSystemTest, Asset
+from qemu_test import exec_command, wait_for_console_pattern
+from qemu_test import exec_command_and_wait_for_pattern
+from qemu_test.utils import archive_extract
+
+def test_realms_guest(test_rme_instance):
+
+    # Boot the (nested) guest VM
+    exec_command(test_rme_instance,
+                 'qemu-system-aarch64 -M virt,gic-version=3 '
+                 '-cpu host -enable-kvm -m 512M '
+                 '-M confidential-guest-support=rme0 '
+                 '-object rme-guest,id=rme0 '
+                 '-device virtio-net-pci,netdev=net0,romfile= '
+                 '-netdev user,id=net0 '
+                 '-kernel /mnt/out/bin/Image '
+                 '-initrd /mnt/out-br/images/rootfs.cpio '
+                 '-serial stdio')
+    # Detect Realm activation during (nested) guest boot.
+    wait_for_console_pattern(test_rme_instance,
+                             'SMC_RMI_REALM_ACTIVATE')
+    # Wait for (nested) guest boot to complete.
+    wait_for_console_pattern(test_rme_instance,
+                             'Welcome to Buildroot')
+    exec_command_and_wait_for_pattern(test_rme_instance, 'root', '#')
+    # query (nested) guest cca report
+    exec_command(test_rme_instance, 'cca-workload-attestation report')
+    wait_for_console_pattern(test_rme_instance,
+                             '"cca-platform-hash-algo-id": "sha-256"')
+    wait_for_console_pattern(test_rme_instance,
+                             '"cca-realm-hash-algo-id": "sha-512"')
+    wait_for_console_pattern(test_rme_instance,
+                             '"cca-realm-public-key-hash-algo-id": "sha-256"')
+
+class Aarch64RMEVirtMachine(QemuSystemTest):
+
+    # Stack is built with OP-TEE build environment from those instructions:
+    # https://linaro.atlassian.net/wiki/spaces/QEMU/pages/29051027459/
+    # https://github.com/pbo-linaro/qemu-rme-stack
+    ASSET_RME_STACK_VIRT = Asset(
+        ('https://fileserver.linaro.org/s/iaRsNDJp2CXHMSJ/'
+         'download/rme-stack-op-tee-4.2.0-cca-v4-qemu_v8.tar.gz'),
+         '1851adc232b094384d8b879b9a2cfff07ef3d6205032b85e9b3a4a9ae6b0b7ad')
+
+    # This tests the FEAT_RME cpu implementation, by booting a VM supporting it,
+    # and launching a nested VM using it.
+    def test_aarch64_rme_virt(self):
+        stack_path_tar_gz = self.ASSET_RME_STACK_VIRT.fetch()
+        archive_extract(stack_path_tar_gz, self.workdir)
+
+        self.set_machine('virt')
+        self.vm.set_console()
+        self.require_accelerator('tcg')
+
+        rme_stack = os.path.join(self.workdir,
+                                 'rme-stack-op-tee-4.2.0-cca-v4-qemu_v8')
+        kernel = os.path.join(rme_stack, 'out', 'bin', 'Image')
+        bios = os.path.join(rme_stack, 'out', 'bin', 'flash.bin')
+        drive = os.path.join(rme_stack, 'out-br', 'images', 'rootfs.ext4')
+
+        self.vm.add_args('-cpu', 'max,x-rme=on')
+        self.vm.add_args('-m', '2G')
+        self.vm.add_args('-M', 'virt,acpi=off,'
+                         'virtualization=on,'
+                         'secure=on,'
+                         'gic-version=3')
+        self.vm.add_args('-bios', bios)
+        self.vm.add_args('-kernel', kernel)
+        self.vm.add_args('-drive', f'format=raw,if=none,file={drive},id=hd0')
+        self.vm.add_args('-device', 'virtio-blk-pci,drive=hd0')
+        self.vm.add_args('-device', 'virtio-9p-device,fsdev=shr0,mount_tag=shr0')
+        self.vm.add_args('-fsdev', f'local,security_model=none,path={rme_stack},id=shr0')
+        self.vm.add_args('-device', 'virtio-net-pci,netdev=net0')
+        self.vm.add_args('-netdev', 'user,id=net0')
+        self.vm.add_args('-append', 'root=/dev/vda')
+
+        self.vm.launch()
+        # Wait for host VM boot to complete.
+        wait_for_console_pattern(self, 'Welcome to Buildroot')
+        exec_command_and_wait_for_pattern(self, 'root', '#')
+
+        test_realms_guest(self)
+
+if __name__ == '__main__':
+    QemuSystemTest.main()
-- 
2.39.5

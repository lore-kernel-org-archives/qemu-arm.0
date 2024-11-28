Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp205392njk;
        Thu, 28 Nov 2024 13:37:40 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWIaF4jVRINBGdWObGebMNuoCWfkJ021aOoXRbcSfhsPL0eJ3Pzas12tGYo2K5CTuLPAHL50RvqQt5ZXA==@linaro.org
X-Received: by 2002:a17:903:98f:b0:215:401b:9535 with SMTP id d9443c01a7336-215401b96b9mr3763975ad.47.1732829860310;
        Thu, 28 Nov 2024 13:37:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732829860; cv=none;
        d=google.com; s=arc-20240605;
        b=SK6NZ6qMXy8p7ziYYVJ0vwspkEhfNgdyfzm9CzJ0HWcy0Hx7ZRRCZIPMib+YJnhqb3
         9z0ewR+PATExzxBgHWih0VqEaDjDyXuNIoUSwqEbqf/qAiPbi/bCeMVAYQQgBEbfPhKD
         DY6oxTNRN44eVbjWxhExZ8CQxdsS9FmYEMcA7lAiZKS0elNYWQ6/8b7y8POFfwueFTIW
         uDAhXe+l8L23DdcGPlC7NUJd3FuxVtwHt8MNRDenlj6aQ/2w+HzMOqWhPHoaJweuijbo
         2gCBp2YkHK/dkiQ3A31a9j2BJTofyjWvbexTjzNpr8s5CHcw9wj9CL1TmuA+nb1eHuqV
         D0Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=AIljxQ5lKy1BxzhydrV476Rj0l67EivfvuNeq97pdhg=;
        fh=6Z4EcxeCnrp8BqsfoeVbtn5XKubh5xtig+LWVc6GwD8=;
        b=S7iVn7FJY4tiDwD2DTX2GX49g59kbAVBqRoH6kpId7Hal23pFPyrH0H6sV889eabVX
         rHktkKKCCZ3heoOzZQyYpCPbDV/k3MysQTu7m3CwI0fWVFt3o3UcBJxXw5ByJW1ulSuj
         vNZOTnupP6bXpMS/Wk28gI1uxma7SYlWGHQ6hC8PMj/5VAQnX9GQXTlkF0CHwrLVKcns
         EN54KlA0D3bbz2HOcVTrHaAQ8yfHYWbo5ZPimhjxgrNOwMh4GQ0yVjlYEAfC88PaoTpB
         KjJk9YnA1JbwOInDDHJQa5RlgO4XMO8GO29/jeS2l3mk1zM96j4FWzl5yr8TR5KjJ+7a
         iukQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gb7gytmb;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-21521931c0dsor16278115ad.4.2024.11.28.13.37.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 28 Nov 2024 13:37:40 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gb7gytmb;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732829860; x=1733434660; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AIljxQ5lKy1BxzhydrV476Rj0l67EivfvuNeq97pdhg=;
        b=gb7gytmbO9wHFAF4DyV8NnaxjhrHP2DDLVqRx2OK48+xNgCP2gQtuo/mZ+0QhfnUi2
         C4881gjw8pEt4QnQOAv8I2K8YavNNCYWD38Q5PYo6aJ7RXsp4q0lX5DJSQALlDiOOX5i
         s2xzkoZciMZQBGMN4GEcSIEpUa0XyMgpkNud58rmkjPreac3Tg094cITmpt3DmJ9vgvU
         jAcRtiqDWmfIAetuB8GSupCFrGFh4StMJDf2AuW5w1R0Z/6oR2zu63y4MlCEU5cd/SnD
         SoJvNXsnf1ZipJuFU0W5WbXNsSF2RmYskAXMBf06TzGXypyHvjUDHrW4akxhbTFczadB
         KHKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732829860; x=1733434660;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AIljxQ5lKy1BxzhydrV476Rj0l67EivfvuNeq97pdhg=;
        b=DIT1BBZy9Eb3Vq2qhlYuu1hlXJkSsAAZ/bIMdcw6DM+H3qyXAmPTcuTAUaItIngss0
         a8YW6X8kdgSsyXiMlwiDzBCDbBm47kyKfuD7ws9tQ8/E0Pz87VtAO87haE6d7S08pjNQ
         HLFnaW3xNi96BeHRJTGWkTuL3R+0GZkQ04y1WwBCl8n1oUpOhmIdJI+oYtRRRlTwA33/
         fcCODa5hpntirBTRZd7H+3drWQ5mxa3nt3G0bpESvNlkA1GMxOaUk2sOC00Q5J0y2Pd2
         fYXX00cQGtE0KwFKpBseW+YZJ0hyq8aNsKlvGA3RtXrvnq6pgnrt3JCScPU85sAtpe30
         Y9Vw==
X-Forwarded-Encrypted: i=1; AJvYcCUYPojb/tbxQiVa/gfmKacbpjyrtvKiYmYzyarKU4vONkUhIktiLoHzbtdYsH8CBLAgI5YFYxlxnZWQYA==@linaro.org
X-Gm-Message-State: AOJu0YwvITvVNAViDJzuO/rtuCTc2RHmCY2gxZA5SXgIFqjAiC5DHgfZ
	IXyxy5VIf3Ug60/WHdx/Of3jNV9ZCRBJsI3LiqNX8c5kJMjylwo9FvYyeBZQRFJWkw==
X-Gm-Gg: ASbGncvYge57CekovYHkzgTsbvN/Si1zRvz1JmACGyd2L/dADRK4sMTXIeFaWRMgDpV
	hvPWPBvj4MPMXcC8RtXluKiq9q/VxkFPo5Hh0j8G9AA32U2ML9j1AYXupnGHY9bTw9K4CJ4M4GL
	profXg6sHzCkIjsSkQMIMjAWXH/zgIfTUwff+Cf1mWydAp/Efz4AjmXOu2os5+kz48s0uy/1DVJ
	m6SHTKg9kaaTEi7RU1UxnUTET33OPbDNTOi53XDmNonoXXnDLLq0b16UYvJmlnt33YrfJrq87QD
	iHJj5JxVXnIZBg==
X-Google-Smtp-Source: AGHT+IEfHiE7BkLVEuxz6qacW2t5x+JBoCKDQLlKaYT/42zCYPDR2kYMLDavin8029nHD7xPKQwz2A==
X-Received: by 2002:a17:902:d50e:b0:212:20c2:5fcd with SMTP id d9443c01a7336-21501385212mr99573495ad.26.1732829859763;
        Thu, 28 Nov 2024 13:37:39 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.. (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2152198a386sm17812675ad.209.2024.11.28.13.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 13:37:39 -0800 (PST)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Troy Lee <leetroy@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Peter Maydell <peter.maydell@linaro.org>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	alex.bennee@linaro.org,
	Jamin Lin <jamin_lin@aspeedtech.com>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Steven Lee <steven_lee@aspeedtech.com>,
	Niek Linnenbank <nieklinnenbank@gmail.com>,
	Joel Stanley <joel@jms.id.au>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2] tests/functional/aarch64: add tests for FEAT_RME
Date: Thu, 28 Nov 2024 13:37:29 -0800
Message-Id: <20241128213729.1021961-1-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: a9FspOv6gKO6

This boot an OP-TEE environment, and launch a nested guest VM inside it
using the Realms feature. We do it for virt and sbsa-ref platforms.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>

-----

v2:
- move test to its own file
- add sbsa test
- check output of `cca-workload-attestation report`

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 tests/functional/meson.build                 |  4 +
 tests/functional/test_aarch64_rme_sbsaref.py | 96 +++++++++++++++++++
 tests/functional/test_aarch64_rme_virt.py    | 98 ++++++++++++++++++++
 3 files changed, 198 insertions(+)
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
index 00000000000..af3f9fb2d64
--- /dev/null
+++ b/tests/functional/test_aarch64_rme_sbsaref.py
@@ -0,0 +1,96 @@
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
+
+
+class Aarch64RMESbsaRefMachine(QemuSystemTest):
+    def wait_for_console_pattern(self, success_message, vm=None):
+        wait_for_console_pattern(self, success_message,
+                                 failure_message='Kernel panic - not syncing',
+                                 vm=vm)
+
+    # Stack is built with OP-TEE build environment from those instructions:
+    # https://linaro.atlassian.net/wiki/spaces/QEMU/pages/29051027459/
+    # https://github.com/pbo-linaro/qemu-rme-stack
+    ASSET_RME_STACK_SBSA = Asset(
+        ('https://fileserver.linaro.org/s/pBCeJktME2T5ikj/'
+         'download/rme-stack-op-tee-4.2.0-cca-v3-sbsa.tar.gz'),
+         '67542c80e5cfa84494f757bbee80b3535946c74666b8b82681f8eceb0e91d4ef')
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
+                                 'rme-stack-op-tee-4.2.0-cca-v3-sbsa')
+        pflash0 = os.path.join(rme_stack, 'images', 'SBSA_FLASH0.fd')
+        pflash1 = os.path.join(rme_stack, 'images', 'SBSA_FLASH1.fd')
+        virtual = os.path.join(rme_stack, 'images', 'disks', 'virtual')
+        drive = os.path.join(rme_stack, 'out-br', 'images', 'rootfs.ext4')
+
+        self.vm.add_args('-accel', 'tcg')
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
+        self.wait_for_console_pattern('Welcome to Buildroot')
+        exec_command_and_wait_for_pattern(self, 'root', '#')
+
+        # We now boot the (nested) guest VM
+        exec_command(self,
+                     'qemu-system-aarch64 -M virt,gic-version=3 '
+                     '-cpu host -enable-kvm -m 512M '
+                     '-M confidential-guest-support=rme0 '
+                     '-object rme-guest,id=rme0,measurement-algo=sha256 '
+                     '-device virtio-net-pci,netdev=net0,romfile= '
+                     '-netdev user,id=net0 '
+                     '-kernel /mnt/out/bin/Image '
+                     '-initrd /mnt/out-br/images/rootfs.cpio '
+                     '-serial stdio')
+        # Detect Realm activation during (nested) guest boot.
+        self.wait_for_console_pattern('SMC_RMI_REALM_ACTIVATE')
+        # Wait for (nested) guest boot to complete.
+        self.wait_for_console_pattern('Welcome to Buildroot')
+        exec_command_and_wait_for_pattern(self, 'root', '#')
+
+        # query (nested) guest cca report
+        exec_command(self, 'cca-workload-attestation report')
+        self.wait_for_console_pattern('"cca-platform-hash-algo-id": "sha-256"')
+        self.wait_for_console_pattern('"cca-realm-hash-algo-id": "sha-256"')
+        self.wait_for_console_pattern('"cca-realm-public-key-hash-algo-id": "sha-256"')
+
+if __name__ == '__main__':
+    QemuSystemTest.main()
diff --git a/tests/functional/test_aarch64_rme_virt.py b/tests/functional/test_aarch64_rme_virt.py
new file mode 100755
index 00000000000..cd895da46b6
--- /dev/null
+++ b/tests/functional/test_aarch64_rme_virt.py
@@ -0,0 +1,98 @@
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
+
+class Aarch64RMEVirtMachine(QemuSystemTest):
+    def wait_for_console_pattern(self, success_message, vm=None):
+        wait_for_console_pattern(self, success_message,
+                                 failure_message='Kernel panic - not syncing',
+                                 vm=vm)
+
+    # Stack is built with OP-TEE build environment from those instructions:
+    # https://linaro.atlassian.net/wiki/spaces/QEMU/pages/29051027459/
+    # https://github.com/pbo-linaro/qemu-rme-stack
+    ASSET_RME_STACK_VIRT = Asset(
+        ('https://fileserver.linaro.org/s/7dsXdtbDfBZbCTC/'
+         'download/rme-stack-op-tee-4.2.0-cca-v3-qemu_v8.tar.gz'),
+         '0b49f2652a7201d100365b8ccc6c317f1f8f2f4de6feed084080f52fe1b5fadc')
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
+                                 'rme-stack-op-tee-4.2.0-cca-v3-qemu_v8')
+        kernel = os.path.join(rme_stack, 'out', 'bin', 'Image')
+        bios = os.path.join(rme_stack, 'out', 'bin', 'flash.bin')
+        drive = os.path.join(rme_stack, 'out-br', 'images', 'rootfs.ext4')
+
+        self.vm.add_args('-accel', 'tcg')
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
+        self.wait_for_console_pattern('Welcome to Buildroot')
+        exec_command_and_wait_for_pattern(self, 'root', '#')
+
+        # We now boot the (nested) guest VM
+        exec_command(self,
+                     'qemu-system-aarch64 -M virt,gic-version=3 '
+                     '-cpu host -enable-kvm -m 512M '
+                     '-M confidential-guest-support=rme0 '
+                     '-object rme-guest,id=rme0,measurement-algo=sha512 '
+                     '-device virtio-net-pci,netdev=net0,romfile= '
+                     '-netdev user,id=net0 '
+                     '-kernel /mnt/out/bin/Image '
+                     '-initrd /mnt/out-br/images/rootfs.cpio '
+                     '-serial stdio')
+        # Detect Realm activation during (nested) guest boot.
+        self.wait_for_console_pattern('SMC_RMI_REALM_ACTIVATE')
+        # Wait for (nested) guest boot to complete.
+        self.wait_for_console_pattern('Welcome to Buildroot')
+        exec_command_and_wait_for_pattern(self, 'root', '#')
+
+        # query (nested) guest cca report
+        exec_command(self, 'cca-workload-attestation report')
+        self.wait_for_console_pattern('"cca-platform-hash-algo-id": "sha-256"')
+        self.wait_for_console_pattern('"cca-realm-hash-algo-id": "sha-512"')
+        self.wait_for_console_pattern('"cca-realm-public-key-hash-algo-id": "sha-256"')
+
+if __name__ == '__main__':
+    QemuSystemTest.main()
-- 
2.39.5

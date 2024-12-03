Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp4030397njk;
        Tue, 3 Dec 2024 13:36:42 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUccH4yrW6GoqHleAIl0Oj/oylD7r02I9wj0vL4M6cAexQNa04edLy/3Bp4Hnos6CUUk3v9SBZYh46IJw==@linaro.org
X-Received: by 2002:a17:90b:4d89:b0:2ee:7862:1b10 with SMTP id 98e67ed59e1d1-2ef011fcbf6mr5526484a91.11.1733261802521;
        Tue, 03 Dec 2024 13:36:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733261802; cv=none;
        d=google.com; s=arc-20240605;
        b=MRmQQptYo2rRFM7Xf3Moc/wOsq8ZbO8tYHruD3MbXV0xUKlC7hhCTBeXHg0WMoeywS
         A/sUh3mRUqYoXQVUb3E3JZpQeIqWgGOIFiQLgmK7ifTZ9Xf6ObwHh4ly/r0XwU1aP0rb
         wvnJzPTCFRbH1UxB8jc8rAe6qgCUXHY0mjMtCTfBZp0JotRRjc8PpCH2WOyXIlqmEOC0
         Qv6mrRH7fWnq3gdjXPqofmeS0DGbmVneWKo6ke19vpmQ1JmpeCE/Ml/adpjy8gUz/JZK
         fB6QMUB131gJisfUWb6zqTp5k208zVjCMy1y5lBQ0p1pu34vMboKu0vyy/LckhqRAhnG
         44XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=hlA900R6OzzNmZj8YUpDRSnAfjrEcLzViNbwyZQKhOo=;
        fh=mWWuWHH+S0IowPLBaRemKjM8ROaFIYoGdJYoU6odjIY=;
        b=C8iJ7r/0/JYAeXgBriISrdwgo8Po1zE96h7MVwFYXSGoNGs2iuPiNjCZwLW7r9A28t
         pnRr21O2JQvK0Imw8avofiIK2pgoX0Pi1rE5sAT1eX02cDia/n2lbZfW9fqruq/D47re
         ecrfBhpBVmSYc0bP11DbRjKtaYynCPF8jKkfGLx9TT8CWa++a9Bf4K5ZeFtBkVHk0RKt
         XB5HoXYeqcoqvYs3Y1XEiF2OWPdb1WFG+JNhNxNtECKx9Rdzeix5iZD5LM5d/cmatTR8
         CHIQ2vQib9jhhBVz/w8kKlS5o44+fdPP/664A6ARSjWTk1FfpweOBYHVZ/RZVM0HEZjq
         I0dQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=guLoTJae;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-2eedf8b08d7sor3782748a91.0.2024.12.03.13.36.42
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 03 Dec 2024 13:36:42 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=guLoTJae;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733261802; x=1733866602; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hlA900R6OzzNmZj8YUpDRSnAfjrEcLzViNbwyZQKhOo=;
        b=guLoTJae/pZrNDUC3qjNCPFNc0gMI29skj3EMlUE67pB6C7qVZ1R1p8Unlh7fuTtjJ
         BfwbLoCBxrk/rVpvrTOcbgdhcPZ6wNocbLEIUvLjPPUsxUovumRRNhRYaYuJw/xr9pQm
         fsStUlLarLs0sdaMFTKVW9L4W1WpCsKvYayicCYknA4MjviznUyvPvGG/uEwH2J5aj+b
         JHYe/JZOxBuI2lRV2eNMT5a05JQcnUPFBaZHW4OQB6bYkX44BqmsuPOh0m4AuQFaLxL+
         6YoF/ynJslZ0Izz7ruQxfjSMyv89pWKX/Yv7DcYjL3GcN7kl7NE1w2tcEEUGhamTWCVR
         4ZgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733261802; x=1733866602;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hlA900R6OzzNmZj8YUpDRSnAfjrEcLzViNbwyZQKhOo=;
        b=YVzWM7k32+6bCOH/MORUkIQ9G/S0EBzd2LdkeT8nxxVrRfQYHn3KuwPW21z0BCcg1O
         ecvQNZcwOno4b9fjsAR55yhqG6HM9CvPhTxU01TJYcWluAc2xsOLKYzsaEskjx3nuDMY
         1gUrESVVaMqY6xQwUDasXfg/wG8p8HN5LndmvYl9NhjPRI7ROeLJFa1AaUfIRR01NkBv
         XydRN2GeHZ6LuDH9HzajtibtVf6FDBAxl3SG9T9MotJDPMezZOfEH7gPphH9si1s7zyJ
         MHsFMMrr+V10OQBt9HXHn2tGDbOw+upkFGKr1aW0RVxafjxkNQyVmc0jqZkakc0kaKlh
         pN9A==
X-Forwarded-Encrypted: i=1; AJvYcCUfvDlufceimiHSCc5eKjeaY7dvwIBucDcDj4YQ5HHeOE2JQ3RaK92qHqTKn2DvJgQBoB3IZ8G1KEpysA==@linaro.org
X-Gm-Message-State: AOJu0Yymtxnk4RiaoT+yI7Tmd+yAqj6CXBqsr8WO5M/YSPWTJpsa2Kp4
	Y5GLY5N7sSRXnCVLZKilnNrjzmyTO/TsezZazUA6i8bCyoyrv4cm6ZiueqMz23xruw==
X-Gm-Gg: ASbGncs3aSbqsfDJ6NBXtPtjUW+zci6/yCGURDVufqm3vHZ9JxjmdzE27i+kEl12BCG
	4WlZjV1+bN1p2CHAM6o4i4f87oxLiDNMQIU6xBtuQohGipA73qmyinyHxNvbaa+Skk0RkVccpoe
	SfLzCVJ/U0Cc141BbNKNcDFGz9IEf1S2g3A2e93VqvcImb2R9IRWY9n1ccZjsOVFFt6N8YXfQ5k
	N1E1byoco2PBmhGuU/L7EhzgrW7eO3LhVIGRyQEY4YHCId4h5rNf64XtJkoLoLh4mXC0Utqk0cq
	bo7otBSG
X-Google-Smtp-Source: AGHT+IGAGQoSX+awVWsSBmj9iXfYWeGkyQVLwqAeV5Qj0gulWHw1ipq1A7ODIDpjHQPjTQXbcdYi0g==
X-Received: by 2002:a17:90a:d407:b0:2ee:5958:828 with SMTP id 98e67ed59e1d1-2ef011fba90mr6216877a91.9.1733261801955;
        Tue, 03 Dec 2024 13:36:41 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7258d80bf8dsm20580b3a.74.2024.12.03.13.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 13:36:41 -0800 (PST)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	mathieu.poirier@linaro.org,
	jean-philippe@linaro.org,
	marcin.juszkiewicz@linaro.org,
	alex.bennee@linaro.org,
	gustavo.romero@linaro.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4] tests/functional/aarch64: add tests for FEAT_RME
Date: Tue,  3 Dec 2024 13:36:29 -0800
Message-Id: <20241203213629.2482806-1-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: xQVn5SLeih1n

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

v4:
- use pauth-impdef=on to speed up build time execution (x2.5 faster)
- increase timeout value

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 tests/functional/meson.build                 |   4 +
 tests/functional/test_aarch64_rme_sbsaref.py |  70 +++++++++++++
 tests/functional/test_aarch64_rme_virt.py    | 100 +++++++++++++++++++
 3 files changed, 174 insertions(+)
 create mode 100755 tests/functional/test_aarch64_rme_sbsaref.py
 create mode 100755 tests/functional/test_aarch64_rme_virt.py

diff --git a/tests/functional/meson.build b/tests/functional/meson.build
index 5c048cfac6d..60ae7bbd3d6 100644
--- a/tests/functional/meson.build
+++ b/tests/functional/meson.build
@@ -13,6 +13,8 @@ endif
 test_timeouts = {
   'aarch64_aspeed' : 600,
   'aarch64_raspi4' : 480,
+  'aarch64_rme_virt' : 1200,
+  'aarch64_rme_sbsaref' : 1200,
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
index 00000000000..c136b5ce178
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
+        self.vm.add_args('-cpu', 'max,x-rme=on,pauth-impdef=on')
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
index 00000000000..39e4e4adb5f
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
+        self.vm.add_args('-cpu', 'max,x-rme=on,pauth-impdef=on')
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

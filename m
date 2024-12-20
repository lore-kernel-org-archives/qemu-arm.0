Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp2507292njk;
        Fri, 20 Dec 2024 08:52:25 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW2dzaMGDdvW65lktTKYgiJbugfJjRevg8tiFA1wA57Fk+NQePgZ8acf1SdsotEfjZXqmxwmqZnK+qhcg==@linaro.org
X-Received: by 2002:a05:6a00:10d0:b0:725:d64c:f122 with SMTP id d2e1a72fcca58-72aa9a1041amr13920348b3a.2.1734713545589;
        Fri, 20 Dec 2024 08:52:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734713545; cv=none;
        d=google.com; s=arc-20240605;
        b=i3xmizOpovXccs3CItObGu3gvxBVxiGBLAiK5XHgUe/pXyu2kntDIJVSu06C/xlOB0
         fl9H6pLZmrhojOSPMaKMF+fOz1Atd3VEWurPXkwm3L+Q48OtrILBpqvtr3AscvaqvFOI
         kUIPtugd5GTfG0VSjtovxDiG3aRlEm2R2HOIbmpzSoLZlFo4pb0Am2ZrObn3jXWInzgO
         jsWmeNYYrJWKPxPqJFe647Kn6id0+v+Ed7XxuC2HJbgPWZsPs0UV2gv0wcoViBL31JeV
         pnTOV+reUgl07rKE+KBTCdrkND7us5yZTd6ebOldFhuhez3BKSTMvUzBBrdYwG4u0LZR
         jSDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=HjDQgo2gJ7bDuxMIuiv/1t8TpYKv7AQnEK2b02JJCZs=;
        fh=GUqmI6tu1ade2FBBs1Z/RV5F5759L40ZUbYDH6tzp5g=;
        b=BpIbjoEcuyinrtEhGN77r+eESvpinUqgsolvTY6/VrAtb3kH3xj4sZ2zwXCUNXeRKT
         2N0OSNhmjQZFNeE3akxCrv5Vi97V36UsOnLLAyO8vXYkyDEvR3RI+BhLvoQ3Y6STacnW
         g/3RD2u1bUarys01LFmBIvqBrAXS/RyLl3h+U7TTjL9+vUIWCxFNsXzkuVCf7QSlRcRU
         LxUvZrPNrHMPj2GOyOV9tNbIoXESSsaAgu/K4LsCdDCLmmea1hgzlj6Xdh/FmysqhzK9
         uu/YLx0iDcwyrnRkg0qp/Ymx6gUahasNhXT9KT8V1ZtYuZ6cq9TAdk+a9PMevV2kv+QX
         VP8A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FD40NWDm;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-72aad99cb49sor2328226b3a.6.2024.12.20.08.52.25
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 20 Dec 2024 08:52:25 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FD40NWDm;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734713545; x=1735318345; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HjDQgo2gJ7bDuxMIuiv/1t8TpYKv7AQnEK2b02JJCZs=;
        b=FD40NWDmw2Qvzi16hoo7BOXfFQfNDORoA9RTIyTAScl4hNIUsuDNWmOmXczENxGFM1
         5aSW55IH77KZzdgR4hlscAIJOu8VEPssf4+5qJucu3ZGJnZgv76QXkJ1BoWCFttUqKKc
         ze0ScicMZTIeJlyAbsSvtWpWsehCj3Kc2w4sxS6SpPtfk0xVGE66g9dbpBcjNdG3QODJ
         NKFqyF7Ux6tQyshEzets8TcOfEXKtJNSRfxf5gBChszUWWtBiZ7d7yTSvvGNTiUtdK/y
         +rwWIj9cewB/Mk2HmfoxNaejdFXL7lkXLuHg+4hCwSPZaW5kE2C2RKt+HJJpwGXWUwfL
         bxKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734713545; x=1735318345;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HjDQgo2gJ7bDuxMIuiv/1t8TpYKv7AQnEK2b02JJCZs=;
        b=sVZ9tUGMlmpqYoOrc4RGbsI2lXccSEinQAg6Gzat1DTM43YRhTNlwb+4jzmWs7F4Og
         b3DfWVtk1zwQOV6ve159wttm1WajoacRWa9hfQf9hOcoVKshliFMRLVqFlTCeYgYI/ns
         f4//4N+ROzVW14c62Kaxr4w041tJ9OZlO5kyHYCWtv7uquF/8ddRYutdvSbMWcfMgMuo
         sjOYkISK+WFJOtSd8ZHeLKaydY6BdaY7tlflFHGGarhR/m9pBaNnZn/5G25wI9QBJU/S
         k/Qcg3h6g6NRDt6yXLU0JHV3KCoyi9iQDrJ1KeobCsJNYBi8nK158ijJFYhYvkxqwREY
         qJWQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8/sj7CnmcnApP0ik83r4+FeO2yzUgD+MravWYVDcmPZFKuvV23davDVTfx8JwgA0Ig7BRwjGc/LIXQg==@linaro.org
X-Gm-Message-State: AOJu0YzljUIqH8lAZ2FcVCMzp5AqQdkFbaiqhmtRr/Uu9wqv0HL9NX6j
	CjxN0thb/111bb8VqblwSdifCLn9evvN6ROojAblJkmOVP48HQ/bNaeArPF4UCtesQ==
X-Gm-Gg: ASbGnct1Di37KCLcvkkM2A2SE23WLpInqkTaDMKLjY38SLRb1387T0IbMf59fmWdg69
	pkdJe+/x048o0mRmTeAkRr38pgHOXccVy6l7fMkelZvCa1ZYbj46foiP8WYLPU8DjVcZ1pRs3c0
	r002lkZhkYVbWM0FlbXSzSvMMfYfT6TEJWdSTd0Ibdjlc5YPpfpad37n+M3bhduobfO/Acgn39C
	lmjXteCK4/EkC8DmZHBmWp+UHMH1R8P0jhp0TCRcmzV2rYFRYViLzGL
X-Google-Smtp-Source: AGHT+IHBEVlt1Z0J273q2vPOuDSHJOaEaS1MfhBL4iIXrqnPQUB6zx/R83PEjTE4LlieEZDWKo8hoQ==
X-Received: by 2002:a05:6a00:69ad:b0:725:f1e9:5334 with SMTP id d2e1a72fcca58-72aa9ade355mr10742482b3a.8.1734713544987;
        Fri, 20 Dec 2024 08:52:24 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad90c25csm3329722b3a.199.2024.12.20.08.52.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 08:52:24 -0800 (PST)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: gustavo.romero@linaro.org,
	jean-philippe@linaro.org,
	Peter Maydell <peter.maydell@linaro.org>,
	mathieu.poirier@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	marcin.juszkiewicz@linaro.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v6] tests/functional/aarch64: add tests for FEAT_RME
Date: Fri, 20 Dec 2024 08:52:12 -0800
Message-Id: <20241220165212.3653495-1-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: WDI6Y+m55H6q

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

v5:
- migrate test to new archive_extract helper

v6:
- archive_extract helper needs explicit format for .tar.gz archives

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 tests/functional/meson.build                 |  4 +
 tests/functional/test_aarch64_rme_sbsaref.py | 68 ++++++++++++++
 tests/functional/test_aarch64_rme_virt.py    | 98 ++++++++++++++++++++
 3 files changed, 170 insertions(+)
 create mode 100755 tests/functional/test_aarch64_rme_sbsaref.py
 create mode 100755 tests/functional/test_aarch64_rme_virt.py

diff --git a/tests/functional/meson.build b/tests/functional/meson.build
index ee417b0a1f7..8c789970d48 100644
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
@@ -60,6 +62,8 @@ tests_aarch64_system_thorough = [
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
index 00000000000..df424f62f4f
--- /dev/null
+++ b/tests/functional/test_aarch64_rme_sbsaref.py
@@ -0,0 +1,68 @@
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
+        self.set_machine('sbsa-ref')
+        self.vm.set_console()
+        self.require_accelerator('tcg')
+
+        stack_path_tar_gz = self.ASSET_RME_STACK_SBSA.fetch()
+        self.archive_extract(stack_path_tar_gz, format="tar")
+
+        rme_stack = self.scratch_file('rme-stack-op-tee-4.2.0-cca-v4-sbsa')
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
index 00000000000..42b9229b4cb
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
+        self.set_machine('virt')
+        self.vm.set_console()
+        self.require_accelerator('tcg')
+
+        stack_path_tar_gz = self.ASSET_RME_STACK_VIRT.fetch()
+        self.archive_extract(stack_path_tar_gz, format="tar")
+
+        rme_stack = self.scratch_file('rme-stack-op-tee-4.2.0-cca-v4-qemu_v8')
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

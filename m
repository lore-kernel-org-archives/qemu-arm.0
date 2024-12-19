Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp1901663njk;
        Thu, 19 Dec 2024 11:53:17 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU6HG35gaQPha6u/f7IlMokxjwhOxd4J1aqFtEYFXJgxXHU9e3DRDJ36089FvHPgBDcTG11ZAo0QOhvBw==@linaro.org
X-Received: by 2002:a17:902:d2c1:b0:215:7cd0:758d with SMTP id d9443c01a7336-218d725282fmr120862085ad.36.1734637997737;
        Thu, 19 Dec 2024 11:53:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734637997; cv=none;
        d=google.com; s=arc-20240605;
        b=OFRygS2M9P1+2PcVtiNnhQJWhg9GOjueYwYdIOiRmJsMMPNvKVi09rGOi8astXBaRy
         quQxlZrRyWfigdiWUdoQs9e8F91OKVfLsv7rJOtgIWZJ3zAX0fDjtL7vrkQBLr6drI6P
         un5XjVbruYonrH1wVKcMnH7qja3iBj2HEPuFSMRvX9q/P4+taNfAJjnUZzb6BsW2tEmD
         ksD9KyhNb5KkOYp/eVN9IWwj5WY7uMUWBMqdnBv6aX7JOF8wgSv8sh8rW3W2uxqc2n0o
         Sctex/KAacGIN8Jh4h8ZSpz4rkDMtnhiHP0tzYVyr7qQEyC3w255Ne64YwIen+TEKhPb
         CR7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=wvaV57g/otsXFa0xdKkFwiLNACda5imzuK59SCTyNUQ=;
        fh=P+uykG3euglnzp/z+zNghX+w14bsmltHqs04c3dCck0=;
        b=VnTMDbXr5HkI9EYe8coDbLnsCKljuQLXYkk1Z6CV6FWEnC/DnFh1UOWo5Tj+5iwRfT
         UM4lre50CFVH33/X0oCMQQEnTuf2OfL3CnpoC5tDt9DL1jMgvNMRRhnzgvGmtPWtKY+1
         upwIvDMJrzaVNbfG4M8G73BRqXiwi9a4MkY9nP6aSLWQgkw0JxLYIJSSMXVXtEDflPw0
         ceO4WwB5xcisF6FCUR3Mm57Sks3kWQgcSr/LaDVRTLCgW7dRCKVF7YyRc3WtgbLrQtTh
         V8i2+4PkS4StAi+VTSW2tyTfQsiE6qLsfufVn68+ZE/rIbrboy2zOZGy9lrlCi+j5+X8
         K4zQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ifIZB5Jk;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-219dc7e8884sor12282135ad.0.2024.12.19.11.53.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 19 Dec 2024 11:53:17 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ifIZB5Jk;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734637997; x=1735242797; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wvaV57g/otsXFa0xdKkFwiLNACda5imzuK59SCTyNUQ=;
        b=ifIZB5JkBX7wdltO+oY+JjydRxE3ZRLNeuIuDZqdhKmrbcWUohzFiBQf9A/TmMQy5w
         sCy3wWS9sFal6cYXRG4H+d88ajRxGaaZlhG/Qs20uGYstMsVC0SqLaE573NzXC7RReip
         WNSAY7OwH3rWReG58p1ceKvzm0CEsME8cmFk1XXk4QqxJmyFMqzJDyLbvE0a5Wx6/gNZ
         7gUHMCacD72FZuLwUieXLyIz83WWj8AQJ4SpMlg1h7Ji7ufbXRxMJlOSc0sdtIiJTApE
         D1ewCgTCHvUXB8Mlw9zzh4AJLeeke4FextIhtjfhZf/EV6jNsNQFMqFuqtu8SzvYp2Nv
         yXWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734637997; x=1735242797;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wvaV57g/otsXFa0xdKkFwiLNACda5imzuK59SCTyNUQ=;
        b=m+Gmf1HCjy5GIekEuu/0RBIUQNJRXqCGnOkvgsojME8RFeyuF4ll6KYPqXUuFIgRi8
         7POKPQaIeB8lzC0FGmGWFq8ve+Cg73xeR3xznvjj+YucCbBzuy5vsb6FxUUI0H4uy65a
         HxLe6BK6zf+NliBQHbqioA9evtpAXniqVd6rlZkKSxWGpmO5j7Byq2NQMAdWQg4SNObB
         kcHDOtNf9amnE8IHzYhv6D0zbE8aUdc4VF73+Ax+xXw+FXptPAYMHgD3V/1eYTSAebzk
         cOI2pX1PMvumMP0e9hl6Cq5BYIFpp6HriRp/0O6z4fGCvFgOwMgVWZfBpcq92fVVj85E
         UQrA==
X-Forwarded-Encrypted: i=1; AJvYcCXvkhD+ivunLOwM/T6BkwQCuuMSC0CRfFVuLojDm37+Fr6Do5WzWzbb4Te4b8DmQwQvtB/x7d6PoQDgRQ==@linaro.org
X-Gm-Message-State: AOJu0YwMjztK1TJaaRDkIy9xyATo26BxTgfbHdjzXdc44OfXFJbrTRe7
	Y6zpRjxeSM/8OFvtNfG4WR92vPBu69eVvacrQ+QEeftG2OIs3Y4RalxlooGj6FcRyw==
X-Gm-Gg: ASbGnctOFo4bHURlsC5EVWzFXwhAHHPKsX5Grad9Cop779qmwDqG2MLmcx3LvZssMhC
	s0fuIXy+iITqUpe8dEg2YbAlnpNjb0v5QLnShl+bfeEUqsyWEPmTFC3+9DbzuWmR22ICFqMCbhK
	LqIOUr54Tie3X9B/wM29qXrUiyMP+us2n5BHqgc9Fbs/AH9VeEqYlAAI/6vA6j5hKwZ976R5rjR
	h5h7SmbAA5NkDyMeeo+W8dApGCK8vC+jl86cfdKW2cEKtTtJ3DeJBXX
X-Google-Smtp-Source: AGHT+IGwgSno1orswArW8r97qJ7fl9AiYisN+n//fqdwD3Da6gExJgYKhqxn2xzXY3TjRoAqLRq+aA==
X-Received: by 2002:a17:902:f705:b0:216:2e5e:971d with SMTP id d9443c01a7336-218d726c177mr111722155ad.51.1734637997109;
        Thu, 19 Dec 2024 11:53:17 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc96294bsm16259245ad.36.2024.12.19.11.53.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 11:53:16 -0800 (PST)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: mathieu.poirier@linaro.org,
	gustavo.romero@linaro.org,
	marcin.juszkiewicz@linaro.org,
	Peter Maydell <peter.maydell@linaro.org>,
	alex.bennee@linaro.org,
	jean-philippe@linaro.org,
	qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v5] tests/functional/aarch64: add tests for FEAT_RME
Date: Thu, 19 Dec 2024 11:53:04 -0800
Message-Id: <20241219195304.3548246-1-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 9GwtCz+act7e

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
index 00000000000..eb184fe201c
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
+        self.archive_extract(stack_path_tar_gz)
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
index 00000000000..9e30cc9325c
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
+        self.archive_extract(stack_path_tar_gz)
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

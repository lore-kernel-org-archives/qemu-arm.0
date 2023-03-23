Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp6239352ejb;
        Thu, 23 Mar 2023 01:28:41 -0700 (PDT)
X-Google-Smtp-Source: AKy350a9mO1gR6+rLY2vf/uMNr5n1ZIl7dWDrV1UxEeyO2qovDMJrvJydfMxm40aYyrQo/R2BZ8+
X-Received: by 2002:a5d:4568:0:b0:2c7:e5f:e0e0 with SMTP id a8-20020a5d4568000000b002c70e5fe0e0mr1805383wrc.65.1679560121231;
        Thu, 23 Mar 2023 01:28:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1679560121; cv=none;
        d=google.com; s=arc-20160816;
        b=knoc6B4Y5BSfn0I5xQGfzq0zg8/DbTSb9FCurgqlo8YizWtNHjAt24smR73b4W9aKW
         3YrFp6RztNpvLg4APiPUTh8ob2dVYgK0op/LdU7mguRb0aX7XMf0K5fBLz/xVVQm6vah
         blHXWBlk/Cm12xwjRqEtwEPh+nCbYQ3wvbS1b0AbICDc4vPs4CObrNjl61YiUpf7AStQ
         0pCT+NIK3n9aHyKhYQLZXDHrX+wWEGVBegtWaNJkxaraDvRDaV13S7IfuXxqozM9ZRp6
         l+U10klpdq9WMpwvlQQiB0dIajOLzdoZf3T6JzXBBC4UoeWRNfB+yH2BLV8uenTSPK4c
         Be6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=GfM8XtHBgMHlaSZhPknm9jZEH28WCiQYpUPFLD5iSHc=;
        b=yNTtZra7QyNkUeuselmHFFDpwZQdXgcmQFmGGagH4/ZxogjTJC+U6+gwoYuplL43oa
         h8pL/qGkGfGn5f9pekNZRad88fZa/dCl1OdvAAdkmb6MzrvB/vIUJbiQfr+FheKrOxFD
         kCMg1PlWvx3Wz+TMdg/jlicrus4MaaM2ObfQb+a98SiFT7eQ39OPpCJR2kyJk/nCRmav
         T3OSQ+PLoBrCjvX2c834ZzeZ7JunKtkT93FcLTREuN2bX2R2O7ScrJm2Hf1KebxspA3U
         PwkgOEqJUE3v/YWZ25C2DmyVXwKp/1ChdXayxby/mReupNNijXHmAdnEwsIkyH6oodPp
         YMWw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=softfail (google.com: domain of transitioning marcin.juszkiewicz@linaro.org does not designate 213.251.184.221 as permitted sender) smtp.mailfrom=marcin.juszkiewicz@linaro.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <marcin.juszkiewicz@linaro.org>
Received: from muminek.juszkiewicz.com.pl (muminek.juszkiewicz.com.pl. [213.251.184.221])
        by mx.google.com with ESMTPS id p5-20020adfcc85000000b002d08ed95ab0si14684264wrj.205.2023.03.23.01.28.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 01:28:41 -0700 (PDT)
Received-SPF: softfail (google.com: domain of transitioning marcin.juszkiewicz@linaro.org does not designate 213.251.184.221 as permitted sender) client-ip=213.251.184.221;
Authentication-Results: mx.google.com;
       spf=softfail (google.com: domain of transitioning marcin.juszkiewicz@linaro.org does not designate 213.251.184.221 as permitted sender) smtp.mailfrom=marcin.juszkiewicz@linaro.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost (localhost [127.0.0.1])
	by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id 16A7B2606B0;
	Thu, 23 Mar 2023 09:28:40 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
	by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aKXTmzFDw0vd; Thu, 23 Mar 2023 09:28:37 +0100 (CET)
Received: from puchatek.lan (83.11.21.111.ipv4.supernova.orange.pl [83.11.21.111])
	by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 02E8426021A;
	Thu, 23 Mar 2023 09:28:36 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: Radoslaw Biernacki <rad@semihalf.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Leif Lindholm <quic_llindhol@quicinc.com>
Cc: qemu-arm@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-devel@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Shashi Mallela <shashi.mallela@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Subject: [PATCH v2] tests/avocado: Add set of boot tests on SBSA-ref
Date: Thu, 23 Mar 2023 09:28:14 +0100
Message-Id: <20230323082813.971535-1-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 8vTwUo10LK8A

From: Philippe Mathieu-Daudé <philmd@linaro.org>

This change adds set of boot tests on SBSA-ref machine:

1. boot firmware up to the EDK2 banner
2. boot Alpine Linux

Prebuilt flash volumes are included, built using upstream documentation.

To unify tests for AArch64/virt and AArch64/sbsa-ref we boot
the same Alpine Linux image on both.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 MAINTAINERS                              |   1 +
 tests/avocado/machine_aarch64_sbsaref.py | 138 +++++++++++++++++++++++
 2 files changed, 139 insertions(+)
 create mode 100644 tests/avocado/machine_aarch64_sbsaref.py

diff --git a/MAINTAINERS b/MAINTAINERS
index 9b56ccdd92..4797c30ac8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -928,6 +928,7 @@ L: qemu-arm@nongnu.org
 S: Maintained
 F: hw/arm/sbsa-ref.c
 F: docs/system/arm/sbsa.rst
+F: tests/avocado/machine_aarch64_sbsaref.py
 
 Sharp SL-5500 (Collie) PDA
 M: Peter Maydell <peter.maydell@linaro.org>
diff --git a/tests/avocado/machine_aarch64_sbsaref.py b/tests/avocado/machine_aarch64_sbsaref.py
new file mode 100644
index 0000000000..52e6991e03
--- /dev/null
+++ b/tests/avocado/machine_aarch64_sbsaref.py
@@ -0,0 +1,138 @@
+# Functional test that boots a Linux kernel and checks the console
+#
+# SPDX-FileCopyrightText: 2023 Linaro Ltd.
+# SPDX-FileContributor: Philippe Mathieu-Daudé <philmd@linaro.org>
+# SPDX-FileContributor: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+import os
+
+from avocado.utils import archive
+
+from avocado_qemu import QemuSystemTest
+from avocado_qemu import wait_for_console_pattern
+from avocado_qemu import interrupt_interactive_console_until_pattern
+
+
+class Aarch64SbsarefMachine(QemuSystemTest):
+    """
+    :avocado: tags=arch:aarch64
+    :avocado: tags=machine:sbsa-ref
+    """
+
+    def fetch_firmware(self):
+        """
+        Flash volumes generated using:
+
+        - Fedora GNU Toolchain version 12.2.1 20220819 (Red Hat Cross 12.2.1-2)
+
+        - Trusted Firmware-A
+          https://github.com/ARM-software/arm-trusted-firmware/tree/5fdb2e54
+
+        - Tianocore EDK II
+          https://github.com/tianocore/edk2/tree/494127613b
+          https://github.com/tianocore/edk2-non-osi/tree/41876073
+          https://github.com/tianocore/edk2-platforms/tree/8efa4f42
+        """
+
+        # Secure BootRom (TF-A code)
+        fs0_xz_url = ('https://fileserver.linaro.org/s/ATnSmq6k8SoXgbH/'
+                      'download/SBSA_FLASH0.fd.xz')
+        fs0_xz_hash = 'a210a09692bcbe0a3743ffd0df44e80e0c7ad8ab'
+        tar_xz_path = self.fetch_asset(fs0_xz_url, asset_hash=fs0_xz_hash)
+        archive.extract(tar_xz_path, self.workdir)
+        fs0_path = os.path.join(self.workdir, 'SBSA_FLASH0.fd')
+
+        # Non-secure rom (UEFI and EFI variables)
+        fs1_xz_url = ('https://fileserver.linaro.org/s/t8foNnMPz74DZZy/'
+                      'download/SBSA_FLASH1.fd.xz')
+        fs1_xz_hash = '13a9a262953787c7fc5a9155dfaa26e703631e02'
+        tar_xz_path = self.fetch_asset(fs1_xz_url, asset_hash=fs1_xz_hash)
+        archive.extract(tar_xz_path, self.workdir)
+        fs1_path = os.path.join(self.workdir, 'SBSA_FLASH1.fd')
+
+        for path in [fs0_path, fs1_path]:
+            with open(path, 'ab+') as fd:
+                fd.truncate(256 << 20)  # Expand volumes to 256MiB
+
+        self.vm.set_console()
+        self.vm.add_args('-drive', f'if=pflash,file={fs0_path},format=raw',
+                         '-drive', f'if=pflash,file={fs1_path},format=raw',
+                         "-smp", "1",
+                         "-machine", "sbsa-ref")
+
+    def test_sbsaref_edk2_firmware(self):
+        """
+        :avocado: tags=cpu:cortex-a57
+        """
+
+        self.fetch_firmware()
+        self.vm.launch()
+
+        # TF-A boot sequence:
+        #
+        # https://github.com/ARM-software/arm-trusted-firmware/blob/v2.8.0/\
+        #     docs/design/trusted-board-boot.rst#trusted-board-boot-sequence
+        # https://trustedfirmware-a.readthedocs.io/en/v2.8/\
+        #     design/firmware-design.html#cold-boot
+
+        # AP Trusted ROM
+        wait_for_console_pattern(self, 'Booting Trusted Firmware')
+        wait_for_console_pattern(self, 'BL1: v2.8(release):v2.8')
+        wait_for_console_pattern(self, 'BL1: Booting BL2')
+
+        # Trusted Boot Firmware
+        wait_for_console_pattern(self, 'BL2: v2.8(release)')
+        wait_for_console_pattern(self, 'Booting BL31')
+
+        # EL3 Runtime Software
+        wait_for_console_pattern(self, 'BL31: v2.8(release)')
+
+        # Non-trusted Firmware
+        wait_for_console_pattern(self, 'UEFI firmware (version 1.0')
+        interrupt_interactive_console_until_pattern(self,
+                                                    'QEMU SBSA-REF Machine')
+
+    # This tests the whole boot chain from EFI to Userspace
+    # We only boot a whole OS for the current top level CPU and GIC
+    # Other test profiles should use more minimal boots
+    def boot_alpine_linux(self, cpu):
+        self.fetch_firmware()
+
+        iso_url = ('https://dl-cdn.alpinelinux.org/'
+                   'alpine/v3.17/releases/aarch64/'
+                   'alpine-standard-3.17.2-aarch64.iso')
+
+        # Alpine use sha256 so I recalculated this myself
+        iso_sha1 = '76284fcd7b41fe899b0c2375ceb8470803eea839'
+        iso_path = self.fetch_asset(iso_url, asset_hash=iso_sha1)
+
+        self.vm.set_console()
+        self.vm.add_args("-cpu", cpu,
+                         "-drive", f"file={iso_path},format=raw",
+                         '-device', 'virtio-rng-pci,rng=rng0',
+                         '-object', 'rng-random,id=rng0,filename=/dev/urandom')
+
+        self.vm.launch()
+        wait_for_console_pattern(self, 'Welcome to Alpine Linux 3.17')
+
+    def test_sbsaref_alpine_linux_cortex_a57(self):
+        """
+        :avocado: tags=cpu:cortex-a57
+        """
+        self.boot_alpine_linux('cortex-a57')
+
+    def test_sbsaref_alpine_linux_neoverse_n1(self):
+        """
+        :avocado: tags=cpu:max
+        """
+        self.boot_alpine_linux('neoverse-n1')
+
+# This test requires TF-A update to handle FEAT_FGT
+#
+#   def test_sbsaref_alpine_linux_max(self):
+#       """
+#       :avocado: tags=cpu:max
+#       """
+#       self.boot_alpine_linux('max,pauth-impdef=on')
-- 
2.39.2

Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp940505ejb;
        Thu, 9 Feb 2023 08:50:19 -0800 (PST)
X-Google-Smtp-Source: AK7set+bUhMPCez6/ZQNrq+82nG7j3q/1pL+xBFSjGRgVlxSjSkqlVAAXZZSxWXvW1tbeCN2r8Tk
X-Received: by 2002:ac8:5c02:0:b0:3b8:2b4e:cbca with SMTP id i2-20020ac85c02000000b003b82b4ecbcamr20383489qti.14.1675961419575;
        Thu, 09 Feb 2023 08:50:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675961419; cv=none;
        d=google.com; s=arc-20160816;
        b=ztGC/NaS1aEEWiZOHmCcWH9zbKdF9HQ6LajHxmK8I1qOH1DDZGlD7h5znzq7aAH3oT
         gHWVz85PEnWpqs6Gzbnycacmw4qHs1dX6/g65d5g5H3qlFNqw8gbU6fa7VIoD1TPPGmi
         IElHoB+7Ndk0FxL1NBFrEl/MmH5DHwfnQ9TiLf9/YExJihTSILxj38YpInkqa7EPbR/6
         wGiWZIesOVSGpb5FRBimT+/lmKjQAZ1I3Uc7ObsyyCmOaBJo6miGSG1uIPqHldklUnsK
         zdflKq5yheI+fjk024suMbeBnfISvgiZplQMvGO7F8mZZ0LsoqHzhjLG1eTeaZeircZB
         Cz5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=I9Hb5BF1KC2ah0Zh26IGWeffXxuVYRjonUctSqXyQHI=;
        b=KRx2PElcWMDwJH4bXf3OHuvYYPJd4bzJfuFe4YMdeczmKcvyOemSLALOkhyBNyi5Uk
         K4TxlFGeyJfNaelmzByhKO9jMjPVqvlnovoeikNbQ+qDLKL+jLmGSvIcu0JeudLwbAIl
         uSZGgKYpEY+Fou2Ph5q0NPdRq0Ro2lNb9b3dIpmGyLo1dnlcvDZO83NyRl0/Ux13zxLq
         mDj6yAXv73JBM/ahtFzJ01DEQ5qCOWByjQoQ1Y4yNfa6LWx5ynDzzsu0viGefcB+lfLh
         0AZX3gjkBXFIOPoqxrpMx1LzPIHYIBkQ6bbqv6/uMgzV2hIIjbI2MBUEk7XkLfZSlK7b
         F20Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i1-20020ac85c01000000b003b9ed70ec36si1963269qti.202.2023.02.09.08.50.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Feb 2023 08:50:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pQA7S-0002kv-Of; Thu, 09 Feb 2023 11:49:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1pQA7R-0002kP-CS; Thu, 09 Feb 2023 11:49:57 -0500
Received: from muminek.juszkiewicz.com.pl ([213.251.184.221])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1pQA7O-0001f1-Ur; Thu, 09 Feb 2023 11:49:57 -0500
Received: from localhost (localhost [127.0.0.1])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id A076C260241;
 Thu,  9 Feb 2023 17:49:51 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
 by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gMc70V6Gu04z; Thu,  9 Feb 2023 17:49:49 +0100 (CET)
Received: from puchatek.com (83.11.36.13.ipv4.supernova.orange.pl
 [83.11.36.13])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 6E808260096;
 Thu,  9 Feb 2023 17:49:48 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: Radoslaw Biernacki <rad@semihalf.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>
Cc: qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Shashi Mallela <shashi.mallela@linaro.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Subject: [PATCH] tests/avocado: Add set of boot tests on SBSA-ref
Date: Thu,  9 Feb 2023 17:49:24 +0100
Message-Id: <20230209164924.976571-1-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=213.251.184.221;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=muminek.juszkiewicz.com.pl
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-To: 20221213155025.40920-1-philmd@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: duA3SkGegwRT

From: Philippe Mathieu-Daudé <philmd@linaro.org>

This change adds set of boot tests on SBSA-ref machine:

1. boot TF-A up to the EDK2 banner
2. boot Linux kernel/initrd up to Busybox shell

Prebuilt flash volumes are included, built using upstream documentation.
EDK2 and TF-A are updated to have SVE/SME properly enabled for 'max'
cpu.

Linux kernel/initrd are from Debian 'bookworm' installer with
"init=/bin/sh" kernel argument.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 MAINTAINERS                              |   1 +
 tests/avocado/machine_aarch64_sbsaref.py | 150 +++++++++++++++++++++++
 2 files changed, 151 insertions(+)
 create mode 100644 tests/avocado/machine_aarch64_sbsaref.py

diff --git a/MAINTAINERS b/MAINTAINERS
index 96e25f62ac..84cbcfd0bf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -911,6 +911,7 @@ L: qemu-arm@nongnu.org
 S: Maintained
 F: hw/arm/sbsa-ref.c
 F: docs/system/arm/sbsa.rst
+F: tests/avocado/machine_aarch64_sbsaref.py
 
 Sharp SL-5500 (Collie) PDA
 M: Peter Maydell <peter.maydell@linaro.org>
diff --git a/tests/avocado/machine_aarch64_sbsaref.py b/tests/avocado/machine_aarch64_sbsaref.py
new file mode 100644
index 0000000000..e36e53d4d5
--- /dev/null
+++ b/tests/avocado/machine_aarch64_sbsaref.py
@@ -0,0 +1,150 @@
+# Functional test that boots a Linux kernel and checks the console
+#
+# SPDX-FileCopyrightText: 2023 Linaro Ltd.
+# SPDX-FileContributor: Philippe Mathieu-Daudé <philmd@linaro.org>
+# SPDX-FileContributor: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+import os
+import shutil
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
+          https://github.com/ARM-software/arm-trusted-firmware/tree/6264643a
+
+        - Tianocore EDK II
+          https://github.com/tianocore/edk2/tree/f6ce1a5c
+          https://github.com/tianocore/edk2-non-osi/tree/74d4da60
+          https://github.com/tianocore/edk2-platforms/tree/0540e1a2
+        """
+
+        # Secure BootRom (TF-A code)
+        fs0_xz_url = ('https://fileserver.linaro.org/s/sZay4ZCCfHSXPKj/'
+                      'download/SBSA_FLASH0.fd.xz')
+        fs0_xz_hash = 'e74778cbb8e1aa0b77f8883565b9a18db638f6bb'
+        tar_xz_path = self.fetch_asset(fs0_xz_url, asset_hash=fs0_xz_hash)
+        archive.extract(tar_xz_path, self.workdir)
+        fs0_path = os.path.join(self.workdir, 'SBSA_FLASH0.fd')
+
+        # Non-secure rom (UEFI and EFI variables)
+        fs1_xz_url = ('https://fileserver.linaro.org/s/osHNaypByLa9xDK/'
+                      'download/SBSA_FLASH1.fd.xz')
+        fs1_xz_hash = '7d9f1a6b8964b8b99144f7e905a4083f31e31ad3'
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
+                         '-drive', f'if=pflash,file={fs1_path},format=raw')
+
+    def test_sbsaref_tfa_v2_8(self):
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
+    def boot_linux(self, cpu='cortex-a57'):
+        """
+        :avocado: tags=cpu:cortex-a57
+        """
+        self.fetch_firmware()
+
+        os.makedirs(f'{self.workdir}/vfat/efi/boot')
+
+        # UEFI shell binary
+        shell_url = ('https://fileserver.linaro.org/s/SGoyRrEzkmW8C8Y/'
+                     'download/bootaa64.efi')
+        shell_sha1 = '5a8791eb130406d1a659e538b1a194a604a29a78'
+        shell_path = self.fetch_asset(shell_url, shell_sha1)
+        shutil.copyfile(shell_path,
+                        f'{self.workdir}/vfat/efi/boot/bootaa64.efi')
+
+        # Debian 'bookworm' d-i kernel from 8th Feb 2023
+        linux_url = ('https://fileserver.linaro.org/s/L8JMwEZQK8SDR39/'
+                     'download/linux')
+        linux_sha1 = '39a75284783ab63626642228fbac1863492d30b5'
+        linux_path = self.fetch_asset(linux_url, linux_sha1)
+        shutil.copyfile(linux_path, f'{self.workdir}/vfat/linux')
+
+        # Debian 'bookworm' d-i initrd.gz from 8th Feb 2023
+        initrd_url = ('https://fileserver.linaro.org/s/NmYTxezZNKGF5P4/'
+                      'download/initrd.gz')
+        initrd_sha1 = '1404d0129cbd0bff7aaa589ddbea3cdb7c0d4c1d'
+        initrd_path = self.fetch_asset(initrd_url, initrd_sha1)
+        shutil.copyfile(initrd_path, f'{self.workdir}/vfat/initrd.gz')
+
+        with open(f'{self.workdir}/vfat/startup.nsh', 'w') as script:
+            script.write('fs0:\\linux initrd=\\initrd.gz init=/bin/sh')
+
+        self.vm.add_args('-cpu', cpu,
+                         '-drive',
+                         f'file=fat:rw:{self.workdir}/vfat/,format=raw')
+        self.vm.launch()
+
+        # Exit UEFI
+        wait_for_console_pattern(self, 'EFI stub: Exiting boot services...')
+
+        # init=/bin/sh started
+        wait_for_console_pattern(self, 'BusyBox v1.35.0 (Debian')
+
+    def test_sbsaref_linux_a57(self):
+        """
+        :avocado: tags=cpu:cortex-a57
+        """
+        self.boot_linux('cortex-a57')
+
+    def test_sbsaref_linux_max(self):
+        """
+        :avocado: tags=cpu:max
+        """
+        self.boot_linux('max')
-- 
2.39.1


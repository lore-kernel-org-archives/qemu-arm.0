Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp4339509ejb;
        Tue, 13 Dec 2022 07:50:28 -0800 (PST)
X-Received: by 2002:a5d:4566:0:b0:242:782c:f397 with SMTP id a6-20020a5d4566000000b00242782cf397mr14707922wrc.25.1670946628362;
        Tue, 13 Dec 2022 07:50:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670946628; cv=none;
        d=google.com; s=arc-20160816;
        b=sYqCgl7LGDdSZPUk0EM6408+igEbVHKQn3SmQWIlfP5sf1tHmJCBIfSmLJrM1891oY
         Ja7AmLQjFsinL0YRFo/ueOcDDB32rvlM5SgItYYltNRojJRBbAB017Q4/efNEfSqvUmM
         7XYuxPeM5eDUUzQyn48Z9RZ3RcvccD9N2AOzmlJuZsNyBBl64n5yUK1AOQU31RBo5Wmi
         afk+g6oj7N1vOXUZwlaQZ9DNVYWPFbF8j7Cwvp3GIInBaa64RWpBYtTdqFQjh+4YLLc+
         Pa6gKHecDGvm9Tss+7SFy3To6hNQC8xCnkPakQx0xqMbXlCDGzY81qEd43zXT8HWChCX
         uqIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=IF3EhrrSupu0hN06Z89nBmDPBtfeLQTf71/XWhtNN9s=;
        b=shlP/2J/Gj0LR8/LFzEDslQEobFBE+atIF7lBXCyy1UwLwOs/SnmgVAcpNkcg/qIyT
         uhKfMC7wXEfolvw1qjbjFWoYGfvX00COblb/svRrgDSIFHOsTajXKR+6HSTSH8QFnfnq
         0Q3qhr0E4C55yVz9uwMblkOGyzSkLgzWoLhrEuRP0pxIqb0aEw5tCHR6sl8CgT3MPSe2
         zslJpCjRAdtdyeicMRkvdxyGr5GL/MHq/5L2WE4Y4ugtOpDXZCyoOrnXrOStSMPwPKfu
         n6XF0+N853shHhLaFrquXqS8QpfJwCQaN07lZWht4oUgfcXQ3XIuL+LZMQ1PRZXhUnIQ
         Wr9A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iD3ovvxL;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id r30-20020adfa15e000000b00241c67bdc1csor91035wrr.19.2022.12.13.07.50.28
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 13 Dec 2022 07:50:28 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iD3ovvxL;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IF3EhrrSupu0hN06Z89nBmDPBtfeLQTf71/XWhtNN9s=;
        b=iD3ovvxLq9bjSUL1EIF/wgcdE7aCBSQOZYq5OExFC3TYT3VU5NX6QzC9gTplo4wDmr
         6FGOdxiRjwM7HgskA4ug+AzT0iRA5KwwIwcPV2gHuPsNyYdVAojDcXOsROq/AyUFa0Ij
         +VSmN4Tl7KNFHPIL0Zw14nCEcJLN9Ljheml37Qq1ulADdz/BJVvRVgp0CXmmLg0/LVni
         JiflqUjQbyBPlWZ6Cbwsd9rTDfVp49oSTlUzLmubKQZSi7Sy2wvb05v3QgpMS0NxZ81G
         Y0NP75t2U5juoBBddgjlT9t5Jg46fC8c+KvghVbta8Y/LoI0OnuLXGWojiTfK6Ga1vvW
         dlfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IF3EhrrSupu0hN06Z89nBmDPBtfeLQTf71/XWhtNN9s=;
        b=AE5HWGOKUG3B13ziKMewAlLut3rPiTh6lD+xi+Ilhcs+m49PESwHGtBGHT2fow9ug1
         BuzRq7fazqqNSU4INgVyFkv89iWPKbDP33Ruu6cwAmW9pzCrjgfNK2fk26N/zDl2f40q
         ByUm2krq1zq8lk1VA4MnQCtpI6KEDCSpMgNdLMzxJno4mk8byL3lQbutumRSq4qDROEZ
         3Hd2h/s+hK8PFGnTFqm65Tj4e/XnBdZjF3PtHF1FK+9IAfZiohgryGB+zaeAA1DloasD
         r/eeu0ek+grN0guYBpGHR11KJyVJZekHpDEEVN1EBmNdzDF0eyoeHOTKTpxguqxQz5p5
         H4Gw==
X-Gm-Message-State: ANoB5plQ1+5Al6OYv7wCA+Iufgc3via5rOlVpt9Bc2vxCFBEOr+LTNE8
	p3OhafyNH96sZbP+IF9Zfx8t163V
X-Google-Smtp-Source: AA0mqf4xbsn1s9rnv/lp/b35lAs05NmaviSdt4VnXZzOwDqRuXXgJPnSRVRLacww1K2dqol99gDqwQ==
X-Received: by 2002:a05:6000:170b:b0:242:806c:8612 with SMTP id n11-20020a056000170b00b00242806c8612mr16330621wrc.7.1670946628015;
        Tue, 13 Dec 2022 07:50:28 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id t2-20020adfa2c2000000b002428c4fb16asm159747wra.10.2022.12.13.07.50.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 13 Dec 2022 07:50:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Beraldo Leal <bleal@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Radoslaw Biernacki <rad@semihalf.com>
Subject: [PATCH-for-8.0] tests/avocado: Add a quick test to boot Trusted Firmware on SBSA-ref
Date: Tue, 13 Dec 2022 16:50:25 +0100
Message-Id: <20221213155025.40920-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 7eBsKZolaMKe

This quick test boots TF-A on the SBSA-ref machine up to the
EDK2 banner.

It was helpful to catch an issue with Secure PTW fixed in
commit cead7fa4c0 ("target/arm: Two fixes for secure ptw").

Prebuilt flash volumes are included, with the build recipes
to reproduce.

Example of execution:

  $ avocado --show=app,console run -t machine:sbsa-ref tests/avocado
   (1/1) tests/avocado/machine_aarch64_sbsaref.py:Aarch64SbsarefMachine.test_sbsaref_tfa_v2_8:
  console: NOTICE:  Booting Trusted Firmware
  console: NOTICE:  BL1: v2.7(release):v2.8-rc0
  console: NOTICE:  BL1: Built : 22:41:04, Nov 15 2022
  console: NOTICE:  BL1: Booting BL2
  console: NOTICE:  BL2: v2.5(release):v2.5-432-ga4ea20502
  console: NOTICE:  BL2: Built : 13:50:23, Sep 13 2021
  console: NOTICE:  BL1: Booting BL31
  console: NOTICE:  BL31: v2.5(release):v2.5-432-ga4ea20502
  console: NOTICE:  BL31: Built : 13:50:23, Sep 13 2021
  console: UEFI firmware (version 1.0 built at 22:54:31 on Nov 15 2022)
  console: QEMU SBSA-REF Machine
   arm-virt                                            2.00 GHz
   1.0                                                 1024 MB RAM
  PASS (1.73 s)
  RESULTS    : PASS 1 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CANCEL 0
  JOB TIME   : 1.94 s

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 MAINTAINERS                              |  1 +
 tests/avocado/machine_aarch64_sbsaref.py | 96 ++++++++++++++++++++++++
 2 files changed, 97 insertions(+)
 create mode 100644 tests/avocado/machine_aarch64_sbsaref.py

diff --git a/MAINTAINERS b/MAINTAINERS
index 6966490c94..ddc2340661 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -891,6 +891,7 @@ L: qemu-arm@nongnu.org
 S: Maintained
 F: hw/arm/sbsa-ref.c
 F: docs/system/arm/sbsa.rst
+F: tests/avocado/machine_aarch64_sbsaref.py
 
 Sharp SL-5500 (Collie) PDA
 M: Peter Maydell <peter.maydell@linaro.org>
diff --git a/tests/avocado/machine_aarch64_sbsaref.py b/tests/avocado/machine_aarch64_sbsaref.py
new file mode 100644
index 0000000000..b21e3cfc51
--- /dev/null
+++ b/tests/avocado/machine_aarch64_sbsaref.py
@@ -0,0 +1,96 @@
+# Functional test that boots a Linux kernel and checks the console
+#
+# SPDX-FileCopyrightText: 2022 Linaro Ltd.
+# SPDX-FileContributor: Philippe Mathieu-Daudé <philmd@linaro.org>
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+import os
+import time
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
+    def test_sbsaref_tfa_v2_8(self):
+        """
+        :avocado: tags=cpu:cortex-a57
+
+        Flash volumes generated using:
+
+        - Arm GNU Toolchain version 10.3-2021.07
+          https://developer.arm.com/downloads/-/gnu-a
+          gcc version 10.3.1 20210621 (GNU Toolchain for the A-profile \
+              Architecture 10.3-2021.07 (arm-10.29))
+
+        - Trusted Firmware-A
+          https://github.com/ARM-software/arm-trusted-firmware/blob/v2.8.0/\
+              docs/plat/qemu-sbsa.rst
+
+        - Tianocore EDK II
+          https://github.com/tianocore/edk2/tree/0cb30c3f5e9b/
+          https://github.com/tianocore/edk2-non-osi/tree/61662e8596dd/
+          https://github.com/tianocore/edk2-platforms/tree/e2d7a3014b14/\
+              Platform/Qemu/SbsaQemu
+
+        The last URL contains the various build steps.
+        """
+
+        # Secure BootRom (TF-A code)
+        fs0_xz_url = ('https://fileserver.linaro.org/s/L7BcZXJk37pKfjR/'
+                      'download/SBSA_FLASH0.fd.xz')
+        fs0_xz_hash = 'a865247218af268974a34f8b64af3cfddb3b59de'
+        tar_xz_path = self.fetch_asset(fs0_xz_url, asset_hash=fs0_xz_hash)
+        archive.extract(tar_xz_path, self.workdir)
+        fs0_path = os.path.join(self.workdir, 'SBSA_FLASH0.fd')
+
+        # Non-secure rom (UEFI and EFI variables)
+        fs1_xz_url = ('https://fileserver.linaro.org/s/rNDQATTJnFCaoxb/'
+                      'download/SBSA_FLASH1.fd.xz')
+        fs1_xz_hash = 'b0ccf5498293d90a28c2f75a3b9906e1d65ad917'
+        tar_xz_path = self.fetch_asset(fs1_xz_url, asset_hash=fs1_xz_hash)
+        archive.extract(tar_xz_path, self.workdir)
+        fs1_path = os.path.join(self.workdir, 'SBSA_FLASH1.fd')
+
+        for path in [fs0_path, fs1_path]:
+            with open(path, 'ab+') as fd:
+                fd.truncate(256 << 20) # Expand volumes to 256MiB
+
+        self.vm.set_console()
+        self.vm.add_args('-cpu', 'cortex-a57',
+                         '-drive', f'if=pflash,file={fs0_path},format=raw',
+                         '-drive', f'if=pflash,file={fs1_path},format=raw')
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
+        wait_for_console_pattern(self, 'BL1: v2.7(release):v2.8-rc0')
+        wait_for_console_pattern(self, 'BL1: Booting BL2')
+
+        # Trusted Boot Firmware
+        wait_for_console_pattern(self, 'BL2: v2.5(release)')
+        wait_for_console_pattern(self, 'Booting BL31')
+
+        # EL3 Runtime Software
+        wait_for_console_pattern(self, 'BL31: v2.5(release)')
+
+        # Non-trusted Firmware
+        wait_for_console_pattern(self, 'UEFI firmware (version 1.0')
+        interrupt_interactive_console_until_pattern(self,
+                                                    'QEMU SBSA-REF Machine')
-- 
2.38.1

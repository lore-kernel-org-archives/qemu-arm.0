Received: by 2002:a17:505:1116:b0:1be9:327d:8ee3 with SMTP id pu22csp179226njb;
        Fri, 23 Aug 2024 06:16:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVN8lgRlXQM7jidYCO4KacoBop2T3FFdfZPlcvk6SZkXwUf6oLGI7r77nwmHEEU1tlGMbBDMaWI9cKFmQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFec3qxlZAcbTgZArBF57ULOGWerG3ZpSICexgHfMF3eVUdlFogTyLzmgT8Np/0ztOzr5YH
X-Received: by 2002:a05:6214:5b13:b0:6bf:894e:7964 with SMTP id 6a1803df08f44-6c16df0316fmr22085906d6.57.1724419008867;
        Fri, 23 Aug 2024 06:16:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724419008; cv=none;
        d=google.com; s=arc-20160816;
        b=RtzIVWNywcwFVGuu3do0PBuBxyYkXF0lDmTm89twBCCxe44CpIJQDSkQjNkA6GtikT
         kV9GyIf85fHtwC6kw0BOP09eYVrmuBHbcr9TyW1k8dkOHwSCaD0e+HdZQo4bjabwFOhd
         arJDpJbWN6LwT73UaCZ4b6HIzYfoxJNjtDgmDZafk75vKS5UDJMf0zzAVzFNOZ7ZmBjd
         oKK2VEeX07ngbUlo7rD/I5lpKDhJnb6VTSXShYXIna9uU9wIOJR21QrRTOVlS4H3KaXO
         gN5bLpfyhNk/Axjk9GRMtgsbaqkDVfFp2VgGEGhmJpoaQKyBA1cCHqWpC1uiUJv/YWmF
         6qIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=MyYScXBPTwEKXiL7DmwNjldnYCv0nswuTZFtBhKeVlA=;
        fh=JSLoYCcYrjqLdpLT2QznhNY0S7vzFsixXUqmjsf36vA=;
        b=WzCVN1xQ/cxMZ4XOpuxsV5K1wFZv2lsLI7kXkguWo7LRo1noXzN7GF9XP8ayG3fYW7
         iVtQws9ve+ksbUitzNuCib5STkadRdlUT7VBwqbUww2b5+hYh9DIwlqayKAf0zzs3tPg
         t+ejxhNGgrPqecG4uKJB4Wp+wVPlwSKYr8y5avPUG14UHCk82iCLQwHg2DeXUm0/75pc
         4wTyj1YPChskDDg/W9asNlKSaF1N1l+65lv4K1gdJ7Cj7UAaItCp0qpQYpIBpL5GY9lq
         RAoV3j2X3OTYJcEyuxQhaphiOd2p5mKRHZfK0uq/mWBCyEvBQEtBZnVTRVhBQkPxqmbL
         e1/w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hcEZEkpH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c162e44babsi42906016d6.520.2024.08.23.06.16.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Aug 2024 06:16:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hcEZEkpH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1shU9f-0007pb-Rq; Fri, 23 Aug 2024 09:16:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1shU9Q-0006p3-Iu
 for qemu-arm@nongnu.org; Fri, 23 Aug 2024 09:16:28 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1shU9K-0000hi-SJ
 for qemu-arm@nongnu.org; Fri, 23 Aug 2024 09:16:24 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-429ec9f2155so15743425e9.2
 for <qemu-arm@nongnu.org>; Fri, 23 Aug 2024 06:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724418977; x=1725023777; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MyYScXBPTwEKXiL7DmwNjldnYCv0nswuTZFtBhKeVlA=;
 b=hcEZEkpHIY4/KxneHyKGU5306HHnAAuszCOhMZ3PBJJSfA/88L85cWl3BnNCa2ahRg
 bc9cn4aVZ6B7aItVZVOBjXL61CxLouppvcU+pwITF0rkwS3AYeHkzMyDxKlQLar0iFaB
 y8Uj52wKOoRTw2Fpmq8IsNn7n6wUC1f5wM3ig15JsRI5LDDGb90QLvzepX5VQgzIHs9K
 biy6mjXzV05pJeBxlVmJOufJcltm4aAHRQdkelmXUrHn7qLQpn7yO09krw78rYsvjcM+
 oFLdC4DRzzGt0Ky7z5+jSZLtgu6PYgoPGrsvCsvcH+fIH96aYJuRsMqS3BQoWsTj/Neo
 VHAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724418977; x=1725023777;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MyYScXBPTwEKXiL7DmwNjldnYCv0nswuTZFtBhKeVlA=;
 b=WS2FVQnEh1ICUcgxvyCo0pAMvPGS61GAS8NnQGcQhFsLRrYbgeFRLmsIa0r6YxakIM
 qtlgAJx2E1DNfVj/6zcpKK1DiiWaGqA+f4YbNeQP3EjGEOWkFVP2hyylv5Ej48PA8E3S
 5CDLs1cS8T2ntDyMhOQsKJAEyB0RBKq+jziRr+SVGDBNwKliiNl1lWxkr3ETw35GG00Q
 aGwfJHCLThw5F9NEQCI+zbd+VGyEkvJ++vpGNtJHk5aRmJEpBk2OmKESM7oVmB3A6A+d
 fHeTEsAAeMnnHJDmADtO/FAZGfLjNLYwORzwRx0+gLQgbx1VZPhE4ufHju9CNy3i407F
 FVWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwdc6wFsXRe+lq72apwq84YIFZynUOYrlioBzN8MG2gZ3azzQyofBfHvWOrz/+BsWf8X9q/aaySw==@nongnu.org
X-Gm-Message-State: AOJu0Yyy9AslsM3s3i5rFfwfe2xjBZ/JlLoCdOhrfhjBidxRCkY3gdmx
 zEvJw6y4BfYNG+bA/jClYLfrfUDCnuvyqVUt83yVnk9bfVWMQDt20XYqGzrwfNE=
X-Received: by 2002:a05:600c:3d0e:b0:426:63b8:2cce with SMTP id
 5b1f17b1804b1-42acc8d52b6mr15103225e9.7.1724418976854; 
 Fri, 23 Aug 2024 06:16:16 -0700 (PDT)
Received: from m1x-phil.lan (plb95-h02-176-184-14-228.dsl.sta.abo.bbox.fr.
 [176.184.14.228]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42ac514e04dsm59830155e9.6.2024.08.23.06.16.15
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 23 Aug 2024 06:16:16 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH v3] tests/functional: Convert Aarch64 SBSA-Ref avocado tests
Date: Fri, 23 Aug 2024 15:16:14 +0200
Message-ID: <20240823131614.10269-1-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: nIQY+W3JXJX8

Straight forward conversion. Since SBSA_FLASH files are not
tarballs, use lzma_uncompress() method.

Avocado used to set a timeout of 11 tests * 180s = 1980s.
Hopefully 600s should be sufficient.

Running on macOS Sonoma / Apple silicon M1:

  $ QEMU_TEST_TIMEOUT_EXPECTED=1 make check-functional-aarch64 V=1
  ▶ 1/5 test_aarch64_sbsaref.Aarch64SbsarefMachine.test_sbsaref_alpine_linux_max              OK
  ▶ 1/5 test_aarch64_sbsaref.Aarch64SbsarefMachine.test_sbsaref_alpine_linux_max_pauth_impdef OK
  ▶ 1/5 test_aarch64_sbsaref.Aarch64SbsarefMachine.test_sbsaref_alpine_linux_max_pauth_off    OK
  ▶ 1/5 test_aarch64_sbsaref.Aarch64SbsarefMachine.test_sbsaref_alpine_linux_neoverse_n1      OK
  ▶ 1/5 test_aarch64_sbsaref.Aarch64SbsarefMachine.test_sbsaref_edk2_firmware                 OK
  ▶ 1/5 test_aarch64_sbsaref.Aarch64SbsarefMachine.test_sbsaref_openbsd73_cortex_a57          OK
  ▶ 1/5 test_aarch64_sbsaref.Aarch64SbsarefMachine.test_sbsaref_openbsd73_max                 OK
  ▶ 1/5 test_aarch64_sbsaref.Aarch64SbsarefMachine.test_sbsaref_openbsd73_max_pauth_impdef    OK
  ▶ 1/5 test_aarch64_sbsaref.Aarch64SbsarefMachine.test_sbsaref_openbsd73_max_pauth_off       OK
  ▶ 1/5 test_aarch64_sbsaref.Aarch64SbsarefMachine.test_sbsaref_openbsd73_neoverse_n1         OK
  1/5 qemu:func-thorough+func-aarch64-thorough+thorough / func-aarch64-aarch64_sbsaref        OK   241.79s  11 subtests passed
  ...

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
Based-on: <20240821082748.65853-1-thuth@redhat.com>

v3:
- Fix ASSET_FLASH1 typo (Marcin)
- Tune timeout (Marcin)
---
 MAINTAINERS                                   |   2 +-
 tests/functional/meson.build                  |   5 +
 .../test_aarch64_sbsaref.py}                  | 144 ++++++------------
 3 files changed, 55 insertions(+), 96 deletions(-)
 rename tests/{avocado/machine_aarch64_sbsaref.py => functional/test_aarch64_sbsaref.py} (56%)
 mode change 100644 => 100755

diff --git a/MAINTAINERS b/MAINTAINERS
index 91e5b061bf..c720c02800 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -971,7 +971,7 @@ F: hw/misc/sbsa_ec.c
 F: hw/watchdog/sbsa_gwdt.c
 F: include/hw/watchdog/sbsa_gwdt.h
 F: docs/system/arm/sbsa.rst
-F: tests/avocado/machine_aarch64_sbsaref.py
+F: tests/functional/test_aarch64_sbsaref.py
 
 Sharp SL-5500 (Collie) PDA
 M: Peter Maydell <peter.maydell@linaro.org>
diff --git a/tests/functional/meson.build b/tests/functional/meson.build
index f1fce045fc..3ab29c0f35 100644
--- a/tests/functional/meson.build
+++ b/tests/functional/meson.build
@@ -11,6 +11,7 @@ endif
 
 # Timeouts for individual tests that can be slow e.g. with debugging enabled
 test_timeouts = {
+  'aarch64_sbsaref' : 600,
   'acpi_bits' : 240,
   'netdev_ethtool' : 180,
   'ppc_40p' : 240,
@@ -26,6 +27,10 @@ tests_generic = [
   'version',
 ]
 
+tests_aarch64_thorough = [
+  'aarch64_sbsaref',
+]
+
 tests_arm_thorough = [
   'arm_canona1100',
   'arm_integratorcp',
diff --git a/tests/avocado/machine_aarch64_sbsaref.py b/tests/functional/test_aarch64_sbsaref.py
old mode 100644
new mode 100755
similarity index 56%
rename from tests/avocado/machine_aarch64_sbsaref.py
rename to tests/functional/test_aarch64_sbsaref.py
index f8bf40c192..e90566cdb8
--- a/tests/avocado/machine_aarch64_sbsaref.py
+++ b/tests/functional/test_aarch64_sbsaref.py
@@ -1,3 +1,5 @@
+#!/usr/bin/env python3
+#
 # Functional test that boots a Linux kernel and checks the console
 #
 # SPDX-FileCopyrightText: 2023-2024 Linaro Ltd.
@@ -8,12 +10,11 @@
 
 import os
 
-from avocado import skipUnless
-from avocado.utils import archive
-
-from avocado_qemu import QemuSystemTest
-from avocado_qemu import wait_for_console_pattern
-from avocado_qemu import interrupt_interactive_console_until_pattern
+from qemu_test import QemuSystemTest, Asset
+from qemu_test import wait_for_console_pattern
+from qemu_test import interrupt_interactive_console_until_pattern
+from qemu_test.utils import lzma_uncompress
+from unittest import skipUnless
 
 
 class Aarch64SbsarefMachine(QemuSystemTest):
@@ -28,6 +29,16 @@ class Aarch64SbsarefMachine(QemuSystemTest):
 
     timeout = 180
 
+    ASSET_FLASH0 = Asset(
+        ('https://artifacts.codelinaro.org/artifactory/linaro-419-sbsa-ref/'
+         '20240619-148232/edk2/SBSA_FLASH0.fd.xz'),
+        '0c954842a590988f526984de22e21ae0ab9cb351a0c99a8a58e928f0c7359cf7')
+
+    ASSET_FLASH1 = Asset(
+        ('https://artifacts.codelinaro.org/artifactory/linaro-419-sbsa-ref/'
+         '20240619-148232/edk2/SBSA_FLASH1.fd.xz'),
+        'c6ec39374c4d79bb9e9cdeeb6db44732d90bb4a334cec92002b3f4b9cac4b5ee')
+
     def fetch_firmware(self):
         """
         Flash volumes generated using:
@@ -44,47 +55,31 @@ def fetch_firmware(self):
         """
 
         # Secure BootRom (TF-A code)
-        fs0_xz_url = (
-            "https://artifacts.codelinaro.org/artifactory/linaro-419-sbsa-ref/"
-            "20240619-148232/edk2/SBSA_FLASH0.fd.xz"
-        )
-        fs0_xz_hash = "0c954842a590988f526984de22e21ae0ab9cb351a0c99a8a58e928f0c7359cf7"
-        tar_xz_path = self.fetch_asset(fs0_xz_url, asset_hash=fs0_xz_hash,
-                                      algorithm='sha256')
-        archive.extract(tar_xz_path, self.workdir)
+        fs0_xz_path = self.ASSET_FLASH0.fetch()
         fs0_path = os.path.join(self.workdir, "SBSA_FLASH0.fd")
+        lzma_uncompress(fs0_xz_path, fs0_path)
 
         # Non-secure rom (UEFI and EFI variables)
-        fs1_xz_url = (
-            "https://artifacts.codelinaro.org/artifactory/linaro-419-sbsa-ref/"
-            "20240619-148232/edk2/SBSA_FLASH1.fd.xz"
-        )
-        fs1_xz_hash = "c6ec39374c4d79bb9e9cdeeb6db44732d90bb4a334cec92002b3f4b9cac4b5ee"
-        tar_xz_path = self.fetch_asset(fs1_xz_url, asset_hash=fs1_xz_hash,
-                                      algorithm='sha256')
-        archive.extract(tar_xz_path, self.workdir)
+        fs1_xz_path = self.ASSET_FLASH1.fetch()
         fs1_path = os.path.join(self.workdir, "SBSA_FLASH1.fd")
+        lzma_uncompress(fs1_xz_path, fs1_path)
 
         for path in [fs0_path, fs1_path]:
             with open(path, "ab+") as fd:
                 fd.truncate(256 << 20)  # Expand volumes to 256MiB
 
+        self.set_machine('sbsa-ref')
         self.vm.set_console()
         self.vm.add_args(
-            "-drive",
-            f"if=pflash,file={fs0_path},format=raw",
-            "-drive",
-            f"if=pflash,file={fs1_path},format=raw",
-            "-machine",
-            "sbsa-ref",
+            "-drive", f"if=pflash,file={fs0_path},format=raw",
+            "-drive", f"if=pflash,file={fs1_path},format=raw",
         )
 
     def test_sbsaref_edk2_firmware(self):
-        """
-        :avocado: tags=cpu:cortex-a57
-        """
 
         self.fetch_firmware()
+
+        self.vm.add_args('-cpu', 'cortex-a57')
         self.vm.launch()
 
         # TF-A boot sequence:
@@ -110,87 +105,62 @@ def test_sbsaref_edk2_firmware(self):
         wait_for_console_pattern(self, "UEFI firmware (version 1.0")
         interrupt_interactive_console_until_pattern(self, "QEMU SBSA-REF Machine")
 
+
+    ASSET_ALPINE_ISO = Asset(
+        ('https://dl-cdn.alpinelinux.org/'
+         'alpine/v3.17/releases/aarch64/alpine-standard-3.17.2-aarch64.iso'),
+        '5a36304ecf039292082d92b48152a9ec21009d3a62f459de623e19c4bd9dc027')
+
     # This tests the whole boot chain from EFI to Userspace
     # We only boot a whole OS for the current top level CPU and GIC
     # Other test profiles should use more minimal boots
     def boot_alpine_linux(self, cpu):
         self.fetch_firmware()
 
-        iso_url = (
-            "https://dl-cdn.alpinelinux.org/"
-            "alpine/v3.17/releases/aarch64/alpine-standard-3.17.2-aarch64.iso"
-        )
-
-        iso_hash = "5a36304ecf039292082d92b48152a9ec21009d3a62f459de623e19c4bd9dc027"
-        iso_path = self.fetch_asset(iso_url, algorithm="sha256", asset_hash=iso_hash)
+        iso_path = self.ASSET_ALPINE_ISO.fetch()
 
         self.vm.set_console()
         self.vm.add_args(
-            "-cpu",
-            cpu,
-            "-drive",
-            f"file={iso_path},media=cdrom,format=raw",
+            "-cpu", cpu,
+            "-drive", f"file={iso_path},media=cdrom,format=raw",
         )
 
         self.vm.launch()
         wait_for_console_pattern(self, "Welcome to Alpine Linux 3.17")
 
     def test_sbsaref_alpine_linux_cortex_a57(self):
-        """
-        :avocado: tags=cpu:cortex-a57
-        :avocado: tags=os:linux
-        """
         self.boot_alpine_linux("cortex-a57")
 
     def test_sbsaref_alpine_linux_neoverse_n1(self):
-        """
-        :avocado: tags=cpu:neoverse-n1
-        :avocado: tags=os:linux
-        """
         self.boot_alpine_linux("neoverse-n1")
 
     def test_sbsaref_alpine_linux_max_pauth_off(self):
-        """
-        :avocado: tags=cpu:max
-        :avocado: tags=os:linux
-        """
         self.boot_alpine_linux("max,pauth=off")
 
     def test_sbsaref_alpine_linux_max_pauth_impdef(self):
-        """
-        :avocado: tags=cpu:max
-        :avocado: tags=os:linux
-        """
         self.boot_alpine_linux("max,pauth-impdef=on")
 
-    @skipUnless(os.getenv('AVOCADO_TIMEOUT_EXPECTED'), 'Test might timeout')
+    @skipUnless(os.getenv('QEMU_TEST_TIMEOUT_EXPECTED'), 'Test might timeout')
     def test_sbsaref_alpine_linux_max(self):
-        """
-        :avocado: tags=cpu:max
-        :avocado: tags=os:linux
-        """
         self.boot_alpine_linux("max")
 
 
+    ASSET_OPENBSD_ISO = Asset(
+        ('https://cdn.openbsd.org/pub/OpenBSD/7.3/arm64/miniroot73.img'),
+        '7fc2c75401d6f01fbfa25f4953f72ad7d7c18650056d30755c44b9c129b707e5')
+
     # This tests the whole boot chain from EFI to Userspace
     # We only boot a whole OS for the current top level CPU and GIC
     # Other test profiles should use more minimal boots
     def boot_openbsd73(self, cpu):
         self.fetch_firmware()
 
-        img_url = (
-            "https://cdn.openbsd.org/pub/OpenBSD/7.3/arm64/miniroot73.img"
-        )
-
-        img_hash = "7fc2c75401d6f01fbfa25f4953f72ad7d7c18650056d30755c44b9c129b707e5"
-        img_path = self.fetch_asset(img_url, algorithm="sha256", asset_hash=img_hash)
+        img_path = self.ASSET_OPENBSD_ISO.fetch()
 
         self.vm.set_console()
         self.vm.add_args(
-            "-cpu",
-            cpu,
-            "-drive",
-            f"file={img_path},format=raw,snapshot=on",
+            "-cpu", cpu,
+            "-drive", f"file={img_path},format=raw,snapshot=on",
         )
 
         self.vm.launch()
@@ -199,38 +169,22 @@ def boot_openbsd73(self, cpu):
                                  " 7.3 installation program.")
 
     def test_sbsaref_openbsd73_cortex_a57(self):
-        """
-        :avocado: tags=cpu:cortex-a57
-        :avocado: tags=os:openbsd
-        """
         self.boot_openbsd73("cortex-a57")
 
     def test_sbsaref_openbsd73_neoverse_n1(self):
-        """
-        :avocado: tags=cpu:neoverse-n1
-        :avocado: tags=os:openbsd
-        """
         self.boot_openbsd73("neoverse-n1")
 
     def test_sbsaref_openbsd73_max_pauth_off(self):
-        """
-        :avocado: tags=cpu:max
-        :avocado: tags=os:openbsd
-        """
         self.boot_openbsd73("max,pauth=off")
 
-    @skipUnless(os.getenv('AVOCADO_TIMEOUT_EXPECTED'), 'Test might timeout')
+    @skipUnless(os.getenv('QEMU_TEST_TIMEOUT_EXPECTED'), 'Test might timeout')
     def test_sbsaref_openbsd73_max_pauth_impdef(self):
-        """
-        :avocado: tags=cpu:max
-        :avocado: tags=os:openbsd
-        """
         self.boot_openbsd73("max,pauth-impdef=on")
 
-    @skipUnless(os.getenv('AVOCADO_TIMEOUT_EXPECTED'), 'Test might timeout')
+    @skipUnless(os.getenv('QEMU_TEST_TIMEOUT_EXPECTED'), 'Test might timeout')
     def test_sbsaref_openbsd73_max(self):
-        """
-        :avocado: tags=cpu:max
-        :avocado: tags=os:openbsd
-        """
         self.boot_openbsd73("max")
+
+
+if __name__ == '__main__':
+    QemuSystemTest.main()
-- 
2.45.2


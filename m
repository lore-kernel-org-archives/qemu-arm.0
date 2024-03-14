Received: by 2002:a17:906:4a0b:b0:a45:b507:d90a with SMTP id w11csp205550eju;
        Thu, 14 Mar 2024 02:24:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWGZG9YygOTW1bs2R2g0jErqbqqq/RyinGND+AbC0N9WqGvUESuvdqpOlOKc5Q0vz0lIhC6tF0QxFmdd/7y95RekC+cUm31
X-Google-Smtp-Source: AGHT+IFTqYGPa2Ah4GMEKsQqXyGW4dP2IWRlz1GZ72hDuBkvIu8DCLGHqNblrD8nZumY6vCgdp/y
X-Received: by 2002:a05:620a:558d:b0:788:30f6:ca27 with SMTP id vq13-20020a05620a558d00b0078830f6ca27mr79181qkn.34.1710408285585;
        Thu, 14 Mar 2024 02:24:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710408285; cv=none;
        d=google.com; s=arc-20160816;
        b=lmgzD2FuPJdVS/xMueIZUvoULHBdxtkPeDHndrlgT0PNCqNe3KpPjq89r+dyAewYfE
         jyaNSpRL27PIQtuzDoX3+8ONwtFSDuxCskt42hPurLNxlnvmwQ2old16pdTUwkOenaat
         zlUAOfyXl+pwS5uzdmqVpewbD728pNAuvEbwQ1OUdyC2KqDpHBJp6goBsCy7E6VueUz6
         qt5zrzfqPyWCYLJyguIA7H7bXiTUtk6YlU0zqYkycYzq/80uOKuebNi8N0oFKrCO1pfC
         zm2+0PzdeSPWJbFVjLdFkALFGhUDlRhn9qjK0v3VIq6MXw8SAJfmaUbP6IdQLZNOSvhj
         Ut0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:in-reply-to:references
         :message-id:content-transfer-encoding:mime-version:subject:date:from;
        bh=vfeprfunQnpX58SAH5692t7TVgRlW3Qw1+ON516pdc8=;
        fh=LC/OdAGxp8XjCcxyMB5oH3DeKOnqJHpFVM0U3yCY+4A=;
        b=tbPlGWqGfFobkDj8c4PbsMxlPvNQn0l3e1qFEjMzEfUHIVnVFsqMgoV/WYZv7Wg6UJ
         sUTtHtb5hSLjqDyMoR1HnZ4n1AFYh8Wo8YhW7RGfwvABNfGUWcYcHaKVuZSaE7ZvQ1Cm
         kl/QAU3Tr/GkoQyHILDRHDTqSYU+kLGy7EJ8MJT4JG8G3mwEpf6Pp72Ard8s8rvdIJqT
         0Ym15llYoEl7K31jyIZdm1uikuJ4CaU91d50yA9ZhxWd0lxAgaU370YMd7bAWkxoa42/
         z+SPpLVGEoL7A/GrYcHpYNa0cyLyStUWU2lQkiM6Dx4rwZxbzVlF7NJR6GJh95+ngS7P
         3yhA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g17-20020ae9e111000000b0078829d939a2si1113004qkm.571.2024.03.14.02.24.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Mar 2024 02:24:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rkhJP-0004r7-F3; Thu, 14 Mar 2024 05:23:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1rkhJK-0004no-91; Thu, 14 Mar 2024 05:23:38 -0400
Received: from muminek.juszkiewicz.com.pl ([213.251.184.221])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1rkhJE-0007sM-M8; Thu, 14 Mar 2024 05:23:38 -0400
Received: from localhost (localhost [127.0.0.1])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id C47D4260C04;
 Thu, 14 Mar 2024 10:23:30 +0100 (CET)
X-Virus-Scanned: Debian amavis at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
 by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavis, port 10024)
 with ESMTP id p-4h9NrzBSnp; Thu, 14 Mar 2024 10:23:28 +0100 (CET)
Received: from [172.17.0.1] (83.11.22.169.ipv4.supernova.orange.pl
 [83.11.22.169])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 01F2D260AB8;
 Thu, 14 Mar 2024 10:23:27 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Date: Thu, 14 Mar 2024 10:23:24 +0100
Subject: [PATCH v2 1/4] tests/avocado: update sbsa-ref firmware
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240314-sbsa-ref-firmware-update-v2-1-b557c56559cd@linaro.org>
References: <20240314-sbsa-ref-firmware-update-v2-0-b557c56559cd@linaro.org>
In-Reply-To: <20240314-sbsa-ref-firmware-update-v2-0-b557c56559cd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Radoslaw Biernacki <rad@semihalf.com>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Leif Lindholm <quic_llindhol@quicinc.com>, Cleber Rosa <crosa@redhat.com>, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>, 
 Beraldo Leal <bleal@redhat.com>, Brad Smith <brad@comstyle.com>, 
 qemu-arm@nongnu.org, Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
X-Mailer: b4 0.12.3
Received-SPF: softfail client-ip=213.251.184.221;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=muminek.juszkiewicz.com.pl
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: hZRgl7SzONmQ

We now have CI job to build those and publish in space with
readable urls.

Firmware is built using Debian 'bookworm' cross toolchain (gcc 12.2.0).

Used versions:

- Trusted Firmware v2.10.2
- Tianocore EDK2 stable202402
- Tianocore EDK2 Platforms code commit 085c2fb

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 tests/avocado/machine_aarch64_sbsaref.py | 40 +++++++++++++++++---------------
 1 file changed, 21 insertions(+), 19 deletions(-)

diff --git a/tests/avocado/machine_aarch64_sbsaref.py b/tests/avocado/machine_aarch64_sbsaref.py
index 528c7d2934..cbab793455 100644
--- a/tests/avocado/machine_aarch64_sbsaref.py
+++ b/tests/avocado/machine_aarch64_sbsaref.py
@@ -1,6 +1,6 @@
 # Functional test that boots a Linux kernel and checks the console
 #
-# SPDX-FileCopyrightText: 2023 Linaro Ltd.
+# SPDX-FileCopyrightText: 2023-2024 Linaro Ltd.
 # SPDX-FileContributor: Philippe Mathieu-Daudé <philmd@linaro.org>
 # SPDX-FileContributor: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
 #
@@ -32,34 +32,36 @@ def fetch_firmware(self):
         """
         Flash volumes generated using:
 
-        - Fedora GNU Toolchain version 13.2.1 20230728 (Red Hat 13.2.1-1)
+        Toolchain from Debian:
+        aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0
 
-        - Trusted Firmware-A
-          https://github.com/ARM-software/arm-trusted-firmware/tree/7c3ff62d
+        Used components:
+
+        - Trusted Firmware 2.10.2
+        - Tianocore EDK2 stable202402
+        - Tianocore EDK2-platforms commit 085c2fb
 
-        - Tianocore EDK II
-          https://github.com/tianocore/edk2/tree/0f9283429dd4
-          https://github.com/tianocore/edk2/tree/ad1c0394b177
-          https://github.com/tianocore/edk2-platforms/tree/d03a60523a60
         """
 
         # Secure BootRom (TF-A code)
         fs0_xz_url = (
-            "https://fileserver.linaro.org/s/rE43RJyTfxPtBkc/"
-            "download/SBSA_FLASH0.fd.xz"
+            "https://artifacts.codelinaro.org/artifactory/linaro-419-sbsa-ref/"
+            "20240313-116475/edk2/SBSA_FLASH0.fd.xz"
         )
-        fs0_xz_hash = "cdb8e4ffdaaa79292b7b465693f9e5fae6b7062d"
-        tar_xz_path = self.fetch_asset(fs0_xz_url, asset_hash=fs0_xz_hash)
+        fs0_xz_hash = "637593749cc307dea7dc13265c32e5d020267552f22b18a31850b8429fc5e159"
+        tar_xz_path = self.fetch_asset(fs0_xz_url, asset_hash=fs0_xz_hash,
+                                      algorithm='sha256')
         archive.extract(tar_xz_path, self.workdir)
         fs0_path = os.path.join(self.workdir, "SBSA_FLASH0.fd")
 
         # Non-secure rom (UEFI and EFI variables)
         fs1_xz_url = (
-            "https://fileserver.linaro.org/s/AGWPDXbcqJTKS4R/"
-            "download/SBSA_FLASH1.fd.xz"
+            "https://artifacts.codelinaro.org/artifactory/linaro-419-sbsa-ref/"
+            "20240313-116475/edk2/SBSA_FLASH1.fd.xz"
         )
-        fs1_xz_hash = "411155ae6984334714dff08d5d628178e790c875"
-        tar_xz_path = self.fetch_asset(fs1_xz_url, asset_hash=fs1_xz_hash)
+        fs1_xz_hash = "cb0a5e8cf5e303c5d3dc106cfd5943ffe9714b86afddee7164c69ee1dd41991c"
+        tar_xz_path = self.fetch_asset(fs1_xz_url, asset_hash=fs1_xz_hash,
+                                      algorithm='sha256')
         archive.extract(tar_xz_path, self.workdir)
         fs1_path = os.path.join(self.workdir, "SBSA_FLASH1.fd")
 
@@ -96,15 +98,15 @@ def test_sbsaref_edk2_firmware(self):
 
         # AP Trusted ROM
         wait_for_console_pattern(self, "Booting Trusted Firmware")
-        wait_for_console_pattern(self, "BL1: v2.9(release):v2.9")
+        wait_for_console_pattern(self, "BL1: v2.10.2(release):")
         wait_for_console_pattern(self, "BL1: Booting BL2")
 
         # Trusted Boot Firmware
-        wait_for_console_pattern(self, "BL2: v2.9(release)")
+        wait_for_console_pattern(self, "BL2: v2.10.2(release)")
         wait_for_console_pattern(self, "Booting BL31")
 
         # EL3 Runtime Software
-        wait_for_console_pattern(self, "BL31: v2.9(release)")
+        wait_for_console_pattern(self, "BL31: v2.10.2(release)")
 
         # Non-trusted Firmware
         wait_for_console_pattern(self, "UEFI firmware (version 1.0")

-- 
2.44.0


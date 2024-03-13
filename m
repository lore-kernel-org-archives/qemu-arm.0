Received: by 2002:a17:907:991a:b0:a45:b507:d90a with SMTP id ka26csp2354725ejc;
        Wed, 13 Mar 2024 03:10:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVm6dpspb21XgKW5eH1wy7Y9rc6JV2bURz8fDT3t+nAosbsiEkOCkfI+4ph/cXKpTlInGjEBIP3uNGJg7aKA6myXUh/3XBT
X-Google-Smtp-Source: AGHT+IGPUJI7JFSS2dAgBJHsUm53+J/Jkr/qK2EWsWYqUmdILpEUwAf/prBuMc/Z1QkwhSKsTO84
X-Received: by 2002:ae9:e719:0:b0:788:31b3:8270 with SMTP id m25-20020ae9e719000000b0078831b38270mr13015994qka.33.1710324604731;
        Wed, 13 Mar 2024 03:10:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710324604; cv=none;
        d=google.com; s=arc-20160816;
        b=cjhsAGM7QWV+y5sfbAkz+yc0F29znwC86h3UqRq07Z+tkXnib0uyqfVawn1wbsz6pK
         KiEvGKjyG808uY8QnuirEsfPGJGrdk6Qg5rxmiSaPz2vIwN+4jWKb77jMN2Fzoc8d+rz
         X1HrnvsweWCySCDCpiQvL/z7vYPwXZhYGgir5hq7oBEWXzY48LjPTaQZq7nwU1SM4aNL
         F26nbkyazUpQF63RziV5NQSoZcfycJNh7OnH9BhlAKnlppuBtpwHZbTsPDFkV0x8JCqO
         e2//O2mDydyzNhTdAvxc5grmjNoeZX9bJvwjKsZJTr0hdl//JyecndxMVcWvxXtp76Qk
         2CfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:in-reply-to:references
         :message-id:content-transfer-encoding:mime-version:subject:date:from;
        bh=vfeprfunQnpX58SAH5692t7TVgRlW3Qw1+ON516pdc8=;
        fh=LC/OdAGxp8XjCcxyMB5oH3DeKOnqJHpFVM0U3yCY+4A=;
        b=YNHOX5paqrH61ZCBdHAopuaoH/yHC6++/lJV4CJNtsjFpdkSRbG14MUc1awCjLDt35
         5o3TGnHK3glSbhVMMO6clihE3nFisV9YgA5rfGTB2A/Os9xhqif/Mei2JaX1GvFYeabL
         nLRtu1a/Za36L4A4PsmQA6kQh7IsNHUAX3pb0e/eYulk9+RM7lRCF2ub0FjGNe1F80yv
         7ANdH6U2EA4L7gygBbjmoJhtCcQ6HzeBku3KSPgqqPZwBYHuVs/JuT60UVROd5AYEyt3
         E3N7fT/YzmdYgE8JYAzXCpgTZ36qdQqc4acjbGd0b/6lfsS4yG4cohH0rDb6bI5/VxaB
         XZHA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w19-20020a05620a445300b00788419966f1si840524qkp.760.2024.03.13.03.10.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Mar 2024 03:10:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rkLXQ-0001qq-R4; Wed, 13 Mar 2024 06:08:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1rkLXH-0001ps-Hw; Wed, 13 Mar 2024 06:08:37 -0400
Received: from muminek.juszkiewicz.com.pl ([213.251.184.221])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1rkLXD-0006UR-Qm; Wed, 13 Mar 2024 06:08:34 -0400
Received: from localhost (localhost [127.0.0.1])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id C5B89260BCF;
 Wed, 13 Mar 2024 11:08:24 +0100 (CET)
X-Virus-Scanned: Debian amavis at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
 by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavis, port 10024)
 with ESMTP id ncO6xp2Temm6; Wed, 13 Mar 2024 11:08:22 +0100 (CET)
Received: from [172.17.0.1] (83.11.22.169.ipv4.supernova.orange.pl
 [83.11.22.169])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id BB087260AB8;
 Wed, 13 Mar 2024 11:08:21 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Date: Wed, 13 Mar 2024 11:08:19 +0100
Subject: [PATCH 1/3] tests/avocado: update sbsa-ref firmware
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240313-sbsa-ref-firmware-update-v1-1-e166703c5424@linaro.org>
References: <20240313-sbsa-ref-firmware-update-v1-0-e166703c5424@linaro.org>
In-Reply-To: <20240313-sbsa-ref-firmware-update-v1-0-e166703c5424@linaro.org>
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
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: bMDWliHlKMmO

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


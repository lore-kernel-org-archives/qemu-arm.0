Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp472002njc;
        Mon, 24 Jun 2024 09:21:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWM8CmcCr8WkGASgcz872Na4FZ8ErkOtNQV+xOCfsJEUMQlVkoZk7IN7poAgluktLAN5c3AGa3ST3qoREavaUQpPstoBaCJ
X-Google-Smtp-Source: AGHT+IFY1FsOllI0eswIraHYtlPRixMiTS6Y4vrev9lmV+5WMEaruMRMPotSXzUYYAQqdlG/Air6
X-Received: by 2002:a05:620a:28d0:b0:795:5f86:6e2b with SMTP id af79cd13be357-79be6eff6dbmr591174885a.42.1719246104259;
        Mon, 24 Jun 2024 09:21:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719246104; cv=none;
        d=google.com; s=arc-20160816;
        b=ONtQ+2c0nT14KhyyZ30OVhr8W17T1Kw/SQHCKjc5Y+UMNJ59v0XAIxkTlwPxEHpGqA
         zmcaPnjKluiGYN+nXWy/RZa5M0f6eGrIFKlyMp9XqVqUm94FLB2k0R3aHO58Pz1Mgus3
         ZgWGqo+5pswkqFom7fqdNJOtCpIzWygPTEEk8DFn+CDYZQsa7y6v8LFxgdb1nfo2ZABm
         3nvn/d+zSIfzLL2YTOR57EPydj358pMmDOYogxQ1QXsFR2alKnPLIOl27SxJ2mNp0hwN
         7PTTBz1pJBC6+jovElIej5ALWPFUoBtzk315RbHIskGjavxr5SXHL/nHfDAZRGpbl7Ye
         +7pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:in-reply-to:references
         :message-id:content-transfer-encoding:mime-version:subject:date:from;
        bh=mAmKJrbRPSG1UFYFfYa/xV/POnJjM3koaMSiwhbNnsk=;
        fh=2XNni5tFqqNsYuVOJGxzVTMSzHzZnaSMOOPrr5cXMU4=;
        b=VNGpUPkWJhpaKR7UElW5EfsivxoXHftsujnC5hH9joboUVVkZO95cvgFBppfRhNHb2
         hzfaYoFIiB3o7Vup4fSAX4+V3gvTti5DGnfNo3IIzJA84AnPuXQp7CwEbfumQgAraDL2
         JsJXtjP/XL6hpd0BVZ7DTlUU11QMT11wUarfaurz00r+y0R7mKvJX4MnjFqU421l/50B
         3Fh/pG3FBjdX68PzLTmkewlli0PQXld4ccmciK71sjlm0cStAjdq325+lp1m8TxNrb75
         YXkSywZ3zJmu2tqz6nWvqrXI7d/rGsQ6dnPHwZD3A/2aSee/jnWER1NYnF0K4EELto5E
         YwBA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79bce881c89si887458585a.13.2024.06.24.09.21.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Jun 2024 09:21:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sLmRF-0000Fh-JI; Mon, 24 Jun 2024 12:21:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1sLmRD-0000FA-Ro; Mon, 24 Jun 2024 12:21:04 -0400
Received: from muminek.juszkiewicz.com.pl ([213.251.184.221])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1sLmRB-00023T-8H; Mon, 24 Jun 2024 12:21:03 -0400
Received: from localhost (localhost [127.0.0.1])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id 8A4F126071B;
 Mon, 24 Jun 2024 18:20:57 +0200 (CEST)
X-Virus-Scanned: Debian amavis at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
 by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavis, port 10024)
 with ESMTP id NPAEIO_mzgcV; Mon, 24 Jun 2024 18:20:55 +0200 (CEST)
Received: from applejack.lan (83.11.22.244.ipv4.supernova.orange.pl
 [83.11.22.244])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 0C348261A96;
 Mon, 24 Jun 2024 18:20:54 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Date: Mon, 24 Jun 2024 18:20:44 +0200
Subject: [PATCH v3 2/2] tests/avocado: add test for default sbsa-ref cpu
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240624-b4-move-to-freebsd-v3-2-71496bf119d4@linaro.org>
References: <20240624-b4-move-to-freebsd-v3-0-71496bf119d4@linaro.org>
In-Reply-To: <20240624-b4-move-to-freebsd-v3-0-71496bf119d4@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Leif Lindholm <quic_llindhol@quicinc.com>, 
 Radoslaw Biernacki <rad@semihalf.com>, 
 Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>, 
 Beraldo Leal <bleal@redhat.com>, 
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
X-Mailer: b4 0.13.0
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: h/AsGQnO1G77

We changed sbsa-ref cpu several times already and may do it again in a
future. To newer core or to enable/disable some properties.

This change switches Neoverse-N2 tests to 'let test default cpu' ones.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 tests/avocado/machine_aarch64_sbsaref.py | 29 ++++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/tests/avocado/machine_aarch64_sbsaref.py b/tests/avocado/machine_aarch64_sbsaref.py
index bb2c098aac..43bb1860e0 100644
--- a/tests/avocado/machine_aarch64_sbsaref.py
+++ b/tests/avocado/machine_aarch64_sbsaref.py
@@ -115,7 +115,7 @@ def test_sbsaref_edk2_firmware(self):
     # This tests the whole boot chain from EFI to Userspace
     # We only boot a whole OS for the current top level CPU and GIC
     # Other test profiles should use more minimal boots
-    def boot_alpine_linux(self, cpu):
+    def boot_alpine_linux(self, cpu=False):
         self.fetch_firmware()
 
         iso_url = (
@@ -128,12 +128,14 @@ def boot_alpine_linux(self, cpu):
 
         self.vm.set_console()
         self.vm.add_args(
-            "-cpu",
-            cpu,
             "-drive",
             f"file={iso_path},format=raw",
         )
 
+        # let allow test which will use default cpu of platform
+        if cpu:
+            self.vm.add_args("-cpu", cpu)
+
         self.vm.launch()
         wait_for_console_pattern(self, "Welcome to Alpine Linux 3.17")
 
@@ -144,12 +146,12 @@ def test_sbsaref_alpine_linux_cortex_a57(self):
         """
         self.boot_alpine_linux("cortex-a57")
 
-    def test_sbsaref_alpine_linux_neoverse_n1(self):
+    # Let test whichever cpu is used as default
+    def test_sbsaref_alpine_linux_default(self):
         """
-        :avocado: tags=cpu:neoverse-n1
         :avocado: tags=os:linux
         """
-        self.boot_alpine_linux("neoverse-n1")
+        self.boot_alpine_linux()
 
     def test_sbsaref_alpine_linux_max_pauth_off(self):
         """
@@ -214,7 +216,7 @@ def test_sbsaref_openbsd73_cortex_a57(self):
     # This tests the whole boot chain from EFI to Userspace
     # We only boot a whole OS for the current top level CPU and GIC
     # Other test profiles should use more minimal boots
-    def boot_freebsd(self, cpu):
+    def boot_freebsd(self, cpu=False):
         self.fetch_firmware()
 
         img_url = (
@@ -227,12 +229,14 @@ def boot_freebsd(self, cpu):
 
         self.vm.set_console()
         self.vm.add_args(
-            "-cpu",
-            cpu,
             "-drive",
             f"file={img_path},format=raw",
         )
 
+        # let allow test which will use default cpu of platform
+        if cpu:
+            self.vm.add_args("-cpu", cpu)
+
         self.vm.launch()
         wait_for_console_pattern(self, "Welcome to FreeBSD!")
 
@@ -243,13 +247,12 @@ def test_sbsaref_freebsd_cortex_a57(self):
         """
         self.boot_freebsd("cortex-a57")
 
-    # We use Neoverse-N2 as default cpu
-    def test_sbsaref_freebsd_neoverse_n2(self):
+    # Let test whichever cpu is used as default
+    def test_sbsaref_freebsd_default(self):
         """
-        :avocado: tags=cpu:neoverse-n2
         :avocado: tags=os:freebsd
         """
-        self.boot_freebsd("neoverse-n2")
+        self.boot_freebsd()
 
     def test_sbsaref_freebsd_max_pauth_off(self):
         """

-- 
2.45.2


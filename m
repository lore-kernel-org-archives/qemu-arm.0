Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp426855njc;
        Mon, 24 Jun 2024 06:19:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVYu4bwN1XeQ4oRMBhp/iyKPDbNRqzCg1il5m5rJ0sPf+dsjXSNoCGYzbEfe3pt9Xm5afsW7RUz5GhqIp3TOkmbboFZPkSG
X-Google-Smtp-Source: AGHT+IECbWTL6ibFPcxGrBkFDVnMJ9V7jDeR5XBg7Te9XOCe/KR2SDhh1C5DlY1QtrB0jMj5+O8u
X-Received: by 2002:a05:620a:1983:b0:795:3cff:3b01 with SMTP id af79cd13be357-79be6f23e1amr668298385a.68.1719235179356;
        Mon, 24 Jun 2024 06:19:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719235179; cv=none;
        d=google.com; s=arc-20160816;
        b=0QDQBAnW1QEXZYopcqFORE0BIOn1iLAUjaA0gg62hvTxkt21RuswCLiuHHJnUJwhjv
         iMIrUKSiTNNs0rwvCW5No/I9G10WEgfHEG3apWSAzpNmk5xeCdrjE/WHAa7BDIMxSUbx
         M9MDv/T1I90K33zYHPEv9Is8tO+qdpBLDgAGV078C0w2xS27MecGxpZTomiDGB+iXhyV
         kYFXmng/ogwq8cxqyEiUc9tO+BJ98fiD55DmoeDgPfeXCJ+PoWVkiM/v1s9/BDBQ/Yde
         5PnrA3SoMvg2UvDL7nYljn33JNgciMtrqh9JwmFO494qOL9qqW1AiboqzjLBVntvQHix
         qGdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:in-reply-to:references
         :message-id:content-transfer-encoding:mime-version:subject:date:from;
        bh=djrg/t59ErLFlD4Qo4KkokKu0OyywkOUAaQMISHZYWE=;
        fh=2XNni5tFqqNsYuVOJGxzVTMSzHzZnaSMOOPrr5cXMU4=;
        b=jQHPsTDT3pWA8wGPH32w/FHU2Fx5UKU9m7UjGmujh2Q/VmDymQD4TebABwKMQJ43RE
         IB3On6hS4YchLAkhqA2xA0eVPZYGrAYFS9OkgiC5oXv/ZyjxIa20GQ/uHUapp1q65Zbb
         k4mp9IAgwRLY4LrF0AP+hSzqtJboBUejWz3m4Md51O6G15i/o24eXePMGh4KTCGw+Nti
         75BajOo+twRib0lzq4eS3Q0DLmB1a8c9RhJVXYtmMYlgl/bXwlvHfaSM4W1NkrTWDQ5F
         kBst2S0SJWMiv4OZbcFzIks4jSwI6PhUk5tt3x4U4nD8jvotEBN7cVvHiplToTFuRCzu
         CZWw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79be5098d77si448673685a.758.2024.06.24.06.19.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Jun 2024 06:19:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sLjWt-0001Ii-Ec; Mon, 24 Jun 2024 09:14:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1sLjWr-0001Hb-Vn; Mon, 24 Jun 2024 09:14:42 -0400
Received: from muminek.juszkiewicz.com.pl ([213.251.184.221])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1sLjWq-0004sc-AX; Mon, 24 Jun 2024 09:14:41 -0400
Received: from localhost (localhost [127.0.0.1])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id 3F5D8261A90;
 Mon, 24 Jun 2024 15:14:38 +0200 (CEST)
X-Virus-Scanned: Debian amavis at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
 by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavis, port 10024)
 with ESMTP id RknKwESWfuaG; Mon, 24 Jun 2024 15:14:36 +0200 (CEST)
Received: from applejack.lan (83.11.22.244.ipv4.supernova.orange.pl
 [83.11.22.244])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 76FAC261A96;
 Mon, 24 Jun 2024 15:14:34 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Date: Mon, 24 Jun 2024 15:14:23 +0200
Subject: [PATCH v2 2/2] tests/avocado: add test for default sbsa-ref cpu
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240624-b4-move-to-freebsd-v2-2-64ea7b04998f@linaro.org>
References: <20240624-b4-move-to-freebsd-v2-0-64ea7b04998f@linaro.org>
In-Reply-To: <20240624-b4-move-to-freebsd-v2-0-64ea7b04998f@linaro.org>
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
X-TUID: LNKjT+sYNWdp

We changed sbsa-ref cpu several times already and may do it again in a
future. To newer core or to enable/disable some properties.

This change switches Neoverse-N2 tests to 'let test default cpu' ones.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 tests/avocado/machine_aarch64_sbsaref.py | 29 ++++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/tests/avocado/machine_aarch64_sbsaref.py b/tests/avocado/machine_aarch64_sbsaref.py
index d52f89f756..0e96e7ea16 100644
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
@@ -178,7 +180,7 @@ def test_sbsaref_alpine_linux_max(self):
     # This tests the whole boot chain from EFI to Userspace
     # We only boot a whole OS for the current top level CPU and GIC
     # Other test profiles should use more minimal boots
-    def boot_freebsd(self, cpu):
+    def boot_freebsd(self, cpu=False):
         self.fetch_firmware()
 
         img_url = (
@@ -191,12 +193,14 @@ def boot_freebsd(self, cpu):
 
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
 
@@ -207,13 +211,12 @@ def test_sbsaref_freebsd_cortex_a57(self):
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


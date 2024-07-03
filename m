Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp2618782njm;
        Wed, 3 Jul 2024 07:07:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVGnlnjs97OwfrcozSvggi7O99aTcPaC+MYbvVQ+2lD1TXooyxITkC5xlmaMJTpDWg2g6a4LYNdJS7IbZWwSwrE0lFiCn/w
X-Google-Smtp-Source: AGHT+IFyxzzNqpVMp3a8PXxUdJO/NJoLHQaujEZB2Mz7yRhErA/9LIN0bUzh6YyNJ9vil94UR+mG
X-Received: by 2002:a05:6808:23c1:b0:3d5:64be:890c with SMTP id 5614622812f47-3d6b30f528bmr15120200b6e.17.1720015634707;
        Wed, 03 Jul 2024 07:07:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720015634; cv=none;
        d=google.com; s=arc-20160816;
        b=NTcLzl91pp6vN7XB7ltAhkCStXAreZCfXfT1Vpe8ueJz+9a6wYq3StVAZHEBAEFxjE
         leHGDbLJ+PH9kaMJFmYpVZ3mL/hL4NoL0ipbVQDJZ+TetBJWa3SrLr0RWS/hvMB1/hz2
         KVj9QPuEvtng6c0kDg/PU50iQWaYIg5HZcWUUrFVpDgkFK5lf5x0kEb4OMbduhPs3vXd
         WNKqZR9xIF10ArSX+LWwLEwhtAQs4ghpGxPAhfkYvBu2h29ZuBmDO0hPamJPGYagX8oA
         HncAFFUoF719CZKjsM3cISd1N9Vn65HcE11jZSMFgoXRDksVShn4aWF7w75ZaZe4N9ec
         V8uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:in-reply-to:references
         :message-id:content-transfer-encoding:mime-version:subject:date:from;
        bh=d9lmNbx2IXLwtRlzxN/3vizsqgCNWrrZTSu0AL+B/NU=;
        fh=2XNni5tFqqNsYuVOJGxzVTMSzHzZnaSMOOPrr5cXMU4=;
        b=HzRfeYadcubUOpYCZ6Wc2oWVKJGdbXpwdVnqA3NTOmO8k/ibpyzT0bxmFymJRMRbJh
         rOWZxgJJs6riXnG10O8KmNxdsbyoXOiweIJLke10sF4OU5dviWj70iQHT2PluvQd5glu
         lneIEsdli7qAeuvXassk6ZAe+dw8jUvfOnCvNPRMWTrnFKe9aiC16ktEiP1rxpdeMKxN
         R1FJcaRvETaRYBmLO19vxZLqqxJt+JmjyDIE3zM1v3RKgl6FCZ6KEy+tTwPg1HQN8119
         BPComT9KkljTxviM/g/bcrP/DhOyzrXGYROZW8+t5s1J733IAfrWgoQ490s+1q0gDU/s
         XUXA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-8102321b6c2si80016241.66.2024.07.03.07.07.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Jul 2024 07:07:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sP0dV-0001oX-BE; Wed, 03 Jul 2024 10:07:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1sP0dL-0001mT-TY; Wed, 03 Jul 2024 10:06:57 -0400
Received: from muminek.juszkiewicz.com.pl ([213.251.184.221])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1sP0d1-0008R5-1s; Wed, 03 Jul 2024 10:06:53 -0400
Received: from localhost (localhost [127.0.0.1])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id 367D2260757;
 Wed,  3 Jul 2024 16:06:31 +0200 (CEST)
X-Virus-Scanned: Debian amavis at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
 by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavis, port 10024)
 with ESMTP id v8R6mgUZh_py; Wed,  3 Jul 2024 16:06:29 +0200 (CEST)
Received: from applejack.lan (83.8.74.165.ipv4.supernova.orange.pl
 [83.8.74.165])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 6FD07260841;
 Wed,  3 Jul 2024 16:06:27 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Date: Wed, 03 Jul 2024 16:06:12 +0200
Subject: [PATCH v4 2/2] tests/avocado: add test for default sbsa-ref cpu
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-b4-move-to-freebsd-v4-2-07191f958530@linaro.org>
References: <20240703-b4-move-to-freebsd-v4-0-07191f958530@linaro.org>
In-Reply-To: <20240703-b4-move-to-freebsd-v4-0-07191f958530@linaro.org>
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
X-TUID: z5c9wpX4QYaB

We changed sbsa-ref cpu several times already and may do it again in a
future. To newer core or to enable/disable some properties.

This change switches Neoverse-N2 tests to 'let test default cpu' ones.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 tests/avocado/machine_aarch64_sbsaref.py | 29 ++++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/tests/avocado/machine_aarch64_sbsaref.py b/tests/avocado/machine_aarch64_sbsaref.py
index 2e27d37cb8..46a1d982f3 100644
--- a/tests/avocado/machine_aarch64_sbsaref.py
+++ b/tests/avocado/machine_aarch64_sbsaref.py
@@ -113,7 +113,7 @@ def test_sbsaref_edk2_firmware(self):
     # This tests the whole boot chain from EFI to Userspace
     # We only boot a whole OS for the current top level CPU and GIC
     # Other test profiles should use more minimal boots
-    def boot_alpine_linux(self, cpu):
+    def boot_alpine_linux(self, cpu=False):
         self.fetch_firmware()
 
         iso_url = (
@@ -126,12 +126,14 @@ def boot_alpine_linux(self, cpu):
 
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
 
@@ -142,12 +144,12 @@ def test_sbsaref_alpine_linux_cortex_a57(self):
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
@@ -212,7 +214,7 @@ def test_sbsaref_openbsd73_cortex_a57(self):
     # This tests the whole boot chain from EFI to Userspace
     # We only boot a whole OS for the current top level CPU and GIC
     # Other test profiles should use more minimal boots
-    def boot_freebsd(self, cpu):
+    def boot_freebsd(self, cpu=False):
         self.fetch_firmware()
 
         img_url = (
@@ -225,12 +227,14 @@ def boot_freebsd(self, cpu):
 
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
 
@@ -241,13 +245,12 @@ def test_sbsaref_freebsd_cortex_a57(self):
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


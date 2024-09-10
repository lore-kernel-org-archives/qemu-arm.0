Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp1208649njb;
        Tue, 10 Sep 2024 02:48:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXVpzcZfVLTs4jIE7UK5kWs8cXnhNI5wY3AZMfGiKkIrpi6xp2mwaSXNd4wiOVk4b9ekyj3g9R5STwUuw==@linaro.org
X-Google-Smtp-Source: AGHT+IHO99otxEGV8DurDpZszoBLpf1a1qLGlcb7NqssL/t6MX7RDcvth5q9oskQRBar7H+85oEi
X-Received: by 2002:a05:6214:4389:b0:6c3:6712:ded8 with SMTP id 6a1803df08f44-6c532410c9fmr126728466d6.25.1725961735496;
        Tue, 10 Sep 2024 02:48:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725961735; cv=none;
        d=google.com; s=arc-20240605;
        b=Ms3wqDAB+OshEk7MOcj2JmCC7WxspscDCb1wpvlZaqjDDT79z9hWuRjNc9UjlJH7w1
         aEskiRZS/LlUJCNr/Kgf7GENl/wduOudNJZz3Gwyftu1ejbNL1xGhe+nm+rNiTa1/Zsw
         gyNY4qzUMvc23My4JA/WLZuUU34rWq6Bpq0Qu9UmVyXc5q6xE96271JDS7EFroFdHwl4
         uqRUv1UfLyQ0qqXHwilRByfmdrvXBrDm7f3/cz3I8AUoYgTf5vF2kGP/3HoGE7X8vwz/
         ReLWMiQSV1BjtuZQ9fMbORFZyN/Bp6/dX/cPnS5/fs7lY+cF2DIOv0yxbAVWji5gx+1Y
         dbHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:in-reply-to:references
         :message-id:content-transfer-encoding:mime-version:subject:date:from;
        bh=l6ZQE5ZWtT7OXRfOnOCNpDXHWa4sj8xB7xQMOguStzs=;
        fh=2XNni5tFqqNsYuVOJGxzVTMSzHzZnaSMOOPrr5cXMU4=;
        b=WGM7NXls+YHeQap8UXg8q+tufQikVpDXfI8ahGEmuYL2j+HRNjcXImdPLZwTfnHNpV
         756R+EuIgIS8RNSX2DkNLak8DGVUDgJk2Wzx+ErMeJ5zeYYDMFz+koP22m8MnjvqVmXB
         l92vcN2iAYGGSVSAM6ChRXPG/5mZLYXtt58kjJ5Kgd1CxIXlMXEPKF07X0SJnH9j7ret
         Yt5TWvZNoTF2wI+UeZl3oE9+nIa3A0bogpbqNkxxPfWHtSorEQC0h8egHxQI9pP81SPX
         48bQ3HbV6oUmc5FPSoDb0VE1U/D994m6I/4MQm/6Qor3r7MSrJy/oG+OF0u+cdMBAXBc
         tGdw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c534330118si74011716d6.8.2024.09.10.02.48.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Sep 2024 02:48:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1snxUD-0006W0-Ny; Tue, 10 Sep 2024 05:48:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1snxUB-0006TU-NS; Tue, 10 Sep 2024 05:48:35 -0400
Received: from muminek.juszkiewicz.com.pl ([213.251.184.221])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1snxU9-0000M8-TU; Tue, 10 Sep 2024 05:48:35 -0400
Received: from localhost (localhost [127.0.0.1])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id 7D7422602C9;
 Tue, 10 Sep 2024 11:48:31 +0200 (CEST)
X-Virus-Scanned: Debian amavis at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
 by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavis, port 10024)
 with ESMTP id gcrsLz_4zubZ; Tue, 10 Sep 2024 11:48:29 +0200 (CEST)
Received: from applejack.lan (83.11.24.101.ipv4.supernova.orange.pl
 [83.11.24.101])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id C4026260898;
 Tue, 10 Sep 2024 11:48:28 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Date: Tue, 10 Sep 2024 11:48:08 +0200
Subject: [PATCH v5 1/4] tests: use default cpu for aarch64/sbsa-ref
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240910-b4-move-to-freebsd-v5-1-0fb66d803c93@linaro.org>
References: <20240910-b4-move-to-freebsd-v5-0-0fb66d803c93@linaro.org>
In-Reply-To: <20240910-b4-move-to-freebsd-v5-0-0fb66d803c93@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Leif Lindholm <quic_llindhol@quicinc.com>, 
 Radoslaw Biernacki <rad@semihalf.com>, 
 Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>, 
 Beraldo Leal <bleal@redhat.com>, 
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
X-Mailer: b4 0.14.0
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
X-TUID: PR18GcpyVnTw

We want to run tests using default cpu without having to remember which
Arm core is it.

Change Neoverse-N1 (old default) test to use default cpu (Neoverse-N2 at
the moment).

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 tests/functional/test_aarch64_sbsaref.py | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/tests/functional/test_aarch64_sbsaref.py b/tests/functional/test_aarch64_sbsaref.py
index f31c2a60b6..528882f4fa 100755
--- a/tests/functional/test_aarch64_sbsaref.py
+++ b/tests/functional/test_aarch64_sbsaref.py
@@ -110,16 +110,17 @@ def test_sbsaref_edk2_firmware(self):
     # This tests the whole boot chain from EFI to Userspace
     # We only boot a whole OS for the current top level CPU and GIC
     # Other test profiles should use more minimal boots
-    def boot_alpine_linux(self, cpu):
+    def boot_alpine_linux(self, cpu=None):
         self.fetch_firmware()
 
         iso_path = self.ASSET_ALPINE_ISO.fetch()
 
         self.vm.set_console()
         self.vm.add_args(
-            "-cpu", cpu,
             "-drive", f"file={iso_path},media=cdrom,format=raw",
         )
+        if cpu:
+            self.vm.add_args("-cpu", cpu)
 
         self.vm.launch()
         wait_for_console_pattern(self, "Welcome to Alpine Linux 3.17")
@@ -127,8 +128,8 @@ def boot_alpine_linux(self, cpu):
     def test_sbsaref_alpine_linux_cortex_a57(self):
         self.boot_alpine_linux("cortex-a57")
 
-    def test_sbsaref_alpine_linux_neoverse_n1(self):
-        self.boot_alpine_linux("neoverse-n1")
+    def test_sbsaref_alpine_linux_default_cpu(self):
+        self.boot_alpine_linux()
 
     def test_sbsaref_alpine_linux_max_pauth_off(self):
         self.boot_alpine_linux("max,pauth=off")
@@ -148,16 +149,17 @@ def test_sbsaref_alpine_linux_max(self):
     # This tests the whole boot chain from EFI to Userspace
     # We only boot a whole OS for the current top level CPU and GIC
     # Other test profiles should use more minimal boots
-    def boot_openbsd73(self, cpu):
+    def boot_openbsd73(self, cpu=None):
         self.fetch_firmware()
 
         img_path = self.ASSET_OPENBSD_ISO.fetch()
 
         self.vm.set_console()
         self.vm.add_args(
-            "-cpu", cpu,
             "-drive", f"file={img_path},format=raw,snapshot=on",
         )
+        if cpu:
+            self.vm.add_args("-cpu", cpu)
 
         self.vm.launch()
         wait_for_console_pattern(self,
@@ -167,8 +169,8 @@ def boot_openbsd73(self, cpu):
     def test_sbsaref_openbsd73_cortex_a57(self):
         self.boot_openbsd73("cortex-a57")
 
-    def test_sbsaref_openbsd73_neoverse_n1(self):
-        self.boot_openbsd73("neoverse-n1")
+    def test_sbsaref_openbsd73_default_cpu(self):
+        self.boot_openbsd73()
 
     def test_sbsaref_openbsd73_max_pauth_off(self):
         self.boot_openbsd73("max,pauth=off")

-- 
2.46.0


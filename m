Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp1252355ejb;
        Thu, 23 May 2024 11:40:20 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVAIYyNSeUbSeRrvzdA6922reKDQjbbsto+ZyvS8sPcpGRe1h+UoYzXUnS6kXXPuTggd1PkzEDXPbwrFmG21L8Zbmfs+AHC
X-Google-Smtp-Source: AGHT+IE9GQb6rTbwmMnmGpPmqvIVrWqV76M62vdqvKGWtytJPW++NCKuEInv5+dyTnEYDkYqfSUn
X-Received: by 2002:a05:6214:4906:b0:699:2527:9843 with SMTP id 6a1803df08f44-6ab9cfbeaecmr5950346d6.5.1716489619354;
        Thu, 23 May 2024 11:40:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716489619; cv=none;
        d=google.com; s=arc-20160816;
        b=ouhmRDXlpfUK2/6I4Ef81AzlH+O4CYoQ292Varl+RRoMTAL4IkUIrE5B9vLYK9vFnX
         EIm9WT8z0tkxfJ4obEmvoLRYTFNyh12ZpHMK7rTCgFkFd0LcyETXPf02CkYHOAt9T/qj
         ZjxSBM7EDEbppWAdgF3sTsdOsd+bpjN7zYQM9DlZpf1YsZxIXJht+DMSQytBgOP+cGWs
         1O4hkqvNmD/TW7ohdGYSuc5puL6BTXtQzEB7BLnDNoh5bpPtRGhYgNUcdwlzPkmjiq+L
         Cu0XX+uuxFZ592MbvcwLdvVSKLkLW4um1JG4vKErnrmQHBaMAEVr0t8Pop4HkTLrRNp/
         rEpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=y5XibOqOMNe3XU6ux9h9EPny+xV3ibS+ortdNyF81Xg=;
        fh=kGEUbcpfczmHbBv93vIgVjJmfNdasE35Y2LTlqofWu8=;
        b=XpALY2Wb8hiGhbTIQlXudilJfC6yhv0Ydg31Wq9PSOBC57YQybY279ql6nrlfaJv73
         XI3yuOOHgPFCBT3k42xzPY8BiP9IgG+sc5Wt1/h7ZO23XM/WPR0OgzK3S/49w3Xx9k9k
         leFe5XiqtlzWGBuomsli61+tGkM6f7FqQ9b2Xs+BOAh2QwMk4xWGRfIBKBhueLABDT5V
         9F8vjgkAHrjXypooEmbGoBWvtcC3bjQBG3g1zSQQv3xLRTCtR05tnsoAbymqowEjoOqH
         Fpc8wDqYWrg6+ea766RCTV+7xFmpH+Ok8zjgdBOmAf29BLFotoaMz/Up164grkoObgUk
         7Oeg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6ab92484659si20917516d6.257.2024.05.23.11.40.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 May 2024 11:40:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sADLy-0005Mr-5r; Thu, 23 May 2024 14:39:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1sADLw-0005M5-5z; Thu, 23 May 2024 14:39:48 -0400
Received: from muminek.juszkiewicz.com.pl ([213.251.184.221])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1sADLu-0006U4-9D; Thu, 23 May 2024 14:39:47 -0400
Received: from localhost (localhost [127.0.0.1])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id 90335260CC8;
 Thu, 23 May 2024 20:39:41 +0200 (CEST)
X-Virus-Scanned: Debian amavis at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
 by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavis, port 10024)
 with ESMTP id DPU9NPduMJWQ; Thu, 23 May 2024 20:39:39 +0200 (CEST)
Received: from applejack.lan (83.11.37.15.ipv4.supernova.orange.pl
 [83.11.37.15])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 1D0C326073E;
 Thu, 23 May 2024 20:39:38 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Leif Lindholm <quic_llindhol@quicinc.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Subject: [PATCH 1/1] tests/avocado: sbsa-ref: switch from OpenBSD to FreeBSD
Date: Thu, 23 May 2024 20:39:28 +0200
Message-ID: <20240523183928.37809-1-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Type: text/plain; charset=true
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 4icFHPQR8bhu

FreeBSD has longer support cycle for stable release (14.x EoL in 2028)
than OpenBSD (7.3 we used is already EoL). Also bugfixes are backported
so we can stay on 14.x for longer.

Planned to upgrade to newer OpenBSD but we would have to wait for 7.6
release to get Neoverse-V1/N2 support.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 tests/avocado/machine_aarch64_sbsaref.py | 65 ++++++++++++++++--------
 1 file changed, 43 insertions(+), 22 deletions(-)

diff --git a/tests/avocado/machine_aarch64_sbsaref.py b/tests/avocado/machine_aarch64_sbsaref.py
index 98c76c1ff7..c3c7c0e639 100644
--- a/tests/avocado/machine_aarch64_sbsaref.py
+++ b/tests/avocado/machine_aarch64_sbsaref.py
@@ -1,4 +1,4 @@
-# Functional test that boots a Linux kernel and checks the console
+# Functional test that boots a kernel and checks the console
 #
 # SPDX-FileCopyrightText: 2023-2024 Linaro Ltd.
 # SPDX-FileContributor: Philippe Mathieu-Daudé <philmd@linaro.org>
@@ -177,14 +177,14 @@ def test_sbsaref_alpine_linux_max(self):
     # This tests the whole boot chain from EFI to Userspace
     # We only boot a whole OS for the current top level CPU and GIC
     # Other test profiles should use more minimal boots
-    def boot_openbsd73(self, cpu):
+    def boot_freebsd14(self, cpu):
         self.fetch_firmware()
 
         img_url = (
-            "https://cdn.openbsd.org/pub/OpenBSD/7.3/arm64/miniroot73.img"
+            "https://download.freebsd.org/releases/arm64/aarch64/ISO-IMAGES/14.0/FreeBSD-14.0-RELEASE-arm64-aarch64-bootonly.iso"
         )
 
-        img_hash = "7fc2c75401d6f01fbfa25f4953f72ad7d7c18650056d30755c44b9c129b707e5"
+        img_hash = "2f3ceb0ef6b1de53553abb9979a6d65f51b006dbfa985798b282812ecb758c1b"
         img_path = self.fetch_asset(img_url, algorithm="sha256", asset_hash=img_hash)
 
         self.vm.set_console()
@@ -196,43 +196,64 @@ def boot_openbsd73(self, cpu):
         )
 
         self.vm.launch()
-        wait_for_console_pattern(self,
-                                 "Welcome to the OpenBSD/arm64"
-                                 " 7.3 installation program.")
+        wait_for_console_pattern(self, "Welcome to FreeBSD!")
 
-    def test_sbsaref_openbsd73_cortex_a57(self):
+    def test_sbsaref_freebsd14_cortex_a57(self):
         """
         :avocado: tags=cpu:cortex-a57
-        :avocado: tags=os:openbsd
+        :avocado: tags=os:freebsd
         """
-        self.boot_openbsd73("cortex-a57")
+        self.boot_freebsd14("cortex-a57")
 
-    def test_sbsaref_openbsd73_neoverse_n1(self):
+    def test_sbsaref_freebsd14_neoverse_n1(self):
         """
         :avocado: tags=cpu:neoverse-n1
-        :avocado: tags=os:openbsd
+        :avocado: tags=os:freebsd
         """
-        self.boot_openbsd73("neoverse-n1")
+        self.boot_freebsd14("neoverse-n1")
 
-    def test_sbsaref_openbsd73_max_pauth_off(self):
+    def test_sbsaref_freebsd14_neoverse_n2_pauth_off(self):
+        """
+        :avocado: tags=cpu:neoverse-n2
+        :avocado: tags=os:freebsd
+        """
+        self.boot_freebsd14("neoverse-n2,pauth=off")
+
+    @skipUnless(os.getenv('AVOCADO_TIMEOUT_EXPECTED'), 'Test might timeout')
+    def test_sbsaref_freebsd14_neoverse_n2_pauth_impdef(self):
+        """
+        :avocado: tags=cpu:neoverse-n2
+        :avocado: tags=os:freebsd
+        """
+        self.boot_freebsd14("neoverse-n2,pauth-impdef=on")
+
+    @skipUnless(os.getenv('AVOCADO_TIMEOUT_EXPECTED'), 'Test might timeout')
+    def test_sbsaref_freebsd14_neoverse_n2(self):
+        """
+        :avocado: tags=cpu:neoverse-n2
+        :avocado: tags=os:freebsd
+        """
+        self.boot_freebsd14("neoverse-n2")
+
+    def test_sbsaref_freebsd14_max_pauth_off(self):
         """
         :avocado: tags=cpu:max
-        :avocado: tags=os:openbsd
+        :avocado: tags=os:freebsd
         """
-        self.boot_openbsd73("max,pauth=off")
+        self.boot_freebsd14("max,pauth=off")
 
     @skipUnless(os.getenv('AVOCADO_TIMEOUT_EXPECTED'), 'Test might timeout')
-    def test_sbsaref_openbsd73_max_pauth_impdef(self):
+    def test_sbsaref_freebsd14_max_pauth_impdef(self):
         """
         :avocado: tags=cpu:max
-        :avocado: tags=os:openbsd
+        :avocado: tags=os:freebsd
         """
-        self.boot_openbsd73("max,pauth-impdef=on")
+        self.boot_freebsd14("max,pauth-impdef=on")
 
     @skipUnless(os.getenv('AVOCADO_TIMEOUT_EXPECTED'), 'Test might timeout')
-    def test_sbsaref_openbsd73_max(self):
+    def test_sbsaref_freebsd14_max(self):
         """
         :avocado: tags=cpu:max
-        :avocado: tags=os:openbsd
+        :avocado: tags=os:freebsd
         """
-        self.boot_openbsd73("max")
+        self.boot_freebsd14("max")
-- 
2.45.1


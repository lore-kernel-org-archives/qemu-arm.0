Received: by 2002:a17:907:991a:b0:a45:b507:d90a with SMTP id ka26csp2354202ejc;
        Wed, 13 Mar 2024 03:09:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWAT9wg+rJd/j6lRCIkDXjwdA6ebYchhqubFI7V3SDpuZ5cDEQxoAZ2wbfBl9/m60cDKNHzbQ15BC0PP42l04vS/FVMutBd
X-Google-Smtp-Source: AGHT+IHr4hZI/e4amFamv4OVZAlcvD7W9lOPZeOgxVw9LKifwN8kU173EUyLD5EsfiDXlnzvGZWI
X-Received: by 2002:a05:620a:7ed:b0:788:3136:95cf with SMTP id k13-20020a05620a07ed00b00788313695cfmr10793353qkk.53.1710324545965;
        Wed, 13 Mar 2024 03:09:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710324545; cv=none;
        d=google.com; s=arc-20160816;
        b=eIV5foIax62hXxy7f44Sk6Gk8c2YqnEiIc0rf8C3sp697hMoN3U2qs7Vb6IxjPeK2r
         HnJm96FdVHnv9j4Q61a1FHNV9AshSdERd6340bn68I0FfJo/AJBRTRm/hSCbCHAPphjs
         MtXg1PdaUGJqLC4aY/Si2+sDmaslm2xN7gtqOODAgJ+lws1S2I50zYXkP0MdF8s8tyRy
         yKPHvWdfZwFmsA3BAz15o9PHkkl9SNWBSY4sISJBOzDN93gQYBCvZmWjJuv3Hvw4HjeT
         sxDz/lzCmf9jQuzYD4X5s1KRze/O87Ko1AFLRa9W6MOUMtpGDAdr0VpHpOzRsX0qKk+R
         XeJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:in-reply-to:references
         :message-id:content-transfer-encoding:mime-version:subject:date:from;
        bh=oAP9mmviIQ4HHp5KZWfYDS+nMfbz6FMGAGiKPuEEnEo=;
        fh=LC/OdAGxp8XjCcxyMB5oH3DeKOnqJHpFVM0U3yCY+4A=;
        b=uys3wQ+BnrD/rJVSCEBKCa8rIKbNHPRnRrbJ3WfvfBUBGeLnD/4LS5gTWQ9fqtOpYh
         cdrJlXQEEuzz4JOvSK+FoRp5TX9JGnCkDOM4+AsxrtSTD09EulYgD3tuh7l0RTzeNuJz
         51pKsPXDNk1jQAH67aDzywKDVnLmf6CvO/4GNX5MRnkrg4W77ER4yjJADEzvqnW9bOHx
         NRYgQE2KH1BMTfa0H5mmwf2OXgjek5MffDg5L5ZUnYcvyGr2ShB8F90DX2+u7BiL4krA
         UJc32f676UzzTjt3VSnCzy4hTfYxCDhZKtWFmtzNJg9VFtn4iSw+ydi1fJTS27qZzP+X
         zLzQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x5-20020a05620a0ec500b0078830dfb613si8982366qkm.217.2024.03.13.03.09.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Mar 2024 03:09:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rkLXT-0001rm-BF; Wed, 13 Mar 2024 06:08:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1rkLXP-0001qd-Go; Wed, 13 Mar 2024 06:08:43 -0400
Received: from muminek.juszkiewicz.com.pl ([213.251.184.221])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1rkLXC-0006Ui-RQ; Wed, 13 Mar 2024 06:08:42 -0400
Received: from localhost (localhost [127.0.0.1])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id 441A6260B8D;
 Wed, 13 Mar 2024 11:08:27 +0100 (CET)
X-Virus-Scanned: Debian amavis at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
 by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavis, port 10024)
 with ESMTP id uwUlmwSkaARn; Wed, 13 Mar 2024 11:08:25 +0100 (CET)
Received: from [172.17.0.1] (83.11.22.169.ipv4.supernova.orange.pl
 [83.11.22.169])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id B5E842601CE;
 Wed, 13 Mar 2024 11:08:23 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Date: Wed, 13 Mar 2024 11:08:21 +0100
Subject: [PATCH 3/3] tests/avocado: use OpenBSD 7.4 for sbsa-ref
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240313-sbsa-ref-firmware-update-v1-3-e166703c5424@linaro.org>
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
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
X-TUID: Q3gd/5AnjTPO

7.4 was released in October 2023, time to update before 7.3 gets dropped.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 tests/avocado/machine_aarch64_sbsaref.py | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/tests/avocado/machine_aarch64_sbsaref.py b/tests/avocado/machine_aarch64_sbsaref.py
index 259225f15f..94c9f81d72 100644
--- a/tests/avocado/machine_aarch64_sbsaref.py
+++ b/tests/avocado/machine_aarch64_sbsaref.py
@@ -159,14 +159,14 @@ def test_sbsaref_alpine_linux_max(self):
     # This tests the whole boot chain from EFI to Userspace
     # We only boot a whole OS for the current top level CPU and GIC
     # Other test profiles should use more minimal boots
-    def boot_openbsd73(self, cpu):
+    def boot_openbsd(self, cpu):
         self.fetch_firmware()
 
         img_url = (
-            "https://cdn.openbsd.org/pub/OpenBSD/7.3/arm64/miniroot73.img"
+            "https://cdn.openbsd.org/pub/OpenBSD/7.4/arm64/miniroot74.img"
         )
 
-        img_hash = "7fc2c75401d6f01fbfa25f4953f72ad7d7c18650056d30755c44b9c129b707e5"
+        img_hash = "7b08b2ce081cff6408d183f7152ddcfd2779912104866e4fdf6ae2d864b51142"
         img_path = self.fetch_asset(img_url, algorithm="sha256", asset_hash=img_hash)
 
         self.vm.set_console()
@@ -180,23 +180,23 @@ def boot_openbsd73(self, cpu):
         self.vm.launch()
         wait_for_console_pattern(self,
                                  "Welcome to the OpenBSD/arm64"
-                                 " 7.3 installation program.")
+                                 " 7.4 installation program.")
 
-    def test_sbsaref_openbsd73_cortex_a57(self):
+    def test_sbsaref_openbsd_cortex_a57(self):
         """
-        :avocado: tags=cpu:cortex-a57
+        :avocado: tags=cpu:cortex-a57,os:openbsd
         """
-        self.boot_openbsd73("cortex-a57")
+        self.boot_openbsd("cortex-a57")
 
-    def test_sbsaref_openbsd73_neoverse_n1(self):
+    def test_sbsaref_openbsd_neoverse_n1(self):
         """
-        :avocado: tags=cpu:neoverse-n1
+        :avocado: tags=cpu:neoverse-n1,os:openbsd
         """
-        self.boot_openbsd73("neoverse-n1")
+        self.boot_openbsd("neoverse-n1")
 
-    def test_sbsaref_openbsd73_max(self):
+    def test_sbsaref_openbsd_max(self):
         """
-        :avocado: tags=cpu:max
+        :avocado: tags=cpu:max,os:openbsd
         """
-        self.boot_openbsd73("max")
+        self.boot_openbsd("max")
 

-- 
2.44.0


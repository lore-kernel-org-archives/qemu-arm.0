Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp1872015lft;
        Wed, 22 Jun 2022 02:56:02 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sJw/Xlwju9sy4bPC4lyGkwNNyZ2+lhYmpV0ad3e8HIIa1OrgcCMnuLMLKyj604gXZ3mc5K
X-Received: by 2002:ac8:7f8f:0:b0:304:ff91:2bdd with SMTP id z15-20020ac87f8f000000b00304ff912bddmr2047780qtj.174.1655891762099;
        Wed, 22 Jun 2022 02:56:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655891762; cv=none;
        d=google.com; s=arc-20160816;
        b=iSTTjaKdtenkDHiKsKFjy2LAGfeY6Fprs2X9hf70rbPeiov4SS1BGB1JVfJWVIneCE
         YB16ldqlLCKb8UE7HdJ8dnu7OUEBycOUmzWIq9VrVA26HxmZdj1XYW8xT3ObeA4V/RSt
         N9+HNoWjO5k2PfOajnNYpgBeRRr4PcfDkSWiDI5LHe+NGsxhyLPdJTFyT2Yn1ZCaDsYC
         faAvx6wDaLiS95Fu7jrDXFcxpJ1r5qE3d2ybyn/xKCm2p8wSGXq1INoC0Rzd85ot7Jan
         QfRkwlvWjO4s+cGDEUgpWkZxpef6u6+6P32D/PzcjLPjBX6UB3UxV/NBYOBGd9kQJFVV
         rBvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=nlnTCjz3SezvPlioP0ewZdYN6kdI99OCyJwaAdlJB6U=;
        b=nCuHVDPmB1ZTiogLV6PrZr1LJLynPTqMPmx3mHB+Bq3GEiUN8mhiIcrwBL6vydOYC2
         ZC2UaNlBtPKTn1EYEKXJrCCE56TzB8MOqogG4vwaUogMXHEp0qRERu798OV/39nFtvCB
         Z4FkcYFaVnHcfCF5nFAbNb2cw/RGDoJzJAxxg9Je4SySw32TDe+vubDr8sWgC4jfe1V/
         RgoMm0jJnKlQT8ADbE+R9SJ6+x5Y2RVqhqTjgj5gZd74ysb25iRq8JM88A3gtKbr9MRC
         GZb4RbdBuLhZcEEeSpisA0aR725studoctDLHzO4CnLOgXdpgVbJMC1MZiUYtb5nnfKc
         jK4g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n16-20020a05622a11d000b003050147740csi11527917qtk.348.2022.06.22.02.56.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Jun 2022 02:56:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o3x5d-0005jq-HA
	for alex.bennee@linaro.org; Wed, 22 Jun 2022 05:56:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=05Ho=W5=kaod.org=clg@ozlabs.org>)
 id 1o3x5K-0005gn-JL; Wed, 22 Jun 2022 05:55:42 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:33455
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=05Ho=W5=kaod.org=clg@ozlabs.org>)
 id 1o3x5G-0004kh-Bk; Wed, 22 Jun 2022 05:55:42 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LSdzk5Xq8z4xZh;
 Wed, 22 Jun 2022 19:55:30 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LSdzh73C9z4xD9;
 Wed, 22 Jun 2022 19:55:28 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 02/19] test/avocado/machine_aspeed.py: Move OpenBMC tests
Date: Wed, 22 Jun 2022 11:55:03 +0200
Message-Id: <20220622095520.3683321-3-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220622095520.3683321-1-clg@kaod.org>
References: <20220622095520.3683321-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=05Ho=W5=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aWB+Yg9hGnZx

It's easier to run. Keep test_arm_ast2600_debian() under the
boot_linux_console.py file because it requires the extract_from_deb()
helper. We could remove it when we have tests for the AST2600.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 tests/avocado/boot_linux_console.py | 43 -------------------------
 tests/avocado/machine_aspeed.py     | 50 +++++++++++++++++++++++++++++
 2 files changed, 50 insertions(+), 43 deletions(-)

diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux_console.py
index 45a2ceda2227..6b1533c17c8b 100644
--- a/tests/avocado/boot_linux_console.py
+++ b/tests/avocado/boot_linux_console.py
@@ -1043,49 +1043,6 @@ def test_arm_vexpressa9(self):
         self.vm.add_args('-dtb', self.workdir + '/day16/vexpress-v2p-ca9.dtb')
         self.do_test_advcal_2018('16', tar_hash, 'winter.zImage')
 
-    def test_arm_ast2400_palmetto_openbmc_v2_9_0(self):
-        """
-        :avocado: tags=arch:arm
-        :avocado: tags=machine:palmetto-bmc
-        """
-
-        image_url = ('https://github.com/openbmc/openbmc/releases/download/2.9.0/'
-                     'obmc-phosphor-image-palmetto.static.mtd')
-        image_hash = ('3e13bbbc28e424865dc42f35ad672b10f2e82cdb11846bb28fa625b48beafd0d')
-        image_path = self.fetch_asset(image_url, asset_hash=image_hash,
-                                      algorithm='sha256')
-
-        self.do_test_arm_aspeed(image_path)
-
-    def test_arm_ast2500_romulus_openbmc_v2_9_0(self):
-        """
-        :avocado: tags=arch:arm
-        :avocado: tags=machine:romulus-bmc
-        """
-
-        image_url = ('https://github.com/openbmc/openbmc/releases/download/2.9.0/'
-                     'obmc-phosphor-image-romulus.static.mtd')
-        image_hash = ('820341076803f1955bc31e647a512c79f9add4f5233d0697678bab4604c7bb25')
-        image_path = self.fetch_asset(image_url, asset_hash=image_hash,
-                                      algorithm='sha256')
-
-        self.do_test_arm_aspeed(image_path)
-
-    def do_test_arm_aspeed(self, image):
-        self.vm.set_console()
-        self.vm.add_args('-drive', 'file=' + image + ',if=mtd,format=raw',
-                         '-net', 'nic')
-        self.vm.launch()
-
-        self.wait_for_console_pattern("U-Boot 2016.07")
-        self.wait_for_console_pattern("## Loading kernel from FIT Image at 20080000")
-        self.wait_for_console_pattern("Starting kernel ...")
-        self.wait_for_console_pattern("Booting Linux on physical CPU 0x0")
-        self.wait_for_console_pattern(
-                "aspeed-smc 1e620000.spi: read control register: 203b0641")
-        self.wait_for_console_pattern("ftgmac100 1e660000.ethernet eth0: irq ")
-        self.wait_for_console_pattern("systemd[1]: Set hostname to")
-
     def test_arm_ast2600_debian(self):
         """
         :avocado: tags=arch:arm
diff --git a/tests/avocado/machine_aspeed.py b/tests/avocado/machine_aspeed.py
index 33090af19940..89bfad307661 100644
--- a/tests/avocado/machine_aspeed.py
+++ b/tests/avocado/machine_aspeed.py
@@ -34,3 +34,53 @@ def test_ast1030_zephyros(self):
         wait_for_console_pattern(self, "Booting Zephyr OS")
         exec_command_and_wait_for_pattern(self, "help",
                                           "Available commands")
+
+class AST2x00Machine(QemuSystemTest):
+
+    def wait_for_console_pattern(self, success_message, vm=None):
+        wait_for_console_pattern(self, success_message,
+                                 failure_message='Kernel panic - not syncing',
+                                 vm=vm)
+
+    def do_test_arm_aspeed(self, image):
+        self.vm.set_console()
+        self.vm.add_args('-drive', 'file=' + image + ',if=mtd,format=raw',
+                         '-net', 'nic')
+        self.vm.launch()
+
+        self.wait_for_console_pattern("U-Boot 2016.07")
+        self.wait_for_console_pattern("## Loading kernel from FIT Image at 20080000")
+        self.wait_for_console_pattern("Starting kernel ...")
+        self.wait_for_console_pattern("Booting Linux on physical CPU 0x0")
+        wait_for_console_pattern(self,
+                "aspeed-smc 1e620000.spi: read control register: 203b0641")
+        self.wait_for_console_pattern("ftgmac100 1e660000.ethernet eth0: irq ")
+        self.wait_for_console_pattern("systemd[1]: Set hostname to")
+
+    def test_arm_ast2400_palmetto_openbmc_v2_9_0(self):
+        """
+        :avocado: tags=arch:arm
+        :avocado: tags=machine:palmetto-bmc
+        """
+
+        image_url = ('https://github.com/openbmc/openbmc/releases/download/2.9.0/'
+                     'obmc-phosphor-image-palmetto.static.mtd')
+        image_hash = ('3e13bbbc28e424865dc42f35ad672b10f2e82cdb11846bb28fa625b48beafd0d')
+        image_path = self.fetch_asset(image_url, asset_hash=image_hash,
+                                      algorithm='sha256')
+
+        self.do_test_arm_aspeed(image_path)
+
+    def test_arm_ast2500_romulus_openbmc_v2_9_0(self):
+        """
+        :avocado: tags=arch:arm
+        :avocado: tags=machine:romulus-bmc
+        """
+
+        image_url = ('https://github.com/openbmc/openbmc/releases/download/2.9.0/'
+                     'obmc-phosphor-image-romulus.static.mtd')
+        image_hash = ('820341076803f1955bc31e647a512c79f9add4f5233d0697678bab4604c7bb25')
+        image_path = self.fetch_asset(image_url, asset_hash=image_hash,
+                                      algorithm='sha256')
+
+        self.do_test_arm_aspeed(image_path)
-- 
2.35.3


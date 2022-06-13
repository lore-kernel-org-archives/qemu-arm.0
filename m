Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp1384895lfb;
        Mon, 13 Jun 2022 06:32:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw1Cx+0wLemBRuwL0rZsogaLAHWvs+mfZXgtXuj6TlCsTytrZS4n/xPRR09mXRjeI+EwT08
X-Received: by 2002:a05:620a:2211:b0:6a7:991e:ed97 with SMTP id m17-20020a05620a221100b006a7991eed97mr1746117qkh.587.1655127140353;
        Mon, 13 Jun 2022 06:32:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655127140; cv=none;
        d=google.com; s=arc-20160816;
        b=weCGQkDifU4vdm6pX+cH51tXdVdciZDBWo45gqdiUayP8im3raGGSXIbKMZkMHFiA6
         Jmlqs63kNsNzyXVTAVJb0vJZ75GqqaO/F3zqySfm/GQD+T1ZBblfqDDRRPG7/ZvTgWbU
         6gW4ts5TBUgLIE67jYm4F90RXevt6zv+vRM5qjwHSLfj2vFy/JN5R1MJms6Jmg1bX+Xc
         GFM1kMrnYcFkPTZ4W3oGy4p183hYcwVzFSjnf6Cuoq5dzO/ZqU6nsOxoaYdB6Z+GRBnx
         z9bfPYBbRpjV3eBfXFD+ZkNf8f6HcKuUfJb3Y9/2OpeaVHT9O2ooJUhJf3yxpjOb2C8O
         AgaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=et0Ley4TQjNkmkGZi5kA8IWPeUTGzbPd4aHxt0xgR40=;
        b=Yqj9e9FFUhDyWRZEu37xzpIADXGeDthsXymaLxFHdLiK9jm2XAwg77Xy7IWtvQBit4
         hU3lZmuDygW5d1lIlKT35risKl+EFv+jJiBOEhzr5Uh351eTbZXEtjwgLM2PpnY9HFel
         opVb7mJeNL7bAw/p5ze5zqehUbwo5PuzJsN2ok0rOpkX/ruDuGpJPrRFlfWtcub/pwBL
         XjRZNIxE9voHa/4X/wUIjsC610W8gokKeXF5Vae/EUXq2U3AkvKmOlGVBC0GGuUa1R/j
         ohFMLodQVxrBDrnhfdBTMbszaPcOseQ1k9c/Ixb8Bj7SgX2ij71Cq8jpuGL5OcZcxhyz
         nPIw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v4-20020a05620a0f0400b006a719e1783asi5739425qkl.448.2022.06.13.06.32.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Jun 2022 06:32:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o0kB1-0008Tl-Le
	for alex.bennee@linaro.org; Mon, 13 Jun 2022 09:32:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=yfRC=WU=kaod.org=clg@ozlabs.org>)
 id 1o0k5C-0000Lh-0S; Mon, 13 Jun 2022 09:26:18 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:56243
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=yfRC=WU=kaod.org=clg@ozlabs.org>)
 id 1o0k5A-0004TS-1l; Mon, 13 Jun 2022 09:26:17 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LMC5155sCz4yZ4;
 Mon, 13 Jun 2022 23:26:13 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LMC4w2nVYz4yXP;
 Mon, 13 Jun 2022 23:26:08 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Joe Komlodi <komlodi@google.com>,
 Troy Lee <troy_lee@aspeedtech.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Klaus Jensen <k.jensen@samsung.com>, Peter Delevoryas <pdel@fb.com>,
 Corey Minyard <cminyard@mvista.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Damien Hedde <damien.hedde@greensocs.com>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v2 03/17] test/avocado/machine_aspeed.py: Add tests using
 buildroot images
Date: Mon, 13 Jun 2022 15:25:25 +0200
Message-Id: <20220613132539.2199772-4-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220613132539.2199772-1-clg@kaod.org>
References: <20220613132539.2199772-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=yfRC=WU=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
X-TUID: mLi/DrOuEfQG

Buildroot images are smaller than the OpenBMC images and faster to
run. Built from source using :

  http://patchwork.ozlabs.org/project/buildroot/list/?series=303465

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 tests/avocado/machine_aspeed.py | 52 +++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/tests/avocado/machine_aspeed.py b/tests/avocado/machine_aspeed.py
index 89bfad307661..31a0fb6cd865 100644
--- a/tests/avocado/machine_aspeed.py
+++ b/tests/avocado/machine_aspeed.py
@@ -5,8 +5,11 @@
 # This work is licensed under the terms of the GNU GPL, version 2 or
 # later.  See the COPYING file in the top-level directory.
 
+import time
+
 from avocado_qemu import QemuSystemTest
 from avocado_qemu import wait_for_console_pattern
+from avocado_qemu import exec_command
 from avocado_qemu import exec_command_and_wait_for_pattern
 from avocado.utils import archive
 
@@ -84,3 +87,52 @@ def test_arm_ast2500_romulus_openbmc_v2_9_0(self):
                                       algorithm='sha256')
 
         self.do_test_arm_aspeed(image_path)
+
+    def do_test_arm_aspeed_buidroot_start(self, image, cpu_id):
+        self.vm.set_console()
+        self.vm.add_args('-drive', 'file=' + image + ',if=mtd,format=raw',
+                         '-net', 'nic', '-net', 'user')
+        self.vm.launch()
+
+        self.wait_for_console_pattern('U-Boot 2019.04')
+        self.wait_for_console_pattern('## Loading kernel from FIT Image')
+        self.wait_for_console_pattern('Starting kernel ...')
+        self.wait_for_console_pattern('Booting Linux on physical CPU ' + cpu_id)
+        self.wait_for_console_pattern('lease of 10.0.2.15')
+        self.wait_for_console_pattern('Aspeed EVB')
+        exec_command(self, 'root')
+        time.sleep(0.1)
+
+    def do_test_arm_aspeed_buidroot_poweroff(self):
+        exec_command_and_wait_for_pattern(self, 'poweroff',
+                                          'reboot: System halted');
+
+    def test_arm_ast2500_evb_builroot(self):
+        """
+        :avocado: tags=arch:arm
+        :avocado: tags=machine:ast2500-evb
+        """
+
+        image_url = ('https://github.com/legoater/qemu-aspeed-boot/raw/master/'
+                     'images/ast2500-evb/buildroot-2022.05/flash.img')
+        image_hash = ('549db6e9d8cdaf4367af21c36385a68bb465779c18b5e37094fc7343decccd3f')
+        image_path = self.fetch_asset(image_url, asset_hash=image_hash,
+                                      algorithm='sha256')
+
+        self.do_test_arm_aspeed_buidroot_start(image_path, '0x0')
+        self.do_test_arm_aspeed_buidroot_poweroff()
+
+    def test_arm_ast2600_evb_builroot(self):
+        """
+        :avocado: tags=arch:arm
+        :avocado: tags=machine:ast2600-evb
+        """
+
+        image_url = ('https://github.com/legoater/qemu-aspeed-boot/raw/master/'
+                     'images/ast2600-evb/buildroot-2022.05/flash.img')
+        image_hash = ('6cc9e7d128fd4fa1fd01c883af67593cae8072c3239a0b8b6ace857f3538a92d')
+        image_path = self.fetch_asset(image_url, asset_hash=image_hash,
+                                      algorithm='sha256')
+
+        self.do_test_arm_aspeed_buidroot_start(image_path, '0xf00')
+        self.do_test_arm_aspeed_buidroot_poweroff()
-- 
2.35.3


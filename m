Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp1874572lft;
        Wed, 22 Jun 2022 02:59:14 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uE6WYB+Cy/bWvf9XtYpT3/riI6WXPN7d9eUoJOzy0Xm6P497YyCFrcx8gExgFILAEMHa37
X-Received: by 2002:a05:622a:347:b0:305:e3c:666f with SMTP id r7-20020a05622a034700b003050e3c666fmr2087604qtw.34.1655891954240;
        Wed, 22 Jun 2022 02:59:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655891954; cv=none;
        d=google.com; s=arc-20160816;
        b=GwXV7UJla3+rV6hbmlMUy978ebxSvfY3MzzPIaSr+GFN4ofErQ1Sz9Y9mVyF0x8Q7a
         PNI8M+/WvaC3pv7CMy/7iK2apjmyxqO+rs9Zufbc+ICIr1XGilwtnB1nVsdISJ7J+kJ+
         x83mlxDAR1k11U1ugEVLZDs7h2x9TjFKl8H1sbbeNG5DCphuB7DbZYd+eiYifWhJUmdi
         +TvrMguBLej2yrh8gs6obsezwLYgJRJwMUEsidtfQaE4jLehkGEcDM31gZjQbfPcY1Lb
         MVVQUUOBfVXsdRZebaKdj7KGeZQ2qSFox64jrPrHQWXXWpR6myA+O98mpeS/2wnnY5A3
         M09A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=uqszZV5IFppkqnypr5N9KiDN2zTssZTkHLmz5b3hIns=;
        b=sV4zh9U+YZ2tJPmcsg4oRu4IkRQUhI998PpwcFSboNyKq87rPI7h6gKgDmWCFcM9EZ
         i5STdHlSOpCxUGu8FClHAJ5IRR79bJ+DHfvwoDJjuaMl8Rm22ILdijjhETvv4MorHwI0
         QPmNAP4w1yKLmqQ3wJOm7haejZtObRQP3Oi3nBxGdQ5uhps16aqQC1AluyNPp8kpRi4a
         i/RnROyubmGFOabwP9wlOwGwM+Q9s9+Ck1zvgUcFOkEsnNut5EMJkFJXnFC/ICdJHldZ
         Kka4TeMOOGNb/kv7oGGqaKJMHEMXjr5SNPaBWi33gHks00ihe+h2s/h8osRWupCpfzEX
         cZlg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m11-20020a05620a24cb00b006a69b2bfc58si14656029qkn.372.2022.06.22.02.59.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Jun 2022 02:59:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o3x8j-0003eb-NE
	for alex.bennee@linaro.org; Wed, 22 Jun 2022 05:59:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=05Ho=W5=kaod.org=clg@ozlabs.org>)
 id 1o3x5L-0005gt-8D; Wed, 22 Jun 2022 05:55:44 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:56701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=05Ho=W5=kaod.org=clg@ozlabs.org>)
 id 1o3x5I-0004l8-54; Wed, 22 Jun 2022 05:55:43 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LSdzq2gB5z4xZl;
 Wed, 22 Jun 2022 19:55:35 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LSdzn465yz4xD9;
 Wed, 22 Jun 2022 19:55:33 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 04/19] test/avocado/machine_aspeed.py: Add I2C tests to
 ast2500-evb
Date: Wed, 22 Jun 2022 11:55:05 +0200
Message-Id: <20220622095520.3683321-5-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220622095520.3683321-1-clg@kaod.org>
References: <20220622095520.3683321-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=05Ho=W5=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
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
X-TUID: p23o1EoUK4r7

Create a named I2C temperature sensor device on the command line,
instantiate device from Linux since it is not part of the device tree,
and check the temperature is correctly reported under sysfs.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 tests/avocado/machine_aspeed.py | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/tests/avocado/machine_aspeed.py b/tests/avocado/machine_aspeed.py
index 31a0fb6cd865..4d2766e1d44d 100644
--- a/tests/avocado/machine_aspeed.py
+++ b/tests/avocado/machine_aspeed.py
@@ -119,7 +119,20 @@ def test_arm_ast2500_evb_builroot(self):
         image_path = self.fetch_asset(image_url, asset_hash=image_hash,
                                       algorithm='sha256')
 
+        self.vm.add_args('-device',
+                         'tmp105,bus=aspeed.i2c.bus.3,address=0x4d,id=tmp-test');
         self.do_test_arm_aspeed_buidroot_start(image_path, '0x0')
+
+        exec_command_and_wait_for_pattern(self,
+             'echo lm75 0x4d > /sys/class/i2c-dev/i2c-3/device/new_device',
+             'i2c i2c-3: new_device: Instantiated device lm75 at 0x4d');
+        exec_command_and_wait_for_pattern(self,
+                             'cat /sys/class/hwmon/hwmon1/temp1_input', '0')
+        self.vm.command('qom-set', path='/machine/peripheral/tmp-test',
+                        property='temperature', value=18000);
+        exec_command_and_wait_for_pattern(self,
+                             'cat /sys/class/hwmon/hwmon1/temp1_input', '18000')
+
         self.do_test_arm_aspeed_buidroot_poweroff()
 
     def test_arm_ast2600_evb_builroot(self):
-- 
2.35.3


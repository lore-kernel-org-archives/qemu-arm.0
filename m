Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp4197390ejn;
        Tue, 25 Oct 2022 08:26:32 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5uDJCWw2usWcT2bPiLcVQzlgwtNx9Np8v3Ybm7SYlNan+fM/MQ5o3/rn+o7SQBcZvc2e3G
X-Received: by 2002:a05:620a:24c1:b0:6ed:ae5d:1834 with SMTP id m1-20020a05620a24c100b006edae5d1834mr26183304qkn.137.1666711592238;
        Tue, 25 Oct 2022 08:26:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666711592; cv=none;
        d=google.com; s=arc-20160816;
        b=Si/5HmbfY/LRgA577M5TU12q0fvWQetYiAZJ+nA50IuCfH+4WBaO9L0tKbfjeOQ3Qj
         Ca+UcKvn91TsjsbT9s6+RRppiIs9XoBRZerDRd6yARXW244hnqUlpJyapZnF5MMMV9jG
         jSaSLuOVQTtrbpU+HAKr9K3yRzsDU8b88hfSso4WjhkAqTgqoJCBVz8VT3ECvu8dZFPH
         qKAY1ajo6PAW1y0Rp1q80psnc7k8Ip4keJOueTkm2kkmmCMHhm9DEzFxnFxw/iG5lz2h
         BX6/FJCPY51T/jHZCVsuV0IBqAxp2Rz3AoczOf2nLOYDR6Qbt07prtuq8BGfBaNGqRnp
         osbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=LR/X2l9ETlP2w7h8RYppinKi3QrS+fDT9Gdtrc4jfAA=;
        b=avNqsZOIlkXbchX4cNbgwtGK8cw0MI7PUSDER2/khzcU3OVDg/68/OF9VnfEXCq5QD
         1kMvUYPwTMumxJTttAjxp7ewsYLXpfu8efqJ5aI0+du66J1SsgwmXsERxY1Pm91rOgA2
         BkhiBU7Ceq36KqK2VeNv9p8/6c+xcPwGpuzSrE00SLBp7+yrPsNv3/LW4k4fUadRFLzo
         CG+6MAyhufrS3x2xm49/D9Gza5Bxlx7/CFJGYabVF1OW9EFVFjIXYynlj2EvyBzudsj2
         mY9KrxPrvoVkWPbV1EIWMXGLY3zDqGcX2YQGkia3qaDkYsuGK3Qc3YOVQpfc7p3Tymnr
         HmBw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ge10-20020a05621427ca00b004bb92568057si226237qvb.249.2022.10.25.08.26.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Oct 2022 08:26:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onLjz-0007BV-PL; Tue, 25 Oct 2022 11:21:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=KVXu=22=kaod.org=clg@ozlabs.org>)
 id 1onLjo-0006OI-Eh; Tue, 25 Oct 2022 11:21:08 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=KVXu=22=kaod.org=clg@ozlabs.org>)
 id 1onLji-0004kO-0V; Tue, 25 Oct 2022 11:21:07 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4MxbHZ6gRcz4x1G;
 Wed, 26 Oct 2022 02:20:58 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4MxbHW61tvz4xGd;
 Wed, 26 Oct 2022 02:20:55 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-block@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 02/16] tests/avocado/machine_aspeed.py: Fix typos on buildroot
Date: Tue, 25 Oct 2022 17:20:28 +0200
Message-Id: <20221025152042.278287-3-clg@kaod.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221025152042.278287-1-clg@kaod.org>
References: <20221025152042.278287-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=KVXu=22=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: VQqi/n0alv3T

Replace 'buidroot' and 'builroot' by 'buildroot'.

Fixes: f7bc7da0724f ("test/avocado/machine_aspeed.py: Add tests using buildroot images")
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Message-Id: <20220923084803.498337-2-clg@kaod.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 tests/avocado/machine_aspeed.py | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/tests/avocado/machine_aspeed.py b/tests/avocado/machine_aspeed.py
index 124649a24b58..fba652702681 100644
--- a/tests/avocado/machine_aspeed.py
+++ b/tests/avocado/machine_aspeed.py
@@ -92,7 +92,7 @@ def test_arm_ast2500_romulus_openbmc_v2_9_0(self):
 
         self.do_test_arm_aspeed(image_path)
 
-    def do_test_arm_aspeed_buidroot_start(self, image, cpu_id):
+    def do_test_arm_aspeed_buildroot_start(self, image, cpu_id):
         self.require_netdev('user')
 
         self.vm.set_console()
@@ -111,11 +111,11 @@ def do_test_arm_aspeed_buidroot_start(self, image, cpu_id):
         exec_command(self, 'root')
         time.sleep(0.1)
 
-    def do_test_arm_aspeed_buidroot_poweroff(self):
+    def do_test_arm_aspeed_buildroot_poweroff(self):
         exec_command_and_wait_for_pattern(self, 'poweroff',
                                           'reboot: System halted');
 
-    def test_arm_ast2500_evb_builroot(self):
+    def test_arm_ast2500_evb_buildroot(self):
         """
         :avocado: tags=arch:arm
         :avocado: tags=machine:ast2500-evb
@@ -129,7 +129,7 @@ def test_arm_ast2500_evb_builroot(self):
 
         self.vm.add_args('-device',
                          'tmp105,bus=aspeed.i2c.bus.3,address=0x4d,id=tmp-test');
-        self.do_test_arm_aspeed_buidroot_start(image_path, '0x0')
+        self.do_test_arm_aspeed_buildroot_start(image_path, '0x0')
 
         exec_command_and_wait_for_pattern(self,
              'echo lm75 0x4d > /sys/class/i2c-dev/i2c-3/device/new_device',
@@ -141,9 +141,9 @@ def test_arm_ast2500_evb_builroot(self):
         exec_command_and_wait_for_pattern(self,
                              'cat /sys/class/hwmon/hwmon1/temp1_input', '18000')
 
-        self.do_test_arm_aspeed_buidroot_poweroff()
+        self.do_test_arm_aspeed_buildroot_poweroff()
 
-    def test_arm_ast2600_evb_builroot(self):
+    def test_arm_ast2600_evb_buildroot(self):
         """
         :avocado: tags=arch:arm
         :avocado: tags=machine:ast2600-evb
@@ -159,7 +159,7 @@ def test_arm_ast2600_evb_builroot(self):
                          'tmp105,bus=aspeed.i2c.bus.3,address=0x4d,id=tmp-test');
         self.vm.add_args('-device',
                          'ds1338,bus=aspeed.i2c.bus.3,address=0x32');
-        self.do_test_arm_aspeed_buidroot_start(image_path, '0xf00')
+        self.do_test_arm_aspeed_buildroot_start(image_path, '0xf00')
 
         exec_command_and_wait_for_pattern(self,
              'echo lm75 0x4d > /sys/class/i2c-dev/i2c-3/device/new_device',
@@ -177,7 +177,7 @@ def test_arm_ast2600_evb_builroot(self):
         year = time.strftime("%Y")
         exec_command_and_wait_for_pattern(self, 'hwclock -f /dev/rtc1', year);
 
-        self.do_test_arm_aspeed_buidroot_poweroff()
+        self.do_test_arm_aspeed_buildroot_poweroff()
 
 
 class AST2x00MachineSDK(QemuSystemTest):
-- 
2.37.3


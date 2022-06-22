Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp1874322lft;
        Wed, 22 Jun 2022 02:58:51 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vY8vjKVtgU3X+7nNX7xUVO3BfQ4vXv2ALwfnr22HW7Np1E4P3NdhgSVqGThoJod/A24f3f
X-Received: by 2002:a05:620a:4311:b0:6ad:beb:ded6 with SMTP id u17-20020a05620a431100b006ad0bebded6mr1558945qko.310.1655891931603;
        Wed, 22 Jun 2022 02:58:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655891931; cv=none;
        d=google.com; s=arc-20160816;
        b=Cy5nrLwvZHmzvO4i73ABmmlFtAsI9sNrMKPbsBOO/Dv8GIzCSyMTH6G2ks6saMaQvm
         Yxq7Iz5RaZB8oVH40FmoLKg960fTuS1AgxSQ41wKY1jOYfrfoGuSSABQC55X0Y3PCFu1
         1l5knHvEZPbuHDO+R5xKinI+wISvPo1C2PTsaVufSZD2L41pLJqHYIySdggg6QfLnm1x
         bTo9IgCi6hnBtx7k1RdFZFR3+kpTk9M0ZdM3wHpnjRNIttLePhDuOzk7LrIrsmlOs+jf
         6OgDDPr4fK072QQy7Ffh5EzrpwFerhsACYlFe6levN1qICS67b02g2axUsJI/EX0BmCl
         m1xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=epheJ8MEhEiqALotZz6NNUfbqljfsli7lc/GKynH0XA=;
        b=qOnt4979iA3MCGbkF60qnJFP5BrE+or6833eD7av3tU8msf+5YhTY9RvzMo6lJNIgu
         VdV+RUCQv24IIvqgQVgfmdEfab/jfUwDZ+E1v05dTPUN52KX2AOOtl26GZi80BQpnTUI
         zVRb/Uw4eEzWRpe3REYFb3Qsb6kHBAgjyLUZxFPkfr0WAcStIQ3LnlfcV4TMewGAUMMY
         B+Pg+k8LgfMX/7Fj2wMMUxGRcKeT18x0a/a7N3pRK9Thz0ZJd1ntF2LdFXPV0oID8hlM
         OcBtEbdgQaEqmzNZ+D8jcCC8dwEWNni/kJVsKNu+uBvNnsPOm0OitDpN/PNnq0ycPIj0
         EUuw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r6-20020a056214212600b00470610b7429si1240309qvc.250.2022.06.22.02.58.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Jun 2022 02:58:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o3x8N-0002vv-1Y
	for alex.bennee@linaro.org; Wed, 22 Jun 2022 05:58:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=05Ho=W5=kaod.org=clg@ozlabs.org>)
 id 1o3x5O-0005jD-1k; Wed, 22 Jun 2022 05:55:46 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:44207
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=05Ho=W5=kaod.org=clg@ozlabs.org>)
 id 1o3x5L-0004lo-7l; Wed, 22 Jun 2022 05:55:45 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LSdzw1Zxsz4xZp;
 Wed, 22 Jun 2022 19:55:40 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LSdzt16jrz4xD9;
 Wed, 22 Jun 2022 19:55:37 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Subject: [PULL 06/19] test/avocado/machine_aspeed.py: Add an I2C RTC test
Date: Wed, 22 Jun 2022 11:55:07 +0200
Message-Id: <20220622095520.3683321-7-clg@kaod.org>
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
X-TUID: scRLUOFQRRai

Add an RTC device and check that the output of the hwclock command
matches the current year.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 tests/avocado/machine_aspeed.py | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tests/avocado/machine_aspeed.py b/tests/avocado/machine_aspeed.py
index 0a1ceec13eb1..3b8f784a57b6 100644
--- a/tests/avocado/machine_aspeed.py
+++ b/tests/avocado/machine_aspeed.py
@@ -149,6 +149,8 @@ def test_arm_ast2600_evb_builroot(self):
 
         self.vm.add_args('-device',
                          'tmp105,bus=aspeed.i2c.bus.3,address=0x4d,id=tmp-test');
+        self.vm.add_args('-device',
+                         'ds1338,bus=aspeed.i2c.bus.3,address=0x32');
         self.do_test_arm_aspeed_buidroot_start(image_path, '0xf00')
 
         exec_command_and_wait_for_pattern(self,
@@ -161,4 +163,10 @@ def test_arm_ast2600_evb_builroot(self):
         exec_command_and_wait_for_pattern(self,
                              'cat /sys/class/hwmon/hwmon0/temp1_input', '18000')
 
+        exec_command_and_wait_for_pattern(self,
+             'echo ds1307 0x32 > /sys/class/i2c-dev/i2c-3/device/new_device',
+             'i2c i2c-3: new_device: Instantiated device ds1307 at 0x32');
+        year = time.strftime("%Y")
+        exec_command_and_wait_for_pattern(self, 'hwclock -f /dev/rtc1', year);
+
         self.do_test_arm_aspeed_buidroot_poweroff()
-- 
2.35.3


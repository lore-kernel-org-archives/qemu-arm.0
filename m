Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp11254ejc;
        Thu, 2 Mar 2023 09:43:01 -0800 (PST)
X-Google-Smtp-Source: AK7set8v5kKx9nbSVX2D8bCHfGUl7d4YzbyQwUXYg5S5blXw2cgOvitgsHHErugW/zw71l2C5lI3
X-Received: by 2002:ac8:7f11:0:b0:3be:5727:cda6 with SMTP id f17-20020ac87f11000000b003be5727cda6mr18233988qtk.58.1677778981541;
        Thu, 02 Mar 2023 09:43:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677778981; cv=none;
        d=google.com; s=arc-20160816;
        b=k1/MIHTEInV2Hg4+qK7CVkI/8J+7+tZ0MJ1HPRz6DcMcM3c7cYNefpU0sqr9MJlUNy
         nsDeRO1Rzm10sFJR/N6dPyRuA8i6tjtHtKe5fLs18BuiGDWZU9HhvyBpTQkf6IFz2pZP
         I/J7aRgOi14aec9Jethm+P9OsNq8tugfiECGx1CA2jNy84x0fClL7SAdW/NMaZ5OUsPd
         GL6Wd3O1fSdKoXgqWm3COxbOIQjAr6CUWMohuZ6JZ7S0J8LpIVQ/6yKif8DDctYdt0YW
         RCINdLGvoRV22/5LRLnIGbNRGfCU/xLxGI6QjaXcZG4bew5rEN1/MaiKTyTim83jYMbc
         ekgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=pwPpbQwoG9o3QSo2r1jjfym4Xc0Mwh92lEpEt60WDJs=;
        b=pxi5v+Pmqwym5vLKaJIwSRg8efKLEX+oWJBMRiO6j+xAMCGUOOkddXMCwOmc1aco6t
         0QVRwPMGNSDg8cM6Gmwcd1s/MDnuWYmlMAAVJXnImzZfDIRKcm1U+PN2D6TjDIojYMHW
         KAs+O60m3/nIb1twkyQJqJijZnImyucN8cNvDPDuN+3XaCPP0smsK3JA63lfENcBBunA
         zIPpmiPIkyzrNiyYxFDyK+Z40GIUX52szF1hauU2FgB1OEfnbiMyhy/R8yTsZWdk0JlZ
         2wY57pQPPYUZdm3IvVazSkryhVvhyf5/SeZ1oYQXnkQcty997efXAa0p0y9BJtTu/apc
         /x1w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k7-20020a05622a03c700b003b9b60dd798si53869qtx.761.2023.03.02.09.43.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Mar 2023 09:43:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pXmx0-0004xP-EM; Thu, 02 Mar 2023 12:42:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=Cwst=62=kaod.org=clg@ozlabs.org>)
 id 1pXmwo-0004ql-Fz; Thu, 02 Mar 2023 12:42:32 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=Cwst=62=kaod.org=clg@ozlabs.org>)
 id 1pXmwm-0002lp-Nq; Thu, 02 Mar 2023 12:42:30 -0500
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4PSJMh25ZLz4x8w;
 Fri,  3 Mar 2023 04:42:24 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4PSJMf1RlSz4x5X;
 Fri,  3 Mar 2023 04:42:21 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Klaus Jensen <k.jensen@samsung.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 04/11] tests/avocado/machine_aspeed.py: Add an I2C slave test
Date: Thu,  2 Mar 2023 18:41:59 +0100
Message-Id: <20230302174206.2434673-5-clg@kaod.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230302174206.2434673-1-clg@kaod.org>
References: <20230302174206.2434673-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=Cwst=62=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: vDzSYyNJF+oV

The Aspeed 2600 I2C controller supports a slave mode which can be
tested with the I2C echo device. Test extracted from :

  https://lists.nongnu.org/archive/html/qemu-devel/2022-06/msg00183.html

Suggested-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 tests/avocado/machine_aspeed.py | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tests/avocado/machine_aspeed.py b/tests/avocado/machine_aspeed.py
index ddf05b3617..d2c57ccb7e 100644
--- a/tests/avocado/machine_aspeed.py
+++ b/tests/avocado/machine_aspeed.py
@@ -199,6 +199,8 @@ def test_arm_ast2600_evb_buildroot(self):
                          'tmp105,bus=aspeed.i2c.bus.3,address=0x4d,id=tmp-test');
         self.vm.add_args('-device',
                          'ds1338,bus=aspeed.i2c.bus.3,address=0x32');
+        self.vm.add_args('-device',
+                         'i2c-echo,bus=aspeed.i2c.bus.3,address=0x42');
         self.do_test_arm_aspeed_buildroot_start(image_path, '0xf00')
 
         exec_command_and_wait_for_pattern(self,
@@ -217,6 +219,14 @@ def test_arm_ast2600_evb_buildroot(self):
         year = time.strftime("%Y")
         exec_command_and_wait_for_pattern(self, 'hwclock -f /dev/rtc1', year);
 
+        exec_command_and_wait_for_pattern(self,
+             'echo slave-24c02 0x1064 > /sys/bus/i2c/devices/i2c-3/new_device',
+             'i2c i2c-3: new_device: Instantiated device slave-24c02 at 0x64');
+        exec_command(self, 'i2cset -y 3 0x42 0x64 0x00 0xaa i');
+        time.sleep(0.1)
+        exec_command_and_wait_for_pattern(self,
+             'hexdump /sys/bus/i2c/devices/3-1064/slave-eeprom',
+             '0000000 ffaa ffff ffff ffff ffff ffff ffff ffff');
         self.do_test_arm_aspeed_buildroot_poweroff()
 
 
-- 
2.39.2


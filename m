Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp1382355lfb;
        Mon, 13 Jun 2022 06:28:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzvn/U726LJhcF9gFbPF6uDfXsD+jJjOZwMJNapvuVwk/Tlb/ERtRNHYkjQfA6NTvbDDOQD
X-Received: by 2002:a05:6214:2602:b0:46b:9674:2c40 with SMTP id gu2-20020a056214260200b0046b96742c40mr31175290qvb.96.1655126883148;
        Mon, 13 Jun 2022 06:28:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655126883; cv=none;
        d=google.com; s=arc-20160816;
        b=uPj8aoB451Cpl6DqqoQ34nqexhsfLcRQb1SR2m05nMUlTTdNa2oMoqTQzuQ7Q324Bk
         kWWX3iJ69TvpqL3MvB352C746NbneOyyiz62TWU66+I+HDDMV83D6xiEs0dmLpZDU+fM
         OlIoCyWZ434VWWP7CONXE0MShfK1c0ZBe+Z5YyWO1tNkyfCamsylsCd3S3RW/sp3GdI3
         pNGcaANBtQnJzmCfrxRgBNB++7ToxTT0h5EXqTqZIGv6dU8D3AeZidlI30ATu2U0uDqg
         vngqsJXS0WJ7Feh3p7b4/zZsKOXz7kz71mptJfkms3H0RGrV3QzPCLCp1aKPmxR2XZVC
         /xrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=XIkbDC0XkaJP8eLRzIG3VUQPdKlkk8A59MVkQijv4co=;
        b=vtGeRPPytCeLK7D6wQ4rsN0G7pmgEA0LzPe2C3LqevOQAPDaIhlYAojUymEu/FQJFB
         DJeYTWWRDrsnsj0VBvCevrGGhcLBORoZRIV22KZUP36q8DVIYOdVaA+K1IH0l46aHhhM
         AUq/nkH3b08ywzLBr8U1lcMxQW4FoCyqBTOHgo03MKdFjLBF1KSXP/Rog5TYe++OJ/cS
         mlNwUoCJa1SQjEbdMNGpqUHiT4CNCca0ijNOeEUdLignAbWQu07Vx95Qk1PuvbjeTJG7
         EjcTq0iawMbVB64M6cZ7hs8r9lhsfNcvyE/G4BdiMWXZeopfeaGPoOeQNH89rw5SI28/
         idEA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r15-20020a05620a298f00b006a6ad00145dsi5374692qkp.449.2022.06.13.06.28.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Jun 2022 06:28:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o0k6s-0002jI-LG
	for alex.bennee@linaro.org; Mon, 13 Jun 2022 09:28:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=yfRC=WU=kaod.org=clg@ozlabs.org>)
 id 1o0k5T-0000uN-To; Mon, 13 Jun 2022 09:26:35 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:37425
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=yfRC=WU=kaod.org=clg@ozlabs.org>)
 id 1o0k5R-0004bQ-ST; Mon, 13 Jun 2022 09:26:35 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LMC5M1mKRz4yZ9;
 Mon, 13 Jun 2022 23:26:31 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LMC5F6Xbjz4yZN;
 Mon, 13 Jun 2022 23:26:25 +1000 (AEST)
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
Subject: [PATCH v2 06/17] test/avocado/machine_aspeed.py: Add an I2C RTC test
Date: Mon, 13 Jun 2022 15:25:28 +0200
Message-Id: <20220613132539.2199772-7-clg@kaod.org>
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
X-TUID: t79Ac6WYczCr

Add an RTC device and check that the output of the hwclock command
matches the current year.

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


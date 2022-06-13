Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp1384334lfb;
        Mon, 13 Jun 2022 06:31:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxbO1vFgqc4mCi5JoLnHBCqG8XXiacGWDTRHyoPTBgl/bApGJGX8I0WjOyzGZpFsxGnQme6
X-Received: by 2002:a0c:f886:0:b0:46a:a0f8:db40 with SMTP id u6-20020a0cf886000000b0046aa0f8db40mr34680437qvn.88.1655127087952;
        Mon, 13 Jun 2022 06:31:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655127087; cv=none;
        d=google.com; s=arc-20160816;
        b=0Kc3pIwXmT+zC4uYM7be5st5Ofh/KLM8f8qouK5M+YQ2bpJ99lBEGTpRh2fmEabkiv
         fOwpDLJ7y5orOKioM+jEY2J4DqwQyTNa0l44JwkgovMDjmb687UY7FORjvfnm2qkxqRP
         RtZP/4/pvQLXK7GT+z1tepkx77g+1nqhpR5fnGETcF2Jl58CmqmPsyf0fnqkuaz5VZSW
         7Z7xkKoISlt/+qD2vMjypzK5mneZQRlewNIL1h7KK3HSwBpR0tS+7HBZ00sK0VCE9CAX
         nTtD/878vGJiKAcx7GFuXiivpKrwvxR9db9vZKTOelTngfEYlYRg42SqPshJCkUeHAQk
         X0/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=uqszZV5IFppkqnypr5N9KiDN2zTssZTkHLmz5b3hIns=;
        b=FyocpvvdAkJ12rYj7eRNR/CI8mRSDoz115m/8bDncVVXUFYB478VTU6JyWiD6t6xlB
         2HE9ds5qneRmcEupo5T0qVnxZ7fAkew7pWdRcla/r1em/ZnLzgxS5e1maOHJqsjMyL+U
         hQpF8lZdg2HSLKjb537ZXJa9JhWAqg6+QS0irIeS302WUoNAHd67qcF54+a+uQWhDfEQ
         B2ZOmezkslojW14jvCf5lLz5DXufEyS0MvZH0mwLSbN5mmvp8sJq+8/MTCLljs2C4wrL
         Ym2pZp/tkLRCDwTbUILnQG/d14n1TcD1pOCaGV/2xAdTy4MNcmm2Zk51pj9uWbfH/KJ8
         zBOw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p7-20020a05622a048700b00304df11e784si4129084qtx.634.2022.06.13.06.31.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Jun 2022 06:31:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o0kAB-0006q6-CQ
	for alex.bennee@linaro.org; Mon, 13 Jun 2022 09:31:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=yfRC=WU=kaod.org=clg@ozlabs.org>)
 id 1o0k5H-0000R5-ML; Mon, 13 Jun 2022 09:26:23 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:37145)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=yfRC=WU=kaod.org=clg@ozlabs.org>)
 id 1o0k5G-0004UD-1M; Mon, 13 Jun 2022 09:26:23 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LMC573w25z4xw8;
 Mon, 13 Jun 2022 23:26:19 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LMC521bsBz4yZ6;
 Mon, 13 Jun 2022 23:26:13 +1000 (AEST)
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
Subject: [PATCH v2 04/17] test/avocado/machine_aspeed.py: Add I2C tests to
 ast2500-evb
Date: Mon, 13 Jun 2022 15:25:26 +0200
Message-Id: <20220613132539.2199772-5-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220613132539.2199772-1-clg@kaod.org>
References: <20220613132539.2199772-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
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
X-TUID: s+GEI0+hckDo

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


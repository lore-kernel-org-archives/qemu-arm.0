Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp1384525lfb;
        Mon, 13 Jun 2022 06:31:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwlnilLKSiRHeZXXqilNtsVqSRW2m9nqhylc8wGbT+8QFb2dRJAtL8r4/1SqSyg5TUHP89u
X-Received: by 2002:a05:6214:d48:b0:464:7c9a:4f39 with SMTP id 8-20020a0562140d4800b004647c9a4f39mr47268798qvr.124.1655127105397;
        Mon, 13 Jun 2022 06:31:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655127105; cv=none;
        d=google.com; s=arc-20160816;
        b=i17hO+6Quk3ZpTXvYEzgdxgyikFA6t3zwIUbB5ti1oJktnWDsKRJUB8wSdySC3EFKD
         xPwFS74BVJJGfWtQHM5WN4Hw2zNtt6ilmndXnyg/qXgkQGuwkropwZW9Pj7gwV7A+pr9
         onDtfY6fWzecoj4uUflJoHlMTnnu4krzGwCrmsZGa7USe3rgIXVxkDvu7TUMcvnoh8Ha
         jizmp+iZ56RiNR3lY+G3ODuX/G0k4zEGUGNvgWtVDeyT9+x6RehovLGt78APAYxn1Bei
         V/Oq/1zuyXFXyG1gZ7nKs3C4/+dtnX7NKT1p6MPSA+C4qDdFIzt8NLjsHTKjAcbxnaL7
         sCmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=kvhcGALlHMP0bG4Uiyn13tWoi9taDNF7qsmLzHSdvAQ=;
        b=PKrm6krAjJpDYdHOEwQaSVeAC8lPmoS7fnME7V2AnwanOILKEw0sJxCxKHdKx4Lmmh
         ydysSGfBxQoaobwJEfUJ6TJob0gKXN4wS5flX73OZYHnnJ4JIECM9nSZ1VSiQfhTJkac
         d0JD9G7cXHvI8PH/bqBmYnpjp8pbwjlyHkoLs2xjeZRl0dKfhgNgvqusHsHKjVEUms3I
         MKun15NllvVtFSqvvYTwn5xlSOhL5FVJuvBddKrHQ+A6eBlWOBqEVLo36wkRIJnBuexB
         oDDz+GIGIsYEqcNvkpb+gjyv5c3fnpcyzFxeED9XMisVRyYy2yxC50hiOKxXknSgILv8
         hLeg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z24-20020ac875d8000000b0030503115a33si3436819qtq.423.2022.06.13.06.31.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Jun 2022 06:31:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o0kAS-0007aB-Sl
	for alex.bennee@linaro.org; Mon, 13 Jun 2022 09:31:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=yfRC=WU=kaod.org=clg@ozlabs.org>)
 id 1o0k5N-0000hk-P2; Mon, 13 Jun 2022 09:26:29 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:60451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=yfRC=WU=kaod.org=clg@ozlabs.org>)
 id 1o0k5L-0004Ut-Si; Mon, 13 Jun 2022 09:26:29 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LMC5F2pG5z4yZL;
 Mon, 13 Jun 2022 23:26:25 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LMC580Vygz4yXg;
 Mon, 13 Jun 2022 23:26:19 +1000 (AEST)
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
Subject: [PATCH v2 05/17] test/avocado/machine_aspeed.py: Add I2C tests to
 ast2600-evb
Date: Mon, 13 Jun 2022 15:25:27 +0200
Message-Id: <20220613132539.2199772-6-clg@kaod.org>
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
X-TUID: pGy51/5SsHrN

Create a named I2C temperature sensor device on the command line,
instantiate device from Linux since it is not part of the device tree,
and check the temperature is correctly reported under sysfs.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 tests/avocado/machine_aspeed.py | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/tests/avocado/machine_aspeed.py b/tests/avocado/machine_aspeed.py
index 4d2766e1d44d..0a1ceec13eb1 100644
--- a/tests/avocado/machine_aspeed.py
+++ b/tests/avocado/machine_aspeed.py
@@ -147,5 +147,18 @@ def test_arm_ast2600_evb_builroot(self):
         image_path = self.fetch_asset(image_url, asset_hash=image_hash,
                                       algorithm='sha256')
 
+        self.vm.add_args('-device',
+                         'tmp105,bus=aspeed.i2c.bus.3,address=0x4d,id=tmp-test');
         self.do_test_arm_aspeed_buidroot_start(image_path, '0xf00')
+
+        exec_command_and_wait_for_pattern(self,
+             'echo lm75 0x4d > /sys/class/i2c-dev/i2c-3/device/new_device',
+             'i2c i2c-3: new_device: Instantiated device lm75 at 0x4d');
+        exec_command_and_wait_for_pattern(self,
+                             'cat /sys/class/hwmon/hwmon0/temp1_input', '0')
+        self.vm.command('qom-set', path='/machine/peripheral/tmp-test',
+                        property='temperature', value=18000);
+        exec_command_and_wait_for_pattern(self,
+                             'cat /sys/class/hwmon/hwmon0/temp1_input', '18000')
+
         self.do_test_arm_aspeed_buidroot_poweroff()
-- 
2.35.3


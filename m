Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp1455002lfb;
        Mon, 6 Jun 2022 08:32:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyMNJc1Q+bkpbH7CtfNVOtFW3K9n9FzTuxjKq93+q9lxXVV0DjyAdiwseUbfuigX+3VW089
X-Received: by 2002:a05:622a:1baa:b0:303:6049:8aeb with SMTP id bp42-20020a05622a1baa00b0030360498aebmr19138861qtb.10.1654529569940;
        Mon, 06 Jun 2022 08:32:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654529569; cv=none;
        d=google.com; s=arc-20160816;
        b=P6lx6YWlOVWIC8liuxXdnIX1Ocy38PPdxMPRYz+xPyOe3TN8ngNVERrByQc/RGzBnU
         RKdmNGSz8j1Pc4Z9pHy+0PthD165l5j5/uY28lUYyg4dHEUC8bBYkPE1nTVuYPuQFryi
         dxyQypMgtS8H8W/EnH4LpP5jMoZUlvi5mI4kifx24bOefbj+y8blow/jDtOHzNiLoUFL
         KUiJuIV57Ex6peWNQAw3+2koLM+CYmS3LwU5vqAc/fEl8v/3DeXyxSHslVM8M7N/N5eN
         T8Xm+vDp51M7zrv2PjC6EsEIDrC/hHb6OxsjKQ6UOUbuDsdcHg3aLasWUX/nYPEocuhJ
         43hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=CxJEY9naY5OALhyxrhXsZNjoY9H5QJEKBbq75VZkD2w=;
        b=X1O7cXv0cHXQg2gtWJ0sc/A6hj1Vvkopqwa6Jv1gUIt2DdM8D/hywlKL7ducvfyJi4
         q4dekmOjz7cObJs0mZR6chX2rCBu6EnP3B8x8Y4gdvjDlQDcqVqcjTVDEOxITKdJ4y8x
         jEt7FAx3R3A46LWDpy8S4k+8DODkSOImHK1XXyQcXHLvxoVtb0frxc3jLcIO3Lalq4mB
         K+tMn5dWHzTZRRojPzRKNKebg0qaTMGjgA/MoWTXqCniyQIYn9KvTK+5MSeTioyUky0+
         wXXYOpbhwsUXZNz/If4r9YNAkToEOMnzmgj7g3k6qeY/KP/rcruzRkgjfII0J+IZhB6z
         a1XA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s15-20020ac85ccf000000b002f94330d075si8390166qta.39.2022.06.06.08.32.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jun 2022 08:32:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nyEin-0000dd-FK
	for alex.bennee@linaro.org; Mon, 06 Jun 2022 11:32:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=gtQ3=WN=kaod.org=clg@ozlabs.org>)
 id 1nyEMh-0008UC-GL; Mon, 06 Jun 2022 11:09:59 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:55939
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=gtQ3=WN=kaod.org=clg@ozlabs.org>)
 id 1nyEMf-0006Ez-KD; Mon, 06 Jun 2022 11:09:59 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LGxjs22WFz4xZf;
 Tue,  7 Jun 2022 01:09:53 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LGxjl6kQ7z4xZY;
 Tue,  7 Jun 2022 01:09:47 +1000 (AEST)
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
Subject: [PATCH 21/21] test/avocado/machine_aspeed.py: Add I2C slave tests
Date: Mon,  6 Jun 2022 17:07:32 +0200
Message-Id: <20220606150732.2282041-22-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220606150732.2282041-1-clg@kaod.org>
References: <20220606150732.2282041-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=gtQ3=WN=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
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
X-TUID: 6vfVpC3MeCGV

Test extracted from :

  https://lists.nongnu.org/archive/html/qemu-devel/2022-06/msg00183.html

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 tests/avocado/machine_aspeed.py | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tests/avocado/machine_aspeed.py b/tests/avocado/machine_aspeed.py
index 28b8a4c8124b..89447dbebcb9 100644
--- a/tests/avocado/machine_aspeed.py
+++ b/tests/avocado/machine_aspeed.py
@@ -138,6 +138,8 @@ def test_arm_ast2600_evb_builroot(self):
                          'tmp423,bus=aspeed.i2c.bus.15,address=0x4c');
         self.vm.add_args('-device',
                          'ds1338,bus=aspeed.i2c.bus.15,address=0x32');
+        self.vm.add_args('-device',
+                         'i2c-echo,bus=aspeed.i2c.bus.15,address=0x42');
         self.do_test_arm_aspeed_buidroot_start(image_path, '0xf00')
         exec_command_and_wait_for_pattern(self,
                                           'i2cget -y 15 0x4c 0xff', '0x23');
@@ -150,4 +152,13 @@ def test_arm_ast2600_evb_builroot(self):
         year = time.strftime("%Y")
         exec_command_and_wait_for_pattern(self, 'hwclock -f /dev/rtc1', year);
 
+        exec_command_and_wait_for_pattern(self,
+             'echo slave-24c02 0x1064 > /sys/bus/i2c/devices/i2c-15/new_device',
+             'i2c i2c-15: new_device: Instantiated device slave-24c02 at 0x64');
+        exec_command(self, 'i2cset -y 15 0x42 0x64 0x00 0xaa i');
+        time.sleep(0.1)
+        exec_command_and_wait_for_pattern(self,
+             'hexdump /sys/bus/i2c/devices/15-1064/slave-eeprom',
+             '0000000 ffaa ffff ffff ffff ffff ffff ffff ffff');
+
         self.do_test_arm_aspeed_buidroot_poweroff()
-- 
2.35.3


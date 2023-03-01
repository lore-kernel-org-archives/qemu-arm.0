Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp7183994ejc;
        Wed, 1 Mar 2023 08:58:07 -0800 (PST)
X-Google-Smtp-Source: AK7set//E7wnNoYwsnEugN9kfEVuSnqP9q8xaCBNLidlQvzdxaj30qp8M8SfwIgQuKGordqTTvkH
X-Received: by 2002:a05:6214:4116:b0:572:750f:b22c with SMTP id kc22-20020a056214411600b00572750fb22cmr12990756qvb.8.1677689887272;
        Wed, 01 Mar 2023 08:58:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677689887; cv=none;
        d=google.com; s=arc-20160816;
        b=uRek1z60ZEV0y5AT7SKGtnhNIDXR3xwM6PIomC2F3gAYTBB33Zi6UhjYLy5yig/MHq
         iWW2fl3TGCPb95SxKRGKlj+UDqTWi1em/GzFOe/f+R9PxTsBCIgosig6JNBwmioIk8Xh
         A5Lw424R9OMQN3rjEs6owJ6ksQTi7PcPMIYFQNPoInbzi7IdH9skqVZSpA5WEg7UbMcO
         8IcD0TYhzTLT0ausk+1ABR0jbEtjfU0qE2ZuM6Stn+Jal9l/sVUjdCpEiCerxNEhXSEZ
         MA8voESEsEirHoR4NDvC5H9z7KBr6iwLfi1A8rzOt/82IT4nCXmAU2k4jV0YD/G+IWJw
         vlKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=tB+RSRn9BCRAGj6kiSa+JmUHd2WMI9QQJZt2C6c4k3o=;
        b=yAb16WDH2/z/JZ4cJeH/f8bc7PRKHKXtyY7Od6q9kv1ii7bYuFPXLAoa5mftmYEQZa
         kqz01UaNkMqAmCuwEcui9ddHGrihPALgbtGS5HcfT3usgWvYVm27+oqMcn63OO3NomZ6
         sVeCsCWhoGDvlb895/zw4ufJWp5scOlz3h+j1+kJ7WyYTkMfHhcmN6mF6iTUDzQ8+A0I
         dyJI4YS6PN0gd5DbrFOhnrXjpnXqxJ1YaZcztV8B1S30+LjX+rgvrpmZZNg2TbEt+zdE
         3J/PL7X+EzZpDb6wKDQQ592qeLqmLRQcpVqEwTi+AOH3kh+IgrbXq1S9Bjrh2J4DQofc
         fWIg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v6-20020a05620a440600b007107e3bb636si12801332qkp.191.2023.03.01.08.58.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Mar 2023 08:58:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pXPl3-0000gn-6X; Wed, 01 Mar 2023 11:56:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=znpK=6Z=kaod.org=clg@ozlabs.org>)
 id 1pXPl1-0000fj-Sf; Wed, 01 Mar 2023 11:56:47 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=znpK=6Z=kaod.org=clg@ozlabs.org>)
 id 1pXPkz-0007dr-MS; Wed, 01 Mar 2023 11:56:47 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4PRgPR2Bx5z4x7v;
 Thu,  2 Mar 2023 03:56:43 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4PRgPN74xvz4x1R;
 Thu,  2 Mar 2023 03:56:40 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Klaus Jensen <k.jensen@samsung.com>
Subject: [PATCH v2 04/11] tests/avocado/machine_aspeed.py: Add an I2C slave
 test
Date: Wed,  1 Mar 2023 17:56:12 +0100
Message-Id: <20230301165619.2171090-5-clg@kaod.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230301165619.2171090-1-clg@kaod.org>
References: <20230301165619.2171090-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=znpK=6Z=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_PASS=-0.001,
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
X-TUID: q8Ak3nMFQsWc

The Aspeed 2600 I2C controller supports a slave mode which can be
tested with the I2C echo device. Test extracted from :

  https://lists.nongnu.org/archive/html/qemu-devel/2022-06/msg00183.html

Suggested-by: Klaus Jensen <k.jensen@samsung.com>
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


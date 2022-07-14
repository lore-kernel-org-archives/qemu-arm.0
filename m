Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp730713lfp;
        Thu, 14 Jul 2022 08:55:48 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vUqBWrEqnB/4pofnW2TqemJYwFnACGG3vlhLFIAZf92x6BGk2G3l8g5kEMBN2yq9YsGH7m
X-Received: by 2002:a05:622a:c7:b0:31d:47d3:526 with SMTP id p7-20020a05622a00c700b0031d47d30526mr8652384qtw.581.1657814147848;
        Thu, 14 Jul 2022 08:55:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657814147; cv=none;
        d=google.com; s=arc-20160816;
        b=jUUvO5yhOJ4OG15c+KigPe10oXK0qO1GKViOCcGfNAJgf0ArKHwDxnWu8kllPYjp40
         LiqBNs64/VcfuWWC6vg8KYXL/ANp3wGbYQNlsTU6ohk03sNtwwMIm/RpYkdGYY6N/YYU
         QOVsCluquMLVIN/7qoh6skfwi9XSyNOUX9jgDtt8n0uWf31LwvALef0KZYNmM0CH1nEd
         lMleWepSkLASKgh8UPDQJK02dajahwy4jQuwwOcgFO4Wsw3Z5cRS8Kr4EZz5TbJrDDtT
         C8mQrJfa5xdBl/GKa+YJLrvg+8BI4jhBkuTF6QqYcK2L37NZUWZtGTA5NLaKYqHye46p
         mA1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=2hRNCGQNNCjU0RuWoB/0lf8I9a6haOSqLlNPmv2eBSk=;
        b=kRKdcUU6VZHBlfJfQMWY7FYb0+pchhuBr1oZNlyViBRZ/VR9ZR9dQY1qtvHG4ZXqOJ
         e1ken0tv864xIe8s25EzQneppaVvpju7uE7emKe8edd72nksepqWG5CGIPpkMTu0Jgk4
         q/AmwxsgYidsy+IbuhDLNu4K8f6+IOCLPll9488cEYyFGpG4fuNgvM6wL4usrWctVsBb
         3KHil+gGVmj7SulD1bFF8PHDwjZBll1aGIdoTTWxlhw1Y33PNUvACHDPTBwwcs0iXeSH
         MPWL5Q21eW6lirN4FbtCTjULtmgDt0Lw3a8ye0gXgMv7ICRoQmpHWWIb35sGyKQvMN9h
         v3uw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q11-20020a05621419eb00b00461d1e09c17si1270256qvc.217.2022.07.14.08.55.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Jul 2022 08:55:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oC1Br-0005lC-Bl
	for alex.bennee@linaro.org; Thu, 14 Jul 2022 11:55:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=QWOl=XT=kaod.org=clg@ozlabs.org>)
 id 1oC126-0005Oo-Nt; Thu, 14 Jul 2022 11:45:45 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:41067
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=QWOl=XT=kaod.org=clg@ozlabs.org>)
 id 1oC122-0000qX-VM; Thu, 14 Jul 2022 11:45:41 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LkJjX3G2Zz4yTL;
 Fri, 15 Jul 2022 01:45:36 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LkJjV6p2Dz4xdJ;
 Fri, 15 Jul 2022 01:45:34 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 14/19] test/avocado/machine_aspeed.py: Add SDK tests
Date: Thu, 14 Jul 2022 17:44:51 +0200
Message-Id: <20220714154456.2565189-15-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220714154456.2565189-1-clg@kaod.org>
References: <20220714154456.2565189-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=QWOl=XT=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Tfs7WXSZaLGf

The Aspeed SDK kernel usually includes support for the lastest HW
features. This is interesting to exercise QEMU and discover the gaps
in the models.

Add extra I2C tests for the AST2600 EVB machine to check the new
register interface.

Message-Id: <20220707091239.1029561-1-clg@kaod.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 tests/avocado/machine_aspeed.py | 68 +++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/tests/avocado/machine_aspeed.py b/tests/avocado/machine_aspeed.py
index 3b8f784a57b6..b4e35a3d0743 100644
--- a/tests/avocado/machine_aspeed.py
+++ b/tests/avocado/machine_aspeed.py
@@ -170,3 +170,71 @@ def test_arm_ast2600_evb_builroot(self):
         exec_command_and_wait_for_pattern(self, 'hwclock -f /dev/rtc1', year);
 
         self.do_test_arm_aspeed_buidroot_poweroff()
+
+
+    def do_test_arm_aspeed_sdk_start(self, image, cpu_id):
+        self.vm.set_console()
+        self.vm.add_args('-drive', 'file=' + image + ',if=mtd,format=raw',
+                         '-net', 'nic', '-net', 'user')
+        self.vm.launch()
+
+        self.wait_for_console_pattern('U-Boot 2019.04')
+        self.wait_for_console_pattern('## Loading kernel from FIT Image')
+        self.wait_for_console_pattern('Starting kernel ...')
+        self.wait_for_console_pattern('Booting Linux on physical CPU ' + cpu_id)
+
+    def test_arm_ast2500_evb_sdk(self):
+        """
+        :avocado: tags=arch:arm
+        :avocado: tags=machine:ast2500-evb
+        """
+
+        image_url = ('https://github.com/AspeedTech-BMC/openbmc/releases/'
+                     'download/v08.01/ast2500-default-obmc.tar.gz')
+        image_hash = ('5375f82b4c43a79427909342a1e18b4e48bd663e38466862145d27bb358796fd')
+        image_path = self.fetch_asset(image_url, asset_hash=image_hash,
+                                      algorithm='sha256')
+        archive.extract(image_path, self.workdir)
+
+        self.do_test_arm_aspeed_sdk_start(
+            self.workdir + '/ast2500-default/image-bmc', '0x0')
+        self.wait_for_console_pattern('ast2500-default login:')
+
+    def test_arm_ast2600_evb_sdk(self):
+        """
+        :avocado: tags=arch:arm
+        :avocado: tags=machine:ast2600-evb
+        """
+
+        image_url = ('https://github.com/AspeedTech-BMC/openbmc/releases/'
+                     'download/v08.01/ast2600-default-obmc.tar.gz')
+        image_hash = ('f12ef15e8c1f03a214df3b91c814515c5e2b2f56119021398c1dbdd626817d15')
+        image_path = self.fetch_asset(image_url, asset_hash=image_hash,
+                                      algorithm='sha256')
+        archive.extract(image_path, self.workdir)
+
+        self.vm.add_args('-device',
+                         'tmp105,bus=aspeed.i2c.bus.5,address=0x4d,id=tmp-test');
+        self.vm.add_args('-device',
+                         'ds1338,bus=aspeed.i2c.bus.5,address=0x32');
+        self.do_test_arm_aspeed_sdk_start(
+            self.workdir + '/ast2600-default/image-bmc', '0xf00')
+        self.wait_for_console_pattern('ast2600-default login:')
+        exec_command_and_wait_for_pattern(self, 'root', 'Password:')
+        exec_command_and_wait_for_pattern(self, '0penBmc', 'root@ast2600-default:~#')
+
+        exec_command_and_wait_for_pattern(self,
+             'echo lm75 0x4d > /sys/class/i2c-dev/i2c-5/device/new_device',
+             'i2c i2c-5: new_device: Instantiated device lm75 at 0x4d');
+        exec_command_and_wait_for_pattern(self,
+                             'cat /sys/class/hwmon/hwmon19/temp1_input', '0')
+        self.vm.command('qom-set', path='/machine/peripheral/tmp-test',
+                        property='temperature', value=18000);
+        exec_command_and_wait_for_pattern(self,
+                             'cat /sys/class/hwmon/hwmon19/temp1_input', '18000')
+
+        exec_command_and_wait_for_pattern(self,
+             'echo ds1307 0x32 > /sys/class/i2c-dev/i2c-5/device/new_device',
+             'i2c i2c-5: new_device: Instantiated device ds1307 at 0x32');
+        year = time.strftime("%Y")
+        exec_command_and_wait_for_pattern(self, 'hwclock -f /dev/rtc1', year);
-- 
2.35.3


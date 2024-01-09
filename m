Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp533943ejs;
        Tue, 9 Jan 2024 09:36:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHedWLU+7Bl1dLkT8ouWpVq3CXIWq7JE/MwCH3bKpRSbPQp8MK25KuX4SVb/s5uIni/BS7J
X-Received: by 2002:a05:6214:23cc:b0:680:d4d8:4297 with SMTP id hr12-20020a05621423cc00b00680d4d84297mr6802548qvb.44.1704821802607;
        Tue, 09 Jan 2024 09:36:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704821802; cv=none;
        d=google.com; s=arc-20160816;
        b=kjL5q96LPFg/7tjtriQZNxYzwe7l0UBJcY8SZtdP1iU1dXMFvV6S5pLq/BR5X4o/Xw
         yeJmqoHAA/BPFH0H2dvvC8vo25A/ZCMHiX6J/1z/19md0YVvJ/Xh37oof1nt6RCWAbJJ
         zBJZV76XfVvd5T1HB77iUY0G0ygMrKA8HkzjKtHXzFwIi/Ogr9wjYEXF6ATEgaL77QAM
         rYVNtuvZ/9FPLhtRUk/DTU7UocP9idBQrjW53xilo9A0lUcoDJKIhvNhekzJ4nj4sObn
         IagUHXrESNH2QazzBHXHBtHKXhqkoon7xyx08qU2Jqs9uSbvFcqLNkwkJU9Lml4zxoIg
         PBzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=ZcYirumRuyZPaFy/9HFOSE2W5znoMqi8X59+loeJRSc=;
        fh=H+bnH/1LVxfdWyHUrNnyE6eBPUhUnkevyjpu/3Dm6qA=;
        b=HsiDwbIiw8XBlPiTwdlhGIrz05bo+ooZzgpOR7GoX0nELZedeeHYdWO9TmfLt2jrZ3
         6vpHr7pW1HrmZaHOn3z3bOHwDIu/d/LfkvCeuk43RVJH4Wqp9ZScOIbf5FY41b2Y69V6
         HkLdjEx3FVSKlAdqXkWxJTxxxDwnC93CnDx4V6nIlT0jthesOscsHAIWoVk0UUQgzKRE
         69OCig2X1ii+loYePKuGA7YiR+b3zug/zLfNgoKE5E/kaRdZIHtscf3VuFW+9TsPpM9C
         NCzt0Ko5Dt40AZ6addToB0wJ1kfvjzpPy1Wgz6KvslEUvNQp9T9rVFa9OnAs9XwR6CkX
         aA2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v12-20020a05620a0f0c00b007830dd7eaf3si2497912qkl.633.2024.01.09.09.36.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jan 2024 09:36:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rNG1Q-0001ou-Gz; Tue, 09 Jan 2024 12:36:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=Gpa9=IT=kaod.org=clg@ozlabs.org>)
 id 1rNG1M-0001gz-5t; Tue, 09 Jan 2024 12:36:12 -0500
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=Gpa9=IT=kaod.org=clg@ozlabs.org>)
 id 1rNG16-0004iu-ND; Tue, 09 Jan 2024 12:36:10 -0500
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4T8dPd0T1mz4wxZ;
 Wed, 10 Jan 2024 04:35:49 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4T8dPZ1Cgsz4wx5;
 Wed, 10 Jan 2024 04:35:45 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH] tests/avocado/machine_aspeed.py: Update buildroot images to
 2023.11
Date: Tue,  9 Jan 2024 18:35:38 +0100
Message-ID: <20240109173538.435781-1-clg@kaod.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=Gpa9=IT=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: blZeDm5t+9ye

Compared to mainline buildroot, these images have some customization :

- Linux version is bumped to 6.6.3 and built with a custom config
- U-Boot is switched to the one provided by OpenBMC for more support
- defconfigs extra tools for dev

See branch [1] for more details.

There are a few changes since last update, commit ed1f5ff84209. Images
all have a password now and I2C devices have been updated in the Linux
ast2600-evb device tree [2]. Do the necessary adjustements.

[1] https://github.com/legoater/buildroot/commits/aspeed-2023.11
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=9deb10cf160e

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 tests/avocado/machine_aspeed.py | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/tests/avocado/machine_aspeed.py b/tests/avocado/machine_aspeed.py
index 6fa5459a07bf..cec018142453 100644
--- a/tests/avocado/machine_aspeed.py
+++ b/tests/avocado/machine_aspeed.py
@@ -155,6 +155,7 @@ def do_test_arm_aspeed_buildroot_start(self, image, cpu_id, pattern='Aspeed EVB'
         time.sleep(0.1)
         exec_command(self, 'root')
         time.sleep(0.1)
+        exec_command(self, "passw0rd")
 
     def do_test_arm_aspeed_buildroot_poweroff(self):
         exec_command_and_wait_for_pattern(self, 'poweroff',
@@ -167,14 +168,14 @@ def test_arm_ast2500_evb_buildroot(self):
         """
 
         image_url = ('https://github.com/legoater/qemu-aspeed-boot/raw/master/'
-                     'images/ast2500-evb/buildroot-2022.11-2-g15d3648df9/flash.img')
-        image_hash = ('f96d11db521fe7a2787745e9e391225deeeec3318ee0fc07c8b799b8833dd474')
+                     'images/ast2500-evb/buildroot-2023.11/flash.img')
+        image_hash = ('c23db6160cf77d0258397eb2051162c8473a56c441417c52a91ba217186e715f')
         image_path = self.fetch_asset(image_url, asset_hash=image_hash,
                                       algorithm='sha256')
 
         self.vm.add_args('-device',
                          'tmp105,bus=aspeed.i2c.bus.3,address=0x4d,id=tmp-test');
-        self.do_test_arm_aspeed_buildroot_start(image_path, '0x0')
+        self.do_test_arm_aspeed_buildroot_start(image_path, '0x0', 'Aspeed AST2500 EVB')
 
         exec_command_and_wait_for_pattern(self,
              'echo lm75 0x4d > /sys/class/i2c-dev/i2c-3/device/new_device',
@@ -195,8 +196,8 @@ def test_arm_ast2600_evb_buildroot(self):
         """
 
         image_url = ('https://github.com/legoater/qemu-aspeed-boot/raw/master/'
-                     'images/ast2600-evb/buildroot-2022.11-2-g15d3648df9/flash.img')
-        image_hash = ('e598d86e5ea79671ca8b59212a326c911bc8bea728dec1a1f5390d717a28bb8b')
+                     'images/ast2600-evb/buildroot-2023.11/flash.img')
+        image_hash = ('b62808daef48b438d0728ee07662290490ecfa65987bb91294cafb1bb7ad1a68')
         image_path = self.fetch_asset(image_url, asset_hash=image_hash,
                                       algorithm='sha256')
 
@@ -206,17 +207,17 @@ def test_arm_ast2600_evb_buildroot(self):
                          'ds1338,bus=aspeed.i2c.bus.3,address=0x32');
         self.vm.add_args('-device',
                          'i2c-echo,bus=aspeed.i2c.bus.3,address=0x42');
-        self.do_test_arm_aspeed_buildroot_start(image_path, '0xf00')
+        self.do_test_arm_aspeed_buildroot_start(image_path, '0xf00', 'Aspeed AST2600 EVB')
 
         exec_command_and_wait_for_pattern(self,
              'echo lm75 0x4d > /sys/class/i2c-dev/i2c-3/device/new_device',
              'i2c i2c-3: new_device: Instantiated device lm75 at 0x4d');
         exec_command_and_wait_for_pattern(self,
-                             'cat /sys/class/hwmon/hwmon0/temp1_input', '0')
+                             'cat /sys/class/hwmon/hwmon1/temp1_input', '0')
         self.vm.cmd('qom-set', path='/machine/peripheral/tmp-test',
                     property='temperature', value=18000);
         exec_command_and_wait_for_pattern(self,
-                             'cat /sys/class/hwmon/hwmon0/temp1_input', '18000')
+                             'cat /sys/class/hwmon/hwmon1/temp1_input', '18000')
 
         exec_command_and_wait_for_pattern(self,
              'echo ds1307 0x32 > /sys/class/i2c-dev/i2c-3/device/new_device',
@@ -261,7 +262,6 @@ def test_arm_ast2600_evb_buildroot_tpm(self):
         self.vm.add_args('-device',
                          'tpm-tis-i2c,tpmdev=tpm0,bus=aspeed.i2c.bus.12,address=0x2e')
         self.do_test_arm_aspeed_buildroot_start(image_path, '0xf00', 'Aspeed AST2600 EVB')
-        exec_command(self, "passw0rd")
 
         exec_command_and_wait_for_pattern(self,
             'echo tpm_tis_i2c 0x2e > /sys/bus/i2c/devices/i2c-12/new_device',
-- 
2.43.0


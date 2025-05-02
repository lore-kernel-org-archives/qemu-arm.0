Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp748906njj;
        Fri, 2 May 2025 03:36:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUlKDg6utJV2r2rOfTUNbXEgDGzAWtReO07atgnuNfBS3wnvTAIEqSWcegaZZQ5nw7/fi4ZZPLZmPM37g==@linaro.org
X-Google-Smtp-Source: AGHT+IGXSINFUIsHTflAmoMd/zMu52ANodmxzaqi/enf3P5e8IYWPnsUNXlXxLxQUpXJYXgHEHHO
X-Received: by 2002:a05:6000:4312:b0:391:9b2:f48d with SMTP id ffacd0b85a97d-3a099adcff7mr1617141f8f.33.1746182206633;
        Fri, 02 May 2025 03:36:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746182206; cv=none;
        d=google.com; s=arc-20240605;
        b=JZVYQpjL2q1vS1qZ3BHVhvG3VLnfZSsQNElJYTtLDTo7xu+BqI12hXIQzzxtBR/LbY
         oThGzfaKGOdAeWitIPsI7Lp/TEj1far8o5DO7gNoJ6wLdYMUVnOvVn7OW3JJeSIGBAyy
         DHkmFTLlJsTfdNjw255WYzRoQCogeKK7nv9eZdYLYxvGqDX/75KSmYDIZ53PUb2rZiF/
         sVEOJYUX6YHFLcXrl6pIbwnRzX/cBERa5wKzpP9ctyfQnpQslc4jGzCoibeRtlSDcL9o
         8gjmcBYoRfKm6hlAovcrgaGXw2oX03hbLcy5SRgSCv7nsOyMKkDNxmtv2PmiiQQtHA3e
         Bg/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=PkePHcx4IDnRphtqjNCsOfpcezf51rF/ZaSU3mAEO9A=;
        fh=Yg1QA3CYCa2LdK3Mf8oXZ+DbfQ0OHIFsuQO5E7pFx2w=;
        b=ES7kMX1CfEkzmggfyzurou+efVJlYTp9gKwAZLgBH9DYmG7pUuT/B3/J9Zy0/ligL0
         zAaVJqjXlNgzMeLplGrTz1e6lHAZsueW3xxEhGExVf7NWNXU2XlUY3vf2yvhl1jh+9k5
         K2C+IQAVjIY+y7hJZOgmQskkJGEQZ33uGS+cMJsph2YQkl9fUbXuR4r+b4v1ybFjVXn2
         qzyW0c2BbSANtNsLmjxDhwl7f7HRkeGDtlMlbPGLIvBT6XZhOUk7dqxH3VleQFkcZ054
         DgGUBPYMNd19qBNJ8Edwe+hPiZZsb1zkWU69dMRxudz9DjOF/DnIgsIkJc7K/KzJO3dF
         dhtg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3a099b17762si931558f8f.868.2025.05.02.03.36.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 May 2025 03:36:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uAnk8-0008QR-Vq; Fri, 02 May 2025 06:35:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1uAnk2-0008G2-Fi; Fri, 02 May 2025 06:35:39 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1uAnk0-0005yi-O3; Fri, 02 May 2025 06:35:38 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 2 May
 2025 18:34:52 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 2 May 2025 18:34:52 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Troy Lee <leetroy@gmail.com>, Jamin Lin
 <jamin_lin@aspeedtech.com>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <troy_lee@aspeedtech.com>, <longzl2@lenovo.com>,
 <yunlin.tang@aspeedtech.com>, <steven_lee@aspeedtech.com>
Subject: [PATCH v4 8/9] tests/function/aspeed: Add functional test for
 AST2700FC
Date: Fri, 2 May 2025 18:34:44 +0800
Message-ID: <20250502103449.3091642-9-steven_lee@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250502103449.3091642-1-steven_lee@aspeedtech.com>
References: <20250502103449.3091642-1-steven_lee@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=steven_lee@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_FAIL=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Steven Lee <steven_lee@aspeedtech.com>
From:  Steven Lee via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: tBByTJstv2H9

Add functional test for AST2700-fc machine.

Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
Change-Id: Ieced249cf471515a33f8f5f5386a2f58d431f2f9
---
 tests/functional/test_aarch64_aspeed.py | 83 +++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/tests/functional/test_aarch64_aspeed.py b/tests/functional/test_aarch64_aspeed.py
index d02dc7991c..0a943b7c54 100755
--- a/tests/functional/test_aarch64_aspeed.py
+++ b/tests/functional/test_aarch64_aspeed.py
@@ -65,6 +65,28 @@ def do_ast2700_i2c_test(self):
         exec_command_and_wait_for_pattern(self,
             'cat /sys/bus/i2c/devices/1-004d/hwmon/hwmon*/temp1_input', '18000')
 
+    def do_ast2700fc_ssp_test(self):
+        self.vm.shutdown()
+        self.vm.set_console(console_index=1)
+        self.vm.launch()
+
+        exec_command_and_wait_for_pattern(self, '\012', 'ssp:~$')
+        exec_command_and_wait_for_pattern(self, 'version',
+                                          'Zephyr version 3.7.1')
+        exec_command_and_wait_for_pattern(self, 'md 72c02000 1',
+                                          '[72c02000] 06010103')
+
+    def do_ast2700fc_tsp_test(self):
+        self.vm.shutdown()
+        self.vm.set_console(console_index=2)
+        self.vm.launch()
+
+        exec_command_and_wait_for_pattern(self, '\012', 'tsp:~$')
+        exec_command_and_wait_for_pattern(self, 'version',
+                                          'Zephyr version 3.7.1')
+        exec_command_and_wait_for_pattern(self, 'md 72c02000 1',
+                                          '[72c02000] 06010103')
+
     def start_ast2700_test(self, name):
         num_cpu = 4
         uboot_size = os.path.getsize(self.scratch_file(name,
@@ -111,6 +133,57 @@ def start_ast2700_test_vbootrom(self, name):
         self.do_test_aarch64_aspeed_sdk_start(
                 self.scratch_file(name, 'image-bmc'))
 
+    def start_ast2700fc_test(self, name):
+        ca35_core = 4
+        uboot_size = os.path.getsize(self.scratch_file(name,
+                                                       'u-boot-nodtb.bin'))
+        uboot_dtb_load_addr = hex(0x400000000 + uboot_size)
+
+        load_images_list = [
+            {
+                'addr': '0x400000000',
+                'file': self.scratch_file(name,
+                                          'u-boot-nodtb.bin')
+            },
+            {
+                'addr': str(uboot_dtb_load_addr),
+                'file': self.scratch_file(name, 'u-boot.dtb')
+            },
+            {
+                'addr': '0x430000000',
+                'file': self.scratch_file(name, 'bl31.bin')
+            },
+            {
+                'addr': '0x430080000',
+                'file': self.scratch_file(name, 'optee',
+                                          'tee-raw.bin')
+            }
+        ]
+
+        for load_image in load_images_list:
+            addr = load_image['addr']
+            file = load_image['file']
+            self.vm.add_args('-device',
+                             f'loader,force-raw=on,addr={addr},file={file}')
+
+        for i in range(ca35_core):
+            self.vm.add_args('-device',
+                             f'loader,addr=0x430000000,cpu-num={i}')
+
+        load_elf_list = {
+            'ssp': self.scratch_file(name, 'zephyr-aspeed-ssp.elf'),
+            'tsp': self.scratch_file(name, 'zephyr-aspeed-tsp.elf')
+        }
+
+        for cpu_num, key in enumerate(load_elf_list, start=4):
+            file = load_elf_list[key]
+            self.vm.add_args('-device',
+                             f'loader,file={file},cpu-num={cpu_num}')
+
+        self.do_test_aarch64_aspeed_sdk_start(
+                self.scratch_file(name, 'image-bmc'))
+
+
     def test_aarch64_ast2700_evb_sdk_v09_06(self):
         self.set_machine('ast2700-evb')
 
@@ -136,5 +209,15 @@ def test_aarch64_ast2700a1_evb_sdk_vbootrom_v09_06(self):
         self.verify_openbmc_boot_and_login('ast2700-default')
         self.do_ast2700_i2c_test()
 
+    def test_aarch64_ast2700fc_sdk_v09_06(self):
+        self.set_machine('ast2700fc')
+
+        self.archive_extract(self.ASSET_SDK_V906_AST2700A1)
+        self.start_ast2700fc_test('ast2700-default')
+        self.verify_openbmc_boot_and_login('ast2700-default')
+        self.do_ast2700_i2c_test()
+        self.do_ast2700fc_ssp_test()
+        self.do_ast2700fc_tsp_test()
+
 if __name__ == '__main__':
     QemuSystemTest.main()
-- 
2.34.1


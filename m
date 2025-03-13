Received: by 2002:a17:505:840c:b0:1be9:327d:8ee3 with SMTP id lq12csp729241njc;
        Wed, 12 Mar 2025 22:47:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVX2015mzZZjoO/WiP1SpcPOTaSKLSDqg9ce3su6Ei49sigk2u/wOMg8beNTU2mDW+jmRuRUWQv65mCiQ==@linaro.org
X-Google-Smtp-Source: AGHT+IF3LjGn2UZSsuM7afg7+4flSwPs7ziZmUGzGGqP+M6Ox3pGA8wi4dORM8dVqd9+Eu84aOGR
X-Received: by 2002:a05:6214:c83:b0:6e8:93f9:302 with SMTP id 6a1803df08f44-6e9005f784cmr367778376d6.15.1741844879287;
        Wed, 12 Mar 2025 22:47:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741844879; cv=none;
        d=google.com; s=arc-20240605;
        b=CmgjLJR0o3cepKnSkoDquXSyo5df+AZNB1DCLY/ALyF5cP/T1bB3H/p0SDYL3XNMZ/
         gzKjf+LK+7cUxaNXdn3J38bzVU5fQnTNtkEysBb29iP3DPCijqXCbrMrJUvug85zSQIP
         cic03Zcv6z85bF8DooN3swHzb7rB03ryL48xiMZmcAtAVGnEQgsKQ2N5fsHcrUCmL0Z5
         un/rm8Vcya1XYK9XpPZFqlSqbJyxROxG7L+iQab0BOzK2zR9nGfabCkCCE28/H22MizU
         WIK0bQbQaTkwN8rquhcjm9TO2ZZebCeG8TGXz5zn4sGlqsd+py6vPUbj7Eq0CBLX86ra
         L8kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=43TDT5UnwAzFybKYHceRxh313vs9PCYplXAK4L70NGU=;
        fh=NwMdySSevMv+4zB5gT5UiU9uLqpwDS+7odbjbNLg6yI=;
        b=FKKcLrOA18A1ZULnLK7Aq+hICOeC3GXBQEFVK1f7p9puAXoOFTnQhmQXK2muGwhlMQ
         hCUM6Dhh9uhwyt17vZp5SdVeDi3u4cA6icq65qMxz7MObWKcW/mMfmiAJ3fmG0oqqLFA
         Bo7M/JtdAD0nBjqEvHOWIxaRc0noO8oNpV8+OYPhJySQOg1ImDg7HnrXkzPxjJIYmpF8
         Gfe5TZS2QoR7Ilf2CRownzRC1Cj6NHRXuOWYhfndT5DuqMsD77eOOAKftw50IcUtABYV
         kqoL418vt+rycNoBycz0Dil+UaxBjwYFPRiGvI6kjvI0b/fVG7GCEc2b0e/l4Ef/VPl5
         1PqQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6eade35842dsi8998026d6.359.2025.03.12.22.47.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Mar 2025 22:47:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tsbOz-0005Be-BK; Thu, 13 Mar 2025 01:46:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1tsbOe-0004ul-0n; Thu, 13 Mar 2025 01:46:21 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1tsbOc-0005Ve-4Y; Thu, 13 Mar 2025 01:46:19 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 13 Mar
 2025 13:40:24 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 13 Mar 2025 13:40:24 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Troy Lee <leetroy@gmail.com>, Jamin Lin
 <jamin_lin@aspeedtech.com>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <troy_lee@aspeedtech.com>, <yunlin.tang@aspeedtech.com>
Subject: [PATCH 11/13] tests/function/aspeed: Add functional test for AST2700FC
Date: Thu, 13 Mar 2025 13:40:15 +0800
Message-ID: <20250313054020.2583556-12-steven_lee@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250313054020.2583556-1-steven_lee@aspeedtech.com>
References: <20250313054020.2583556-1-steven_lee@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=steven_lee@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: pXuzzi0f0utE

Introduce a new functional test for AST2700 multi-SoCs.
The test includes booting ast2700 with bmc image on
ca35 cores and booting ssp/tsp firmware on cm4 cores.
Assets for SDK and SSP/TSP images are downloaded from
AspeedTech-BMC's OpenBmc release page.

Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
Change-Id: I95807c8a49ee92d3a9978b1a533e10fcdfd64597
---
 tests/functional/test_aarch64_ast2700fc.py | 139 +++++++++++++++++++++
 1 file changed, 139 insertions(+)
 create mode 100755 tests/functional/test_aarch64_ast2700fc.py

diff --git a/tests/functional/test_aarch64_ast2700fc.py b/tests/functional/test_aarch64_ast2700fc.py
new file mode 100755
index 0000000000..243b74d77e
--- /dev/null
+++ b/tests/functional/test_aarch64_ast2700fc.py
@@ -0,0 +1,139 @@
+#!/usr/bin/env python3
+#
+# Functional test that boots the AST2700 multi-SoCs with firmware
+#
+# Copyright (C) 2025 ASPEED Technology Inc
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+import os
+
+from qemu_test import QemuSystemTest, Asset
+from qemu_test import wait_for_console_pattern
+from qemu_test import exec_command_and_wait_for_pattern
+
+
+class AST2700fcMachineSDK(QemuSystemTest):
+    ASSET_SDK_V905_AST2700_A0 = Asset(
+            'https://github.com/AspeedTech-BMC/openbmc/releases/download/v09.05/ast2700-a0-default-obmc.tar.gz',
+            'cfbbd1cce72f2a3b73b9080c41eecdadebb7077fba4f7806d72ac99f3e84b74a')
+    ASSET_SDK_SSP_TSP_AST2700_A0 = Asset(
+            'https://github.com/AspeedTech-BMC/openbmc/releases/download/v09.05/ast2700-a0-ssp-tsp.tar.gz',
+            'a3ca348bd1cb39086f9fdc40eab293afead351925a46f9ab0da4dcc3a1157382')
+
+    def do_test_aarch64_ast2700fc_ca35_start(self, image):
+        self.require_netdev('user')
+        self.vm.set_console()
+        self.vm.add_args('-drive', 'file=' + image + ',if=mtd,format=raw',
+                         '-net', 'nic', '-net', 'user', '-snapshot')
+
+        self.vm.launch()
+
+        wait_for_console_pattern(self, 'U-Boot 2023.10')
+        wait_for_console_pattern(self, '## Loading kernel from FIT Image')
+        wait_for_console_pattern(self, 'Starting kernel ...')
+
+    def do_test_aarch64_ast2700fc_ssp_start(self):
+
+        self.vm.shutdown()
+        self.vm.set_console(console_index=1)
+        self.vm.launch()
+
+    def do_test_aarch64_ast2700fc_tsp_start(self):
+        self.vm.shutdown()
+        self.vm.set_console(console_index=2)
+        self.vm.launch()
+
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
+            'ssp': self.scratch_file('ast2700-a0-ssp-tsp', 'ast2700-ssp.elf'),
+            'tsp': self.scratch_file('ast2700-a0-ssp-tsp', 'ast2700-tsp.elf')
+        }
+
+        for cpu_num, key in enumerate(load_elf_list, start=4):
+            file = load_elf_list[key]
+            self.vm.add_args('-device',
+                             f'loader,file={file},cpu-num={cpu_num}')
+
+        self.vm.add_args('-device',
+                         'tmp105,bus=aspeed.i2c.bus.1,address=0x4d,id=tmp-test')
+        self.do_test_aarch64_ast2700fc_ca35_start(
+            self.scratch_file(name, 'image-bmc'))
+
+        wait_for_console_pattern(self, f'{name} login:')
+
+        exec_command_and_wait_for_pattern(self, 'root', 'Password:')
+        exec_command_and_wait_for_pattern(self, '0penBmc', f'root@{name}:~#')
+
+        exec_command_and_wait_for_pattern(
+                self,
+                'echo lm75 0x4d > /sys/class/i2c-dev/i2c-1/device/new_device ',
+                'i2c i2c-1: new_device: Instantiated device lm75 at 0x4d')
+        exec_command_and_wait_for_pattern(
+                self,
+                'cat /sys/class/hwmon/hwmon*/temp1_input', '0')
+        self.vm.cmd('qom-set', path='/machine/peripheral/tmp-test',
+                    property='temperature', value=18000)
+        exec_command_and_wait_for_pattern(
+                self,
+                'cat /sys/class/hwmon/hwmon*/temp1_input', '18000')
+
+        self.do_test_aarch64_ast2700fc_ssp_start()
+
+        exec_command_and_wait_for_pattern(self, '\012', 'ssp:~$')
+        exec_command_and_wait_for_pattern(self, 'version',
+                                          'Zephyr version 3.7.1')
+        exec_command_and_wait_for_pattern(self, 'md 72c02000 1',
+                                          '[72c02000] 06000103')
+        self.do_test_aarch64_ast2700fc_tsp_start()
+        exec_command_and_wait_for_pattern(self, '\012', 'tsp:~$')
+        exec_command_and_wait_for_pattern(self, 'version',
+                                          'Zephyr version 3.7.1')
+        exec_command_and_wait_for_pattern(self, 'md 72c02000 1',
+                                          '[72c02000] 06000103')
+
+    def test_aarch64_ast2700fc_a0_sdk_v09_05(self):
+        self.set_machine('ast2700fc-a0')
+        self.archive_extract(self.ASSET_SDK_V905_AST2700_A0)
+        self.archive_extract(self.ASSET_SDK_SSP_TSP_AST2700_A0)
+        self.start_ast2700fc_test('ast2700-a0-default')
+
+
+if __name__ == '__main__':
+    QemuSystemTest.main()
-- 
2.34.1


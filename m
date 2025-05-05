Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2197537njj;
        Sun, 4 May 2025 20:06:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXrwOyeKEhFqEuCBcRU+kupqBs5SnblnXk6CUkZGyPQCp4bZeAMcaxnqBS9hia6rwJQ90VXKrij7+S6Eg==@linaro.org
X-Google-Smtp-Source: AGHT+IGT2RszCrPmlFEKnJOtD0oLbd4Fs25mRF/G4z8vsRSb6JX+heOYMf/UOLjFLZ/V2EzRiRvt
X-Received: by 2002:a05:620a:4447:b0:7c5:49e3:3347 with SMTP id af79cd13be357-7cae3aeceabmr783720785a.35.1746414405241;
        Sun, 04 May 2025 20:06:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746414405; cv=none;
        d=google.com; s=arc-20240605;
        b=DTpIdXm9gqVo5y46cUc54zjSUxOiCdR7XTUuZqosVtFJXB3pbS0H4sVdUX/ZoNHx5v
         fi1IdLm4k0vfegxW/z1lf3NFuJarA9guiWKre+kbH/q/zDGlCLV9w1tHOrp+XkEXUg9E
         jHOUs7zs9VnBbtkZMAPv3OYSBwth5xxt+5dagVmbR3jZVNQwSni94BUIGuNvJF2e9/CH
         /f6SnjlyNNp4Hh4DR6zihS7wlUaXm/o5dl4Y1LgUIMvVeZ5eyuIcPpT1WKGQsvygfVOZ
         Hb58IRe0/NOBzOS5SMTirFuYQjdQH4Q+lsLg9h4Vc0NeAVilGmrmHEmjBtWAMC8GQdrs
         F6aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to;
        bh=yi4tW563oAMibzAm9AfbWsUSlz9iSqmVsC3DlTZr2kU=;
        fh=Yg1QA3CYCa2LdK3Mf8oXZ+DbfQ0OHIFsuQO5E7pFx2w=;
        b=kQGyARF3JgMrdckU8Nf3BYg1p5SrYXS2hRuGBw6rVvbevP0cSMFozmV/44IKtD83f2
         5VSvS6TlzsPxt4rCFg9+6NRHwHRHi5tlu+cUuNuL4R3RTbhwNicOM0a4ehLwUi5Hr+e2
         ijO09iPQ/QfYx32oAqM6thgLabITWnAWAt3SVxVXKUEsBuww2v3uvT1rmvYOgI15+CuQ
         1yJz53PGjFWIyW7XnQBiCpk2t3LB5AA1V6TIlBg9jzO1WPGx17sKnzj01aSFR5pJkCfp
         vYwcliQu9YSWSjZn6cIXjz2i576CoZcdhPvaAeiP0j1kW//Pah9CtOSE1E07V/tXP/YM
         mInw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7cad2435c00si778939285a.445.2025.05.04.20.06.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 04 May 2025 20:06:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uBmA3-0005QK-5x; Sun, 04 May 2025 23:06:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1uBmA1-0005Px-O4; Sun, 04 May 2025 23:06:29 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1uBm9w-0002Fn-Kh; Sun, 04 May 2025 23:06:29 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 5 May
 2025 11:06:18 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Mon, 5 May 2025 11:06:18 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Troy Lee <leetroy@gmail.com>, Jamin Lin
 <jamin_lin@aspeedtech.com>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <troy_lee@aspeedtech.com>, <longzl2@lenovo.com>,
 <yunlin.tang@aspeedtech.com>, <steven_lee@aspeedtech.com>
Subject: [PATCH v5 8/9] tests/function/aspeed: Add functional test for
 ast2700fc
Date: Mon, 5 May 2025 11:06:18 +0800
Message-ID: <20250505030618.3612042-1-steven_lee@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=steven_lee@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_FAIL=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: udbp+JQXp6RN

Introduce a new test suite for ast2700fc machine.
Rename the original test_aarch64_aspeed.py to
test_aarch64_aspeed_ast2700.py.

Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
Change-Id: I3855f55c9f6e5cca1270c179445f549f8d81f36c
---
 ...peed.py => test_aarch64_aspeed_ast2700.py} |   0
 .../test_aarch64_aspeed_ast2700fc.py          | 135 ++++++++++++++++++
 2 files changed, 135 insertions(+)
 rename tests/functional/{test_aarch64_aspeed.py => test_aarch64_aspeed_ast2700.py} (100%)
 create mode 100755 tests/functional/test_aarch64_aspeed_ast2700fc.py

diff --git a/tests/functional/test_aarch64_aspeed.py b/tests/functional/test_aarch64_aspeed_ast2700.py
similarity index 100%
rename from tests/functional/test_aarch64_aspeed.py
rename to tests/functional/test_aarch64_aspeed_ast2700.py
diff --git a/tests/functional/test_aarch64_aspeed_ast2700fc.py b/tests/functional/test_aarch64_aspeed_ast2700fc.py
new file mode 100755
index 0000000000..b85370e182
--- /dev/null
+++ b/tests/functional/test_aarch64_aspeed_ast2700fc.py
@@ -0,0 +1,135 @@
+#!/usr/bin/env python3
+#
+# Functional test that boots the ASPEED SoCs with firmware
+#
+# Copyright (C) 2022 ASPEED Technology Inc
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
+class AST2x00MachineSDK(QemuSystemTest):
+
+    def do_test_aarch64_aspeed_sdk_start(self, image):
+        self.require_netdev('user')
+        self.vm.set_console()
+        self.vm.add_args('-device',
+                         'tmp105,bus=aspeed.i2c.bus.1,address=0x4d,id=tmp-test')
+        self.vm.add_args('-drive', 'file=' + image + ',if=mtd,format=raw',
+                         '-net', 'nic', '-net', 'user', '-snapshot')
+
+        self.vm.launch()
+
+    def verify_openbmc_boot_and_login(self, name):
+        wait_for_console_pattern(self, 'U-Boot 2023.10')
+        wait_for_console_pattern(self, '## Loading kernel from FIT Image')
+        wait_for_console_pattern(self, 'Starting kernel ...')
+
+        wait_for_console_pattern(self, f'{name} login:')
+        exec_command_and_wait_for_pattern(self, 'root', 'Password:')
+        exec_command_and_wait_for_pattern(self, '0penBmc', f'root@{name}:~#')
+
+    ASSET_SDK_V906_AST2700 = Asset(
+            'https://github.com/AspeedTech-BMC/openbmc/releases/download/v09.06/ast2700-default-obmc.tar.gz',
+            'f1d53e0be8a404ecce3e105f72bc50fa4e090ad13160ffa91b10a6e0233a9dc6')
+
+    def do_ast2700_i2c_test(self):
+        exec_command_and_wait_for_pattern(self,
+            'echo lm75 0x4d > /sys/class/i2c-dev/i2c-1/device/new_device ',
+            'i2c i2c-1: new_device: Instantiated device lm75 at 0x4d')
+        exec_command_and_wait_for_pattern(self,
+            'cat /sys/bus/i2c/devices/1-004d/hwmon/hwmon*/temp1_input', '0')
+        self.vm.cmd('qom-set', path='/machine/peripheral/tmp-test',
+                    property='temperature', value=18000)
+        exec_command_and_wait_for_pattern(self,
+            'cat /sys/bus/i2c/devices/1-004d/hwmon/hwmon*/temp1_input', '18000')
+
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
+    def test_aarch64_ast2700fc_sdk_v09_06(self):
+        self.set_machine('ast2700fc')
+
+        self.archive_extract(self.ASSET_SDK_V906_AST2700)
+        self.start_ast2700fc_test('ast2700-default')
+        self.verify_openbmc_boot_and_login('ast2700-default')
+        self.do_ast2700_i2c_test()
+        self.do_ast2700fc_ssp_test()
+        self.do_ast2700fc_tsp_test()
+
+if __name__ == '__main__':
+    QemuSystemTest.main()
-- 
2.34.1


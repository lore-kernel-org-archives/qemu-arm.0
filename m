Received: by 2002:a17:504:8616:b0:1be9:327d:8ee3 with SMTP id o22csp122460njm;
        Tue, 29 Apr 2025 02:21:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXXfXHzShez5In8IJ6uWR2n5v7ysQEdUQrDgDT21xcXfYifr66mcnrYDj+ne+E0Q+n4NDXYxf/balBhmQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEvCKBwm9/pRmxJN7JgRaC2C5lcm2lXGZ5LMLSUdFQM4MXfHxIfOwR1VufNqSRKUcDXDU7D
X-Received: by 2002:ac8:7dcc:0:b0:476:bb72:f429 with SMTP id d75a77b69052e-48133176e82mr161364161cf.42.1745918471148;
        Tue, 29 Apr 2025 02:21:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745918471; cv=none;
        d=google.com; s=arc-20240605;
        b=YJIrFpny1YRKTOTsbBUFBtO5Sd6fpmQTOGJ8NAsunTUPYrnjE6ZzoZJs3s8EZrJ0Q1
         QIcHrxlhl2xSCS/IhF0cOafEz1ryhCVY2jdq/cKFXEs1onVO4ZLQf5SjFRoW2qZxQoWh
         EAI0/RsV3gtc1i4oMU/VFTNBtAkqCE5q6S2vi3ogCM964SXqiYbqaZIPBNAvTsWRk+Z6
         fz/RE+9IVuG2Y75/Uj88TjduhxrHzezBP9sYjQ573dlUwlnC2fk3lD9iXBN8GI5PKfQ2
         WjukigleCJJozl9Ty1iHnHs2Ooot7JJo1LMzY0C4d/mDjIeTULKJUlQdR6TgDN/Obi+g
         XMNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=d2VYrc/2qlG8ZvFfw9XnVIqE4iz/lswW2QWV1US4TSo=;
        fh=Yg1QA3CYCa2LdK3Mf8oXZ+DbfQ0OHIFsuQO5E7pFx2w=;
        b=GpB0DFtmUXIsDH/hfXts1NLmrIeDhEh63XAx5IIteUocaJef6msOyn0Mt97sVc854x
         mvLK1AEcWwVNqhXG7SvFvCvCOtxz++olKt4xcWWYVvCqsZ2hYjrk3buSwyM4NRuriL9u
         8AnUGXpejLR1nDyN9Er+DlQT6Sx2YFF+noVY+Cr5ezH/AUrT0AxURkErDl9mQkWXdCPS
         gBBeYBcCBXDxOx2tCHl7mE/ztkdGU6ibFXylBD6VW/erhyuiGHXIV77eOJN1Iust93JZ
         krbKGMqgECOwK8n7kx228QjcFvbjCWokkO+DFWoVc9fWhPeKaJ2rARzQKVi5lv03ngff
         jrSQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47ea1990437si126264991cf.248.2025.04.29.02.21.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Apr 2025 02:21:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u9h7s-0005ht-7I; Tue, 29 Apr 2025 05:19:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1u9h7p-0005g8-Vx; Tue, 29 Apr 2025 05:19:38 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1u9h7n-0004Ff-Uh; Tue, 29 Apr 2025 05:19:37 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 29 Apr
 2025 17:18:58 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 29 Apr 2025 17:18:58 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Troy Lee <leetroy@gmail.com>, Jamin Lin
 <jamin_lin@aspeedtech.com>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <troy_lee@aspeedtech.com>, <longzl2@lenovo.com>,
 <yunlin.tang@aspeedtech.com>, <steven_lee@aspeedtech.com>
Subject: [PATCH v3 8/9] tests/function/aspeed: Add functional test for
 AST2700FC
Date: Tue, 29 Apr 2025 17:18:52 +0800
Message-ID: <20250429091855.1948374-9-steven_lee@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250429091855.1948374-1-steven_lee@aspeedtech.com>
References: <20250429091855.1948374-1-steven_lee@aspeedtech.com>
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
X-TUID: KKuYlX/dJ5U4

Add functional test for AST2700-fc machine.

Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
Change-Id: Ieced249cf471515a33f8f5f5386a2f58d431f2f9
---
 tests/functional/test_aarch64_ast2700fc.py | 137 +++++++++++++++++++++
 1 file changed, 137 insertions(+)
 create mode 100755 tests/functional/test_aarch64_ast2700fc.py

diff --git a/tests/functional/test_aarch64_ast2700fc.py b/tests/functional/test_aarch64_ast2700fc.py
new file mode 100755
index 0000000000..f7b7907fde
--- /dev/null
+++ b/tests/functional/test_aarch64_ast2700fc.py
@@ -0,0 +1,137 @@
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
+    ASSET_SDK_V905_AST2700 = Asset(
+            'https://github.com/AspeedTech-BMC/openbmc/releases/download/v09.05/ast2700-default-obmc.tar.gz',
+            'c1f4496aec06743c812a6e9a1a18d032f34d62f3ddb6956e924fef62aa2046a5')
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
+            'ssp': self.scratch_file(name, 'ast2700-ssp.elf'),
+            'tsp': self.scratch_file(name, 'ast2700-tsp.elf')
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
+                                          '[72c02000] 06010103')
+
+        self.do_test_aarch64_ast2700fc_tsp_start()
+
+        exec_command_and_wait_for_pattern(self, '\012', 'tsp:~$')
+        exec_command_and_wait_for_pattern(self, 'version',
+                                          'Zephyr version 3.7.1')
+        exec_command_and_wait_for_pattern(self, 'md 72c02000 1',
+                                          '[72c02000] 06010103')
+
+    def test_aarch64_ast2700fc_sdk_v09_05(self):
+        self.set_machine('ast2700fc')
+        self.archive_extract(self.ASSET_SDK_V905_AST2700)
+        self.start_ast2700fc_test('ast2700-default')
+
+
+if __name__ == '__main__':
+    QemuSystemTest.main()
-- 
2.34.1


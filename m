Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp2219783njd;
        Tue, 22 Apr 2025 02:15:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW3WXJO2SWmqtYGvxMGpcS9zbhPJeybLCVW/vikcg3n8NHv0sl4GysGOWav8hXswixYd4oYxWWTimHuBw==@linaro.org
X-Google-Smtp-Source: AGHT+IHmEVydwnzB2Z35pA4ND+/y0EXE/xnzOQLJZ7/DIcQ1/rv2jB85AFx6qAH3t9bdbk1vJday
X-Received: by 2002:a05:620a:25c8:b0:7c5:e370:5b1 with SMTP id af79cd13be357-7c927f53077mr2542635785a.7.1745313345627;
        Tue, 22 Apr 2025 02:15:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745313345; cv=none;
        d=google.com; s=arc-20240605;
        b=G4nZGPcDfnyT6WGtbVTEvMXwerpeXPI5JthuxwBl8VJIaZTPaeutAv4fHz6oDuEe84
         Zk7zjApLGncNa2llxLa04SlqjfHM3gePMg8R4waSlDq+/osR2gh3SEeCJ7x21So0TVpy
         0O23Tz8VLA6Cp8lPvLUHFvn68PKSO5qDhCDEsy04N+FmX4rkpAlr1GY8OAEHpB/RSJZo
         fbBl30xnqEQ6FQTvaa4C1ZWqpJQ0gzBN+HVSZncEVIm1mKb2ryJdtjErkWg/9uaimLyK
         sP0TTRvVa0VEAPMhWR6VlgjUk4ak1NZjhLkdCSgRnrXIaUlB9NeuAV/XoLK+i1zU2xi0
         Y0MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=2qnAwegFI4PUxT2QywBi7G9zPaQdL6c/RStFKbZZg1I=;
        fh=Gb4TIc8MExyZGNjx5T60USxFFuCM6mshEZ2Ta2WMSD4=;
        b=Bxo6K6ztubMsJbSlywx6AXVzcD5Bf/9FPzXQptQmCejt9aC2O+nAEhGvB2LiYYg3kb
         rDIunSRrxgGPNhyeGTkWINGIzLxZlWvdedCHcRjiEmXNLZzL/YDUuMHWg1LjbClWFdYV
         Cw5Mnq5o4cRLJHwkHbA2OFdLk7LcVK+aQhjKWEu0VjCF3E60ZoZLuA5sMZmfySZA588P
         5MZaWWcBUnktiWZZSRMYGYStTooyQhF4DJomJ0hubjARTa9vNza5IBz46rBstkQqzttM
         KUZK+tQoIe448uTVqArUcYIHiWe1bUipt73pgK1EtKZPc7MxtUJWgCUyUwOYKClmoMCg
         PWng==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c925aaffcdsi1096718485a.45.2025.04.22.02.15.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Apr 2025 02:15:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u79j4-0006iv-M9; Tue, 22 Apr 2025 05:15:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1u79j3-0006i7-OP; Tue, 22 Apr 2025 05:15:33 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1u79j1-0006zm-Qw; Tue, 22 Apr 2025 05:15:33 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 22 Apr
 2025 17:15:05 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 22 Apr 2025 17:15:05 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>
Subject: [PATCH v1 3/3] tests/functional/aspeed: Update test ASPEED SDK v03.00
 for AST1030
Date: Tue, 22 Apr 2025 17:15:03 +0800
Message-ID: <20250422091504.3666464-4-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250422091504.3666464-1-jamin_lin@aspeedtech.com>
References: <20250422091504.3666464-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
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
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: z2lJKkCQMQOu

Updated test to target SDK version v03.00.
Removed redundant test case to simplify validation.
Cleaned up unsupported shell commands.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 tests/functional/test_arm_aspeed_ast1030.py | 40 ++++-----------------
 1 file changed, 7 insertions(+), 33 deletions(-)

diff --git a/tests/functional/test_arm_aspeed_ast1030.py b/tests/functional/test_arm_aspeed_ast1030.py
index d45d9f7c1c..dafa1d24cb 100755
--- a/tests/functional/test_arm_aspeed_ast1030.py
+++ b/tests/functional/test_arm_aspeed_ast1030.py
@@ -12,36 +12,17 @@
 
 class AST1030Machine(LinuxKernelTest):
 
-    ASSET_ZEPHYR_1_04 = Asset(
+    ASSET_ZEPHYR_3_00 = Asset(
         ('https://github.com/AspeedTech-BMC'
-         '/zephyr/releases/download/v00.01.04/ast1030-evb-demo.zip'),
-        '4ac6210adcbc61294927918707c6762483fd844dde5e07f3ba834ad1f91434d3')
+         '/zephyr/releases/download/v00.03.00/ast1030-evb-demo.zip'),
+        '37fe3ecd4a1b9d620971a15b96492a81093435396eeac69b6f3e384262ff555f')
 
-    def test_ast1030_zephyros_1_04(self):
-        self.set_machine('ast1030-evb')
-
-        kernel_name = "ast1030-evb-demo/zephyr.elf"
-        kernel_file = self.archive_extract(
-            self.ASSET_ZEPHYR_1_04, member=kernel_name)
-
-        self.vm.set_console()
-        self.vm.add_args('-kernel', kernel_file, '-nographic')
-        self.vm.launch()
-        self.wait_for_console_pattern("Booting Zephyr OS")
-        exec_command_and_wait_for_pattern(self, "help",
-                                          "Available commands")
-
-    ASSET_ZEPHYR_1_07 = Asset(
-        ('https://github.com/AspeedTech-BMC'
-         '/zephyr/releases/download/v00.01.07/ast1030-evb-demo.zip'),
-        'ad52e27959746988afaed8429bf4e12ab988c05c4d07c9d90e13ec6f7be4574c')
-
-    def test_ast1030_zephyros_1_07(self):
+    def test_ast1030_zephyros_3_00(self):
         self.set_machine('ast1030-evb')
 
         kernel_name = "ast1030-evb-demo/zephyr.bin"
         kernel_file = self.archive_extract(
-            self.ASSET_ZEPHYR_1_07, member=kernel_name)
+            self.ASSET_ZEPHYR_3_00, member=kernel_name)
 
         self.vm.set_console()
         self.vm.add_args('-kernel', kernel_file, '-nographic')
@@ -49,17 +30,10 @@ def test_ast1030_zephyros_1_07(self):
         self.wait_for_console_pattern("Booting Zephyr OS")
         for shell_cmd in [
                 'kernel stacks',
-                'otp info conf',
-                'otp info scu',
                 'hwinfo devid',
                 'crypto aes256_cbc_vault',
-                'random get',
-                'jtag JTAG1 sw_xfer high TMS',
-                'adc ADC0 resolution 12',
-                'adc ADC0 read 42',
-                'adc ADC1 read 69',
-                'i2c scan I2C_0',
-                'i3c attach I3C_0',
+                'jtag jtag@7e6e4100 sw_xfer high TMS',
+                'iic scan i2c@7e7b0080',
                 'hash test',
                 'kernel uptime',
                 'kernel reboot warm',
-- 
2.43.0


Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp3088303njc;
        Tue, 15 Apr 2025 20:46:38 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWKajnfsIZriPP4/5upNYkqHmnoIs0RlBczZ/JioYAgbztzbTUWSUDlzZlizmpQsDFkqfQaDG+V3uz06g==@linaro.org
X-Google-Smtp-Source: AGHT+IFJ/5wbXr1sx2sxbQt6iOLOMVoYuOMe5aQ5x/J7WX/Exnt+ShFhHWlBQMADYjuas5vE8qGE
X-Received: by 2002:a05:622a:1b8d:b0:477:6e6a:8143 with SMTP id d75a77b69052e-47ad7fceca3mr1897421cf.0.1744775198769;
        Tue, 15 Apr 2025 20:46:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744775198; cv=none;
        d=google.com; s=arc-20240605;
        b=agMg0pIU9erQaGNw2Gp/7Ed+N062CRB7N19h0LPZCtWm1BFY31o7rt3cmONn7Mt6jw
         a0nIwXOX9s9oqmqYcUVbcFwQwc+tNy8LMYKoVwiqGN9mbJJR88WL6Xo880+OlWF87+iB
         qo1VQcFoHqNklbM1892FP8MXP8a9Bdc9qOJC7rLjoVqqBCVivXFBSqIVMmKDCurmNfrd
         A2n5IRCQk0ffQSUdQD39wIz4SBxPesOQrrW5O8hl7EjuhdENI6yA1l1bJ/TaLB+Vh0Un
         KdTS+uYJD2iDdO9nc685cZdZ/2mQFTZxzcLlhO81msHDW2Q6vUyU4/r4fhdrmiBawahp
         EGAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=SsZVIZy9WpLyn3ENLHZwvwP+K+kGvW4GD+ZtoJ6m9xw=;
        fh=9slMQvAVAaDbZF94sUZsatNqTIKawFKtbOHuc7HAk0w=;
        b=ApEo8DiF3Pez7gJLtGtdSVKNL6q+1x4wRMYgzVpWO5XdZJDQl9dnK1ylxknnglNQ0j
         HB6Gxw9MqK1HHNRGdEKkyrY3fNSyfPkMaquKIY1McMiLhHjSOTA2ah/ctqnc+Y24DKLa
         xHyA59MIbGcALN+whpLhbtby1qN9h32UOzJN/CnO376aAV7m4BZQJXAmS/6Xq+roe1V5
         qEu/+GaGYyxkmsvdMycUi1Qvavdg3Wz+qrzVbQoMmrMky5A3aGKzqBAk4kmvj6qbZZ8o
         pL7nrexSfgE8f8qfsJ37TqbEXHg3/UoRiTliHcKFWRFCj0qlnTGyPgRYVhkAwc51J7uQ
         Fm/w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4796edd6e11si127274371cf.419.2025.04.15.20.46.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Apr 2025 20:46:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u4thG-0001vv-K2; Tue, 15 Apr 2025 23:44:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1u4thD-0001v9-Jg; Tue, 15 Apr 2025 23:44:20 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1u4thB-0006uD-9l; Tue, 15 Apr 2025 23:44:18 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Wed, 16 Apr
 2025 11:43:29 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Wed, 16 Apr 2025 11:43:29 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <nabihestefan@google.com>
Subject: [PATCH v3 07/10] tests/functional/aspeed: Move I2C test into shared
 helper for AST2700 reuse
Date: Wed, 16 Apr 2025 11:43:22 +0800
Message-ID: <20250416034327.315714-8-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250416034327.315714-1-jamin_lin@aspeedtech.com>
References: <20250416034327.315714-1-jamin_lin@aspeedtech.com>
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
X-TUID: ONMTUjMj5Gzk

Move the I2C test case into a common helper function (do_ast2700_i2c_test) so it
can be reused across multiple AST2700-based test cases. This reduces duplication
and improves maintainability.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 tests/functional/test_aarch64_aspeed.py | 28 +++++++++++++------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/tests/functional/test_aarch64_aspeed.py b/tests/functional/test_aarch64_aspeed.py
index c25c966278..441f7f3919 100755
--- a/tests/functional/test_aarch64_aspeed.py
+++ b/tests/functional/test_aarch64_aspeed.py
@@ -18,6 +18,8 @@ class AST2x00MachineSDK(QemuSystemTest):
     def do_test_aarch64_aspeed_sdk_start(self, image):
         self.require_netdev('user')
         self.vm.set_console()
+        self.vm.add_args('-device',
+                         'tmp105,bus=aspeed.i2c.bus.1,address=0x4d,id=tmp-test')
         self.vm.add_args('-drive', 'file=' + image + ',if=mtd,format=raw',
                          '-net', 'nic', '-net', 'user', '-snapshot')
 
@@ -35,6 +37,17 @@ def do_test_aarch64_aspeed_sdk_start(self, image):
             'https://github.com/AspeedTech-BMC/openbmc/releases/download/v09.05/ast2700-default-obmc.tar.gz',
             'c1f4496aec06743c812a6e9a1a18d032f34d62f3ddb6956e924fef62aa2046a5')
 
+    def do_ast2700_i2c_test(self):
+        exec_command_and_wait_for_pattern(self,
+            'echo lm75 0x4d > /sys/class/i2c-dev/i2c-1/device/new_device ',
+            'i2c i2c-1: new_device: Instantiated device lm75 at 0x4d');
+        exec_command_and_wait_for_pattern(self,
+            'cat /sys/bus/i2c/devices/1-004d/hwmon/hwmon*/temp1_input', '0')
+        self.vm.cmd('qom-set', path='/machine/peripheral/tmp-test',
+                    property='temperature', value=18000)
+        exec_command_and_wait_for_pattern(self,
+            'cat /sys/bus/i2c/devices/1-004d/hwmon/hwmon*/temp1_input', '18000')
+
     def start_ast2700_test(self, name):
         num_cpu = 4
         uboot_size = os.path.getsize(self.scratch_file(name,
@@ -73,8 +86,6 @@ def start_ast2700_test(self, name):
                              f'loader,addr=0x430000000,cpu-num={i}')
 
         self.vm.add_args('-smp', str(num_cpu))
-        self.vm.add_args('-device',
-                         'tmp105,bus=aspeed.i2c.bus.1,address=0x4d,id=tmp-test')
         self.do_test_aarch64_aspeed_sdk_start(
             self.scratch_file(name, 'image-bmc'))
 
@@ -83,28 +94,19 @@ def start_ast2700_test(self, name):
         exec_command_and_wait_for_pattern(self, 'root', 'Password:')
         exec_command_and_wait_for_pattern(self, '0penBmc', f'root@{name}:~#')
 
-        exec_command_and_wait_for_pattern(self,
-            'echo lm75 0x4d > /sys/class/i2c-dev/i2c-1/device/new_device ',
-            'i2c i2c-1: new_device: Instantiated device lm75 at 0x4d');
-        exec_command_and_wait_for_pattern(self,
-            'cat /sys/bus/i2c/devices/1-004d/hwmon/hwmon*/temp1_input', '0')
-        self.vm.cmd('qom-set', path='/machine/peripheral/tmp-test',
-                    property='temperature', value=18000)
-        exec_command_and_wait_for_pattern(self,
-            'cat /sys/bus/i2c/devices/1-004d/hwmon/hwmon*/temp1_input', '18000')
-
     def test_aarch64_ast2700_evb_sdk_v09_05(self):
         self.set_machine('ast2700-evb')
 
         self.archive_extract(self.ASSET_SDK_V905_AST2700)
         self.start_ast2700_test('ast2700-a0-default')
+        self.do_ast2700_i2c_test()
 
     def test_aarch64_ast2700a1_evb_sdk_v09_05(self):
         self.set_machine('ast2700a1-evb')
 
         self.archive_extract(self.ASSET_SDK_V905_AST2700A1)
         self.start_ast2700_test('ast2700-default')
-
+        self.do_ast2700_i2c_test()
 
 if __name__ == '__main__':
     QemuSystemTest.main()
-- 
2.43.0


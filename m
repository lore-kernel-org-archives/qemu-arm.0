Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp1939905njm;
        Thu, 6 Mar 2025 20:06:10 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUcYfGX4T5MQsAuraLWCiUA5H4F/2wmHLwrDY3FGkDh2OGHyl0Csz3sy4jCEhWlP3plkeiqZA8OFmohxQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEPH4QENZfO+I46XqRz0e2rg5rU3j+8NGBvAOFa2p+XEEb9WWkv0YuROtxcVpiVRRmNHFTQ
X-Received: by 2002:a05:6214:ca6:b0:6e8:fa33:2965 with SMTP id 6a1803df08f44-6e90061fa6emr23305376d6.14.1741320370610;
        Thu, 06 Mar 2025 20:06:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741320370; cv=none;
        d=google.com; s=arc-20240605;
        b=d5aPRDxbQjX05KHsZ18If3UNTW9Ax0u1pWY6Fo/W4ciiqYb9C7DfqzarU/HXepH+6N
         +EYyPqlCDzKt5cYVwXPc8GZ51Ew7wKht7a8eArw4Z8aIY7a0dGW9nZkxEp0OcEABR5Ft
         pXpE3n9CJPG9gdOwfXkqYMwKPHpczXgnytZnY5vjDZU88+KtocViTw/ahoA4YwzJ+wX4
         7LAQUbTgKxLtCKEqGtYBkSS8KVGfmb+o4D1rsIaKhOzuFaEQ0FpEsCeqS15I1x5FDPa4
         KUetNYcyJjbO/M4dVBwPFLWT7hFAT+8OMFavoikWGWerI0dVzVLern+8vPIJLuiZCV/B
         UK/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=qkQ0OOm/9iTvXh4InNWJrQR4ZfnseCFamrAmZeRE8KQ=;
        fh=3cFqTtzBuOtpuAUHgGIZLk2EDwH0HGw77jNYFWHrQKI=;
        b=Zvm3xAtiIRgmfK8AM1268vGh4D3aRATPZiMZPLjuUFYkf9FTs60V5ZTAyqg0T0ZUIg
         f1EXULhZ9kxKHLOmoIdUk+l6AVgOsJmygc9jkHAXd9G3qJ4pvPhvkz1ektVnKAz/xt3V
         Kwfpmg9stEu1hRG+yTHI3bj5z2p9Q7Rh7VeciTu2FXLdt+VoPyng70o6xtTMIKMlr/UF
         jBFqck83D+vWzG8Tg/HBcjsk9nJKXhOhVIL/1s2ugcBUd6mSupdcD7Dni9tqm9mHCHNn
         vI0bHQRCvYyWWQTI7LWEpBR10PQyH3da5lUR4zZuK4mAPu4EvJGFmKrrz4hpPG+z6Fv4
         uAKQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e8f7093e5fsi26881016d6.157.2025.03.06.20.06.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Mar 2025 20:06:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tqOum-0003RO-LQ; Thu, 06 Mar 2025 23:02:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tqOuN-0002jL-Qu; Thu, 06 Mar 2025 23:02:00 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tqOuM-00056A-5u; Thu, 06 Mar 2025 23:01:59 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Fri, 7 Mar
 2025 11:59:54 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Fri, 7 Mar 2025 11:59:54 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH v6 25/29] tests/functional/aspeed: Introduce
 start_ast2700_test API
Date: Fri, 7 Mar 2025 11:59:34 +0800
Message-ID: <20250307035945.3698802-26-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250307035945.3698802-1-jamin_lin@aspeedtech.com>
References: <20250307035945.3698802-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_FAIL=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: mp5dUkjiAZHq

Added a new method "start_ast2700_test" to the "AST2x00MachineSDK" class and
this method centralizes the logic for starting the AST2700 test, making it
reusable for different test cases.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 tests/functional/test_aarch64_aspeed.py | 29 +++++++++++++------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/tests/functional/test_aarch64_aspeed.py b/tests/functional/test_aarch64_aspeed.py
index 9595498ace..e1ad7fd470 100755
--- a/tests/functional/test_aarch64_aspeed.py
+++ b/tests/functional/test_aarch64_aspeed.py
@@ -31,33 +31,29 @@ def do_test_aarch64_aspeed_sdk_start(self, image):
             'https://github.com/AspeedTech-BMC/openbmc/releases/download/v09.03/ast2700-default-obmc.tar.gz',
             '91225f50d255e2905ba8d8e0c80b71b9d157c3609770c7a740cd786370d85a77')
 
-    def test_aarch64_ast2700_evb_sdk_v09_03(self):
-        self.set_machine('ast2700-evb')
-
-        self.archive_extract(self.ASSET_SDK_V903_AST2700)
-
+    def start_ast2700_test(self, name):
         num_cpu = 4
-        uboot_size = os.path.getsize(self.scratch_file('ast2700-default',
+        uboot_size = os.path.getsize(self.scratch_file(name,
                                                        'u-boot-nodtb.bin'))
         uboot_dtb_load_addr = hex(0x400000000 + uboot_size)
 
         load_images_list = [
             {
                 'addr': '0x400000000',
-                'file': self.scratch_file('ast2700-default',
+                'file': self.scratch_file(name,
                                           'u-boot-nodtb.bin')
             },
             {
                 'addr': str(uboot_dtb_load_addr),
-                'file': self.scratch_file('ast2700-default', 'u-boot.dtb')
+                'file': self.scratch_file(name, 'u-boot.dtb')
             },
             {
                 'addr': '0x430000000',
-                'file': self.scratch_file('ast2700-default', 'bl31.bin')
+                'file': self.scratch_file(name, 'bl31.bin')
             },
             {
                 'addr': '0x430080000',
-                'file': self.scratch_file('ast2700-default', 'optee',
+                'file': self.scratch_file(name, 'optee',
                                           'tee-raw.bin')
             }
         ]
@@ -76,13 +72,12 @@ def test_aarch64_ast2700_evb_sdk_v09_03(self):
         self.vm.add_args('-device',
                          'tmp105,bus=aspeed.i2c.bus.1,address=0x4d,id=tmp-test')
         self.do_test_aarch64_aspeed_sdk_start(
-            self.scratch_file('ast2700-default', 'image-bmc'))
+            self.scratch_file(name, 'image-bmc'))
 
-        wait_for_console_pattern(self, 'ast2700-default login:')
+        wait_for_console_pattern(self, f'{name} login:')
 
         exec_command_and_wait_for_pattern(self, 'root', 'Password:')
-        exec_command_and_wait_for_pattern(self,
-            '0penBmc', 'root@ast2700-default:~#')
+        exec_command_and_wait_for_pattern(self, '0penBmc', f'root@{name}:~#')
 
         exec_command_and_wait_for_pattern(self,
             'echo lm75 0x4d > /sys/class/i2c-dev/i2c-1/device/new_device ',
@@ -94,6 +89,12 @@ def test_aarch64_ast2700_evb_sdk_v09_03(self):
         exec_command_and_wait_for_pattern(self,
             'cat /sys/class/hwmon/hwmon20/temp1_input', '18000')
 
+    def test_aarch64_ast2700_evb_sdk_v09_03(self):
+        self.set_machine('ast2700-evb')
+
+        self.archive_extract(self.ASSET_SDK_V903_AST2700)
+        self.start_ast2700_test('ast2700-default')
+
 
 if __name__ == '__main__':
     QemuSystemTest.main()
-- 
2.43.0


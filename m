Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 381EDCD4F3C
	for <qemu-arm@archiver.kernel.org>; Tue, 19 May 2026 17:50:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPOYx-0004lp-2b; Tue, 19 May 2026 13:49:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <williamdapinho@gmail.com>)
 id 1wPOYo-0004gL-BK
 for qemu-arm@nongnu.org; Tue, 19 May 2026 13:48:55 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <williamdapinho@gmail.com>)
 id 1wPOYk-0008N5-31
 for qemu-arm@nongnu.org; Tue, 19 May 2026 13:48:51 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-44a5174670eso2201289f8f.1
 for <qemu-arm@nongnu.org>; Tue, 19 May 2026 10:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779212928; x=1779817728; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=a9auS0agNGpEVN2f018I0hCwEtLQPozZwovzvL21kwo=;
 b=qb/MKKe+5hlbobvrV83JEDXLfndIl7b+G5wHN7t9QNMzxB8ZBWQG2vNox7VjRBfSYt
 42dR3GO4jRvibS2MVgiPjw/J9/Ks8nM4kN2qCT7Md/bznkki8h4vmB007aacvL3jx+hK
 5kIVr2iFrKnCpb/NAnJPjVUc1F0+ZnazC9f9i/qjIx8kXn2QrcJ+e1udTQqIZd6ovmPK
 q7Xn/EQYi7msVJMUpiALhCgIakZYvD+Ypa52f9jRKSMjTuKgVhdSCg6DIOSsVG4x3DJe
 Wmukky6mzUBZHEm0OZyM7tGI6wqoGglLyDR1exw4S63xfYMqVyjF6arGz14Oi5F1pd9g
 iTew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779212928; x=1779817728;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=a9auS0agNGpEVN2f018I0hCwEtLQPozZwovzvL21kwo=;
 b=c+axfS7ZMReRhxMxKuN+5O9Udb/H4lqIvCn9b3FZHxs1Jhd/Gpe3Kx1nd3AqVJLqI2
 NwnliQi2rLyIpaWs6kQaCls/JAn4uOeyvZiEKhJKDdJhVDnhe+4E0LUr8bmbga2OiZ2A
 XHsLmzlW3eXw3KqJ/iPcQ7r3cwB5iMSyYB5Nr4WWn5CTNyI/X9Nd4O0HkIw6ibeETmqT
 O6MQ7l/x1uFhR6gcM+6nSxvBjrZfgE1T56HvT7TBN4d5hijuJgn0RIq3nxUsBKzgaO9v
 z8qL7pB0Bk449nJoKTr2K2UQwYHK7i9V6HrVgs/ByVjzZOWAZyIdTWBtnzcVFxddHdKJ
 UDug==
X-Forwarded-Encrypted: i=1;
 AFNElJ9fgLpbo1vKrA0q60zii0ztRnqCLzwZD/HlXlGayKkTGkTzK/r1CrXGAqM8CEeNtxRaA01KHHB73Q==@nongnu.org
X-Gm-Message-State: AOJu0YziV6BJ5FfQve0h5sUe/hFV4Gn3ZVdsqBbTEz2Y+KkAXutSX3x2
 2FHA+a7lX+7K/lNKr3918sf9ovpvvJBCWplpKecQ/VCyBOta+3Q3Onmq
X-Gm-Gg: Acq92OHxfHQ/xK+WG4DKS6ks4l8oszZLyL2XCp/u6tT+ROdtKyMcRU2eRxTpQwYFV8F
 lDcIyrHx2ky1n4l5yBg2US5Mzc7R4+9MORhUx9PiTrPfCT1VDq0j3EJTxsbnYs/oqvhy/ULaG8C
 xkahgn6YY8k3p6ASdIapraT8mBVAjlS2u0iDMg5eQyQiIKa6PZlhWTrOiYiAHVIcLpJgdv0LoqD
 LChDYoJZA9sTF6MsET2idMnyl9AK+l55yRZOMEWByg7wf74RMFK55gk2JBWbkRZfAyz2laTWQc2
 44PWxurR9TRPgwUkvRrR9+rmVXiErKCeufvIeN2tozm1u7Sx20UzZMxx9m7Df+qS5owZaSWTDNi
 7xhPcACFVGy2Zvn2gG48d0sw9Rr1nbPj0iEzpYFMD7rmsIf28gOMBNSQfvnfTl5Ga/Xdm3TZpms
 ihEMCxnyfTiKoznadgAe69VOiQrXa111mj
X-Received: by 2002:a05:6000:2584:b0:43d:7783:c684 with SMTP id
 ffacd0b85a97d-45e5c5e6d3dmr33720709f8f.43.1779212927926; 
 Tue, 19 May 2026 10:48:47 -0700 (PDT)
Received: from localhost ([2a03:2880:30ff:1::])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45d9adc2209sm43965414f8f.0.2026.05.19.10.48.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 May 2026 10:48:47 -0700 (PDT)
From: William de Abreu Pinho <williamdapinho@gmail.com>
Date: Tue, 19 May 2026 10:48:38 -0700
Subject: [PATCH v3 1/3] tests/functional/aspeed: introduce FacebookAspeedTest
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260519-add-anacapa-machine-v3-1-56c23993a20a@gmail.com>
References: <20260519-add-anacapa-machine-v3-0-56c23993a20a@gmail.com>
In-Reply-To: <20260519-add-anacapa-machine-v3-0-56c23993a20a@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 qemu-arm@nongnu.org, Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 William de Abreu Pinho <williamdapinho@gmail.com>, 
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
X-Mailer: b4 0.13.0
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=williamdapinho@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Facebook OpenBMC Images include an early script [1] that lowers the
console log level to warning.  This suppresses the "Hostname set to"
message from the serial console.  Introduce FacebookAspeedTest (a
subclass of AspeedTest), that waits for login prompt instead.  Update
bletchley-bmc and catalina-bmc to use the new class.

This is also used by the anacapa-bmc machine introduced in the following
patch.

[1]: https://github.com/openbmc/openbmc/blob/6a56a45931fb7015a3fc18553415909105b484d6/meta-facebook/recipes-phosphor/initrdscripts/phosphor-static-norootfs-init/999-reduce-printk

Signed-off-by: William de Abreu Pinho <williamdapinho@gmail.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 tests/functional/arm/test_aspeed_bletchley.py | 6 +++---
 tests/functional/arm/test_aspeed_catalina.py  | 6 +++---
 tests/functional/aspeed.py                    | 8 ++++++++
 3 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/tests/functional/arm/test_aspeed_bletchley.py b/tests/functional/arm/test_aspeed_bletchley.py
index 5a60b24b3d..3000d0c302 100755
--- a/tests/functional/arm/test_aspeed_bletchley.py
+++ b/tests/functional/arm/test_aspeed_bletchley.py
@@ -5,10 +5,10 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
 
 from qemu_test import Asset
-from aspeed import AspeedTest
+from aspeed import FacebookAspeedTest
 
 
-class BletchleyMachine(AspeedTest):
+class BletchleyMachine(FacebookAspeedTest):
 
     ASSET_BLETCHLEY_FLASH = Asset(
         'https://github.com/legoater/qemu-aspeed-boot/raw/master/images/bletchley-bmc/openbmc-20250128071329/obmc-phosphor-image-bletchley-20250128071329.static.mtd.xz',
@@ -22,4 +22,4 @@ def test_arm_ast2600_bletchley_openbmc(self):
                                         soc='AST2600 rev A3')
 
 if __name__ == '__main__':
-    AspeedTest.main()
+    FacebookAspeedTest.main()
diff --git a/tests/functional/arm/test_aspeed_catalina.py b/tests/functional/arm/test_aspeed_catalina.py
index dc2f24e7b4..2694e4b005 100755
--- a/tests/functional/arm/test_aspeed_catalina.py
+++ b/tests/functional/arm/test_aspeed_catalina.py
@@ -5,10 +5,10 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
 
 from qemu_test import Asset
-from aspeed import AspeedTest
+from aspeed import FacebookAspeedTest
 
 
-class CatalinaMachine(AspeedTest):
+class CatalinaMachine(FacebookAspeedTest):
 
     ASSET_CATALINA_FLASH = Asset(
         'https://github.com/legoater/qemu-aspeed-boot/raw/a866feb5ef81245b4827a214584bf6bcc72939f6/images/catalina-bmc/obmc-phosphor-image-catalina-20250619123021.static.mtd.xz',
@@ -22,4 +22,4 @@ def test_arm_ast2600_catalina_openbmc(self):
                                         soc='AST2600 rev A3')
 
 if __name__ == '__main__':
-    AspeedTest.main()
+    FacebookAspeedTest.main()
diff --git a/tests/functional/aspeed.py b/tests/functional/aspeed.py
index 47e84e035b..88b6590934 100644
--- a/tests/functional/aspeed.py
+++ b/tests/functional/aspeed.py
@@ -28,6 +28,9 @@ def do_test_arm_aspeed_openbmc(self, machine, image, uboot='2019.04',
         self.wait_for_console_pattern(f'Booting Linux on physical CPU {cpu_id}')
         self.wait_for_console_pattern(f'ASPEED {soc}')
         self.wait_for_console_pattern('/init as init process')
+        self.wait_for_boot_complete(hostname)
+
+    def wait_for_boot_complete(self, hostname):
         self.wait_for_console_pattern(f'systemd[1]: Hostname set to <{hostname}>.')
 
     def do_test_arm_aspeed_buildroot_start(self, image, cpu_id, pattern='Aspeed EVB'):
@@ -69,3 +72,8 @@ def generate_otpmem_image(self):
             f.write(pattern)
         return path
 
+
+class FacebookAspeedTest(AspeedTest):
+
+    def wait_for_boot_complete(self, hostname):
+        self.wait_for_console_pattern(f'{hostname} login:')

-- 
2.53.0-Meta



Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F47DCD5BA3
	for <qemu-arm@archiver.kernel.org>; Tue, 19 May 2026 10:36:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPHoB-0005C5-1F; Tue, 19 May 2026 06:36:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <williamdapinho@gmail.com>)
 id 1wPHo8-0005B6-VF
 for qemu-arm@nongnu.org; Tue, 19 May 2026 06:36:17 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <williamdapinho@gmail.com>)
 id 1wPHo6-0005ss-3r
 for qemu-arm@nongnu.org; Tue, 19 May 2026 06:36:16 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-44ccbd3290aso3154612f8f.2
 for <qemu-arm@nongnu.org>; Tue, 19 May 2026 03:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779186972; x=1779791772; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=DWGCjJIGPHBo+PyVBXamfy8CAVuBZLEWETFeg3nvIOo=;
 b=gpJJ/B30z30YTjsS+igzg6k/2hwJiRdTzZheXXmp3KrwADUngTveX4pq+CKL+L3q2z
 MKXIynh3ZRDBkV+2IiF6YLpP1/NNPrEUm/JIXlfFIj+JNdwAhJSmJB1QnxiXqXAqbHOc
 vrf61E59irhfrXcZ0Nf4GjZWCwMMbypAHi6TcIOm428EDMcJwpg46gOwGIqn5PXz99Zd
 9qsSO/FS3DXOXoWSb0TJNQGL6lsXzrbEwvAI9EhqANN0xy9tSCMn8OL43ufHX8iTQART
 7A3GdeMJjIOBPOLe81ellFMqNtde8uYZ3w3PmoS7WehkO2nC0av8DIr8mWJgZA2RsuLe
 Vrzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779186972; x=1779791772;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=DWGCjJIGPHBo+PyVBXamfy8CAVuBZLEWETFeg3nvIOo=;
 b=bKihfJ8t0aT6Qv2t2x13kI2W6V+gIPBQMY+Yj70rSo4QY9gFxCDjIgEnQid2J7xjLp
 pjWgPJItHVgHLwrhhLMTHeX63AELKFcelCNHfFvQygIx7jX9VK8Y5abq/7VYafFnNuPA
 p0ljIPnLMm7sl4Oxes2ZB7L/mcKeOCPq2hEVIz2zg98CMG49kMLIApFO4E59LSffT78V
 5xfSyjup+FZkbaDHWZGFCoSXJcy0o4y36+MrI7FSUsNzBt0rtJiMdOz0O0CQPDt6iWeo
 C13wp/T59KF2RksdcQz6SOdrwOryH01iTDhFKOGLQJNk6fgdalMe3FZ+JPgBrogx7IS3
 YzHw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+hzOoAPKRt+4u0etkB+grZR/o1/0cBIUFoBi7mnpay/rV3SbViypWa/fdJKq9fAiht43vaNE9e5g==@nongnu.org
X-Gm-Message-State: AOJu0YxpfhMoGuJbqoogHXJGz/vK9FvqOdWNVnVK7iQhnrGfFQgeIHlU
 +0G3LcYecfGmT+RAwF+dwpaSiGDDrfX1fW74pfF+759UyO0D6zObsbXy
X-Gm-Gg: Acq92OGFv/wyNoSgMB9p8CukZMghpC+uOjoIkP7llQJ/ZWZHqh7uQSj/D7wJYhNyPJI
 jDx9TUsFJ8gZUKilJkC6yJSVperVblRyMooZT2bVuL2VZJzbF7W2Y1+ndDZ6+Xy3U0dhIl+1aQC
 ACzjhi3KymdpadzCHEcLdaBMea5vpqabcG/4RIaU80oswKQSlfWB/TDjzQaC5sV+XH4EMcguAo5
 IpDvWUjLPRsj8cqLUCav30BAQb1xi6TMmdL+U0qePLbEJr83H9pG9Bz5o2JhS3MaKwKdXfU4x7H
 dtyAqMwmC7OH0FB1j3vsdnXnx1ejgvB3TNnveBJAB8f3ZAHkherDGiLpEBTcuUh+kpre6HeI3WD
 nJnr9JpNCl9N6JgQdvFyTji28fpKY98sW2aNHSd1iqZj0p7mP8MqxWIzro9KQ+Sbt/fPaMzHGEd
 XAmB9aZymiIZZsDWi19cQ+dQ==
X-Received: by 2002:a05:600c:848c:b0:488:9ed3:1492 with SMTP id
 5b1f17b1804b1-48fe60ecc19mr294591405e9.10.1779186972179; 
 Tue, 19 May 2026 03:36:12 -0700 (PDT)
Received: from localhost ([2a03:2880:30ff:8::])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fe5cab818sm329581015e9.14.2026.05.19.03.36.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 May 2026 03:36:11 -0700 (PDT)
From: William de Abreu Pinho <williamdapinho@gmail.com>
Date: Tue, 19 May 2026 03:36:03 -0700
Subject: [PATCH v2 1/3] tests/functional/aspeed: introduce FacebookAspeedTest
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-add-anacapa-machine-v2-1-47027867d76a@gmail.com>
References: <20260519-add-anacapa-machine-v2-0-47027867d76a@gmail.com>
In-Reply-To: <20260519-add-anacapa-machine-v2-0-47027867d76a@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 qemu-arm@nongnu.org, William de Abreu Pinho <williamdapinho@gmail.com>
X-Mailer: b4 0.13.0
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=williamdapinho@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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



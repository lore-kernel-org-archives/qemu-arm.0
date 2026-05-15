Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62280CD343F
	for <qemu-arm@archiver.kernel.org>; Fri, 15 May 2026 15:06:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wNu7g-00032c-GT; Fri, 15 May 2026 11:06:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.hansen@9elements.com>)
 id 1wNu7S-0002yK-US
 for qemu-arm@nongnu.org; Fri, 15 May 2026 11:06:31 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alexander.hansen@9elements.com>)
 id 1wNu7Q-0006L8-1Y
 for qemu-arm@nongnu.org; Fri, 15 May 2026 11:06:30 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-43fe62837baso4844690f8f.3
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 08:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=9elements.com; s=google; t=1778857586; x=1779462386; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FXicQdEbFuhViRNTnJzl4idoluEFH3ASMqDiECC5aoQ=;
 b=ZrC6zykDiutJ/06MlWT63aR1xxh4fW1XXNCd+pnCrNNY5UPYGdrohoSZ7Md0IN6AU9
 jWnScQmPX5CPw662fEMFMl4W+qR/jk9Gssxu1LpX0HlXBHM3A//bdPenjv9NorRB3LHQ
 7IZX3usId6JEkEqfYdpjr/b2/AaOlbJKsr4q+3yXbtFmaUQUO/z6pqAJRVjeGAjAJ6g/
 Hh3iWFkZlWKyDQlATyhVlTAha7bdJo2QM2hHnQNUhMdSCBRXTiBslzvhfIRWoVhBwKUK
 ghstJgdi/yF1ShGg4GYOTUjuZDHdKEZzUstIxp6eGjnLuDLq4Mvj+bpmI9iPzr5oBsQS
 I9LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778857586; x=1779462386;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=FXicQdEbFuhViRNTnJzl4idoluEFH3ASMqDiECC5aoQ=;
 b=DKPRe5ALDREOeqBNVIKmf41swcELvEj4wrmKjDhKF+z3s1maSPr9OuAbeqlvBTSC9/
 vExDk2WRnQ8A7mvotq1ivfgRAic/xYhnMMsMy5FLSXCPt+2lpajd1FPgCfo8MGcUy6bf
 c+veme8rjqjFDlLmku1Uhjef9T2HkFgVj4MKklGiQgmsBHA26aQGK4sHUgj9gCmAXW8K
 rJEHTutb1KMeHfNKQqhsgTA5j2f8X3us4VzTwcktHGjEn6bkqE9hV/urIj3SVVoRootX
 6aC/gEJq77mzuB1ZOgk5CbH2uDqkws1qjkmF4jn/7C4WOTpeX34Q/C0OV4Zs37T1rG6T
 QhIg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8UN98UwdAkMfO0KZ5zVipnsYOKR5ERzxyhWY/ot7uRI3m4F/YfZdrJEASgnwOdTncNN1AsFA/y/w==@nongnu.org
X-Gm-Message-State: AOJu0YxqOcxsqGy1fjvGxCfDD6Et0AydyqwvdUvVE6+0hN61LPAdUUJK
 HbHnxUKvftBuEBNTGUKGXxBuycL8pv6C7q7mdCzjY8T0soGP1ZfL7aw25bOj5yw+EqE=
X-Gm-Gg: Acq92OGBFnjUstLcCJX4myw2m67Hk4VhHqcMqxaidzmPEvc2ibA+Tb5kqxYM3p0Re1g
 q4raTlrQgQD1OHxDczRzQ8BCAD1E73429RWr4LpTx79PYUdwGvI2DdzUaGsgblHdQDAvlJ8yX+j
 7iAlWqq7c9SofjvRIXO8W/FftrBkJ+sRuOppwNZcgC+KNWSkp6YBaTY2/PEV/4bbaAbvb/eMZ9+
 AK1q1r8/B/3vDYqB2K4yV2U3/1MRsDdvcmq97rebbm6u87KmX5nJ1Jildug0JnaV427JWNzS3I3
 VyuMARsd33fN8RmS8q9/m5gXs34S0AcM0bSVkBfcQUjjW4OUv2jItSvkPT1tfqL5Bq/iW1Ah2gR
 j6/GW1hHy1J20idGeZqi0Yo+/1geYXhjy0KsiRO6jcjYH4Pa5zADAA03FZz7TxmOXoOYj7bjwH7
 1L2Swn0pgcDeQEvdF1kmYzc0tqbJgaOUtvKcAz9w16DgNq
X-Received: by 2002:a05:600c:470e:b0:48e:8741:fd3d with SMTP id
 5b1f17b1804b1-48fe60ea21dmr58723745e9.14.1778857585843; 
 Fri, 15 May 2026 08:06:25 -0700 (PDT)
Received: from alexanderarchlinux ([188.111.3.154])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48feab290e1sm29444715e9.2.2026.05.15.08.06.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 08:06:25 -0700 (PDT)
From: Alexander Hansen <alexander.hansen@9elements.com>
To: qemu-devel@nongnu.org
Cc: Alexander Hansen <alexander.hansen@9elements.com>,
 Titus Rwantare <titusr@google.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org
Subject: [PATCH v4 2/5] ast2600: yosemite4 functional test
Date: Fri, 15 May 2026 16:57:59 +0200
Message-ID: <20260515150610.381066-3-alexander.hansen@9elements.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260515150610.381066-1-alexander.hansen@9elements.com>
References: <20260515150610.381066-1-alexander.hansen@9elements.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alexander.hansen@9elements.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Add a functional test for the Yosemite V4 (fby4-bmc) machine
that validates:
- U-Boot initialization and kernel boot sequence

The test uses an OpenBMC image built for the yosemite4 board and
validates console output through the boot process.

Cc: Titus Rwantare <titusr@google.com>
Cc: "Cédric Le Goater" <clg@kaod.org> (maintainer:ASPEED BMCs)
Cc: Peter Maydell <peter.maydell@linaro.org> (maintainer:ASPEED BMCs)
Cc: Steven Lee <steven_lee@aspeedtech.com> (reviewer:ASPEED BMCs)
Cc: Troy Lee <leetroy@gmail.com> (reviewer:ASPEED BMCs)
Cc: Jamin Lin <jamin_lin@aspeedtech.com> (reviewer:ASPEED BMCs)
Cc: Kane Chen <kane_chen@aspeedtech.com> (reviewer:ASPEED BMCs)
Cc: Andrew Jeffery <andrew@codeconstruct.com.au> (reviewer:ASPEED BMCs)
Cc: Joel Stanley <joel@jms.id.au> (reviewer:ASPEED BMCs)
Cc: qemu-arm@nongnu.org (open list:ASPEED BMCs)
Cc: qemu-devel@nongnu.org (open list:All patches CC here)
Signed-off-by: Alexander Hansen <alexander.hansen@9elements.com>
---
 tests/functional/arm/meson.build         |  2 ++
 tests/functional/arm/test_aspeed_fby4.py | 44 ++++++++++++++++++++++++
 2 files changed, 46 insertions(+)
 create mode 100755 tests/functional/arm/test_aspeed_fby4.py

diff --git a/tests/functional/arm/meson.build b/tests/functional/arm/meson.build
index 2f538f29a2..10c0006f22 100644
--- a/tests/functional/arm/meson.build
+++ b/tests/functional/arm/meson.build
@@ -14,6 +14,7 @@ test_arm_timeouts = {
   'aspeed_ast2600_sdk_otp' : 720,
   'aspeed_bletchley' : 480,
   'aspeed_catalina' : 480,
+  'aspeed_fby4': 480,
   'aspeed_gb200nvl_bmc' : 480,
   'aspeed_rainier' : 480,
   'bpim2u' : 500,
@@ -47,6 +48,7 @@ tests_arm_system_thorough = [
   'aspeed_ast2600_sdk_otp',
   'aspeed_bletchley',
   'aspeed_catalina',
+  'aspeed_fby4',
   'aspeed_gb200nvl_bmc',
   'aspeed_rainier',
   'bpim2u',
diff --git a/tests/functional/arm/test_aspeed_fby4.py b/tests/functional/arm/test_aspeed_fby4.py
new file mode 100755
index 0000000000..a3124c240f
--- /dev/null
+++ b/tests/functional/arm/test_aspeed_fby4.py
@@ -0,0 +1,44 @@
+#!/usr/bin/env python3
+#
+# Functional test that boots the ASPEED machines
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+from qemu_test import Asset
+from aspeed import AspeedTest
+
+
+class YosemiteV4Machine(AspeedTest):
+
+    ASSET_YOSEMITE_V4_FLASH = Asset(
+        'https://github.com/legoater/qemu-aspeed-boot/raw/refs/heads/master/images/yosemite4-bmc/openbmc-20260505132843/obmc-phosphor-image-yosemite4-20260505132843.static.mtd.xz',
+        'dff6946363b41f952b15cfc3156482b89fcfc1b0ecfc3ec8b3ed496a5f001ef9')
+
+    def do_test_arm_aspeed_openbmc_no_network(self, machine, image, uboot,
+                                   cpu_id, soc):
+
+        self.set_machine(machine)
+        self.vm.set_console()
+        self.vm.add_args('-drive', f'file={image},if=mtd,format=raw',
+                         '-snapshot')
+        self.vm.launch()
+
+        self.wait_for_console_pattern(f'U-Boot {uboot}')
+        self.wait_for_console_pattern('## Loading kernel from FIT Image')
+        self.wait_for_console_pattern('Starting kernel ...')
+        self.wait_for_console_pattern(f'Booting Linux on physical CPU {cpu_id}')
+        self.wait_for_console_pattern(f'ASPEED {soc}')
+        self.wait_for_console_pattern('/init as init process')
+        # yosemite v4 does not emit the hostname log which is
+        # different from the other machines.
+        self.wait_for_console_pattern('yosemite4 login:')
+
+    def test_arm_ast2600_yosemitev4_openbmc(self):
+        image_path = self.uncompress(self.ASSET_YOSEMITE_V4_FLASH)
+
+        self.do_test_arm_aspeed_openbmc_no_network('fby4-bmc', image=image_path,
+                                        uboot='2019.04', cpu_id='0xf00',
+                                        soc='AST2600 rev A3')
+
+if __name__ == '__main__':
+    AspeedTest.main()
-- 
2.54.0



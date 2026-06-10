Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8616ACD8CB9
	for <qemu-arm@archiver.kernel.org>; Wed, 10 Jun 2026 12:24:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wXHxw-00072U-Mh; Wed, 10 Jun 2026 08:23:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.hansen@9elements.com>)
 id 1wXHxj-0006sf-LM
 for qemu-arm@nongnu.org; Wed, 10 Jun 2026 08:23:15 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alexander.hansen@9elements.com>)
 id 1wXHxh-0005rh-Ko
 for qemu-arm@nongnu.org; Wed, 10 Jun 2026 08:23:15 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-45f3cf907ceso3439051f8f.2
 for <qemu-arm@nongnu.org>; Wed, 10 Jun 2026 05:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=9elements.com; s=google; t=1781094191; x=1781698991; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZhogzhFO7uDRTLBEbud3mZouqlv1sTkvv/Oi6WwVzrM=;
 b=WWyzemEy2tZOXtUQmJPHnO32mgshJLGz7UPmztZTfL8njFQlZjTUOlF4Js33AWuOoH
 vIj75IBRTR0HwJelw8qcDOShV/JmC0wOHRKGnM81ex0RpM3DYWrZZXcyMxC6ult8nt3M
 8LZvFh6PEE0heXhkqkeR5GL33KaWbKDkYpm8wWjoyv5nGY0AsuDXxm1PhU/MuYbpa4Ws
 l/b9btqWVCDLYpIFEU7rue/Bh3whKDqnwn4+IZr/yz/8ouI3U5jDhUwCuFl6Pc/hnpoX
 +hxkb+VbAUJaKMcLEf9zIyF1SwJxItrH7grwc68Fnyy3afW5X2U8cMJ00RrRNFqkCk00
 RWXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781094191; x=1781698991;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ZhogzhFO7uDRTLBEbud3mZouqlv1sTkvv/Oi6WwVzrM=;
 b=Z0j0P6isDi84C4Z98VhtJnSdCSPdtBnDjY+Od16AKb4ouzDT/GXSByB2Bgd35l8ib5
 sgHha44t3r3x4PGGXztN3RyYOWJcM1BgSpCHsiSbffLVU5obA97vL5LszXsBuSvvQD98
 f6Yze4/wLvBcyvEw8cxz3uUImwpHb1YaJT5Bi+kdrVpXJa+NTv7DTiOzAC2/LnDyVvUc
 daXAwftXd1v4/H6Z4BDGyI3HWUU2PX1Y2h3Bgt4mooE8+m61PTovqYbf5uCvSl2TxXb2
 l1BPolTBAamwzaT9EIlTY14dCnIQphyyKcFFPNR59Q7dLN4Do07kBjtTUDRxX9JNZYnu
 e/nw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9iNNoEEovrlCWm2bjaf6rvSh/w1p7YUkX9Y2gUk76EsKmg6iRwVmZwoxVv3k+cnvcejxbXlVcijA==@nongnu.org
X-Gm-Message-State: AOJu0YzsqXxQZ/pB/9RDvtEV554fcBPSEF4nVMEVvzRY7vAQleujdfAE
 jfaLYqp3gfP2mGRg9VD/WGWzzQ5Mlp+DF+7vUC3EEckqyEtUArSAWr8pMvi0VhMsNU4=
X-Gm-Gg: Acq92OHn0ct8W2o0yCisdDgqrNxwBJisez/FACzH6z7SNSQOkly8L4mSpP2nPLD1Erw
 nND6pcifKvcRADsbgsN9j8eDheZ7ucLSj7k/GTOwISWrAYpbQlQ3pTy77C42sxMaBSW1PVUtXjL
 9JoAn9tY29PNK5LKVCssQQtrUjgNQ9WzBjJYOIHG6Z/pyVAX0cZ7twpUsRqEwdqN6v9s7zvLFrE
 PN4ZV6RxA6KrzQ5XO6Ba6lFiucomKA/zR38pqH2pH3ns68oLkMugRHNco1c3YOns2LYAXYEbnZ3
 BP2hAdqXVlVDNkdogm+n4wChuBmS/5c6Gp4Micg6ZmSM6XGmIwOcPew7s77oeOSlCVn2nGOHM0h
 gxyeUua9nAFZiru/QWa0alVEmRnqGBVQeAojIsxtcExoFkYWpULUtsQWKucQJRdvaRRJTVYK4A7
 k9w6PEQAvn/yxes80hr78bxOqe94x5qotpqiZSa9d+BHV++6YrNHxwqwE=
X-Received: by 2002:a5d:4574:0:b0:43d:733f:aee6 with SMTP id
 ffacd0b85a97d-460302ec8dbmr29296978f8f.10.1781094191044; 
 Wed, 10 Jun 2026 05:23:11 -0700 (PDT)
Received: from alexanderarchlinux ([188.111.3.154])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f0a43e9sm70995963f8f.0.2026.06.10.05.23.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jun 2026 05:23:10 -0700 (PDT)
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
Subject: [PATCH v6 2/5] ast2600: yosemite4 functional test
Date: Wed, 10 Jun 2026 14:20:59 +0200
Message-ID: <20260610122252.349321-3-alexander.hansen@9elements.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260610122252.349321-1-alexander.hansen@9elements.com>
References: <20260610122252.349321-1-alexander.hansen@9elements.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alexander.hansen@9elements.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
 tests/functional/arm/test_aspeed_fby4.py | 45 ++++++++++++++++++++++++
 2 files changed, 47 insertions(+)
 create mode 100755 tests/functional/arm/test_aspeed_fby4.py

diff --git a/tests/functional/arm/meson.build b/tests/functional/arm/meson.build
index 61b00932db..19331b3f16 100644
--- a/tests/functional/arm/meson.build
+++ b/tests/functional/arm/meson.build
@@ -15,6 +15,7 @@ test_arm_timeouts = {
   'aspeed_anacapa' : 480,
   'aspeed_bletchley' : 480,
   'aspeed_catalina' : 480,
+  'aspeed_fby4': 480,
   'aspeed_gb200nvl_bmc' : 480,
   'aspeed_rainier' : 480,
   'bpim2u' : 500,
@@ -50,6 +51,7 @@ tests_arm_system_thorough = [
   'aspeed_anacapa',
   'aspeed_bletchley',
   'aspeed_catalina',
+  'aspeed_fby4',
   'aspeed_gb200nvl_bmc',
   'aspeed_rainier',
   'bpim2u',
diff --git a/tests/functional/arm/test_aspeed_fby4.py b/tests/functional/arm/test_aspeed_fby4.py
new file mode 100755
index 0000000000..a521834f79
--- /dev/null
+++ b/tests/functional/arm/test_aspeed_fby4.py
@@ -0,0 +1,45 @@
+#!/usr/bin/env python3
+#
+# Functional test that boots the ASPEED machines
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+from qemu_test import Asset
+from qemu_test import wait_for_console_pattern
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



Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F06E3CD4F21
	for <qemu-arm@archiver.kernel.org>; Tue, 12 May 2026 10:23:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wMkGM-0003WK-18; Tue, 12 May 2026 06:22:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.hansen@9elements.com>)
 id 1wMkGB-0003T2-9m
 for qemu-arm@nongnu.org; Tue, 12 May 2026 06:22:50 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alexander.hansen@9elements.com>)
 id 1wMkG9-0001t3-34
 for qemu-arm@nongnu.org; Tue, 12 May 2026 06:22:42 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-43fe3e22e33so3138177f8f.0
 for <qemu-arm@nongnu.org>; Tue, 12 May 2026 03:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=9elements.com; s=google; t=1778581358; x=1779186158; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dAWrwRNP92wZKGCcLcaijfgOVAvYms7a9ZNp7Ocxxqc=;
 b=IJQmCfwHNApKYRWRp9eRePZ0KsOgYCgQ/Vc3WAywB4t1jmTgxTXU5lfvhi8/lsTVR7
 mW60ujMG25HuJbF4g6SSwr7O9HrMhOI74kH8c2rJbLHhk9J8LFj4qXzsVQ2y1pO5+vqE
 rWU0Q1Ji9RATTv42lVZSFDtcPE6Mu2bXpudVg7mqoSYh5jhTEzLudXOen2sMnOAnFG+B
 QuKq3mbStbFhT1I6jyH/0g+to1vbG+wIlnf7TgYAQXPAqbpi0ZKwjyMdK2OK0jlx0CfH
 Gv7ny9J/Y42HLJEPXccT82BE5sy7RRRYJuMi6DBzft5Lw1GIg9X1KxPea5RcnM+hg/o0
 M4Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778581358; x=1779186158;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=dAWrwRNP92wZKGCcLcaijfgOVAvYms7a9ZNp7Ocxxqc=;
 b=adYbgx4lAwAMM1h1T3AErnBDVCMF6Zi+CoscX7s/oLsutPMMX43B1CWfoKjrv/5Mj3
 2Q+I8d1vVjAiCPziex86cXWdSihwjiIjpNu1vfemEq6bDgxFZL4TYzFsxjajp9Nldn3L
 m3XupkSIN87bGL4FKKpR9TaaP/zbnNRJ0plVfzabj06A+Dwp/stSnG9D6SKRlQ0be1sZ
 +4UzX7R9U5OiG9oqIWI80cBgjnIpXWZNzAfIpg8fmySoP3qqohExLVl6LjlAyckD0BEt
 3U+Qd4IHzgnd26+ARDII44sgNFbmpucbHZPkKKnUbOy6pJj9D0Hhu5mhdKEEe3UTZWRt
 ta5A==
X-Forwarded-Encrypted: i=1;
 AFNElJ+zoWanBVo06hN1S9yxRx4Em5ASG2gNrKNFdi6A1erCfJnMePN0/7Rufbf0xHUv0DYVQFq0TyB2lw==@nongnu.org
X-Gm-Message-State: AOJu0YwZUqaN+R4bU1WdfFXdsYnDcJ4pYJfaOgBytVQmJ7qBLAd2IdZM
 zdkbVYzF3OsLS7YvBqsDXNAGJEUSp9gOFFpCnqln75Cy40vpCKNGhvsbRo7EJC/DpHU=
X-Gm-Gg: Acq92OH3keLVnbmB2C8IRAtJLyUAsBMXRh0epz4OVV8QlMvO5SNxbsol+4ewummzXSE
 y/5PvwQJmDVMHSaqhcg0WJSqK5/YvV5T9ExN8BAq1t3/iOXmFnjMgUEUmODUn6gghqkRaO2Vbqk
 eOgdFY2efALNRe32bNKTvkczsCk+e97FwdRadldppxUPTXoO0XmogVEtlv0ywApJXdhs5lPLWYs
 jaUMPbvCaTEoO7EMF7sSJXMpAfCqmc2ANynx5tS8ilBegjOPGsTBiwYY/cMSE6tZmV76DBDBjFU
 g+RdfZYmHVWut31up6DYdFpaoVu+SHZ14nPS9B1CFiel4YiG/MDsBfnQhhFnxrqsDGeerwjxhm3
 jgl8beiFLVfN6K4vtkkFhczyWfKhYm69TlE+/Fcox+yLq8t7udkU97jzHV17WhOfVvQIX9fUZuM
 +p9PsoEYHHvB85/YSIak7Qx4gbF9Hl8k3SYBShlP6FZ4BD
X-Received: by 2002:a05:6000:2401:b0:448:8db5:410b with SMTP id
 ffacd0b85a97d-45b14adc080mr3386647f8f.20.1778581358528; 
 Tue, 12 May 2026 03:22:38 -0700 (PDT)
Received: from alexanderarchlinux ([188.111.3.154])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4548e6a68ebsm29991198f8f.1.2026.05.12.03.22.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2026 03:22:38 -0700 (PDT)
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
Subject: [PATCH v3 2/5] ast2600: yosemite4 functional test
Date: Tue, 12 May 2026 12:20:37 +0200
Message-ID: <20260512102157.176511-3-alexander.hansen@9elements.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260512102157.176511-1-alexander.hansen@9elements.com>
References: <20260512102157.176511-1-alexander.hansen@9elements.com>
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

Tested: functional test passed.

export QEMU_TEST_QEMU_BINARY=qemu-system-arm
./build/run tests/functional/arm/test_aspeed_fby4.py
TAP version 13
ok 1 test_aspeed_fby4.YosemiteV4Machine.test_arm_ast2600_yosemitev4_openbmc
1..1

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



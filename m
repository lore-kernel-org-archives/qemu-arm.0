Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB4A3CC6B03
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Oct 2026 12:48:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGbuz-0006ps-Ih; Tue, 13 Oct 2026 08:47:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.hansen@9elements.com>)
 id 1xGbut-0006nh-PJ
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 08:47:39 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alexander.hansen@9elements.com>)
 id 1xGbur-0008Rg-Om
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 08:47:39 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4a17baef589so24774755e9.0
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 05:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=9elements.com; s=google; t=1791895655; x=1792500455; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=YG0cRqgJeCblEwt/Ltv/1NRMuhNsZX2nbNBlMTJ0gDM=;
 b=HXpkNq7IX+pKKfw8AJilcoLx4TWErNs3sNMPhtsXUxZiJDS/rrU5OnZqrhIofb208g
 DPsBj9tdXKLorKPsJtxZoa5H5I7TAYYNs0eZnjUxTnUrzeOTRDfryz+SZDEqedwLGW1p
 /wIkL6IK7z1Umo4yAbGoFrJ2A5XSsZfO5b2S6iu+F9ciEIDYN3XstvslqKTbAjQK2w+U
 fk0vh/Vc0a2E6IZdMTzG5Egrwp2HHZ6PE0G8V3ovj/y5dS8GQUthwZEZA7RToyZT8VMe
 6YRbE6TLbc/ZISU9ujHngaXUdskXgEQ6SXvmboAF9lrC34B7db4+T9v+jTlUdAbISmug
 raKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791895655; x=1792500455;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=YG0cRqgJeCblEwt/Ltv/1NRMuhNsZX2nbNBlMTJ0gDM=;
 b=ogBLNqM/3GqOXSQnLNmiqTV7qwn0M7HBfIuKaj+LUM5twwumXg1bNuBvpxn7UkZ5n5
 kYgIEc17jVu5Jf9Oi87jL2Z6OlYyIiZnc89oZQjLyfPW8DcTllGMtoggAxcpkci3WWNO
 Jm/FwapBtKnSBuijq08IBN6LHzXB2vQvHTH51Je1wZ9NwhWwv3vlvn9RtXOE4w7L5djG
 ixibtUnxVO1p+5ElHsJofiM5rC6fsE394GxUlf91TvxzVoeMGLcwxVvg4Aw0svgbW31N
 zWbJMIxvlGSDox9T63/Up/FRXf4qxtCaEl020qhB/bDtbyfjGaGPg23WoNPEYdLQBg2q
 xc0g==
X-Forwarded-Encrypted: i=1;
 AKwUvBxKLooCXjbwfoIEN2JFlE8bNioOh7CFTLrJ+36LDqXwk1yx3ieky2jKED7xB9GxH5IHqYKbfDo4cw==@nongnu.org
X-Gm-Message-State: AFq9FYJnbjUTsg8cXqdpFNFDQepRBgMTppflUJNGnJNT3YoTVd51eQ1/
 IbaYxPoATPiTqUUrA1NjpepshChGNgTwqGW0whx/FsF59fyUw3naARK/AOuoxaszfvM=
X-Gm-Gg: AYBFou2m4L5Q7kC7Oyc8TtBWMU+V9yRB6hTDbePfEXmd4yhAnhqk/qtnpn+SDqETvT6
 Y8ItRidCDS8xCaNDBmexi1kSkC5GSFhePXoFQ9Mb/gnpV1s/wCVbQm72SsQBEMnhiybQHII1n86
 7iPWzgB6EAeE7OIRvtt2wJtxc9lT4P1q4CflfHT6r78EyOD5jgDUF3St+zoYSHLFqR5oZppMRkU
 pnG1Y17pjcoscKIarEIZ7BcWLK9D9cpfWG4IhEClV8ok9vZj3hh/Czu5IGgKmrENNofhlPy92q4
 RXNAqAXXmJROmeph25VmI+Z7v4ACAebKAXoP1bFTgqOmqM3Lij/ZEWWGEtkp5m+VKDCPKZZagKL
 8q+WmeUKk2uWl7NFjGeblZMD195jjvjVHHh3/5YbYIKyplsj4sYz7D5cJJh8TxvNFRNG9EreRD2
 mnPbLrhoeMVIqTE+gH1YYMBf5PNchc47Hkiu+22J4dcmNogY7K4+Q0jqW54MxzZnSJKy5vWeP7x
 nueeXKNSng2Xtao7K4RBAA=
X-Received: by 2002:a05:600c:8105:b0:4a1:714d:eed with SMTP id
 5b1f17b1804b1-4a18e4841c1mr234784065e9.14.1791895655428; 
 Tue, 13 Oct 2026 05:47:35 -0700 (PDT)
Received: from localhost.localdomain ([188.111.3.154])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48de0bc4ebbsm4768847f8f.45.2026.10.13.05.47.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 05:47:35 -0700 (PDT)
From: <alexander.hansen@9elements.com>
To: qemu-devel@nongnu.org
Cc: eblot@meta.com, titusr@google.com, clg@kaod.org,
 Alexander Hansen <alexander.hansen@9elements.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH v8 3/5] ast2600: yosemite4 functional test
Date: Tue, 13 Oct 2026 14:46:47 +0200
Message-ID: <20261013124649.194808-4-alexander.hansen@9elements.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261013124649.194808-1-alexander.hansen@9elements.com>
References: <20261013124649.194808-1-alexander.hansen@9elements.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alexander.hansen@9elements.com; helo=mail-wm1-x329.google.com
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

From: Alexander Hansen <alexander.hansen@9elements.com>

Add a functional test for the Yosemite V4 (fby4-bmc) machine
that validates:
- U-Boot initialization and kernel boot sequence

The test uses an OpenBMC image built for the yosemite4 board and
validates console output through the boot process.

Cc: Emmanuel Blot <eblot@meta.com>
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
Reviewed-by: Cédric Le Goater <clg@redhat.com>
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
index 0000000000..b6af9a21b7
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
+        'https://github.com/pointbazaar/qemu-aspeed-boot/raw/refs/heads/update-yv4-image/images/yosemite4-bmc/openbmc-20260505132843/obmc-phosphor-image-yosemite4-20260505132843.static.mtd.xz',
+        '51dc13184810269399d4b47201ac8cc2e02839dd444f1b41a33ea9b9ee030c08')
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
2.56.0



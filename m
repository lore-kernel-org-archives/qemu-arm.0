Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1839C982ED
	for <qemu-arm@archiver.kernel.org>; Mon, 21 Sep 2026 21:51:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x8lrT-00068x-EX; Mon, 21 Sep 2026 17:47:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1x8lrQ-00066o-Gu
 for qemu-arm@nongnu.org; Mon, 21 Sep 2026 17:47:40 -0400
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1x8lrO-00008u-7S
 for qemu-arm@nongnu.org; Mon, 21 Sep 2026 17:47:39 -0400
Received: by mail-wm2-x11.google.com with SMTP id
 5b1f17b1804b1-49b965f447cso29546825e9.3
 for <qemu-arm@nongnu.org>; Mon, 21 Sep 2026 14:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790027257; x=1790632057; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=VBH9E99MFnB3gX4SExb6p8NPz5EDIV6xjZ4ICVmDV88=;
 b=G7HdjaUEGFn/IyNcffjrDSfAVHn5Ck1B9PMMXuWbGsbfTsQh4nBQuBGZwjB1Yr/RPb
 Kl3y83Hb3t+FVXb0XUx7eq8NUHkrZeX6VEfwM0mOGBMhy3ODdhXTzKfmmrbQCwAI5uVG
 H/mprn2KK3jPmkYX6bKnP7iI/MaArXdnI0zz5e4/DhELRt7lsF3cBhAo1h4qa1zIbATn
 W0JdIkwJW3iDGyUiVI5GIQtItHC9vikR9YnaNSsYTco4+emGfW/S2iZUqY437DL6sMGE
 DMPh/BHBCmPA+zFsfS9q7sY/U15HRybJi75RpCZa7d8TN1JU/R0lnBTN4yZ0nEO7UJJm
 GuiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790027257; x=1790632057;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=VBH9E99MFnB3gX4SExb6p8NPz5EDIV6xjZ4ICVmDV88=;
 b=yr2A+PE87Wgwk5f4FmrUPY5wY+IYEZQ3u5ao8rQ++SuhUX9qexNSZdI8s4+HquVbPn
 0OWyO8cbGiBEvpRmcHjcMPzZrfDc7MkbbmokThSqfruU6VSXtGASsUctERjSsc8FGtmj
 tlfCLyZECx7UX7hMQeqU0gJQ4Uuv+Bma7FB+ATYI4wg/hWspxZKI6A3KPvU40pAKZte2
 zZLzh9I/4+yNGUu2qSgAIG59H4x8SHhEVqASznRoE4OS2iq191f32//ewjtaDclj90/5
 OpiIiHx7ee15YXGLx8I9QcTky64K7QxAiGeCazbmWRpi9vS9KRdMX2ktDhjLixQuKJMw
 ZFyA==
X-Forwarded-Encrypted: i=1;
 AKwUvByaxHBvWt5mKNJWwNZksDrPdrbVT92ZrBqZrk+V9FxZp7bNBGIeTqUB06ytUkoOH17z43Rx1TCXVQ==@nongnu.org
X-Gm-Message-State: AFuF++lJEr42hvMqnD065dtt6QDJs/kk0UmQpsfFdWTUUiUfcjTolwIp
 zZ2R7IQBN5zeBSIOOEtyvEADdetV0Fmfcakzu12SJNhA8Y6RD0EWl7ap
X-Gm-Gg: AYBFou1Q1Hf/5E3xstvcoWmWRsPPBVwiNBrIqTPvTRgkmxRMyge3lQ/VPuGUPRgUXup
 jlHgzj0hcy6+0uvOGVy/JuO9h3NiP4nNrdGE2Ib8VyDRRmMRsR+cKhcFvdvDnN8UHoA/1HmJZvs
 fvreqwFi3KQi3ZA3ffFcb+rXL743ngN3n22jglXROZdVOYO+nkarMQIMIc2zAcKX1bRmxPuk9xP
 3wsVAXOLxCmDALqgEKWDTkS+XWf/6FjJOxwf5guEo3Bf2QIZBIQg3PnTHAsNGOd/sb+9SB6sDJb
 tevbAwQR2d2U7+DxNuRkiIePabuKwT24zCL+QlE7z8C2Y3G3QFpgFGDiZfrmZQYTiujITuIbPX8
 ayUctsGjkLg7DRF+ImE4LMmzbFpNteVlaO+6PwvHGO8sqtYfd7U2bhVdqTOHBywclQqsCtEpyBO
 PuQk6efRRBdtn5kGpmgQi3tv2h37bNGGsjGiL5GqpFGkbzRiVG2TUqaQEW5ktpxjghpmcpvxAhm
 8zJDsocwbm11Ak/8+CMdS09Kh3ZsLGRPcyp2K4xODdcmNQHJeh8W3uY83ehNcJy0zy0XA/CvFnT
 eRAC
X-Received: by 2002:a05:600c:a42:b0:49e:6683:d23c with SMTP id
 5b1f17b1804b1-49fc5594deemr167296465e9.0.1790027256415; 
 Mon, 21 Sep 2026 14:47:36 -0700 (PDT)
Received: from Provence
 (dynamic-2a02-3100-1c91-bf00-0219-99ff-feb2-2458.310.pool.telefonica.de.
 [2a02:3100:1c91:bf00:219:99ff:feb2:2458])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fda0ce29fsm4986905e9.6.2026.09.21.14.47.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Sep 2026 14:47:35 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Phil Dennis-Jordan <phil@philjordan.eu>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>, Alexander Graf <agraf@csgraf.de>,
 Jason Wang <jasowangio@gmail.com>, qemu-arm@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Gaurav Sharma <gaurav.sharma_7@nxp.com>
Subject: [PATCH 07/42] tests/functional/arm: Add console test for `sabrelite`
 machine
Date: Mon, 21 Sep 2026 23:46:35 +0200
Message-ID: <20260921214710.29422-8-shentey@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921214710.29422-1-shentey@gmail.com>
References: <20260921214710.29422-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:31::11;
 envelope-from=shentey@gmail.com; helo=mail-wm2-x11.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 MAINTAINERS                            |  1 +
 tests/functional/arm/meson.build       |  1 +
 tests/functional/arm/test_sabrelite.py | 46 ++++++++++++++++++++++++++
 3 files changed, 48 insertions(+)
 create mode 100755 tests/functional/arm/test_sabrelite.py

diff --git a/MAINTAINERS b/MAINTAINERS
index 6be9c5725b..7cc9e558f9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1051,6 +1051,7 @@ F: include/hw/usb/imx-usb-phy.h
 F: include/hw/arm/fsl-imx6.h
 F: include/hw/misc/imx6_*.h
 F: include/hw/ssi/imx_spi.h
+F: tests/functional/arm/test_sabrelite.py
 
 SBSA-REF
 M: Peter Maydell <peter.maydell@linaro.org>
diff --git a/tests/functional/arm/meson.build b/tests/functional/arm/meson.build
index 61b00932db..761b371a8d 100644
--- a/tests/functional/arm/meson.build
+++ b/tests/functional/arm/meson.build
@@ -24,6 +24,7 @@ test_arm_timeouts = {
   'quanta_gsj' : 240,
   'raspi2' : 120,
   'replay' : 240,
+  'sabrelite' : 240,
   'tuxrun' : 240,
   'sx1' : 360,
 }
diff --git a/tests/functional/arm/test_sabrelite.py b/tests/functional/arm/test_sabrelite.py
new file mode 100755
index 0000000000..31a0a49eac
--- /dev/null
+++ b/tests/functional/arm/test_sabrelite.py
@@ -0,0 +1,46 @@
+#!/usr/bin/env python3
+#
+# Functional test that boots a Linux kernel and checks the console
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+from qemu_test import LinuxKernelTest, Asset
+
+
+class SabreliteMachine(LinuxKernelTest):
+
+    ASSET_KERNEL = Asset(
+        ('https://ftp.debian.org/debian/dists/bookworm/main/installer-armhf/'
+         '20230607/images/netboot/vmlinuz'),
+        '5851e9c61465a26db810796db671c4729e66e81c365b3ebb1a4b7f772737605b')
+
+    ASSET_INITRD = Asset(
+        ('https://ftp.debian.org/debian/dists/bookworm/main/installer-armhf/'
+         '20230607/images/netboot/initrd.gz'),
+        'fe33f836232a9107716d34dc56d36dea81bab039243a2a42ea6583a50c9b92ca')
+
+    ASSET_DTB = Asset(
+        ('https://ftp.debian.org/debian/dists/bookworm/main/installer-armhf/'
+         '20230607/images/device-tree/imx6q-sabrelite.dtb'),
+        '3ad637c8ea55ebd058a67f686e050b82ccb0d1327bc283623c133c48ad87db44')
+
+    def setUp(self):
+        super().setUp()
+
+        self.kernel_path = self.ASSET_KERNEL.fetch()
+        self.initrd_path = self.ASSET_INITRD.fetch()
+        self.dtb_path = self.ASSET_DTB.fetch()
+
+    def test_console(self):
+        self.require_accelerator("tcg")
+        self.set_machine('sabrelite')
+        self.vm.set_console(console_index=1)
+        self.vm.add_args('-kernel', self.kernel_path,
+                         '-initrd', self.initrd_path,
+                         '-dtb', self.dtb_path)
+
+        self.vm.launch()
+        self.wait_for_console_pattern('Starting system log daemon:')
+
+if __name__ == '__main__':
+    LinuxKernelTest.main()
-- 
2.55.0



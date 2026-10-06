Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E30E9CA5FF1
	for <qemu-arm@archiver.kernel.org>; Wed,  7 Oct 2026 08:37:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xEN0B-0007sk-Gm; Wed, 07 Oct 2026 04:27:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xEHfj-0005sR-PF
 for qemu-arm@nongnu.org; Tue, 06 Oct 2026 22:46:41 -0400
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xEHfU-00038E-4b
 for qemu-arm@nongnu.org; Tue, 06 Oct 2026 22:46:12 -0400
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-5b8f5e2ce5eso1401700e87.0
 for <qemu-arm@nongnu.org>; Tue, 06 Oct 2026 19:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791340950; x=1791945750; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=PgiXUJeOdSQHkFY/lmMpgI1RTVTNH0DvcOAFlKDbgKo=;
 b=Xd+biE3qtqm1H1/9Nii2Y+Qfu2dF0lCY1JcKJQtFWy+p+T7OGCMIANxN4QC1mlv5LF
 d3/Z5+sDCBVwdk/1iGKUxM3D5BwX4ELCkua91UohhlRR6RXJXBJOfCiZV5RGJdgHJi6R
 GspxkHzNwOPxKekN2WOY07w1LvvZJDZjn4TGGcXRR+qCG4L8a8u1cPJTWCT7kvHc/M9l
 eiox0cJKNcXLCYRyVV4sGRo26qbAcyuRMct8OCcZjj8LI4qkIge6JuxEvHVC/VwcGq68
 WRnYNRtOl4IQ5IRemMH/N1a7uieBAYfmItBNbthtSBAbl9AUGFHzWrZ2+7HmWWwjgOxM
 9+Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791340950; x=1791945750;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=PgiXUJeOdSQHkFY/lmMpgI1RTVTNH0DvcOAFlKDbgKo=;
 b=LpSZQu4MWcJQjpfkw6IvSXxohwT8LNO49m7gpmctUAEBcnAihiYnC4fbadZaXubbF6
 yiRTlH7BGMPyFcdQtf+Bhpm5dL1h+CP5eFFegIcqafH7JoB3y/YG0JHOUJvDgudTWSIZ
 79SDoq/R1p8V4IVKeDHBWAEXAblxZBmbeNLvSbg1Rf1vz+1AqKJPqGJmXGC2xX8E578N
 nVr0dnUuIrSFjrzQ6uQEUryeoJMfCrSEStGjIXUmwTQGSMQOhkdfTUAVph+KzHBMGlAd
 U9p2jM5+ktrtH+qN6NCFdrCfWlDIt/c0ikakofCewr5vvhhtAGiAppMW2561ssrRMFRq
 Soqw==
X-Forwarded-Encrypted: i=1;
 AKwUvBy6SP8vSpA+WbW48nHAMb0NWRjTfczTFVkVbeVW7dGczk/sxbPCVpriKyYCg6fcxGJEEYWz6/g2Ww==@nongnu.org
X-Gm-Message-State: AFq9FYKJlsV7+zTi+zO1aI6l0URHFTrQN75Yj8+2ud+I44TCmkceXQHm
 vy8GT6xtwc40DSFvk/HD5J7lC+6W4d4gzRIBeguwK1li7C95j6H7O8gJncsu2Q==
X-Gm-Gg: AYBFou2ybybZyYkO5hsxonVvzOsoXQwQyvQpd/oMXvFmB0D8TOkIHc166ClHhb/XXUv
 jK5PeL7UO6cGP3eZMWjuB/oI8AqbnjF5Uo1x1uZIYpg85uNZBY8ILMz+s/PDlXtGAbp+cYYIvbB
 ktqzkDuh9ddjwSnNZ2iour69yBTITu12yaE3FluPrEu09RKcosTKG2GBj0m30inQiPaUgKGc/mk
 rKHe3R1PmsgeGGI6kwzFuSLtMMl/T5EwKkfW/Ao94sQ7cDJ+6QJJNKBmXBzjY0USWDUrE4OfzRV
 YsiNOnQS0CaA39dgKCuGabdC9SNsySExoZSLXEUteh8Alq34hQ+mWwLcZqN/pSW5Tl0zGoeqOw3
 s/Gm6SBvARj2ANUk80HgS9aDPSgpPNnyWgyFxzT41xImh9xma1imA25EbQ5+vi6jOluvbPdlRwp
 O9xj0fSZbUY4nEhkgvghrxpq4C5Ba+uypf0cV1mMNwhpc9Ru2nrrF1VBHkDRyLKxNiKOaTWVWxp
 drqZsc8sEg/GHooKDf+s3TnoklVPLISXD0o+w==
X-Received: by 2002:a05:6000:4b04:b0:486:f6dc:52c8 with SMTP id
 ffacd0b85a97d-48c6d1981ffmr1217522f8f.37.1791275733120; 
 Tue, 06 Oct 2026 01:35:33 -0700 (PDT)
Received: from archlinux (pd95eda80.dip0.t-ipconnect.de. [217.94.218.128])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c6cdb281csm1566764f8f.55.2026.10.06.01.35.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2026 01:35:32 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Bin Meng <bin.meng@processmission.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Gaurav Sharma <gaurav.sharma_7@nxp.com>,
 Bernhard Beschow <shentey@gmail.com>, qemu-arm@nongnu.org,
 Jason Wang <jasowangio@gmail.com>,
 Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v4 11/31] tests/functional/arm: Add console test for
 `mcimx7d-sabre` machine
Date: Tue,  6 Oct 2026 10:34:23 +0200
Message-ID: <20261006083445.30362-12-shentey@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261006083445.30362-1-shentey@gmail.com>
References: <20261006083445.30362-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=shentey@gmail.com; helo=mail-lf1-x135.google.com
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

The test currently exercises the Linux kernel and waits for the first
daemons to be started. At this point, basic hardware is initialized and
if the log message is reached, no driver ended up in an endless loop,
thus the system should be usable.

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Bin Meng <bin.meng@processmission.com>
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 MAINTAINERS                                |  1 +
 tests/functional/arm/meson.build           |  2 +
 tests/functional/arm/test_mcimx7d_sabre.py | 46 ++++++++++++++++++++++
 3 files changed, 49 insertions(+)
 create mode 100755 tests/functional/arm/test_mcimx7d_sabre.py

diff --git a/MAINTAINERS b/MAINTAINERS
index f31245716a..a605d65d94 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -935,6 +935,7 @@ F: include/hw/misc/imx7_*.h
 F: hw/pci-host/designware.c
 F: include/hw/pci-host/designware.h
 F: docs/system/arm/mcimx7d-sabre.rst
+F: tests/functional/arm/test_mcimx7d_sabre.py
 
 MCIMX8MM-EVK / iMX8MM
 M: Gaurav Sharma <gaurav.sharma_7@nxp.com>
diff --git a/tests/functional/arm/meson.build b/tests/functional/arm/meson.build
index 989b841555..e657ecd278 100644
--- a/tests/functional/arm/meson.build
+++ b/tests/functional/arm/meson.build
@@ -20,6 +20,7 @@ test_arm_timeouts = {
   'bpim2u' : 500,
   'collie' : 180,
   'cubieboard' : 360,
+  'mcimx7d_sabre' : 240,
   'orangepi' : 540,
   'quanta_gsj' : 240,
   'raspi2' : 120,
@@ -60,6 +61,7 @@ tests_arm_system_thorough = [
   'emcraft_sf2',
   'integratorcp',
   'max78000fthr',
+  'mcimx7d_sabre',
   'microbit',
   'orangepi',
   'quanta_gsj',
diff --git a/tests/functional/arm/test_mcimx7d_sabre.py b/tests/functional/arm/test_mcimx7d_sabre.py
new file mode 100755
index 0000000000..2894b5201f
--- /dev/null
+++ b/tests/functional/arm/test_mcimx7d_sabre.py
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
+class Mcimx7dSabreMachine(LinuxKernelTest):
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
+         '20230607/images/device-tree/imx7d-sdb.dtb'),
+        'eed45fe3ba682cc814217bc4558551d36c034ec7a7692c4eb6eaf86132baf80c')
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
+        self.set_machine('mcimx7d-sabre')
+        self.vm.set_console(console_index=0)
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
2.56.0



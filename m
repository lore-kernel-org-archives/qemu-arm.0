Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B67B2CA6007
	for <qemu-arm@archiver.kernel.org>; Wed,  7 Oct 2026 09:15:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xENUa-0007gr-1D; Wed, 07 Oct 2026 04:59:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xEKs5-0003CC-BS
 for qemu-arm@nongnu.org; Wed, 07 Oct 2026 02:11:59 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xEKrk-00029U-DN
 for qemu-arm@nongnu.org; Wed, 07 Oct 2026 02:11:04 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-6acb57c2b88so5111585a12.2
 for <qemu-arm@nongnu.org>; Tue, 06 Oct 2026 23:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791353457; x=1791958257; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=nGNaHiuVZw/GFpL6l92yCqZ5RO3VTuRx3fxc/U2AHTU=;
 b=Llf116o3bYHKT7ePdo/nLnBRw7EzzRAwkXh9j3PtqKfxDiSzGDFuzLi1AXsTG/1o2S
 YWwlV/pr8lWdiPXdtWePWQ3mvNRZRL1OhDRyZRO66efe9l2sLBj0UleuckQNbVHqsA+y
 VyhwC3mVwSDDRjejcFn1/2ijjfKL6BUE41NFIb1mIdwvmhpW93sauzoTEK8GZ4+833ps
 sWIAw2N7Cob8Yc0+7tLxXIsHs10zLUVImpetUV1kWHjevFSHizBBo4BA17wdN7Xo+CFU
 ve8DuxwQB71XUT9eQ8aeuElwx84bS88wj2tAgpv+51NbeA/9MfOEaZfXhUaFSCBm7icy
 BGLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791353457; x=1791958257;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=nGNaHiuVZw/GFpL6l92yCqZ5RO3VTuRx3fxc/U2AHTU=;
 b=RTyyOlOowxf17Tl9mdoOSiEBfLcvDpzOg68BjrxWHGXMmb0+DhiMuio18PHxDxxTYY
 Jxirnp8E3r0LVHqasIsF3iqleon/2SBUyouGfQNrOYE8NItkFH+GH0DCZEP6CcgUmLEJ
 bADvYhC5jfMRSsEL6a3k1iCrLHDpvTS5vx8qDb2iDzNav23AOPD4bRDGKTfcOUNWzmYf
 jfJmdDfPy2tq+tA5ByxuqHCSLxv0ghi6C4SpN+qq/6MvUPmt18p2pdvXWf8h5+sq1WTF
 4zdpgel5RN2jX4U/yHc+M8ChlCdqCjQhvc/YB5iaVdC2nZ91qjEoUkRcyeYesoaJZfqy
 9Ciw==
X-Forwarded-Encrypted: i=1;
 AKwUvBzzyRrVWOMiEIpMYuJvNZ1QOlGZ85TVdkxmbTLYXijJ3rP7kDjyYFqLedYVkj1uS4nikZcyrhZK0g==@nongnu.org
X-Gm-Message-State: AFq9FYI566+GNZHhsn5UF+rmIkIX/9tbeOSvMBb71fZzvVz0G8BW+LNd
 TYcJaQ0idqILVXh6nnuSzju6Ne+XSCmeaowZBXcD/bm5N+UB15hTu5OKR0mdKg==
X-Gm-Gg: AYBFou38JERD9ZH2X6gbUQnayxyyh+ahSI5QG2ucPphAuimjJKcyBuwVTuFZu4KLoIn
 0afa9Sq/aiDOHWqdDHdj9JAfWV7UpVBRz1gkGR51VkLSSPDV1acbB5AW9WyrtLyAfulmg6Ex1+J
 a1bKoXDarYat+7PXqu9ENdZYrnbC7W/3tBU6a/xY+8mM+pww1ecLvF9D1Iub9UG2LZEJq32HoNU
 NrOkg2j1/JT+oBGXNbEL3x9ThMjhBLHf2ppkwu9cgWVTaqRGhN+cJmWHZq3otCFuIz+DrGMnGYN
 Z2LCFLt0pRrgEwiKQhLfvcu0OhiTsJ63upvMNhP0/wfFDVQ7yFapYdKE/ZWtorSz2NMpi89d4++
 G1DIlptxgJGXlZk1mTA6qfmRycOuJSHEUbV48Q/ui2DWnO/L/t9phZ0gTdq9dxmhVCdn2E5fKHM
 O+x/OK2LnEq71v0wue07jQSa+lM/gX/SoITTkH0VpMkNzTSCd3ikkgi1mxzTCs/INzAtAlQq3gg
 kstuptXfYhQGczwjOdyl1V3oCJx99QubkKSZg==
X-Received: by 2002:a05:600c:4fcb:b0:4a1:7703:b0e with SMTP id
 5b1f17b1804b1-4a1788ec7c0mr32481015e9.34.1791275729496; 
 Tue, 06 Oct 2026 01:35:29 -0700 (PDT)
Received: from archlinux (pd95eda80.dip0.t-ipconnect.de. [217.94.218.128])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c6cdb281csm1566764f8f.55.2026.10.06.01.35.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2026 01:35:28 -0700 (PDT)
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
Subject: [PATCH v4 08/31] tests/functional/arm: Add console test for
 `sabrelite` machine
Date: Tue,  6 Oct 2026 10:34:20 +0200
Message-ID: <20261006083445.30362-9-shentey@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261006083445.30362-1-shentey@gmail.com>
References: <20261006083445.30362-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x535.google.com
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

The test currently exercises the Linux kernel and waits for the first
daemons to be started. At this point, basic hardware is initialized and
if the log message is reached, no driver ended up in an endless loop,
thus the system should be usable.

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Bin Meng <bin.meng@processmission.com>
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 MAINTAINERS                            |  1 +
 tests/functional/arm/meson.build       |  2 ++
 tests/functional/arm/test_sabrelite.py | 46 ++++++++++++++++++++++++++
 3 files changed, 49 insertions(+)
 create mode 100755 tests/functional/arm/test_sabrelite.py

diff --git a/MAINTAINERS b/MAINTAINERS
index 1312bbd1bd..f31245716a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1054,6 +1054,7 @@ F: include/hw/usb/imx-usb-phy.h
 F: include/hw/arm/fsl-imx6.h
 F: include/hw/misc/imx6_*.h
 F: include/hw/ssi/imx_spi.h
+F: tests/functional/arm/test_sabrelite.py
 
 SBSA-REF
 M: Peter Maydell <peter.maydell@linaro.org>
diff --git a/tests/functional/arm/meson.build b/tests/functional/arm/meson.build
index 61b00932db..989b841555 100644
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
@@ -65,6 +66,7 @@ tests_arm_system_thorough = [
   'raspi2',
   'realview',
   'replay',
+  'sabrelite',
   'smdkc210',
   'stellaris',
   'sx1',
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
2.56.0



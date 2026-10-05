Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2749CA5FFD
	for <qemu-arm@archiver.kernel.org>; Mon,  5 Oct 2026 10:21:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xDfp1-0004db-4H; Mon, 05 Oct 2026 06:21:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xDfmL-0002HK-Rq
 for qemu-arm@nongnu.org; Mon, 05 Oct 2026 06:18:45 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xDfmJ-0000xA-NT
 for qemu-arm@nongnu.org; Mon, 05 Oct 2026 06:18:41 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-48b0d19cf7eso565652f8f.1
 for <qemu-arm@nongnu.org>; Mon, 05 Oct 2026 03:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791195518; x=1791800318; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=pOxduKRCTuytQO5PRMLsrv51EvLlQX2lLk9OuLBZpag=;
 b=K5gA4kWEChze9H2VWgPBuxzjI01h6Kju2mO9o5reoTTiinP1sSmagaovyLD5cJNnhM
 mG5uENVKIRlwoqpC6juGypC3MO/dmmB8cSbsb2IZy8L8nDBaHZBmMx9GoFjvR/j9+pb0
 SLROUHAGuvm4z5EBdR5L5yr69QuvsusfGEWwxXxIzL2EIk4g64DIMtOLXo9MjbvreVZ1
 Vhcc5AlVX8h7gldciRMS2RdnNSdccYGgrkPX+e5fmx3fKPSexWKHvftwnDgx7RgAq4Fp
 tbXzHV/QAtcXMGbrdQxk0/1ntz5zl1XBUzP9a3My9m9rQMoETNcph4+JrzTLv/lCEsFn
 TCMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791195518; x=1791800318;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=pOxduKRCTuytQO5PRMLsrv51EvLlQX2lLk9OuLBZpag=;
 b=aH3HyLe0x3S77KIkPTnMFJmvIZ9jp29ioMO8QZPOyQBPRQXiUT66Sm+6e1RyE/cSl0
 F8AYR6W5wFfBqyd8nZ61fPqj9u6Ia5eEyWOWIq28EhYcaLJFS4ooNgNV9jIiwnm/lvYd
 JLlW3gsDuKjSNEVojYC5E4wzsK2Sc/XjIa4FADMLpuyqKUg7EitumqecI6fi4Gd4SinE
 HvOiARlzu3/ChnIlL5HkY/gKlsCHfw6Nl7B2I4t1nIZT5yYUVm/W89ZTqmZPWiMzuJcE
 AuCxnGSU5jlMOVLEnAHkTr1ZVFaTO90S/bpYmgwG3HvCfLOASQ/mHds8DCAwm97RgSTB
 115w==
X-Forwarded-Encrypted: i=1;
 AKwUvBx47NTr81VbcAjT5inTHKrUudxlPZD5mG3dtpdt4jwRrG1YmCS8D1RIZsLLQ202payxmOqB+Ad5YA==@nongnu.org
X-Gm-Message-State: AFq9FYL1vr+Q68xSglQwwfrAawidgq/viN7sjG37WWWUrMC0ysReioVR
 Z9wi6LMUC7xMwHUivLXKJqTL3KgBoguIQolxLWCFqBbeqkFAAEVkvgeR
X-Gm-Gg: AYBFou1g6g75z61NnLffJHneTN3d57ZDBxDLC3+YweC4oZ9uFSvl5IzmDZRiuCHZVje
 zYRXhDtPv66k3cN2dPLvZJmDnbSLGAk1zBg6nA/D5oXObSXGI/2gd+RcrI28Ed8ml2LQ0rFdVYd
 +EU/SR+vyI0Qmu9AJY8oNvmIpe2sgr77pbjOfPs03YX9dZK74KHkoJE5KK8mXbGHeaSe11Y5VaR
 B9/WZEQIW4lZfixxC0T7RVszDTJncHgf3i5xfyHDvs+118tH08AWQIcCJ7fwydR1MPllRLAuPvb
 WBYORgb003udEDlcjw4ZVreYMZAyu/64ps1VZar7zh9P250/RjfMGVUOAGIf5DTNzePAgRIQypB
 wM1QKlg22nDNsy1YpbkF9wIwEal5wazWpLGs8en2Xutqp/ATnH4CpZ4ZTYvqwLjKOP/0ljO9rRs
 B7gJJfm5wpAUcTz+2pOf053o7FiDt62M8o5q231j6eNhvlFK4koc0DdtJcox9/a6m8WYePwkxUf
 UyF2PSH3Lykwxkfek5z+Vkav3fiU/8R5Z2oGA==
X-Received: by 2002:a5d:4609:0:b0:48a:fff3:f9c1 with SMTP id
 ffacd0b85a97d-48b067c2795mr16655720f8f.20.1791195518082; 
 Mon, 05 Oct 2026 03:18:38 -0700 (PDT)
Received: from archlinux (pd95eda80.dip0.t-ipconnect.de. [217.94.218.128])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c622ab7b5sm2742111f8f.37.2026.10.05.03.18.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2026 03:18:37 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Gaurav Sharma <gaurav.sharma_7@nxp.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowangio@gmail.com>,
 qemu-arm@nongnu.org, Bin Meng <bin.meng@processmission.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH v3 11/31] tests/functional/arm: Add console test for
 `mcimx7d-sabre` machine
Date: Mon,  5 Oct 2026 12:17:38 +0200
Message-ID: <20261005101800.10821-12-shentey@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261005101800.10821-1-shentey@gmail.com>
References: <20261005101800.10821-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FORGED_GMAIL_RCVD=1,
 FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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



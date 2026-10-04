Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F241CA5FF0
	for <qemu-arm@archiver.kernel.org>; Sun,  4 Oct 2026 12:28:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xDLJp-0006W2-Pp; Sun, 04 Oct 2026 08:27:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xDLJn-0006VD-La
 for qemu-arm@nongnu.org; Sun, 04 Oct 2026 08:27:51 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xDLJl-00078m-Kq
 for qemu-arm@nongnu.org; Sun, 04 Oct 2026 08:27:51 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4a140e7405dso10944515e9.3
 for <qemu-arm@nongnu.org>; Sun, 04 Oct 2026 05:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791116868; x=1791721668; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=amRrNh5PbVumHngmMVBuQf7YfEYZFRAkrjQn+eqfJ8s=;
 b=Ka40VQyAnvQP756j5lGqsIwruTKObblHPLPH8tsR+WqSSg4dtzV9wtfymYtnOu//5d
 BvPjjA1W4x5cQib73tCmUrOyh1U3edyO8YQNsqvyWCLZ0kFPfSq/wJNTTEvxBhbl7wmE
 3Ow8a0M8eZ7iBOIPrmm1+P2BYN7b4dkSG3M1zq7Ulbq7zZz1/QE5isHqEk2L3mEAfCPK
 MayJWXy+Ch5azgvW9ApJtlwASomXOigY0OsM6qhUh53RFTQVn4LwH9hMFLnNwDRuJxJS
 OD6Z+4XDjC2/bZwYLyCTWCkpXGDWu/6y6PI9S6khtgx30I0fTtK8MBtVfIzJfLp1fkXa
 t9iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791116868; x=1791721668;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=amRrNh5PbVumHngmMVBuQf7YfEYZFRAkrjQn+eqfJ8s=;
 b=VO5SAaFGGopxLOzJfzYptdH5clV4WQR3mgLeFgFJH+lo4uonheCUNWe1YRJQVt2Ji/
 1b3Lg/yvDCOngbJxDbSKglMbnFZBouRcv2ZZarOUeiLe05PwVxrBhw9O2en7yBNq/uo9
 4yqR7/wBIAZGHXflx84z4wqCDUmlqCkTNEhzM0PsQg8SEp4g4/stjjOJtl5YTSJzIFWp
 Vi2QMbQxsreJGlFH5mh2+cc2npF5TATNp56yH91SfmNOTE5jtuD+/5rr/+Ip6NCcBrhB
 dR5mzcQZWSocAZnVy996nzBAbJ49ZiUkfkc5sJHK7NTMOmJhl/xHANrDc5n1QOUKMv4S
 Ossg==
X-Forwarded-Encrypted: i=1;
 AKwUvBw/1yx8jzRbLhxUBaK/08G8vfS/s41sPAYUGfnMLMio7ggSWz5y912D4CwY5Xsu8iN0pFd0T+q2QQ==@nongnu.org
X-Gm-Message-State: AFuF++nMpWCFm+WNWgdDcQDMuFCEebVxQFYRcxS8vS8GcT0E/Cy+sD8/
 h6zLQIUT0fSPIej0zkVEvXDjIhnOA1Y3KgWVgAM3SlTPkYEcqQP4mtKg
X-Gm-Gg: AYBFou3hmEqdaEwSj6MUAleN1NU3jBgFASLIECvQGUOSfNSEIhMHZCrYNPoSXmC15XA
 k2JbDALNL8l/B0UaOYc4HS0G6tL36nQTlaJ8PUDJJtlm1gnV5uxmN6bQODkC8YCSZZ9KyzMcz9N
 5VK4tqU7QqRkhrvBxNXwNUxD60ydldVL4A9vxsoTPqfi+kjGuxVJzcgZXSblprbjpJnv1ndtnTy
 ZPzhn+lLNE+pjv0RJjfckY0gY6azQmnLfPSvmWHy62KaqVqnEIARj80xLKPeJ9zAfcmZ0UMI4do
 qxrz8TwAFLgjWJf2vdpL8e+krA9C0dvk7APvi2hJnpITKy9rOMJ6l9VeiIjBjztwl7YpxGXEt1r
 B0DYMVgfNcxdiipfmpjSWXNnp0mVm2vY8Fm3cW8l19iUvMZ5z56+M6FtN/mXMbrok5Xhbz1w1FR
 AFQnVX2zgd48Ofd0QQaDOppOhpQb66OqnTuM5khvXsIMavQGUEU3/37XJ4TKR3MQQkkIJCRPM6a
 iaH5yjqUbT3O7LDkrojZUWKFNCnJNN5fl92yw==
X-Received: by 2002:a05:600c:474a:b0:49f:c1a1:5222 with SMTP id
 5b1f17b1804b1-4a171aed742mr3668075e9.33.1791116868015; 
 Sun, 04 Oct 2026 05:27:48 -0700 (PDT)
Received: from archlinux (pd95eda80.dip0.t-ipconnect.de. [217.94.218.128])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a027698f13sm242319975e9.1.2026.10.04.05.27.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Oct 2026 05:27:47 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Gaurav Sharma <gaurav.sharma_7@nxp.com>,
 Alistair Francis <alistair@alistair23.me>,
 Bernhard Beschow <shentey@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Jason Wang <jasowangio@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Bin Meng <bin.meng@processmission.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH v2 10/30] tests/functional/arm: Add console test for
 `mcimx7d-sabre` machine
Date: Sun,  4 Oct 2026 14:26:26 +0200
Message-ID: <20261004122647.3913-11-shentey@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261004122647.3913-1-shentey@gmail.com>
References: <20261004122647.3913-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x329.google.com
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

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 MAINTAINERS                                |  1 +
 tests/functional/arm/meson.build           |  1 +
 tests/functional/arm/test_mcimx7d_sabre.py | 46 ++++++++++++++++++++++
 3 files changed, 48 insertions(+)
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
index 761b371a8d..e49a04ea6a 100644
--- a/tests/functional/arm/meson.build
+++ b/tests/functional/arm/meson.build
@@ -20,6 +20,7 @@ test_arm_timeouts = {
   'bpim2u' : 500,
   'collie' : 180,
   'cubieboard' : 360,
+  'mcimx7d-sabre' : 240,
   'orangepi' : 540,
   'quanta_gsj' : 240,
   'raspi2' : 120,
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



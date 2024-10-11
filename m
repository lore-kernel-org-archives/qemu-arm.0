Received: by 2002:a17:505:3501:b0:1be9:327d:8ee3 with SMTP id mc1csp392467njb;
        Fri, 11 Oct 2024 06:20:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUlq9Lsp87uj2EWGkW5uwKsvog/6oPrkkL5gkNmYeoANdIaF/3x+Li8qWWMwBBRd7Je1NW8p/lXV0bDsw==@linaro.org
X-Google-Smtp-Source: AGHT+IHTasTeH1krQv1NlbYUHOzHlP72RG7liLrdt/3xa5eXRgIh3FQLkeGZsWuxdoodbt8QjesI
X-Received: by 2002:a05:6122:1d4d:b0:50d:2769:d744 with SMTP id 71dfb90a1353d-50d2769d944mr1813196e0c.11.1728652814977;
        Fri, 11 Oct 2024 06:20:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728652814; cv=none;
        d=google.com; s=arc-20240605;
        b=i3LnH2QcUtngaJ2JxkCnx1Xfjs0LRSAn30zIHamLaoomTj3VwdsI72xoZxRwjDAEyp
         AE26l0Sxn+Rf16IzOfJC80D3N7gs6oVDrpm6BexWjSmwhqC/QI/AEOlU/h5hlc03Pzt8
         NjCzdgvS4dmw6v5MqQgLRDCDq3MH96lYDvC3uSGLA/N94x/8o9fWRVG0pZK/vXeg67fV
         G+5TKBgLt+oL+IrTvDs5+MNdw02CxUyvGkt13TNwI7yPB4JKfW4l269Xag4Ne1mxkiBM
         46mZLByEhzRyzvGbKIVj+4JYmSTpZsVvqIRY1VuMoVzrjsid772mBXLS3J7frYa+j8yj
         qUPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=OfD2T2DNljJ4PR1x+jFli4y7dytYo55E8P6pXj2fAdg=;
        fh=yV7XiH9Iqz9ECmsY7O4iL5H1OqntXAXD46ZP2pth0HE=;
        b=JsPuWZcT2xIGbwUeWuMwohtECQQqttfhCy22h2QguS9sl/cI5Hq/EDCJgG9o2hMpct
         pgBao5JIC6EOftB9YJFBYEZ5nOQts4kpiOSOJWncbbjYm4pIdvUxhP5sG4SfpnvYVuPk
         wK4UeLojX/8r3S1s4ROy8ozLpiaaamJiR7pkZlLDqyIU/oPN1eSHHJk/P6qYESJrHUAL
         GFhE1X24XgPTqn7e0DpuqftFYG+NarxY50ax3YspQGtKhfCk1k30y7m6I5uLkCRmaDV8
         p+WMmnGyNiFfbJy1Pf9OjSOl8ePJs9pdLJBM/8/pZ/W5VOvc3Hc2r0KpLf1xrVz6I0/O
         beBQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="H/JjLKQP";
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 71dfb90a1353d-50d0887002dsi787446e0c.231.2024.10.11.06.20.14
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 06:20:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="H/JjLKQP";
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728652814;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OfD2T2DNljJ4PR1x+jFli4y7dytYo55E8P6pXj2fAdg=;
	b=H/JjLKQP7Ah2xb3kERB4tJZc+GvfUBVeC/c2ePBhW+fWFSujxea4YbcwikE71dAgTWPNc4
	jIsFoKB8qZmUnz3iljAi5r4WD4azJzm/WvdOrhIzOB8Tlr8YkFv1wwb3NGGfoTsJWRZRRc
	hANWWcQhELTHebqBOEFtjKNJt2J8n+8=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-611-wuLlgpvaMmikJYqAbfnQMg-1; Fri,
 11 Oct 2024 09:20:11 -0400
X-MC-Unique: wuLlgpvaMmikJYqAbfnQMg-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 207981955F3D;
	Fri, 11 Oct 2024 13:20:10 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.39.193.77])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4E9001956052;
	Fri, 11 Oct 2024 13:20:07 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Magnus Damm <magnus.damm@gmail.com>,
	qemu-arm@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Subject: [PATCH 03/17] tests/functional: Convert the Avocado aarch64 tuxrun tests
Date: Fri, 11 Oct 2024 15:19:20 +0200
Message-ID: <20241011131937.377223-4-thuth@redhat.com>
In-Reply-To: <20241011131937.377223-1-thuth@redhat.com>
References: <20241011131937.377223-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-TUID: 2Iz0u/UaEM7A

Move the tests to a new file so that they can be run via
qemu-system-aarch64 in the functional framework.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS                             |  1 +
 tests/avocado/tuxrun_baselines.py       | 31 ---------------
 tests/functional/meson.build            |  2 +
 tests/functional/test_aarch64_tuxrun.py | 50 +++++++++++++++++++++++++
 4 files changed, 53 insertions(+), 31 deletions(-)
 create mode 100755 tests/functional/test_aarch64_tuxrun.py

diff --git a/MAINTAINERS b/MAINTAINERS
index d7a11fe601..ab9da679f5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -987,6 +987,7 @@ F: hw/arm/virt*
 F: include/hw/arm/virt.h
 F: docs/system/arm/virt.rst
 F: tests/functional/test_aarch64_virt.py
+F: tests/functional/test_aarch64_tuxrun.py
 
 Xilinx Zynq
 M: Edgar E. Iglesias <edgar.iglesias@gmail.com>
diff --git a/tests/avocado/tuxrun_baselines.py b/tests/avocado/tuxrun_baselines.py
index 56c8bdb2dc..dffa4f6339 100644
--- a/tests/avocado/tuxrun_baselines.py
+++ b/tests/avocado/tuxrun_baselines.py
@@ -192,37 +192,6 @@ def common_tuxrun(self,
     #        --kernel https://storage.tuxboot.com/{TUXBOOT}/{IMAGE}
     #
 
-    def test_arm64(self):
-        """
-        :avocado: tags=arch:aarch64
-        :avocado: tags=cpu:cortex-a57
-        :avocado: tags=machine:virt
-        :avocado: tags=tuxboot:arm64
-        :avocado: tags=console:ttyAMA0
-        :avocado: tags=shutdown:nowait
-        """
-        sums = {"Image" :
-                "ce95a7101a5fecebe0fe630deee6bd97b32ba41bc8754090e9ad8961ea8674c7",
-                "rootfs.ext4.zst" :
-                "bbd5ed4b9c7d3f4ca19ba71a323a843c6b585e880115df3b7765769dbd9dd061"}
-        self.common_tuxrun(csums=sums)
-
-    def test_arm64be(self):
-        """
-        :avocado: tags=arch:aarch64
-        :avocado: tags=cpu:cortex-a57
-        :avocado: tags=endian:big
-        :avocado: tags=machine:virt
-        :avocado: tags=tuxboot:arm64be
-        :avocado: tags=console:ttyAMA0
-        :avocado: tags=shutdown:nowait
-        """
-        sums = { "Image" :
-                 "e0df4425eb2cd9ea9a283e808037f805641c65d8fcecc8f6407d8f4f339561b4",
-                 "rootfs.ext4.zst" :
-                 "e6ffd8813c8a335bc15728f2835f90539c84be7f8f5f691a8b01451b47fb4bd7"}
-        self.common_tuxrun(csums=sums)
-
     def test_armv5(self):
         """
         :avocado: tags=arch:arm
diff --git a/tests/functional/meson.build b/tests/functional/meson.build
index c90c02517a..222bfbcc62 100644
--- a/tests/functional/meson.build
+++ b/tests/functional/meson.build
@@ -13,6 +13,7 @@ endif
 test_timeouts = {
   'aarch64_raspi4' : 120,
   'aarch64_sbsaref' : 600,
+  'aarch64_tuxrun' : 120,
   'aarch64_virt' : 360,
   'acpi_bits' : 240,
   'arm_raspi2' : 120,
@@ -41,6 +42,7 @@ tests_aarch64_system_thorough = [
   'aarch64_raspi3',
   'aarch64_raspi4',
   'aarch64_sbsaref',
+  'aarch64_tuxrun',
   'aarch64_virt',
   'multiprocess',
 ]
diff --git a/tests/functional/test_aarch64_tuxrun.py b/tests/functional/test_aarch64_tuxrun.py
new file mode 100755
index 0000000000..da56aee4ed
--- /dev/null
+++ b/tests/functional/test_aarch64_tuxrun.py
@@ -0,0 +1,50 @@
+#!/usr/bin/env python3
+#
+# Functional test that boots known good tuxboot images the same way
+# that tuxrun (www.tuxrun.org) does. This tool is used by things like
+# the LKFT project to run regression tests on kernels.
+#
+# Copyright (c) 2023 Linaro Ltd.
+#
+# Author:
+#  Alex Bennée <alex.bennee@linaro.org>
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+from qemu_test import Asset
+from qemu_test.tuxruntest import TuxRunBaselineTest
+
+class TuxRunAarch64Test(TuxRunBaselineTest):
+
+    ASSET_ARM64_KERNEL = Asset(
+        'https://storage.tuxboot.com/20230331/arm64/Image',
+        'ce95a7101a5fecebe0fe630deee6bd97b32ba41bc8754090e9ad8961ea8674c7')
+    ASSET_ARM64_ROOTFS = Asset(
+        'https://storage.tuxboot.com/20230331/arm64/rootfs.ext4.zst',
+        'bbd5ed4b9c7d3f4ca19ba71a323a843c6b585e880115df3b7765769dbd9dd061')
+
+    def test_arm64(self):
+        self.set_machine('virt')
+        self.cpu='cortex-a57'
+        self.console='ttyAMA0'
+        self.wait_for_shutdown=False
+        self.common_tuxrun(kernel_asset=self.ASSET_ARM64_KERNEL,
+                           rootfs_asset=self.ASSET_ARM64_ROOTFS)
+
+    ASSET_ARM64BE_KERNEL = Asset(
+        'https://storage.tuxboot.com/20230331/arm64be/Image',
+        'e0df4425eb2cd9ea9a283e808037f805641c65d8fcecc8f6407d8f4f339561b4')
+    ASSET_ARM64BE_ROOTFS = Asset(
+        'https://storage.tuxboot.com/20230331/arm64be/rootfs.ext4.zst',
+        'e6ffd8813c8a335bc15728f2835f90539c84be7f8f5f691a8b01451b47fb4bd7')
+
+    def test_arm64be(self):
+        self.set_machine('virt')
+        self.cpu='cortex-a57'
+        self.console='ttyAMA0'
+        self.wait_for_shutdown=False
+        self.common_tuxrun(kernel_asset=self.ASSET_ARM64BE_KERNEL,
+                           rootfs_asset=self.ASSET_ARM64BE_ROOTFS)
+
+if __name__ == '__main__':
+    TuxRunBaselineTest.main()
-- 
2.46.1

Received: by 2002:a17:505:3501:b0:1be9:327d:8ee3 with SMTP id mc1csp392659njb;
        Fri, 11 Oct 2024 06:20:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWVja8xYvoCOgPnJhAMBdH//v4JU7tyCPaXUDi2gGnqFRT7dV2R397KvUinyeML6lq0BS9eGszqgF1DcQ==@linaro.org
X-Google-Smtp-Source: AGHT+IESn9kHvsh0ge3ReX3fRH+/xk8bcltu/s4AhVUD9gcmQszaHcnWSzrrnHVRNBoGQgRlI7Wq
X-Received: by 2002:a05:622a:4c05:b0:458:3867:c13c with SMTP id d75a77b69052e-4604bbb9041mr42329501cf.19.1728652831257;
        Fri, 11 Oct 2024 06:20:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728652831; cv=none;
        d=google.com; s=arc-20240605;
        b=E4GNGHfqlA84/ZBS1N7kreDyDg60yt9lfx6aRFmOzi70Weo/hvCQHgniosi7JmTlli
         CS8tKmCb3PrUWfozEfL52Pu9YtQ1063sjwiZ5YxMmKNxdCo9wQmQuiHmD7g7wzBECIry
         wqdnypxpsTx8TCZsZswTekmL2q9TNZ9GgbM8Xo/59f1rlc7NUhx7a/oWRhoJ0EoCIImE
         BOyfBUJ2KGXSP2TlRvAzqEQOiiOQESy+nntvqfjwL/4LCy4NRqj6lj/dG8jHic9PbHha
         tX6RkPsmEWwZBCgrOOKoVSl0V55FnBjbY3qaXUQ8ekqghOlhKuaKytkm5HqfmM+rX3Z3
         o5kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=EHbqDTEsNRTfcCQbI+P8NJ4FgxUkiptVbty+xZVvFvc=;
        fh=yV7XiH9Iqz9ECmsY7O4iL5H1OqntXAXD46ZP2pth0HE=;
        b=ggaiGgf2NprCdWfD+GtZbZMiG228Rjk3TbqRdnHpqXIl0dqQbWF8/IYwJ+KKCrTZUC
         S18vzuHc2O05qDXipDZRadWUywNfB/siny+Y9RKmEGQVup1Sach9ScTc8wyrMoVkvfXT
         lEkRO9a36yv2fBu42fz+LMoAoukyDWUgBkyZ1T9UZDQmxt4A23NnmhJIbouRuL/u9BOL
         CngkyH14NvjuJio7uhlMS7f4wtkzwWpHKQ9gk2Z9/JB0Gji3uWeMkGevXsRsSV7tLHf8
         OBtEpcdkIrLXl0I9dkLrT/30yc9ZVu7mgO0Zo4iQAX+sECAtNPZhtyE/RXaQPJmsExrn
         mzzA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MmTtUSoY;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4604289a975si37454601cf.418.2024.10.11.06.20.31
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 06:20:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MmTtUSoY;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728652830;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EHbqDTEsNRTfcCQbI+P8NJ4FgxUkiptVbty+xZVvFvc=;
	b=MmTtUSoYeo1KB73KT7uHSyIYcob19s+U2QfiQRiEybI8yXk6/y6WS2RC+Iw6T3W57II38D
	im1kJVrzlNZ/OHcsgC4K7pT/5FxhVnWwRHqxR6ofhDf9RU6dCpdr84xTaSM4U7sZF+wSJ5
	lnoOQm3EA94CyfW4Tdu8nDBoIvUkB0A=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-177-UDBiOQVnO3CSkYz1LUB_Jw-1; Fri,
 11 Oct 2024 09:20:29 -0400
X-MC-Unique: UDBiOQVnO3CSkYz1LUB_Jw-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7D20D1955F3C;
	Fri, 11 Oct 2024 13:20:28 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.39.193.77])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 841891955E7D;
	Fri, 11 Oct 2024 13:20:24 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Magnus Damm <magnus.damm@gmail.com>,
	qemu-arm@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Subject: [PATCH 08/17] tests/functional: Convert the Avocado riscv64 tuxrun tests
Date: Fri, 11 Oct 2024 15:19:25 +0200
Message-ID: <20241011131937.377223-9-thuth@redhat.com>
In-Reply-To: <20241011131937.377223-1-thuth@redhat.com>
References: <20241011131937.377223-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-TUID: /8r8WyV0fJbv

Move the tests to a new file so that they can be run via
qemu-system-riscv64 in the functional framework.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/avocado/tuxrun_baselines.py       | 31 --------------------
 tests/functional/meson.build            |  4 +++
 tests/functional/test_riscv64_tuxrun.py | 38 +++++++++++++++++++++++++
 3 files changed, 42 insertions(+), 31 deletions(-)
 create mode 100755 tests/functional/test_riscv64_tuxrun.py

diff --git a/tests/avocado/tuxrun_baselines.py b/tests/avocado/tuxrun_baselines.py
index e84fb9c3b9..dcb6589f2f 100644
--- a/tests/avocado/tuxrun_baselines.py
+++ b/tests/avocado/tuxrun_baselines.py
@@ -292,37 +292,6 @@ def test_ppc32(self):
 
         self.common_tuxrun(csums=sums, drive="virtio-blk-pci")
 
-    def test_riscv64(self):
-        """
-        :avocado: tags=arch:riscv64
-        :avocado: tags=machine:virt
-        :avocado: tags=tuxboot:riscv64
-        """
-        sums = { "Image" :
-                 "cd634badc65e52fb63465ec99e309c0de0369f0841b7d9486f9729e119bac25e",
-                 "fw_jump.elf" :
-                 "6e3373abcab4305fe151b564a4c71110d833c21f2c0a1753b7935459e36aedcf",
-                 "rootfs.ext4.zst" :
-                 "b18e3a3bdf27be03da0b285e84cb71bf09eca071c3a087b42884b6982ed679eb" }
-
-        self.common_tuxrun(csums=sums)
-
-    def test_riscv64_maxcpu(self):
-        """
-        :avocado: tags=arch:riscv64
-        :avocado: tags=machine:virt
-        :avocado: tags=cpu:max
-        :avocado: tags=tuxboot:riscv64
-        """
-        sums = { "Image" :
-                 "cd634badc65e52fb63465ec99e309c0de0369f0841b7d9486f9729e119bac25e",
-                 "fw_jump.elf" :
-                 "6e3373abcab4305fe151b564a4c71110d833c21f2c0a1753b7935459e36aedcf",
-                 "rootfs.ext4.zst" :
-                 "b18e3a3bdf27be03da0b285e84cb71bf09eca071c3a087b42884b6982ed679eb" }
-
-        self.common_tuxrun(csums=sums)
-
     # Note: some segfaults caused by unaligned userspace access
     @skipUnless(os.getenv('QEMU_TEST_FLAKY_TESTS'), 'Test is unstable on GitLab')
     def test_sh4(self):
diff --git a/tests/functional/meson.build b/tests/functional/meson.build
index 1491b4492e..94270c798c 100644
--- a/tests/functional/meson.build
+++ b/tests/functional/meson.build
@@ -133,6 +133,10 @@ tests_riscv32_system_thorough = [
   'riscv32_tuxrun',
 ]
 
+tests_riscv64_system_thorough = [
+  'riscv64_tuxrun',
+]
+
 tests_s390x_system_thorough = [
   's390x_ccw_virtio',
   's390x_topology',
diff --git a/tests/functional/test_riscv64_tuxrun.py b/tests/functional/test_riscv64_tuxrun.py
new file mode 100755
index 0000000000..13501628f9
--- /dev/null
+++ b/tests/functional/test_riscv64_tuxrun.py
@@ -0,0 +1,38 @@
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
+class TuxRunRiscV64Test(TuxRunBaselineTest):
+
+    ASSET_RISCV64_KERNEL = Asset(
+        'https://storage.tuxboot.com/20230331/riscv64/Image',
+        'cd634badc65e52fb63465ec99e309c0de0369f0841b7d9486f9729e119bac25e')
+    ASSET_RISCV64_ROOTFS = Asset(
+        'https://storage.tuxboot.com/20230331/riscv64/rootfs.ext4.zst',
+        'b18e3a3bdf27be03da0b285e84cb71bf09eca071c3a087b42884b6982ed679eb')
+
+    def test_riscv64(self):
+        self.set_machine('virt')
+        self.common_tuxrun(kernel_asset=self.ASSET_RISCV64_KERNEL,
+                           rootfs_asset=self.ASSET_RISCV64_ROOTFS)
+
+    def test_riscv64_maxcpu(self):
+        self.set_machine('virt')
+        self.cpu='max'
+        self.common_tuxrun(kernel_asset=self.ASSET_RISCV64_KERNEL,
+                           rootfs_asset=self.ASSET_RISCV64_ROOTFS)
+
+if __name__ == '__main__':
+    TuxRunBaselineTest.main()
-- 
2.46.1

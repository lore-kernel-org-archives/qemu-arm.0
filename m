Received: by 2002:a17:505:3501:b0:1be9:327d:8ee3 with SMTP id mc1csp392532njb;
        Fri, 11 Oct 2024 06:20:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVRyE22RBt2G2vwvyUAWTqOPIMyRUkgHt5tAspoloIV2xIlFa48O3991n1qiCtkQQzVbwHC4Oz7dRoJuA==@linaro.org
X-Google-Smtp-Source: AGHT+IEUNhIXA42WylZDf9GJ2+zLt6LFAU1FDeKXgoHQg1TjoCkg+nJ4MtTgV47o3zKHKbSn1YBK
X-Received: by 2002:a05:6122:884:b0:509:e80:3ed2 with SMTP id 71dfb90a1353d-50d1f51b1ccmr1345381e0c.7.1728652822212;
        Fri, 11 Oct 2024 06:20:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728652822; cv=none;
        d=google.com; s=arc-20240605;
        b=eQ51LHlcx7QmQPIKrwtXEo6PifiqEecMHnIv7pudW9PIGMie/KnxTh6SVgz7Cqb809
         b3s78DyVJXexp8T4grFP3rLH3z+IUoE+zfFybgUk/w0oQ//3Nw6o9C/ZiijOnN9oCuYj
         t10OMVYvCXYgj768EL1D0ZgppQiQyiwYB37qH79E4S/28whhpIzTtJmXI5sVVDLRdMIp
         dMwQh0siM68WTnSS4oQA4C2BlbtOqn5zq0JUazPUUYiTnzchBwP60BHehd1BLuy/1PFS
         kthoyX9wg1Vy0Zss8so37Nc61z/FTKVvkY2Tffu9aArpi8aApbblJdtOuQcz/SVpGBGm
         4RpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=rIubmt6mmbRv8h3Yr9aJ/pXuvv11oJfx3cgAf0vSBko=;
        fh=yV7XiH9Iqz9ECmsY7O4iL5H1OqntXAXD46ZP2pth0HE=;
        b=W6xxNyNS4hxfyALlQXC4gjSaAs4nIorSsq+t0rL8xILISLhPab7jRFpaNanxHYI8Si
         eIG+IkuFdOfoopQiGU/XIbVzF0R9YFuTe/JRSGU/3+NrPdAYidHJ3E5uumfCx2afWZnS
         UzzHebsj35PHOZabYibB28sGv2CaS1hSrIxXeROSBHSaHO0cZly28eI9EWEKqjIqaoJO
         dGuS0a+aFupanh8fnTuc2aK2b1OSLGOsfeWPX95gND3ksj9SMqwY2cz/c6uHQ0F+xUx3
         qGdF4RzS5VX9fmGJ/9WOtn9OzvQE2yuDt+YuP/tSN+MXmoHJi7mLYXTBJfL+eJ2JJy6S
         HsMg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Dc4k1Git;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 71dfb90a1353d-50d0887153esi931452e0c.247.2024.10.11.06.20.22
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 06:20:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Dc4k1Git;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728652821;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rIubmt6mmbRv8h3Yr9aJ/pXuvv11oJfx3cgAf0vSBko=;
	b=Dc4k1GitTCuEJrZqfoUne0Fp4TOU98kzhug/Fc/g2oxKMdfuSCfZXOa+NjA4cl8rM2HP0v
	c6xlutKm3JrvseLHFcuGgRJ8XPXtpvuaRP/J+9Wmjypgm9exrBCEjcguHiZr9KB8yW/RvN
	ORaL6NWzB4C7ZmIacIBhqDr5HWK1TtE=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-331--LGffVhPN6mjSprJomwsuw-1; Fri,
 11 Oct 2024 09:20:18 -0400
X-MC-Unique: -LGffVhPN6mjSprJomwsuw-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7CE491956088;
	Fri, 11 Oct 2024 13:20:17 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.39.193.77])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id DE5AA1955E8F;
	Fri, 11 Oct 2024 13:20:13 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Magnus Damm <magnus.damm@gmail.com>,
	qemu-arm@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Subject: [PATCH 05/17] tests/functional: Convert the Avocado s390x tuxrun test
Date: Fri, 11 Oct 2024 15:19:22 +0200
Message-ID: <20241011131937.377223-6-thuth@redhat.com>
In-Reply-To: <20241011131937.377223-1-thuth@redhat.com>
References: <20241011131937.377223-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-TUID: XcYP2FNLcsMp

Move the test to a new file so that it can be run via
qemu-system-s390x in the functional framework.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS                           |  2 +-
 tests/avocado/tuxrun_baselines.py     | 17 --------------
 tests/functional/test_s390x_tuxrun.py | 34 +++++++++++++++++++++++++++
 3 files changed, 35 insertions(+), 18 deletions(-)
 create mode 100755 tests/functional/test_s390x_tuxrun.py

diff --git a/MAINTAINERS b/MAINTAINERS
index 5493623050..ab9df83c17 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1683,7 +1683,7 @@ S: Supported
 F: hw/s390x/
 F: include/hw/s390x/
 F: configs/devices/s390x-softmmu/default.mak
-F: tests/functional/test_s390x_ccw_virtio.py
+F: tests/functional/test_s390x_*
 T: git https://github.com/borntraeger/qemu.git s390-next
 L: qemu-s390x@nongnu.org
 
diff --git a/tests/avocado/tuxrun_baselines.py b/tests/avocado/tuxrun_baselines.py
index dc32735c3f..98dce857cf 100644
--- a/tests/avocado/tuxrun_baselines.py
+++ b/tests/avocado/tuxrun_baselines.py
@@ -410,23 +410,6 @@ def test_riscv64_maxcpu(self):
 
         self.common_tuxrun(csums=sums)
 
-    def test_s390(self):
-        """
-        :avocado: tags=arch:s390x
-        :avocado: tags=endian:big
-        :avocado: tags=tuxboot:s390
-        :avocado: tags=image:bzImage
-        :avocado: tags=shutdown:nowait
-        """
-        sums = { "bzImage" :
-                 "0414e98dd1c3dafff8496c9cd9c28a5f8d04553bb5ba37e906a812b48d442ef0",
-                 "rootfs.ext4.zst" :
-                 "88c37c32276677f873a25ab9ec6247895b8e3e6f8259134de2a616080b8ab3fc" }
-
-        self.common_tuxrun(csums=sums,
-                           drive="virtio-blk-ccw",
-                           haltmsg="Requesting system halt")
-
     # Note: some segfaults caused by unaligned userspace access
     @skipUnless(os.getenv('QEMU_TEST_FLAKY_TESTS'), 'Test is unstable on GitLab')
     def test_sh4(self):
diff --git a/tests/functional/test_s390x_tuxrun.py b/tests/functional/test_s390x_tuxrun.py
new file mode 100755
index 0000000000..dcab17c68b
--- /dev/null
+++ b/tests/functional/test_s390x_tuxrun.py
@@ -0,0 +1,34 @@
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
+class TuxRunS390xTest(TuxRunBaselineTest):
+
+    ASSET_S390X_KERNEL = Asset(
+        'https://storage.tuxboot.com/20230331/s390/bzImage',
+        '0414e98dd1c3dafff8496c9cd9c28a5f8d04553bb5ba37e906a812b48d442ef0')
+    ASSET_S390X_ROOTFS = Asset(
+        'https://storage.tuxboot.com/20230331/s390/rootfs.ext4.zst',
+        '88c37c32276677f873a25ab9ec6247895b8e3e6f8259134de2a616080b8ab3fc')
+
+    def test_s390(self):
+        self.wait_for_shutdown=False
+        self.common_tuxrun(kernel_asset=self.ASSET_S390X_KERNEL,
+                           rootfs_asset=self.ASSET_S390X_ROOTFS,
+                           drive="virtio-blk-ccw",
+                           haltmsg="Requesting system halt")
+
+if __name__ == '__main__':
+    TuxRunBaselineTest.main()
-- 
2.46.1

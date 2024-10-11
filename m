Received: by 2002:a17:505:3501:b0:1be9:327d:8ee3 with SMTP id mc1csp393043njb;
        Fri, 11 Oct 2024 06:21:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUMs/IcIaRu5/sT91E5zizE2ZsyLpaqRYvR9pf3dUl018pSkWyo9fFJU9SPcl9yG12VMw1vrzZB0lB9ig==@linaro.org
X-Google-Smtp-Source: AGHT+IEsCe4XONEZo1YKW9bO995XkQZryRLGQHmSLv3dDJirXLanC2E4M/ZSmKg6svQJi5lbBucP
X-Received: by 2002:a05:6902:c08:b0:e26:cab:3949 with SMTP id 3f1490d57ef6-e2919ff8233mr1786277276.49.1728652860026;
        Fri, 11 Oct 2024 06:21:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728652859; cv=none;
        d=google.com; s=arc-20240605;
        b=AoxCMCR+q99s5ZiycXP0Ujo7uLZX+Hl1h0I9FGpHtuysdwN533hdMMkHGM4zSzhS2s
         ZFNPfcWa6SnMr6SV/Zi7oA3yX1Qt5JzzUYPxXOWukPCOSbBmq8LSHoo/BjtwbCkqB+oG
         u2H+rFoGyUNKd/yRP93UWiTIx8AEh9cAFIIJOyRJLxyX/8b28rW4NoQAygrLRXvdZgJt
         dpVLbg+1jwRBsgVjVc36chWWe1l4esdwiyznBDXuUTKJ6VGl50tLDAEaUMJbX7sbAKuD
         afiv5pj3Tm2wQjNzJBpeHn7foWzEMncIbpaQcawVtJjoqV6+RardBKsuYLQ8pdCQXAjq
         e82w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=PDg0vyitJ62VONBC0A96zp3mijsQBxH/c04ECt3WkC4=;
        fh=yV7XiH9Iqz9ECmsY7O4iL5H1OqntXAXD46ZP2pth0HE=;
        b=cbxIyUMeC+7ts3zUwkfY4fjyhluttp7lRoP3W8BsInG4DXcnba+UWlYxIgxLxFRotK
         XdKF4bEfcpshf1kNBcUf+aDlZLgW4dBh+IfA0qyOLK+9XRXeaPXLf/DnE/AFBAgW347D
         uKNCAG0IOs6PXDwRk2XvjOaednkZGzMm6iMQWvHKM5zvlIIkAZWOFrR3vMsJms0koXwj
         WcDQZDpgaHeKTcKjL0zbOibK+sVgMuokXjjgUEI5zs1bwjkyvwq8XaTXtLlBdEcaCgJP
         toJmIvDc7EnbrLk0lMMyu/tAyqZGdUlnHuZdxT0vYGrqFwfCQfDQrnW+Dn2bvzBeBNcy
         DEow==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KqyeUpYm;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id ada2fe7eead31-4a457a04c62si995487137.123.2024.10.11.06.20.59
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 06:20:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KqyeUpYm;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728652859;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PDg0vyitJ62VONBC0A96zp3mijsQBxH/c04ECt3WkC4=;
	b=KqyeUpYmlXJGeZiusvvtDNSVMDWtzugd3hRp98aMF9SbvVu9oinaLpM4z3olf1mFKtOGlw
	WklS/LtyhWvuwbWyZnhOks5ItPtSAtUz5tOCP6cjbvqv0L7oM5fnl2Pz34ifho25vnCt4d
	aLsJdcPkkKLvvWee589zC4b2jA0r4u8=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-402-G9cPMQ_5MCup-BXHkjGH_Q-1; Fri,
 11 Oct 2024 09:20:57 -0400
X-MC-Unique: G9cPMQ_5MCup-BXHkjGH_Q-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9837B1955F45;
	Fri, 11 Oct 2024 13:20:55 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.39.193.77])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 88F4D1956052;
	Fri, 11 Oct 2024 13:20:52 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Magnus Damm <magnus.damm@gmail.com>,
	qemu-arm@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Subject: [PATCH 15/17] tests/functional: Convert the Avocado ppc32 tuxrun test
Date: Fri, 11 Oct 2024 15:19:32 +0200
Message-ID: <20241011131937.377223-16-thuth@redhat.com>
In-Reply-To: <20241011131937.377223-1-thuth@redhat.com>
References: <20241011131937.377223-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-TUID: P+3IMWPVcwgi

Move the test into a new file so that it can be run via
qemu-system-ppc in the functional framework.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/avocado/tuxrun_baselines.py   | 16 -------------
 tests/functional/meson.build        |  1 +
 tests/functional/test_ppc_tuxrun.py | 35 +++++++++++++++++++++++++++++
 3 files changed, 36 insertions(+), 16 deletions(-)
 create mode 100755 tests/functional/test_ppc_tuxrun.py

diff --git a/tests/avocado/tuxrun_baselines.py b/tests/avocado/tuxrun_baselines.py
index 18dc7ddaab..c358095e1f 100644
--- a/tests/avocado/tuxrun_baselines.py
+++ b/tests/avocado/tuxrun_baselines.py
@@ -192,22 +192,6 @@ def common_tuxrun(self,
     #        --kernel https://storage.tuxboot.com/{TUXBOOT}/{IMAGE}
     #
 
-    def test_ppc32(self):
-        """
-        :avocado: tags=arch:ppc
-        :avocado: tags=machine:ppce500
-        :avocado: tags=cpu:e500mc
-        :avocado: tags=tuxboot:ppc32
-        :avocado: tags=image:uImage
-        :avocado: tags=shutdown:nowait
-        """
-        sums = { "rootfs.ext4.zst" :
-                 "8885b9d999cc24d679542a02e9b6aaf48f718f2050ece6b8347074b6ee41dd09",
-                 "uImage" :
-                 "1a68f74b860fda022fb12e03c5efece8c2b8b590d96cca37a8481a3ae0b3f81f" }
-
-        self.common_tuxrun(csums=sums, drive="virtio-blk-pci")
-
     # Note: some segfaults caused by unaligned userspace access
     @skipUnless(os.getenv('QEMU_TEST_FLAKY_TESTS'), 'Test is unstable on GitLab')
     def test_sh4(self):
diff --git a/tests/functional/meson.build b/tests/functional/meson.build
index 48445edfab..c17c9b0700 100644
--- a/tests/functional/meson.build
+++ b/tests/functional/meson.build
@@ -126,6 +126,7 @@ tests_ppc_system_thorough = [
   'ppc_bamboo',
   'ppc_mac',
   'ppc_mpc8544ds',
+  'ppc_tuxrun',
   'ppc_virtex_ml507',
 ]
 
diff --git a/tests/functional/test_ppc_tuxrun.py b/tests/functional/test_ppc_tuxrun.py
new file mode 100755
index 0000000000..50b76946c4
--- /dev/null
+++ b/tests/functional/test_ppc_tuxrun.py
@@ -0,0 +1,35 @@
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
+class TuxRunPPC32Test(TuxRunBaselineTest):
+
+    ASSET_PPC32_KERNEL = Asset(
+        'https://storage.tuxboot.com/20230331/ppc32/uImage',
+        '1a68f74b860fda022fb12e03c5efece8c2b8b590d96cca37a8481a3ae0b3f81f')
+    ASSET_PPC32_ROOTFS = Asset(
+        'https://storage.tuxboot.com/20230331/ppc32/rootfs.ext4.zst',
+        '8885b9d999cc24d679542a02e9b6aaf48f718f2050ece6b8347074b6ee41dd09')
+
+    def test_ppc32(self):
+        self.set_machine('ppce500')
+        self.cpu='e500mc'
+        self.wait_for_shutdown=False
+        self.common_tuxrun(kernel_asset=self.ASSET_PPC32_KERNEL,
+                           rootfs_asset=self.ASSET_PPC32_ROOTFS,
+                           drive="virtio-blk-pci")
+
+if __name__ == '__main__':
+    TuxRunBaselineTest.main()
-- 
2.46.1

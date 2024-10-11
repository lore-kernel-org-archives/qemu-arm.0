Received: by 2002:a17:505:3501:b0:1be9:327d:8ee3 with SMTP id mc1csp392654njb;
        Fri, 11 Oct 2024 06:20:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVlOCe8Ol60Z/ktwn3meHYP7kecSqEIhoucB3EbY/3Zc5FgUFTXooNOYzqHUwdZ6RipRp6cXOj7kcrDYQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFBZAX+aCzsmDBhIhKcgGwIodEMcqLTgg9SMdhXekrLHlBorqu3dZ5MX+o0cDLRS8B233gm
X-Received: by 2002:a05:622a:134c:b0:45f:916:c3f5 with SMTP id d75a77b69052e-4604bca6851mr40573451cf.53.1728652831072;
        Fri, 11 Oct 2024 06:20:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728652831; cv=none;
        d=google.com; s=arc-20240605;
        b=RrhmOCYaEe8PAHnuanrFSGa0gYFqUDvoqhtWprUfvm5mtUbTs+GBa3SaK7rLW+lfAu
         yD0n93nZgSKgcvkjW2J3z8O7fWwpmethSd2AKVJ3+rBuKmGu9WOJUOjDyifUEGj2snOR
         lKlgDzT3izw0bJ6Amx40lvMvkkDcwQAszOFYI53PHXz89qRCyDm4GENQ3BCb27BOSl5r
         kKeosE01K6NJuwvX4snrJgiMcAaXYN5qy2DLtZShAludv6Y2ICOgv/DkY4W4vp2FmA2o
         oxeEYwR3sb9vaUUa0Ijm6qcpm9F1LDu2Y5ma0ludzn/BO60veGuR827Ar27MaB5NbjSw
         Hbwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=lz9EgXFU0lWj10nDNVRrBm6fkJnPfK29/UdEKCWZnFw=;
        fh=yV7XiH9Iqz9ECmsY7O4iL5H1OqntXAXD46ZP2pth0HE=;
        b=W7KQyrVC5Tf1B8uoJVSDW/zNTyPsh2X+Ya5QgZU23aZ9Fjyo/q6I+d63wJx0K/PQpq
         cQshhEEqpyUMGAXDayHpEktOQ9eNFX4BZS+ZZSTLlFXFVaFm1QVFbW2CX/EE46O/L7g4
         qnN3GCwDbwKajxleE0E1oXB2j0vXD4LwJdT1mjNoqjMQ1kdM4O0/7ytq0/Sc1/bYvfrA
         GrzWXoY3zizzB4A5qerfVGQHulKVKMOZiJ7MJ2lMPyi9+nPcWvpK5bZhUfPFoEcAzEtn
         rjFKCW7AVhiTrIF6ZidRH5VbmbKow1Zg8UMTUg1mFgyKrNKJ8BKoCS9VCPKbTOMlfGWM
         oeOA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aBGq4AFW;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-460488623cbsi25656431cf.629.2024.10.11.06.20.30
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 06:20:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aBGq4AFW;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728652830;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lz9EgXFU0lWj10nDNVRrBm6fkJnPfK29/UdEKCWZnFw=;
	b=aBGq4AFWNeILeyMdYv3M8fbnc3uI6uce8eyI3MNTzLjL148vrTTthUCqF8r5i7DA6Z+4Jq
	gpmNMMgcnXpatcOv/cd+rftjZ82c64bSeoi5pjYd434Lfh5iOktVLE7FyXGfEL3w1I070S
	5/3DPfVEAeKwlOXtcLi7277Nn51/1UA=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-630-FJleV-SWPbGU95I8dv1LgQ-1; Fri,
 11 Oct 2024 09:20:26 -0400
X-MC-Unique: FJleV-SWPbGU95I8dv1LgQ-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9531E19560B2;
	Fri, 11 Oct 2024 13:20:24 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.39.193.77])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id CCC7A1955E8F;
	Fri, 11 Oct 2024 13:20:21 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Magnus Damm <magnus.damm@gmail.com>,
	qemu-arm@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Subject: [PATCH 07/17] tests/functional: Convert the Avocado riscv32 tuxrun tests
Date: Fri, 11 Oct 2024 15:19:24 +0200
Message-ID: <20241011131937.377223-8-thuth@redhat.com>
In-Reply-To: <20241011131937.377223-1-thuth@redhat.com>
References: <20241011131937.377223-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-TUID: vQyI3goIFARI

Move the tests to a new file so that they can be run via
qemu-system-riscv32 in the functional framework.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/avocado/tuxrun_baselines.py       | 31 --------------------
 tests/functional/meson.build            |  4 +++
 tests/functional/test_riscv32_tuxrun.py | 38 +++++++++++++++++++++++++
 3 files changed, 42 insertions(+), 31 deletions(-)
 create mode 100755 tests/functional/test_riscv32_tuxrun.py

diff --git a/tests/avocado/tuxrun_baselines.py b/tests/avocado/tuxrun_baselines.py
index 59ca9f9706..e84fb9c3b9 100644
--- a/tests/avocado/tuxrun_baselines.py
+++ b/tests/avocado/tuxrun_baselines.py
@@ -292,21 +292,6 @@ def test_ppc32(self):
 
         self.common_tuxrun(csums=sums, drive="virtio-blk-pci")
 
-    def test_riscv32(self):
-        """
-        :avocado: tags=arch:riscv32
-        :avocado: tags=machine:virt
-        :avocado: tags=tuxboot:riscv32
-        """
-        sums = { "Image" :
-                 "89599407d7334de629a40e7ad6503c73670359eb5f5ae9d686353a3d6deccbd5",
-                 "fw_jump.elf" :
-                 "f2ef28a0b77826f79d085d3e4aa686f1159b315eff9099a37046b18936676985",
-                 "rootfs.ext4.zst" :
-                 "7168d296d0283238ea73cd5a775b3dd608e55e04c7b92b76ecce31bb13108cba" }
-
-        self.common_tuxrun(csums=sums)
-
     def test_riscv64(self):
         """
         :avocado: tags=arch:riscv64
@@ -322,22 +307,6 @@ def test_riscv64(self):
 
         self.common_tuxrun(csums=sums)
 
-    def test_riscv32_maxcpu(self):
-        """
-        :avocado: tags=arch:riscv32
-        :avocado: tags=machine:virt
-        :avocado: tags=cpu:max
-        :avocado: tags=tuxboot:riscv32
-        """
-        sums = { "Image" :
-                 "89599407d7334de629a40e7ad6503c73670359eb5f5ae9d686353a3d6deccbd5",
-                 "fw_jump.elf" :
-                 "f2ef28a0b77826f79d085d3e4aa686f1159b315eff9099a37046b18936676985",
-                 "rootfs.ext4.zst" :
-                 "7168d296d0283238ea73cd5a775b3dd608e55e04c7b92b76ecce31bb13108cba" }
-
-        self.common_tuxrun(csums=sums)
-
     def test_riscv64_maxcpu(self):
         """
         :avocado: tags=arch:riscv64
diff --git a/tests/functional/meson.build b/tests/functional/meson.build
index ae913781ec..1491b4492e 100644
--- a/tests/functional/meson.build
+++ b/tests/functional/meson.build
@@ -129,6 +129,10 @@ tests_rx_system_thorough = [
   'rx_gdbsim',
 ]
 
+tests_riscv32_system_thorough = [
+  'riscv32_tuxrun',
+]
+
 tests_s390x_system_thorough = [
   's390x_ccw_virtio',
   's390x_topology',
diff --git a/tests/functional/test_riscv32_tuxrun.py b/tests/functional/test_riscv32_tuxrun.py
new file mode 100755
index 0000000000..49b57cd428
--- /dev/null
+++ b/tests/functional/test_riscv32_tuxrun.py
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
+class TuxRunRiscV32Test(TuxRunBaselineTest):
+
+    ASSET_RISCV32_KERNEL = Asset(
+        'https://storage.tuxboot.com/20230331/riscv32/Image',
+        '89599407d7334de629a40e7ad6503c73670359eb5f5ae9d686353a3d6deccbd5')
+    ASSET_RISCV32_ROOTFS = Asset(
+        'https://storage.tuxboot.com/20230331/riscv32/rootfs.ext4.zst',
+        '7168d296d0283238ea73cd5a775b3dd608e55e04c7b92b76ecce31bb13108cba')
+
+    def test_riscv32(self):
+        self.set_machine('virt')
+        self.common_tuxrun(kernel_asset=self.ASSET_RISCV32_KERNEL,
+                           rootfs_asset=self.ASSET_RISCV32_ROOTFS)
+
+    def test_riscv32_maxcpu(self):
+        self.set_machine('virt')
+        self.cpu='max'
+        self.common_tuxrun(kernel_asset=self.ASSET_RISCV32_KERNEL,
+                           rootfs_asset=self.ASSET_RISCV32_ROOTFS)
+
+if __name__ == '__main__':
+    TuxRunBaselineTest.main()
-- 
2.46.1

Received: by 2002:a17:505:3501:b0:1be9:327d:8ee3 with SMTP id mc1csp392900njb;
        Fri, 11 Oct 2024 06:20:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU5O0dfuJmp/YT4NP9xoiuNo71mXGkxeg6PZyHQD9r0QvQVFYH3lyjCunGmd4UgqyTRiVGvR13VU6y/sA==@linaro.org
X-Google-Smtp-Source: AGHT+IF9/CYMppMdqGGyT/8fACOVbTymPC5BHt4vdV6AqJDuyxsemRlO542mFenJPVJqr+sxtO3O
X-Received: by 2002:a05:6122:32d:b0:50c:a196:8836 with SMTP id 71dfb90a1353d-50d018e832cmr4756884e0c.2.1728652849828;
        Fri, 11 Oct 2024 06:20:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728652849; cv=none;
        d=google.com; s=arc-20240605;
        b=hs5FZ9msMTBPQxisW2EST4ev2URInJgyr2NLwPk7WRLON9UddE+d1MPIcTVMYAKxLS
         pT/LV0gFwgPG39GDpxU9nfNNceLcl8wHBzjxeeZPIv8r+l5mz4AoSV06a9X1uh8xIfeD
         rC9nbM7CxjVo0/rhwJjXOyzd9Y9bnqY5ETe2D2n6K/Z5JCNuf/g6sxawuDIGOP1jEUsX
         D3f9Jik2cgg7gnQBrawwYQ4A4SuJaSSxdjQKiSspTUpn43nJsB2WqIiIN31pnY/yqNPL
         CJngnLEX47sRMoCUHTnesXTy9NXI7kRRo5q219tRkjWCTg1+FEAJl+Oin6Z246P762IT
         fyIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=hKLNXEIbaQ2WWuifBj7MYKH9Xy1I+/rrjIxbz8im7+Y=;
        fh=yV7XiH9Iqz9ECmsY7O4iL5H1OqntXAXD46ZP2pth0HE=;
        b=Oos9T3buc0kLqzSBAzhAKLhiGaStJRvmhkN5ULjIsRezjdPT7d5lTzNlww4uTKP6Xf
         yhsw8maRIt71j+Tssn+4kd8EyVma3lD48GGc752QOovJ2CPHtNO44Q1yPUsvJZxNr/6E
         NR9pa5O6GiJBMW3jXbpzJgO7ygwAlNEtCN6TPiV0BItY3CYnLdZ4GKtP/QygDDXGhSdu
         s+z4pxD2px90goQD4Pvx3nDTJIlm2gA1Ba/gZMflXkJ8OeV0qPUXyethI1MKGez7rmrC
         JnHBtAPL+3RqgXq1eQiy9BnKgXZGWVFC9mczYiBevr4BuqPlVIFpKPqgN0n9xSWcjN2J
         ndDA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LgfYT54A;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-84fd35d4dd7si768173241.211.2024.10.11.06.20.49
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 06:20:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LgfYT54A;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728652849;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hKLNXEIbaQ2WWuifBj7MYKH9Xy1I+/rrjIxbz8im7+Y=;
	b=LgfYT54ALI0pH8ipeU5ibLjLoWc3H5kLVCHyCuS7MdAArG967ofGPcnNDkwYH7YPRkjbv1
	Lr6f5qxaJFcFRefQeDvo9TXizvdC33Z7iupHtHzpbDESGEBsJ9WH9OvqIzE7XDaUGYXC29
	Jv36yq+0X8A4gYVr2f9+la1UszptEFs=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-269-txhUQfpsOeOpbsWfEdADhw-1; Fri,
 11 Oct 2024 09:20:45 -0400
X-MC-Unique: txhUQfpsOeOpbsWfEdADhw-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D75981955D56;
	Fri, 11 Oct 2024 13:20:43 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.39.193.77])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C369A1955E8F;
	Fri, 11 Oct 2024 13:20:40 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Magnus Damm <magnus.damm@gmail.com>,
	qemu-arm@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Subject: [PATCH 12/17] tests/functional: Convert the Avocado mipsel tuxrun test
Date: Fri, 11 Oct 2024 15:19:29 +0200
Message-ID: <20241011131937.377223-13-thuth@redhat.com>
In-Reply-To: <20241011131937.377223-1-thuth@redhat.com>
References: <20241011131937.377223-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-TUID: eHTVoZLnrTs5

Move the test into a new file so that it can be run via
qemu-system-mipsel in the functional framework.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/avocado/tuxrun_baselines.py      | 17 ------------
 tests/functional/meson.build           |  1 +
 tests/functional/test_mipsel_tuxrun.py | 36 ++++++++++++++++++++++++++
 3 files changed, 37 insertions(+), 17 deletions(-)
 create mode 100755 tests/functional/test_mipsel_tuxrun.py

diff --git a/tests/avocado/tuxrun_baselines.py b/tests/avocado/tuxrun_baselines.py
index 8593d204b7..d45c2ce35e 100644
--- a/tests/avocado/tuxrun_baselines.py
+++ b/tests/avocado/tuxrun_baselines.py
@@ -192,23 +192,6 @@ def common_tuxrun(self,
     #        --kernel https://storage.tuxboot.com/{TUXBOOT}/{IMAGE}
     #
 
-    def test_mips32el(self):
-        """
-        :avocado: tags=arch:mipsel
-        :avocado: tags=machine:malta
-        :avocado: tags=cpu:mips32r6-generic
-        :avocado: tags=tuxboot:mips32el
-        :avocado: tags=image:vmlinux
-        :avocado: tags=root:sda
-        :avocado: tags=shutdown:nowait
-        """
-        sums = { "rootfs.ext4.zst" :
-                 "e799768e289fd69209c21f4dacffa11baea7543d5db101e8ce27e3bc2c41d90e",
-                 "vmlinux" :
-                 "8573867c68a8443db8de6d08bb33fb291c189ca2ca671471d3973a3e712096a3" }
-
-        self.common_tuxrun(csums=sums, drive="driver=ide-hd,bus=ide.0,unit=0")
-
     def test_mips64(self):
         """
         :avocado: tags=arch:mips64
diff --git a/tests/functional/meson.build b/tests/functional/meson.build
index 4a78c5f8b6..813237e412 100644
--- a/tests/functional/meson.build
+++ b/tests/functional/meson.build
@@ -97,6 +97,7 @@ tests_mips_system_thorough = [
 
 tests_mipsel_system_thorough = [
   'mipsel_malta',
+  'mipsel_tuxrun',
 ]
 
 tests_mips64el_system_thorough = [
diff --git a/tests/functional/test_mipsel_tuxrun.py b/tests/functional/test_mipsel_tuxrun.py
new file mode 100755
index 0000000000..2965bbd913
--- /dev/null
+++ b/tests/functional/test_mipsel_tuxrun.py
@@ -0,0 +1,36 @@
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
+class TuxRunMipsELTest(TuxRunBaselineTest):
+
+    ASSET_MIPSEL_KERNEL = Asset(
+        'https://storage.tuxboot.com/20230331/mips32el/vmlinux',
+        '8573867c68a8443db8de6d08bb33fb291c189ca2ca671471d3973a3e712096a3')
+    ASSET_MIPSEL_ROOTFS = Asset(
+        'https://storage.tuxboot.com/20230331/mips32el/rootfs.ext4.zst',
+        'e799768e289fd69209c21f4dacffa11baea7543d5db101e8ce27e3bc2c41d90e')
+
+    def test_mips32el(self):
+        self.set_machine('malta')
+        self.cpu="mips32r6-generic"
+        self.root="sda"
+        self.wait_for_shutdown=False
+        self.common_tuxrun(kernel_asset=self.ASSET_MIPSEL_KERNEL,
+                           rootfs_asset=self.ASSET_MIPSEL_ROOTFS,
+                           drive="driver=ide-hd,bus=ide.0,unit=0")
+
+if __name__ == '__main__':
+    TuxRunBaselineTest.main()
-- 
2.46.1

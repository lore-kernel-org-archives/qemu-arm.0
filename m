Received: by 2002:a17:505:3501:b0:1be9:327d:8ee3 with SMTP id mc1csp393086njb;
        Fri, 11 Oct 2024 06:21:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVEvqtHPyiTzT+97yu+O5aGR0nTOamVHLYOEOi9i4kua8ybW+K6s+w0v57Nz+P0PEiQChbki/mCPvqTWg==@linaro.org
X-Google-Smtp-Source: AGHT+IGyUj1EFzrnGZLiJyhmbknuH3hhMelMx1s02BjBs2ZLlNxzRjRKSkwdKC7tJMtQ4ydcZJbl
X-Received: by 2002:a05:620a:4153:b0:7af:cd3c:1f30 with SMTP id af79cd13be357-7b11a3643demr366921285a.25.1728652862446;
        Fri, 11 Oct 2024 06:21:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728652862; cv=none;
        d=google.com; s=arc-20240605;
        b=BBqVQJznASIdMfXKbOjwFP2cr+2hOT1IUdTxuJMx/VpgN/apRTtdL4/rfTuj5c9o83
         eBOzFjIDy8uZecexEMSCpUsVHQq4Ya7DgRu49WjW8HUzMvI3byM3R9hIUW3Ci5KFaPw4
         SEBTGNPVtCY+VbB4ZQ+im4znaqMa8zfi3X9RlKFmWcqgx4ApghjZL0kyVBFjXnbbpjw7
         Z1UYojxnX0CgsxRk5/ZTn0wCrSNvQ7WzqFBbrIuCX6UmCgQ3dfmXr1yS6RD+iux9sOlg
         754Ll2+9wo9/Hpm9lNk/y9WmXVD1TDZpDtJ8uGngikGd6VpQPPkdwxV69OcXjnHEWfNX
         ev/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=GVVahyK6aiG7rFiHC9ll3BUOZPbdp7wyzMUyWTHzn+g=;
        fh=yV7XiH9Iqz9ECmsY7O4iL5H1OqntXAXD46ZP2pth0HE=;
        b=JagrZ8DJ7KnEc9Qrwg57d9ba5QG4iix1B4M3y1waXHuLmH0VOsK6R2aS2S3YLW6Le3
         JpsLhT8cfeYrDGpJx//u/fhLHX+Q94MP7Y6n51qcEdjayzr7t8JxqARpwpWTDLjwBStv
         qBQQ6TKwwClpML3bShKI9Q7oAmkmnw86RBfbN01uDSoKyoXNgSgmlsCrnT0ZkJQz+QBh
         P4qKQi2oFkbH1/CJfsOXiEWSCcqoh7sX4LyoPg2atKNrrSukIzrcrGU7V5pZuC0g2+Pz
         Dtig0dkhpwhLegbitWuI+H9EwgZmH9kpMfrWWdKaObE3uv22Q/NcXvQ5wwtghUN3JwaP
         55YQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SgZxK5FG;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7b1148fd5c5si363091385a.140.2024.10.11.06.21.02
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 06:21:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SgZxK5FG;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728652862;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GVVahyK6aiG7rFiHC9ll3BUOZPbdp7wyzMUyWTHzn+g=;
	b=SgZxK5FGZ2K6buzHCLelZ76p3mnbq8VTcwnafw7aZA1iHQlaCcYoFUQGJsTkuC4KiGY33Z
	rY56PruKCb+txur9n4Z/3BTHY6nBcylNy9rxbOPEVYW5T0r6g1TKrk1EkaMCWuC9nIlyuA
	8cv7/tl2hSbrQY2UUhcHxZ7vEQO+LmI=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-28-eV-Y9c6hMQGPQRAkEQl6lg-1; Fri,
 11 Oct 2024 09:20:56 -0400
X-MC-Unique: eV-Y9c6hMQGPQRAkEQl6lg-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0F3DF1955F44;
	Fri, 11 Oct 2024 13:20:52 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.39.193.77])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 496501955E7B;
	Fri, 11 Oct 2024 13:20:49 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Magnus Damm <magnus.damm@gmail.com>,
	qemu-arm@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Subject: [PATCH 14/17] tests/functional: Convert the Avocado mips64el tuxrun test
Date: Fri, 11 Oct 2024 15:19:31 +0200
Message-ID: <20241011131937.377223-15-thuth@redhat.com>
In-Reply-To: <20241011131937.377223-1-thuth@redhat.com>
References: <20241011131937.377223-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-TUID: bcsOt9JT61Jr

Move the test into a new file so that it can be run via
qemu-system-mips64el in the functional framework.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/avocado/tuxrun_baselines.py        | 16 -----------
 tests/functional/meson.build             |  1 +
 tests/functional/test_mips64el_tuxrun.py | 35 ++++++++++++++++++++++++
 3 files changed, 36 insertions(+), 16 deletions(-)
 create mode 100755 tests/functional/test_mips64el_tuxrun.py

diff --git a/tests/avocado/tuxrun_baselines.py b/tests/avocado/tuxrun_baselines.py
index e0e6a56067..18dc7ddaab 100644
--- a/tests/avocado/tuxrun_baselines.py
+++ b/tests/avocado/tuxrun_baselines.py
@@ -192,22 +192,6 @@ def common_tuxrun(self,
     #        --kernel https://storage.tuxboot.com/{TUXBOOT}/{IMAGE}
     #
 
-    def test_mips64el(self):
-        """
-        :avocado: tags=arch:mips64el
-        :avocado: tags=machine:malta
-        :avocado: tags=tuxboot:mips64el
-        :avocado: tags=image:vmlinux
-        :avocado: tags=root:sda
-        :avocado: tags=shutdown:nowait
-        """
-        sums = { "rootfs.ext4.zst" :
-                 "fba585368f5915b1498ed081863474b2d7ec4e97cdd46d21bdcb2f9698f83de4",
-                 "vmlinux" :
-                 "d4e08965e2155c4cccce7c5f34d18fe34c636cda2f2c9844387d614950155266" }
-
-        self.common_tuxrun(csums=sums, drive="driver=ide-hd,bus=ide.0,unit=0")
-
     def test_ppc32(self):
         """
         :avocado: tags=arch:ppc
diff --git a/tests/functional/meson.build b/tests/functional/meson.build
index eef48edf52..48445edfab 100644
--- a/tests/functional/meson.build
+++ b/tests/functional/meson.build
@@ -108,6 +108,7 @@ tests_mips64el_system_thorough = [
   'mips64el_fuloong2e',
   'mips64el_loongson3v',
   'mips64el_malta',
+  'mips64el_tuxrun',
 ]
 
 tests_or1k_system_thorough = [
diff --git a/tests/functional/test_mips64el_tuxrun.py b/tests/functional/test_mips64el_tuxrun.py
new file mode 100755
index 0000000000..819549a27b
--- /dev/null
+++ b/tests/functional/test_mips64el_tuxrun.py
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
+class TuxRunMips64ELTest(TuxRunBaselineTest):
+
+    ASSET_MIPS64EL_KERNEL = Asset(
+        'https://storage.tuxboot.com/20230331/mips64el/vmlinux',
+        'd4e08965e2155c4cccce7c5f34d18fe34c636cda2f2c9844387d614950155266')
+    ASSET_MIPS64EL_ROOTFS = Asset(
+        'https://storage.tuxboot.com/20230331/mips64el/rootfs.ext4.zst',
+        'fba585368f5915b1498ed081863474b2d7ec4e97cdd46d21bdcb2f9698f83de4')
+
+    def test_mips64el(self):
+        self.set_machine('malta')
+        self.root="sda"
+        self.wait_for_shutdown=False
+        self.common_tuxrun(kernel_asset=self.ASSET_MIPS64EL_KERNEL,
+                           rootfs_asset=self.ASSET_MIPS64EL_ROOTFS,
+                           drive="driver=ide-hd,bus=ide.0,unit=0")
+
+if __name__ == '__main__':
+    TuxRunBaselineTest.main()
-- 
2.46.1

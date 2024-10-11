Received: by 2002:a17:505:3501:b0:1be9:327d:8ee3 with SMTP id mc1csp392919njb;
        Fri, 11 Oct 2024 06:20:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUNMPnJhfNKg+A1V5yBSPfnR9hkzOuOYk0+b33QVGUY/YC2GtnA6MnQzN605/8t+3fY8ddVe7N+Kj2l4A==@linaro.org
X-Google-Smtp-Source: AGHT+IFdghtQiy/3r2DvM1fO486W35L4H41JOFTu1teLq/94fCa5s8p7E4mSE2uhVet/Ax4S3OrM
X-Received: by 2002:a05:620a:4607:b0:7a9:9fd5:2e28 with SMTP id af79cd13be357-7b11a3da5e5mr334883285a.57.1728652851335;
        Fri, 11 Oct 2024 06:20:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728652851; cv=none;
        d=google.com; s=arc-20240605;
        b=RkhhfXasnpXGr/LDgR/rdJ8tKirAIXdJiyK2nsrf6XJUq0IQWIFXVXCrlDTouPVQlB
         FvyC7F2JfHcWUDpg4LdZf/gKkVQqST7MLV9KH5g2ust0sgdd+elHm4L1lOEgzrnBT34c
         YisQ4t9OvJOGvm0u2jOn9LKr920mITdPVTPcHjZaFgCHYJbv9BrAaBfbL5+KEe+7AEl9
         XnUk6UpcKMhfWraRsp6tNplQa1aKbEkTgjn1PJ/3vSwkxEZONMAdfCouxE8PCKH5ieio
         IkDqxuNOe0TBTM+jYl5iC0pKx1ctbIbLk4iciwEZ6gbwW9X85tQWT33KeqXnj2Yo7Lql
         oOLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=mbcLhTN/YYKZlf/qtxpugDzhSlARKP0MISPf3J+SyrI=;
        fh=yV7XiH9Iqz9ECmsY7O4iL5H1OqntXAXD46ZP2pth0HE=;
        b=ggMYoW90wfKsLzrnza2UN69/Dun8v5l2NEhx8OulDVHHKF4a8hmrc1jFzYujDZDSLA
         pcHcwINj1QIzR+SkSLjTb1CKUIRoy2ut/rmmPSeGNe/vI8oLLPCYSIODjymwS9VNl8xz
         EDVNf6GmkSkaiMtvsp0eCB28Za/ug/a2zx6eh2uKH+URjAEQLqrVDnKobqZ9XTSnUTOA
         Ah2gQCHclP8EiTnxKcoICwM1dSapY2s3BufsyNyIxEd7BwOW1DBHtaehIbEof4PfrMYr
         w/v+u3kwKVG9WUTIDXg5qPHbdAN2CHf1mPmlauSJxsRQEkKuej+xo73qlXc8fPzX2N3p
         qbkQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bYhr51+k;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7b1149c4732si375702085a.632.2024.10.11.06.20.51
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 06:20:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bYhr51+k;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728652851;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mbcLhTN/YYKZlf/qtxpugDzhSlARKP0MISPf3J+SyrI=;
	b=bYhr51+k5JW5op30qTOjgIkWcd/TXSAyFpj5B80aHrzdz2k6Vb3fFgk4MRCn/XweZrR3qR
	UTVWsJ5M6Q7j0+xaIBF+B2q6rPGtHx5MrED8WSRYUF4bN/wMfX62oi5k4OPP727x+EXqnu
	5lGbOW9Yk2Ii+uEFh0xMOZcgSUgWWYg=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-688-8xScTZD5NMOwB-cnZRG32w-1; Fri,
 11 Oct 2024 09:20:41 -0400
X-MC-Unique: 8xScTZD5NMOwB-cnZRG32w-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 34BC91955F3F;
	Fri, 11 Oct 2024 13:20:40 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.39.193.77])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2D73E1956052;
	Fri, 11 Oct 2024 13:20:36 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Magnus Damm <magnus.damm@gmail.com>,
	qemu-arm@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Subject: [PATCH 11/17] tests/functional: Convert the Avocado mips tuxrun test
Date: Fri, 11 Oct 2024 15:19:28 +0200
Message-ID: <20241011131937.377223-12-thuth@redhat.com>
In-Reply-To: <20241011131937.377223-1-thuth@redhat.com>
References: <20241011131937.377223-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-TUID: F/wVmY/fRsGm

Move the test into a new file so that it can be run via
qemu-system-mips in the functional framework.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/avocado/tuxrun_baselines.py    | 18 --------------
 tests/functional/meson.build         |  1 +
 tests/functional/test_mips_tuxrun.py | 36 ++++++++++++++++++++++++++++
 3 files changed, 37 insertions(+), 18 deletions(-)
 create mode 100755 tests/functional/test_mips_tuxrun.py

diff --git a/tests/avocado/tuxrun_baselines.py b/tests/avocado/tuxrun_baselines.py
index 6d00b06713..8593d204b7 100644
--- a/tests/avocado/tuxrun_baselines.py
+++ b/tests/avocado/tuxrun_baselines.py
@@ -192,24 +192,6 @@ def common_tuxrun(self,
     #        --kernel https://storage.tuxboot.com/{TUXBOOT}/{IMAGE}
     #
 
-    def test_mips32(self):
-        """
-        :avocado: tags=arch:mips
-        :avocado: tags=machine:malta
-        :avocado: tags=cpu:mips32r6-generic
-        :avocado: tags=endian:big
-        :avocado: tags=tuxboot:mips32
-        :avocado: tags=image:vmlinux
-        :avocado: tags=root:sda
-        :avocado: tags=shutdown:nowait
-        """
-        sums = { "rootfs.ext4.zst" :
-                 "fc3da0b4c2f38d74c6d705123bb0f633c76ed953128f9d0859378c328a6d11a0",
-                 "vmlinux" :
-                 "bfd2172f8b17fb32970ca0c8c58f59c5a4ca38aa5855d920be3a69b5d16e52f0" }
-
-        self.common_tuxrun(csums=sums, drive="driver=ide-hd,bus=ide.0,unit=0")
-
     def test_mips32el(self):
         """
         :avocado: tags=arch:mipsel
diff --git a/tests/functional/meson.build b/tests/functional/meson.build
index 84012810f7..4a78c5f8b6 100644
--- a/tests/functional/meson.build
+++ b/tests/functional/meson.build
@@ -92,6 +92,7 @@ tests_microblazeel_system_thorough = [
 
 tests_mips_system_thorough = [
   'mips_malta',
+  'mips_tuxrun',
 ]
 
 tests_mipsel_system_thorough = [
diff --git a/tests/functional/test_mips_tuxrun.py b/tests/functional/test_mips_tuxrun.py
new file mode 100755
index 0000000000..6fec44c2bf
--- /dev/null
+++ b/tests/functional/test_mips_tuxrun.py
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
+class TuxRunMipsTest(TuxRunBaselineTest):
+
+    ASSET_MIPS_KERNEL = Asset(
+        'https://storage.tuxboot.com/20230331/mips32/vmlinux',
+        'bfd2172f8b17fb32970ca0c8c58f59c5a4ca38aa5855d920be3a69b5d16e52f0')
+    ASSET_MIPS_ROOTFS = Asset(
+        'https://storage.tuxboot.com/20230331/mips32/rootfs.ext4.zst',
+        'fc3da0b4c2f38d74c6d705123bb0f633c76ed953128f9d0859378c328a6d11a0')
+
+    def test_mips32(self):
+        self.set_machine('malta')
+        self.cpu="mips32r6-generic"
+        self.root="sda"
+        self.wait_for_shutdown=False
+        self.common_tuxrun(kernel_asset=self.ASSET_MIPS_KERNEL,
+                           rootfs_asset=self.ASSET_MIPS_ROOTFS,
+                           drive="driver=ide-hd,bus=ide.0,unit=0")
+
+if __name__ == '__main__':
+    TuxRunBaselineTest.main()
-- 
2.46.1

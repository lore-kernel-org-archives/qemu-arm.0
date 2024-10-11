Received: by 2002:a17:505:3501:b0:1be9:327d:8ee3 with SMTP id mc1csp392953njb;
        Fri, 11 Oct 2024 06:20:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVSKYWoD4Ka8doEwh0NHFC0EUzMse4KZ+SvZC42jtNA4NPz1X+kiUntVTvDQEJozgLxqn+HcTX7xX34XA==@linaro.org
X-Google-Smtp-Source: AGHT+IEIUlaDMuXwAhZxQT9p7iqkajgh0YfwSIeP5CEplMnQrMcmR8538+9Zej7EokkwwyA6BmR3
X-Received: by 2002:a05:622a:1a8d:b0:45f:7f0:c3e4 with SMTP id d75a77b69052e-4604bc4dd8dmr29116451cf.45.1728652853896;
        Fri, 11 Oct 2024 06:20:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728652853; cv=none;
        d=google.com; s=arc-20240605;
        b=UAh3qtJsiY5rAaGISoOO2noYqBKicdeC2iw6F4uDcmxGMwhCMIAwQlP7BuyuCt+Y6B
         T8Zo/vu37ZG2HbNTHgkVHjaGHBjSQm4ioQmhp8fN2OTZbYT7PUB1mqRP8iZrMHlUmluA
         tuVT4HkntE2g3oOgHDxx0f5BwMyGxvwc/+ZKBRrLyeLtaacYTxW7F54O9p3XP1T8BXrp
         oK1FncJV8KUZdtQqsnd2tinbnITKDFuRf6ViP3UdIlBgb//yXv6JBdc9+albEC75Xi2u
         UlrtWDywNV8kl7vD9pAKEyTC4VWM20vIkfUiR0dn24Il6yJwtoOo9kZlwKSQY0PeamHW
         4GBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=OcUoJ5PXttCpLGQ6HYe2UvZN9SjHytyJH4avjZ+Qm5g=;
        fh=yV7XiH9Iqz9ECmsY7O4iL5H1OqntXAXD46ZP2pth0HE=;
        b=VCyoqKCrQJl8OxHTRhuZjz4zW9XMM5lzCQXiKsoFOlgLjGQ5FtIHzjkvDojmM4c4f5
         z4e2wPmUZNKb3VD/EjbZRWdjZ3umyOnG5AtDIOFOG4d9AEWsv1Rn6j+lIsXRtdsm/2p2
         IxJIkgfWN7iljA/EzvMukt8LT17oFtsqAr9pCKswv2qTZ6NtP+/14vGDomJwh97jNz/N
         8WwNinyG80oGQYOyjsZNcPqxQDn319KzXsMwCxQeO28/KlOmg9+JgGR2kS3L1OrqJGzo
         QegSz2baMhy9OKX1ghZsaiIMry18r/cFqJTj7VuTmF8eZYp+5+nApWpZT7ff+kSJjMFt
         Qjuw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Fq/qwfSS";
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-460427fdbbdsi36071531cf.225.2024.10.11.06.20.53
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 06:20:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Fq/qwfSS";
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728652853;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OcUoJ5PXttCpLGQ6HYe2UvZN9SjHytyJH4avjZ+Qm5g=;
	b=Fq/qwfSSiLQb8PR+N1ZUUjbFHqzslqbw2EAlpLoBEeud7O8K49d+HsqZ8GgsI4mChWX0Hy
	YfXEDVpY13u66irzf+6hwaZ/EsYlWS49gcco++Qr9t687V+F1MF3eDwAzg3tv3a7F9Z8zb
	F5R7hsmGqWEGvYM7mwaDM/Tum5Fh5Jg=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-515-SG5v50-HPv6Dp-mKY8YTwA-1; Fri,
 11 Oct 2024 09:20:50 -0400
X-MC-Unique: SG5v50-HPv6Dp-mKY8YTwA-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B66B11955D47;
	Fri, 11 Oct 2024 13:20:48 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.39.193.77])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D527B1956052;
	Fri, 11 Oct 2024 13:20:44 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Magnus Damm <magnus.damm@gmail.com>,
	qemu-arm@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Subject: [PATCH 13/17] tests/functional: Convert the Avocado mips64 tuxrun test
Date: Fri, 11 Oct 2024 15:19:30 +0200
Message-ID: <20241011131937.377223-14-thuth@redhat.com>
In-Reply-To: <20241011131937.377223-1-thuth@redhat.com>
References: <20241011131937.377223-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-TUID: O6tQYihqREIZ

Move the test into a new file so that it can be run via
qemu-system-mips64 in the functional framework.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/avocado/tuxrun_baselines.py      | 17 -------------
 tests/functional/meson.build           |  4 +++
 tests/functional/test_mips64_tuxrun.py | 35 ++++++++++++++++++++++++++
 3 files changed, 39 insertions(+), 17 deletions(-)
 create mode 100755 tests/functional/test_mips64_tuxrun.py

diff --git a/tests/avocado/tuxrun_baselines.py b/tests/avocado/tuxrun_baselines.py
index d45c2ce35e..e0e6a56067 100644
--- a/tests/avocado/tuxrun_baselines.py
+++ b/tests/avocado/tuxrun_baselines.py
@@ -192,23 +192,6 @@ def common_tuxrun(self,
     #        --kernel https://storage.tuxboot.com/{TUXBOOT}/{IMAGE}
     #
 
-    def test_mips64(self):
-        """
-        :avocado: tags=arch:mips64
-        :avocado: tags=machine:malta
-        :avocado: tags=tuxboot:mips64
-        :avocado: tags=endian:big
-        :avocado: tags=image:vmlinux
-        :avocado: tags=root:sda
-        :avocado: tags=shutdown:nowait
-        """
-        sums = { "rootfs.ext4.zst" :
-                 "69d91eeb04df3d8d172922c6993bb37d4deeb6496def75d8580f6f9de3e431da",
-                 "vmlinux" :
-                 "09010e51e4b8bcbbd2494786ffb48eca78f228e96e5c5438344b0eac4029dc61" }
-
-        self.common_tuxrun(csums=sums, drive="driver=ide-hd,bus=ide.0,unit=0")
-
     def test_mips64el(self):
         """
         :avocado: tags=arch:mips64el
diff --git a/tests/functional/meson.build b/tests/functional/meson.build
index 813237e412..eef48edf52 100644
--- a/tests/functional/meson.build
+++ b/tests/functional/meson.build
@@ -100,6 +100,10 @@ tests_mipsel_system_thorough = [
   'mipsel_tuxrun',
 ]
 
+tests_mips64_system_thorough = [
+  'mips64_tuxrun',
+]
+
 tests_mips64el_system_thorough = [
   'mips64el_fuloong2e',
   'mips64el_loongson3v',
diff --git a/tests/functional/test_mips64_tuxrun.py b/tests/functional/test_mips64_tuxrun.py
new file mode 100755
index 0000000000..54af1ae794
--- /dev/null
+++ b/tests/functional/test_mips64_tuxrun.py
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
+class TuxRunMips64Test(TuxRunBaselineTest):
+
+    ASSET_MIPS64_KERNEL = Asset(
+        'https://storage.tuxboot.com/20230331/mips64/vmlinux',
+        '09010e51e4b8bcbbd2494786ffb48eca78f228e96e5c5438344b0eac4029dc61')
+    ASSET_MIPS64_ROOTFS = Asset(
+        'https://storage.tuxboot.com/20230331/mips64/rootfs.ext4.zst',
+        '69d91eeb04df3d8d172922c6993bb37d4deeb6496def75d8580f6f9de3e431da')
+
+    def test_mips64(self):
+        self.set_machine('malta')
+        self.root="sda"
+        self.wait_for_shutdown=False
+        self.common_tuxrun(kernel_asset=self.ASSET_MIPS64_KERNEL,
+                           rootfs_asset=self.ASSET_MIPS64_ROOTFS,
+                           drive="driver=ide-hd,bus=ide.0,unit=0")
+
+if __name__ == '__main__':
+    TuxRunBaselineTest.main()
-- 
2.46.1

Received: by 2002:a17:505:3501:b0:1be9:327d:8ee3 with SMTP id mc1csp392735njb;
        Fri, 11 Oct 2024 06:20:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWGx/ulTysvZestVLI9J5z60gKkT/e0x7Xg+SaKQz0dyIy8ML8URJXQNVA+ftKCDV9Fud22aknkaG/kkQ==@linaro.org
X-Google-Smtp-Source: AGHT+IE/239Gp2rgs5ZaAQckkHqdViRNwhS726phb+f/3DNZwfuMzvajbhaFYMZqwqQAARQPhqhr
X-Received: by 2002:a05:620a:3f85:b0:7a9:b744:fc41 with SMTP id af79cd13be357-7b11a35f0dfmr442368085a.14.1728652837669;
        Fri, 11 Oct 2024 06:20:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728652837; cv=none;
        d=google.com; s=arc-20240605;
        b=VAXMjd7HYrUFQcF4vPqjRT10RWATETK5bK/41w1rxnnr3EcSnjrdFy/nghu7fYFj4i
         KjeB2/Mo0+t+nmu8wAlUzhUcjYx6isMlvscmTiSaeWpMAzhq8q8rW5nyvayLfkE3jOsb
         zkiObKSyJF3s487/HSGJlp9/ELrocioeTtqyw3Eq7fgPy9HEQSxq+PdIDu3RPgWeu7P6
         TgIS3j/ABmkl5L50mUXOVkkxVzbvRwPjhdszcepdC6QiTmE5cKpoeq68uNWVRGsauAUz
         vcyPxPhSB4GJ7GaRgLqGVINIAe4GsMtcH84JBEhGU6yeLU5FhRdbF2kwKzxCbeFa23Kz
         yW5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=YLuM9npE2IVUKcFdffqYrVlZnagtFCjIqK19Be5FBkU=;
        fh=yV7XiH9Iqz9ECmsY7O4iL5H1OqntXAXD46ZP2pth0HE=;
        b=IG6cYvDfXofc+hP0W7plmDMM7BuogzA/BJMDhX6Agtf2AwikDi5Ta0Yg0CiibWx+UW
         HyX6rgW9zhp5A71uaDmhzny+5siv4GJUSyzAZXe0LnQrR0ANeZU7edYLOZVV3qE+aVN1
         s6Ac6Xa0wl0JoQ+uCrEYSUSjMgnLi9CkWpxIoIr6xGjAd7URQc3Eyuml6yoM1N5g/1nk
         yHG+0CDx6Wx3utAS3MSnABq/ZGlxYRF/6PLS2/g1i6Mou+SRkRyHGuwXdgNE+lOl98Uj
         +PH7BP7TdLUNvXNTPPKb84Vrx1InizJAb4V8SLGByMnv2MN2DR67x9Z6H+fAlX0IqEzi
         okgg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=I7uTbZUL;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7b1149336cbsi373084985a.182.2024.10.11.06.20.37
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 06:20:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=I7uTbZUL;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728652837;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YLuM9npE2IVUKcFdffqYrVlZnagtFCjIqK19Be5FBkU=;
	b=I7uTbZULc3an7HE/q0REiMf//M034pK7ktMikq76EwREr+9bmNgozJgxEeFoajQPZxsZY7
	IEZShAB/r7d7b2sBOY5wC51Jy1SIz6SXjaUIGNokwnlymRmHii1I4Abv0CPOPzpAzne8QI
	5HpdgdWuzLjHLyaurcyKqCRhuoLJqf0=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-570-9J7lmwYePfatbz7xnm1jBQ-1; Fri,
 11 Oct 2024 09:20:34 -0400
X-MC-Unique: 9J7lmwYePfatbz7xnm1jBQ-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9B4A91955EA7;
	Fri, 11 Oct 2024 13:20:32 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.39.193.77])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3CB161956052;
	Fri, 11 Oct 2024 13:20:28 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Magnus Damm <magnus.damm@gmail.com>,
	qemu-arm@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Subject: [PATCH 09/17] tests/functional: Convert the Avocado i386 tuxrun test
Date: Fri, 11 Oct 2024 15:19:26 +0200
Message-ID: <20241011131937.377223-10-thuth@redhat.com>
In-Reply-To: <20241011131937.377223-1-thuth@redhat.com>
References: <20241011131937.377223-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-TUID: SObIpWYNElGs

Move the tests to a new file so that they can be run via
qemu-system-i386 in the functional framework.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/avocado/tuxrun_baselines.py    | 16 -------------
 tests/functional/meson.build         |  4 ++++
 tests/functional/test_i386_tuxrun.py | 35 ++++++++++++++++++++++++++++
 3 files changed, 39 insertions(+), 16 deletions(-)
 create mode 100755 tests/functional/test_i386_tuxrun.py

diff --git a/tests/avocado/tuxrun_baselines.py b/tests/avocado/tuxrun_baselines.py
index dcb6589f2f..72b0ad4951 100644
--- a/tests/avocado/tuxrun_baselines.py
+++ b/tests/avocado/tuxrun_baselines.py
@@ -192,22 +192,6 @@ def common_tuxrun(self,
     #        --kernel https://storage.tuxboot.com/{TUXBOOT}/{IMAGE}
     #
 
-    def test_i386(self):
-        """
-        :avocado: tags=arch:i386
-        :avocado: tags=cpu:coreduo
-        :avocado: tags=machine:q35
-        :avocado: tags=tuxboot:i386
-        :avocado: tags=image:bzImage
-        :avocado: tags=shutdown:nowait
-        """
-        sums = {"bzImage" :
-                "a3e5b32a354729e65910f5a1ffcda7c14a6c12a55e8213fb86e277f1b76ed956",
-                "rootfs.ext4.zst" :
-                "f15e66b2bf673a210ec2a4b2e744a80530b36289e04f5388aab812b97f69754a" }
-
-        self.common_tuxrun(csums=sums, drive="virtio-blk-pci")
-
     def test_mips32(self):
         """
         :avocado: tags=arch:mips
diff --git a/tests/functional/meson.build b/tests/functional/meson.build
index 94270c798c..9cdfa1c257 100644
--- a/tests/functional/meson.build
+++ b/tests/functional/meson.build
@@ -68,6 +68,10 @@ tests_avr_system_thorough = [
   'avr_mega2560',
 ]
 
+tests_i386_system_thorough = [
+  'i386_tuxrun',
+]
+
 tests_loongarch64_system_thorough = [
   'loongarch64_virt',
 ]
diff --git a/tests/functional/test_i386_tuxrun.py b/tests/functional/test_i386_tuxrun.py
new file mode 100755
index 0000000000..c593ffbe8c
--- /dev/null
+++ b/tests/functional/test_i386_tuxrun.py
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
+class TuxRunI386Test(TuxRunBaselineTest):
+
+    ASSET_I386_KERNEL = Asset(
+        'https://storage.tuxboot.com/20230331/i386/bzImage',
+        'a3e5b32a354729e65910f5a1ffcda7c14a6c12a55e8213fb86e277f1b76ed956')
+    ASSET_I386_ROOTFS = Asset(
+        'https://storage.tuxboot.com/20230331/i386/rootfs.ext4.zst',
+        'f15e66b2bf673a210ec2a4b2e744a80530b36289e04f5388aab812b97f69754a')
+
+    def test_i386(self):
+        self.set_machine('q35')
+        self.cpu="coreduo"
+        self.wait_for_shutdown=False
+        self.common_tuxrun(kernel_asset=self.ASSET_I386_KERNEL,
+                           rootfs_asset=self.ASSET_I386_ROOTFS,
+                           drive="virtio-blk-pci")
+
+if __name__ == '__main__':
+    TuxRunBaselineTest.main()
-- 
2.46.1

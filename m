Received: by 2002:a17:505:3501:b0:1be9:327d:8ee3 with SMTP id mc1csp392781njb;
        Fri, 11 Oct 2024 06:20:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWmlhHVq5TV57AHrX2Zk6nrmR95pt65/2pMhUU79T/hR4SlqA5ZtyyzJ0nX/6VB3GRqQoevdT0II5xxlw==@linaro.org
X-Google-Smtp-Source: AGHT+IGe2DrUVT4ECN12vwDfffL1HIv0NFg1431Fx+zWeQ08EqZ2T2jUaRbQTqLyReR/LmftmffY
X-Received: by 2002:a05:6102:e0d:b0:4a3:bb4d:1965 with SMTP id ada2fe7eead31-4a465aefb50mr1690549137.28.1728652841256;
        Fri, 11 Oct 2024 06:20:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728652841; cv=none;
        d=google.com; s=arc-20240605;
        b=QUmJ3+/SsbmjT18TH9biXGbQPvBJdwhfWvGqfB7ren0hu/4+Ln5HqGUmvOFDVDy3Xr
         I7xUIPs4ODVIGec4Ye/DAY13EUWjn4LHNqEw+c3pW3hWQU1MLT2B4LkP/pT0+kQ1jLb0
         KnoqvMk/D8dKdmTjSSeSNzUhRDzHMyxBsdPQzrixBEBc9ILxIbhw1k71iKeOtEkEIqEO
         UnqnYF4ZwE0TgtcbRHsMfAxBt57Dhl343IU6dO7FeWkefsNUahcDDsCesIBIu2AEVsA7
         A1TCPb4n2kY61HIO8EzcrMaW+wI3gSc1xdyKYsr2t8Q1YDIbAPRoKB2VKs84V732tQnf
         DYFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=QKbaSKgzF0euuiH9rV3sdS0N+O3fcLp7omaVV0/V7/U=;
        fh=yV7XiH9Iqz9ECmsY7O4iL5H1OqntXAXD46ZP2pth0HE=;
        b=J5PIlPvYYtASFtxAdwJ/KAuQHWUgsTkgBgAVTSHD+zVNjnK+Xg3BL58dJDfDjEUa+p
         8oMVuKOTxqO8hLxRt2xWQE7CwyyzZKqcNoN8jhPTM6YRKqYnlnhHxE+t+oMIoiaJ/71E
         u0hHdKeaXJDMX82uciME8iAI6DQOsZc0ssgTQtyOAXi50W8CgeLos9jW86/zahi5z7ke
         T/LFoBloHoUrBpP8YD2335lanTrqrmskJhqw9k8L7lGDu8SjYjPFGRKkKtUNusne3hvu
         YzrluZuu4kd6covXrZPid1UsO9DNxwYFf8eO2F8qCYQPlSY7UTgVh+IIk0U/bPA+MP0B
         DLEw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PAF+BjbX;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id ada2fe7eead31-4a457ae8c4fsi1091970137.317.2024.10.11.06.20.41
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 06:20:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PAF+BjbX;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728652840;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QKbaSKgzF0euuiH9rV3sdS0N+O3fcLp7omaVV0/V7/U=;
	b=PAF+BjbXYSrnij6SbFXXgDgsMDPD3jFOTgbslXT6ACLhCXy32AoytuHHCW69zax8v7fDxF
	VA06he7HYlY6aixK9W+5MIZ5YcCUpl5O5TPvN1s2sbSMRwIbMJzNytuINQoNb4n64aBiYI
	W4DfZbQi3zzlLOuNRRAohEnTinLxn6c=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-595-5gVXZP4HOLCtO4r1OzV9Sw-1; Fri,
 11 Oct 2024 09:20:37 -0400
X-MC-Unique: 5gVXZP4HOLCtO4r1OzV9Sw-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 82EBF1955F2E;
	Fri, 11 Oct 2024 13:20:36 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.39.193.77])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 47A1F1955E8F;
	Fri, 11 Oct 2024 13:20:32 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Magnus Damm <magnus.damm@gmail.com>,
	qemu-arm@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Subject: [PATCH 10/17] tests/functional: Convert the Avocado x86_64 tuxrun test
Date: Fri, 11 Oct 2024 15:19:27 +0200
Message-ID: <20241011131937.377223-11-thuth@redhat.com>
In-Reply-To: <20241011131937.377223-1-thuth@redhat.com>
References: <20241011131937.377223-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-TUID: 1Ut1NzIIaypK

Move the tests to a new file so that they can be run via
qemu-system-x86_64 in the functional framework.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/avocado/tuxrun_baselines.py      | 18 -------------
 tests/functional/meson.build           |  1 +
 tests/functional/test_x86_64_tuxrun.py | 36 ++++++++++++++++++++++++++
 3 files changed, 37 insertions(+), 18 deletions(-)
 create mode 100755 tests/functional/test_x86_64_tuxrun.py

diff --git a/tests/avocado/tuxrun_baselines.py b/tests/avocado/tuxrun_baselines.py
index 72b0ad4951..6d00b06713 100644
--- a/tests/avocado/tuxrun_baselines.py
+++ b/tests/avocado/tuxrun_baselines.py
@@ -310,21 +310,3 @@ def test_sh4(self):
         time.sleep(0.1)
         exec_command_and_wait_for_pattern(self, 'halt',
                                           "reboot: System halted")
-
-    def test_x86_64(self):
-        """
-        :avocado: tags=arch:x86_64
-        :avocado: tags=machine:q35
-        :avocado: tags=cpu:Nehalem
-        :avocado: tags=tuxboot:x86_64
-        :avocado: tags=image:bzImage
-        :avocado: tags=root:sda
-        :avocado: tags=shutdown:nowait
-        """
-        sums = { "bzImage" :
-                 "2bc7480a669ee9b6b82500a236aba0c54233debe98cb968268fa230f52f03461",
-                 "rootfs.ext4.zst" :
-                 "b72ac729769b8f51c6dffb221113c9a063c774dbe1d66af30eb593c4e9999b4b" }
-
-        self.common_tuxrun(csums=sums,
-                           drive="driver=ide-hd,bus=ide.0,unit=0")
diff --git a/tests/functional/meson.build b/tests/functional/meson.build
index 9cdfa1c257..84012810f7 100644
--- a/tests/functional/meson.build
+++ b/tests/functional/meson.build
@@ -169,6 +169,7 @@ tests_x86_64_system_quick = [
 
 tests_x86_64_system_thorough = [
   'acpi_bits',
+  'x86_64_tuxrun',
   'linux_initrd',
   'multiprocess',
   'netdev_ethtool',
diff --git a/tests/functional/test_x86_64_tuxrun.py b/tests/functional/test_x86_64_tuxrun.py
new file mode 100755
index 0000000000..4f96139871
--- /dev/null
+++ b/tests/functional/test_x86_64_tuxrun.py
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
+class TuxRunX86Test(TuxRunBaselineTest):
+
+    ASSET_X86_64_KERNEL = Asset(
+        'https://storage.tuxboot.com/20230331/x86_64/bzImage',
+        '2bc7480a669ee9b6b82500a236aba0c54233debe98cb968268fa230f52f03461')
+    ASSET_X86_64_ROOTFS = Asset(
+        'https://storage.tuxboot.com/20230331/x86_64/rootfs.ext4.zst',
+        'b72ac729769b8f51c6dffb221113c9a063c774dbe1d66af30eb593c4e9999b4b')
+
+    def test_x86_64(self):
+        self.set_machine('q35')
+        self.cpu="Nehalem"
+        self.root='sda'
+        self.wait_for_shutdown=False
+        self.common_tuxrun(kernel_asset=self.ASSET_X86_64_KERNEL,
+                           rootfs_asset=self.ASSET_X86_64_ROOTFS,
+                           drive="driver=ide-hd,bus=ide.0,unit=0")
+
+if __name__ == '__main__':
+    TuxRunBaselineTest.main()
-- 
2.46.1

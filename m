Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp743241njb;
        Fri, 6 Dec 2024 02:25:24 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXkFJgkI5aT6GiC4jf+MCj3Q987ARH/0bjBxi/03kCde7rv/EAtwlxDH00hbg4zMq7FuNlPO4ga4VzZ7g==@linaro.org
X-Google-Smtp-Source: AGHT+IHenfz2SrKrV4ISy3JHU+cFjvty5/9VwJhKd9VQNhF6ZmuB/+FlQ7G/yyvrlrIC4rOoVvAD
X-Received: by 2002:a05:6214:2508:b0:6d8:aa45:a8a2 with SMTP id 6a1803df08f44-6d8e70ca4c2mr39261596d6.11.1733480724410;
        Fri, 06 Dec 2024 02:25:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733480724; cv=none;
        d=google.com; s=arc-20240605;
        b=ByWF64bzK++s+CJFw8KoCG9PqQOyby5N1r8ThcCbz7RpkKTI7ZWnN4RNz027Sg6NHD
         NONA7eNSAowyqC8B5OrtVXT68z7nMzxELOptZIxfmemmwV4dkZID2SmvwseH/ypWrEUg
         ALo0FkxrkAd3YizySBcYFW18E3d57d5+nlokmIIqvdPsV5OJMTFhLIoc8T8R0v5nN8YF
         BSOxkJlB0eXFmiIt0VFAUsuTCB9eKCb70ucEJMWAeqYsDoDCoReggxSopB8vp7MwYGYU
         wc4fOQv5MSa0Xku3Q0IswOE8ZcXgLOSy/xUeOUvALAorQNgXKlBCk0b62jpSfIXvl3cF
         MEgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=uC8g8QFglKDuw2tkL7SpqlLG+vvgnZy77t5eIEjM6i0=;
        fh=KGTz8GQ381t6rGFFm+jOvwZM6v3ThNKgE8ZjcBmC+VA=;
        b=N3e6KkE4/zA7NmVgaZV2DiZ0lodDPBmZnOXG7uMCRAWlpPA5JGJmVaQoqC2BcXEt35
         i8hswBV/PGB35ivbKoWWoqwArzDvJd92tJNmF2qi08AA1XhVVgdgv6KtHmEMaZ6NlkrV
         Cnyc3oNfQMIq2P+pdiyZU6Nc7AQOWHiC0wTem4uOOeRzL9tqipplIR/CjCCZG3J2gqfx
         pJC2g4WNB+NEEdwM5uih2aXIzhXq3AOcAPHBzeddPuXztTC5+oi4QAgEJw84REsICd2h
         e52QKDSPHfUUabDHc2BfIFWV8IoDDjUNtsKxIISHCIcSb5KBfvkdJyDOEg2CH3lVd3iz
         JlCQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XyUmP+bQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d8da67a90bsi40012406d6.29.2024.12.06.02.25.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Dec 2024 02:25:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XyUmP+bQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tJVVh-0001Ql-70; Fri, 06 Dec 2024 05:24:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tJVVf-0001Pq-2M
 for qemu-devel@nongnu.org; Fri, 06 Dec 2024 05:24:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tJVVd-00049M-6b
 for qemu-devel@nongnu.org; Fri, 06 Dec 2024 05:24:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733480668;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uC8g8QFglKDuw2tkL7SpqlLG+vvgnZy77t5eIEjM6i0=;
 b=XyUmP+bQTrnGW68aMOKB1e0uBytwu1tREbRnMgYkgBUB/6Vt0tiS3xyUK+ykNhkO0f5CX6
 LmBte7+d+OP29wvymEq60XQS5vhC2nfU3WOzk46UI9BR+eaid9FaZljJ//2MWWNmp713Lf
 eBi3dS1qcGS7hPhdFnxGQKVpTSKu9EE=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-551-7LQWefXdN_Of8aQwQp0iMg-1; Fri,
 06 Dec 2024 05:24:24 -0500
X-MC-Unique: 7LQWefXdN_Of8aQwQp0iMg-1
X-Mimecast-MFC-AGG-ID: 7LQWefXdN_Of8aQwQp0iMg
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 3D2BA195608C; Fri,  6 Dec 2024 10:24:23 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.39.192.66])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 24522300019E; Fri,  6 Dec 2024 10:24:17 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-arm@nongnu.org, Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 3/6] tests/functional: Convert the smdkc210 avocado test
Date: Fri,  6 Dec 2024 11:23:53 +0100
Message-ID: <20241206102358.1186644-4-thuth@redhat.com>
In-Reply-To: <20241206102358.1186644-1-thuth@redhat.com>
References: <20241206102358.1186644-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.996,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: FLfs4SRPYP8E

A straight forward conversion, just the hashsums needed to be
updated to sha256 now.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS                           |  1 +
 tests/avocado/boot_linux_console.py   | 41 -------------------
 tests/functional/meson.build          |  1 +
 tests/functional/test_arm_smdkc210.py | 57 +++++++++++++++++++++++++++
 4 files changed, 59 insertions(+), 41 deletions(-)
 create mode 100755 tests/functional/test_arm_smdkc210.py

diff --git a/MAINTAINERS b/MAINTAINERS
index 435a87b146..9b1c3459b4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -720,6 +720,7 @@ S: Odd Fixes
 F: hw/*/exynos*
 F: include/hw/*/exynos*
 F: docs/system/arm/exynos.rst
+F: tests/functional/test_arm_smdkc210.py
 
 Calxeda Highbank
 M: Rob Herring <robh@kernel.org>
diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux_console.py
index 5d5795e41b..3250168ccf 100644
--- a/tests/avocado/boot_linux_console.py
+++ b/tests/avocado/boot_linux_console.py
@@ -132,47 +132,6 @@ def test_arm_virt(self):
         console_pattern = 'Kernel command line: %s' % kernel_command_line
         self.wait_for_console_pattern(console_pattern)
 
-    def test_arm_exynos4210_initrd(self):
-        """
-        :avocado: tags=arch:arm
-        :avocado: tags=machine:smdkc210
-        :avocado: tags=accel:tcg
-        """
-        deb_url = ('https://snapshot.debian.org/archive/debian/'
-                   '20190928T224601Z/pool/main/l/linux/'
-                   'linux-image-4.19.0-6-armmp_4.19.67-2+deb10u1_armhf.deb')
-        deb_hash = 'fa9df4a0d38936cb50084838f2cb933f570d7d82'
-        deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
-        kernel_path = self.extract_from_deb(deb_path,
-                                            '/boot/vmlinuz-4.19.0-6-armmp')
-        dtb_path = '/usr/lib/linux-image-4.19.0-6-armmp/exynos4210-smdkv310.dtb'
-        dtb_path = self.extract_from_deb(deb_path, dtb_path)
-
-        initrd_url = ('https://github.com/groeck/linux-build-test/raw/'
-                      '2eb0a73b5d5a28df3170c546ddaaa9757e1e0848/rootfs/'
-                      'arm/rootfs-armv5.cpio.gz')
-        initrd_hash = '2b50f1873e113523967806f4da2afe385462ff9b'
-        initrd_path_gz = self.fetch_asset(initrd_url, asset_hash=initrd_hash)
-        initrd_path = os.path.join(self.workdir, 'rootfs.cpio')
-        archive.gzip_uncompress(initrd_path_gz, initrd_path)
-
-        self.vm.set_console()
-        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
-                               'earlycon=exynos4210,0x13800000 earlyprintk ' +
-                               'console=ttySAC0,115200n8 ' +
-                               'random.trust_cpu=off cryptomgr.notests ' +
-                               'cpuidle.off=1 panic=-1 noreboot')
-
-        self.vm.add_args('-kernel', kernel_path,
-                         '-dtb', dtb_path,
-                         '-initrd', initrd_path,
-                         '-append', kernel_command_line,
-                         '-no-reboot')
-        self.vm.launch()
-
-        self.wait_for_console_pattern('Boot successful.')
-        # TODO user command, for now the uart is stuck
-
     def test_arm_cubieboard_initrd(self):
         """
         :avocado: tags=arch:arm
diff --git a/tests/functional/meson.build b/tests/functional/meson.build
index 22b50b7fb3..905afba4a6 100644
--- a/tests/functional/meson.build
+++ b/tests/functional/meson.build
@@ -79,6 +79,7 @@ tests_arm_system_thorough = [
   'arm_integratorcp',
   'arm_orangepi',
   'arm_raspi2',
+  'arm_smdkc210',
   'arm_sx1',
   'arm_vexpress',
   'arm_tuxrun',
diff --git a/tests/functional/test_arm_smdkc210.py b/tests/functional/test_arm_smdkc210.py
new file mode 100755
index 0000000000..967752feeb
--- /dev/null
+++ b/tests/functional/test_arm_smdkc210.py
@@ -0,0 +1,57 @@
+#!/usr/bin/env python3
+#
+# Functional test that boots a Linux kernel and checks the console
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+import os
+import shutil
+
+from qemu_test import LinuxKernelTest, Asset, exec_command_and_wait_for_pattern
+from qemu_test.utils import gzip_uncompress
+
+class Smdkc210Machine(LinuxKernelTest):
+
+    ASSET_DEB = Asset(
+        ('https://snapshot.debian.org/archive/debian/20190928T224601Z/pool/'
+         'main/l/linux/linux-image-4.19.0-6-armmp_4.19.67-2+deb10u1_armhf.deb'),
+        '421804e7579ef40d554c962850dbdf1bfc79f7fa7faec9d391397170dc806c3e')
+
+    ASSET_ROOTFS = Asset(
+        ('https://github.com/groeck/linux-build-test/raw/'
+         '2eb0a73b5d5a28df3170c546ddaaa9757e1e0848/rootfs/arm/'
+         'rootfs-armv5.cpio.gz'),
+        '334b8d256db67a3f2b3ad070aa08b5ade39624e0e7e35b02f4359a577bc8f39b')
+
+    def test_arm_exynos4210_initrd(self):
+        self.set_machine('smdkc210')
+
+        deb_path = self.ASSET_DEB.fetch()
+        kernel_path = self.extract_from_deb(deb_path,
+                                            '/boot/vmlinuz-4.19.0-6-armmp')
+        dtb_path = '/usr/lib/linux-image-4.19.0-6-armmp/exynos4210-smdkv310.dtb'
+        dtb_path = self.extract_from_deb(deb_path, dtb_path)
+
+        initrd_path_gz = self.ASSET_ROOTFS.fetch()
+        initrd_path = os.path.join(self.workdir, 'rootfs.cpio')
+        gzip_uncompress(initrd_path_gz, initrd_path)
+
+        self.vm.set_console()
+        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
+                               'earlycon=exynos4210,0x13800000 earlyprintk ' +
+                               'console=ttySAC0,115200n8 ' +
+                               'random.trust_cpu=off cryptomgr.notests ' +
+                               'cpuidle.off=1 panic=-1 noreboot')
+
+        self.vm.add_args('-kernel', kernel_path,
+                         '-dtb', dtb_path,
+                         '-initrd', initrd_path,
+                         '-append', kernel_command_line,
+                         '-no-reboot')
+        self.vm.launch()
+
+        self.wait_for_console_pattern('Boot successful.')
+        # TODO user command, for now the uart is stuck
+
+if __name__ == '__main__':
+    LinuxKernelTest.main()
-- 
2.47.1


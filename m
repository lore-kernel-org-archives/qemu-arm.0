Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp743298njb;
        Fri, 6 Dec 2024 02:25:32 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUI5LSwKgMTIGUJYECGpQTys5Qia4NKmFTdQsp4TbTUJnj7+Y3jxLTiGWFQHgSCGrZClMH3pOX9iSXYzw==@linaro.org
X-Google-Smtp-Source: AGHT+IGy5YuSw3ws1n27IxvHFiK4JO0JLtJ3ytmmnGn0gbnnVu/YFWFRleHtH/J1errFUxZ7T8I9
X-Received: by 2002:a05:620a:4111:b0:7b6:742d:c01b with SMTP id af79cd13be357-7b6bcaef25fmr370931185a.29.1733480732712;
        Fri, 06 Dec 2024 02:25:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733480732; cv=none;
        d=google.com; s=arc-20240605;
        b=D3qAFD1/Qw+3/TR1dLkjRbxsdD4xhEOtomLVyDwYzReE7rHq/6HKqGu1WZojVe/Ymc
         TgmKpsnWja0L/E/uxpahmlY0DOag0xHty421QCNqU1bIEIWoMi9HX06SkMYXyrV0j8s5
         yZlw0oEUMF4ohewK83NfeMfSjzeghVcxrJpwYfOVqzUhrqQFXQaimoo1nGoz7uZXsZYs
         1caU+Al4C3YMflXLWnnGL2gmZ/wYouIAmEYz3HfxuhAoPVKBNTf0ztiz2Skx/0q9eC4x
         Z2BjJ0bAXKlZy5slqOOtLgnhou5sG8dKmgN/KaqNdaWaFLS6IbEw9+IRnJ+lgYVPXqsU
         4BlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=GOOECmvCu9++h/pqmuDbl8ct5X1Y32mYSr3VFgIxu3I=;
        fh=KGTz8GQ381t6rGFFm+jOvwZM6v3ThNKgE8ZjcBmC+VA=;
        b=OpXDDpbbDBqyW9RtMAfKPMxCs6TJI+IgafgPyqOzWJZCLg5fQXossX7dYJ4OMa8hTO
         T5BVD9cLWiU7TTdT6UVGckoZzHOQJbje3rcuWYlNiV+B6uJc45lsuLpksF13DxHUwz+y
         eQckLxQC8LvtAoN64DQWs0yqSYOdr1vv53DFRYWYK7MxvNDc106wHFF0MR3enNavAIbE
         4DGsAG40+xD9056VRk1fB1sItursWcl8yYf5S5xSwXpL7OOlDG6jzlJrqzTWHSSS5ezF
         U9o9OHDa1dqopFFZZEWjhdY3r+IVAadcQKlexLgSeWOuCCWF2qT/0rbB9EiYMse46o2b
         8PzA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PkESzBzk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b6b5abd604si375234085a.570.2024.12.06.02.25.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Dec 2024 02:25:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PkESzBzk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tJVVZ-0001OP-HU; Fri, 06 Dec 2024 05:24:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tJVVX-0001Nl-W7
 for qemu-arm@nongnu.org; Fri, 06 Dec 2024 05:24:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tJVVV-00047q-R3
 for qemu-arm@nongnu.org; Fri, 06 Dec 2024 05:24:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733480659;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GOOECmvCu9++h/pqmuDbl8ct5X1Y32mYSr3VFgIxu3I=;
 b=PkESzBzkhjv6NhnbfrrH5S10hVUBvwsvTsw/tlBzPeSwt8jvOpaPUIjzbbD36Y1Bwz9xft
 wxDE2aDCOjZNWaTIsAgjG3Wv8gt0ZCqDmV/jyqXY0gIUfad5vNxLdkpAlbZnpub8sQ/cjv
 WM+ootCmErYFJzGOBECqyuf2hXpU/0c=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-90-pObNITcsP1mMRW-OpDO77w-1; Fri,
 06 Dec 2024 05:24:14 -0500
X-MC-Unique: pObNITcsP1mMRW-OpDO77w-1
X-Mimecast-MFC-AGG-ID: pObNITcsP1mMRW-OpDO77w
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 469E119560AB; Fri,  6 Dec 2024 10:24:12 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.39.192.66])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 72C05300019E; Fri,  6 Dec 2024 10:24:06 +0000 (UTC)
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
Subject: [PATCH 1/6] tests/functional: Convert the xlnx_versal_virt avocado
 test
Date: Fri,  6 Dec 2024 11:23:51 +0100
Message-ID: <20241206102358.1186644-2-thuth@redhat.com>
In-Reply-To: <20241206102358.1186644-1-thuth@redhat.com>
References: <20241206102358.1186644-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.996,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: t67B9Qh6KahS

A straight-forward conversion of the xlnx_versal_virt boot
test to the functional framework.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS                                  |  1 +
 tests/avocado/boot_linux_console.py          | 27 --------------
 tests/functional/meson.build                 |  1 +
 tests/functional/test_aarch64_xlnx_versal.py | 37 ++++++++++++++++++++
 4 files changed, 39 insertions(+), 27 deletions(-)
 create mode 100755 tests/functional/test_aarch64_xlnx_versal.py

diff --git a/MAINTAINERS b/MAINTAINERS
index 727f18fae5..86cac83221 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1025,6 +1025,7 @@ F: hw/display/dpcd.c
 F: include/hw/display/dpcd.h
 F: docs/system/arm/xlnx-versal-virt.rst
 F: docs/system/arm/xlnx-zcu102.rst
+F: tests/functional/test_aarch64_xlnx_versal.py
 
 Xilinx Versal OSPI
 M: Francisco Iglesias <francisco.iglesias@amd.com>
diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux_console.py
index 12e24bb05a..44ee50c469 100644
--- a/tests/avocado/boot_linux_console.py
+++ b/tests/avocado/boot_linux_console.py
@@ -116,33 +116,6 @@ def test_x86_64_pc(self):
         console_pattern = 'Kernel command line: %s' % kernel_command_line
         self.wait_for_console_pattern(console_pattern)
 
-    def test_aarch64_xlnx_versal_virt(self):
-        """
-        :avocado: tags=arch:aarch64
-        :avocado: tags=machine:xlnx-versal-virt
-        :avocado: tags=device:pl011
-        :avocado: tags=device:arm_gicv3
-        :avocado: tags=accel:tcg
-        """
-        images_url = ('http://ports.ubuntu.com/ubuntu-ports/dists/'
-                      'bionic-updates/main/installer-arm64/'
-                      '20101020ubuntu543.19/images/')
-        kernel_url = images_url + 'netboot/ubuntu-installer/arm64/linux'
-        kernel_hash = 'e167757620640eb26de0972f578741924abb3a82'
-        kernel_path = self.fetch_asset(kernel_url, asset_hash=kernel_hash)
-
-        initrd_url = images_url + 'netboot/ubuntu-installer/arm64/initrd.gz'
-        initrd_hash = 'cab5cb3fcefca8408aa5aae57f24574bfce8bdb9'
-        initrd_path = self.fetch_asset(initrd_url, asset_hash=initrd_hash)
-
-        self.vm.set_console()
-        self.vm.add_args('-m', '2G',
-                         '-accel', 'tcg',
-                         '-kernel', kernel_path,
-                         '-initrd', initrd_path)
-        self.vm.launch()
-        self.wait_for_console_pattern('Checked W+X mappings: passed')
-
     def test_arm_virt(self):
         """
         :avocado: tags=arch:arm
diff --git a/tests/functional/meson.build b/tests/functional/meson.build
index 0558d0aa4e..698fb4976d 100644
--- a/tests/functional/meson.build
+++ b/tests/functional/meson.build
@@ -58,6 +58,7 @@ tests_aarch64_system_thorough = [
   'aarch64_sbsaref_freebsd',
   'aarch64_tuxrun',
   'aarch64_virt',
+  'aarch64_xlnx_versal',
   'multiprocess',
 ]
 
diff --git a/tests/functional/test_aarch64_xlnx_versal.py b/tests/functional/test_aarch64_xlnx_versal.py
new file mode 100755
index 0000000000..4b9c49e5d6
--- /dev/null
+++ b/tests/functional/test_aarch64_xlnx_versal.py
@@ -0,0 +1,37 @@
+#!/usr/bin/env python3
+#
+# Functional test that boots a Linux kernel and checks the console
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+from qemu_test import LinuxKernelTest, Asset
+
+class XlnxVersalVirtMachine(LinuxKernelTest):
+
+    ASSET_KERNEL = Asset(
+        ('http://ports.ubuntu.com/ubuntu-ports/dists/bionic-updates/main/'
+         'installer-arm64/20101020ubuntu543.19/images/netboot/'
+         'ubuntu-installer/arm64/linux'),
+        'ce54f74ab0b15cfd13d1a293f2d27ffd79d8a85b7bb9bf21093ae9513864ac79')
+
+    ASSET_INITRD = Asset(
+        ('http://ports.ubuntu.com/ubuntu-ports/dists/bionic-updates/main/'
+         'installer-arm64/20101020ubuntu543.19/images/netboot/'
+         '/ubuntu-installer/arm64/initrd.gz'),
+        'e7a5e716b6f516d8be315c06e7331aaf16994fe4222e0e7cfb34bc015698929e')
+
+    def test_aarch64_xlnx_versal_virt(self):
+        self.set_machine('xlnx-versal-virt')
+        kernel_path = self.ASSET_KERNEL.fetch()
+        initrd_path = self.ASSET_INITRD.fetch()
+
+        self.vm.set_console()
+        self.vm.add_args('-m', '2G',
+                         '-accel', 'tcg',
+                         '-kernel', kernel_path,
+                         '-initrd', initrd_path)
+        self.vm.launch()
+        self.wait_for_console_pattern('Checked W+X mappings: passed')
+
+if __name__ == '__main__':
+    LinuxKernelTest.main()
-- 
2.47.1


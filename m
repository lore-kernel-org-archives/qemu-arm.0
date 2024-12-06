Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp743129njb;
        Fri, 6 Dec 2024 02:25:06 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUoHZFaFROm9jMMGK8O/OzZ9/pie6kdYUABxcm9HqMNTmX3GK5saOgjnNqlRKvcN7LoCOmxCKGAXDO0og==@linaro.org
X-Google-Smtp-Source: AGHT+IGr3apnbvlmZoIRMxvGAsbkrgSqYjt9WufKJqX27XUeGv0CHRSYYDCN8gaGhw+KDMSn3GHg
X-Received: by 2002:ac8:5907:0:b0:466:9f00:e766 with SMTP id d75a77b69052e-467349b7a14mr40609891cf.24.1733480706155;
        Fri, 06 Dec 2024 02:25:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733480706; cv=none;
        d=google.com; s=arc-20240605;
        b=X17fdB27mU6l7LgDTD0pSqiP6Tinbc94wiVY73BlfW2XmWBLGEqfVZE6dDq6jkCL6v
         InQea3WK3y80ZV5naP0ZeApg0X/qLkCCGhwpYdwpnOocbwkoYUw7X/fFMmDmT4rHva+1
         fiqoyd3yEqTNx7NxmIrtgm+0ReeZ+b4Jnmu8CPn9bejvyRcteSh1DPdsrRSI84xtTo/m
         TkxtA7eENaIGM3L3Gsg0/fhWIqCS+44X58vCvDEzgdKrkNPxhkaJyqjd/xN2ZOxXN0nZ
         tRjDo1Fv0bS0M+UlgtXf9ofKWUmikpZms2zz25Qsoti1DcCU7JJM8l99vsrtaiWgryQx
         smLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=+tFSsaOIj9ywxwE+5dMgKMIsb/GEwbLSEl1YETXlzQw=;
        fh=KGTz8GQ381t6rGFFm+jOvwZM6v3ThNKgE8ZjcBmC+VA=;
        b=iqpYjHkD+xKMIYy+a5N8B8UtAf8DHATxhzLm7llGqhv46z8WSQ1AG+KHiA50OzoHqf
         7JqixHXUdcurSpRhAnbp4EHEohHJLOK5+NdZer9+W42nXoTvu/vyIjwYDaDSk4+gmSQL
         ZoF4xdejAikgD25nnogU06MgpN0p/2egWe2U+0C1xfjMITqc8QiB71uIygWzKKjvZYZt
         10Ssc736oEWes/KqL7P/Gg2+YmN6bD6txzXVDIyYmpPv1wTNebqSaCdf2zOauOfy/bmE
         wom7xCkHQpRIaewDDOAdohL1hcR1fkYUU8XOY5wJTflXzVE8PrwGD6zTEMqH+Saogxnk
         6MCg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Z8GGRlkC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-467296b5185si45512871cf.129.2024.12.06.02.25.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Dec 2024 02:25:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Z8GGRlkC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tJVVz-0001UN-4L; Fri, 06 Dec 2024 05:24:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tJVVw-0001TX-QP
 for qemu-devel@nongnu.org; Fri, 06 Dec 2024 05:24:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tJVVv-0004BA-7U
 for qemu-devel@nongnu.org; Fri, 06 Dec 2024 05:24:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733480686;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+tFSsaOIj9ywxwE+5dMgKMIsb/GEwbLSEl1YETXlzQw=;
 b=Z8GGRlkCTO5TqcvfiSNCW54ZswxB7MJUoMqRHN138/cjbuHFjpfPsRsWxpNw+tHhlEovSw
 aKbSNcEHoxpAt5KD14AeibCQHPJUrQh6BXrV5TYyt9zHVD35ve1yy8gxKkQhpQbgV+tLk+
 E6kjRDTBZy8pu+XGNHPDTwO3M35SVI8=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-33-KRYg1TkOPiisCLDfh4QhVw-1; Fri,
 06 Dec 2024 05:24:41 -0500
X-MC-Unique: KRYg1TkOPiisCLDfh4QhVw-1
X-Mimecast-MFC-AGG-ID: KRYg1TkOPiisCLDfh4QhVw
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 9BEBA1956087; Fri,  6 Dec 2024 10:24:39 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.39.192.66])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id EDA92300019E; Fri,  6 Dec 2024 10:24:34 +0000 (UTC)
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
Subject: [PATCH 6/6] tests/functional: Convert the arm virt avocado test
Date: Fri,  6 Dec 2024 11:23:56 +0100
Message-ID: <20241206102358.1186644-7-thuth@redhat.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: aaXZPhdRIHjD

Straight forward conversion, basically just the hashsums needed
to be updated to sha256 now.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/avocado/boot_linux_console.py | 21 --------------------
 tests/functional/meson.build        |  1 +
 tests/functional/test_arm_virt.py   | 30 +++++++++++++++++++++++++++++
 3 files changed, 31 insertions(+), 21 deletions(-)
 create mode 100755 tests/functional/test_arm_virt.py

diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux_console.py
index 5bc1c68af9..3bedff0d1f 100644
--- a/tests/avocado/boot_linux_console.py
+++ b/tests/avocado/boot_linux_console.py
@@ -95,27 +95,6 @@ def test_x86_64_pc(self):
         console_pattern = 'Kernel command line: %s' % kernel_command_line
         self.wait_for_console_pattern(console_pattern)
 
-    def test_arm_virt(self):
-        """
-        :avocado: tags=arch:arm
-        :avocado: tags=machine:virt
-        :avocado: tags=accel:tcg
-        """
-        kernel_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
-                      '/linux/releases/29/Everything/armhfp/os/images/pxeboot'
-                      '/vmlinuz')
-        kernel_hash = 'e9826d741b4fb04cadba8d4824d1ed3b7fb8b4d4'
-        kernel_path = self.fetch_asset(kernel_url, asset_hash=kernel_hash)
-
-        self.vm.set_console()
-        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
-                               'console=ttyAMA0')
-        self.vm.add_args('-kernel', kernel_path,
-                         '-append', kernel_command_line)
-        self.vm.launch()
-        console_pattern = 'Kernel command line: %s' % kernel_command_line
-        self.wait_for_console_pattern(console_pattern)
-
     def test_arm_ast2600_debian(self):
         """
         :avocado: tags=arch:arm
diff --git a/tests/functional/meson.build b/tests/functional/meson.build
index c7abda61d2..30c3eda7e4 100644
--- a/tests/functional/meson.build
+++ b/tests/functional/meson.build
@@ -86,6 +86,7 @@ tests_arm_system_thorough = [
   'arm_smdkc210',
   'arm_sx1',
   'arm_vexpress',
+  'arm_virt',
   'arm_tuxrun',
 ]
 
diff --git a/tests/functional/test_arm_virt.py b/tests/functional/test_arm_virt.py
new file mode 100755
index 0000000000..7b6549176f
--- /dev/null
+++ b/tests/functional/test_arm_virt.py
@@ -0,0 +1,30 @@
+#!/usr/bin/env python3
+#
+# Functional test that boots a Linux kernel and checks the console
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+from qemu_test import LinuxKernelTest, Asset
+
+class ArmVirtMachine(LinuxKernelTest):
+
+    ASSET_KERNEL = Asset(
+        ('https://archives.fedoraproject.org/pub/archive/fedora/linux/'
+         'releases/29/Everything/armhfp/os/images/pxeboot/vmlinuz'),
+        '18dd5f1a9a28bd539f9d047f7c0677211bae528e8712b40ca5a229a4ad8e2591')
+
+    def test_arm_virt(self):
+        self.set_machine('virt')
+        kernel_path = self.ASSET_KERNEL.fetch()
+
+        self.vm.set_console()
+        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
+                               'console=ttyAMA0')
+        self.vm.add_args('-kernel', kernel_path,
+                         '-append', kernel_command_line)
+        self.vm.launch()
+        console_pattern = 'Kernel command line: %s' % kernel_command_line
+        self.wait_for_console_pattern(console_pattern)
+
+if __name__ == '__main__':
+    LinuxKernelTest.main()
-- 
2.47.1


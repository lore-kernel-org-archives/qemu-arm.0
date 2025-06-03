Received: by 2002:a17:504:1b46:b0:1be9:327d:8ee3 with SMTP id t6csp3313103njh;
        Tue, 3 Jun 2025 03:16:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUvZ3FeIvqmvggvQ+9kkg3DpVFj3Q8MmH7/9Bb9N9IImUbh9Une2ArJ80KD0y6bnlrQTd/Sp9O/7P3n9g==@linaro.org
X-Google-Smtp-Source: AGHT+IHkZR+SE1sKF9wm9zdBkOa5AtaYnfwCvREPrCZf11BYTxdoUWYpCaYoX8VzVhMd9S+7vkHa
X-Received: by 2002:a05:622a:410f:b0:4a2:719b:122e with SMTP id d75a77b69052e-4a443ef403cmr252363661cf.18.1748945774397;
        Tue, 03 Jun 2025 03:16:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748945774; cv=none;
        d=google.com; s=arc-20240605;
        b=l0otfpbVI+Ie3ePrO1IsDQhiwUuXMUJV+GgmvouAsSqN+gVRC79qUTsrCxKwwM2ZS1
         vbzRElUxRUwqH/G44OVhFo9HZ5rOIAv35L3wb1bkyDySSj4oQGpox+KqbURLBBdfefnq
         dOCfeU9L+JS4r8QrggM6HUcctkJeFtGt4eCGPEwe3sywj0HjusehirXpjhuwWar5dHM8
         7hZEuUbMjxzHQfMywW6ZHdaHyWFnk6lwBt5l8PRInkJr8tgTNH7PGhnM9VJM5JdX403L
         F9/xMIv1rW5fMGdrcDsHHvz3Q0pGopr6Yuyye2IdXHNzl+K7heGU24vJVJE2IBrww4NL
         BbSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=V6UyugGoJ5KQ0WbdVMn8DUL7G+nKcpnfRgoxGN1aZtk=;
        fh=4NJrHZ6uIiC4/czr48SnT9axGZ4obZmaxNWhbc8xZJo=;
        b=VGO7w6ot/ieGwNO3O9pfF6OolpWZe4qDkxrHIfIL0yn3r2yMGLHT0zzXUyOY0MQS3D
         NqUlulLgTvXXu4m9AN/y4kaiNxZccNQM4X62GOEw0GsN9fRTpr+8YyZD+4CfzZGKf1vQ
         qz/0Hx0FnhsBkxX/YCyJnt5Zkc05A/ndO9woksVfAh2slQBIwpSC2sVMWG++K2EY9BX7
         zvCCIbvZ3wBuqQqq6rq2RS2Xu2/rsGZvg/Xd1IjWkUNT5Oo33QmvStH9WPO1gstCUuNX
         zou6g5/2Qw9bZDLDU0ykG70t1BBoitmFPBiOiFnqNJ6buDLT1GoEvKxuMSCirASLVBMn
         +ZVQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Tq+aJ7oh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a4359f2845si124118461cf.321.2025.06.03.03.16.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Jun 2025 03:16:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Tq+aJ7oh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uMOgR-0005dH-Kc; Tue, 03 Jun 2025 06:15:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1uMOgQ-0005cX-0i
 for qemu-arm@nongnu.org; Tue, 03 Jun 2025 06:15:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1uMOgO-00054t-4r
 for qemu-arm@nongnu.org; Tue, 03 Jun 2025 06:15:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748945744;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=V6UyugGoJ5KQ0WbdVMn8DUL7G+nKcpnfRgoxGN1aZtk=;
 b=Tq+aJ7oh4HJwq5NC22hrEfUzIMZyXoEgDl8TTnbQ/GuZDH13rP676jLDdlsNbvq9VUd5Iq
 c/ypHI58fmeXAJAxIFOFS2hcSspNhrt2mbAClCDi5+5ErXNwm8c35fcIWU947lWLFcX2G/
 SGB9Z6k2uufpo/tqgLvQceSF3YvkDKg=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-422-wQskYtlNMxiu2l8qbg6Qtg-1; Tue,
 03 Jun 2025 06:15:42 -0400
X-MC-Unique: wQskYtlNMxiu2l8qbg6Qtg-1
X-Mimecast-MFC-AGG-ID: wQskYtlNMxiu2l8qbg6Qtg_1748945741
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 691FF1800261; Tue,  3 Jun 2025 10:15:41 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.45.226.8])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id DF3CF30002C2; Tue,  3 Jun 2025 10:15:38 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org
Subject: [PATCH] tests/functional: Add a test for the realview-eb-mpcore
 machine
Date: Tue,  3 Jun 2025 12:15:26 +0200
Message-ID: <20250603101526.21217-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.015,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: McUXEKI/MsxK

From: Thomas Huth <thuth@redhat.com>

Check that we can boot a Linux kernel here and that we can at
least send one ping network packet.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS                           |  1 +
 tests/functional/meson.build          |  1 +
 tests/functional/test_arm_realview.py | 47 +++++++++++++++++++++++++++
 3 files changed, 49 insertions(+)
 create mode 100755 tests/functional/test_arm_realview.py

diff --git a/MAINTAINERS b/MAINTAINERS
index 16af37986a4..0d1023635ee 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -954,6 +954,7 @@ F: hw/cpu/realview_mpcore.c
 F: hw/intc/realview_gic.c
 F: include/hw/intc/realview_gic.h
 F: docs/system/arm/realview.rst
+F: tests/functional/test_arm_realview.py
 
 SABRELITE / i.MX6
 M: Peter Maydell <peter.maydell@linaro.org>
diff --git a/tests/functional/meson.build b/tests/functional/meson.build
index 557d59ddf4d..0de1caa0f72 100644
--- a/tests/functional/meson.build
+++ b/tests/functional/meson.build
@@ -135,6 +135,7 @@ tests_arm_system_thorough = [
   'arm_orangepi',
   'arm_quanta_gsj',
   'arm_raspi2',
+  'arm_realview',
   'arm_replay',
   'arm_smdkc210',
   'arm_stellaris',
diff --git a/tests/functional/test_arm_realview.py b/tests/functional/test_arm_realview.py
new file mode 100755
index 00000000000..82cc964333e
--- /dev/null
+++ b/tests/functional/test_arm_realview.py
@@ -0,0 +1,47 @@
+#!/usr/bin/env python3
+#
+# Functional test that boots a Linux kernel on a realview arm machine
+# and checks the console
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+from qemu_test import LinuxKernelTest, exec_command_and_wait_for_pattern
+from qemu_test import Asset
+
+
+class RealviewMachine(LinuxKernelTest):
+
+    ASSET_REALVIEW_MPCORE = Asset(
+        ('https://archive.openwrt.org/chaos_calmer/15.05.1/realview/generic/'
+         'openwrt-15.05.1-realview-vmlinux-initramfs.elf'),
+        'd3a01037f33e7512d46d50975588d5c3a0e0cbf25f37afab44775c2a2be523e6')
+
+    def test_realview_ep_mpcore(self):
+        self.require_netdev('user')
+        self.set_machine('realview-eb-mpcore')
+        kernel_path = self.ASSET_REALVIEW_MPCORE.fetch()
+        self.vm.set_console()
+        kernel_param = 'console=ttyAMA0 mem=128M quiet'
+        self.vm.add_args('-kernel', kernel_path,
+                         '-append', kernel_param)
+        self.vm.launch()
+        self.wait_for_console_pattern('Please press Enter to activate')
+        prompt = ':/#'
+        exec_command_and_wait_for_pattern(self, '', prompt)
+        exec_command_and_wait_for_pattern(self, 'dmesg', kernel_param)
+        self.wait_for_console_pattern(prompt)
+        exec_command_and_wait_for_pattern(self,
+                ('while ! dmesg | grep "br-lan: port 1(eth0) entered" ;'
+                 ' do sleep 1 ; done'),
+                'entered forwarding state')
+        self.wait_for_console_pattern(prompt)
+        exec_command_and_wait_for_pattern(self,
+                'while ! ifconfig | grep "10.0.2.15" ; do sleep 1 ; done',
+                'addr:10.0.2.15')
+        self.wait_for_console_pattern(prompt)
+        exec_command_and_wait_for_pattern(self, 'ping -c 1 10.0.2.2',
+                                          '1 packets received, 0% packet loss')
+
+
+if __name__ == '__main__':
+    LinuxKernelTest.main()
-- 
2.49.0


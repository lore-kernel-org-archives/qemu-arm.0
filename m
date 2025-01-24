Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp706550njk;
        Fri, 24 Jan 2025 02:17:50 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUhvWdEF07yfo+n6PKeAGPMNso8hp9Xm4bnUoHDmFL7Mqsue1jpSNdtzXT5tmWofIaJWA9h8bxCLCFoaw==@linaro.org
X-Google-Smtp-Source: AGHT+IET8epKxyajVxSPhjGBWtcYoxPs0qaedBxEZdnUeeL7d6BKD4wpzjBvqaE9QX3pF49fMKZX
X-Received: by 2002:a05:622a:4c:b0:468:f722:d44c with SMTP id d75a77b69052e-46e12a3fa99mr465406201cf.21.1737713870439;
        Fri, 24 Jan 2025 02:17:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737713870; cv=none;
        d=google.com; s=arc-20240605;
        b=XX9DWhoFGOse1oIKDsFFRHhl7ZMhsR4xGe7H6PM0utVN6cjZDcEPVgQrvDYZ8qq4Ro
         iNYu1XLIZDM8tPw8A1yZ9gxSsslLfCX1vo8FyjlXK02xFCTqkKv2mhFgpPgyN7XR2Av/
         KaGNA7oj/ZBy9+nVuv2Zq2G6xbj3RwJ9SHcfcwyN6ZmjamSL4yvlaD/bTF3VgIWRqioE
         D8O3kTQRZGUHzoZ6N/Cy4AZEgv1H+ZvjOGi61g7MKmf2Nuq9TaM4cTcnmzPUSEabJeY4
         ZDhm3skdmtyFPCojkO7FAxPwOEfVG6r2USK3AjkVxsLtGGyZYz0yV1rgcuhdsk8qJBn8
         6HGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=vQYBHD9hzClbokCnuOdauP9wECJ0iVrnacoIeBvNGmA=;
        fh=I9zZPHoK1sP0kehnWCQom1jIpW6Umnh4es3raojX3H8=;
        b=VE1Gs9Lxxkgq2+uqDTB17cxecgURA4R89uVicU9SFAg/me0nyd8KhnajHciiuYRDAn
         dRU2ZZTvKnMW0MtrqavBC+YFDwp8IeSsk+VGjHM4s1rbXTzyEk2DvwLbzAEnSTwuNqyq
         CQROZAOviP9oWKBUCFlZquIUyuqgPnVjzwzn5e2mFlPrge9jRdXAiuJODz+izdqFcfb+
         /kHWhJ2T4CUwPOljguqRgiw7QUk8ICQgSSJfbuG8Ae1HuGTRr8LCfmvPiRI9re5qIA3b
         G2tf7sSkuR9KHGPmW9I+oB6tLe6VUYav+jqeCAh0wg3Kmc5JXPlXWI1CPGNW9G/yNcY7
         PWQQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HReeRRw7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46e66ba5832si21498991cf.500.2025.01.24.02.17.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jan 2025 02:17:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HReeRRw7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tbGkl-0003YA-91; Fri, 24 Jan 2025 05:17:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tbGki-0003XT-MA
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 05:17:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tbGkf-0008Pg-83
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 05:17:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737713843;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=vQYBHD9hzClbokCnuOdauP9wECJ0iVrnacoIeBvNGmA=;
 b=HReeRRw7qMkbkfYpZqYsoqsIo2uGlbo25JVJLg4q+8EXEH3woqGRKhpwJkGS0UOhuj8FY+
 lghFk7CDQiBGPFYAt0raU1xF8cXBtQkCDNtulg6OyBHoOutnR7MGe85XsLo5L7rNObARhY
 aPZOTg/SrBDLK+qd1TcD5mfj7dDqKoI=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-85-s4kvdhQYMlmPViSXGLq8Ng-1; Fri,
 24 Jan 2025 05:17:21 -0500
X-MC-Unique: s4kvdhQYMlmPViSXGLq8Ng-1
X-Mimecast-MFC-AGG-ID: s4kvdhQYMlmPViSXGLq8Ng
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id C8D8219560B1; Fri, 24 Jan 2025 10:17:18 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.39.194.200])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id A45671800358; Fri, 24 Jan 2025 10:17:11 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH] tests/functional: Add a test for the arm microbit machine
Date: Fri, 24 Jan 2025 11:17:09 +0100
Message-ID: <20250124101709.1591761-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.996,
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
X-TUID: ARNKcusz12A9

We don't have any functional tests for this machine yet, thus let's
add a test with a MicroPython binary that is available online
(thanks to Joel Stanley for providing it, see:
 https://www.mail-archive.com/qemu-devel@nongnu.org/msg606064.html ).

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS                           |  1 +
 tests/functional/meson.build          |  1 +
 tests/functional/test_arm_microbit.py | 31 +++++++++++++++++++++++++++
 3 files changed, 33 insertions(+)
 create mode 100755 tests/functional/test_arm_microbit.py

diff --git a/MAINTAINERS b/MAINTAINERS
index 1d9b3a0011..7b4d84bf5f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1157,6 +1157,7 @@ F: hw/*/microbit*.c
 F: include/hw/*/nrf51*.h
 F: include/hw/*/microbit*.h
 F: tests/qtest/microbit-test.c
+F: tests/functional/test_arm_microbit.py
 F: docs/system/arm/nrf.rst
 
 ARM PL011 Rust device
diff --git a/tests/functional/meson.build b/tests/functional/meson.build
index bcfbb70b65..a301c38806 100644
--- a/tests/functional/meson.build
+++ b/tests/functional/meson.build
@@ -105,6 +105,7 @@ tests_arm_system_thorough = [
   'arm_cubieboard',
   'arm_emcraft_sf2',
   'arm_integratorcp',
+  'arm_microbit',
   'arm_orangepi',
   'arm_quanta_gsj',
   'arm_raspi2',
diff --git a/tests/functional/test_arm_microbit.py b/tests/functional/test_arm_microbit.py
new file mode 100755
index 0000000000..68ea4e73d6
--- /dev/null
+++ b/tests/functional/test_arm_microbit.py
@@ -0,0 +1,31 @@
+#!/usr/bin/env python3
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+#
+# Copyright 2025, The QEMU Project Developers.
+#
+# A functional test that runs MicroPython on the arm microbit machine.
+
+from qemu_test import QemuSystemTest, Asset, exec_command_and_wait_for_pattern
+from qemu_test import wait_for_console_pattern
+
+
+class MicrobitMachine(QemuSystemTest):
+
+    ASSET_MICRO = Asset('https://ozlabs.org/~joel/microbit-micropython.hex',
+        '021641f93dfb11767d4978dbb3ca7f475d1b13c69e7f4aec3382f212636bffd6')
+
+    def test_arm_microbit(self):
+        self.set_machine('microbit')
+
+        micropython = self.ASSET_MICRO.fetch()
+        self.vm.set_console()
+        self.vm.add_args('-device', f'loader,file={micropython}')
+        self.vm.launch()
+        wait_for_console_pattern(self, 'Type "help()" for more information.')
+        exec_command_and_wait_for_pattern(self, 'import machine as mch', '>>>')
+        exec_command_and_wait_for_pattern(self, 'mch.reset()', 'MicroPython')
+        wait_for_console_pattern(self, '>>>')
+
+if __name__ == '__main__':
+    QemuSystemTest.main()
-- 
2.48.1


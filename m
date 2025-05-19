Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp4255698njb;
        Mon, 19 May 2025 10:03:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVLeMqfch+ZHi1K4uc+Opzf2iXVLU4zGgMHRCGfoV8TZQx1PxW/tSO6UDdnvWAbyEQt2UvS0ilYtzWRrw==@linaro.org
X-Google-Smtp-Source: AGHT+IGUkilJUSlkV6aXkHyeHjTTAseGaUqoy+E/xUtuElBgQkfqdjBQVXTh5JM/Ygg7MSDhUWcF
X-Received: by 2002:a05:6e02:3e06:b0:3d8:2023:d048 with SMTP id e9e14a558f8ab-3db84377bbdmr139826575ab.22.1747674202110;
        Mon, 19 May 2025 10:03:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747674202; cv=none;
        d=google.com; s=arc-20240605;
        b=Uu1p3c6HXyyrZSsWSUMgprb55KwiA3EI2nX804nL0P2qpalI0lf72+Ys+y0W24o+Wp
         HThavzArWw9cKWvhJ0PRJ0xA3DhAkuyBlQANm9N/eWLQsqBXE07KBePQgAxYgC1nooSZ
         K4+4XcrKkw8Drr6N5CnrlZYXelF5ijAdKBSZoMHofZl7vgirfGb6uu3K3+pw62nWAfAb
         OTOvM81Cf8VIRxJAv4tQkZ+ue3JlAi9eYy8bP32t1CJ3uFQXVP9l2UpPjKorakcyzOZz
         QuLfiJrgShWUqR6QfsTLa9EJ6skIcal0OWz9qdyUShW9Q8rWwGaGHWKqQC3T+td/RCRZ
         0p6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=GF1TnPinob2l4EmXUL83/ChqDdovsfU8ISM22SPljTo=;
        fh=+zJVLDy5OjugktatOy7hRhbg4DknhfGfCoDmuv0g+Bs=;
        b=f4BS/C05rmlNoPHybbTABkD+wFWnZoDsmZPhJKfYhc8P3a48nQ1GUnPz9r8i0AdG2N
         4BLuQSck4laScEPR3SFlpWosgzf1VbPGCvKOFPEJOj5KO99VkyeFvSs7kF8MVBkMqLap
         Au4xsmCiMLsirKMIEnCGyMhHTRGw+XPOEhZHEREZTtx9PQWQglD5hI5eDMlGBu6hAuZc
         0oXHf8MmUkq6wQ9ykyL0V7eS9GxneuXo5vkP6xSOawC8bnQf//FDUOVB5nyQW9ECRVUW
         vccTs6+meBghedXKt5V/ixkkHej9fuqYckXCT2yqB+/l9D40EXYkWyxkpb4wVN4Yt8Lz
         4vXg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JMetNqN1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e9e14a558f8ab-3dc760193ecsi14371305ab.57.2025.05.19.10.03.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 May 2025 10:03:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JMetNqN1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uH3tE-0000DC-6Q; Mon, 19 May 2025 13:03:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1uH3t9-0008Vl-QS
 for qemu-arm@nongnu.org; Mon, 19 May 2025 13:02:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1uH3t7-0000Sk-H4
 for qemu-arm@nongnu.org; Mon, 19 May 2025 13:02:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747674171;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=GF1TnPinob2l4EmXUL83/ChqDdovsfU8ISM22SPljTo=;
 b=JMetNqN1BE2O5Wbt47qjbjEbTpqwpVyfSNbJO6grQEXc+RIydyPEMwaTDuZwh+SiiK5gt5
 uxpgfeZgWiursZhifWsvqmejzjkSZAo6siCwQYfIs2qbQVdb7sJZo76hiU/E5LWd8TnkG5
 6otUyrt03MPwOfpgCNo3RLXZFjIKN94=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-639-zeCuMcZEPyydS8Yh9SiOYg-1; Mon,
 19 May 2025 13:02:49 -0400
X-MC-Unique: zeCuMcZEPyydS8Yh9SiOYg-1
X-Mimecast-MFC-AGG-ID: zeCuMcZEPyydS8Yh9SiOYg_1747674168
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 9A769180036D; Mon, 19 May 2025 17:02:48 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.44.32.102])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 0F3AA1956096; Mon, 19 May 2025 17:02:45 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Subject: [PATCH] tests/functional: Add a test for the Stellaris arm machines
Date: Mon, 19 May 2025 19:02:42 +0200
Message-ID: <20250519170242.520805-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.13,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
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
X-TUID: YfivfMrgTamR

From: Thomas Huth <thuth@redhat.com>

The 2023 edition of the QEMU advent calendar featured an image
that we can use to test whether the lm3s6965evb machine is basically
still working.

And for the lm3s811evb there is a small test kernel on github
which can be used to check its UART.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS                            |  1 +
 tests/functional/meson.build           |  1 +
 tests/functional/test_arm_stellaris.py | 48 ++++++++++++++++++++++++++
 3 files changed, 50 insertions(+)
 create mode 100755 tests/functional/test_arm_stellaris.py

diff --git a/MAINTAINERS b/MAINTAINERS
index 57dddcc80d6..49b008cdac4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1002,6 +1002,7 @@ F: hw/display/ssd03*
 F: include/hw/input/gamepad.h
 F: include/hw/timer/stellaris-gptm.h
 F: docs/system/arm/stellaris.rst
+F: tests/functional/test_arm_stellaris.py
 
 STM32L4x5 SoC Family
 M: Samuel Tardieu <sam@rfc1149.net>
diff --git a/tests/functional/meson.build b/tests/functional/meson.build
index 52b4706cfe8..557d59ddf4d 100644
--- a/tests/functional/meson.build
+++ b/tests/functional/meson.build
@@ -137,6 +137,7 @@ tests_arm_system_thorough = [
   'arm_raspi2',
   'arm_replay',
   'arm_smdkc210',
+  'arm_stellaris',
   'arm_sx1',
   'arm_vexpress',
   'arm_virt',
diff --git a/tests/functional/test_arm_stellaris.py b/tests/functional/test_arm_stellaris.py
new file mode 100755
index 00000000000..cbd21cb1a0b
--- /dev/null
+++ b/tests/functional/test_arm_stellaris.py
@@ -0,0 +1,48 @@
+#!/usr/bin/env python3
+#
+# Functional test that checks the serial console of the stellaris machines
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+from qemu_test import QemuSystemTest, Asset, exec_command_and_wait_for_pattern
+from qemu_test import wait_for_console_pattern
+
+
+class StellarisMachine(QemuSystemTest):
+
+    ASSET_DAY22 = Asset(
+        'https://www.qemu-advent-calendar.org/2023/download/day22.tar.gz',
+        'ae3a63ef4b7a22c21bfc7fc0d85e402fe95e223308ed23ac854405016431ff51')
+
+    def test_lm3s6965evb(self):
+        self.set_machine('lm3s6965evb')
+        kernel_path = self.archive_extract(self.ASSET_DAY22,
+                                           member='day22/day22.bin')
+        self.vm.set_console()
+        self.vm.add_args('-kernel', kernel_path)
+        self.vm.launch()
+
+        wait_for_console_pattern(self, 'In a one horse open')
+
+    ASSET_NOTMAIN = Asset(
+        'https://github.com/Ahelion/QemuArmM4FDemoSw/raw/master/build/notmain.bin',
+        '6ceda031aa081a420fca2fca9e137fa681d6e3820d820ad1917736cb265e611a')
+
+    def test_lm3s811evb(self):
+        self.set_machine('lm3s811evb')
+        kernel_path = self.ASSET_NOTMAIN.fetch()
+
+        self.vm.set_console()
+        self.vm.add_args('-cpu', 'cortex-m4')
+        self.vm.add_args('-kernel', kernel_path)
+        self.vm.launch()
+
+        # The test kernel emits an initial '!' and then waits for input.
+        # For each character that we send it responds with a certain
+        # other ASCII character.
+        wait_for_console_pattern(self, '!')
+        exec_command_and_wait_for_pattern(self, '789', 'cdf')
+
+
+if __name__ == '__main__':
+    QemuSystemTest.main()
-- 
2.49.0


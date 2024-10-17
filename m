Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp307841njb;
        Thu, 17 Oct 2024 09:34:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUa/Qep/U0wfQdusQbrL41JC1vsXKuhVxrvBR/hgd6Tq/jgLf41V6Y/PY8TFpo15nXOYxn9DVtHdZWTVw==@linaro.org
X-Google-Smtp-Source: AGHT+IGX/JO0yd1rfCdxDIb6kxF+hZ3EGjx50WIG1AYGfPs378l6ykRGnLZMZ5LzxW9cDnmKotgN
X-Received: by 2002:a05:620a:1793:b0:7a1:d6f5:28b8 with SMTP id af79cd13be357-7b11a3c26d4mr3654543585a.63.1729182848220;
        Thu, 17 Oct 2024 09:34:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729182848; cv=none;
        d=google.com; s=arc-20240605;
        b=OxbYcr7P9KXL7pifHuydJhgJcP0AIWt3R7XYBwUDl71SD7t2r7/3ktf0Sh6FVU5hYO
         R+wbMEUWy0Amqk6k5ybEzo+X/nGXvUoPgFm3SUcydHaewZ1hc8u22AgqG2TY8Y5Ft9KA
         JPdzoM02s3pziYFj9Ng378PCla0St2tMEZX1VaGMMkGguG8rzgAHLpCkJgD3EQo4QN5Q
         BtiqynmhFFmD6XMfoIbMOtE5Lp4y95fhLPqKG88y/cgatsx2c89BySmGyb6Ti+3/AuLW
         PvF72i0B/nthbtyVc9NPPzETvY9sHmWQA6+a26GqYe+OZpcPMgwhKJSdHtZw1tF9P0BL
         QAkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=9IBsS9+yKlr4Bu4mxJNjigXp9gTr0wZ5QgoR2aj9Q+o=;
        fh=eWGN87/aBiv2dnfkoShOkcadYyDtCm4weP67A2hBRD8=;
        b=M3lSeNNGsXJaG1Eh2M1qrveK+XmSpftl75ap/LrIQ7IKofmhBxLfoHhAeyTff23R0e
         DGaej+EauPpw8A0LRNfrLsBaccFDX9k9kmXiX0UGlyqxl3b61XUbnW21jOG3/Bd1n3vy
         YGhCqjIIBuVxuJtrqVWSKXiiJIXE3EKfEfD18CIGQ4R3wImNJTq2ftBJGihD5E/QeIO/
         Apibdri9/H7+AExQ7xs/WEuz44ocs5CchABOk2VxEve2oyCvwpcM5e1bUMEiKWJvveC5
         sQm3PxdMQkVUUL+syESbgiHgStsputJbj5mH+Rq0L5xPePD34FYjvEsNvqJNWPaB5veN
         RvTA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JyxxFkbw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b143f96870si458142985a.562.2024.10.17.09.34.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Oct 2024 09:34:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JyxxFkbw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1t1TQv-0000Ax-Lu; Thu, 17 Oct 2024 12:33:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t1TQp-0000A3-1U
 for qemu-devel@nongnu.org; Thu, 17 Oct 2024 12:32:59 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t1TQh-0001ps-DT
 for qemu-devel@nongnu.org; Thu, 17 Oct 2024 12:32:58 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-37d4d1b48f3so853640f8f.1
 for <qemu-devel@nongnu.org>; Thu, 17 Oct 2024 09:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729182770; x=1729787570; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9IBsS9+yKlr4Bu4mxJNjigXp9gTr0wZ5QgoR2aj9Q+o=;
 b=JyxxFkbwUsuNrdMV3EN7Fzmwyx0gWSuqAAVbZNGr5uWFaEmtN1lVCW7YRavxK0z0EG
 hH477z4F1GRk3zTuwD7xsrQFklrkPfRfndyAy+S1D2WpLNLtdrkv9+pbwJ5AVFrO5t6U
 Dv7p6viRoTSgoE5NQXFi1mm5/5u4Wkcj88ps2PMptFQA8n5Mtzj+A+0K/t39LJ6QW1xB
 xPfc6XczuRHYT9dSNZj3nC9tjVaoBuUCAtFcoxT5jKXcQcNmZpkpe2QcdkLvUMZ+v2GK
 VNL8XJ9+yRfyeEOQ8OdaKHvX9hex5flnaV7I0KMLgIoxg995ksJyPbmvhPY+oCfbGLXh
 xIsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729182770; x=1729787570;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9IBsS9+yKlr4Bu4mxJNjigXp9gTr0wZ5QgoR2aj9Q+o=;
 b=pH117+PPMXh+BVZwMJZCc3QbXjJrQ9M4E1LmGeJL7aSjbUUh9okxSvij63NLDOJsk4
 eP/QNJGguIHgxS1mGW4HUu+LjI/hbZR5ZkBiz7tsofEsNn7zknjHYLSAO+ffj4G+pY2F
 fUUOLKmr4FEADcf7+qjrqjRzYOmMBYtXi8e7/BdN0VbPfi1jGpoR1Pmy3V7d+So/nnpH
 oH9/RFmB5iy3qkmOYsC968dkJuBX2dQ1DKME63P3uUv+IzyxSnNYoYyCFViPkiBuj97E
 HLyL3tgpiQtCAxnXxy16WTeiiK7tkb7ATHg7QlDD9oC3bVM7u0kipYPhY569KE4Nm4zP
 kgvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWOKeCjBHZrgzYzZZNZPr4bATi91xHrVGicquIwp7YwFlz09bSJCMi5ANmSuTIx3c2cIC4rgdD9C9D@nongnu.org
X-Gm-Message-State: AOJu0YzE2dXWPw/GE5rS6csK48agTTwzf3jby7QEmLEnC+ChfDg/5SNm
 SUXsGqYuecRdoszM06UJhv2XPAJ7YM/RdQzSy9id2ilFGujlgFsz9avchveq4x4=
X-Received: by 2002:adf:fd8e:0:b0:374:c17a:55b5 with SMTP id
 ffacd0b85a97d-37d551b07e0mr15458423f8f.14.1729182769692; 
 Thu, 17 Oct 2024 09:32:49 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4316067dc56sm545165e9.3.2024.10.17.09.32.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2024 09:32:49 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Guenter Roeck <linux@roeck-us.net>,
	Thomas Huth <thuth@redhat.com>
Subject: [PATCH 1/2] tests/functional: Add a functional test for the collie
 board
Date: Thu, 17 Oct 2024 17:32:46 +0100
Message-Id: <20241017163247.711244-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241017163247.711244-1-peter.maydell@linaro.org>
References: <20241017163247.711244-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: GLbmFDs29SOQ

Add a functional test for the collie board that uses the kernel and
rootfs provided by Guenter Roeck in the linux-test-downloads repo:
 https://github.com/groeck/linux-test-downloads/

This just boots Linux with a userspace that immediately reboots
the board, so we wait for the reboot log line.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 MAINTAINERS                         |  1 +
 tests/functional/meson.build        |  1 +
 tests/functional/test_arm_collie.py | 31 +++++++++++++++++++++++++++++
 3 files changed, 33 insertions(+)
 create mode 100755 tests/functional/test_arm_collie.py

diff --git a/MAINTAINERS b/MAINTAINERS
index c21d6a2f9e1..10b3360ed40 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -929,6 +929,7 @@ F: hw/arm/strongarm*
 F: hw/gpio/zaurus.c
 F: include/hw/arm/sharpsl.h
 F: docs/system/arm/collie.rst
+F: tests/functional/test_arm_collie.py
 
 Stellaris
 M: Peter Maydell <peter.maydell@linaro.org>
diff --git a/tests/functional/meson.build b/tests/functional/meson.build
index c90c02517a0..0450805a9c4 100644
--- a/tests/functional/meson.build
+++ b/tests/functional/meson.build
@@ -51,6 +51,7 @@ tests_alpha_system_thorough = [
 
 tests_arm_system_thorough = [
   'arm_canona1100',
+  'arm_collie',
   'arm_integratorcp',
   'arm_raspi2',
   'arm_vexpress',
diff --git a/tests/functional/test_arm_collie.py b/tests/functional/test_arm_collie.py
new file mode 100755
index 00000000000..7e144a0a8fb
--- /dev/null
+++ b/tests/functional/test_arm_collie.py
@@ -0,0 +1,31 @@
+#!/usr/bin/env python3
+#
+# Functional test that boots a Linux kernel on a collie machine
+# and checks the console
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+from qemu_test import LinuxKernelTest, Asset
+from qemu_test.utils import archive_extract
+
+class CollieTest(LinuxKernelTest):
+
+    ASSET_ZIMAGE = Asset(
+        'https://github.com/groeck/linux-test-downloads/raw/225223f2ad7d637b34426810bf6c3b727b76a718/collie/zImage',
+        '10ace8abf9e0875ef8a83b8829cc3b5b50bc6d7bc3ca29f19f49f5673a43c13b')
+
+    ASSET_ROOTFS = Asset(
+        'https://github.com/groeck/linux-test-downloads/raw/225223f2ad7d637b34426810bf6c3b727b76a718/collie/rootfs-sa110.cpio',
+        '89ccaaa5c6b33331887047e1618ffe81b0f55909173944347d5d2426f3bcc1f2')
+
+    def test_arm_collie(self):
+        self.set_machine('collie')
+        zimage_path = self.ASSET_ZIMAGE.fetch()
+        rootfs_path = self.ASSET_ROOTFS.fetch()
+        self.vm.add_args('-append', 'rdinit=/sbin/init console=ttySA1')
+        self.launch_kernel(zimage_path,
+                           initrd=rootfs_path,
+                           wait_for='reboot: Restarting system')
+
+if __name__ == '__main__':
+    LinuxKernelTest.main()
-- 
2.34.1


Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp1499536njd;
        Sun, 30 Mar 2025 02:42:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVmHoOU7aaCdRJ8G6oJ5uPR/rrVAdggaT/OMXf9+1cmgBeFoArc519zA8sgIZjPZSakXePzaN7SNmPEFw==@linaro.org
X-Google-Smtp-Source: AGHT+IEeoPBNr5pLx5M+qcMm40Er+Sxm7xC3WNMTEGQhGipZL6Eab9dI9GXttHXPwHb1yJ9vr6nn
X-Received: by 2002:a05:6214:29e3:b0:6e8:fa72:be49 with SMTP id 6a1803df08f44-6eed666ab64mr66155916d6.12.1743327743816;
        Sun, 30 Mar 2025 02:42:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743327743; cv=none;
        d=google.com; s=arc-20240605;
        b=bqfJKAX7lDtlW2OsKJcd4O+hIojiFOpXa5h5M66kuvlqew3pratGIFtOZqM9ZkDTIo
         WS7F0OWbRLWNCcAt0fbr1gEn/dfFkuvx9UbMfztVwxL//ob6iaDaoFPO03ievWEYvGTA
         PxBmDIqSy7lkCmzqKDGnEndUkhzLeBSXDtt0g21BgeoPSqoAK4QRu0weMAT1JtDX59G+
         tU8W1IeNHSZfnkhlBiQ6pCCYKNrCInInb830S0OetLmmYA3dqCkG5PUxE1/fncDAZgx3
         s5evmI9VhBl5jQabNg+wJGUfqmHVUYKRWXxy4qy6gVR5qKS8LoadiNTg4aDxq8KtNrfU
         7sYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=u76IOBSMbjJcH5OQHSSw28t6GnCDxPKsnRcq6i4Xx/A=;
        fh=me5EuS2T/4i67cN/+aXRN0dhZv1slld4ihr0mlsCYi4=;
        b=ZVfg5di7iwMEAdPJ5Ef1k6yC2wIzY9eOxynWb9CoEabMLku/R3+4aTWCvJOpmao0qc
         W/8v3wF+RWSjAkyNaRnqQ3bIMQc8QFNJKKwTA2EedcOW0q8/j+pS3ugAhz7u4pz/AeH4
         N2hGCWTMYXXecmjRzwe90iWcLGVYTlGFf/kXrodsJCEod+9+eb0SfLEdRnpYR7Nr4onu
         xXtUOAmWDSwqIGmaML+ewKEzHaJdJzdCtTYU5ZTk8GuVnQHrR/p2x1tJ+XVK4mGng7+A
         R4FU7hLSHNNwc3D2InScZHtLM3zAlIip3LmzQTx911czyLOb4masM1P0JgNGT1+4+s0L
         Tb0Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=Vq8wbVuV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6eec965a173si47643106d6.145.2025.03.30.02.42.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 30 Mar 2025 02:42:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=Vq8wbVuV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1typAz-0008OA-V6; Sun, 30 Mar 2025 05:41:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1typAw-0008NT-Sj; Sun, 30 Mar 2025 05:41:54 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1typAt-0004Xk-42; Sun, 30 Mar 2025 05:41:54 -0400
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-ab771575040so909369366b.1; 
 Sun, 30 Mar 2025 02:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743327708; x=1743932508; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=u76IOBSMbjJcH5OQHSSw28t6GnCDxPKsnRcq6i4Xx/A=;
 b=Vq8wbVuVdJDvOS2qsOKUhUOxqWxgPLKGEluMoqyTleoPMx1ptq079mz0FFkncH+QKg
 XTpTCZk3LfXk3oecBzoYplQZS/1CVnmVC/FicHfnxIM2+/dHsuPooUwdPfAHSM6/Rywq
 NjMkuhTpRGydsqMPGJ+Qavy/VGkQLYwLGgyTfnE8U2a5lJ0EOrzp8bZgJXhJ1KNjhO64
 eUgjW4aOTG+B2o2kd2RimWjgHR+AMjD+f4yBf3p1T7lRFRtpzBvxToTDdQberz2eC7W4
 PDjSkcjNY6TEWRT5KvjT9tZanAkkxkPped4Xs33mJJYTcWcXpDYI6nGoXXhb5573vlIe
 tn0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743327708; x=1743932508;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=u76IOBSMbjJcH5OQHSSw28t6GnCDxPKsnRcq6i4Xx/A=;
 b=qKYYbaijWylNkFWPn899xu3s4bQjSgqxzj3iLIWWTl909L3oti/mz5loljGVQwe59H
 8i0koCxe5Trmxdp9jTmydKqHi7G0y8fyvEs7YLXqL35JeHZgz4RGwn/TP7qxqL8Y6MEC
 Vmo4Z4ryDiWCvmLkmeV8JCqm3Li0tnIUiHNSEGh4zAXs/+ZwBFLU6p3d0Vk5DBOcxu1b
 YPVjnICTJ+RDoHuxKRd2oLnuVz+4V+qKsRVtfwoR4FfeQkRlWdQtMBYPLss/jNdL18OV
 v3dPxmkzkuSYpqLqGgnx/nDoNXabpVU1tJPCcuUvAAvyiWVwnwJn9wCwEPuztg1MKlev
 k8cg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTWz46a4KHPVxFme1ZzXrqSqgd0TniaCgzOjKXiLKxIL8ORH4x5NdFcWHvbLXZ6Qvc++TGT8Wq+Q==@nongnu.org
X-Gm-Message-State: AOJu0YyKpf4kWH5d+KmGWFnxTmJhFnZe5wD1gF9hnpOzyLD7EwMzTjoG
 oIcLel9uD48sfSNrhKQ8GbfuV1YH3ub8uUPP0i0TCXYbdqp3EuVAX3OBjg==
X-Gm-Gg: ASbGncvplqdw6q1EK9nM1tZ/67f/mgke8x9ESC6IYg2UIJXHBC7rDoXzcP7ldbG6bW1
 6PnNPIDdXLnK4+XRL7kjIt3sUckmyXrKiV0DyvdOQZam5DFc9oNX760Ky54Plx2kCAsAY86WON6
 70zgAy0SNCw9Z+OdF3p1YevGeHF3kw3Gg+uT5SbZ4gYFB5ifK89P3Lvg/U3O0+zAniU+Ry14v3P
 x/sI8HshEH1e2/p358oFl9b0XOjL9B2TXufDAiLEBNHhp8CK5LLW3OLOpUfcIzXH31FOCD7FQ1o
 Dq1esWSpz1i89KFPXY4gKC6OHmHRZP5FCyDXnnq0RoYy67tPfAatZ6vD4PF9kGeUg4+0RJxJQTw
 EotBtBulPkw0OevexBL044GBohL/INQbKnfOpVMUicel1qxrcocluVC/XZH98geqM
X-Received: by 2002:a17:907:9816:b0:ac4:3d0:8bca with SMTP id
 a640c23a62f3a-ac7369be91fmr444984966b.29.1743327707807; 
 Sun, 30 Mar 2025 02:41:47 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-2a02-3100-2ddd-7900-0219-99ff-feb2-2458.310.pool.telefonica.de.
 [2a02:3100:2ddd:7900:219:99ff:feb2:2458])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac7196e954csm457914666b.171.2025.03.30.02.41.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Mar 2025 02:41:47 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH] tests/functional: Add test for imx8mp-evk board with USDHC
 coverage
Date: Sun, 30 Mar 2025 11:41:39 +0200
Message-ID: <20250330094139.11948-1-shentey@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: mSfwrVoe67Ka

Introduce a functional test which boots Debian 12 on the imx8mp-evk board. Since
the root filesystem resides on an SD card, the test also verifies the basic
operation of the USDHC.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 MAINTAINERS                                 |  1 +
 tests/functional/meson.build                |  1 +
 tests/functional/test_aarch64_imx8mp_evk.py | 69 +++++++++++++++++++++
 3 files changed, 71 insertions(+)
 create mode 100644 tests/functional/test_aarch64_imx8mp_evk.py

diff --git a/MAINTAINERS b/MAINTAINERS
index d54b5578f8..4ceffa89dc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -833,6 +833,7 @@ F: include/hw/arm/fsl-imx8mp.h
 F: include/hw/misc/imx8mp_*.h
 F: include/hw/pci-host/fsl_imx8m_phy.h
 F: docs/system/arm/imx8mp-evk.rst
+F: tests/functional/test_aarch64_imx8mp_evk.py
 F: tests/qtest/rs5c372-test.c
 
 MPS2 / MPS3
diff --git a/tests/functional/meson.build b/tests/functional/meson.build
index 0f8be30fe2..aaaf3472f1 100644
--- a/tests/functional/meson.build
+++ b/tests/functional/meson.build
@@ -75,6 +75,7 @@ tests_aarch64_system_quick = [
 
 tests_aarch64_system_thorough = [
   'aarch64_aspeed',
+  'aarch64_imx8mp_evk',
   'aarch64_raspi3',
   'aarch64_raspi4',
   'aarch64_replay',
diff --git a/tests/functional/test_aarch64_imx8mp_evk.py b/tests/functional/test_aarch64_imx8mp_evk.py
new file mode 100644
index 0000000000..5419d3c525
--- /dev/null
+++ b/tests/functional/test_aarch64_imx8mp_evk.py
@@ -0,0 +1,69 @@
+#!/usr/bin/env python3
+#
+# Functional test that boots a Linux kernel and checks the console
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+from qemu_test import LinuxKernelTest, Asset
+
+class Imx8mpEvkMachine(LinuxKernelTest):
+
+    ASSET_IMAGE = Asset(
+        ('https://cloud.debian.org/images/cloud/bookworm/20231210-1590/'
+         'debian-12-generic-arm64-20231210-1590.tar.xz'),
+        '7ebf1577b32d5af6204df74b54ca2e4675de9b5a9fa14f3ff70b88eeb7b3b359')
+
+    KERNEL_OFFSET = 0x51000000
+    KERNEL_SIZE = 32622528
+    INITRD_OFFSET = 0x76000000
+    INITRD_SIZE = 30987766
+    DTB_OFFSET = 0x64F51000
+    DTB_SIZE = 45 * 1024
+
+    def extract(self, in_path, out_path, offset, size):
+        try:
+            with open(in_path, "rb") as source:
+                source.seek(offset)
+                data = source.read(size)
+            with open(out_path, "wb") as target:
+                target.write(data)
+        except (IOError, ValueError) as e:
+            self.log.error(f"Failed to extract {out_path}: {e}")
+            raise
+
+    def setUp(self):
+        super().setUp()
+
+        self.ASSET_IMAGE.fetch()
+        self.archive_extract(self.ASSET_IMAGE)
+
+        self.image_path = self.scratch_file("disk.raw")
+        self.kernel_path = self.scratch_file("linux")
+        self.initrd_path = self.scratch_file("initrd.zstd")
+        self.dtb_path = self.scratch_file("imx8mp-evk.dtb")
+
+        self.extract(self.image_path, self.kernel_path,
+                     self.KERNEL_OFFSET, self.KERNEL_SIZE)
+        self.extract(self.image_path, self.initrd_path,
+                     self.INITRD_OFFSET, self.INITRD_SIZE)
+        self.extract(self.image_path, self.dtb_path,
+                     self.DTB_OFFSET, self.DTB_SIZE)
+
+    def test_aarch64_imx8mp_evk_usdhc(self):
+        self.set_machine('imx8mp-evk')
+        self.vm.set_console(console_index=1)
+        self.vm.add_args('-m', '2G',
+                         '-smp', '4',
+                         '-accel', 'tcg',
+                         '-kernel', self.kernel_path,
+                         '-initrd', self.initrd_path,
+                         '-dtb', self.dtb_path,
+                         '-append', 'root=/dev/mmcblk2p1',
+                         '-drive', f'file={self.image_path},if=sd,bus=2,'
+                                    'format=raw,id=mmcblk2')
+
+        self.vm.launch()
+        self.wait_for_console_pattern('Welcome to ')
+
+if __name__ == '__main__':
+    LinuxKernelTest.main()
-- 
2.49.0


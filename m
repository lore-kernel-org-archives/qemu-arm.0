Received: by 2002:a17:504:82cc:b0:1be9:327d:8ee3 with SMTP id m12csp318459njj;
        Tue, 29 Oct 2024 08:11:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWmtdmvc5x43XTgF7T6blKd2NcTJy/Jt8f9nvDzqDFvWsVC6H82ZkrB1XrDnUdBrXHvr7lAQlKSrb8PGw==@linaro.org
X-Google-Smtp-Source: AGHT+IFDgk4KgRjVGKh3aQiLQhMgh5jknG46FemTSv9dREJRd6ZHq7TChq1hTquNPRTpYuzNs9Ug
X-Received: by 2002:ac8:7f53:0:b0:460:988a:da42 with SMTP id d75a77b69052e-4613bfdeb52mr194499571cf.2.1730214709538;
        Tue, 29 Oct 2024 08:11:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730214709; cv=none;
        d=google.com; s=arc-20240605;
        b=EcHHi9e4YpZYzXxJzTh4GfnQ8fiUpLPkBTJR6HIm9UeilDffi6VdCvhMgXlwSS+v1l
         ODjnt8xshgznJwdWxe68p8NKU8hsTXgr6mlPxstQYiIB6pZNzIsYawFGf2GRt6Zfyo0k
         fgPXG9asy3VE3sNwX3Pcz7tA5UztRts8C+rZHUPTI12aYHdKUItKOONCCQv935pyC/LO
         uGt9vNVjZRIyg+r4LIFQoWQNokXD7Gb2YhrPYKBMbPm0uI4gZu21K3I+84ZQqidjV1QH
         sk+QaTNDNQApRNTqN+Ql4u6VXiiMZ3mJ9Xo6HFXQVlgjtvsHBKx0ooQgPqJhU5XvKUrZ
         LNNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=zZy//cWTdf5wvz+1/D1caLV6ihJzmgvgWerEXZ8yj5Y=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=YbWbix//QVe6h/Y9BnZoRK414TdYiUDCFBeKiUo+THYOVGxRXgrzOMaC4dvMACyUo0
         TdHUuTCCnowakYphZLtzHpWQmraPtKhMquuxBaVaWLG1E4UvSG+fVw6FrE/vqEaCsXen
         MgM30dSM3t2MCCVLB4ZtL2zpspMqBmkBgEOflnafEJ/QLmfwb0hpgZHRGz/Yr7t+znEb
         Zj1sgE3pDSIX7ydxQrDtMkOzwR0zR6lG447+KdORA/t0cm1sPQFeh7rtw6eZXSw1HxWO
         MeavnJ6Fdy9oVYrZwxlfQF8/d5vz8PfF26boacKFHITIvauWhVfvL/CapxpIonzPS4+d
         VtRQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=syeCpO9f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-461323fd8a2si106434551cf.687.2024.10.29.08.11.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Oct 2024 08:11:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=syeCpO9f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t5nsK-00016J-R1; Tue, 29 Oct 2024 11:11:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t5ns7-0000hb-A7
 for qemu-arm@nongnu.org; Tue, 29 Oct 2024 11:11:04 -0400
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t5nrz-0007gO-5i
 for qemu-arm@nongnu.org; Tue, 29 Oct 2024 11:11:01 -0400
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-539f1292a9bso6577609e87.2
 for <qemu-arm@nongnu.org>; Tue, 29 Oct 2024 08:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730214653; x=1730819453; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=zZy//cWTdf5wvz+1/D1caLV6ihJzmgvgWerEXZ8yj5Y=;
 b=syeCpO9f12SiDBryP6+JyBXhy8JEdfzauTmN7AZKRD7XmCaDc9MBd1MjVmQqukLnog
 NPfBm+GL+eBVVM+UeObEV43du6ASsJQSjrSNLUxEuKy7odtWEKzbRV1pHZlEc53gYlF2
 MbcA8nDtvH5mulmP9ew/L/J6027VvtOrInF9OHYbqVG5bXBeXHNYwA8hGtthy6YM1DB5
 BKAAOUg62QXimuJoM0Q7jwI/fe+VFmAVsiT/SQt/sDbPLMPkUt1BCy9turPznNN1m9yD
 QhWmQfi/1WVSbGeVdRMVkVZweVJZdrgzEW79nrIvUWOewo5Ap5vs0Ha2gp1aczzMV8Lu
 Vh/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730214653; x=1730819453;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zZy//cWTdf5wvz+1/D1caLV6ihJzmgvgWerEXZ8yj5Y=;
 b=wUqqcMfT/amgXIwXqk+1GYhThTeQqnDk4aL9IGkABhK4j5kKmC+7LQA20s1XPzPKTM
 wn4moKp2Gu+j3uFP580gi3A0hH+6u3jIxksYSSqKwX5zZWKnCNlsGp3vOodpJY/huGbe
 /EjOPLPVQyAux2o6iQVyqNWMu11FYXfZiRYwF+D+BSweCUCLLzywgTJrstFHt5i4KwMr
 bbIUPN2C/fv5MD/DLi4TLXj2F5uU+POAOLL1i5dO8dbPUDeDtasOourHC/pCAprkAyK2
 ruIzgnEglLelVYMuOQ95lrGjCFMNm+R4XYhxazV5O0y0B88ay1ss98dpQ/hMu0KWdOAC
 B08g==
X-Gm-Message-State: AOJu0YwxzBs/daxz8EhTb2yNIRSVEQ4riv65QLdS52GRgQr/HLIqFjP6
 fVnXrINfCUAs6MMphuaokueXgU0tO0PA/8PMdez2JSOVDzEtfJm36KlS8pARLNTSMHVgFHVrgHb
 1
X-Received: by 2002:a05:6512:15a9:b0:539:ecef:376d with SMTP id
 2adb3069b0e04-53b34a33d05mr5926085e87.54.1730214653099; 
 Tue, 29 Oct 2024 08:10:53 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4319360cc2esm146835865e9.44.2024.10.29.08.10.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2024 08:10:52 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PULL 06/18] tests/functional: Add a functional test for the collie
 board
Date: Tue, 29 Oct 2024 15:10:36 +0000
Message-Id: <20241029151048.1047247-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241029151048.1047247-1-peter.maydell@linaro.org>
References: <20241029151048.1047247-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x129.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: TsiOUgXo+hex

Add a functional test for the collie board that uses the kernel and
rootfs provided by Guenter Roeck in the linux-test-downloads repo:
 https://github.com/groeck/linux-test-downloads/

This just boots Linux with a userspace that immediately reboots
the board, so we wait for the reboot log line.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-id: 20241017163247.711244-2-peter.maydell@linaro.org
---
 MAINTAINERS                         |  1 +
 tests/functional/meson.build        |  1 +
 tests/functional/test_arm_collie.py | 31 +++++++++++++++++++++++++++++
 3 files changed, 33 insertions(+)
 create mode 100755 tests/functional/test_arm_collie.py

diff --git a/MAINTAINERS b/MAINTAINERS
index f48d9142b8a..6b1fa225d6e 100644
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
index 97c1c597e86..9538e103d6e 100644
--- a/tests/functional/meson.build
+++ b/tests/functional/meson.build
@@ -54,6 +54,7 @@ tests_alpha_system_thorough = [
 tests_arm_system_thorough = [
   'arm_aspeed',
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


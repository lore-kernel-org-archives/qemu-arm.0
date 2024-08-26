Received: by 2002:a17:505:1116:b0:1be9:327d:8ee3 with SMTP id pu22csp1207764njb;
        Mon, 26 Aug 2024 15:12:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXrsXIh/P+vVmMDlRF+F+inIcuTdbbNP4d8QbDRbnpGDHJxTjd3UhheNx5ddXni6P0HYm+6n0VLIa/2KA==@linaro.org
X-Google-Smtp-Source: AGHT+IGzPHsmQkPBHx3IcHGEPfuMEyNX9pKGBcXOQQta9zqMU5wXe8h5W5+DAVcOl2whc2LQl0I+
X-Received: by 2002:a05:620a:1989:b0:79f:af4:66f1 with SMTP id af79cd13be357-7a6897a2cf8mr1323870185a.50.1724710368406;
        Mon, 26 Aug 2024 15:12:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724710368; cv=none;
        d=google.com; s=arc-20160816;
        b=GYwrv1SDnWuALtQvuayYkzSotg3etjTCNnQbKiSXo3xojM6A9sOqHvPaU6jCUXQWeW
         EMUsAUSHhJZkZt/pcmUC6NdO8tqNKqtK1Br+spUApUKKA1KT7SGoHih+TQ0l4wNXygli
         4oosVtUJulN3ItOYMLl4T6/75ZI6BcSEUZ4Nxj87ndp/P+CahLkNgCvhcIpXZunlyLnv
         nU70k+8ZrF9hfgd+cYxgRIzTYzGgQ0j8zPDl1OJEClFLzQF1nEss8B4VPMamiX0QG647
         SyO30E95Nl2JhyvFJ56ZHEEIZKF8t4rlh4kJP+vHnc9ro0/P7fsB5W/gG23gQZroItwH
         uTlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=QNLodhe7eJCHWO8QXeEyfzJb37RRfhG0yPpBje69vMY=;
        fh=749F8T7gNyWgII2TFFxdY2Xgi9YaJvcw7lbWJ6sHwPE=;
        b=WdFFdjx9c6S7+6d6yS/VEwFKd6OsufjViLus7EXuO8WtgL7mn34d5am80S6Oh8RISx
         bAPIlm4lkoigPcSPwgaCVBOxjC5l6sTCblISjXt1G11/0ZjKqqNcD4X2selLjqIffvHz
         1i0rH56iFWoBcmJVpLkecWP4Rmjcm444wx13FUOWtmIHPihu5uLAVJ2SOO/vi63LPtJw
         mPJturxzK/nJGdEcLtmSDFfuaz8YrCK6p6qFNZf7nqkLX7ndujWhB5/b3wkk6nNZHmFp
         6WGyv+dvUF8GdC/Ytz2aTYdbhQd5i5MBU3s6BIH7cEGj3pCdH2fyGIF8KhzYLZOjkx7l
         9f/Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=D0eCCHtZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a67f46e8bcsi1200154885a.786.2024.08.26.15.12.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Aug 2024 15:12:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=D0eCCHtZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sihvu-0001Lu-20; Mon, 26 Aug 2024 18:11:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sihvs-0001Ha-QL
 for qemu-devel@nongnu.org; Mon, 26 Aug 2024 18:11:28 -0400
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sihvr-0000nY-1i
 for qemu-devel@nongnu.org; Mon, 26 Aug 2024 18:11:28 -0400
Received: by mail-oo1-xc2c.google.com with SMTP id
 006d021491bc7-5dca9cc71b2so3479893eaf.2
 for <qemu-devel@nongnu.org>; Mon, 26 Aug 2024 15:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724710285; x=1725315085; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QNLodhe7eJCHWO8QXeEyfzJb37RRfhG0yPpBje69vMY=;
 b=D0eCCHtZlrcaPlDgvSxTv991wznH74DkIbFTDHkEYGdV5zukfc4nJIRGPauvRy4xsY
 S3MN9g7yKj10plgEwOviwju0kTo2QqVqPxmCDVDDZ6vrh6hoXBXqKqtt/XpXsNOgATVy
 8XmMbtJAdk2nVSa5qplRGKtICpmD6ayhaukMmYZHar17rR5Bc9r9rzK0UXvIrbsNlzpi
 g9mhFdtNrEtdIbaXaG7kAOvRDN1GfRJrX9LYkcv4D6ulOKI3e7buZbm0Vc0LzSJYCmEx
 vEiwwHnzpjQuBe+jILwV3okoh9ZR42jXgJZiMgEaReLEiMQlFE6xFeCmOwo0DkwDxGtH
 92DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724710285; x=1725315085;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QNLodhe7eJCHWO8QXeEyfzJb37RRfhG0yPpBje69vMY=;
 b=eWzbBQ9262TTLJJQzRAp8sVuiNM1WnVw94t3xgS1FW650iATh8NAR8ZRGcVrpcJIS+
 1MOmLUfMiOfCe/3b8ytlQ3MKQSrGV46G4w2XVkLTMVG4dFESEr0M2+AYR/yZ4Xb+cFfP
 EsAHFCwsdQrsl0ArllCaizNIxlt9QVQ3qXSaj8SABRgTrlGNTxneSJVvIuhvoLJuH2mk
 M32Z1wqPTR+Lj4SxJOG0G+997F3VvmXfvZ+MqEez/dbtyBLQsp3jqr86v960QPnO9MwQ
 oe1X9XbENxvUxn5JOhVyEgXyOiaLWGBrAS3ldC7NHetQUTThH75qo0zd9JZJWwcUemF6
 Xwug==
X-Gm-Message-State: AOJu0YyNHFFZDUGbJVPVXyeUjJxU6NfSxHomyQOIYhzXKZ5onckHypzL
 YTKzp1qAhLYm5TpJpdBtIqM8wXUXETCAO4kHVZSXsmnKdV2yWcaODN/H7D0KkcnZ4yQCy7NUYOz
 +
X-Received: by 2002:a05:6820:80f:b0:5da:a462:6a49 with SMTP id
 006d021491bc7-5dcc5b641f6mr13385490eaf.0.1724710285653; 
 Mon, 26 Aug 2024 15:11:25 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.216.241])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6c162db0bacsm50629426d6.83.2024.08.26.15.11.23
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 26 Aug 2024 15:11:25 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Sergey Kambalin <sergey.kambalin@auriga.com>, qemu-arm@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 3/4] tests/functional: Convert Aarch64 Raspi3 avocado tests
Date: Tue, 27 Aug 2024 00:10:57 +0200
Message-ID: <20240826221058.75126-4-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240826221058.75126-1-philmd@linaro.org>
References: <20240826221058.75126-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2c;
 envelope-from=philmd@linaro.org; helo=mail-oo1-xc2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: WdNaBI36MG0h

Straight forward conversion. Update the SHA1 hashes to SHA256
hashes since SHA1 should not be used anymore nowadays.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 MAINTAINERS                             |  1 +
 tests/avocado/boot_linux_console.py     | 23 --------------
 tests/functional/meson.build            |  4 +++
 tests/functional/test_aarch64_raspi3.py | 42 +++++++++++++++++++++++++
 4 files changed, 47 insertions(+), 23 deletions(-)
 create mode 100755 tests/functional/test_aarch64_raspi3.py

diff --git a/MAINTAINERS b/MAINTAINERS
index e2bbf1a994..9ce41df6d8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -911,6 +911,7 @@ F: include/hw/arm/rasp*
 F: include/hw/*/bcm283*
 F: docs/system/arm/raspi.rst
 F: tests/functional/test_arm_raspi2.py
+F: tests/functional/test_aarch64_raspi3.py
 
 Real View
 M: Peter Maydell <peter.maydell@linaro.org>
diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux_console.py
index 226b92d057..cb7301a456 100644
--- a/tests/avocado/boot_linux_console.py
+++ b/tests/avocado/boot_linux_console.py
@@ -979,29 +979,6 @@ def test_arm_orangepi_uboot_netbsd9(self):
         # Wait for user-space
         wait_for_console_pattern(self, 'Starting root file system check')
 
-    def test_aarch64_raspi3_atf(self):
-        """
-        :avocado: tags=accel:tcg
-        :avocado: tags=arch:aarch64
-        :avocado: tags=machine:raspi3b
-        :avocado: tags=cpu:cortex-a53
-        :avocado: tags=device:pl011
-        :avocado: tags=atf
-        """
-        zip_url = ('https://github.com/pbatard/RPi3/releases/download/'
-                   'v1.15/RPi3_UEFI_Firmware_v1.15.zip')
-        zip_hash = '74b3bd0de92683cadb14e008a7575e1d0c3cafb9'
-        zip_path = self.fetch_asset(zip_url, asset_hash=zip_hash)
-
-        archive.extract(zip_path, self.workdir)
-        efi_fd = os.path.join(self.workdir, 'RPI_EFI.fd')
-
-        self.vm.set_console(console_index=1)
-        self.vm.add_args('-nodefaults',
-                         '-device', 'loader,file=%s,force-raw=true' % efi_fd)
-        self.vm.launch()
-        self.wait_for_console_pattern('version UEFI Firmware v1.15')
-
     def test_alpha_clipper(self):
         """
         :avocado: tags=arch:alpha
diff --git a/tests/functional/meson.build b/tests/functional/meson.build
index ec77835199..3fab8e0d0c 100644
--- a/tests/functional/meson.build
+++ b/tests/functional/meson.build
@@ -26,6 +26,10 @@ tests_generic = [
   'version',
 ]
 
+tests_aarch64_thorough = [
+  'aarch64_raspi3',
+]
+
 tests_arm_thorough = [
   'arm_canona1100',
   'arm_n8x0',
diff --git a/tests/functional/test_aarch64_raspi3.py b/tests/functional/test_aarch64_raspi3.py
new file mode 100755
index 0000000000..630b1039ee
--- /dev/null
+++ b/tests/functional/test_aarch64_raspi3.py
@@ -0,0 +1,42 @@
+#!/usr/bin/env python3
+#
+# Functional test that boots a Linux kernel on a Raspberry Pi machine
+# and checks the console
+#
+# Copyright (c) 2020 Philippe Mathieu-Daudé <f4bug@amsat.org>
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+import os
+from zipfile import ZipFile
+
+from qemu_test import QemuSystemTest, Asset
+from qemu_test.linux_kernel import linux_kernel_wait_for_pattern
+
+
+class Aarch64Raspi3Machine(QemuSystemTest):
+
+    ASSET_RPI3_UEFI = Asset(
+        ('https://github.com/pbatard/RPi3/releases/download/'
+         'v1.15/RPi3_UEFI_Firmware_v1.15.zip'),
+        '8cff2e979560048b4c84921f41a91893240b9fb71a88f0b5c5d6c8edd994bd5b')
+
+    def test_aarch64_raspi3_atf(self):
+        efi_name = 'RPI_EFI.fd'
+        zip_path = self.ASSET_RPI3_UEFI.fetch()
+
+        with ZipFile(zip_path, 'r') as zf:
+                     zf.extract(efi_name, path=self.workdir)
+        efi_fd = os.path.join(self.workdir, efi_name)
+
+        self.set_machine('raspi3b')
+        self.vm.set_console(console_index=1)
+        self.vm.add_args('-cpu', 'cortex-a53',
+                         '-nodefaults',
+                         '-device', f'loader,file={efi_fd},force-raw=true')
+        self.vm.launch()
+        linux_kernel_wait_for_pattern(self, 'version UEFI Firmware v1.15')
+
+
+if __name__ == '__main__':
+    QemuSystemTest.main()
-- 
2.45.2


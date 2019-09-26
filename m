Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp2450422wrp;
        Thu, 26 Sep 2019 10:59:37 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzGHFUhowbUSOpNsogAUJYSyTO0lk11SNHuYDiGI7fq59eGijROYMqBoCh5TI1GRSxHh6Gc
X-Received: by 2002:ac8:7646:: with SMTP id i6mr5524369qtr.50.1569520777697;
        Thu, 26 Sep 2019 10:59:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569520777; cv=none;
        d=google.com; s=arc-20160816;
        b=m3PnQv47zt+miWXReA6U0/774nUVnDfRpldJie7Ukws0CTZsRpu1D7//11n5LoClEz
         GDcz/pT+NozQqvHGB2O2xO/l+pPVtxhc6qh5mTIoECRryXtTqTx5N09BQDz4BP7n8TUg
         fRkVBpyOC56fgpXmFlTPA+2oACke0sCc+A3lyrgMf4yzJOo6rMU6FQtFbaxG26GEvBfs
         MZ3S8IVmbRWiFJt2cI7WTgbhNJsa6930eYujuKOCc+HzeLKWoL31eubEylC1Dd6SsQPd
         ko634KP7JgQZAjt3rBGtHlu6+looC84wMYfPw2AfKh2SKKmY5M9M0wR0zKM1porROL4J
         C3nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=sYC4TW3JApn0s9JBnDkHTfcWp0aEvoNVAyyWC/Q/bqI=;
        b=trxNoj5adVUKD9SCO8oHF3jql1L/1TJduczFg4IQ+V3jICi5XhYuu9eTxMvP7BqRzU
         koxTwEFcAoadZ4uZDOfmJiuegOoea3N/UzIwnCYy00hGENXoUmnvbbGm28/2WxzJSZeI
         droL1LKaH8nWEvBG4UYhcki8wrLXVlFWH4ctvyYHDCvfFAzfB7hBfalpKinRga4lOT6m
         Sgvtmq4TQFaVqtLDeD6DIqIRDU7v7T1WVvtdSmcXzaphR1sppijsdYFgBIXczcG7z/aA
         X4tEXLI8XSXQ0Lw3zIGLP8sVRKit8kvAXFIekTjRn5bkMCyEM/Lrq1MZclfKDb/7U7vA
         1j4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=WE4MPnAZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r33si2474665qvr.107.2019.09.26.10.59.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Sep 2019 10:59:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=WE4MPnAZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iDY3E-00018b-Ok
	for alex.bennee@linaro.org; Thu, 26 Sep 2019 13:59:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59257)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iDXgf-0004zy-Ep
 for qemu-arm@nongnu.org; Thu, 26 Sep 2019 13:36:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iDXgd-0003I5-TM
 for qemu-arm@nongnu.org; Thu, 26 Sep 2019 13:36:17 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:55831)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iDXga-0003DB-V2; Thu, 26 Sep 2019 13:36:13 -0400
Received: by mail-wm1-f66.google.com with SMTP id a6so3700229wma.5;
 Thu, 26 Sep 2019 10:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sYC4TW3JApn0s9JBnDkHTfcWp0aEvoNVAyyWC/Q/bqI=;
 b=WE4MPnAZC7pmWGO5woLanDbPrXW7oAn4hiFqMS0iZVmJPo+pa6CIOecZE2SzVNfvzv
 ybPCqVpsMWsnJee4ozT8sXhVNLNUD9Ep29Yw0aujY3fLaCXPvYayK0OIa6ks4R3Duwy7
 CZhB/3AKHlDIvJzcm7Yp3O8k354dlblDx6iO6t0Kkc2GAUJgYeWP2/6JwC+U6uxdZFFS
 zmTP8mTI9QGqYJF4KBfK/564ioEHagd3kaSF8qG5gbZ2fQQyM4KVJDeJ5fHNDa20ecuX
 jjZbE2lqKswnl7TDYkVvkityb00qPbLS3DKsSIcO88sFuJ2+YzuHH+/vZ2cRvgAqI4hf
 8h1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=sYC4TW3JApn0s9JBnDkHTfcWp0aEvoNVAyyWC/Q/bqI=;
 b=a1DdTZStVcm9Fa1V1YsUbn1CU0HbLmVk/P1SnSw1993rqaAlddJE2VzZFDsQjT98CU
 D4YWo2csh2gqNgBhy0ng4L3FMNOm5rydniRGvKVB7e9/BWsTTjVj70J5XVXIyaGSF/6z
 SwXRxQABUz0hePf/8qsf9nsUBj/ZHdqtfm14PkPos8g0gDfCB2+trRbDLuABzVNOxXGC
 HapYGA9+ppzPLaadE9vZWUBO+4fykApj3oIatpNl1YsqGf+M/LO2pb0FxdYzjjxvBVZE
 FtMHJzspEKh/KXVsEYQD4vqA+sa2Sm6G0xQbWUl9LOS5FhRMum9nEQu5pxLFjl+6GHso
 ZPYw==
X-Gm-Message-State: APjAAAXNr5trY0YWfd8gcK4gybzRDvK99L5fpRuy5SYonagTA6cUoc77
 dq8CORwoBFL5N8d8ineV7otr166MKsk=
X-Received: by 2002:a05:600c:2151:: with SMTP id
 v17mr3777780wml.56.1569519311717; 
 Thu, 26 Sep 2019 10:35:11 -0700 (PDT)
Received: from x1w.redhat.com (240.red-88-21-68.staticip.rima-tde.net.
 [88.21.68.240])
 by smtp.gmail.com with ESMTPSA id b186sm9918980wmd.16.2019.09.26.10.35.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2019 10:35:11 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 19/19] tests/boot_linux_console: Test SDHCI and termal sensor
 on raspi3
Date: Thu, 26 Sep 2019 19:34:27 +0200
Message-Id: <20190926173428.10713-20-f4bug@amsat.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190926173428.10713-1-f4bug@amsat.org>
References: <20190926173428.10713-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.66
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Zolt=C3=A1n=20Baldaszti?= <bztemail@gmail.com>,
 Laurent Bonnans <laurent.bonnans@here.com>,
 Esteban Bosse <estebanbosse@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, Clement Deschamps <clement.deschamps@antfield.fr>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Cheng Xiang <ext-cheng.xiang@here.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Pekka Enberg <penberg@iki.fi>, Guenter Roeck <linux@roeck-us.net>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rIvpgVAF5fVW

Add a test which loads the root filesystem on a SD card.
Use a kernel recent enough to also test the thermal sensor.

The kernel image comes from:
https://github.com/sakaki-/bcmrpi3-kernel#description

The cpio image used comes from the linux-build-test project:
https://github.com/groeck/linux-build-test

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/acceptance/boot_linux_console.py | 45 ++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index 2a1a23763e..5c48cacba8 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -410,6 +410,51 @@ class BootLinuxConsole(Test):
         self.exec_command_and_wait_for_pattern('reboot',
                                                'reboot: Restarting system')
 
+    def test_arm_raspi3_initrd_sd_temp(self):
+        """
+        :avocado: tags=arch:aarch64
+        :avocado: tags=machine:raspi3
+        """
+        tarball_url = ('https://github.com/sakaki-/bcmrpi3-kernel/releases/'
+                       'download/4.19.71.20190910/'
+                       'bcmrpi3-kernel-4.19.71.20190910.tar.xz')
+        tarball_hash = '844f117a1a6de0532ba92d2a7bceb5b2acfbb298'
+        tarball_path = self.fetch_asset(tarball_url, asset_hash=tarball_hash)
+        archive.extract(tarball_path, self.workdir)
+        dtb_path    = self.workdir + "/boot/bcm2837-rpi-3-b.dtb"
+        kernel_path = self.workdir + "/boot/kernel8.img"
+
+        rootfs_url = ('https://github.com/groeck/linux-build-test/raw/'
+                      '9b6b392ea7bc15f0d6632328d429d31c9c6273da/rootfs/'
+                      'arm64/rootfs.ext2.gz')
+        rootfs_hash = 'dbe4136f0b4a0d2180b93fd2a3b9a784f9951d10'
+        rootfs_path_gz = self.fetch_asset(rootfs_url, asset_hash=rootfs_hash)
+        rootfs_path = self.workdir + "rootfs.ext2"
+        gunzip(rootfs_path_gz, rootfs_path)
+
+        self.vm.set_machine('raspi3')
+        self.vm.set_console()
+        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
+                               'earlycon=pl011,0x3f201000 console=ttyAMA0 ' +
+                               'root=/dev/mmcblk0 rootwait rw ' +
+                               'panic=-1 noreboot')
+        self.vm.add_args('-kernel', kernel_path,
+                         '-dtb', dtb_path,
+                         '-append', kernel_command_line,
+                         '-drive', 'file=' + rootfs_path + ',if=sd,format=raw',
+                         '-no-reboot')
+        self.vm.launch()
+
+        self.wait_for_console_pattern('Boot successful.')
+
+        self.exec_command_and_wait_for_pattern('cat /proc/cpuinfo',
+                                               'Raspberry Pi 3 Model B')
+        self.exec_command_and_wait_for_pattern('cat /sys/devices/virtual/' +
+                                               'thermal/thermal_zone0/temp',
+                                               '25178')
+        self.exec_command_and_wait_for_pattern('reboot',
+                                               'reboot: Restarting system')
+
     def test_s390x_s390_ccw_virtio(self):
         """
         :avocado: tags=arch:s390x
-- 
2.20.1


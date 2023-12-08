Received: by 2002:a17:906:fa94:b0:a1c:d2de:9065 with SMTP id lt20csp2045400ejb;
        Thu, 7 Dec 2023 18:36:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEJ7MFznlO6VbN5kgtCeEkHSHv0d1s8VqpzFEVu/OIlyf/RL/OL6a0w/+sVRq761+VxaiFn
X-Received: by 2002:a05:6122:21a0:b0:4b2:c554:e9b8 with SMTP id j32-20020a05612221a000b004b2c554e9b8mr4305144vkd.26.1702002990631;
        Thu, 07 Dec 2023 18:36:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702002990; cv=none;
        d=google.com; s=arc-20160816;
        b=Uvn7a0pMvKFnqbrHR1emheQAggZad0Q72iAafGiOFNAuIhYn0Nzafq78oZbqnGz78G
         tJQk+tEd/Y3sSh+tuV24vuvJIV+jK4H9VWxhh7zUnysV0K5HVDTOQIWwkgwzTqb0NxCb
         HUPLAPLdi5TdNmdSVUhxMaKVhdf2cwTD5JnXuclMWJTzDmDr35PatGbeg7cTi1bXQyrI
         iJLYvSGhRJQ4KLKZUBcwtwUjVNjdZAlXaztdXgkprdMpKEG3tznMkIaqS/WfNtRw8Dsv
         SYoqlf7T4bzs9ym/ts8cB6J9D5Feb2Kk6xpsrnF/U+SGi9OGRrde7EKkd9aiJsT9TRZc
         Jf2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=TCNIKNE6nVmj7R6GOuKvAPll0e515Ro2t5eTdR3Cxc4=;
        fh=1CWWAdYo81brd4jeYOgzhc83mN/ncVbe89i2SJzFql0=;
        b=ubMEZ6VuuCGRdvFz42vcZzAMFFmcnzkLEeLo1SOrA9mpF22trgbt5uleqp8LuJB5qe
         C8iBjT1QietYahTmhqnhfQcbyVOtBUiNs4cPblOJ63tmR72jsZqJW5wUwymEbBbzbxae
         hFDpo4zxwYBKtqf+Jt8RFLs7L1x87t8NPGZDE9VfRYKhISuQsL+eizp8g6wPLEjd2Mtb
         GmTcGxcWQMoKjzTpY1kn6yFKf/i/WVubfUOd2LxuzPccJQS6N5a4VyR7kw0gHOdZbOgy
         +6uxJSmWDfEo49H+sRiGlfJbqUuAF8ymExbXlufyIEGjjmkSPKMSlv8ssHkmIgS3uHCo
         xfMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=NDO6LUoK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x14-20020a05620a14ae00b0077d8969c31bsi1054081qkj.506.2023.12.07.18.36.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Dec 2023 18:36:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=NDO6LUoK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rBQgj-0007tR-GB; Thu, 07 Dec 2023 21:34:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1rBQgi-0007me-2Q; Thu, 07 Dec 2023 21:34:00 -0500
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1rBQgf-0002jO-UU; Thu, 07 Dec 2023 21:33:59 -0500
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2c9f9db9567so17739511fa.3; 
 Thu, 07 Dec 2023 18:33:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702002834; x=1702607634; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TCNIKNE6nVmj7R6GOuKvAPll0e515Ro2t5eTdR3Cxc4=;
 b=NDO6LUoKUlfks9c9gZST/pLZIGvrmZNTKE/IURNypQ6TE/GYy1emHlEsyU7OCWY0VM
 KpWZLClclkVxSSvnfMJQ7zeLdeiJUn1MG+cWh00pfIz+CJ6dfyD1BvoX0LftRYyTEIpq
 MpD4z2Uy4H3q3TwaxTFjB4HhJUGvo6bDVVcwz9601IF4DeJU8xG3cnIgKuMrTXKCydD9
 YNajvyo3jx2p3/N1RCK5nEFTJBQAJMoNs0lJE1zCSoj3muNuRrWp/kOjnHQz2V2MnuHs
 UAOaG9mxosuivl0+utmK81Gq8YBEUc0Ji4dkg5NYYLvEtYocQUG7VUBo6XwEsmFaGIN3
 HfmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702002834; x=1702607634;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TCNIKNE6nVmj7R6GOuKvAPll0e515Ro2t5eTdR3Cxc4=;
 b=JOLQcT/POc+TmT0NSACAHBb9SdRpymYK8Yfh7KTI6h9wRzY8OfGXc6UovCtMy7I2UL
 aoSt7aEiftGoRi0TQHFkvRBW5Zck9XgkL5vLjjshhWsCePTG7eIz2+phlf0LJFtNV7y6
 wXpXh/n3kxBOw1tJ5GgLx3ZdqlOfQ44VIrlJlQcjPeXKWx9U6CCPDQquuhzBxeS336zl
 BytaeOcog3LAx7fd+gz8Iav2wYuG6iFJYpggTZggY8RvPKFHnFtxyG4BnGqp3LM2sTtM
 EKxfqcWEZLoq7M7q3iCysblu/nYDHaaCqGzkFt7/dUedn/pGKLq3oVGtyVfqgfDBBw4/
 g4GA==
X-Gm-Message-State: AOJu0YyiXXU06rVxKndaZaDxUNrpOCbelQykW0GxPcsWld35v5/y+P7V
 X5A1QHirLEjIHFSdJyzfK4Rz6yYcmrQKmQ==
X-Received: by 2002:a2e:8e81:0:b0:2c9:fb80:1351 with SMTP id
 z1-20020a2e8e81000000b002c9fb801351mr2149429ljk.41.1702002834471; 
 Thu, 07 Dec 2023 18:33:54 -0800 (PST)
Received: from localhost.localdomain ([185.200.240.39])
 by smtp.gmail.com with ESMTPSA id
 r1-20020a2e94c1000000b002c9e6cbf78esm99062ljh.19.2023.12.07.18.33.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Dec 2023 18:33:52 -0800 (PST)
From: Sergey Kambalin <serg.oker@gmail.com>
X-Google-Original-From: Sergey Kambalin <sergey.kambalin@auriga.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	Sergey Kambalin <sergey.kambalin@auriga.com>
Subject: [PATCH v4 34/45] Add Rpi4b boot tests
Date: Thu,  7 Dec 2023 20:31:34 -0600
Message-Id: <20231208023145.1385775-35-sergey.kambalin@auriga.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231208023145.1385775-1-sergey.kambalin@auriga.com>
References: <20231208023145.1385775-1-sergey.kambalin@auriga.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22c;
 envelope-from=serg.oker@gmail.com; helo=mail-lj1-x22c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: YR02QThvVHlh

Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
---
 tests/avocado/boot_linux_console.py | 92 +++++++++++++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux_console.py
index 6eab515718..b5c090ae64 100644
--- a/tests/avocado/boot_linux_console.py
+++ b/tests/avocado/boot_linux_console.py
@@ -501,6 +501,98 @@ def test_arm_raspi2_initrd(self):
         # Wait for VM to shut down gracefully
         self.vm.wait()
 
+    def test_arm_raspi4(self):
+        """
+        :avocado: tags=arch:aarch64
+        :avocado: tags=machine:raspi4b-2g
+        :avocado: tags=device:pl011
+        :avocado: tags=accel:tcg
+        :avocado: tags=rpi4b
+
+        The kernel can be rebuilt using the kernel source referenced
+        and following the instructions on the on:
+        https://www.raspberrypi.org/documentation/linux/kernel/building.md
+        """
+
+        deb_url = ('http://archive.raspberrypi.org/debian/'
+            'pool/main/r/raspberrypi-firmware/'
+            'raspberrypi-kernel_1.20230106-1_arm64.deb')
+        deb_hash = '08dc55696535b18a6d4fe6fa10d4c0d905cbb2ed'
+        deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
+        kernel_path = self.extract_from_deb(deb_path, '/boot/kernel8.img')
+        dtb_path = self.extract_from_deb(deb_path, '/boot/bcm2711-rpi-4-b.dtb')
+
+        self.vm.set_console()
+        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
+                               'earlycon=pl011,mmio32,0xfe201000 ' +
+                               'console=ttyAMA0,115200 ' +
+                               'root=/dev/mmcblk1p2 rootwait ' +
+                               'dwc_otg.fiq_fsm_enable=0')
+        self.vm.add_args('-kernel', kernel_path,
+                         '-dtb', dtb_path,
+                         '-append', kernel_command_line,
+                         '-device', 'qemu-xhci,bus=pcie.1,id=xhci',
+                         '-device', 'usb-kbd,bus=xhci.0')
+        self.vm.launch()
+        console_pattern = 'Kernel command line: %s' % kernel_command_line
+        self.wait_for_console_pattern(console_pattern)
+        console_pattern = 'Product: QEMU USB Keyboard'
+        self.wait_for_console_pattern(console_pattern)
+
+
+    def test_arm_raspi4_initrd(self):
+        """
+        :avocado: tags=arch:aarch64
+        :avocado: tags=machine:raspi4b-2g
+        :avocado: tags=device:pl011
+        :avocado: tags=accel:tcg
+        :avocado: tags=rpi4b
+
+        The kernel can be rebuilt using the kernel source referenced
+        and following the instructions on the on:
+        https://www.raspberrypi.org/documentation/linux/kernel/building.md
+        """
+        deb_url = ('http://archive.raspberrypi.org/debian/'
+            'pool/main/r/raspberrypi-firmware/'
+            'raspberrypi-kernel_1.20230106-1_arm64.deb')
+        deb_hash = '08dc55696535b18a6d4fe6fa10d4c0d905cbb2ed'
+        deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
+        kernel_path = self.extract_from_deb(deb_path, '/boot/kernel8.img')
+        dtb_path = self.extract_from_deb(deb_path, '/boot/bcm2711-rpi-4-b.dtb')
+
+        initrd_url = ('https://github.com/groeck/linux-build-test/raw/'
+                      '86b2be1384d41c8c388e63078a847f1e1c4cb1de/rootfs/'
+                      'arm64/rootfs.cpio.gz')
+        initrd_hash = 'f3d4f9fa92a49aa542f1b44d34be77bbf8ca5b9d'
+        initrd_path_gz = self.fetch_asset(initrd_url, asset_hash=initrd_hash)
+        initrd_path = os.path.join(self.workdir, 'rootfs.cpio')
+        archive.gzip_uncompress(initrd_path_gz, initrd_path)
+
+        self.vm.set_console()
+        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
+                               'earlycon=pl011,mmio32,0xfe201000 ' +
+                               'console=ttyAMA0,115200 ' +
+                               'panic=-1 noreboot ' +
+                               'dwc_otg.fiq_fsm_enable=0')
+        self.vm.add_args('-kernel', kernel_path,
+                         '-dtb', dtb_path,
+                         '-initrd', initrd_path,
+                         '-append', kernel_command_line,
+                         '-device', 'qemu-xhci,bus=pcie.1,id=xhci',
+                         '-device', 'usb-kbd,bus=xhci.0',
+                         '-no-reboot')
+        self.vm.launch()
+        self.wait_for_console_pattern('Boot successful.')
+
+        exec_command_and_wait_for_pattern(self, 'cat /proc/cpuinfo',
+                                                'BCM2835')
+        exec_command_and_wait_for_pattern(self, 'cat /proc/iomem',
+                                                'cprman@7e101000')
+        exec_command_and_wait_for_pattern(self, 'halt', 'reboot: System halted')
+        # TODO: Raspberry Pi4 doesn't shut down properly with recent kernels
+        # Wait for VM to shut down gracefully
+        #self.vm.wait()
+
     def test_arm_exynos4210_initrd(self):
         """
         :avocado: tags=arch:arm
-- 
2.34.1


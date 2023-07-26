Received: by 2002:a17:906:2484:b0:98d:b2f5:1316 with SMTP id e4csp584739ejb;
        Wed, 26 Jul 2023 07:23:23 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEuuC3n+wD/g/hVa0PGXbhUHeWKU3JLspTe7lMal0AGlgR5yHSCbhb8MwI0tiOikTXPtpJ0
X-Received: by 2002:ac8:5b10:0:b0:403:af80:7cc1 with SMTP id m16-20020ac85b10000000b00403af807cc1mr2501055qtw.42.1690381403380;
        Wed, 26 Jul 2023 07:23:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690381403; cv=none;
        d=google.com; s=arc-20160816;
        b=s0nuLsIRz8jeFRbDYnxEyskvpxgf9h9F8/jLbrbnncp7BxNBL0XkXbIzWjjRIhDSY4
         j/00qmuTi0S00egYlFGjROhNBQco47+dRt5LN9LV8vf0njpQt6QOg18u2lztuWlgOo4+
         lPCP3ANpQMOGOPUv+GwNyvmERaD10PZ+JZyrNw0VepuAXRA02N6gCRLjWf01cGuMP/bu
         fyhdu5hYGZhdv+rd7AE/HpEK0v6CO1NMHLPuZpF2aG1cjKP3gS3ka1hLjQtVScVQ2Qfy
         tdowaQvxM1NQVCCLs9oETeDHnbtq35HESgFVixD28w2MX03+AblT0GqyEgVHlrAsDbvF
         NdSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=mcF9QghvfuN/SOxiRcej/fFnaurGCk30s1qkfL8vZWQ=;
        fh=f5jt6gD4kTKAQV2ukO6ZfXPs+EJm4Q1+uDtHV6gcJRE=;
        b=ZXdFP0agX6YVZOSd7oj7siX/5LZED9odxC8LtkdhQSVtwTgC1b58HbUm/HA8RDtefS
         Z5X1ZpDvvQdC0MnG15vCUIvnTjtQHa1OxvrbBIOYmvvyMh+jYEdxF0c/0ECcKQzUtt0g
         8VYvr2PtfNI3NVxIseqDMinIjtUOKxTs6DAVVbb5Ra9+B0twLe9OEmQWzPUaw2EJrpt1
         wah0cLg/cHMIwHiBw2k8INBRc/eMRRHpY3HKjCCubmBgkaI+WEeWAFtttBD/2aUX4G3B
         alfIfFxYYPiAtE1GIOM+jFYwpCUWX6kwwLoEwaN1SBZz92ky5ON2ksUglQAy0f/0y0Ha
         HEQA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=MWEph3x4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 20-20020ac85914000000b00403fcf7a868si7723371qty.720.2023.07.26.07.23.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Jul 2023 07:23:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=MWEph3x4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qOeXQ-0003IP-DR; Wed, 26 Jul 2023 09:26:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1qOeWp-00031C-8Z; Wed, 26 Jul 2023 09:26:11 -0400
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1qOeWk-0003Rr-Go; Wed, 26 Jul 2023 09:26:10 -0400
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4fe0d5f719dso1788024e87.2; 
 Wed, 26 Jul 2023 06:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690377960; x=1690982760;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mcF9QghvfuN/SOxiRcej/fFnaurGCk30s1qkfL8vZWQ=;
 b=MWEph3x4bA2x76tC777AbUHKL1075D9FYQVP5O/v5hsSnld6gCOcBLaeS6zwM4kBB5
 3V/IPPfCRvf7zzhJrhOl7fry8jtuOnzSpgbo++ByAmRX3WdxuBUg64H7moA5WKAPkfgo
 zzGqvqi/bMggO1IcphFbSBO7KbsK8cHmQTvTVGbC7UL2PCw2p+UKA2x/Yak+HN8PJhuK
 yTbmH1avy0b1Fg2DxmBtcbd/9HenhKv7CqIC++XGJmY5h3ZBrVSr/Q9EGMptm/KKPAI+
 7GmJiOP6wdXOhCCYlf2mDpc021YPguJIKzTzA8W/kNU4vkv1vSDlBHVDVstqy6YnHgNG
 hf9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690377960; x=1690982760;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mcF9QghvfuN/SOxiRcej/fFnaurGCk30s1qkfL8vZWQ=;
 b=C93dCc7Hh9+jeGPu6/zMJ/06yiqpMblVZLDf/rr5zpa+7mDUiu/IY/NqSQY/nQd3zm
 esk5C5EpdNr8XDqYpNjuHvJ0OM+DEVqrophzCTIGZdv69fwPOuVL50pfyCZAwRF65Xuh
 UuUmbbCOQH+xqrcLndt+dXgw55Qy/r0AgOKKMXCcbV3XpEAENt0BcS09yF8IHGfW7nGg
 w6wvCTGrIDbp2caCoTsxz5fSUcvTOTPqF9PdBQ232Gwj+vJkI+8hhEocpUv5bT3ufICO
 6xA1qs7DUUdumtfVLA0dbPJ5aK8GwVVwj/iC6CljMj1US+SboArv8P9170UDju8fXXnO
 Pqrg==
X-Gm-Message-State: ABy/qLZF2pATy4Y0CHLGD4b41CYTd7hQkGJYOMXPAxUal+QVmxEB5K7i
 lACeQGjtP/AOCZLUWezgSuecFG12hV8=
X-Received: by 2002:a19:6710:0:b0:4fd:d3aa:e425 with SMTP id
 b16-20020a196710000000b004fdd3aae425mr1273738lfc.27.1690377960481; 
 Wed, 26 Jul 2023 06:26:00 -0700 (PDT)
Received: from sergevik-thinkpad.localdomain ([213.197.136.186])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a19f516000000b004fe0c3d8bb4sm565079lfb.84.2023.07.26.06.25.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jul 2023 06:26:00 -0700 (PDT)
From: Sergey Kambalin <serg.oker@gmail.com>
X-Google-Original-From: Sergey Kambalin <sergey.kambalin@auriga.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	Sergey Kambalin <sergey.kambalin@auriga.com>
Subject: [PATCH 34/44] Add Rpi4b boot tests
Date: Wed, 26 Jul 2023 16:25:02 +0300
Message-Id: <20230726132512.149618-35-sergey.kambalin@auriga.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230726132512.149618-1-sergey.kambalin@auriga.com>
References: <20230726132512.149618-1-sergey.kambalin@auriga.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12c;
 envelope-from=serg.oker@gmail.com; helo=mail-lf1-x12c.google.com
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
X-TUID: rwBzDf5wPWrF

Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
---
 tests/avocado/boot_linux_console.py | 92 +++++++++++++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux_console.py
index 6eab515718..62aac02bbb 100644
--- a/tests/avocado/boot_linux_console.py
+++ b/tests/avocado/boot_linux_console.py
@@ -501,6 +501,98 @@ def test_arm_raspi2_initrd(self):
         # Wait for VM to shut down gracefully
         self.vm.wait()
 
+    def test_arm_raspi4(self):
+        """
+        :avocado: tags=arch:aarch64
+        :avocado: tags=machine:raspi4b2g
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
+        :avocado: tags=machine:raspi4b2g
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


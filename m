Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp2334448ejb;
        Sun, 3 Dec 2023 13:51:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH8KgXnkenbSzM35FIovLC5vIrRH9u0Z5eXfbYcl3oZc0Yo/AjLXfsDT4dB3qy3V8IY73E2
X-Received: by 2002:a05:620a:cef:b0:77d:51b3:208b with SMTP id c15-20020a05620a0cef00b0077d51b3208bmr28154004qkj.4.1701640306729;
        Sun, 03 Dec 2023 13:51:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701640306; cv=none;
        d=google.com; s=arc-20160816;
        b=PM89O0ktjygwhOC5yrL3lYb2m5UFy1Ef1ifZ2Y+k4NncA+bShcA6Y0oW1Lw8Q4oCAC
         eJjZEIASG3cYXU7sm5Ab92HtirO2I0k8Fg1GCGa5L+vIFBgBGmnV3S6B0IWEb/cyEusN
         vYQZnPpZkM/ju9v3BXREHXhjIunT+UDPDEB2qABRRUilL0lTEJ2QB1VL+qpfC+1RYu1s
         B8SgOqBVoxEpASgcXeU3XFNZujsnMC1YlLL4zXoHICksNNj6Ncgi6p2GgtHG2uLFgGfU
         mqJIDhGajGhSTexNHe/6AejcAR1T//JpavZMSMex+kp8OHuQ8ZPBaK8DEaEGdG8x9wn4
         jooQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=mcF9QghvfuN/SOxiRcej/fFnaurGCk30s1qkfL8vZWQ=;
        fh=1CWWAdYo81brd4jeYOgzhc83mN/ncVbe89i2SJzFql0=;
        b=Z7OhoR48xOclJ+F0X7Wrx+h7rRDOf3YN77cIMQolA4hi/KBFJ7VjrYtdh6fCdPCA/A
         sgkslY6bz79qBeCFHBDQd3pBMbXWGWSa/dSfe4AuzSuevvkJGpvhmMorZG/3540TCV7f
         sLxK7873Q6vgKbLOBrfxTgjn3bQtg43rp8SUsZy4AUp/axkMqe+nVtEmqoyaoQeXf/Tm
         CekWqPsHOmjavT0S1XGz3xPq6qYd7RWXZtdv8p0+s74YG9xonhnsnsWevDr9O0KDd/SS
         LiCYm9kfZGGTy3m7fF3GhJXU9lLifQGcNrdkKz3sRf2E9EpU0Wmq9yZ1KaVdxua46kV5
         tONw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=C3GG103D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i4-20020a05620a27c400b0077a5f8df089si8275472qkp.559.2023.12.03.13.51.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Dec 2023 13:51:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=C3GG103D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r9uLh-0003Zn-FQ; Sun, 03 Dec 2023 16:50:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1r9uLc-0003Sp-Oe; Sun, 03 Dec 2023 16:49:56 -0500
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1r9uLa-0008R1-TY; Sun, 03 Dec 2023 16:49:56 -0500
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-5d8cb0e3b5eso582667b3.0; 
 Sun, 03 Dec 2023 13:49:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701640193; x=1702244993; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mcF9QghvfuN/SOxiRcej/fFnaurGCk30s1qkfL8vZWQ=;
 b=C3GG103D2m4KmgVTH5gNHgMGXga+dM+ebd1hWh/VyOiFKsldqsL6TO59m9ePFkfwCt
 LVkGAxX9Zcai912N8NPdEam5ggsczezF9ITO1roFanLcQG6nzXrx7dcyMivBTC7nTFVD
 IJsZQh6QO9zslRTYFgI05awIeJnWnRkWl34u01IftULCzKQGjQwsNYSaQHl7+GBj37zM
 y3KS4TPEWgP6qEMDG32lDCeEjKX/iS9YD3MrTWmJKNNCqrIVw5UXvIJMps3NGYPe6EWK
 aQpgMyJfu9Igm9Nmdd7t8S0qiDmuq1K0z3+uCvY8KDxMrK5YG6P7CiPQ4HziSMm9kiD7
 c8dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701640193; x=1702244993;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mcF9QghvfuN/SOxiRcej/fFnaurGCk30s1qkfL8vZWQ=;
 b=Y+9T3hWu/rI8QsFFNiKQ4Yre5nZyI+IZVJmnjfNb5QRVv4ufpdexMWjD0t2OY8HByE
 dizclUucoQMO1ZZPWxe7gBKR73/zJ88EsCvozmUnprUnMKDHfopY/M6BGXj+HT1qiT3g
 vRQ2OpvA2jYXSjgYhit5KGfbq9kJm9QEZSOfXqanYRZuJgYSpZh4V1RllkBje+ZYNEaU
 o9Cwgi2/tUoDr+iA3FdiyGYRRHwD9Y4Mdztn0vc+6IaCZwyw4jfr0Z+kY46JrMW3PRZq
 ih2lMUjHfG5fllL4X9QkGAF0PmSuaNlkcZf3MYGg3Bsg8tMbXLW0LmxgT+l1bKBEqIvy
 OWHw==
X-Gm-Message-State: AOJu0YyotIz5RoQiD++tLgzht8nmXCMD/WGbxgFoaxpVi1SPCsYtPGur
 IDqKCOcacQR5kjgs87FMNBMia4CLa7cZ8Q==
X-Received: by 2002:a81:4e96:0:b0:5d7:387d:50e8 with SMTP id
 c144-20020a814e96000000b005d7387d50e8mr2660446ywb.25.1701640193380; 
 Sun, 03 Dec 2023 13:49:53 -0800 (PST)
Received: from localhost.localdomain ([201.206.180.22])
 by smtp.gmail.com with ESMTPSA id
 z2-20020a816502000000b00597e912e67esm2832788ywb.131.2023.12.03.13.49.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Dec 2023 13:49:53 -0800 (PST)
From: Sergey Kambalin <serg.oker@gmail.com>
X-Google-Original-From: Sergey Kambalin <sergey.kambalin@auriga.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	Sergey Kambalin <sergey.kambalin@auriga.com>
Subject: [PATCH v3 34/45] Add Rpi4b boot tests
Date: Sun,  3 Dec 2023 15:48:59 -0600
Message-Id: <20231203214910.1364468-35-sergey.kambalin@auriga.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231203214910.1364468-34-sergey.kambalin@auriga.com>
References: <20230726132512.149618-1-sergey.kambalin@auriga.com>
 <20231203214910.1364468-1-sergey.kambalin@auriga.com>
 <20231203214910.1364468-2-sergey.kambalin@auriga.com>
 <20231203214910.1364468-3-sergey.kambalin@auriga.com>
 <20231203214910.1364468-4-sergey.kambalin@auriga.com>
 <20231203214910.1364468-5-sergey.kambalin@auriga.com>
 <20231203214910.1364468-6-sergey.kambalin@auriga.com>
 <20231203214910.1364468-7-sergey.kambalin@auriga.com>
 <20231203214910.1364468-8-sergey.kambalin@auriga.com>
 <20231203214910.1364468-9-sergey.kambalin@auriga.com>
 <20231203214910.1364468-10-sergey.kambalin@auriga.com>
 <20231203214910.1364468-11-sergey.kambalin@auriga.com>
 <20231203214910.1364468-12-sergey.kambalin@auriga.com>
 <20231203214910.1364468-13-sergey.kambalin@auriga.com>
 <20231203214910.1364468-14-sergey.kambalin@auriga.com>
 <20231203214910.1364468-15-sergey.kambalin@auriga.com>
 <20231203214910.1364468-16-sergey.kambalin@auriga.com>
 <20231203214910.1364468-17-sergey.kambalin@auriga.com>
 <20231203214910.1364468-18-sergey.kambalin@auriga.com>
 <20231203214910.1364468-19-sergey.kambalin@auriga.com>
 <20231203214910.1364468-20-sergey.kambalin@auriga.com>
 <20231203214910.1364468-21-sergey.kambalin@auriga.com>
 <20231203214910.1364468-22-sergey.kambalin@auriga.com>
 <20231203214910.1364468-23-sergey.kambalin@auriga.com>
 <20231203214910.1364468-24-sergey.kambalin@auriga.com>
 <20231203214910.1364468-25-sergey.kambalin@auriga.com>
 <20231203214910.1364468-26-sergey.kambalin@auriga.com>
 <20231203214910.1364468-27-sergey.kambalin@auriga.com>
 <20231203214910.1364468-28-sergey.kambalin@auriga.com>
 <20231203214910.1364468-29-sergey.kambalin@auriga.com>
 <20231203214910.1364468-30-sergey.kambalin@auriga.com>
 <20231203214910.1364468-31-sergey.kambalin@auriga.com>
 <20231203214910.1364468-32-sergey.kambalin@auriga.com>
 <20231203214910.1364468-33-sergey.kambalin@auriga.com>
 <20231203214910.1364468-34-sergey.kambalin@auriga.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=serg.oker@gmail.com; helo=mail-yw1-x112b.google.com
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
X-TUID: GuRWfSM9V49I

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


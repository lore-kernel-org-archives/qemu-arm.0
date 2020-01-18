Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp742622lff;
        Sat, 18 Jan 2020 11:16:31 -0800 (PST)
X-Received: by 2002:a1c:4b01:: with SMTP id y1mr10455907wma.12.1579374991008;
        Sat, 18 Jan 2020 11:16:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579374991; cv=none;
        d=google.com; s=arc-20160816;
        b=T9/oNFqoZi/HnVbOaqK+leSeef9yPAR+MP+GN4IaoleV7wXPVc4CbBvjaxO/Yuc09o
         h+1uC9H7bSi5kJiJtKI3jdNsKslg9X1JOv/Y2Z40AWEMCtU9J2yIdU2IIKuaFJlj01+d
         OEzLuNS6xPBGi/iS7WrIetBCjFeVCR/Jio772ayiMEvG6Qg8rv5D9P0yk5MPfXwTJP1x
         kALqXBlbmqvQp1effxNa2oF7Yycfqmc/07BgyFma1KD9mGjheVlolqTtvAjLonfSSv3y
         UUNqKCk81k8aeWZc+JFx7v9jUQ8Nw282anM4Kh0LnOenCmuAUzuPHz/ua3cmTKh553dl
         DurQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=AyAU2X5VPRy6Esk965p6WIgVLdsOCthkRQaP1bet484=;
        b=CvXSg1sw56XRymlAOh1CL2ATzlMkcb17AaLywKAAHD3VLuiG0RJYreVUh5NlAh0+bH
         8Ph5NwQJLUvd46HcXZ0ZdShbjtuDmLxqNQ4zwAfURqpqSOCAnZKkc57850/gh6ZeLLR/
         mxCOr4Gsd+hFXZKsfEMQ6tsaWv8nw6FkRcyS/gVCOiGTZGJuSOAhV1vrTizpxvh9kjt0
         NzfK4ZyfrhWYshcwL7gCUYpdCTuRysFTyBZXHZfC8d8WtV7BchvSYJOrA974ojrcveHn
         5m0OF3ote31xYG6u7CRBUKIwVBPkzBOTZKXoN0wbJ5sZ7k1uwMxvY8rTdVAbBuDhGPFY
         S1Fg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=rE90ZYe5;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id i5sor12706704wrx.34.2020.01.18.11.16.30
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 18 Jan 2020 11:16:30 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=rE90ZYe5;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AyAU2X5VPRy6Esk965p6WIgVLdsOCthkRQaP1bet484=;
        b=rE90ZYe5/lvnrQLlXlIFQtlNE/pW5XTVVGaw0F6JBW7w8xoLoubgB9NAcpc/3qBe9p
         A68wQXeE2UqgCjVKPA2+6JobLrOBc338Ibt/utLK5374zz/bUJJCEn70lx7ryIJW/Fpi
         Bnfj+i+MDNlZHO+97qD39xqAeUbX6KzYcXydOqEaf92+CSlAQXJ2OBAjmrUyTtqhQ8ty
         p42wU4fkPbEO2d+c19QtMntwrYHsqOpJ/9gTdLn3ff723gpvVcOq4roCmYJzKvoKBrkz
         ALDhxA1WAV3iseYwKfUHchieCm7Gki5TQt9bkN1lxpGRzYt7FNYPOxcgWpxNI94rcfis
         KFsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=AyAU2X5VPRy6Esk965p6WIgVLdsOCthkRQaP1bet484=;
        b=iJMSXeOMIv5Wl/6BVpv0xXvy447+iQZ6XuXLLCmUI0JsO07S8cYGmRHZ+ILY6ymvI0
         FfRfi+elJuX3Ta0uqM6E+0Ls8lQ2QkgejfvqP2fXuBgGQVJ7y2Ot2AX0tXkv2sOANeG8
         xtmrRe/gYBOr/NZnVLdwFpoZS6znb/3KF69j/GzHIdG9tTGn8dg/GsdO+yxHTr8WAeFi
         hDJCj5ZqWgIz0xIhg+E2T6k1+KPhmeqrFVoY2gOGXBMdHFKFWFsA3UdsggleAE9tiUOu
         DYKvYO3Gikx6JlEPotKOeAEfq+SdE6+o6BGKZOVMBmlqyWYD+IS7D3LEQZhpFzgGKT3L
         XcyQ==
X-Gm-Message-State: APjAAAU6/VLDcGk/+qaWK3nRJ/bnzV/I3au7Uwb7ALE3pohnacXjAfmN
	lgJAr9nZvBRwLs56lvZeJSQ=
X-Google-Smtp-Source: APXvYqzD1TRrQOMRA6fYv3Rp3grcWVFf0emNEJzPH1iq6lpzMIs14DUqcof3C1kDqcM7p23ic6rzYw==
X-Received: by 2002:adf:e6c5:: with SMTP id y5mr10255012wrm.210.1579374990506;
        Sat, 18 Jan 2020 11:16:30 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from x1w.redhat.com (113.red-83-57-172.dynamicip.rima-tde.net. [83.57.172.113])
        by smtp.gmail.com with ESMTPSA id z11sm41339690wrt.82.2020.01.18.11.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2020 11:16:29 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	Cleber Rosa <crosa@redhat.com>,
	Niek Linnenbank <nieklinnenbank@gmail.com>
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Fam Zheng <fam@euphon.net>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Kamil Rytarowski <kamil@netbsd.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 3/4] tests/boot_linux_console: Test booting NetBSD via U-Boot on OrangePi PC
Date: Sat, 18 Jan 2020 20:16:22 +0100
Message-Id: <20200118191623.32549-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200118191623.32549-1-f4bug@amsat.org>
References: <20200118191623.32549-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: dUbsDmTKWiTa

This test boots U-Boot then NetBSD (stored on a SD card) on
a OrangePi PC board.

As it requires ~1.3GB of storage, it is disabled by default.

U-Boot is built by the Debian project [1], and the SD card image
is provided by the NetBSD organization [2].

Once the compressed SD card image is downloaded (304MB) and
extracted, this test is fast:

  $ AVOCADO_ALLOW_LARGE_STORAGE=yes \
    avocado --show=app,console run -t machine:orangepi-pc \
      tests/acceptance/boot_linux_console.py
  console: U-Boot SPL 2020.01+dfsg-1 (Jan 08 2020 - 08:19:44 +0000)
  console: DRAM: 1024 MiB
  console: U-Boot 2020.01+dfsg-1 (Jan 08 2020 - 08:19:44 +0000) Allwinner Technology
  console: CPU:   Allwinner H3 (SUN8I 0000)
  console: scanning bus usb@1c1b000 for devices... 1 USB Device(s) found
  console: scanning bus usb@1c1d000 for devices... 1 USB Device(s) found
  console: scanning usb for storage devices... 0 Storage Device(s) found
  console: Hit any key to stop autoboot:  0
  console: => setenv bootargs root=ld0a
  console: => setenv kernel netbsd-GENERIC.ub
  console: => setenv fdtfile dtb/sun8i-h3-orangepi-pc.dtb
  console: => boot
  console: ## Booting kernel from Legacy Image at 42000000 ...
  console: Image Name:   NetBSD/earmv7hf 9.0_RC1
  console: Image Type:   ARM Linux Kernel Image (no loading done) (uncompressed)
  console: XIP Kernel Image (no loading done)
  console: Loading Device Tree to 49ff6000, end 49fffe01 ... OK
  console: Starting kernel ...
  console: [   1.0000000] NetBSD/evbarm (fdt) booting ...
  console: [   1.0000000] NetBSD 9.0_RC1 (GENERIC) #0: Wed Nov 27 16:14:52 UTC 2019
  console: [   1.0000000] simplebus0 at armfdt0: Xunlong Orange Pi PC
  console: [   1.0000000] cpu0 at cpus0: Cortex-A7 r0p5 (Cortex V7A core)
  console: [   1.0000000] cpu0: DC enabled IC enabled WB enabled LABT branch prediction enabled
  console: [   1.0000000] cpu0: 32KB/64B 2-way L1 VIPT Instruction cache
  console: [   1.0000000] cpu0: 32KB/64B 2-way write-back-locking-C L1 PIPT Data cache
  console: [   1.0000000] cpu0: 2304KB/64B 16-way write-through L2 PIPT Unified cache
  console: [   1.0000000] vfp0 at cpu0: NEON MPE (VFP 3.0+), rounding, NaN propagation, denormals
  ...
  console: [   2.8171937] sdmmc0: SD card status: 4-bit, C0
  console: [   2.8234040] ld0 at sdmmc0: <0xaa:0x5859:QEMU!:0x01:0xdeadbeef:0x062>
  console: [   2.8743967] ld0: 1290 MB, 655 cyl, 64 head, 63 sec, 512 bytes/sect x 2642944 sectors
  console: [   3.1588850] ld0: 4-bit width, High-Speed/SDR25, 50.000 MHz
  console: [   4.9942260] WARNING: 4 errors while detecting hardware; check system log.
  console: [   5.0142912] boot device: ld0
  console: [   5.0551260] root on ld0a dumps on ld0b
  console: [   5.2175484] root file system type: ffs
  console: [   5.2858559] kern.module.path=/stand/evbarm/9.0/modules
  console: Tue Jan 18 18:15:15 UTC 2050
  console: Starting root file system check:
  PASS (35.96 s)
  RESULTS    : PASS 1 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CANCEL 0
  JOB TIME   : 36.09 s

Note, this test only took ~65 seconds to run on Travis-CI, see: [3].

This test is based on a description from Niek Linnenbank from [4].

[1] https://wiki.debian.org/InstallingDebianOn/Allwinner#Creating_a_bootable_SD_Card_with_u-boot
[2] https://wiki.netbsd.org/ports/evbarm/allwinner/
[3] https://travis-ci.org/philmd/qemu/jobs/638823612#L3778
[4] https://www.mail-archive.com/qemu-devel@nongnu.org/msg669347.html

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/acceptance/boot_linux_console.py | 63 ++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index 55d0b8b036..56d3d6e9eb 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -16,6 +16,7 @@ import shutil
 from avocado import skipUnless
 from avocado_qemu import Test
 from avocado_qemu import exec_command_and_wait_for_pattern
+from avocado_qemu import interrupt_interactive_console_until_pattern
 from avocado_qemu import wait_for_console_pattern
 from avocado.utils import process
 from avocado.utils import archive
@@ -551,6 +552,68 @@ class BootLinuxConsole(Test):
                                       'to <orangepipc>')
         self.wait_for_console_pattern('Starting Load Kernel Modules...')
 
+    @skipUnless(os.getenv('AVOCADO_ALLOW_LARGE_STORAGE'), 'storage limited')
+    def test_arm_orangepi_uboot_netbsd9(self):
+        """
+        :avocado: tags=arch:arm
+        :avocado: tags=machine:orangepi-pc
+        """
+        # This test download a 304MB compressed image and expand it to 1.3GB...
+        deb_url = ('http://snapshot.debian.org/archive/debian/'
+                   '20200108T145233Z/pool/main/u/u-boot/'
+                   'u-boot-sunxi_2020.01%2Bdfsg-1_armhf.deb')
+        deb_hash = 'f67f404a80753ca3d1258f13e38f2b060e13db99'
+        deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
+        # We use the common OrangePi PC 'plus' build of U-Boot for our secondary
+        # program loader (SPL). We will then set the path to the more specific
+        # OrangePi "PC" device tree blob with 'setenv fdtfile' in U-Boot prompt,
+        # before to boot NetBSD.
+        uboot_path = '/usr/lib/u-boot/orangepi_plus/u-boot-sunxi-with-spl.bin'
+        uboot_path = self.extract_from_deb(deb_path, uboot_path)
+        image_url = ('https://cdn.netbsd.org/pub/NetBSD/NetBSD-9.0_RC1/'
+                     'evbarm-earmv7hf/binary/gzimg/armv7.img.gz')
+        image_hash = '7f58d5c36600430a8bcebe7e999a8945a2be4d1f'
+        image_path_gz = self.fetch_asset(image_url, asset_hash=image_hash)
+        image_path = os.path.join(self.workdir, 'armv7.img')
+        image_drive_args = 'if=sd,format=raw,snapshot=on,file=' + image_path
+        archive.gzip_uncompress(image_path_gz, image_path)
+
+        # dd if=u-boot-sunxi-with-spl.bin of=armv7.img bs=1K seek=8 conv=notrunc
+        with open(uboot_path, 'rb') as f_in:
+            with open(image_path, 'r+b') as f_out:
+                f_out.seek(8 * 1024)
+                shutil.copyfileobj(f_in, f_out)
+
+        self.vm.set_console()
+        self.vm.add_args('-nic', 'user',
+                         '-drive', image_drive_args,
+                         '-no-reboot')
+        self.vm.launch()
+        wait_for_console_pattern(self, 'U-Boot 2020.01+dfsg-1')
+        interrupt_interactive_console_until_pattern(self,
+                                       'Hit any key to stop autoboot:',
+                                       'switch to partitions #0, OK')
+
+        exec_command_and_wait_for_pattern(self, '', '=>')
+        cmd = 'setenv bootargs root=ld0a'
+        exec_command_and_wait_for_pattern(self, cmd, '=>')
+        cmd = 'setenv kernel netbsd-GENERIC.ub'
+        exec_command_and_wait_for_pattern(self, cmd, '=>')
+        cmd = 'setenv fdtfile dtb/sun8i-h3-orangepi-pc.dtb'
+        exec_command_and_wait_for_pattern(self, cmd, '=>')
+        cmd = ("setenv bootcmd 'fatload mmc 0:1 ${kernel_addr_r} ${kernel}; "
+               "fatload mmc 0:1 ${fdt_addr_r} ${fdtfile}; "
+               "fdt addr ${fdt_addr_r}; "
+               "bootm ${kernel_addr_r} - ${fdt_addr_r}'")
+        exec_command_and_wait_for_pattern(self, cmd, '=>')
+
+        exec_command_and_wait_for_pattern(self, 'boot',
+                                          'Booting kernel from Legacy Image')
+        wait_for_console_pattern(self, 'Starting kernel ...')
+        wait_for_console_pattern(self, 'NetBSD 9.0_RC1 (GENERIC)')
+        # Wait for user-space
+        wait_for_console_pattern(self, 'Starting root file system check')
+
     def test_s390x_s390_ccw_virtio(self):
         """
         :avocado: tags=arch:s390x
-- 
2.21.1

Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5518702lfp;
        Mon, 17 Feb 2020 15:24:40 -0800 (PST)
X-Received: by 2002:a1c:59c6:: with SMTP id n189mr1226444wmb.178.1581981880157;
        Mon, 17 Feb 2020 15:24:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581981880; cv=none;
        d=google.com; s=arc-20160816;
        b=JggUwETvADsfSYwsaVub6nb6cVecYHAYVMmCFKO858C3wd66GSZM9Gpkv3UsA7Bb7y
         0p/sdtP6Dk+h2D3QwteTW4ZD5bsBIq3j83fDPZMcwKb+tk9019SMkstrtfTAflZFoPrN
         rcgfIBOGUbl7fEPf2qFFed6s8x9UP7ca1/vFhuOZiz0FIBiJ3aeBlf/0x0quu3pCMz0y
         cgm9caubpmd9o36QI555ZsUEbids/8wHbthMefyu7sUz2SH8do3w/FmX1/ZMvq6/p7uu
         S7fJS4odkolMSsAKwDsevFgUUThq6yGkJF+5sJAnT1BT68+X2pG42lISNixTvlsvS2Vv
         jcLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=7j0tFiVtvyr6UtUTZGoLDquKZYplAcz5mWt5OO2T2sw=;
        b=PrjnH7FWaJo+wUzfGLTXgbgaYrG1uJgUfMfvyEe1dUkvZnI1fVYJ6oYV9Dy9VIU7ag
         HDC4wPrP353WdClH3VmLKrLbIBfsSeqhceZvkE2SaXTokrkQ3g1Te9y005cuyggNrZoA
         swUBtBA/hDageb4DP1cWuUuIi35od8ZxTnT78Zuj6fYgXDyvDMMZkHFZN3jww5gixdMu
         wCqebSItfr94gkla6PkGRA+tEAAubSlreC5WfaC40oj/ulXZw2OvLcg9sYlg+uTApMY6
         djWrnd+9Wqajy0HuEwHF2xH+NnKx0IiiRF7UqFeacltzbjhPXUPfMIMT3xT0X2VoI/CB
         LvsA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=m+ktIijm;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <nieklinnenbank@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id q22sor538524wmj.20.2020.02.17.15.24.40
        (Google Transport Security);
        Mon, 17 Feb 2020 15:24:40 -0800 (PST)
Received-SPF: pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=m+ktIijm;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7j0tFiVtvyr6UtUTZGoLDquKZYplAcz5mWt5OO2T2sw=;
        b=m+ktIijmEiEeWI9G4pj/LQfrxEHfEOTu28gS6jNOkFjk4Hn4gbldQfj9b9FKPvmO6P
         yoFC6L5AvjoXDd5w2iccobjxPZhvlQQpkdsf44SVLhBERVm98BEmm5Z4uUn2WOMwdpGk
         u/WE+GAqy0ddr1DIzWOZdl4AyjWW4Cj1SJy5GktQw5UC1afG2dOFVMISpK+Zn4gYR2Qf
         hSlXODcYW1LnwwQ5lNhFWX9ngbfzeIz7brAL2IkyBDZOeI4634u3jLUutoDeW4QPGVui
         g84fkYrhhKL2eOeK9kaYhAnV52KXr9NvyE/sQEgDm2pjzP8M4g2ZXhtqWHO49mKFwJJL
         Rj7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7j0tFiVtvyr6UtUTZGoLDquKZYplAcz5mWt5OO2T2sw=;
        b=q+WUFNSy62r+jtHbM/aRLBoixGKoJLPJs4xQsswoi772H/heCkU8VcpJ5cmf4WEz55
         wQuvyCyc4nFZ8lINgqSjSc23L09d0kzQQlbvwNPnfjCpBvjnp+I8FkCG2+yJ5mjtUlxc
         sC1n3iOAi7uFnBpsU1Po8T9zJzUk0YxgxKvejCHGTkq473xbMtDY0lf3b0V+012n1aEw
         Pf7OW8IrfsyyXjC3/atpV3RShuf3kB7TLVkzmy/ETAnwq7Ihbl3EIqSG65bzlh6OYy6M
         nHVafRXSvT4puLeBZ1UZivf+DzdAKCaE04NSmb4p/ZP2YyApaUs1gE0A5ptmZj7YYXKa
         kvCw==
X-Gm-Message-State: APjAAAUO6yyplE9qjDxtXkcb7wgzr8mIXT2cX09SE97sAm6GgQeQKxpm
	rZaBzq+CvR+6r8nPY4bKXrM=
X-Google-Smtp-Source: APXvYqzabXbnXBXXfNuqA0ebOn7a2IfR8al/PexyWE784ndpj6ebRm+9N4eSa/L2Wn6AReQ7Rpt/zg==
X-Received: by 2002:a1c:cc06:: with SMTP id h6mr1308108wmb.118.1581981879726;
        Mon, 17 Feb 2020 15:24:39 -0800 (PST)
Return-Path: <nieklinnenbank@gmail.com>
Received: from pavilion.home ([2a02:a456:6be8:1:8edc:d4ff:fe8b:18b7])
        by smtp.gmail.com with ESMTPSA id w1sm3244831wro.72.2020.02.17.15.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2020 15:24:39 -0800 (PST)
From: Niek Linnenbank <nieklinnenbank@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	philmd@redhat.com,
	b.galvani@gmail.com,
	jasowang@redhat.com,
	alex.bennee@linaro.org,
	imammedo@redhat.com,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Niek Linnenbank <nieklinnenbank@gmail.com>
Subject: [PATCH v5 17/18] tests/boot_linux_console: Test booting NetBSD via U-Boot on OrangePi PC
Date: Tue, 18 Feb 2020 00:24:10 +0100
Message-Id: <20200217232411.30096-18-nieklinnenbank@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200217232411.30096-1-nieklinnenbank@gmail.com>
References: <20200217232411.30096-1-nieklinnenbank@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: BGX2HLgMsg3O

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

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
  console: [   1.0000000] NetBSD 9.0 (GENERIC) #0: Fri Feb 14 00:06:28 UTC 2020
  console: [   1.0000000]         mkrepro@mkrepro.NetBSD.org:/usr/src/sys/arch/evbarm/compile/GENERIC
  console: [   1.0000000] total memory = 1024 MB
  console: [   1.0000000] avail memory = 1003 MB
  console: [   1.0000000] armfdt0 (root)
  console: [   1.0000000] simplebus0 at armfdt0: Xunlong Orange Pi PC
  console: [   1.0000000] cpu0 at cpus0: Cortex-A7 r0p5 (Cortex V7A core)
  console: [   1.0000000] cpu0: DC enabled IC enabled WB enabled LABT branch prediction enabled
  console: [   1.0000000] cpu0: 32KB/64B 2-way L1 VIPT Instruction cache
  console: [   1.0000000] cpu0: 32KB/64B 2-way write-back-locking-C L1 PIPT Data cache
  console: [   1.0000000] cpu0: 2304KB/64B 16-way write-through L2 PIPT Unified cache
  console: [   1.0000000] vfp0 at cpu0: NEON MPE (VFP 3.0+), rounding, NaN propagation, denormals
  ...
  console: [   2.3812082] sdmmc0: SD card status: 4-bit, C0
  console: [   2.3812082] ld0 at sdmmc0: <0xaa:0x5859:QEMU!:0x01:0xdeadbeef:0x062>
  console: [   2.4012856] ld0: 1226 MB, 622 cyl, 64 head, 63 sec, 512 bytes/sect x 2511872 sectors
  console: [   2.5321222] ld0: 4-bit width, High-Speed/SDR25, 50.000 MHz
  console: [   3.1068718] WARNING: 4 errors while detecting hardware; check system log.
  console: [   3.1179868] boot device: ld0
  console: [   3.1470623] root on ld0a dumps on ld0b
  console: [   3.2464436] root file system type: ffs
  console: [   3.2897123] kern.module.path=/stand/evbarm/9.0/modules
  console: Mon Feb 17 20:33:35 UTC 2020
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
[NL: changed test to use NetBSD 9.0 final release and -global allwinner-rtc.base-year]
Tested-by: Niek Linnenbank <nieklinnenbank@gmail.com>
Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
---
 tests/acceptance/boot_linux_console.py | 70 ++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index a70ac4a6cc..1369354ac2 100644
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
@@ -661,6 +662,75 @@ class BootLinuxConsole(Test):
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
+        image_url = ('https://cdn.netbsd.org/pub/NetBSD/NetBSD-9.0/'
+                     'evbarm-earmv7hf/binary/gzimg/armv7.img.gz')
+        image_hash = '2babb29d36d8360adcb39c09e31060945259917a'
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
+                # Extend image, to avoid that NetBSD thinks the partition
+                # inside the image is smaller than device size itself
+                f_out.seek(0, 2)
+                f_out.seek(64 * 1024 * 1024, 1)
+                f_out.write(bytearray([0x00]))
+
+        self.vm.set_console()
+        self.vm.add_args('-nic', 'user',
+                         '-drive', image_drive_args,
+                         '-global', 'allwinner-rtc.base-year=2000',
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
+        wait_for_console_pattern(self, 'NetBSD 9.0 (GENERIC)')
+        # Wait for user-space
+        wait_for_console_pattern(self, 'Starting root file system check')
+
     def test_s390x_s390_ccw_virtio(self):
         """
         :avocado: tags=arch:s390x
-- 
2.17.1

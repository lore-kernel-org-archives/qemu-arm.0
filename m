Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1294562lfc;
        Wed, 11 Mar 2020 15:19:18 -0700 (PDT)
X-Received: by 2002:a1c:7f86:: with SMTP id a128mr856544wmd.185.1583965158702;
        Wed, 11 Mar 2020 15:19:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583965158; cv=none;
        d=google.com; s=arc-20160816;
        b=kgLU0i/zqRN8FSDIvL2qbPQ2jouUZbX5AKSUWM8Bn+DZja5bsWSlA8tNoCdnDAfXsb
         IVrtJBIazW/avZkbnqgdF8aX/azbagQQUugVcSCVHTf27NaaYes4uFe503DEaumNSgDn
         QI9I7E4TX3+AZUd8nykNaddFoGadikisdx/3W2RkqMI3owkNo3n4FL7QO5UDlIZlJ09K
         JehcQcJWMnlpWN0X0eFnuhF+1+6uGm+07JdIkl4+Jb2f/szk+936DcLcRUmxYctcYksM
         NQc+Dps7poYtiHG8lqXb2T8kWYS8nQTIFSKpwi31vbYxr/qLE0kZ4bq6aKfeu76cUMd3
         cDPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=NPJtfEiG0VH32Ta+NOQqc9n8SVBLH+0273TF6GCuC1k=;
        b=qXELrGhPgLgdMLprYWMXkIxnoEdU0cBxeb20pVrH3mXAJBatvOGAMXFlybSOZrH2lE
         fM0qn7A/6IAeK5bNyY9SUsBXcOKrl7fQE5hqB7lx32LrHZWL5aH4cHjdgON9ZoPiya0a
         /qg5wFcJlSbyianiz4Ka218l0pgGtKSJVvcpkFo+8V5RVhmsVdwJhLM3cQyYXBZKztBO
         k2oWsHKkFmWSYabxnTBt9YNxkx/vd6sANkWaq3eQhACv9Yy6VcKMgbO1stTcn9XTH1xF
         15nasdzFDBAxVk59CmQmGSp/KIBPyKVGkns0CvwaLi8ruKNRv8gtm4IMPD8qShjhhFWE
         QdRw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=rWxzFJ6c;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <nieklinnenbank@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id k14sor2121471wro.0.2020.03.11.15.19.18
        (Google Transport Security);
        Wed, 11 Mar 2020 15:19:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=rWxzFJ6c;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NPJtfEiG0VH32Ta+NOQqc9n8SVBLH+0273TF6GCuC1k=;
        b=rWxzFJ6c7lf9C1cvmO4ExOXF0eyxtfd14TEZgHf+WQ+6Iv+Iw6+EofLg9KtRD92d8E
         +mzCQEN63vnYhPbPq6x1ZqKFxF7A1MtAo3IVgn3Hl1kyykXwVZ28PINx93ZuhM9zpnat
         kT6wSH+86AM1WCYcS/weJgHf0YmCfesu7BSIIiArzhA2XA6WNWkxru2EOCAyoBN2ZFUL
         pRsj0Zl07GbRLRISCwQjndbShtOZSXAbX2I6ee5OuGKh9N5DtH8/QEP4/mecxwEidpqC
         iivcneOSKmsxwXJctXhjjNWipMcm2tlXrCMH61Jf4/02UNNe5mJtxnCesC1LHGECDgEQ
         7ytw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NPJtfEiG0VH32Ta+NOQqc9n8SVBLH+0273TF6GCuC1k=;
        b=JZt7AYXLM52cDKhC+ZbvM1SrGirnX0eMwtfoh/zHSzeeoY1+50Gk6c1jw6qrQ93/0B
         8ZLR/FFPB5qzRNAi15IQeZ3XTqkaf3ijaAUNleUGd/Pk0sCMgepkRKvBVtlcXayvDzW6
         fB/KXvFB9PrSLZAofPulBADALJHLO7nHhXYcI/nMfaRylgOHkPVfw4qqyOxf2mb5Jbcj
         N4+YilpccLv9er9x/OnLXi3L6BzbgyOFCYzHJzSid3sI+lHv7sUQtaxXxE1nyUbkq69d
         lthnkjkm9VkHMkDRKdt63AlziwBsOYqQYZgNOf25UiL3eE9myouIB3FMdvn0UsdsyWBw
         j1mQ==
X-Gm-Message-State: ANhLgQ3cp/5wxeBi/6ncSGWIcHpiFhJsKANDGfcriVL4iaKI8d7AF8dz
	iU0b98Mb3IbW9uX1qWVlFHrnrM3u
X-Google-Smtp-Source: ADFU+vtBCkYx3VgzVs2U0+1dKUA+sUUpm+XgvdOKr//6dJciav3Hj77EOvpW3oz+qWFGS9ZUeRsvmA==
X-Received: by 2002:adf:f002:: with SMTP id j2mr6853942wro.296.1583965158264;
        Wed, 11 Mar 2020 15:19:18 -0700 (PDT)
Return-Path: <nieklinnenbank@gmail.com>
Received: from pavilion.home ([2a02:a456:6be8:1:8edc:d4ff:fe8b:18b7])
        by smtp.gmail.com with ESMTPSA id q7sm19346796wrd.54.2020.03.11.15.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 15:19:17 -0700 (PDT)
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
Subject: [PATCH v8 17/18] tests/boot_linux_console: Test booting NetBSD via U-Boot on OrangePi PC
Date: Wed, 11 Mar 2020 23:18:53 +0100
Message-Id: <20200311221854.30370-18-nieklinnenbank@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200311221854.30370-1-nieklinnenbank@gmail.com>
References: <20200311221854.30370-1-nieklinnenbank@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: GO1mabqWbaQQ

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
Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Alex Bennée <alex.bennee@linaro.org>
[NL: changed test to use NetBSD 9.0 final release and -global allwinner-rtc.base-year]
---
 tests/acceptance/boot_linux_console.py | 70 ++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index e035c88b07..f825cd9ef5 100644
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
@@ -667,6 +668,75 @@ class BootLinuxConsole(Test):
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
+                # inside the image is larger than device size itself
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

Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5518675lfp;
        Mon, 17 Feb 2020 15:24:37 -0800 (PST)
X-Received: by 2002:adf:ea48:: with SMTP id j8mr25852278wrn.363.1581981877481;
        Mon, 17 Feb 2020 15:24:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581981877; cv=none;
        d=google.com; s=arc-20160816;
        b=ZLPF4QMxJJX2fz9LXKMFk4S6Wex0C1JVtNzBSTfNF08GleldWP/0W5JzS+08GN05W0
         FMkbUwmd/D6VuxyWefM4qpCDKOzi7NTGV9oP262daQK1rWuE4T4yPfeRHiTQawJeomz8
         YXgf2qy3g03vLzTkwipD/PrCUfDTyco3zigtMSQ8LuGm55SfrBR9beLpHc4v23vM9aoU
         j5JP8g4vDQX55vkGMoEmeE3DzZZp4gmN73l/RnDCoArqd8wG03/GWbj+HfPlujD9DSxi
         60F0E1FKfWQyh6jjvizIP2tP9OZfHRnQn/jwqxR7Sk04Y5c5JTajYJYPsk2LoFh5U9ub
         iR9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=/HJybUpdOHqvFv3N4GdlfFuG/BjvM7fIXK9BS11nCpY=;
        b=ExULla9BAy0ICZNh1ENTYkKNWxIMreXOETklzry9Q7LyUk8a/2D9Rsq+kfnjzeWHnU
         wOdYGOoxVHbO6e8PH4Ee2SPvlMHLiRn7EzPhlC8YeeyjcG6Ejg1boctyH5k3RBV9g5hP
         jy0NQRAjOZJijsDrMh4QNebKtRSQBRzArnB2T9v+UHXtB7daz/kYzcBXbstqMOXFTxYz
         wDXweshnoo5JhMOokEwUur/TgWWe9l50cFCXae9Voq6KMxQWRXxHlt7E2RSpZi51bl5m
         pC4c4ZpO2mp3KtSDaWwfhLDCpjyooUwfKB9fKitlr1aGlrnhxHnNk6clSvdoT+PN08yL
         cFXA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=ojxQEwJ6;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <nieklinnenbank@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id x6sor1396141wrp.28.2020.02.17.15.24.37
        (Google Transport Security);
        Mon, 17 Feb 2020 15:24:37 -0800 (PST)
Received-SPF: pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=ojxQEwJ6;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/HJybUpdOHqvFv3N4GdlfFuG/BjvM7fIXK9BS11nCpY=;
        b=ojxQEwJ6hCSBFIS+B4kx1IdbXBnSzIHtSvrG80ytz3K/iEPyqSKDJoBAYaUbNOVI3B
         2wdm+6iD7jEMbkcZNpJDoIBDKRXHgKBM5tK9oihSJO1FS14OZSHV/hwferFUfvbiU/Lu
         m3w8J3mUzSZBxxRZSZFe8/E3ZFs+Hicdr9N/NmKY3yrTgEWtXfPDqsHaoTWZi1BjTywS
         JX0P/RjuuhHBm/N4gp9AmGxNPESFSMJE7lP3RABu4KU8aLl6UT4Qheop8Apw5kCRwgWW
         V4S7c5AuehOf3FL9QNkZLZkyF0/hX5uS+5lKNh3EIDFkk8zuHPVWfMOdktTsgQQUjRtC
         RIwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/HJybUpdOHqvFv3N4GdlfFuG/BjvM7fIXK9BS11nCpY=;
        b=SPmbcixJ+7K2yVDUHCDC7q2CDRMFz9CAOyQJwqZyl8BC+vM3bGASW0nvwb2+oklK3W
         qU9bAXNnLk9laiEDpr0OqVWrQQmbB0AMKKW+SgaSWgQpcOisWU0uYU3DjMt3XQo87vEy
         ujeIkPOhPwPIa1pt+2MbnZzfknAfeZXcNf5VFp1NkmNjSl5giNQvG5DyFWSE4viUFe6l
         u6ydloPuGded35Yw+taJwwARq7c2U2rsBxlm/aMCAlDJZ5DTly64rifRG8hMEO/kOj5O
         FD0mB0E2Dfav21zp2wRcNeqx6uqE0dR/eSazJIUAMzTx0UGL608O7COt+axVxsL7DXn4
         bZPA==
X-Gm-Message-State: APjAAAVdCtcZ3YEVZaVe//g7Pj1oPutDNsRwh18vro4qkLwDUkMLbkEb
	PQSavBvimIdYx2mbY+ySlc8=
X-Google-Smtp-Source: APXvYqwzO3vAr1gCIZvmG8iCiAXeKrHxI5Gm5tvqSD8trLLo1KPdY9pVBipIHzednXQ+C86WHz19vQ==
X-Received: by 2002:a5d:6789:: with SMTP id v9mr25824898wru.55.1581981877085;
        Mon, 17 Feb 2020 15:24:37 -0800 (PST)
Return-Path: <nieklinnenbank@gmail.com>
Received: from pavilion.home ([2a02:a456:6be8:1:8edc:d4ff:fe8b:18b7])
        by smtp.gmail.com with ESMTPSA id w1sm3244831wro.72.2020.02.17.15.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2020 15:24:36 -0800 (PST)
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
Subject: [PATCH v5 14/18] tests/boot_linux_console: Add initrd test for the Orange Pi PC board
Date: Tue, 18 Feb 2020 00:24:07 +0100
Message-Id: <20200217232411.30096-15-nieklinnenbank@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200217232411.30096-1-nieklinnenbank@gmail.com>
References: <20200217232411.30096-1-nieklinnenbank@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: sOPz0S0OZz5+

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

This test boots a Linux kernel on a OrangePi PC board and verify
the serial output is working.

The kernel image and DeviceTree blob are built by the Armbian
project (based on Debian):
https://www.armbian.com/orange-pi-pc/

The cpio image used comes from the linux-build-test project:
https://github.com/groeck/linux-build-test

If ARM is a target being built, "make check-acceptance" will
automatically include this test by the use of the "arch:arm" tags.

Alternatively, this test can be run using:

  $ avocado --show=console run -t machine:orangepi-pc tests/acceptance/boot_linux_console.py
  console: Uncompressing Linux... done, booting the kernel.
  console: Booting Linux on physical CPU 0x0
  console: Linux version 4.20.7-sunxi (root@armbian.com) (gcc version 7.2.1 20171011 (Linaro GCC 7.2-2017.11)) #5.75 SMP Fri Feb 8 09:02:10 CET 2019
  console: CPU: ARMv7 Processor [410fc075] revision 5 (ARMv7), cr=50c5387d
  console: CPU: div instructions available: patching division code
  console: CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing instruction cache
  console: OF: fdt: Machine model: Xunlong Orange Pi PC
  [...]
  console: Trying to unpack rootfs image as initramfs...
  console: Freeing initrd memory: 3256K
  console: Freeing unused kernel memory: 1024K
  console: Run /init as init process
  console: mount: mounting devtmpfs on /dev failed: Device or resource busy
  console: Starting logging: OK
  console: Initializing random number generator... random: dd: uninitialized urandom read (512 bytes read)
  console: done.
  console: Starting network: OK
  console: Found console ttyS0
  console: Linux version 4.20.7-sunxi (root@armbian.com) (gcc version 7.2.1 20171011 (Linaro GCC 7.2-2017.11)) #5.75 SMP Fri Feb 8 09:02:10 CET 2019
  console: Boot successful.
  console: cat /proc/cpuinfo
  console: / # cat /proc/cpuinfo
  console: processor      : 0
  console: model name     : ARMv7 Processor rev 5 (v7l)
  console: BogoMIPS       : 125.00
  console: Features       : half thumb fastmult vfp edsp neon vfpv3 tls vfpv4 idiva idivt vfpd32 lpae evtstrm
  console: CPU implementer        : 0x41
  console: CPU architecture: 7
  console: CPU variant    : 0x0
  console: CPU part       : 0xc07
  console: CPU revision   : 5
  [...]
  console: processor      : 3
  console: model name     : ARMv7 Processor rev 5 (v7l)
  console: BogoMIPS       : 125.00
  console: Features       : half thumb fastmult vfp edsp neon vfpv3 tls vfpv4 idiva idivt vfpd32 lpae evtstrm
  console: CPU implementer        : 0x41
  console: CPU architecture: 7
  console: CPU variant    : 0x0
  console: CPU part       : 0xc07
  console: CPU revision   : 5
  console: Hardware       : Allwinner sun8i Family
  console: Revision       : 0000
  console: Serial         : 0000000000000000
  console: cat /proc/iomem
  console: / # cat /proc/iomem
  console: 01000000-010fffff : clock@1000000
  console: 01c00000-01c00fff : system-control@1c00000
  console: 01c02000-01c02fff : dma-controller@1c02000
  [...]
  console: reboot
  console: / # reboot
  console: / # Found console ttyS0
  console: Stopping network: OK
  console: hrtimer: interrupt took 21852064 ns
  console: Saving random seed... random: dd: uninitialized urandom read (512 bytes read)
  console: done.
  console: Stopping logging: OK
  console: umount: devtmpfs busy - remounted read-only
  console: umount: can't unmount /: Invalid argument
  console: The system is going down NOW!
  console: Sent SIGTERM to all processes
  console: Sent SIGKILL to all processes
  console: Requesting system reboot
  console: reboot: Restarting system
  PASS (48.32 s)
  JOB TIME   : 49.16 s

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
[NL: rename in commit message Raspbian to Armbian, remove vm.set_machine()]
Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
---
 tests/acceptance/boot_linux_console.py | 40 ++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index 6f5af582f3..dabc8ef2af 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -532,6 +532,46 @@ class BootLinuxConsole(Test):
         console_pattern = 'Kernel command line: %s' % kernel_command_line
         self.wait_for_console_pattern(console_pattern)
 
+    def test_arm_orangepi_initrd(self):
+        """
+        :avocado: tags=arch:arm
+        :avocado: tags=machine:orangepi-pc
+        """
+        deb_url = ('https://apt.armbian.com/pool/main/l/'
+                   'linux-4.20.7-sunxi/linux-image-dev-sunxi_5.75_armhf.deb')
+        deb_hash = '1334c29c44d984ffa05ed10de8c3361f33d78315'
+        deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
+        kernel_path = self.extract_from_deb(deb_path,
+                                            '/boot/vmlinuz-4.20.7-sunxi')
+        dtb_path = '/usr/lib/linux-image-dev-sunxi/sun8i-h3-orangepi-pc.dtb'
+        dtb_path = self.extract_from_deb(deb_path, dtb_path)
+        initrd_url = ('https://github.com/groeck/linux-build-test/raw/'
+                      '2eb0a73b5d5a28df3170c546ddaaa9757e1e0848/rootfs/'
+                      'arm/rootfs-armv7a.cpio.gz')
+        initrd_hash = '604b2e45cdf35045846b8bbfbf2129b1891bdc9c'
+        initrd_path_gz = self.fetch_asset(initrd_url, asset_hash=initrd_hash)
+        initrd_path = os.path.join(self.workdir, 'rootfs.cpio')
+        archive.gzip_uncompress(initrd_path_gz, initrd_path)
+
+        self.vm.set_console()
+        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
+                               'console=ttyS0,115200 '
+                               'panic=-1 noreboot')
+        self.vm.add_args('-kernel', kernel_path,
+                         '-dtb', dtb_path,
+                         '-initrd', initrd_path,
+                         '-append', kernel_command_line,
+                         '-no-reboot')
+        self.vm.launch()
+        self.wait_for_console_pattern('Boot successful.')
+
+        exec_command_and_wait_for_pattern(self, 'cat /proc/cpuinfo',
+                                                'Allwinner sun8i Family')
+        exec_command_and_wait_for_pattern(self, 'cat /proc/iomem',
+                                                'system-control@1c00000')
+        exec_command_and_wait_for_pattern(self, 'reboot',
+                                                'reboot: Restarting system')
+
     def test_s390x_s390_ccw_virtio(self):
         """
         :avocado: tags=arch:s390x
-- 
2.17.1

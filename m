Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp969960lff;
        Sat, 18 Jan 2020 16:51:27 -0800 (PST)
X-Received: by 2002:a05:600c:244:: with SMTP id 4mr12178675wmj.40.1579395087358;
        Sat, 18 Jan 2020 16:51:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579395087; cv=none;
        d=google.com; s=arc-20160816;
        b=HIBVyeJzx0xKl4FQs4nQHKGXJZaXv9OE24M6hGdvR7UgkYmeyXENRbx/dwar4IbIkj
         WdyNueW/J4Evbqh2/whunJvNjki5IVb6iJ1kcX1IhcpNOFAU1HfmW9ys5Humt7M5R/4t
         OvCut0GqS0f8Nw3UnkTlxx8JeydLcD/UF14LvizrVDSWNUdsgEhm0MIpohZO5bLjphBt
         iTT+8GSSfByIQ0LhFoa6jYNhApZE8GAHgh6WbaY0GDRhzCofi8zIq6p3JcP8ewsAT/P7
         eHo829Tmrrm8/R16q9FZg4CiAF7NWdqQm5onMkiw9Ddw/dF2Fq/Fy060jeoGDtj3jv/0
         8RFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=LIAzqnSWqBgGPs6e6yKvV71Abn9Aq2nXG/Pgv3ntD18=;
        b=kE4oTBmdIVdwakAPbmktUWwtZvMoGZM3TrVGsTSRzJAJ2vqxxdk/4aoBmgHMxuCwAe
         ZA4GnprJJWi6ky6zVDFUAHssKtTRDA8D6mDXbz9CkMgJzbwB0gAQIYle+edD4fDzRTyt
         HlmwPs1EhijHAXXSVeCqHainDiRqqLN9rqnIbnxNEilWP3GBdGThjU1Vx2C5gOYckm/4
         gpI2xush4AkhLxPKpQACvdguwoSIPkGH9TPLJYXlA2vb0fLMvexJBwl/RDr1LxENnhka
         kJmVIc9YuGoz7zO3kda2AIMtSukR3OB/kIFtD5l/m2yCWXYmaZ8qacqVXCzfgLkyvRmM
         jcww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="UNVv/RiU";
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <nieklinnenbank@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id x12sor9909888wmk.0.2020.01.18.16.51.27
        (Google Transport Security);
        Sat, 18 Jan 2020 16:51:27 -0800 (PST)
Received-SPF: pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="UNVv/RiU";
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LIAzqnSWqBgGPs6e6yKvV71Abn9Aq2nXG/Pgv3ntD18=;
        b=UNVv/RiUcHA2ZWZxgYjIkv40kuP5rwi/kAGPa8Y1Eedh0Od3eOqJK0T81W6DkPRtG2
         WY0z7UjPBI6zZ4+/q4QrOoZZj+vkwkH2tclfRmpuBoXtuWJZ6CISfh9gYB6dyMt+oFoS
         ShXwdi2601iT4YVd2WEJQI/K5HA0Fja2HY7wIrR+nNFIFXjG6BeQF0gzAqiJ+rYpNiS1
         kINc4nEmxln3fBYCRdnJX9LNQM6v9i9t6CH+ANZHMqbwUTOC4AKvuolUC2vLYI8TIxQF
         Z3Df5l0DJxEd+TlPLfvnyiuJt+cCsUKfr1Z/tUgQyjXQOHrQwvFyuyIbc0AeFvvs5PI8
         Mz9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LIAzqnSWqBgGPs6e6yKvV71Abn9Aq2nXG/Pgv3ntD18=;
        b=inmedRAPmoVMXi6Ea9KG9QOxJ3+kXdJMM35BjBbBxhVv0i8l4Ess3waOQCkWIQnd44
         cfu3p7Sf+G9emT1rXpol8VWURJxktU5L5lfNE+thl8pOyZFOuGI28WDetgPJ20UUdx0p
         wJcfcSgw/A44CgbrDWR2UUeRI4DZIpuWiPA9zt4wiwn/gRNF6hQOAwEG8k2P3zd7apWC
         wuOSmj+sxrKHVl/jPr0B0ppvAwKnIEb0rv7hYs1Z4eKmmTNZqENfPBac8qfkedl4h9sW
         7xyVTlO8XQMjGX/ZTVjyAbAbgpGzQ0IjwZQlNw/L4+X+y5VQ7FxgI62mHUtzeWTK63K2
         0URg==
X-Gm-Message-State: APjAAAX8tWs9zaqYg7xqAnfCSbgGjDlmAn10P6EwlS6emJ6Mc8EjISyp
	3H6f1ijBhChn9ANkct6JHNs=
X-Google-Smtp-Source: APXvYqyImkFS1F9KPGEMMpOyVEbeGT5zFUrh3lB5FbivkX3Y5brwsKX7tyH0Wa8nWVAwM8U1v5uQqg==
X-Received: by 2002:a1c:6605:: with SMTP id a5mr11370181wmc.112.1579395086967;
        Sat, 18 Jan 2020 16:51:26 -0800 (PST)
Return-Path: <nieklinnenbank@gmail.com>
Received: from pavilion.home ([2a02:a456:6be8:1:8edc:d4ff:fe8b:18b7])
        by smtp.gmail.com with ESMTPSA id h2sm41763568wrv.66.2020.01.18.16.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2020 16:51:26 -0800 (PST)
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
Subject: [PATCH v4 15/20] tests/boot_linux_console: Add a SD card test for the OrangePi PC board
Date: Sun, 19 Jan 2020 01:50:57 +0100
Message-Id: <20200119005102.3847-16-nieklinnenbank@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200119005102.3847-1-nieklinnenbank@gmail.com>
References: <20200119005102.3847-1-nieklinnenbank@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: J81Z5wQBKGQ9

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

The kernel image and DeviceTree blob are built by the Armbian
project (based on Debian):
https://www.armbian.com/orange-pi-pc/

The SD image is from the kernelci.org project:
https://kernelci.org/faq/#the-code

If ARM is a target being built, "make check-acceptance" will
automatically include this test by the use of the "arch:arm" tags.

Alternatively, this test can be run using:

  $ avocado --show=console run -t machine:orangepi-pc tests/acceptance/boot_linux_console.py
  console: Uncompressing Linux... done, booting the kernel.
  console: Booting Linux on physical CPU 0x0
  console: Linux version 4.20.7-sunxi (root@armbian.com) (gcc version 7.2.1 20171011 (Linaro GCC 7.2-2017.11)) #5.75 SMP Fri Feb 8 09:02:10 CET 2019
  console: CPU: ARMv7 Processor [410fc075] revision 5 (ARMv7), cr=50c5387d
  [...]
  console: sunxi-wdt 1c20ca0.watchdog: Watchdog enabled (timeout=16 sec, nowayout=0)
  console: sunxi-mmc 1c0f000.mmc: Linked as a consumer to regulator.2
  console: sunxi-mmc 1c0f000.mmc: Got CD GPIO
  console: ledtrig-cpu: registered to indicate activity on CPUs
  console: hidraw: raw HID events driver (C) Jiri Kosina
  console: usbcore: registered new interface driver usbhid
  console: usbhid: USB HID core driver
  console: Initializing XFRM netlink socket
  console: sunxi-mmc 1c0f000.mmc: initialized, max. request size: 16384 KB
  console: NET: Registered protocol family 10
  console: mmc0: host does not support reading read-only switch, assuming write-enable
  console: mmc0: Problem switching card into high-speed mode!
  console: mmc0: new SD card at address 4567
  console: mmcblk0: mmc0:4567 QEMU! 60.0 MiB
  [...]
  console: EXT4-fs (mmcblk0): mounting ext2 file system using the ext4 subsystem
  console: EXT4-fs (mmcblk0): mounted filesystem without journal. Opts: (null)
  console: VFS: Mounted root (ext2 filesystem) on device 179:0.
  console: Run /sbin/init as init process
  console: EXT4-fs (mmcblk0): re-mounted. Opts: block_validity,barrier,user_xattr,acl
  console: Starting syslogd: OK
  console: Starting klogd: OK
  console: Populating /dev using udev: udevd[203]: starting version 3.2.7
  console: /bin/sh: can't access tty; job control turned off
  console: cat /proc/partitions
  console: / # cat /proc/partitions
  console: major minor  #blocks  name
  console: 1        0       4096 ram0
  console: 1        1       4096 ram1
  console: 1        2       4096 ram2
  console: 1        3       4096 ram3
  console: 179        0      61440 mmcblk0
  console: reboot
  console: / # reboot
  console: umount: devtmpfs busy - remounted read-only
  console: EXT4-fs (mmcblk0): re-mounted. Opts: (null)
  console: The system is going down NOW!
  console: Sent SIGTERM to all processes
  console: Sent SIGKILL to all processes
  console: Requesting system reboot
  console: reboot: Restarting system
  JOB TIME   : 68.64 s

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
[NL: rename in commit message Raspbian to Armbian, remove vm.set_machine()]
Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
---
 tests/acceptance/boot_linux_console.py | 41 ++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index 463aa65f4d..50294e1675 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -550,6 +550,47 @@ class BootLinuxConsole(Test):
         exec_command_and_wait_for_pattern(self, 'reboot',
                                                 'reboot: Restarting system')
 
+    def test_arm_orangepi_sd(self):
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
+        rootfs_url = ('http://storage.kernelci.org/images/rootfs/buildroot/'
+                      'kci-2019.02/armel/base/rootfs.ext2.xz')
+        rootfs_hash = '692510cb625efda31640d1de0a8d60e26040f061'
+        rootfs_path_xz = self.fetch_asset(rootfs_url, asset_hash=rootfs_hash)
+        rootfs_path = os.path.join(self.workdir, 'rootfs.cpio')
+        archive.lzma_uncompress(rootfs_path_xz, rootfs_path)
+
+        self.vm.set_console()
+        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
+                               'console=ttyS0,115200 '
+                               'root=/dev/mmcblk0 rootwait rw '
+                               'panic=-1 noreboot')
+        self.vm.add_args('-kernel', kernel_path,
+                         '-dtb', dtb_path,
+                         '-drive', 'file=' + rootfs_path + ',if=sd,format=raw',
+                         '-append', kernel_command_line,
+                         '-no-reboot')
+        self.vm.launch()
+        shell_ready = "/bin/sh: can't access tty; job control turned off"
+        self.wait_for_console_pattern(shell_ready)
+
+        exec_command_and_wait_for_pattern(self, 'cat /proc/cpuinfo',
+                                                'Allwinner sun8i Family')
+        exec_command_and_wait_for_pattern(self, 'cat /proc/partitions',
+                                                'mmcblk0')
+        exec_command_and_wait_for_pattern(self, 'reboot',
+                                                'reboot: Restarting system')
+
     def test_s390x_s390_ccw_virtio(self):
         """
         :avocado: tags=arch:s390x
-- 
2.17.1

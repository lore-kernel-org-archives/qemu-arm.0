Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1294526lfc;
        Wed, 11 Mar 2020 15:19:17 -0700 (PDT)
X-Received: by 2002:a1c:7c05:: with SMTP id x5mr804507wmc.67.1583965156900;
        Wed, 11 Mar 2020 15:19:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583965156; cv=none;
        d=google.com; s=arc-20160816;
        b=CKAMqzabgi/alb4AQsWxuabhgwCAQE2Xla4sN6wbNK8Ujurl8EQJnGbOGIrYSuvZTZ
         RdR/kksIZelkYKSFtJG0nlR9Y1piAK1zytt8ODCqjrClLRtn2Yx+CNstYciZm74pJpxm
         MJa2HYM1bCFrOn5WquZVkhIfTrvVHJ9PkyBg9veSkoH2m3FIlCVu4WdMsC0Y29sr4IJL
         zD+EPs8H066qegJ5i8m8wK7A6JVPQS4hL03LquRTy0pSW99h/UDA+dOeUmNr5NgOtEW6
         cx1k6EPmdIOiMR3a093Ypoa3p5OGeTxAa/4gjjKwc0mWFXDRtos08Cc8tfy9OJLxvAgk
         lTgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=FmA2d4h4NyrqLRtm0naf+nfidTXr4nlY0iMOqjCMQIA=;
        b=IU5lfvDXxibSclV+q1cgE4DjB7b9BqxdkxkI9iIcduijj00yXDyMpbNGkUR4BKVdmz
         ZxiTFQFsULZhD0AtQnfoaC7LmvJ5uxq9I73YBD9s+EubrbLnSM8QVoB2MbsKtV2rYy8E
         1sLgJdOxX1g3gwGmg1kx1n5NJwKOxQ0HnsH6FJQmmE3dq0Zc3J4gFcv9Bs7+3802sQdb
         hwbVo9UF2kOylt/1VbC3kBHNkUajgY1Ssdq6it6igbjfHBfknPfD4s59MNkum6j2tkY6
         TsbHGZTPf1ynYqJuzhwud/435h7HrcXjcH9ZU14PMNqgg4cvwEJ7R9bj83TlJlTLwUXa
         smRg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=uECIozUv;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <nieklinnenbank@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id j11sor2132431wrs.6.2020.03.11.15.19.16
        (Google Transport Security);
        Wed, 11 Mar 2020 15:19:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=uECIozUv;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FmA2d4h4NyrqLRtm0naf+nfidTXr4nlY0iMOqjCMQIA=;
        b=uECIozUv+toLpMo3HvgPbmSyRc561J8rMYtyXiDzlmpQH09WzyLggsg0IM0YTDmt73
         YXM8c8o3PXjB2uabhupwLXdP9XQSaoHj3Y7YyQSBQ4VPmKhUvwpwnssP6ua439pz9gwz
         tqSsup52AGqxIjQg7VbKAxqq4Z2BHERKpDj4ChH6r2FX8qEH2P9Vjm06OAVX1WFpOJsc
         1iMJKKXqC2gbXhyGfjlson5RrmXRHZng9x4FR1UdsEYSii5ALQRlN9qO8WvZWP+0TDS7
         rQyCREEksZ6tR+C2M4xwczRVGwUauoPi+zupu7NyMRjTQX6P2yy0s5Z2Si4rCl581JPf
         FnaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FmA2d4h4NyrqLRtm0naf+nfidTXr4nlY0iMOqjCMQIA=;
        b=hXYFExqSg3ZTLwdJ21IHGwRZjt2GnKLz+5RvpviwcwpKrCr1YZ+XUP5IFtnzKe+WBl
         3TAUWZBCE1tFUPok5vO1c3rjZIYqFNn7QDQNdwUlMvxlGmgi5HJDpX/liTCRl2+wpsSP
         YMUnodPe1r5iqZJ0+BzXb3y7XC0QPrO5iDmGfpjD5p1bn/gJRGCCbXT3ahohmf8rIMMN
         OYki3bmazfURgnLaVdtLwTQzBnbuf90yaa9YZQYkgeNdLdE3ZFZxG575CtAMsnR5YXRj
         on+8xlbnsSIaUJ7IYjk9I9bk+oAfWgP6DfZNNPKAfe81LLXcgBKZDL4M65iVB7J+CaZF
         mo2Q==
X-Gm-Message-State: ANhLgQ3Zu7JjdBm8LjkFd8zvnGDE9kUjS/a1/t/HBS2MdtxULsKCeHGN
	wrMM71+AmHBU3raiArzYJyY=
X-Google-Smtp-Source: ADFU+vsby4PAuV+a1ROEWCe4UIGUfX0Yg/W5WOUVcx5bcy/mTkLwg0aJBSrcaZnAtDhfXLMAR/MlZw==
X-Received: by 2002:adf:e742:: with SMTP id c2mr6614792wrn.361.1583965156477;
        Wed, 11 Mar 2020 15:19:16 -0700 (PDT)
Return-Path: <nieklinnenbank@gmail.com>
Received: from pavilion.home ([2a02:a456:6be8:1:8edc:d4ff:fe8b:18b7])
        by smtp.gmail.com with ESMTPSA id q7sm19346796wrd.54.2020.03.11.15.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 15:19:16 -0700 (PDT)
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
Subject: [PATCH v8 15/18] tests/boot_linux_console: Add a SD card test for the OrangePi PC board
Date: Wed, 11 Mar 2020 23:18:51 +0100
Message-Id: <20200311221854.30370-16-nieklinnenbank@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200311221854.30370-1-nieklinnenbank@gmail.com>
References: <20200311221854.30370-1-nieklinnenbank@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: f9q09abPkmuM

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
Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Alex Bennée <alex.bennee@linaro.org>
[NL: rename in commit message Raspbian to Armbian, remove vm.set_machine()]
[NL: extend test with ethernet device checks]
---
 tests/acceptance/boot_linux_console.py | 47 ++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index dabc8ef2af..0762dbe83a 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -572,6 +572,53 @@ class BootLinuxConsole(Test):
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
+        exec_command_and_wait_for_pattern(self, 'ifconfig eth0 up',
+                                                 'eth0: Link is Up')
+        exec_command_and_wait_for_pattern(self, 'udhcpc eth0',
+            'udhcpc: lease of 10.0.2.15 obtained')
+        exec_command_and_wait_for_pattern(self, 'ping -c 3 10.0.2.2',
+            '3 packets transmitted, 3 packets received, 0% packet loss')
+        exec_command_and_wait_for_pattern(self, 'reboot',
+                                                'reboot: Restarting system')
+
     def test_s390x_s390_ccw_virtio(self):
         """
         :avocado: tags=arch:s390x
-- 
2.17.1

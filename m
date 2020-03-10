Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1226755lfc;
        Tue, 10 Mar 2020 14:32:26 -0700 (PDT)
X-Received: by 2002:adf:ea03:: with SMTP id q3mr28518643wrm.267.1583875945931;
        Tue, 10 Mar 2020 14:32:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583875945; cv=none;
        d=google.com; s=arc-20160816;
        b=gPOdmhofNr9ZyyPoXD8kux1sml+fXAajxb8m1EN51jRtR2dSJdkLyMkQmKsO6A5x0s
         UPmiWpQJscEav7xFIMuZRX8IGro+S75VzGbmOxoIdWyq3joErNPhKFvgNHOfBIcVkRCB
         9TSBCCpdRV54XKAJD8VDtoxzoUqcyH2F/3EBan+31AcKzpepa/pM1nOasUdDl8B2Qidl
         WUXqa0shQzXj6R303jkNSN6+fyW3l9qPrcOc86CCUJrFISUbuYp+pwHRHxDHlTpHSxK6
         syoReaBOhYSaaR0FQmbDAZxwkXwPCi/QJd6sF9Ch0PsY0quSGFafZ02xNQeLB3SOjeUC
         RDjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=RraY0qfx7X6byHyuRorNYuDURaLXwN/KHuDImst4oWU=;
        b=TyszevU6PKyVCoMvKVp7CRR03fyhobHQH4b1MQ+W2tFirkoDTECpU3KucO4rmJWSSu
         z9iKyMK1ucDJF/Ha9ng0S8+2TS2E8RPNg1UpcNpgPC2+6yVhOMClael7qouj4YAA+Ai3
         mOtLTJdfHWn3ycc+0+mYa207e9MDObbAgYDvC8Woke1Kplc+dMP4ARKA/DKr80gU6JEw
         j1WVy7VLCGcQwNPWU2Ax/6IalymYGFlO1UOI5Sd1oVcrr0x5YI7fYe+XRZCpTZSI9yPJ
         DlWvyEk+7aj4EuoaHUNtkzsVaU5vOVpAiQB/ahEj5gReMGWyDNz/DeaP/uqhepNfIixD
         VsFw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="BvQ/wmdP";
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <nieklinnenbank@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 9sor2646476wmx.11.2020.03.10.14.32.25
        (Google Transport Security);
        Tue, 10 Mar 2020 14:32:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="BvQ/wmdP";
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RraY0qfx7X6byHyuRorNYuDURaLXwN/KHuDImst4oWU=;
        b=BvQ/wmdPu6T+aD9nC5ekbuZD1CHF9pUmbe9ze9noBoiq+B/C0vJDF8p5dPKuH1BD9D
         Q4yphFRde1QUyqldhasAHwyEgjLZFjIdVhEAjPH7Z6gDO6mTZsqC2CLHbV7ukhKVQfv8
         FrA/rnF7cLM7WsfInUc4hP/3LKiU2+JY7leaGW7B+d3wUmlNsYCWpPNcMesMBV4QV3pF
         Vk7NRvSqNzLO9q8aN5lrULy4fZlutPv+GDtdGgYGpVQ53SLSf5JPm78VHYWbwVBUBJ9O
         qrvygWtsGbU1KWmNd/nvbPeyBXXtYQ9R2A3nSM3H6NdsHRu0TxRwwkcxZMNYW+5UPO5e
         nZiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RraY0qfx7X6byHyuRorNYuDURaLXwN/KHuDImst4oWU=;
        b=h2jPGGM0C1LWmANnaUdbeNliLobpbU3SsPjv3ak2CZn779wW9vFtgq+E9KJjYqZTIv
         +nIHuo5g/6fssIrE6oFqv4xT0OFgLsoPc4yTtQsglK535PxZ9x0kcnLkWimXZNCNynZR
         qZZbZehqZ8BL9k2pnQO3NnEcFi1R8NEicR+2gEuZ3pp4VSjTbdIdFdTgVMqw6yR+Ar+n
         dx06/AyVG+5xudIs1lBEfDEx2Mk4euWMjaE2q/7kuphiYv0AhiX7Dv1HrWT373Fx/68w
         sC0YhY4tT+pqD6awe4TlY/lb3cpVYgu83hiHHCzjVzdoOTtVfLY0wovJrDr2yj8/HtA8
         Yanw==
X-Gm-Message-State: ANhLgQ1yhgQzWT5QTXr5h52gdVTudOPHs78ct4p94t1HXK+JMmBdsg7p
	x/7VgK4V3Zuu7dFK/t54jmQ=
X-Google-Smtp-Source: ADFU+vvyD1gFSNT9oL2oxvGZuL9uJUX/BQrj9kYn0bHbjmUNwNM5xP6/G0riG4H8bSdLcdbmSL+GlQ==
X-Received: by 2002:a1c:e442:: with SMTP id b63mr4101380wmh.174.1583875945474;
        Tue, 10 Mar 2020 14:32:25 -0700 (PDT)
Return-Path: <nieklinnenbank@gmail.com>
Received: from pavilion.home ([2a02:a456:6be8:1:8edc:d4ff:fe8b:18b7])
        by smtp.gmail.com with ESMTPSA id 2sm32803580wrf.79.2020.03.10.14.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2020 14:32:24 -0700 (PDT)
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
Subject: [PATCH v7 15/18] tests/boot_linux_console: Add a SD card test for the OrangePi PC board
Date: Tue, 10 Mar 2020 22:32:00 +0100
Message-Id: <20200310213203.18730-16-nieklinnenbank@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200310213203.18730-1-nieklinnenbank@gmail.com>
References: <20200310213203.18730-1-nieklinnenbank@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: eonV4RdvJUET

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
[NL: extend test with ethernet device checks]
Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
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

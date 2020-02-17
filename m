Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5518685lfp;
        Mon, 17 Feb 2020 15:24:38 -0800 (PST)
X-Received: by 2002:a1c:7203:: with SMTP id n3mr1204030wmc.119.1581981878513;
        Mon, 17 Feb 2020 15:24:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581981878; cv=none;
        d=google.com; s=arc-20160816;
        b=ZumlsM0oEz2DaPy/sa2WYuVDhs931cFnO91rirtoEs3zlZz9D0KZiYJ/Xrojrc8OXz
         8/FNCmN8DABSKaNK2TuLPdytPF5tKAhnD9chMfWqya/OmkZRSd1e++1vzolMCpBP3o2Z
         HTfuu6o9YQWJ39/9FMUtGNXibdatruH8HohVaSRYHBiswpcqYPuERqYcHV3jTyYiaD4c
         qr99O6aplIkfgfulpr6tw/I5HxwyqtZkWrgoSTIrWwF6pjTFEYfVol+DzOJLNyZmBNOo
         /bhqof52H6aoc+Co/z6qJyWuKbLjJDT+JwdkvmZ5YNodIiZGEIbf+6crpm4o7K13Mlvb
         jJ1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=FU9N2QwY0KBXx2FL+IQpwvRT5WjHXUfq+3rdC6n0pFg=;
        b=qOXxf/8n7HPYCdy+0YYnE+fInHR/er4CzoOQ9xWK+Ve17t09v8N+0I3/OMH0n7jlbO
         y9cacneAB60Fz/XVhMnD6Ywq1P231VFh/4b9h0Ag+izCUkqlVRGVk2ec/hEqZUxqCXfy
         Rjz0s9Vm6CjbVyAa9TMUfZqTLZz1YjgVlahqlALF8chgoW/s66ZRqBdwfT3dQel2IV7X
         TJVgzmduJ5LKleh3L6rpkHCUqAIxAfMkO5D0QOvNLaw3BOlsDMXgT1VTxPV93vNF/zv8
         J2puXs9aODGg2N8oMBnW/cOHiYVC3yZqakg7+4MI9DQQdYofyAKehebZ8TcT0zAQvoye
         uKmg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=YFk5T7KQ;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <nieklinnenbank@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id h18sor1403385wre.25.2020.02.17.15.24.38
        (Google Transport Security);
        Mon, 17 Feb 2020 15:24:38 -0800 (PST)
Received-SPF: pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=YFk5T7KQ;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FU9N2QwY0KBXx2FL+IQpwvRT5WjHXUfq+3rdC6n0pFg=;
        b=YFk5T7KQO6eqzH6b7RnvtG5U9XEqfcgnCqTxNk6zrUB+Ti0X/9W82eR1nS2EP98Y+N
         mrU3NYHEkLMyqCvsYibnngMmFn3AMvJw+aOFUEjbUg7J9EoNqPMLmcoYQtDUYCIgArfn
         I/lU9XucTr+YHOyxeVQGJ6EI4xyrq1wYlW5i/Jj+jM5rpXb4fi33ETnnrqMT47SO98+Y
         8PG8ChaJrtcoefqsS1yEOxnZqBmtemuzsknRQ01FycDdatsvwUdauAWQo+LdInEF6fVs
         yfgki1oT9bW7tWtMrQcVEpBjeRZnSN1lolHcYPyF7F+5AHstvM9any9gL8lObSnuCaqM
         9Snw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FU9N2QwY0KBXx2FL+IQpwvRT5WjHXUfq+3rdC6n0pFg=;
        b=tUevRNLkR+7v7kcIKzvVMMHhOAJDqc8mUZXLkbNGTEViQIqzTT0MccKOoyeSR4gvT7
         lMkzy2Cwn8LlK6ZNk1jn0rSLHrjRRuSXiL+RJGJPVLvS5y56jLZ6qMQok57VQlw7LW+U
         B8Vv2Suef1v11m1M9Gf9gtZvuLp7gREfk0swT6hYsz9E9bV/As6wY1Yh0FqAZlxS1BSi
         45BAwoMVNCji7byvubhgG9U2MKWi5Gjq6SHBo28Jflq2RY4PluaDfz5dDxOo/CUyKDJa
         6iozp9n1ohGDbUij0M9EsA0oYQB4LIhgz62vZmcH8/D6+ZmQk6fel6zjFSVcQLTjTVDv
         YYtw==
X-Gm-Message-State: APjAAAW4QVSoXO83aHaLF7q8Zlo86cXsPWGB8FsuqVWHFGciX42hLv5F
	PMPyhLkdFW/5oz3OyT6vrCC+m4TPDIE=
X-Google-Smtp-Source: APXvYqwu5VtceIIDNrkS97WfYdZY+kme2gEypNwSU1M83c6hcdQTQi3wFHC1tnfZA7YGJkQTbGhHSg==
X-Received: by 2002:adf:e382:: with SMTP id e2mr25735898wrm.128.1581981878128;
        Mon, 17 Feb 2020 15:24:38 -0800 (PST)
Return-Path: <nieklinnenbank@gmail.com>
Received: from pavilion.home ([2a02:a456:6be8:1:8edc:d4ff:fe8b:18b7])
        by smtp.gmail.com with ESMTPSA id w1sm3244831wro.72.2020.02.17.15.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2020 15:24:37 -0800 (PST)
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
Subject: [PATCH v5 15/18] tests/boot_linux_console: Add a SD card test for the OrangePi PC board
Date: Tue, 18 Feb 2020 00:24:08 +0100
Message-Id: <20200217232411.30096-16-nieklinnenbank@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200217232411.30096-1-nieklinnenbank@gmail.com>
References: <20200217232411.30096-1-nieklinnenbank@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: +/KVoQGH3Wk/

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
index dabc8ef2af..7ef69c7bac 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -572,6 +572,47 @@ class BootLinuxConsole(Test):
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

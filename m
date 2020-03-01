Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1709231lfg;
        Sun, 1 Mar 2020 13:50:49 -0800 (PST)
X-Received: by 2002:a5d:4490:: with SMTP id j16mr1098977wrq.165.1583099449131;
        Sun, 01 Mar 2020 13:50:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583099449; cv=none;
        d=google.com; s=arc-20160816;
        b=D4CoioxplCdCTcAIO3UMkLnRBK2s4Atr2EVO2NMwajhzlu//yTtgha9qoFS1214jje
         jaAthy+locJmvFGcIWnw5dcFrzBiL0JQX3WokPw0RFkD0zfHxTtducGAWTuEAG9hCHC6
         B6KrUuYSgXysxcBC921aJk+fBqL24F89fV3RHUeB38p81bMmjVw5eLAzpWE5PI8J6rHP
         HG3N8dbgMfhrikFtbvLtnr9PWvjAHsuaGVSpcyWMwSkTMdOPerlG9x80lwmIEPR6B5sv
         K6Tz4XZ/t3mOoYrwUNmweetdw8nmc6N7DnJONkvqmKGcoQdGYbxDdxzQ/g2TtIKzJqGe
         ma4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=FU9N2QwY0KBXx2FL+IQpwvRT5WjHXUfq+3rdC6n0pFg=;
        b=XlPOxaWr01+cbGHAcQgSVjSrZNe/qRqNYumsoxv6D3ga6QjR7drbXm0sjbpnZtH1rT
         n11EnNLGsBo4bJ2vRLupn04h4gkiPjymRgW8PNlJ3MCbGT675zwmhRNC0B/TVy/l39Dm
         NLGQaGwHqtiIVhYWujRovKeG0l8YVAp7+L38Lti1T3ZLpVXE0BZsVzuLHiRvFjYb/yot
         phZPZgpo05m0v6YhxXCuRc88QGM0MiV7+8Aehpl66/asof5nn8IpmvpvQlpk6dXqfv46
         iqjPF7rUOi1OzGU3E/U9Lb6LPl5tzEjtqAmVOrP9/Znxu0EHzk204fAmID9171w3Cs/a
         rZRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=agDflG0U;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <nieklinnenbank@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id v65sor4441327wma.8.2020.03.01.13.50.48
        (Google Transport Security);
        Sun, 01 Mar 2020 13:50:49 -0800 (PST)
Received-SPF: pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=agDflG0U;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FU9N2QwY0KBXx2FL+IQpwvRT5WjHXUfq+3rdC6n0pFg=;
        b=agDflG0URUJYxehXjEr0iQosRiRMDCZw1+VD1dpq9lEnyQb48Ph2XZ0YuvglX4yBkq
         8skZYMDXt41LZqQ2u1KfycC7y+f3TjmsAjjMLLBy1HTN7IJP9QF7hrdp7KLG8Umm4moF
         eySO2krkiLI+WfQMxuBt2UDx7G7Y9OAg/FQOKmi85K7runH6AcuME4sR+TcH2Kj54WW8
         qzSzea2G0sv6eAfywROOse4xZjnv9ZTKsfbGMEXIz2XVcK2/ZzpMwOuV9/qh4qiNciAB
         4Txdg9Lq6Ywe9wYtvi6OZPavxbih8wEYJG++Z5gYoo+aD4Og+tl9BGp9OcVGW4uDaROJ
         JYeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FU9N2QwY0KBXx2FL+IQpwvRT5WjHXUfq+3rdC6n0pFg=;
        b=lWiaXs5+Q0o5MbOTocVKpXKQjEEFqA3qHJI/ToX2g+GFiALRJVEiAqwzqXtYf4KP+3
         NnPMExq0F99ft62xMQkHl28q/U5mGmSIH7YMCPjhFWu0lGEPuB2jJtlcXIokBRG00gY4
         7Q/u3IQPE9OmdoCFEYOA/RFhpJp5siPtMdl+6sKaYcUUxHFhBmPPPVqesoJBxLDQtXDl
         2a0H6OgttVfY0ZP0g8N+93XsXZQXeUddgjE0YJYy9FXLWtc3n4Z79vzCbchbuoCnF1jy
         WRSWOX6Wyv17LdLbVEhjFnl8z/H5z6nsIGpvTt30yfZPxLzpkxifR45mKIcZBEevRLUM
         PsmQ==
X-Gm-Message-State: APjAAAXfHi0ur9TMJbQZI94r/25oVmqq33/EmPYFNn4vK9NHUr6vagEI
	1uTSx6b1xUzuDJNUg7FHdH4=
X-Google-Smtp-Source: APXvYqwiK6f0JOAi5keD7ZXNa906XVo7KAy4nYOFk6qmNPA2OErYWkik5eoynGdSjWjrC+soOp/WLw==
X-Received: by 2002:a7b:c34f:: with SMTP id l15mr15849923wmj.103.1583099448722;
        Sun, 01 Mar 2020 13:50:48 -0800 (PST)
Return-Path: <nieklinnenbank@gmail.com>
Received: from pavilion.home ([2a02:a456:6be8:1:8edc:d4ff:fe8b:18b7])
        by smtp.gmail.com with ESMTPSA id e8sm25033124wrr.69.2020.03.01.13.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2020 13:50:48 -0800 (PST)
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
Subject: [PATCH v6 15/18] tests/boot_linux_console: Add a SD card test for the OrangePi PC board
Date: Sun,  1 Mar 2020 22:50:26 +0100
Message-Id: <20200301215029.15196-16-nieklinnenbank@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200301215029.15196-1-nieklinnenbank@gmail.com>
References: <20200301215029.15196-1-nieklinnenbank@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: UywpGD0Z4hDS

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

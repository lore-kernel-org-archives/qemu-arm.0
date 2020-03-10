Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1226749lfc;
        Tue, 10 Mar 2020 14:32:24 -0700 (PDT)
X-Received: by 2002:a7b:c92e:: with SMTP id h14mr4198853wml.90.1583875944785;
        Tue, 10 Mar 2020 14:32:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583875944; cv=none;
        d=google.com; s=arc-20160816;
        b=OXrr6tOSuhsNnlt2J52Fnu3gqX58iI3XaCwEHvoZ72ws1af4dQBY5sW16WvgxasWm9
         Bbl9v77M4Vxz6o9vRW037hSH4aZQD4RUYqV+oE2SH0XvWvvDu/fnixjGEGSTzR2qO0hT
         eOPHkbbNqG8tUexbubFWTweQ4/u8taACqZ26TDzhFXeaEm/WPbyAzR0MwxiDNIYWUt1H
         EybMN/v7cxjTRe9/IyycnDPmKvDmJBiZH3pR0TbKiUxBiKXZCH4YBsVgYNxfzPiVk92w
         XsJhsyL0JU/u2WkKpvwwBfi4Qw6BLqz9fmb/JYyg7LEmZzotLHQPb/No8acqohyGYSWX
         tLaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=/HJybUpdOHqvFv3N4GdlfFuG/BjvM7fIXK9BS11nCpY=;
        b=F84KVsnSxyJg5jFyyWdIzrRImwzH0k+tavmasSKk+1YvCDQA3tkRreJt158jTBlq5b
         8NBsr1LGBr7brWk3LgNaJtIF3eCWtA1+JscERjIEe0wBIsix0WqnU2Je8+mXiMRhI1IE
         UEYE7xteTIassErT3Xg/HKdZ8p1uJ0K3apUPq4NgTnm/adfuUfKG8xMPJ7jHQPBEENj1
         ioLp1nsqB12A3YshTKy+RbqXC1orHDOi9kOKZBkfi5lKHEXYtucCKkhyu88ZHqjowD8w
         GlgdMupx1JTZV+XppRoSHyXHQpdzYrpMPUXGLgmBBr/zw21Cf3ifsYk77rtNxMyjJIGZ
         lA0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=ePFXIF9W;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <nieklinnenbank@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id q3sor2896139wmd.1.2020.03.10.14.32.24
        (Google Transport Security);
        Tue, 10 Mar 2020 14:32:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=ePFXIF9W;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/HJybUpdOHqvFv3N4GdlfFuG/BjvM7fIXK9BS11nCpY=;
        b=ePFXIF9WwAkQjjEQZs/lCgQSLeLEt3AZBpz6zng9XUHpF80jU2jWZ2oBhesKy81pAX
         RcPF/2MRWSb71keyRXmHs6H2mXttLzhJbsCWpB2Pa6B2yprC2znvuIpTRo9v0t0zUplC
         /hOBupEH4uaI37nTCrgdn3z8RXJ/6YzDgqdeiUzT1pUWkIB7RB04giau2/KBgVdH4X3T
         dIR3zNOZZwhfvQkME7KG5jXApeO7OQDp2PCv85TIgbtmssT8PRV+TVDIIQj7e6/dDE9f
         NdvHhu55dg8hpIdCIggyBacquHEmlqOtjfbAl+bYH4JX5A7DbJzpCOb5jOn/4yAhXimF
         MJ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/HJybUpdOHqvFv3N4GdlfFuG/BjvM7fIXK9BS11nCpY=;
        b=hYbJd11PRHpaMFE9J5yrgrm5ThpDaPHpyx4d3TytQLZCA2qDkiytixzqhcceL4F6/O
         C7Squns0icsh+Yv0ZmvGUVE7CRNc6q+NMfFvFOMUaboZSQHXBuY0TMPDSSEZD92J2z34
         YRESTW+ITzAZ7wK5Yirhp41Mh3K+IJpycjOK7CvOE1suUIxdKpK1GzwqEoY2M2KXgklk
         Vxq35aaGpPEj0I1Z3mpI1YIuaXRAXisrhMYyFVwXDzI0hknkNMS6uVGVuK7aScSAFApH
         KKDFOG4JuVFC/YQOuKLXAZIgmaCrWh1vD76E3rbkhperB606+XB8ZKZc2iIbUqPG0Xy+
         7WdQ==
X-Gm-Message-State: ANhLgQ0xUEKmWG9S+agvTZ4oR42mEWf4qsRSfvvXVBfWQZg6Da1WI+z9
	uzCRD1ciis+GBjrABmrsyELGHeXJcRQ=
X-Google-Smtp-Source: ADFU+vvY1rBDYiIReTZ6CksCgm2aCIebiNSzEvx0Kp0vR1R5XpPJUdrYVgPwSrKoH96j4ABATLEHfA==
X-Received: by 2002:a1c:c5:: with SMTP id 188mr3960143wma.89.1583875944357;
        Tue, 10 Mar 2020 14:32:24 -0700 (PDT)
Return-Path: <nieklinnenbank@gmail.com>
Received: from pavilion.home ([2a02:a456:6be8:1:8edc:d4ff:fe8b:18b7])
        by smtp.gmail.com with ESMTPSA id 2sm32803580wrf.79.2020.03.10.14.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2020 14:32:23 -0700 (PDT)
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
Subject: [PATCH v7 14/18] tests/boot_linux_console: Add initrd test for the Orange Pi PC board
Date: Tue, 10 Mar 2020 22:31:59 +0100
Message-Id: <20200310213203.18730-15-nieklinnenbank@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200310213203.18730-1-nieklinnenbank@gmail.com>
References: <20200310213203.18730-1-nieklinnenbank@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 02mSydOJmOXq

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

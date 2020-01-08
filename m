Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp1194214lff;
        Wed, 8 Jan 2020 12:09:05 -0800 (PST)
X-Google-Smtp-Source: APXvYqzyUXBsdPUk2TWm5HIOCzN6X9/fDU4yyF1/NM2hLrZ7qYlJNuw0aIyRPAMiFN//w0CU9Cyi
X-Received: by 2002:a17:906:687:: with SMTP id u7mr6485670ejb.171.1578514145591;
        Wed, 08 Jan 2020 12:09:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578514145; cv=none;
        d=google.com; s=arc-20160816;
        b=gw+GOIqGjd3PIp+oybltIs4+X8snE9wJLzyVn2BNecPdhi7qYVsv9wSC6mssgCKf1i
         a/IpmEIHGaVQQkmPvYEHNvtDYrpqWt9A+/3OkFurG+vV5qu6AR2W0wN2Mz0QhpO5i87p
         mbqcR4u1GZmqRyc3NXKy1gZ9W1y05SaYVbOMlq9jAmzQRRrVZ7YOjtDQSE5ltzTJNVOK
         pxAkV7svg70fCrPMu9GCOvj/kUcA2NLOBt8zlkkHTPkb14EMfZhEC5jZCUmFuXYFm0EC
         v6Am7vn9K9GJ6e3PyE7Zp3E2ZsnrJy/ZjKNOOjzLeRMkVS7EU4oQYdZf76ODWsOCwqXn
         dtZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=euLzln6uXXqTjwugSbBf1Qq5DB3lqK+zofvchURbMRQ=;
        b=LmbybIG9lk0ReUzhTblzbctvYbHKjuEazJjY4KVyXoo/mzE3bh5ax2nOoTl8Bxzce6
         DnB9HwnyiO5zrkK1cxzh2rSxeJDfLII6eHvgmRgFuOa3f0Fn+cMPo6j4Ous3T+ys5FDm
         pCjMaZaBRK43tERzrweEt1XzwpFW4qkh4OjJcpGhZaZYHNLs6e3HrUjoCpxBxsLHML1Q
         IIzzHnnH/v/nc8dHbC3eNytkX+ar39UkSNrdrF1jIvv8ZkQ/J6fWeB90/TkGXc8neJz+
         NYhLTvwkPpSGV1lrjKW6kgVhtz+mkXK47seHpGD8ILyc4WdM1sbWCWsNR1DSw5BYUDEE
         sT/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Laais0Wn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g10si2792336ejh.271.2020.01.08.12.09.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Jan 2020 12:09:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Laais0Wn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:48764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ipHdX-0002aN-Pg
	for alex.bennee@linaro.org; Wed, 08 Jan 2020 15:09:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35805)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <nieklinnenbank@gmail.com>) id 1ipHVi-0001YK-9T
 for qemu-arm@nongnu.org; Wed, 08 Jan 2020 15:00:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <nieklinnenbank@gmail.com>) id 1ipHVg-0002n8-3T
 for qemu-arm@nongnu.org; Wed, 08 Jan 2020 15:00:57 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:50284)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <nieklinnenbank@gmail.com>)
 id 1ipHVa-0002fy-Oh; Wed, 08 Jan 2020 15:00:50 -0500
Received: by mail-wm1-x331.google.com with SMTP id a5so257115wmb.0;
 Wed, 08 Jan 2020 12:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=euLzln6uXXqTjwugSbBf1Qq5DB3lqK+zofvchURbMRQ=;
 b=Laais0Wne3qC55b4FXeLYwn1KMwe2duBpYHjP+eHZmrsLO1hdJoUZ4AoH8UzFjjIM/
 hfp6hUniyFpexMzdP6vKDOvhg5Dq37BViGYwrJ3WvUcKgbzsDx3UUXLcYDFyGxH9Ov7C
 1pbXBxrI8mUPjP9cTk82wqND3TE+rD5oTVFg0hSUrl+Je9EXn5bctp6lyCcYixoV1qkC
 oq0tTEJ6cfqY2LEsdPQtRfxhOU6YhwEJ/2KFkz/DDE49O8Rl9HhDOduplDuEIAH7G4wp
 DcPNFdqg+t/QgbOgrgIa9pl48L9VoYwv5+7TB+fkgWWB8/xdnNCVHzbacoNnIJcGGkR/
 iO2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=euLzln6uXXqTjwugSbBf1Qq5DB3lqK+zofvchURbMRQ=;
 b=DXi6uzYjQOGoan2s2Qw90qNoRo4bLVVGkTTAOxTnY+3clX6LAsHJz1XwW9lhMlZ2tQ
 eOkMOZ+zJLMRQpV3TXN9LlBHW7XZt1X4R/ljZRVW2+ioirErFnnm4A7KLjlXdVJsdI7E
 sCb9bGPC5Ge5tyVf+fnv6ejxruQ3LQm2pk+j2SW8vvCVCDH3SDg/266uwZwEdzwckvl1
 LDKazRXUCwiLEHAwAIq+LEzoojSkLX1R/N9tZ5VK/eSonMOrL2wmNpIMxkzV518D+EPG
 uOCj9ebfIb23ljqL2tgZ2RWHCdtQmoN1yGTesb5u2IPfaCdh/DcWMiCLeDFKskA6IdCm
 BlPg==
X-Gm-Message-State: APjAAAXRE3JAZw9iFiVEtQLEJGwYR3uiJUGCmjlc88zeiFsIfpzQgGTu
 hzBEVup8mq+xIsODx0UIo6hWZyYx
X-Received: by 2002:a1c:1f56:: with SMTP id f83mr329216wmf.93.1578513649291;
 Wed, 08 Jan 2020 12:00:49 -0800 (PST)
Received: from pavilion.home ([2a02:a456:6be8:1:8edc:d4ff:fe8b:18b7])
 by smtp.gmail.com with ESMTPSA id u18sm4970099wrt.26.2020.01.08.12.00.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2020 12:00:48 -0800 (PST)
From: Niek Linnenbank <nieklinnenbank@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 14/17] tests/boot_linux_console: Add initrd test for the
 Orange Pi PC board
Date: Wed,  8 Jan 2020 21:00:17 +0100
Message-Id: <20200108200020.4745-15-nieklinnenbank@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200108200020.4745-1-nieklinnenbank@gmail.com>
References: <20200108200020.4745-1-nieklinnenbank@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::331
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, Niek Linnenbank <nieklinnenbank@gmail.com>,
 qemu-arm@nongnu.org, philmd@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2lXWxYPkg/1a

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
[NL: rename in commit message Raspbian to Armbian]
Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
---
 tests/acceptance/boot_linux_console.py | 41 ++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index b58308d724..eeab4fa62a 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -426,6 +426,47 @@ class BootLinuxConsole(Test):
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
+        self.vm.set_machine('orangepi-pc')
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


Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp2448702wrp;
        Thu, 26 Sep 2019 10:57:56 -0700 (PDT)
X-Google-Smtp-Source: APXvYqywrqMzC8tb+VnEc6C92kpM/eMvAs9mgBSTA0Hwj5OjNnfMD1g5isVzIixjAqewHpdYMgxG
X-Received: by 2002:ac8:2782:: with SMTP id w2mr5369605qtw.145.1569520675762;
        Thu, 26 Sep 2019 10:57:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569520675; cv=none;
        d=google.com; s=arc-20160816;
        b=cWgjaE2Z5zu594hckoULUD4/ebh1vaXdzATDzYI+8m1STuYsP8vxPB/L6vxWC/UIPZ
         1DHE2HTgnawkaRXyOG1d0m8s0nyGz/KlrlHOLsa+LnSmltEGTSuG5NKBwrFWgb5HiR32
         wAi1P5hmsY/6+FpvcWaUW7arhKDal6u9zG2QvKGWtAf9yGXe6Yl9qOjZvc+R1/6rihB/
         vUrfG7fMppGqPRTDsj7tH9QAw1OkUcXBZr/+x7r0Xjl4QUitQsevNEWZ3J6AdL6evVPe
         qBz2uqJXdm1iTpVyvuX6XW10Yev5M6tcbnE2hNc1gs5aBs1Swa4p4CGG6/swRpT2Qe0z
         Jrgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=xoacbOd8UyUj66KJoz5CJtwAwcD7yLUS/+XI1DIJ904=;
        b=w+/fK63HqKi7eKW1y56FnoO1U8Yq9gHbF0Cp+oW2A9PEahhkMxJJmXeINPPQVQ+VUk
         hlfYIHm3yR8Yt4QCiQnaVDqk7jjAq30AwH82XYwUBWaKnxLTDzSv5GWsAA6ROY1LPVPT
         RQ6XO2ZuEhsyH+jal6sa8eCgKRbnqZNQ58McS0F/lgUzzGMqeVqZDYe9bDzuKTgNY4dv
         J6+8K2hqsseBIHAIdL7iio+cTvpy4gtXWFXCfxYSZZwnghO1kCzxsZ0kdd0UtFmOo69F
         2/VMixuKQQhKkd9hNkBXepeSlQIKf/7u/4Y0HL9Eny+jkqCFtBN3na3Xyxc3zvS8q86u
         B3Yg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=aZSw6xRU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z11si2416817qvp.51.2019.09.26.10.57.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Sep 2019 10:57:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=aZSw6xRU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iDY1a-0007Ey-Tr
	for alex.bennee@linaro.org; Thu, 26 Sep 2019 13:57:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59176)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iDXgZ-0004s2-KU
 for qemu-devel@nongnu.org; Thu, 26 Sep 2019 13:36:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iDXgW-00038e-0p
 for qemu-devel@nongnu.org; Thu, 26 Sep 2019 13:36:11 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:41671)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iDXgV-00038R-R9; Thu, 26 Sep 2019 13:36:07 -0400
Received: by mail-wr1-f67.google.com with SMTP id h7so3426437wrw.8;
 Thu, 26 Sep 2019 10:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xoacbOd8UyUj66KJoz5CJtwAwcD7yLUS/+XI1DIJ904=;
 b=aZSw6xRUhvHOfj9MMOOIGfrU6BTC5zijJNv2xZTIZ7wMOLihCJuaT9H4eo4dfhufnl
 1fxMe56/zUJGGEe3qR5HBcPANG13kg6fPUnWRRVYqAZOKwhin7E4P0wAEGOy916FEZKk
 e4kqZb8vizTJ4Sq86vDg1gg9kdgYUhkHlXPM0nnTeEhilaVxRzcOjcdkzF//egLJpaz1
 Sqxl89uX/sw2W1tPHEa9pSsDRCrOkLY71Acgcu7XSrFhqkbMZTlzE0pSNyYh2fZKW4oz
 BjsSKYAHcJuZr5PWcszl3HV8zN/B9ztOBP/Rz6GnlwitXIB7Wv11lqnjmGw4s7sDPBiB
 khUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=xoacbOd8UyUj66KJoz5CJtwAwcD7yLUS/+XI1DIJ904=;
 b=KMzUDqQAg1SCE8Cv5XhLt5N3llDmuDJc8291p9PAhzbpceZXzbjVNBSC5hTDDuksAz
 s5Li2jlehQk5kE1XgFJRvT1EKN4uFrmMcTFpAOimeRKx+Xs9HEuOMeoU8Y5c0oLgAY5K
 oXVULLoACGDGT/uAX5uKJNuGL7w/lldnBMfM3uUHv0UZHnJHKUHKIXNCe/6qhJ8X/SCi
 l0BbSAGwuVY1SFaR3p/5Wgbo+pffkzTYHN0rQR7UN9VFBI+m94uK+RiHiE+4zm8vsHDx
 SYXRtnVKLEy4QCr4+M2DOk/y2P8b9Y+14opfuvFiRykxeaqdDGDqA46wiIuW+ddZWVx5
 vkoQ==
X-Gm-Message-State: APjAAAWRTQqJ7ExdgPOFrXE5urMlG5cCLaNr4mf8Lhtfiosy3gEotsBz
 pJ2biSSsuw8VUjz/gCnV89WB2vlMKwE=
X-Received: by 2002:adf:de0d:: with SMTP id b13mr3824717wrm.140.1569519306690; 
 Thu, 26 Sep 2019 10:35:06 -0700 (PDT)
Received: from x1w.redhat.com (240.red-88-21-68.staticip.rima-tde.net.
 [88.21.68.240])
 by smtp.gmail.com with ESMTPSA id b186sm9918980wmd.16.2019.09.26.10.35.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2019 10:35:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 16/19] tests/boot_linux_console: Add a test for the Raspberry
 Pi 2
Date: Thu, 26 Sep 2019 19:34:24 +0200
Message-Id: <20190926173428.10713-17-f4bug@amsat.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190926173428.10713-1-f4bug@amsat.org>
References: <20190926173428.10713-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.67
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Zolt=C3=A1n=20Baldaszti?= <bztemail@gmail.com>,
 Laurent Bonnans <laurent.bonnans@here.com>,
 Esteban Bosse <estebanbosse@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, Clement Deschamps <clement.deschamps@antfield.fr>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Cheng Xiang <ext-cheng.xiang@here.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Pekka Enberg <penberg@iki.fi>, Guenter Roeck <linux@roeck-us.net>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1udcVvivg8Vb

Similar to the x86_64/pc test, it boots a Linux kernel on a raspi2
board and verify the serial is working.

The kernel image and DeviceTree blob are built by the Raspbian
project (based on Debian):
https://www.raspbian.org/RaspbianImages
as recommended by the Raspberry Pi project:
https://www.raspberrypi.org/downloads/raspbian/

If ARM is a target being built, "make check-acceptance" will
automatically include this test by the use of the "arch:arm" tags.

Alternatively, this test can be run using:

    $ avocado run -t arch:arm tests/acceptance
    $ avocado run -t machine:raspi2 tests/acceptance

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v3: removed debug printf (Cleber)
    use serial_kernel_cmdline dict
---
 tests/acceptance/boot_linux_console.py | 36 ++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index 079590f0c8..7eaf6cb60e 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -318,6 +318,42 @@ class BootLinuxConsole(Test):
         self.vm.launch()
         self.wait_for_console_pattern('init started: BusyBox')
 
+    def do_test_arm_raspi2(self, uart_id):
+        """
+        The kernel can be rebuilt using the kernel source referenced
+        and following the instructions on the on:
+        https://www.raspberrypi.org/documentation/linux/kernel/building.md
+        """
+        serial_kernel_cmdline = {
+            0: 'earlycon=pl011,0x3f201000 console=ttyAMA0',
+        }
+        deb_url = ('http://archive.raspberrypi.org/debian/'
+                   'pool/main/r/raspberrypi-firmware/'
+                   'raspberrypi-kernel_1.20190215-1_armhf.deb')
+        deb_hash = 'cd284220b32128c5084037553db3c482426f3972'
+        deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
+        kernel_path = self.extract_from_deb(deb_path, '/boot/kernel7.img')
+        dtb_path = self.extract_from_deb(deb_path, '/boot/bcm2709-rpi-2-b.dtb')
+
+        self.vm.set_machine('raspi2')
+        self.vm.set_console()
+        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
+                               serial_kernel_cmdline[uart_id])
+        self.vm.add_args('-kernel', kernel_path,
+                         '-dtb', dtb_path,
+                         '-append', kernel_command_line)
+        self.vm.launch()
+        console_pattern = 'Kernel command line: %s' % kernel_command_line
+        self.wait_for_console_pattern(console_pattern)
+
+    def test_arm_raspi2_uart0(self):
+        """
+        :avocado: tags=arch:arm
+        :avocado: tags=machine:raspi2
+        :avocado: tags=device:pl011
+        """
+        self.do_test_arm_raspi2(0)
+
     def test_s390x_s390_ccw_virtio(self):
         """
         :avocado: tags=arch:s390x
-- 
2.20.1


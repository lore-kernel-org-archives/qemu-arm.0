Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp823951lfp;
        Wed, 5 Feb 2020 17:34:04 -0800 (PST)
X-Google-Smtp-Source: APXvYqyOqzHgzy084PGr/jFy0zq3SZzVs1LJQntQBubyISqAsWpiJLLkKqPkhh4KWLMjA4uj3xRa
X-Received: by 2002:ac8:7b9b:: with SMTP id p27mr626384qtu.2.1580952844128;
        Wed, 05 Feb 2020 17:34:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580952844; cv=none;
        d=google.com; s=arc-20160816;
        b=q+xS/m/FplJoEAN5llAGpkfOR3SgfNN+On6MVnH24Ca8YzR2YNtazhgAEXXnWjxqXa
         2iTOdAol5VVbStxqr9erFcuNkCSEvgaU28d+YRwkUmOE8Bgp7sAZ5YjUQMP3SJUCLTmZ
         tBGZCAd/y774j7x4Oqrlm8AXa5UwOoTMDjAXWUyXKri4TjtT7thMB/t82HqwYQa2MCr/
         bsZdJ+sHNj/wcZF3CZ/31wmbCyddm/q3VVXtVfC+nPvSMxB1q5m+xTvZiJG8Po350PQ9
         VmxjcdT2BkO5XPI1fqAJ5r0Qs6Q8fo4kVfBlufB+O19YsrpnvhEyZgj9nQAzgTLR6YBb
         568g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=O6bajScUJ4xgmQhfXtPoiQXddmANh1kvtsMps+VVVb4=;
        b=lyfyAXdOWqzh8V3ruGOye1Wz6WJe0I9y3PXKJBbp0QHZkx/OniQTjaR2uAI2afDcc+
         xPhEyp5kZ5y8fMLbSC78rJVHAb90D9Z3FlJfA5pAcglJozHoKFHaOfUlHsyQ//9We1+5
         qzjAJpF4YhxuqlQKS52o6YizojCD8Pjc/rRhqN6iugrBsBeBmUEBu4ZtTSaX9Q/QyWMV
         2jd9oe282UqeX94sFG4fKlaEV+p42H8xa5l6Uiils0UllPV9PVtFIQ+63d86RgQoh38S
         hUhmqHfBEN6ybXRIiLunKWQOd4P0LPL+XMFqylJ//LeIOk9gjJUyvJh77l+KZASgyvwZ
         ESbw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Ik1SwQvx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g1si467844qki.369.2020.02.05.17.34.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Feb 2020 17:34:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Ik1SwQvx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:59390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1izW3P-0004QP-JC
	for alex.bennee@linaro.org; Wed, 05 Feb 2020 20:34:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54533)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1izVom-0001Mr-2s
 for qemu-arm@nongnu.org; Wed, 05 Feb 2020 20:18:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1izVoj-0004Xl-MY
 for qemu-arm@nongnu.org; Wed, 05 Feb 2020 20:18:55 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:38856)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1izVof-0004Kf-Ss; Wed, 05 Feb 2020 20:18:50 -0500
Received: by mail-wm1-x343.google.com with SMTP id a9so5040167wmj.3;
 Wed, 05 Feb 2020 17:18:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O6bajScUJ4xgmQhfXtPoiQXddmANh1kvtsMps+VVVb4=;
 b=Ik1SwQvxolLdkQ37I3pqyoWqpzyZcVfBezc8UkfEDLG/Qkdrpauwd8GJj0u/XP/O6X
 heIlusf3u2YPKKKRu4vw8rVQNPMvE0KHOcjDVwNw4L1Q7tIW6Auv2zmZFbzy4DWn/aZX
 W9yekDYMRsJ2tU6q+nqHlMAF9zsGTzhjDSXjsdrpzGoOHcDdGKjy8OE/PsSL8Ar/9J5o
 uR83ShF3a4gmVeqrpNDzVybpbzT1TjwCEeAAkfR0x7VVm52eRhMuJpfevgpSHP0KRZE7
 5Tdwdmy/zxF0M3iZdpGw2lW05zrsR5tn9omT5qKgfiX6hUACfhM3fC/0u+WVivZzuhCQ
 ZauQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=O6bajScUJ4xgmQhfXtPoiQXddmANh1kvtsMps+VVVb4=;
 b=Q/SfRuLLNS6iDYAg8A6hUU2/xlNn4S4gHhH3SR9hkXm7/DvhqRwrIgpxuC7elFu2Sh
 OPtHtpz+KBwf+CB0zWOL4mPforzi82GVsLZhDzsO63ecMmw1eZstYhmBkBZw7T+JZ7R3
 fwy3bM85lq4LbpEuW5HoL9VU5WgBExh+7HWwhGnudC1Eq87y41XfXylO82vgi7PzNM88
 oQxPdB/10Ai1PYm1z5kRuBM9wjK4QsIasJ/33zvgg1kRpAwU3xZoXLrqahCUWerg3DDn
 Ek7xRFHC/EqH/7bjRMqrTLDr1axyFL5PXugcVyn5CTzd9c1yKehe//GVG9TXdR1Iq7Pe
 VRiw==
X-Gm-Message-State: APjAAAVAHcFmLyDjgxDlNx0ZrQaDQ5cfIFhRBYvCJ5hupXy4EqkE78xd
 eOw/BkJPa9NLmkqq9xU9EpGgBLeT
X-Received: by 2002:a7b:cd8e:: with SMTP id y14mr629858wmj.150.1580951927679; 
 Wed, 05 Feb 2020 17:18:47 -0800 (PST)
Received: from localhost.localdomain (2.red-95-127-156.staticip.rima-tde.net.
 [95.127.156.2])
 by smtp.gmail.com with ESMTPSA id w13sm2053526wru.38.2020.02.05.17.18.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Feb 2020 17:18:47 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 23/30] tests/acceptance/boot_linux_console: Add raspi
 version=2 parameter
Date: Thu,  6 Feb 2020 02:17:49 +0100
Message-Id: <20200206011756.2413-24-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200206011756.2413-1-f4bug@amsat.org>
References: <20200206011756.2413-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::343
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Joaquin de Andres <me@xcancerberox.com.ar>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Esteban Bosse <estebanbosse@gmail.com>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: M2fvUg/lcTsW

We want to tests different Raspberry Pi machines. Refactor to
take the board version as argument.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/acceptance/boot_linux_console.py | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index 5fba46a9d1..56c8d54ca6 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -325,26 +325,34 @@ class BootLinuxConsole(Test):
         self.vm.launch()
         self.wait_for_console_pattern('init started: BusyBox')
 
-    def do_test_arm_raspi2(self, uart_model):
+    def do_test_arm_raspi(self, version, uart_model):
         """
         The kernel can be rebuilt using the kernel source referenced
         and following the instructions on the on:
         https://www.raspberrypi.org/documentation/linux/kernel/building.md
         """
         serial_kernel_cmdline = {
-            'pl011': 'earlycon=pl011,0x3f201000 console=ttyAMA0',
+            'pl011': {
+                2: 'earlycon=pl011,0x3f201000 console=ttyAMA0',
+            },
+        }
+        kernel = {
+            2: '/boot/kernel7.img',
+        }
+        dtb = {
+            2: '/boot/bcm2709-rpi-2-b.dtb',
         }
         deb_url = ('http://archive.raspberrypi.org/debian/'
                    'pool/main/r/raspberrypi-firmware/'
                    'raspberrypi-kernel_1.20190215-1_armhf.deb')
         deb_hash = 'cd284220b32128c5084037553db3c482426f3972'
         deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
-        kernel_path = self.extract_from_deb(deb_path, '/boot/kernel7.img')
-        dtb_path = self.extract_from_deb(deb_path, '/boot/bcm2709-rpi-2-b.dtb')
+        kernel_path = self.extract_from_deb(deb_path, kernel[version])
+        dtb_path = self.extract_from_deb(deb_path, dtb[version])
 
         self.vm.set_console()
         kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
-                               serial_kernel_cmdline[uart_model])
+                               serial_kernel_cmdline[uart_model][version])
         self.vm.add_args('-kernel', kernel_path,
                          '-dtb', dtb_path,
                          '-append', kernel_command_line)
@@ -356,9 +364,10 @@ class BootLinuxConsole(Test):
         """
         :avocado: tags=arch:arm
         :avocado: tags=machine:raspi2
+        :avocado: tags=cpu:cortex-a7
         :avocado: tags=device:pl011
         """
-        self.do_test_arm_raspi2('pl011')
+        self.do_test_arm_raspi(2, 'pl011')
 
     def test_arm_exynos4210_initrd(self):
         """
-- 
2.21.1


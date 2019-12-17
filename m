Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp6393268lff;
        Tue, 17 Dec 2019 10:29:23 -0800 (PST)
X-Google-Smtp-Source: APXvYqw7hIqlByiZWKydxdo93SOJ4GGlJ+rgz2g8pehkR4ZCE/+C76d2aVgSxJXHgvIvLiX0sLLF
X-Received: by 2002:a05:620a:2013:: with SMTP id c19mr6406823qka.496.1576607363164;
        Tue, 17 Dec 2019 10:29:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576607363; cv=none;
        d=google.com; s=arc-20160816;
        b=tqsgZhptXAv+KlxLSLCE6JapfwFCQDIer1VU+4Cp4GAtQ28qp6JCuimaKoWPiN9Frj
         or7EvJbCDRnN7/S4Z0DqgZfgtPf1l/rRnPYXIZRnz1j9NczrW0v7WEF4vk+iwk5JfbNg
         8bmWBmoHiYUtntu5sF/rvlREKkY0SvQ/o/WICchFU6ir03r7uXKjtORNMI0AqmEVRcGZ
         slwfg4jGQEqXiqjWa4040bYnJCYbNKbxzOH0tTQjagItBfQgJpHWpUj3lZPVUfXPsf4Y
         a6+W8qaP0gtX8hs6sUwk57ttvAET9zkHelDSzmwXQY5L3yFfo3l28/puOwZDGINBrgTD
         klNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=sEW+kg5xC2YTirRGSRWpCZbEvF55I4jI+uWx8tZT5Y4=;
        b=gs6CiH3MASywNQRsrOrMRWXSPsvFe9GJq3VDn5DQzv6flI4CwlNe9rq9t22VHmS+zl
         bTBUFZiWT+s5peUgrO1AeZeXscuHhifk+/BwnMJNRPjG3x0WWgsNbNo/zle9uSJkpv8C
         0+41exuxFAng+9gFFR3KbxJcQCdvqZ9H6tLmZmrDIsXgVcJyHav31mf8HUwyI1uhaJrq
         iJzT28aBBSm7oPyK83tIoZmx3vwt2u2FYwzws6etSAAGrJb/h70jormKHceaZLeqIO7u
         xBog8XQH3uwVyR0pvHnnE+BJU39ctP3AYfduvtAWJK+tn1L5Ns0TnBSdupFSglSH01Td
         JLig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=NS5ugS7v;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d9si11399725qka.330.2019.12.17.10.29.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Dec 2019 10:29:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=NS5ugS7v;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ihHb0-0002Ti-9i
	for alex.bennee@linaro.org; Tue, 17 Dec 2019 13:29:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46030)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ihHZJ-00015G-MF
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 13:27:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ihHZI-0003Xj-7n
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 13:27:37 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:33810)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ihHZI-0003XA-1e; Tue, 17 Dec 2019 13:27:36 -0500
Received: by mail-wr1-x42e.google.com with SMTP id t2so12436438wrr.1;
 Tue, 17 Dec 2019 10:27:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sEW+kg5xC2YTirRGSRWpCZbEvF55I4jI+uWx8tZT5Y4=;
 b=NS5ugS7vx4/S7BIEVz9EeCDVOQf5t/m480ixDlTHC7YDnUnuFpTQHaEslilESETdon
 M0OYDZmUgsFoHMrRopdDme0TGtPcQUMM+Q/M1AuOb7qrZGi+MFOT5xwUR13a+QR6C4nk
 z9DmIf0mPODU+kKRwUFbbA/ZlKMuiSa0XHJ0Af0DKh5Map2JSxgp3TL/HvcIdjuIgwHp
 KsOoFhclZ5qLkGtBJih5/Gd0IJR8KVlNexAU4Yg0OP7p1PWTILclLpAdFVRFsS6SkbEl
 b61vB2mhuI+Z/WThYslezxql/KsJswfDdpQazojZCosdsYdZQx1YNHgBkC1FCGEgeuYT
 EuCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=sEW+kg5xC2YTirRGSRWpCZbEvF55I4jI+uWx8tZT5Y4=;
 b=peeFGm59jz66CVJOqj9N9a6fTv5wXW3FPhAXhyCOjS3pWQszsvbhhgF4yHWo8F2zKN
 cGXlBTjbCxHF/6SyQnqH0Y7BA+W+0l2X5UW3vg/fuByHrG1rGs+z4MTo8RwpD6EbRM8z
 9qj3M5f86lrByKS+w5mxm0Vw8yB7JGIvTX9NGDfWh4/QD5syN2ufOq+7ddAuoZjZ0Hho
 PNZTi24L31zKAVTcR3Uj3F7zmwYgZEfIh1nYFJyrLS/mEj58QCJS44oVYoYkNBwC5/Fd
 BwNDhRr9B6048MXndY5BrY2+fFtcG6i71uqSRMrFol6jtN3pEVtiJfRddhnV/QcUeHFM
 UdGw==
X-Gm-Message-State: APjAAAUTTYiGlZ0no9TybSNtMiTJCijQAZL8ngjEQzrEBN+HRXzY+DF/
 nB9Qyzkd8QSV39mKnO5N/iF0CBSp
X-Received: by 2002:a5d:4204:: with SMTP id n4mr27800031wrq.123.1576607253854; 
 Tue, 17 Dec 2019 10:27:33 -0800 (PST)
Received: from x1w.redhat.com (34.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.34])
 by smtp.gmail.com with ESMTPSA id u18sm26006975wrt.26.2019.12.17.10.27.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2019 10:27:33 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/5] tests/boot_linux_console: Add a quick test for the
 OrangePi PC board
Date: Tue, 17 Dec 2019 19:27:26 +0100
Message-Id: <20191217182730.943-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191217182730.943-1-f4bug@amsat.org>
References: <20191217182730.943-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::42e
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hJ3pZXVfF+PB

This test boots a Linux kernel on a OrangePi PC board and verify
the serial output is working.

The kernel image and DeviceTree blob are built by the Raspbian
project (based on Debian):
https://www.raspbian.org/RaspbianImages

If ARM is a target being built, "make check-acceptance" will
automatically include this test by the use of the "arch:arm" tags.

Alternatively, this test can be run using:

  $ make check-venv
  $ ./tests/venv/bin/avocado --show=console,app run -t machine:orangepi-pc tests/acceptance/boot_linux_console.py
  JOB ID     : 2e4d15eceb13c33672af406f08171e6e9de1414a
  JOB LOG    : ~/job-results/job-2019-12-17T05.46-2e4d15e/job.log
  (1/1) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi:
  console: Uncompressing Linux... done, booting the kernel.
  console: Booting Linux on physical CPU 0x0
  console: Linux version 4.20.7-sunxi (root@armbian.com) (gcc version 7.2.1 20171011 (Linaro GCC 7.2-2017.11)) #5.75 SMP Fri Feb 8 09:02:10 CET 2019
  console: CPU: ARMv7 Processor [410fc075] revision 5 (ARMv7), cr=50c5387d
  console: CPU: div instructions available: patching division code
  console: CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing instruction cache
  console: OF: fdt: Machine model: Xunlong Orange Pi PC
  console: Memory policy: Data cache writealloc
  console: OF: reserved mem: failed to allocate memory for node 'cma@4a000000'
  console: cma: Failed to reserve 128 MiB
  console: psci: probing for conduit method from DT.
  console: psci: PSCIv0.2 detected in firmware.
  console: psci: Using standard PSCI v0.2 function IDs
  console: psci: Trusted OS migration not required
  console: random: get_random_bytes called from start_kernel+0x8d/0x3c2 with crng_init=0
  console: percpu: Embedded 18 pages/cpu @(ptrval) s41228 r8192 d24308 u73728
  console: Built 1 zonelists, mobility grouping on.  Total pages: 32480
  console: Kernel command line: printk.time=0 console=ttyS0,115200
  PASS (8.59 s)
  JOB TIME   : 8.81 s

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/acceptance/boot_linux_console.py | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index 7e41cebd47..820239e439 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -411,6 +411,32 @@ class BootLinuxConsole(Test):
         self.wait_for_console_pattern('Boot successful.')
         # TODO user command, for now the uart is stuck
 
+    def test_arm_orangepi(self):
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
+
+        self.vm.set_machine('orangepi-pc')
+        self.vm.set_console()
+        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
+                               'console=ttyS0,115200n8 '
+                               'earlycon=uart,mmio32,0x1c28000')
+        self.vm.add_args('-kernel', kernel_path,
+                         '-dtb', dtb_path,
+                         '-append', kernel_command_line)
+        self.vm.launch()
+        console_pattern = 'Kernel command line: %s' % kernel_command_line
+        self.wait_for_console_pattern(console_pattern)
+
     def test_s390x_s390_ccw_virtio(self):
         """
         :avocado: tags=arch:s390x
-- 
2.21.0


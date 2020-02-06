Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp824159lfp;
        Wed, 5 Feb 2020 17:34:16 -0800 (PST)
X-Google-Smtp-Source: APXvYqxBH/rvdB8ibGLHXmLlNEg8bPei/x/94WG2q8t1k9FczYT1ewnua58SzEU7hQ4tjCflexkm
X-Received: by 2002:ac8:6784:: with SMTP id b4mr559358qtp.27.1580952856202;
        Wed, 05 Feb 2020 17:34:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580952856; cv=none;
        d=google.com; s=arc-20160816;
        b=B3NvDP6reg+3Ojn6ZOX/ooDL9QQ3jT5hMgDSeX1ojwyVMRJHV+dFhQqvSrPOc/JGPx
         7xg7UWjgPg8Q8/+mSOq1JM88MFxrUk8eVYPX+hkZI4S7nmNzURd+GuJQo9ujNB2tsHFQ
         C6t4O0zs4MbntYtkdV9A5xOCThoGCEC/QCDxWUnLW/bSsUp/nBI5fofbTm19Dxi8c4W5
         vOPV/cspausrikaSpEQP3At8ZFqy44Ux4XBBlbCTtxuPXU0ZzNiFWH6NMjIwpaJdTeyQ
         p8rjrTg/30j4u0ZObyPu/lO8fO4UtDBDBe4wOYwdUknnoDypu7MrVGGPJIfuJ5/J7pJ5
         kR5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=QGRmYJ7L9YDtOUA7ryXiSMK9rx2JaMJd+CVAQCLIvks=;
        b=FRJ/xmKyP6ncCK3ZgnmevzcOl+uepxwc118w0Ne0/UlhurUp5ZBqTKIwFf2i8IW1ad
         hAv6PqHiJP9OUV4+a5qAZSjFHrohR9D/JrliW+JIaw1O+uRSteSvo/LxLFmWGsHc5Fv+
         W28oOPe1p25q6Qvq6k55Wcz11oPck2IjPT+MISo9AXjWHqnfa9HlAyLBb9rhMJsitZSt
         COPfHJblIQlBosO5UWqc27LRQda4j0aLIbDMAQSUGJfbFvAWYj5dJiza1r+HLkbhq69S
         JdK5On/6hsY/RXvxG1GcMbV/aXM2yDc19kHdXY0ZadNMY5GIj2W/xjfRdizc/xQ0RKo3
         HpMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=PMOg8rHn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x8si799533qkn.123.2020.02.05.17.34.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Feb 2020 17:34:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=PMOg8rHn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:59394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1izW3b-0004pE-Jx
	for alex.bennee@linaro.org; Wed, 05 Feb 2020 20:34:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54614)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1izVor-0001Vh-TS
 for qemu-arm@nongnu.org; Wed, 05 Feb 2020 20:19:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1izVon-0004uv-R0
 for qemu-arm@nongnu.org; Wed, 05 Feb 2020 20:19:01 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:39007)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1izVoj-0004UP-TD; Wed, 05 Feb 2020 20:18:54 -0500
Received: by mail-wm1-x32f.google.com with SMTP id c84so5046868wme.4;
 Wed, 05 Feb 2020 17:18:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QGRmYJ7L9YDtOUA7ryXiSMK9rx2JaMJd+CVAQCLIvks=;
 b=PMOg8rHnQB/j/VuMexCkZorSUToLiuCmrsy1V6sIgEtC8pzofMAvtEugUOX4o876aB
 lVJdm9+P+ka7/y1RnBr8c175VpBZSnNt4zCSC+6MyZMRTADPD/ybJ5KGj6AJX4gDLB0a
 qq2rnPmYCasmAMaCCDj+ODsyTL/l+vSTSck3UEKs5AdCip7wlW6uQLT2YXOcOol0EYkr
 DhqHd0OZ9WYN6iSy2xnuTR9sdFXzCwxT9DfSNnw8xQGmAv78Yh0NpBs8IxqcK2rZXvwz
 ay22rzQjuAwoWx86S9Z/JflJ8hlThUUrJRyivuBkv4uc4lp7UYOeA0meGkWJVy3j9nlO
 SNVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=QGRmYJ7L9YDtOUA7ryXiSMK9rx2JaMJd+CVAQCLIvks=;
 b=YCiFsvR90HrzxNqmxMedaQdI49UKhqPaLCW5tC710+K3wc6p5Ya0IaATKcMUL3cv1J
 k4Q7PSwHRfgi5tRs8MigRQsLcBCinntCxzurLAPbZtlxpjwZfofVtiVqjDJ6IMaRub0u
 tnS+MjlhQwGr5ag4TOERCou2Ak+E5qaFbNlGRaiRj5Er4rFsyyc7o1ZHL0Nw9Ni9DYxN
 8aoD7N0ARr34dpMgjdTCLGAe5l58LNPZNucCbDW1lpRVblb+vESQ3plxUDh/jGyO4d7A
 TMh0kyedv5i3wdQVFG1z6KbXkNpMczLTh4L04QtuWtBkkcSAkkGCx6DwWu8VQsOaeoBT
 KAxA==
X-Gm-Message-State: APjAAAU8obgjEc1yq52WY/cpmDQPIDpF90MOytrgFvblDzjhxQGh+2Ll
 eGbdDdJDeoHlWz82JyC34EIrcW2N
X-Received: by 2002:a05:600c:214a:: with SMTP id
 v10mr654711wml.182.1580951931642; 
 Wed, 05 Feb 2020 17:18:51 -0800 (PST)
Received: from localhost.localdomain (2.red-95-127-156.staticip.rima-tde.net.
 [95.127.156.2])
 by smtp.gmail.com with ESMTPSA id w13sm2053526wru.38.2020.02.05.17.18.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Feb 2020 17:18:51 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 25/30] tests/acceptance/boot_linux_console: Test the raspi0
 console
Date: Thu,  6 Feb 2020 02:17:51 +0100
Message-Id: <20200206011756.2413-26-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200206011756.2413-1-f4bug@amsat.org>
References: <20200206011756.2413-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::32f
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
X-TUID: ehz800znsD92

  $ avocado --show=app,console run -t machine:raspi0 tests/acceptance/
  JOB ID     : af8e017486290758bff39c986934134199af3556
  JOB LOG    : avocado/job-results/job-2020-02-05T23.53-af8e017/job.log
   (1/1) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_raspi0_uart0:
  console: [    0.000000] Booting Linux on physical CPU 0x0
  console: [    0.000000] Linux version 4.14.98+ (dom@dom-XPS-13-9370) (gcc version 4.9.3 (crosstool-NG crosstool-ng-1.22.0-88-g8460611)) #1200 Tue Feb 12 20:11:02 GMT 2019
  console: [    0.000000] CPU: ARMv6-compatible processor [410fb767] revision 7 (ARMv7), cr=00c5387d
  console: [    0.000000] CPU: VIPT aliasing data cache, unknown instruction cache
  console: [    0.000000] OF: fdt: Machine model: Raspberry Pi Zero W
  console: [    0.000000] earlycon: pl11 at MMIO 0x20201000 (options '')
  console: [    0.000000] bootconsole [pl11] enabled
  console: [    0.000000] Memory policy: Data cache writeback
  console: [    0.000000] cma: Reserved 8 MiB at 0x1b800000
  console: [    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 113680
  console: [    0.000000] Kernel command line: printk.time=0 earlycon=pl011,0x20201000 console=ttyAMA0
  PASS (12.59 s)
  RESULTS    : PASS 1 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CANCEL 0
  JOB TIME   : 12.88 s

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/acceptance/boot_linux_console.py | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index 0371828326..df6600ab2f 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -333,15 +333,18 @@ class BootLinuxConsole(Test):
         """
         serial_kernel_cmdline = {
             'pl011': {
+                0: 'earlycon=pl011,0x20201000 console=ttyAMA0',
                 1: 'earlycon=pl011,0x20201000 console=ttyAMA0',
                 2: 'earlycon=pl011,0x3f201000 console=ttyAMA0',
             },
         }
         kernel = {
+            0: '/boot/kernel.img',
             1: '/boot/kernel.img',
             2: '/boot/kernel7.img',
         }
         dtb = {
+            0: '/boot/bcm2708-rpi-0-w.dtb',
             1: '/boot/bcm2708-rpi-b.dtb',
             2: '/boot/bcm2709-rpi-2-b.dtb',
         }
@@ -363,6 +366,15 @@ class BootLinuxConsole(Test):
         console_pattern = 'Kernel command line: %s' % kernel_command_line
         self.wait_for_console_pattern(console_pattern)
 
+    def test_arm_raspi0_uart0(self):
+        """
+        :avocado: tags=arch:arm
+        :avocado: tags=machine:raspi0
+        :avocado: tags=cpu:arm1176
+        :avocado: tags=device:pl011
+        """
+        self.do_test_arm_raspi(0, 'pl011')
+
     def test_arm_raspi1_uart0(self):
         """
         :avocado: tags=arch:arm
-- 
2.21.1


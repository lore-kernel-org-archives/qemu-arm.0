Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp825152lfp;
        Wed, 5 Feb 2020 17:35:27 -0800 (PST)
X-Google-Smtp-Source: APXvYqw2QebAAItSF+9ApPODzuHVrCEG4+muy2+bh1s6Iq8xuLmtv3y4AeVTYU/94h3DPLUCpxPa
X-Received: by 2002:ac8:7501:: with SMTP id u1mr573715qtq.149.1580952927425;
        Wed, 05 Feb 2020 17:35:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580952927; cv=none;
        d=google.com; s=arc-20160816;
        b=e3C60sWqE18zEkde8YZk5CxIXECr7cZhKcvm1Ww7smFRgO22MXHjNiPVEX4w6JWpY1
         0cowg+DWmnah6uk7hOqtfw6wn3Puc/ERJ55bgE5fwI3OJ+SznqYiTL0iWNy0EtG2F2Ig
         rEFPrIoJuYRsomRY+BNrWsbubqTeuEEiF3+Ip1EDC71DztCoXA6AhABkO2fPzKABA0Sq
         dwxVGMyWncU8k+KeIvX9SBdQ1UBBRREFyG/ZGNS6ZPQek2JgTt1pwCY0LfAFg8JU7TNH
         zsLZpNscztMp9lTBj650r6wrJFcdPGEVQPjGJU6I442ei0q8iTAy75qss5E4W/BpnJo1
         7l7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=NSPhdi5z/EOyie7EhJsj1BFgQSU+1IYII+hor8QwjfU=;
        b=TGn9jmQ3xSma/S9zmtYH7ORnJl26sNTIpXJPTx8STWRiPuklIAnZQQifo1MO9YJVao
         pXa8xaXIFUr2k9fUm9VgaKgoPSrAxh/qlMdiUU4ysHG4sERSSsvBrAwdwLOuYU7Ekzg+
         WoJ7F1HmnOvrDP6H0p2z9gFfeaXRL12gpc4rqjKwP+wGBD728074Y/u5waO6x/vcxw/v
         HbQv+r4NJ5rDcd9gvrQ2dZLBxBn0BJ7YQ1+vvaLK1cHtIjbil6nR7r1DhGJqZkzacufa
         b+9sBp0+fR+2HmahkJaaggSsH5r6BWZTF1IDJg+g1k3aVHtHuSel/7FFfkRaML3ZyJRw
         wRBA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=vRv7Hdgz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n7si840006qvz.184.2020.02.05.17.35.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Feb 2020 17:35:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=vRv7Hdgz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:59400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1izW4k-0005nR-PM
	for alex.bennee@linaro.org; Wed, 05 Feb 2020 20:35:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54462)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1izVoj-0001IA-Ep
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 20:18:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1izVoh-0004RX-44
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 20:18:52 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:50279)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1izVog-0004QE-Tg; Wed, 05 Feb 2020 20:18:51 -0500
Received: by mail-wm1-x336.google.com with SMTP id a5so4493498wmb.0;
 Wed, 05 Feb 2020 17:18:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NSPhdi5z/EOyie7EhJsj1BFgQSU+1IYII+hor8QwjfU=;
 b=vRv7Hdgz6zYpj2SU+KOMpOIFzW6X70Hl3kB29WZyRUxG8Wx/vombLNI8u1pFR/MonE
 Ugzd6s3/Op8ozR05toTzf567oQzHu4Jr22be631matWlaiMX0sK455SsdW+Ttjrk43O1
 dayjXmoiKXqbMfMkg/fzjVsauQXsmNWvvrUefXx5YTCTmJCZqgYErgPemneGA/0K5m5u
 mrk1tZhXrHVxLgbJY7a6MJp9hewwGo3AzV93UvIomPomixy8Sw45WqQYlItHX4IPFBm+
 ptbzFz7elBxqSxr5TES5VCNS0NRyRnrjLNKwwpUL/7bd2MYrDE6qhzA46mt3UmRkdbxu
 452Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=NSPhdi5z/EOyie7EhJsj1BFgQSU+1IYII+hor8QwjfU=;
 b=t6fRrtjti0XAT+EkBdSqp66WnmDz5H1UyFJFvbsD3xkMu9zVHyeD63e5Ha06xnviHc
 0yZYmuv8k88wG8gcgz6mIC94FcO3ovvqkt+koj5RfG6n436eCS8faTGTD6SsyJvh87fR
 PCXF+UQLu2EU+YZtnX8miy9yCt7oNK+oYo9sLf5yCLs/sSKLpApjucFILTb8gi9cvsD1
 25LqVcjCl8DC4xznwYF7BwDBR7DpqLyXRhGMQ7w24syB1AeKhMLCpXVCubleqriGnKuh
 4oD42SVxyh/UDtE5uGucCEtl4IOyDoYfGM0aUzG7gh+Sjnj2TeL0QfFuewRROPKtTN5D
 zg6A==
X-Gm-Message-State: APjAAAUhmtxheldZKdnrdhjOisUZ3bfwcJ0buO3XH6gPo2fEjZ6yzxPf
 eoGSD/U/1gji1UcxKliq/rrvbReI
X-Received: by 2002:a1c:38c7:: with SMTP id f190mr621872wma.94.1580951929737; 
 Wed, 05 Feb 2020 17:18:49 -0800 (PST)
Received: from localhost.localdomain (2.red-95-127-156.staticip.rima-tde.net.
 [95.127.156.2])
 by smtp.gmail.com with ESMTPSA id w13sm2053526wru.38.2020.02.05.17.18.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Feb 2020 17:18:49 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 24/30] tests/acceptance/boot_linux_console: Test the raspi1
 console
Date: Thu,  6 Feb 2020 02:17:50 +0100
Message-Id: <20200206011756.2413-25-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200206011756.2413-1-f4bug@amsat.org>
References: <20200206011756.2413-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::336
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
 Joaquin de Andres <me@xcancerberox.com.ar>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Esteban Bosse <estebanbosse@gmail.com>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6jCQOAQwn0hP

  $ avocado --show=app,console run -t machine:raspi1 tests/acceptance/
  JOB ID     : c49310d4a21444f03789cd2c443d8c54a29ffd0a
  JOB LOG    : avocado/job-results/job-2020-02-05T23.52-c49310d/job.log
   (1/1) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_raspi1_uart0:
  console: [    0.000000] Booting Linux on physical CPU 0x0
  console: [    0.000000] Linux version 4.14.98+ (dom@dom-XPS-13-9370) (gcc version 4.9.3 (crosstool-NG crosstool-ng-1.22.0-88-g8460611)) #1200 Tue Feb 12 20:11:02 GMT 2019
  console: [    0.000000] CPU: ARMv6-compatible processor [410fb767] revision 7 (ARMv7), cr=00c5387d
  console: [    0.000000] CPU: VIPT aliasing data cache, unknown instruction cache
  console: [    0.000000] OF: fdt: Machine model: Raspberry Pi Model B
  console: [    0.000000] earlycon: pl11 at MMIO 0x20201000 (options '')
  console: [    0.000000] bootconsole [pl11] enabled
  console: [    0.000000] Memory policy: Data cache writeback
  console: [    0.000000] cma: Reserved 8 MiB at 0x1b800000
  console: [    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 113680
  console: [    0.000000] Kernel command line: printk.time=0 earlycon=pl011,0x20201000 console=ttyAMA0
  PASS (12.93 s)
  RESULTS    : PASS 1 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CANCEL 0
  JOB TIME   : 13.18 s

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/acceptance/boot_linux_console.py | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index 56c8d54ca6..0371828326 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -333,13 +333,16 @@ class BootLinuxConsole(Test):
         """
         serial_kernel_cmdline = {
             'pl011': {
+                1: 'earlycon=pl011,0x20201000 console=ttyAMA0',
                 2: 'earlycon=pl011,0x3f201000 console=ttyAMA0',
             },
         }
         kernel = {
+            1: '/boot/kernel.img',
             2: '/boot/kernel7.img',
         }
         dtb = {
+            1: '/boot/bcm2708-rpi-b.dtb',
             2: '/boot/bcm2709-rpi-2-b.dtb',
         }
         deb_url = ('http://archive.raspberrypi.org/debian/'
@@ -360,6 +363,15 @@ class BootLinuxConsole(Test):
         console_pattern = 'Kernel command line: %s' % kernel_command_line
         self.wait_for_console_pattern(console_pattern)
 
+    def test_arm_raspi1_uart0(self):
+        """
+        :avocado: tags=arch:arm
+        :avocado: tags=machine:raspi1
+        :avocado: tags=cpu:arm1176
+        :avocado: tags=device:pl011
+        """
+        self.do_test_arm_raspi(1, 'pl011')
+
     def test_arm_raspi2_uart0(self):
         """
         :avocado: tags=arch:arm
-- 
2.21.1


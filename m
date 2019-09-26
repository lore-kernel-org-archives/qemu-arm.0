Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp2461830wrp;
        Thu, 26 Sep 2019 11:08:24 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxG3j9G5COvD29kFB7SA0hRGhLbVSP8eIljKpmo/VcLSsI4p6ASruJUZHXvHRz4WhAew1+r
X-Received: by 2002:a37:4713:: with SMTP id u19mr107497qka.270.1569521304322;
        Thu, 26 Sep 2019 11:08:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569521304; cv=none;
        d=google.com; s=arc-20160816;
        b=GD7+rWTbfHIFp8akvjILsy1wRDBiSBzGPt+4D27+ErlRDq3WLFVUO8vP+e9yxI0F5h
         7okDhg+yicAZ6nYvf6Kk1hrxDP65rI39pA7NQbkhrc4O8YMC/68X1fgj1MeH1QLbGsQm
         ifGEluTVm3FcrId9xrL5qMCcl9ghQMVvWvmx29JQU8hVukT0GQMx9LdjjSNuV9DeTasr
         ylERcZcvlOMvgvz7xDxR6MS3QN4PhWxoyF1dHJyJHupiVpNbodhtx1FcAIRmwsZBAAXx
         FHuXgUWgvxR7bxrCxfz2ShNzKMY8i5KZ9dmZXHaNGHzL40uoJ85kI71SEbExrMJsxnxm
         sdGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=izDpyq59rblh6afPzQ7olE7lYmJirhrXObmCCQIkPKI=;
        b=vsaGkzmTfrQBI4657EaIm7asIgPVGyPrD63ceMqECrhFDql6epza2DD09Z39x83G+m
         f+RElbg/g3vKXsww2F6o2fzq3pKuO1WNUswo9/+mjHa2RrC/ZQeXBh0GqSlerd0GN1s7
         DQK0WP/ZHC8G1Wz/x3Cb4FA+M212vP/zXNmRYsC6Yx8o8z+mPxdvATD25m5em9guxeza
         cWRwlu3ur5Ag10LJ/L9shxDknPaQxaAv/LWesl14oQGQmyouKvOjMz4I/GtjxUMqQESM
         SOLb90oZasCmbfDbs0tnxqxeOcKaoUp1ULuXRqg+Esv0zUtJ/MINjrmKZiMMi9WCnGKw
         NT4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=n5FXHbVk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g35si2537444qvd.56.2019.09.26.11.08.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Sep 2019 11:08:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=n5FXHbVk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iDYBh-0007Fa-Os
	for alex.bennee@linaro.org; Thu, 26 Sep 2019 14:08:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59165)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iDXgZ-0004r1-3l
 for qemu-devel@nongnu.org; Thu, 26 Sep 2019 13:36:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iDXgX-00039Y-Nq
 for qemu-devel@nongnu.org; Thu, 26 Sep 2019 13:36:10 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:38909)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iDXgX-000391-Fg; Thu, 26 Sep 2019 13:36:09 -0400
Received: by mail-wr1-f67.google.com with SMTP id w12so3031473wro.5;
 Thu, 26 Sep 2019 10:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=izDpyq59rblh6afPzQ7olE7lYmJirhrXObmCCQIkPKI=;
 b=n5FXHbVkOx7bQwPOi/0BCGY9XMInZ0xX7NJNdLVdyDZTzD2UmLS1pcYzWHlG5+f13I
 sqb9ZdCBomy1Q1z8c4vuniwkKM+KTr19w6ZiaZtppKLxbdhRx71Yr57DnZS4reS5syxt
 7a64NKssGnWi5mRFi4ZqmGnLx5CRkHBf+WrO0kkbz1OmWZr5dHVywmIC2pteDyZrnfen
 nguR6XphsrLsUU5nfF4tIBG141cESkcWpVTLA4KPozd+RWPIM/sbdnnuA05KWb9ziAOW
 gHv0/sOo9D1akNDowj4TdeKU8DFbk/z3M/Q/xFQOjLTAuF+MVIpFQmihguxkSdy0Ob6j
 xSTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=izDpyq59rblh6afPzQ7olE7lYmJirhrXObmCCQIkPKI=;
 b=UE0FdeqoPG4AgfE5GPFtsRfRYjBDdB64EvGX6MUgYLh1tXAzg/7i7DAuwB31EqusfY
 bxJ4HoEhEvQQ9RaC/7ZpIoxDh1lfKEnsPQ/AS01ANHAKURbq5xc0RNN0zptsEWohdet7
 n7S+MXQty0p1Wtr1M3Gv8fh21XrdRe21uEFSs/xRlu/HS+yvDgMadGGz2U2bfcIPIama
 ESgJ7YIsl+fkjTBjJZN0xn8HCg9/fjVFYwpHX7F85VDG7ZRyp1OO80AKi8dvfBbXUA9I
 /CQo6g0rOfO29Qsms1g8x2M4fdudHf5M7eKR96mUsl4U+eRb4TzR1fN3em6Wtd1n5mfo
 hjOw==
X-Gm-Message-State: APjAAAUbetIXcXv1dNwVrnL09j/SGyHhDOS2DQ6Q0zXDwU9qU8bLMXJG
 bzMMf36u1fiRrxcZRun641KGiwccE4U=
X-Received: by 2002:adf:f081:: with SMTP id n1mr4240702wro.273.1569519308279; 
 Thu, 26 Sep 2019 10:35:08 -0700 (PDT)
Received: from x1w.redhat.com (240.red-88-21-68.staticip.rima-tde.net.
 [88.21.68.240])
 by smtp.gmail.com with ESMTPSA id b186sm9918980wmd.16.2019.09.26.10.35.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2019 10:35:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 17/19] tests/boot_linux_console: Test the raspi2 UART1 (16550
 based)
Date: Thu, 26 Sep 2019 19:34:25 +0200
Message-Id: <20190926173428.10713-18-f4bug@amsat.org>
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
X-TUID: +E2j8EHOsalm

The current do_test_arm_raspi2() case tests the PL011 UART0.
Our model also supports the AUX UART (16550 based).
We can very simply test the UART1 with Linux, modifying the
kernel command line.

Add few lines to expand our previous test and cover the AUX
UART.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/acceptance/boot_linux_console.py | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index 7eaf6cb60e..33e8f6c635 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -326,6 +326,7 @@ class BootLinuxConsole(Test):
         """
         serial_kernel_cmdline = {
             0: 'earlycon=pl011,0x3f201000 console=ttyAMA0',
+            1: 'earlycon=uart8250,mmio32,0x3f215040 console=ttyS1,115200'
         }
         deb_url = ('http://archive.raspberrypi.org/debian/'
                    'pool/main/r/raspberrypi-firmware/'
@@ -336,7 +337,7 @@ class BootLinuxConsole(Test):
         dtb_path = self.extract_from_deb(deb_path, '/boot/bcm2709-rpi-2-b.dtb')
 
         self.vm.set_machine('raspi2')
-        self.vm.set_console()
+        self.vm.set_console(console_id=uart_id)
         kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
                                serial_kernel_cmdline[uart_id])
         self.vm.add_args('-kernel', kernel_path,
@@ -354,6 +355,14 @@ class BootLinuxConsole(Test):
         """
         self.do_test_arm_raspi2(0)
 
+    def test_arm_raspi2_uart1(self):
+        """
+        :avocado: tags=arch:arm
+        :avocado: tags=machine:raspi2
+        :avocado: tags=device:bcm2835_aux
+        """
+        self.do_test_arm_raspi2(1)
+
     def test_s390x_s390_ccw_virtio(self):
         """
         :avocado: tags=arch:s390x
-- 
2.20.1


Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp750594lfm;
        Fri, 10 Apr 2020 07:47:34 -0700 (PDT)
X-Google-Smtp-Source: APiQypK7qEluB2rjO0BLOr5cuJ+jlTrwJpf79IL0wT4FBBcSzifYKHG0c7dbTyXWAO6wAfgDafgl
X-Received: by 2002:ac8:468d:: with SMTP id g13mr4608518qto.59.1586530054764;
        Fri, 10 Apr 2020 07:47:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586530054; cv=none;
        d=google.com; s=arc-20160816;
        b=S+5i2eJ9VK67U/yBHjSkehxv68GlpWe0MHiBO/xxxmsRfUrkPfscfuiPOsPvp31xQj
         uDJIOExHvu1AEKXW30z9rnYPZ+tH4K6ZdZ2duXQq+iYyCIqZs6Fukb4GnnaI4IINeqAg
         3ZfjzQRXNO6fQDg7kwV4GAPru2KWXHqvkvDpoWmJ1xECgZwjXN4JfyPF2blIP0InE4IW
         EE+M9OZnzY+WCRR0OHFPhxQljFUMlvlQF21tgpcQ2AB5bIX2TSQEDCUxRoS8/Qp/Mbgk
         IN8TFwUzb2ITvg1CMOheTmeHyYglpIZSHIrn4mnPqXXSi9R/JSLSO2Buq37bYfXxjBbg
         1l9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=oC4LI+rsC3AfaHKWa06ELH+UcID+dQ6LdmleZ0eZwSQ=;
        b=gIl9R+pXW5T1uLPkXCEw5D/v47MQH7rPavky3YR8vJpa73QU8yXpeToYVPRXuLgey1
         Cv8FPrv971wQyT/9JwlPhry3xxO5c5nqwMMWXs5zXDFMS+tanOYStLJeyMLLFNnSO42i
         QoP8dqVZcJ8GNZmdIYsAKRetNNUStrpln08OpnfEdYCiZtr9XvjfAIpkX/yF774RfBJ+
         Zb+3oeI+ztk0E0LepT5SDcVO9vUMQ5+2dWsiaFoG6uHv1ZGQvzVdpp6xb0X7KlQ1klS5
         FZJBgxgmkhgCZP6loph4HRsJyqhJJ/Ei0svFoHRDrb5hQ/8uk7Lx7SCiT2RgSbDHpPVl
         9+bA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=q3UjFZIz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l21si1421850qtn.214.2020.04.10.07.47.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Apr 2020 07:47:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=q3UjFZIz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:35390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jMuwQ-0000h5-1i
	for alex.bennee@linaro.org; Fri, 10 Apr 2020 10:47:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53322)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <sundeep.lkml@gmail.com>) id 1jMuun-0006i0-F7
 for qemu-devel@nongnu.org; Fri, 10 Apr 2020 10:45:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <sundeep.lkml@gmail.com>) id 1jMuum-0007WA-DZ
 for qemu-devel@nongnu.org; Fri, 10 Apr 2020 10:45:53 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:42850)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
 id 1jMuum-0007Uu-7d; Fri, 10 Apr 2020 10:45:52 -0400
Received: by mail-pg1-x542.google.com with SMTP id g6so1055441pgs.9;
 Fri, 10 Apr 2020 07:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=oC4LI+rsC3AfaHKWa06ELH+UcID+dQ6LdmleZ0eZwSQ=;
 b=q3UjFZIzspKy6uVSbDGTBSYT6H/6K2BvXfAxw5pLG1xZTpsO3L3qy4dffeV/Jsh7Oi
 GrZmL8EqUzxWm1HMtBZ05bwRrXOroxTkdtjR2+ddmF25ZU2Zapmaecz+WlinOBbMNeSd
 zxgW6DGyBwYRffDLE1VCKPqzPgqjJyxj2A4BDVbJorSyGV6byv60subaDzEzq8GSPrG5
 yjA9qQXy2TUGRUGQeUakuR/0aVB9olpt/G1yUH4tzXIyxC3HgzOgov0gsTbPM1Vkvif8
 v6vghspncvKCjuTnEhDB2PKW2p+fpiyQxFRrAhxJ1mXYIYLXgoC2Y11fRpS1bkgnUjwI
 K3vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=oC4LI+rsC3AfaHKWa06ELH+UcID+dQ6LdmleZ0eZwSQ=;
 b=F6vmziBSigas4+WMo1SDzO4cynGjqXjlYjrYDHcYdtZZQ5f0+AFhPN0pp8ORYD6BKi
 kbQfCKqcnaQdHHIdiAXikSofLQyKGkUrqIp5C7Y/lH5kbgQRPZmIyBZv2nGzEfLQRtCL
 cS7AYLmFlFueu86pE+WTEr+nsxkZ2wtBWQFA3715+/VwK5U1FETadIkBdA2y8qi7V6Je
 /Z0S0xTNPAN/u89NTemS2w+rBF/FaqBd+S7w6hFYq4tWV6HfWvto+SbnFInentXN8rGA
 TjVVu0Yd8Hf5NnUcPV04wicKTUF5QblsqFgch7uYpHa/leCPgdsd+/ciFe7TKFVn4f5Q
 RN7w==
X-Gm-Message-State: AGi0PubegdWrWKUPXbEEGK5CMJK80QoUXEPWbev8myUnTp40WPkumgH5
 BtvyziOclzdkgMXoh7flz/g=
X-Received: by 2002:a63:721a:: with SMTP id n26mr4995899pgc.386.1586529951237; 
 Fri, 10 Apr 2020 07:45:51 -0700 (PDT)
Received: from hyd1358.marvell.com ([115.113.156.2])
 by smtp.googlemail.com with ESMTPSA id p12sm1984667pfq.153.2020.04.10.07.45.48
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 10 Apr 2020 07:45:50 -0700 (PDT)
From: sundeep.lkml@gmail.com
To: jasowang@redhat.com, peter.maydell@linaro.org, philmd@redhat.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: [Qemu devel PATCH v4 3/3] tests/boot_linux_console: Add ethernet test
 to SmartFusion2
Date: Fri, 10 Apr 2020 20:15:26 +0530
Message-Id: <1586529926-11441-4-git-send-email-sundeep.lkml@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586529926-11441-1-git-send-email-sundeep.lkml@gmail.com>
References: <1586529926-11441-1-git-send-email-sundeep.lkml@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::542
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
Cc: Subbaraya Sundeep <sundeep.lkml@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xZwuUpI5mW2S

From: Subbaraya Sundeep <sundeep.lkml@gmail.com>

In addition to simple serial test this patch uses ping
to test the ethernet block modelled in SmartFusion2 SoC.

Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
---
 tests/acceptance/boot_linux_console.py | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index f825cd9..c6b06a1 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -336,13 +336,13 @@ class BootLinuxConsole(Test):
         """
         uboot_url = ('https://raw.githubusercontent.com/'
                      'Subbaraya-Sundeep/qemu-test-binaries/'
-                     'fa030bd77a014a0b8e360d3b7011df89283a2f0b/u-boot')
-        uboot_hash = 'abba5d9c24cdd2d49cdc2a8aa92976cf20737eff'
+                     'fe371d32e50ca682391e1e70ab98c2942aeffb01/u-boot')
+        uboot_hash = 'cbb8cbab970f594bf6523b9855be209c08374ae2'
         uboot_path = self.fetch_asset(uboot_url, asset_hash=uboot_hash)
         spi_url = ('https://raw.githubusercontent.com/'
                    'Subbaraya-Sundeep/qemu-test-binaries/'
-                   'fa030bd77a014a0b8e360d3b7011df89283a2f0b/spi.bin')
-        spi_hash = '85f698329d38de63aea6e884a86fbde70890a78a'
+                   'fe371d32e50ca682391e1e70ab98c2942aeffb01/spi.bin')
+        spi_hash = '65523a1835949b6f4553be96dec1b6a38fb05501'
         spi_path = self.fetch_asset(spi_url, asset_hash=spi_hash)
 
         self.vm.set_console()
@@ -352,7 +352,12 @@ class BootLinuxConsole(Test):
                          '-drive', 'file=' + spi_path + ',if=mtd,format=raw',
                          '-no-reboot')
         self.vm.launch()
-        self.wait_for_console_pattern('init started: BusyBox')
+        self.wait_for_console_pattern('Enter \'help\' for a list')
+
+        exec_command_and_wait_for_pattern(self, 'ifconfig eth0 10.0.2.15',
+                                                 'eth0: link becomes ready')
+        exec_command_and_wait_for_pattern(self, 'ping -c 3 10.0.2.2',
+            '3 packets transmitted, 3 packets received, 0% packet loss')
 
     def do_test_arm_raspi2(self, uart_id):
         """
-- 
2.7.4


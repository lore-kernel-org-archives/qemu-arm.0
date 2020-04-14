Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp5225076lfm;
        Tue, 14 Apr 2020 10:17:05 -0700 (PDT)
X-Google-Smtp-Source: APiQypLtaRGZa9+n9Zdg/w3wNq+vQkXV1AV2hoW2rrI7yl1at4CMxPPk83XehoLbynmH4dxhqyxl
X-Received: by 2002:ac8:5513:: with SMTP id j19mr14138209qtq.319.1586884625740;
        Tue, 14 Apr 2020 10:17:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586884625; cv=none;
        d=google.com; s=arc-20160816;
        b=M1t+qQFxIcSNUP3zI0ecJdbegGZPkZBsvmZZJ1watKZdjqMwz+WG90Em4npccpL0A4
         2FVvXdLb6sI/RVwcmc9af4rT5zn1tneAuve/LTwji1r/oHwgYe/yQIL1hF+GB4wksphh
         sEIZMHvjHEPMhXC1EoPx1x7t63YKN+n5NQtOg41toD/dxp+VXutV+BS5I9K99jyMkViH
         IV2EeZFTck91xjxqJcPDKhOWKaaA0Msz2P72iQ+fgstmaz9AzuvbCw3ozXAU/bPB8UpO
         b423R34fOHnWpkJKdR5E8CuIrBgZ7niXJotGIIhiy01DXgncbzFt2GUINoOXZAQpQyqx
         /thw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=gXNblUO4SiKtKIE29/5D+Fmm4HZBRwhfz9A4bbnSMB4=;
        b=OrThQ/t97+Ko8VyrH4HC1SmfeUXjfors5HQakyr/Ofo1/t6vCNh1kdXkpt6J7gbFKd
         Y87JvSDFCwAT0zeiWhpRMnSvVr7tzaLk8ZdcLVwWc/du2vGyKWEcFUbK23/W6uDyK/Ln
         irGI97OomXo8ZHDHzvrHMHTBrqPc0/LWZrI3HFMtLuJbXedXR5f6RmU62aeZdHP7d9da
         gcsqI4JbW8+HN+yW03SSiBhy5KjBBjsuZHHDpHPGFhD4Vrz4xwJHA0YUyLAlwJcAe/jW
         AFaxfj9dZyZ/5ob3UG8Vtnf6XsPBcMNBHCBSVhFIWoCYycabObMkv8ObfAy4xKO39Vyv
         7+NQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=ihnlJiCa;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x2si7999126qvd.5.2020.04.14.10.17.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Apr 2020 10:17:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=ihnlJiCa;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:35924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jOPBJ-0002bb-6Q
	for alex.bennee@linaro.org; Tue, 14 Apr 2020 13:17:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42074)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <sundeep.lkml@gmail.com>) id 1jOP0e-0006lE-NN
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 13:06:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <sundeep.lkml@gmail.com>) id 1jOP0d-0006JC-DP
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 13:06:04 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:43869)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
 id 1jON5R-0003e7-7n; Tue, 14 Apr 2020 11:02:53 -0400
Received: by mail-pf1-x443.google.com with SMTP id l1so23846pff.10;
 Tue, 14 Apr 2020 08:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gXNblUO4SiKtKIE29/5D+Fmm4HZBRwhfz9A4bbnSMB4=;
 b=ihnlJiCaqcTHchqB2ttsaySfBAA08IHsJ0NEpXxDg2fgeFuRtyoZxzguGPjIxTD9gK
 5unU4FoyTUTNcHcN63ZNFOI0444P4nig/vEjcy+4XHd1Z+/xfkyRGpxzoSCQCjPYYZuW
 fPlW7Mh5ThMIYYVgKmiBHgyloK1q6duvPRraVQNzgkfoJ24WCrL6kuwq6/OncYxgTqPC
 TkUokb43PsZD70pP9QpU/aMm26qsfnkPWO8YT2cqyiWoqfSCieptDBfBRorD0F9W1OgX
 zbJeKHbcFxoBXuOpxPE8AbeN1PTaqfja0rp0PCzhI0aam8PNGC0PwGAIY4Goho/DJiSK
 YVUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gXNblUO4SiKtKIE29/5D+Fmm4HZBRwhfz9A4bbnSMB4=;
 b=k6dy4LOIrV22s6Uqa9tYufnS2zHAAs4AYt8Vx2HKz/VYDR06K/0AQdxpnY6Oss6w70
 QOBZiIeEKK6+9McuY35C+LKk3Uj3DEv31h5/a29kM6nzCLxpquKMmeEvD4xaYfziQZ5/
 SmIlG+s9wCyTtorRVxhPag9bOQBjQTcWYG212vhOR+S4UBOYlYO1mHc0KRRv+80ZmGCf
 7mtMa5TybNbFOqF8wcPdo+h7vmHYBWkF5EGY0DK/4E8e8HJ8VntFeBiSqQLGFm0uOzTQ
 u7sHyCfRX1d1cLz/zXYU3Et1ksMe9vM3xMetDX5FJk0qdN1mOknHfRl2zS2reEePZx5I
 47OQ==
X-Gm-Message-State: AGi0PuZbtaNxBEpjTRLikFrM4p984OS6Cj+2wX90NuK2Xh7LEjQzMg/N
 xnefXVd6Bti0/Amhdj+ghSqChJ7o1/I=
X-Received: by 2002:a65:6805:: with SMTP id l5mr21834666pgt.256.1586876572332; 
 Tue, 14 Apr 2020 08:02:52 -0700 (PDT)
Received: from hyd1358.marvell.com ([115.113.156.2])
 by smtp.googlemail.com with ESMTPSA id f9sm12175240pjt.45.2020.04.14.08.02.49
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 14 Apr 2020 08:02:51 -0700 (PDT)
From: sundeep.lkml@gmail.com
To: jasowang@redhat.com, peter.maydell@linaro.org, philmd@redhat.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: [Qemu devel PATCH v5 3/3] tests/boot_linux_console: Add ethernet test
 to SmartFusion2
Date: Tue, 14 Apr 2020 20:32:31 +0530
Message-Id: <1586876551-3695-4-git-send-email-sundeep.lkml@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586876551-3695-1-git-send-email-sundeep.lkml@gmail.com>
References: <1586876551-3695-1-git-send-email-sundeep.lkml@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
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
X-TUID: 9t2jhIOOTWP2

From: Subbaraya Sundeep <sundeep.lkml@gmail.com>

In addition to simple serial test this patch uses ping
to test the ethernet block modelled in SmartFusion2 SoC.

Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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


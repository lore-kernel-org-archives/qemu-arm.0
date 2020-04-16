Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp1909751lfm;
        Thu, 16 Apr 2020 07:56:58 -0700 (PDT)
X-Google-Smtp-Source: APiQypLQ01IuHOaIQUh0aQ28nnUZURJigBiJUogmvJje687KP1z+AG6tli10B9ekI27RGxvh7tSl
X-Received: by 2002:ac8:480e:: with SMTP id g14mr24974138qtq.333.1587049017967;
        Thu, 16 Apr 2020 07:56:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587049017; cv=none;
        d=google.com; s=arc-20160816;
        b=s333Bq95Dsu0k8F4k6BAi2EK4waSDveUR5eEs8gyUn3fIjA8S+qsmXN8iv0VWfm69t
         iILHcB3TmrbYLXALaP3F1VUB38V0CnXLipBAPQIz5ACvRF9r5mPspnzlfhwrcw2Kob/6
         e5e59EaY+6Kly4sOJYyYaoyWsoyl1mfKf3/aCjKRGB+rM6RhtK6/t48h3amDZDkaMd5w
         pm1DPiXB5j+jlw2m/xP9uXqiOLsWLxsFd0eQw2YD/+qKNVHRDnCcxuo0+S82EjbBZMqF
         18wlzZY5nUxuKZQuNyi+RWzuyg8DvC2tYgLP6g1uUPrhp8GjppEyOx/gc69lO0sOMalk
         3s0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=gXNblUO4SiKtKIE29/5D+Fmm4HZBRwhfz9A4bbnSMB4=;
        b=UtGMMTJKCjF4kv5o6yNW1YFbsyKJDX4A/Ds5zMFuI3s82lpRXFzs6sKT7gG1aKdd3O
         EAI33lRELklc5BbvV5pl+6qPOHKsF38KJFrY6bOLtlLd3NjU8mXP2ToYXgdQ6Y6xIYFK
         wqVShgn8c/xByI5jYxtRxKbC1LEuVXLPyhhToU2aETXXF/u+wesZnENAN6h5xnCRwtn5
         Ketk3YxBAKDvhywM4t7QOp2cB56hi8i8+eisLVHGLBu1UZcvw0EheAEml1HcuTcH43iH
         YDkbuHyqVFP9UzS4RpNZGnrxm+JMGBTuhUdrhL3Enpb0QWdhjFvQKUXtHWodQiF376k3
         3PTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=GxS235H1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k10si7395995qkh.313.2020.04.16.07.56.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Apr 2020 07:56:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=GxS235H1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:35530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jP5wn-0004Pt-BS
	for alex.bennee@linaro.org; Thu, 16 Apr 2020 10:56:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46248)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <sundeep.lkml@gmail.com>) id 1jP5v9-0002WS-KW
 for qemu-devel@nongnu.org; Thu, 16 Apr 2020 10:55:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <sundeep.lkml@gmail.com>) id 1jP5v8-0005Yx-G9
 for qemu-devel@nongnu.org; Thu, 16 Apr 2020 10:55:15 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:45307)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
 id 1jP5v8-0005Ym-AN; Thu, 16 Apr 2020 10:55:14 -0400
Received: by mail-pl1-x642.google.com with SMTP id t4so1429833plq.12;
 Thu, 16 Apr 2020 07:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gXNblUO4SiKtKIE29/5D+Fmm4HZBRwhfz9A4bbnSMB4=;
 b=GxS235H1iUMxWW4h9nKIN9JA12k1F2bLXo/mfe0qriugoyPBVvwAsQn23g/RYfMRgH
 1Ar+DzwGMPWipFUXB/wD60Wj114A1jc2ODSCHVOFaDf8s9s2pQbMiAangsaVDeDnydf6
 gEmEoGjbjNKmL9uyN0CYNX6bKBUM58OUZq1Qng65yB+5BFKQ+ujW4uzWSRUwuH8GENBz
 FEY/TkYWQRp2zrmxbeRLy5ySjeJDg7JQFq6PWyKURvqo+m50a+oHhtbcBZeisRht+PJf
 eN2IPyTkvSd2CIs2biGYRIavbRVfgdjv/CpdWwu563h+FHKkolfz3DeNhPCzJZQW/I0+
 wI2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gXNblUO4SiKtKIE29/5D+Fmm4HZBRwhfz9A4bbnSMB4=;
 b=hMVkAPgNWpaDKOWWautXw9LeXVTDcVoVZXoGopDyHxHVxFndBo204XxTa6TdzacI1J
 CCX/iuAVCX98atyTaAo0TzERUIzIUS/kr4EEn0Da73Zpa/RJ7QtPC09vlCPgXkN6PveR
 xS8DQyUILq98FmsjNyKqWyIDgIJK1tTqCcGizIqgyf2XEUVIDshbYvFmk1MO6medxmTg
 MBw8fuKnnjj29pSnENCdJeLwybfLh+Xs0oxcE3j681Dbb4VOA7IeuetIphzq8hK7TwZx
 nvRzXUwfJrWfCixx5Zz0xHi/PePOGp5d/iZcGemcRv8vVh0TeVq7YuIw7tjYr/kyAUL+
 EJRg==
X-Gm-Message-State: AGi0PuZmxS9xmGf7kx1Esp7PEEpWv7sllgw0f41l8t6YdVAgwZyd29Bz
 fx1LjWBlDGEl7Ojgqp3pgd//mpJ6Ug0=
X-Received: by 2002:a17:90b:97:: with SMTP id
 bb23mr5427950pjb.59.1587048913432; 
 Thu, 16 Apr 2020 07:55:13 -0700 (PDT)
Received: from hyd1358.marvell.com ([115.113.156.2])
 by smtp.googlemail.com with ESMTPSA id s63sm3671973pfb.44.2020.04.16.07.55.11
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 16 Apr 2020 07:55:13 -0700 (PDT)
From: sundeep.lkml@gmail.com
To: jasowang@redhat.com, peter.maydell@linaro.org, philmd@redhat.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: [Qemu devel PATCH v6 3/3] tests/boot_linux_console: Add ethernet test
 to SmartFusion2
Date: Thu, 16 Apr 2020 20:24:51 +0530
Message-Id: <1587048891-30493-4-git-send-email-sundeep.lkml@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1587048891-30493-1-git-send-email-sundeep.lkml@gmail.com>
References: <1587048891-30493-1-git-send-email-sundeep.lkml@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::642
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
X-TUID: aTzplBFnx3AI

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


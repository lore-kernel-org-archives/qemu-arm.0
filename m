Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp827223lfp;
        Wed, 5 Feb 2020 17:37:57 -0800 (PST)
X-Google-Smtp-Source: APXvYqw9K6mFwtlkT0Kvr5QDTcXZbEL3RopwgJdiVPK+0rQo2dtlXlz299RanUwgqSqiCqlhqhN4
X-Received: by 2002:aed:3f77:: with SMTP id q52mr605799qtf.248.1580953076848;
        Wed, 05 Feb 2020 17:37:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580953076; cv=none;
        d=google.com; s=arc-20160816;
        b=Sp+qBv1kQnmVBeyZ56KzbeSxrHuVwsh696Fv2nE9+h6DMMCz8ZtwItUd8ejlJz1xqS
         bU2eqy4DbE+ZOSYa9bcx3NFdF8fwUcZXoqQEhJhMPgZ1Tx/NV9arSmXi/Qtx6peRWOd9
         N9A5oXAgjpjYHvKpJYpijRE7e3J3PVXL6qXkukEUuiYzZBfQniPm21El9E1g65/esl1R
         3edQSC53IbQjfm3TnA85cRFsuS3Af93EDfDBQMb7m3i618fYjWyYlVoYtSNyQ0iqdpOp
         ZHviuG3Ezg2GR1uwotlZlQ3o23pS5zsJpzSD3Tas5Ewyg/o0Tt6ATWqdExW24aSbaOik
         k1zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=yUSBUp9gdan6yP5vOjp1HSLcVgTCg5pBVo6PRPW8Pj0=;
        b=nucCwhIzLGAcNHMS8xhX+aXiQYVBEZQQ5090v6N6O9NqHaaMfw/UMYvsUT0b1xMXGC
         e8JATj82H43001+RZkGxC56TO7bomBSlg5Tq2n0Z2okU5ebD9E2YLfi++kMykelMoWPF
         24RDovESccq1JlBoy9LJc4Bf7KPOUnixIHCnVUdNoetcs9X9EBE+XDj8rWxAEYq6YWDH
         PDpjAk63pr13SIkFMcK7wJsE02Led0WysLyexdFGWo8AVTjOMv/dMVbItrFAKuZvVUEe
         xFPdbgyHC55ScQNhk6LxP0IQm5Qt/rDRydr9sxDQT4lqLj8FG4nS2r7NG4IBRNU+bJa9
         js0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=g2E12OKa;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h5si772870qkl.356.2020.02.05.17.37.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Feb 2020 17:37:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=g2E12OKa;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:59458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1izW79-0001oM-8y
	for alex.bennee@linaro.org; Wed, 05 Feb 2020 20:37:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54414)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1izVof-0001Ea-I1
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 20:18:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1izVod-0004Dp-7L
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 20:18:49 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:38252)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1izVod-00049t-0b; Wed, 05 Feb 2020 20:18:47 -0500
Received: by mail-wr1-x42f.google.com with SMTP id y17so5137540wrh.5;
 Wed, 05 Feb 2020 17:18:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yUSBUp9gdan6yP5vOjp1HSLcVgTCg5pBVo6PRPW8Pj0=;
 b=g2E12OKam7A8Mb9Y1AW9/62RhZ4sGt2ctKZdAyLuBT8yU+eB4qDZ++cb5UrtYprsrd
 HTKDsTuEa98f72e1fonm6ybRdVYg2tjWjwsSC0WKDyP9eZ4WWJeNf3AlktPVCOlP8Qyv
 uL0o2vDIJZP6G+ywreBoM0eyk6NeSsO2w12lKBzMqvwB3as50OSc9Ik+G8m/ptNj6qb7
 hVkluHGGcOv+6DJqAC5UpLmoJlqmEvD9Co7OJJY4oLYBrpNJUCPOuB7Zu148Mja9ov3+
 WlQZPagvGHPgmWO6iI+XhQWw7jW+PLQrPWcf52yjvgJlcvYG6Ou7s+XWBIUdxNpUT24j
 N6Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=yUSBUp9gdan6yP5vOjp1HSLcVgTCg5pBVo6PRPW8Pj0=;
 b=MlQqq0pxVGmdhnduSbZ4BVBsvq3guIxgm8N1XqB3Sf6tapz2m7xNUCrOwy5e2W+a/K
 QKeyuRtYpKRItQ3DXgFEJOeRKOKcqoRzS2IFGHmkMaifNyaUlO32oSN4KscipGvhgLWW
 rkgdnQP/Bpw6/OzMuVSCXjqk5b6TuDNP4ZaXhQJSqYvBahtFQiuxgqrasL6N5oCMKkG7
 ClqaX6zMnODO8/2oCFvSQvCAs8W4+aLdyOHLK1CrKIvl4gKoJk831nfl/QrEw1CNZI7W
 WQfe1GqBfwRWjo1yHfN58OKI+lSmSCkBZeTDdMKkWg3ExHBe7X0+TDF+TYXIPXOoyyfT
 PW/g==
X-Gm-Message-State: APjAAAWVfiGMlxgi+cXfSuzgbJ4gMrIFu+26ap8lBO3glEeRkCAqz4+Y
 ZBJeqYEdF+CY67ZpCQ5e+dLCQQ6Y
X-Received: by 2002:a5d:6191:: with SMTP id j17mr296382wru.427.1580951925784; 
 Wed, 05 Feb 2020 17:18:45 -0800 (PST)
Received: from localhost.localdomain (2.red-95-127-156.staticip.rima-tde.net.
 [95.127.156.2])
 by smtp.gmail.com with ESMTPSA id w13sm2053526wru.38.2020.02.05.17.18.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Feb 2020 17:18:45 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 22/30] tests/acceptance/boot_linux_console: Use raspi
 console model as key
Date: Thu,  6 Feb 2020 02:17:48 +0100
Message-Id: <20200206011756.2413-23-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200206011756.2413-1-f4bug@amsat.org>
References: <20200206011756.2413-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::42f
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
X-TUID: QIT754LbiNB4

Python dictionary are not that expensive. Use a key makes the
code easier to review.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/acceptance/boot_linux_console.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index e40b84651b..5fba46a9d1 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -325,14 +325,14 @@ class BootLinuxConsole(Test):
         self.vm.launch()
         self.wait_for_console_pattern('init started: BusyBox')
 
-    def do_test_arm_raspi2(self, uart_id):
+    def do_test_arm_raspi2(self, uart_model):
         """
         The kernel can be rebuilt using the kernel source referenced
         and following the instructions on the on:
         https://www.raspberrypi.org/documentation/linux/kernel/building.md
         """
         serial_kernel_cmdline = {
-            0: 'earlycon=pl011,0x3f201000 console=ttyAMA0',
+            'pl011': 'earlycon=pl011,0x3f201000 console=ttyAMA0',
         }
         deb_url = ('http://archive.raspberrypi.org/debian/'
                    'pool/main/r/raspberrypi-firmware/'
@@ -344,7 +344,7 @@ class BootLinuxConsole(Test):
 
         self.vm.set_console()
         kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
-                               serial_kernel_cmdline[uart_id])
+                               serial_kernel_cmdline[uart_model])
         self.vm.add_args('-kernel', kernel_path,
                          '-dtb', dtb_path,
                          '-append', kernel_command_line)
@@ -358,7 +358,7 @@ class BootLinuxConsole(Test):
         :avocado: tags=machine:raspi2
         :avocado: tags=device:pl011
         """
-        self.do_test_arm_raspi2(0)
+        self.do_test_arm_raspi2('pl011')
 
     def test_arm_exynos4210_initrd(self):
         """
-- 
2.21.1


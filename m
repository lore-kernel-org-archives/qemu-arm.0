Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B63D8C53200
	for <qemu-arm@archiver.kernel.org>; Wed, 29 Jul 2026 15:40:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wp6Oh-0006Ba-8U; Wed, 29 Jul 2026 11:40:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1wp6Of-0006B2-N9
 for qemu-arm@nongnu.org; Wed, 29 Jul 2026 11:40:41 -0400
Received: from mail-wr1-f48.google.com ([209.85.221.48])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1wp6Oe-0001wR-8W
 for qemu-arm@nongnu.org; Wed, 29 Jul 2026 11:40:41 -0400
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-47640541585so868908f8f.1
 for <qemu-arm@nongnu.org>; Wed, 29 Jul 2026 08:40:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785339639; x=1785944439;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=T3QJvSJZGpsccP9EvkOCqQcE/jNtNeeQY/Ifg8+pe0I=;
 b=Ivt3mlF3WiL896OAyHwiPltN1jwAi0wBfNzicU4u83R1A+4MCMIUlwFJR+v/IH0hEz
 Xct+WMmpBvaaSzGRbqXxURmqTTzjY26KCyBE9bc/K7pzW5iZ5v+sc2adsUK9mmz/BPcI
 nUP0M7Rk+LJLEbJjbvJZ0oYkjh7uqI/LSnlBCzsDl7E99GyMk5E2pzt2dgYSmdTTRcX8
 ZEfR2JOkZsKlhm0AUg6wOKU8tIKJgzf/Hp2bMbMaX3dRSfMoKBTfAEn4XedE2JZbhj/l
 4aaNt/+B4l/PN3Mg6fDPt0/a8Clqm9LnTOxWZi9kdKui4sEeOIMRi8bFdm4P68ZkDWQk
 Fv/g==
X-Forwarded-Encrypted: i=1;
 AHgh+Ro/PcQsm9UKKl3KS8d+nUI+2G3wpVbSTxm3AuOruQUUGwqSyqBHVmNqmCjMlWy+JfuZmvgjJGG5ig==@nongnu.org
X-Gm-Message-State: AOJu0YxsWJGT4Or4hQ07eNMEtNS2L9fG/FwN57p/1BfuY2E8TSW/Yqb/
 MQr5/DVB9AGRfZy7KBbeIbt3nupQ0xHaDC0knMOds80HTvnVKI7XdJ92
X-Gm-Gg: AR+sD11oS3AEpgVdhZIEZbZ1qRUvYb7WLi1dHX3XuR5MXaJZFwoJ40ZIZd6cUAFpvO9
 H4c5PYFXIYzvUUPJ6YlDoG+Qy7DzGTwmjUTy2x1Rc+ZUJxUtmSTZLwiIhkCyLlH38uXClod79Pk
 4LXJri+qwxxYubDbxyaXPGPa6LTJq+QPD4cfYelUTcdnZHBKHGtVFOCyNZebFjbclW5dNuoVgn0
 YdlSTjB8iZpNlCtCwePo8cZGEqeyu1fMiYnLC8aIj2GY0O5xvz7AxeTLQmP28k13DKY30U8Hp3/
 Y5XB0kvcYYFNMh+BFTmcdMRna0YQbiOc7R49Oo8WPE234wwfetANE3QqbT1rVNn9ScMmwqDgjvN
 TVUyto10kTH6Cu0y8yEZ6+rShy8OPOYYZwvEnnlR3YVyaOIq1fYaESOh6tJoeevQW02Pqr1PLri
 pbP9SfHES2rPtZ1xe1F4EV58tFfei1kZmbI1czL396wvEfBUcz52M1wRu2UijFSD340yP/Mr7D+
 XNLxd4TRT2IQzbS/MKv+Sp25k54JxwiKJlp
X-Received: by 2002:a05:6000:1787:b0:47f:5371:1b15 with SMTP id
 ffacd0b85a97d-47fb1ee2366mr8768400f8f.26.1785339638711; 
 Wed, 29 Jul 2026 08:40:38 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fb647a8d4sm9038598f8f.0.2026.07.29.08.40.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jul 2026 08:40:38 -0700 (PDT)
Date: Wed, 29 Jul 2026 17:12:52 +0200
Subject: [PATCH 16/25] tests/functional: aspeed: optionally check the
 device tree model on boot
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-sanmiguel-bmc-locator-v1-16-c8f9a8d101f6@free.fr>
References: <20260729-sanmiguel-bmc-locator-v1-0-c8f9a8d101f6@free.fr>
In-Reply-To: <20260729-sanmiguel-bmc-locator-v1-0-c8f9a8d101f6@free.fr>
To: qemu-devel@nongnu.org
Cc: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>, 
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 qemu-arm@nongnu.org, Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Thomas Huth <th.huth+qemu@posteo.eu>, 
 =?utf-8?q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Emmanuel Blot <eblot@meta.com>, Emmanuel Blot <emmanuel.blot@free.fr>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785337964; l=1664;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=cY6O6mrVrai7NMYpMfMfQOtbJnyb/EZq8fgGv1TgVEA=;
 b=AQ838ecWOWwFlpkOwwRhntcyWOI8dzW7kvtPnC3tGjFbVBZtLn17rgPtFJ1xHgzM538PwMyl6
 BrrNfBaCySPCA6QAwmenQtUOHlmRsrLclEX5O3GhdNCEWK22+y8Xssl
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.221.48; envelope-from=eblot.ml@gmail.com;
 helo=mail-wr1-f48.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-to:  Emmanuel Blot <emmanuel.blot@free.fr>
From:  Emmanuel Blot via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Add an optional 'dt_model' argument to do_test_arm_aspeed_openbmc().
When
provided, the helper also waits for the kernel's "Machine model: ..."
line,
letting a test confirm the booted image actually matches the expected
board
device tree rather than only the SoC revision.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 tests/functional/aspeed.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/functional/aspeed.py b/tests/functional/aspeed.py
index 076da1036c..08af6b4839 100644
--- a/tests/functional/aspeed.py
+++ b/tests/functional/aspeed.py
@@ -8,7 +8,8 @@
 class AspeedTest(LinuxKernelTest):
 
     def do_test_arm_aspeed_openbmc(self, machine, image, uboot='2019.04',
-                                   cpu_id='0x0', soc='AST2500 rev A1'):
+                                   cpu_id='0x0', soc='AST2500 rev A1',
+                                   dt_model=None):
         self.set_machine(machine)
         self.vm.set_console()
         self.vm.add_args('-drive', f'file={image},if=mtd,format=raw',
@@ -19,6 +20,8 @@ def do_test_arm_aspeed_openbmc(self, machine, image, uboot='2019.04',
         self.wait_for_console_pattern('## Loading kernel from FIT Image')
         self.wait_for_console_pattern('Starting kernel ...')
         self.wait_for_console_pattern(f'Booting Linux on physical CPU {cpu_id}')
+        if dt_model:
+            self.wait_for_console_pattern(f'Machine model: {dt_model}')
         self.wait_for_console_pattern(f'ASPEED {soc}')
         self.wait_for_console_pattern('/init as init process')
         self.wait_for_boot_complete()

-- 
2.50.1



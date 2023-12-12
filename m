Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp1024833ejo;
        Tue, 12 Dec 2023 08:30:26 -0800 (PST)
X-Received: by 2002:a05:6512:4017:b0:50e:d5f:2c9a with SMTP id br23-20020a056512401700b0050e0d5f2c9amr107667lfb.25.1702398625782;
        Tue, 12 Dec 2023 08:30:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702398625; cv=none;
        d=google.com; s=arc-20160816;
        b=SvFDNcKaL0/oCrtQX6kZVkAZ/psqjkphBgF7HCnS+NXT9Dxz/4lVq926YM+SbSf9KE
         TXViQVQvforB/XQ6eNcro8Lh4Gzfp9Sd3WTSzGLGrwmlNpSUVjCId59qS5ZazlvXeCAu
         wJhrWkEGNUFj3rFvC3r7dQCmy/sAj9bWthipS6D+BY3U025nlJIlW/GBg+8MvQ8MxoR5
         iC/5XAOln4OddF3+pKOt8JgUoENqrS6SwRrY6Hg3umqB0FuLveY5gip0BmPyd95o/DQT
         bmvzralMaoxQZlq6Nbe0uaUNMr7rgZQ4MzfTWyfOw8TOmShIGDNwzP3BRM2fHZjhrbt4
         3tSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=SnL91noqzEJ/OmxDVsmRBFeCwxiwF12rVXOPGYxs90k=;
        fh=CkupYgn1Qmdh7jizui9HJgGegpqbRR5NXz1VyjRE1Hs=;
        b=ot0NTxu8+u4UYkd70nr3mekBg9i73Il2EiOUbBeRBik5WJNsh5rCYmg0pUcLK1UrbO
         wMy8jhKPqXSaKgQsqn3y+Ma3EQQ/Fjyko+j9plUxB1gfuJ4/Um7Rf2lqS8JX/owMK+za
         atytZhYSkK3UBWqV/qMZWI9CF8aUsx7FsvS27VWzdegc7MKMfcIm55MVWexqPDbbNmG+
         PeH++fgEkXlqbZLPUiSETtVqUUnMLSHeSRuxueexvK07iEDp1fTncaZyv5bKOGKQhDIm
         Nbh9Jaec+DL+6K08PYw/c8Q8wX3o9SHF0p4y/Q594QviabYqWdBugYk1LkezrFc7FZ5l
         cqVw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=P3+kURlx;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id em4-20020a170907288400b00a1f7a9f5541sor2036253ejc.13.2023.12.12.08.30.25
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 12 Dec 2023 08:30:25 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=P3+kURlx;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702398625; x=1703003425; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SnL91noqzEJ/OmxDVsmRBFeCwxiwF12rVXOPGYxs90k=;
        b=P3+kURlx7LnSUp1drPeGTYvMX46vobBG5ZP8Y08w+jcZn6eVrkXDpH6yxd6oOv1h4V
         +PYhmfBlqhoodT+ayeFBdcnkFKPXroSsvo44ZVs50jMcNV+QpUnH0/IWbm/v0f+7xjbb
         +Ro31Dqa+8Xb0e7HXVl0lUvXgviiHmWPnQGYYhy6IFcQS1BDm4MJ3jIp1k9HfBsbblhi
         EEGmrbEKHOyu0+cMdMtdO6ap1TNpzYUDBwq+CHEaqYtoKh/LdQqYkTl19o45+7q1FOIg
         QTLvRagpL7ynkTewEIsGSwrhQ2Ba3Ooi81E6M4/dH7MANrjGQovE0AqIFhoNseVwsgb6
         rJuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702398625; x=1703003425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SnL91noqzEJ/OmxDVsmRBFeCwxiwF12rVXOPGYxs90k=;
        b=syHcuETM7rm3i1k9PK+XEUxQrrz4gqlWcE32lnA7GP61OF7TDh7k6rAjWHKsQVqGLd
         FRCKuCERJxhET2WEXYOVBYABG9kAIdBHcSUIe7BsLh/c6LUpvR6383Fd4hdnDFKGacOX
         k/Ww8+6f6jLtL2qJWTJWVwVerPWvLSXO9BWoSgTJ7K1Sp06PVbMSMu25b1AaEdR1Y5qf
         lSHM+LX4n0FsImlrX0ZByS7cv4yW+dckJkhz7cS0VPX9kXiMMYOhza63TXoq2AJVdRhs
         Rpp08UQiFgw4yJYFcJweSKko687ljGYOSG2pukymOyhB4StYGTUGrNAeeTy2jSBuI9Rb
         C2xw==
X-Gm-Message-State: AOJu0YwWNJNuSK4v9A2XottTs8GAbdKpk4vW/zPpTG1OoPGhYMrdvWIR
	Zt/9JVwuZxiO7HHPC2Hf9p7p4Ukr
X-Google-Smtp-Source: AGHT+IHQSSAkWJvD36OnpNHlgnVYT2/cx6Tc6mY+U7cxpo8QxzPJuYkHa87vpl7b8J0ljfokve6hig==
X-Received: by 2002:a17:907:7f87:b0:a17:8181:4f3 with SMTP id qk7-20020a1709077f8700b00a17818104f3mr3873447ejc.49.1702398625485;
        Tue, 12 Dec 2023 08:30:25 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.175.193])
        by smtp.gmail.com with ESMTPSA id ll5-20020a170907190500b00a1c99f67834sm6480179ejc.70.2023.12.12.08.30.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 12 Dec 2023 08:30:25 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Tyrone Ting <kfting@nuvoton.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Joel Stanley <joel@jms.id.au>,
	Alistair Francis <alistair@alistair23.me>,
	Anton Johansson <anjo@rev.ng>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Hao Wu <wuhaotsh@google.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Rob Herring <robh@kernel.org>,
	qemu-arm@nongnu.org,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 06/33] hw/cpu/arm: Rename 'busdev' -> 'gicsbd' in a15mp_priv_realize()
Date: Tue, 12 Dec 2023 17:29:06 +0100
Message-ID: <20231212162935.42910-7-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231212162935.42910-1-philmd@linaro.org>
References: <20231212162935.42910-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: QoboZByGqx6R

'busdev' is the internal GIC as SysBus device.
Since we already have a 'gicdev' variable for the GIC as QDev,
rename 'busdev' as 'gicsbd' to make it clear we access the IRQ
lines from the GIC.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/cpu/a15mpcore.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/hw/cpu/a15mpcore.c b/hw/cpu/a15mpcore.c
index bfd8aa5644..a40f142128 100644
--- a/hw/cpu/a15mpcore.c
+++ b/hw/cpu/a15mpcore.c
@@ -51,7 +51,7 @@ static void a15mp_priv_realize(DeviceState *dev, Error **errp)
     SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
     A15MPPrivState *s = A15MPCORE_PRIV(dev);
     DeviceState *gicdev;
-    SysBusDevice *busdev;
+    SysBusDevice *gicsbd;
     int i;
     bool has_el3;
     bool has_el2 = false;
@@ -78,10 +78,10 @@ static void a15mp_priv_realize(DeviceState *dev, Error **errp)
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->gic), errp)) {
         return;
     }
-    busdev = SYS_BUS_DEVICE(&s->gic);
+    gicsbd = SYS_BUS_DEVICE(&s->gic);
 
     /* Pass through outbound IRQ lines from the GIC */
-    sysbus_pass_irq(sbd, busdev);
+    sysbus_pass_irq(sbd, gicsbd);
 
     /* Pass through inbound GPIO lines to the GIC */
     qdev_init_gpio_in(dev, a15mp_priv_set_irq, s->num_irq - 32);
@@ -126,17 +126,17 @@ static void a15mp_priv_realize(DeviceState *dev, Error **errp)
      *  0x6000-0x7fff -- GIC virtual CPU interface
      */
     memory_region_add_subregion(&s->container, 0x1000,
-                                sysbus_mmio_get_region(busdev, 0));
+                                sysbus_mmio_get_region(gicsbd, 0));
     memory_region_add_subregion(&s->container, 0x2000,
-                                sysbus_mmio_get_region(busdev, 1));
+                                sysbus_mmio_get_region(gicsbd, 1));
     if (has_el2) {
         memory_region_add_subregion(&s->container, 0x4000,
-                                    sysbus_mmio_get_region(busdev, 2));
+                                    sysbus_mmio_get_region(gicsbd, 2));
         memory_region_add_subregion(&s->container, 0x6000,
-                                    sysbus_mmio_get_region(busdev, 3));
+                                    sysbus_mmio_get_region(gicsbd, 3));
         for (i = 0; i < s->num_cpu; i++) {
             hwaddr base = 0x5000 + i * 0x200;
-            MemoryRegion *mr = sysbus_mmio_get_region(busdev,
+            MemoryRegion *mr = sysbus_mmio_get_region(gicsbd,
                                                       4 + s->num_cpu + i);
             memory_region_add_subregion(&s->container, base, mr);
         }
-- 
2.41.0

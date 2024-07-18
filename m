Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp1260490njk;
        Wed, 17 Jul 2024 23:51:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWrp/8I4fuwUd4SiTMoibPfV8TEVdBm7SwnoP9eCU9zyzxKpT/DKKIpFGs+4EBhSATxpgQhlTfrtNxXXSN9cjviYpaQkN6P
X-Google-Smtp-Source: AGHT+IEvzDTY+PiQU2qC28vR7NJWt90F2L5PW3Q8/X1kFcKZXmIHqkKq/Wl8ltBDx6ncBemEVrpx
X-Received: by 2002:a05:6214:23cb:b0:6b5:2655:4518 with SMTP id 6a1803df08f44-6b78ca82e9fmr49538076d6.20.1721285463085;
        Wed, 17 Jul 2024 23:51:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721285463; cv=none;
        d=google.com; s=arc-20160816;
        b=itS5a2ROIDl5axV1opu2SkNL0CLQF4nNv6fAu5ony1kDp9kUgM8wPJ2zzCyeu+7Atf
         4gHNkn8WNYsWPKTz/TbBVQrK5plW1a5qyob8NK2pdEPEwF7pvqh8FOnnFCrpn6Fw+N43
         Y4gNsCvdjOe4uSat1l+OL/KXSNr9ffnOT1AerO7YmRC4F4EFupw5eiTyDdezLqtx1Q8v
         wbDk08HUon6I9euQsn4qvVpwtkFnyp0X4BFmpdUqKrgpfl7F+Iq9bj38Bta95nMsjfsq
         Y6ei3cEafT9+w/Mtvu7NDUUiEcelY36fuRQkOIGyTTXKjiVeIVTEob/ZFwr/DEGLY69r
         vkuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=uxJL4ZoVwad/dtUO0do/eGhZDvGFn2Men/N2dee5yWA=;
        fh=Ph+R0NNHAlT66tvNC78JUFsmAbXddKrwk994XbgsRkc=;
        b=atKaE30uvxCQEL3X/jQuuQa3IdEN1ESQasqi2uHV++FBIdTXQjwC7QFTW1oxRTa0MW
         oBKuhTdUdm+U3/sNGgaqT7fVCJopH1988m3ptY5S15tYmPaf2ZkyyvAKZe/vokb6KSLa
         4w66aMKhFy+uYMtjOMas6S/ggEmUMwXNQDBXQ/cpJkJVEmvqBM4jmXt8d9kHF397PII4
         dm5BIl5juuuVu5do5tzRMSqRsRk/D520pmXn98DN7q1l4wuYIHhEAahT+OWhFcF33r/6
         yBt4+VRuTQH5MRAr3OSHOfxkOo+4sFiQ43sjifJ3fHngx1DqwxMX2KerYx6zhusHQJbm
         hp/w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b7a2f2189dsi1505086d6.324.2024.07.17.23.51.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jul 2024 23:51:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sUKy9-00059u-12; Thu, 18 Jul 2024 02:50:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sUKy7-00053E-9I; Thu, 18 Jul 2024 02:50:23 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sUKy5-0004L5-Q1; Thu, 18 Jul 2024 02:50:23 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 18 Jul
 2024 14:50:15 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 18 Jul 2024 14:50:15 +0800
To: Alistair Francis <alistair@alistair23.me>, Peter Maydell
 <peter.maydell@linaro.org>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?=
 <clg@kaod.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:STM32F205" <qemu-arm@nongnu.org>, "open
 list:All patches CC here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v1 02/15] aspeed/soc: support ADC for AST2700
Date: Thu, 18 Jul 2024 14:49:12 +0800
Message-ID: <20240718064925.1846074-3-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240718064925.1846074-1-jamin_lin@aspeedtech.com>
References: <20240718064925.1846074-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_FAIL=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: oLEWbX25M1nx

Add ADC model for AST2700 ADC support.
The ADC controller registers base address is start at
0x14C0_0000 and its address space is 0x1000.
The ADC controller interrupt is connected to
GICINT130_INTC group at bit 16. The GIC IRQ is 130.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/arm/aspeed_ast27x0.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
index a9fb0d4b88..4257b5e8af 100644
--- a/hw/arm/aspeed_ast27x0.c
+++ b/hw/arm/aspeed_ast27x0.c
@@ -60,6 +60,7 @@ static const hwaddr aspeed_soc_ast2700_memmap[] = {
     [ASPEED_DEV_SLIIO]     =  0x14C1E000,
     [ASPEED_GIC_DIST]      =  0x12200000,
     [ASPEED_GIC_REDIST]    =  0x12280000,
+    [ASPEED_DEV_ADC]       =  0x14C00000,
 };
 
 #define AST2700_MAX_IRQ 288
@@ -344,6 +345,9 @@ static void aspeed_soc_ast2700_init(Object *obj)
     object_initialize_child(obj, "sli", &s->sli, TYPE_ASPEED_2700_SLI);
     object_initialize_child(obj, "sliio", &s->sliio, TYPE_ASPEED_2700_SLIIO);
     object_initialize_child(obj, "intc", &a->intc, TYPE_ASPEED_2700_INTC);
+
+    snprintf(typename, sizeof(typename), "aspeed.adc-%s", socname);
+    object_initialize_child(obj, "adc", &s->adc, typename);
 }
 
 /*
@@ -601,6 +605,14 @@ static void aspeed_soc_ast2700_realize(DeviceState *dev, Error **errp)
     aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->sliio), 0,
                     sc->memmap[ASPEED_DEV_SLIIO]);
 
+    /* ADC */
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->adc), errp)) {
+        return;
+    }
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->adc), 0, sc->memmap[ASPEED_DEV_ADC]);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->adc), 0,
+                       aspeed_soc_get_irq(s, ASPEED_DEV_ADC));
+
     create_unimplemented_device("ast2700.dpmcu", 0x11000000, 0x40000);
     create_unimplemented_device("ast2700.iomem0", 0x12000000, 0x01000000);
     create_unimplemented_device("ast2700.iomem1", 0x14000000, 0x01000000);
-- 
2.34.1


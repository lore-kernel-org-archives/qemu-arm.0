Received: by 2002:a17:504:4644:b0:1be9:327d:8ee3 with SMTP id d4csp242060njg;
        Tue, 25 Feb 2025 06:15:24 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXVT6xOhzEEvZUwLTFEpLuwxa01fTabdOXA7RASJJ/aZIVO7ZcQLB2WMDBPIqBwpNJ0/FY1YjtmMqvq/g==@linaro.org
X-Google-Smtp-Source: AGHT+IHAo41G4v2W+GMt2vdP0zXrXl35q4rCR5ZRBERGxl4/X5LksuP2P08szKQo1OOHg1BpQX12
X-Received: by 2002:ac8:5941:0:b0:472:538:b789 with SMTP id d75a77b69052e-472228c3007mr299791531cf.13.1740492924679;
        Tue, 25 Feb 2025 06:15:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740492924; cv=none;
        d=google.com; s=arc-20240605;
        b=Hf2Jfw9wXsEltVsm2u7mS0C64dSjTivkEeoB37yESnUVW+3zx8PKLQE0xTh8tAa/Zq
         O4tpXtt1/Ufnmv1wHEwSCNAu9R4ulRkFzEuiXJ+RVlMv5/hvnAfGxGL4cp6DnGgUrw2J
         9NZEuQ2i9TZZ0aUexFANCQPPYt7k1wgHx/kOvONiRbMpgP6olnN2QLQJjyAR954nyxcJ
         1VM9FuNbUI9nhj4mnRlrFDW2p+2sIU1RWFbkBou7EpSVglDcEmw4Yj33GP+kJxYAWuYC
         a/Mc/xwK/X+/HCx4r5F5T3Q2MPZT7AZiMQeYs5dbSB40IMiPkWz/5zwn+qehwjJBv9ae
         dHjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to;
        bh=ro8LQvkfepmGx5+eQpyKShV7qklHfVpBj8B7v9hiAEs=;
        fh=5JL7mqVb0xJPQxAe5ZtlV0oPd81juhKpcMs9GAwoilE=;
        b=WnA+KZUtWUKVBLg/09ZL67FUTAr6czbS4DAKHz0Vu6zXJk4He4rBreMpsWXeDjTxEK
         miBvAv7g1Caf3fGfvXs6HfeM+2ecHrm64z1JyAyUYqeJHWQKTAz1luAu9qd2y8RK5FxN
         BOvqKRGNB8jzKjIU5ANZpFurOME+5knmE0edQcRdwIfzGRX5m/uDX+92moZxWiDDzQS8
         FlEaXUSyodb/sZPZmIpMFmStDufrCtoLme+nc2LvO3PcIe0oVDM/fbShBJX3qNeB6hGw
         nd4bQgSAUXPrG36921n0FGE7Iu5x6xI1T8FxWon3afj2lpu3URl/iFf7u4tNS3Spvxjo
         mKlw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47377e1d06bsi16663011cf.43.2025.02.25.06.15.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Feb 2025 06:15:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tmviE-0007Ct-DE; Tue, 25 Feb 2025 09:15:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cy_liu@aspeedtech.com>)
 id 1tmpWw-0006cE-M4; Tue, 25 Feb 2025 02:39:02 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cy_liu@aspeedtech.com>)
 id 1tmpWv-0008HP-2t; Tue, 25 Feb 2025 02:39:02 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 25 Feb
 2025 15:33:42 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 25 Feb 2025 15:33:42 +0800
To: <cyliu0926@gmail.com>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?=
 <clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>, Steven Lee
 <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, Jamin Lin
 <jamin_lin@aspeedtech.com>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Subject: [PATCH v4 3/4] hw/arm/aspeed_ast27x0: Add HACE support for AST2700
Date: Tue, 25 Feb 2025 15:33:40 +0800
Message-ID: <20250225073342.2960966-4-cy_liu@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250225073342.2960966-1-cy_liu@aspeedtech.com>
References: <20250225073342.2960966-1-cy_liu@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72; envelope-from=cy_liu@aspeedtech.com;
 helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_FAIL=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 25 Feb 2025 09:15:03 -0500
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
Reply-to:  cy_liu <cy_liu@aspeedtech.com>
From:  cy_liu via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: alIddG63uf8f

From: Jamin Lin <jamin_lin@aspeedtech.com>

The HACE controller between AST2600 and AST2700 are almost identical.
The HACE controller registers base address starts at 0x1207_0000 and
its alarm interrupt is connected to GICINT4.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
 hw/arm/aspeed_ast27x0.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
index 2d0c99f159..a48f47b74e 100644
--- a/hw/arm/aspeed_ast27x0.c
+++ b/hw/arm/aspeed_ast27x0.c
@@ -67,6 +67,7 @@ static const hwaddr aspeed_soc_ast2700_memmap[] = {
     [ASPEED_DEV_RTC]       =  0x12C0F000,
     [ASPEED_DEV_SDHCI]     =  0x14080000,
     [ASPEED_DEV_TIMER1]    =  0x12C10000,
+    [ASPEED_DEV_HACE]      =  0x12070000,
 };
 
 #define AST2700_MAX_IRQ 256
@@ -401,6 +402,9 @@ static void aspeed_soc_ast2700_init(Object *obj)
 
     snprintf(typename, sizeof(typename), "aspeed.timer-%s", socname);
     object_initialize_child(obj, "timerctrl", &s->timerctrl, typename);
+
+    snprintf(typename, sizeof(typename), "aspeed.hace-%s", socname);
+    object_initialize_child(obj, "hace", &s->hace, typename);
 }
 
 /*
@@ -733,6 +737,17 @@ static void aspeed_soc_ast2700_realize(DeviceState *dev, Error **errp)
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->timerctrl), i, irq);
     }
 
+    /* HACE */
+    object_property_set_link(OBJECT(&s->hace), "dram", OBJECT(s->dram_mr),
+                             &error_abort);
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->hace), errp)) {
+        return;
+    }
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->hace), 0,
+                    sc->memmap[ASPEED_DEV_HACE]);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->hace), 0,
+                       aspeed_soc_get_irq(s, ASPEED_DEV_HACE));
+
     create_unimplemented_device("ast2700.dpmcu", 0x11000000, 0x40000);
     create_unimplemented_device("ast2700.iomem0", 0x12000000, 0x01000000);
     create_unimplemented_device("ast2700.iomem1", 0x14000000, 0x01000000);
-- 
2.34.1


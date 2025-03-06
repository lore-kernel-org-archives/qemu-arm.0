Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp1387254njm;
        Thu, 6 Mar 2025 02:41:24 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU1WEdtuq3EzwZ59Sy88Low3b8p+Dg2CakH10hoWrXHjA8axtI/pnimYpIx9EiYSzqU1IFmOvjRR5VEoA==@linaro.org
X-Google-Smtp-Source: AGHT+IElz5ewGrJCiiBsyUj2k72+p9m/GXDuUtUf4cMqyC/gmeAcAte4zTbVdTTeeJmxczjAsH3m
X-Received: by 2002:a05:620a:1d09:b0:7c0:a550:89b5 with SMTP id af79cd13be357-7c3d8b7cd0emr1006865285a.0.1741257684381;
        Thu, 06 Mar 2025 02:41:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741257684; cv=none;
        d=google.com; s=arc-20240605;
        b=AIMM7DxQLAMQcODO794Sc3mCtUvFLhzRG5n14kJ2Q05Sz+eOwm7hYVAnjvmBPEVn73
         5CgGB9cwaoO6synicOo6GqfoGwUYzQxwwfRELoGONu4D56Ki1ALVRY1Vdnnf4H1jgzJG
         egeKzoSZvaUIAFyg7EWiXlsY/PibF1UCo4m213yfrv6fndn2FSVy68P9/SSjSE14r/Fi
         cKnJodldjjDj3mLJV+8ULbV+gXLwkVV4z4f11HRjsT5IUGk/cts6BOYJj88XMM9vVUYR
         Dr2jQSLNEPpP27t0DN/LlU0vb03yLId6n/wXBp7Ip1ypj0D7slJOmQVhPnkcpmQUoFU1
         DlfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=Isz/Go1sPGNOCOaIrI1kERDItMts5qRcrutoGMuu43k=;
        fh=3cFqTtzBuOtpuAUHgGIZLk2EDwH0HGw77jNYFWHrQKI=;
        b=WvFloRTgkqnShjCxfLZJkbELGJnwEokPgf2cJGgkJwHaSblDJvN0T06xlbWBaU11vc
         TieQ/45YjMwwppe0BAayW9G/abLmBL7nyf14BSv1v4qE8t/rRFdGVztnyYnymPWBOdJb
         bN8l1KwhpFbxDSaqSLhvtm7Ga+svJkzJf4RqfgYR7ikNVwuxGurYuEdr2KEIKkTe5QqG
         DxZ1yLlBlgmVdu+P3SKAB3/ceGuXGymSdUlCcMdvA44/Sh+Gks/yECXZaMBclb3nKMR4
         Ws0X8CA7mkmrV/Ne3i33Ga9s5s3Rm1vG8pTF+QoZAXUcI5ThibXTj9Bbh8VKokGO5Tha
         Ccjg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c3e5543cf4si98519085a.534.2025.03.06.02.41.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Mar 2025 02:41:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tq8f9-0008Bn-Rp; Thu, 06 Mar 2025 05:41:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tq8ew-0007tR-VJ; Thu, 06 Mar 2025 05:41:01 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tq8eq-0000XB-Ll; Thu, 06 Mar 2025 05:40:58 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 6 Mar
 2025 18:38:54 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 6 Mar 2025 18:38:54 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH v5 22/29] hw/arm/aspeed_ast27x0: Add SoC Support for AST2700 A1
Date: Thu, 6 Mar 2025 18:38:30 +0800
Message-ID: <20250306103846.429221-23-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250306103846.429221-1-jamin_lin@aspeedtech.com>
References: <20250306103846.429221-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_FAIL=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: lYvEynhl3BHO

The memory map for AST2700 A1 remains compatible with AST2700 A0. However, the
IRQ mapping has been updated for AST2700 A1, with GIC interrupts now ranging
from 192 to 201. Add a new IRQ map table for AST2700 A1.
Add "aspeed_soc_ast2700a1_class_init" to initialize the AST2700 A1 SoC.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 hw/arm/aspeed_ast27x0.c | 80 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
index cd37d2b4ba..7439512b83 100644
--- a/hw/arm/aspeed_ast27x0.c
+++ b/hw/arm/aspeed_ast27x0.c
@@ -120,6 +120,52 @@ static const int aspeed_soc_ast2700a0_irqmap[] = {
     [ASPEED_DEV_SDHCI]     = 133,
 };
 
+static const int aspeed_soc_ast2700a1_irqmap[] = {
+    [ASPEED_DEV_SDMC]      = 0,
+    [ASPEED_DEV_HACE]      = 4,
+    [ASPEED_DEV_XDMA]      = 5,
+    [ASPEED_DEV_UART4]     = 8,
+    [ASPEED_DEV_SCU]       = 12,
+    [ASPEED_DEV_RTC]       = 13,
+    [ASPEED_DEV_EMMC]      = 15,
+    [ASPEED_DEV_TIMER1]    = 16,
+    [ASPEED_DEV_TIMER2]    = 17,
+    [ASPEED_DEV_TIMER3]    = 18,
+    [ASPEED_DEV_TIMER4]    = 19,
+    [ASPEED_DEV_TIMER5]    = 20,
+    [ASPEED_DEV_TIMER6]    = 21,
+    [ASPEED_DEV_TIMER7]    = 22,
+    [ASPEED_DEV_TIMER8]    = 23,
+    [ASPEED_DEV_DP]        = 28,
+    [ASPEED_DEV_LPC]       = 192,
+    [ASPEED_DEV_IBT]       = 192,
+    [ASPEED_DEV_KCS]       = 192,
+    [ASPEED_DEV_I2C]       = 194,
+    [ASPEED_DEV_ADC]       = 194,
+    [ASPEED_DEV_GPIO]      = 194,
+    [ASPEED_DEV_FMC]       = 195,
+    [ASPEED_DEV_WDT]       = 195,
+    [ASPEED_DEV_PWM]       = 195,
+    [ASPEED_DEV_I3C]       = 195,
+    [ASPEED_DEV_UART0]     = 196,
+    [ASPEED_DEV_UART1]     = 196,
+    [ASPEED_DEV_UART2]     = 196,
+    [ASPEED_DEV_UART3]     = 196,
+    [ASPEED_DEV_UART5]     = 196,
+    [ASPEED_DEV_UART6]     = 196,
+    [ASPEED_DEV_UART7]     = 196,
+    [ASPEED_DEV_UART8]     = 196,
+    [ASPEED_DEV_UART9]     = 196,
+    [ASPEED_DEV_UART10]    = 196,
+    [ASPEED_DEV_UART11]    = 196,
+    [ASPEED_DEV_UART12]    = 196,
+    [ASPEED_DEV_ETH1]      = 196,
+    [ASPEED_DEV_ETH2]      = 196,
+    [ASPEED_DEV_ETH3]      = 196,
+    [ASPEED_DEV_PECI]      = 197,
+    [ASPEED_DEV_SDHCI]     = 197,
+};
+
 /* GICINT 128 */
 /* GICINT 192 */
 static const int ast2700_gic128_gic192_intcmap[] = {
@@ -861,6 +907,34 @@ static void aspeed_soc_ast2700a0_class_init(ObjectClass *oc, void *data)
     sc->get_irq      = aspeed_soc_ast2700_get_irq;
 }
 
+static void aspeed_soc_ast2700a1_class_init(ObjectClass *oc, void *data)
+{
+    static const char * const valid_cpu_types[] = {
+        ARM_CPU_TYPE_NAME("cortex-a35"),
+        NULL
+    };
+    DeviceClass *dc = DEVICE_CLASS(oc);
+    AspeedSoCClass *sc = ASPEED_SOC_CLASS(oc);
+
+    /* Reason: The Aspeed SoC can only be instantiated from a board */
+    dc->user_creatable = false;
+    dc->realize      = aspeed_soc_ast2700_realize;
+
+    sc->name         = "ast2700-a1";
+    sc->valid_cpu_types = valid_cpu_types;
+    sc->silicon_rev  = AST2700_A1_SILICON_REV;
+    sc->sram_size    = 0x20000;
+    sc->spis_num     = 3;
+    sc->wdts_num     = 8;
+    sc->macs_num     = 3;
+    sc->uarts_num    = 13;
+    sc->num_cpus     = 4;
+    sc->uarts_base   = ASPEED_DEV_UART0;
+    sc->irqmap       = aspeed_soc_ast2700a1_irqmap;
+    sc->memmap       = aspeed_soc_ast2700_memmap;
+    sc->get_irq      = aspeed_soc_ast2700_get_irq;
+}
+
 static const TypeInfo aspeed_soc_ast27x0_types[] = {
     {
         .name           = TYPE_ASPEED27X0_SOC,
@@ -873,6 +947,12 @@ static const TypeInfo aspeed_soc_ast27x0_types[] = {
         .instance_init  = aspeed_soc_ast2700_init,
         .class_init     = aspeed_soc_ast2700a0_class_init,
     },
+    {
+        .name           = "ast2700-a1",
+        .parent         = TYPE_ASPEED27X0_SOC,
+        .instance_init  = aspeed_soc_ast2700_init,
+        .class_init     = aspeed_soc_ast2700a1_class_init,
+    },
 };
 
 DEFINE_TYPES(aspeed_soc_ast27x0_types)
-- 
2.43.0


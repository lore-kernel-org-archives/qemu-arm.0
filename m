Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp7602387njd;
        Wed, 9 Apr 2025 03:03:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXocrqg4xKSWNVbE2puDN+/DdGj21Pi+pB1vjsZPKlVlO997GvJFjn/wQdYb2HiXi65EFZu0s05UT7k4A==@linaro.org
X-Google-Smtp-Source: AGHT+IFgJBKaixQHyHuBGz+KNVkOEJ8Wp/PZq8qqHtUFKNUBGXLd0ocd+hijemMf2oJSvH7udrAM
X-Received: by 2002:a05:6102:fa2:b0:4c5:1fd6:5b68 with SMTP id ada2fe7eead31-4c9c6b55f44mr700425137.19.1744192982213;
        Wed, 09 Apr 2025 03:03:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744192982; cv=none;
        d=google.com; s=arc-20240605;
        b=MV3REh+v+dVqZbhLVsx0b/t8snj2t1AFI6gGSCxqHMbk+hcAUznZrdM8olH7By/zkK
         Hy44aHGQ6USzx01NB+wQaElMkpdhKUXni/6yw/EOWNp3Jl9FI0WecMjpbCqLrdKuFnxi
         gt0DvsmXUZIYcAbXgYgVSgcki9hgiP649v9Is/rNwq/uQ3uDdDB7P5IQ5Xh9urrHxduM
         d0frlaXz6WiBG4bUaVhkCQUriF1GmxcnCPgMmq48eGisdI+qYA6zh63cEhr862sZLnDB
         bUr3VmepDRCI86igaK6+b8KnZ6X4JSJE3aT7IJnRSnhrKTDwTlOk9MciOsMNFl5vLatj
         /xUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=w3h7ZrudNt8iWMML682qTEde2gcBy5R43IwugJ5epG0=;
        fh=9slMQvAVAaDbZF94sUZsatNqTIKawFKtbOHuc7HAk0w=;
        b=gEof81NH12XGpwL1cg9fSz/Kg+L7zJOSwPM2vnf7scyvjpMW9FxnjTAqKKdmPKNdqE
         qjucxM4KOPElNC7dUoUoT3IvJf5kLNaU17CRACTpqghkr3XxxXORh8A7un1Z3sAuq+Fx
         uL71fl9DBJ8oOA63UmsjCZvXxjbn9YCwVi23V0I+NbZITIosY3ykzYPENnVIaQ+HB5A9
         GwrGPHgtoQcB+zUthRPNZaYLmStg5Quhyc72J30KA/qd6+zk20VIFI/SyMLUM/Vfevjt
         jz2+VBf9Rr8CRAuXZtY3ySO3w6cw2DeYWE8xACZpw/gHVEJdxfAcE8eJza05LS5ln2+d
         B30A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4c9c9890c90si100210137.234.2025.04.09.03.03.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Apr 2025 03:03:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u2SEv-0006Vx-UW; Wed, 09 Apr 2025 06:01:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1u2SEq-0006PP-RI; Wed, 09 Apr 2025 06:00:58 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1u2SEp-0006jO-2z; Wed, 09 Apr 2025 06:00:56 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Wed, 9 Apr
 2025 18:00:40 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Wed, 9 Apr 2025 18:00:40 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <nabihestefan@google.com>
Subject: [PATCH v1 2/9] hw/arm/aspeed_ast27x0: Rename variable sram_name to
 name in ast2700 realize
Date: Wed, 9 Apr 2025 18:00:30 +0800
Message-ID: <20250409100039.2391847-3-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250409100039.2391847-1-jamin_lin@aspeedtech.com>
References: <20250409100039.2391847-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_FAIL=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: d530F7SLm3/B

The variable "sram_name" was only used for naming the SRAM memory region.
Rename it to "name" for consistency with similar code and avoid unnecessary
new local variable declarations.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/arm/aspeed_ast27x0.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
index 81dd90ffdd..c7188ae5f1 100644
--- a/hw/arm/aspeed_ast27x0.c
+++ b/hw/arm/aspeed_ast27x0.c
@@ -577,7 +577,7 @@ static void aspeed_soc_ast2700_realize(DeviceState *dev, Error **errp)
     AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
     AspeedINTCClass *ic = ASPEED_INTC_GET_CLASS(&a->intc[0]);
     AspeedINTCClass *icio = ASPEED_INTC_GET_CLASS(&a->intc[1]);
-    g_autofree char *sram_name = NULL;
+    g_autofree char *name = NULL;
     qemu_irq irq;
 
     /* Default boot region (SPI memory or ROMs) */
@@ -649,9 +649,9 @@ static void aspeed_soc_ast2700_realize(DeviceState *dev, Error **errp)
     }
 
     /* SRAM */
-    sram_name = g_strdup_printf("aspeed.sram.%d", CPU(&a->cpu[0])->cpu_index);
-    if (!memory_region_init_ram(&s->sram, OBJECT(s), sram_name, sc->sram_size,
-                                 errp)) {
+    name = g_strdup_printf("aspeed.sram.%d", CPU(&a->cpu[0])->cpu_index);
+    if (!memory_region_init_ram(&s->sram, OBJECT(s), name, sc->sram_size,
+                                errp)) {
         return;
     }
     memory_region_add_subregion(s->memory,
-- 
2.43.0


Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp8125208njd;
        Wed, 9 Apr 2025 19:40:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVEcWEVexLbisGXTD6RBshvM5j2ycWRJM4FzN68vORFKKBFlVIXA2KHMKCjONHTEH17fw4sSuG77VFRjg==@linaro.org
X-Google-Smtp-Source: AGHT+IGcYIaNAKKDjWyqhCJ0o1hn8E0QCox8nbKLwvAy0dBxkBraAe/anAq3kOqzFqx53C56NbZA
X-Received: by 2002:a05:6214:501b:b0:6df:97a3:5e5a with SMTP id 6a1803df08f44-6f0e5c26877mr22599496d6.28.1744252810902;
        Wed, 09 Apr 2025 19:40:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744252810; cv=none;
        d=google.com; s=arc-20240605;
        b=JIh74azLcRhJD7nnlsOu87BjuKVaB7SDv5F6P/1ETZspHStSJ5bsz4JcoEgckZQMQo
         t9kHJLYMgGSxYR6AY30dVLQwqpzN3nbRfaMO1DzZorG5CNOLs4dG/LP0mmeLXhHGF/bb
         5DB2laKltOmLWjS5a9F4rqEt3S6lBbPLNmf7v3Y5QydDAZ9b8bifc2Vq71B62uDDkE4C
         iPRMXNg5O9wouUYnXkLfY1zeJyCL6OWYu83773YeAR4N+4xofy7WbeOGO8kd8bq9/yEA
         KzEMeY+C0Xnch1RuzpcD69daQTqQ7IRS/+6A2SLRTZNkXDg11dIJLFVgq6/8r74kitW/
         pYag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=w3h7ZrudNt8iWMML682qTEde2gcBy5R43IwugJ5epG0=;
        fh=9slMQvAVAaDbZF94sUZsatNqTIKawFKtbOHuc7HAk0w=;
        b=cRt3MDwJsvQ7cgHvfMHAMO5kLOn+kYO4Hl3v441xLPCidP/rqObe/C6Gewd+0TMGqy
         ctf0URjs9NdsLPuIH5t7g8XnPPXqDoaI2Y0fE99jy/DgOhPOylSly+go1o3nVF/Gw33t
         WfZhipOg2vxMyM1snOHdF233i+7n/lTwgjp+1BlwWgpMotKzRs6iRg5S0sc+icXaTOBw
         XFqzzYHO8aqEjPyGtbvC73JZfEdfecjBaCV2LkvzjOfkTXfMwLIymNTzX5Zb99HSHU2P
         pYeTADtCO3vvHvT6FCdzhcX7S+eRZEu9R62V9sxpPsugSP+lmdIqr4gPuGtFD7ULTxs9
         XhfA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f0de9dcfb1si22552156d6.250.2025.04.09.19.40.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Apr 2025 19:40:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1u2hp1-0001aQ-GW; Wed, 09 Apr 2025 22:39:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1u2hoy-0001ZY-B9; Wed, 09 Apr 2025 22:39:16 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1u2how-00033O-Pg; Wed, 09 Apr 2025 22:39:15 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 10 Apr
 2025 10:38:57 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 10 Apr 2025 10:38:57 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <nabihestefan@google.com>
Subject: [PATCH v2 03/10] hw/arm/aspeed_ast27x0: Rename variable sram_name to
 name in ast2700 realize
Date: Thu, 10 Apr 2025 10:38:47 +0800
Message-ID: <20250410023856.500258-4-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250410023856.500258-1-jamin_lin@aspeedtech.com>
References: <20250410023856.500258-1-jamin_lin@aspeedtech.com>
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
X-TUID: e3xAAcA3S0LO

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


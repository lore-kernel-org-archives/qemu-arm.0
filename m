Received: by 2002:a17:504:d692:b0:1be9:327d:8ee3 with SMTP id na18csp49220njb;
        Wed, 4 Dec 2024 00:46:00 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUqWBR4h5AW7wcz3yP3oBYItiJqVgeWm6k5ABLMCvycUpvcvKTpkT5K574tzOItZr6ep5aMt/Qc/Smuyw==@linaro.org
X-Google-Smtp-Source: AGHT+IFklBZUdKvaxJhw9IzMZ3opHODdqE1gO2sLQH+0nGi5uJjUDfGplKmGTOZ6DSCGOA5qzgpN
X-Received: by 2002:a05:622a:18a6:b0:466:a0c4:a6da with SMTP id d75a77b69052e-4670c3ac966mr78636391cf.31.1733301959973;
        Wed, 04 Dec 2024 00:45:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733301959; cv=none;
        d=google.com; s=arc-20240605;
        b=EBbSfICcLh912ZFgf8dbsTADNH4lcR+/Sn+kf+ZdBxfAWnx3GpkMwrUZoauAkcqfcg
         VJixxby5O38K3abHNY5YmjTenB1Mfk/+EjAGDenS0vQ9lOsVVFcqa/ArTLGmp8HJssba
         YmY+2e4+wswyENHS2U0IJHdWicMqV775KRWeCYDVZHRRiax1aP0zcF5NQClzmezEv/Qt
         X9eGxsZ+KuUoiRwFWHiUJvtQjziedxdlTrwzgdSR84uef9XnwCSKcdPhGATMxv9UXwME
         scz+aghS9DMQswffNi0trMRa4AbCvWa5yYYE8fZFuJxrkz+WEKZh0DywFl3fzCMwOuz+
         M9ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=rwt9r5ItV7Z9fVPrgChTU77Q+Zksf9crxlLdcrqI7DM=;
        fh=oHzELYP6xEldnfh1elECkRDXzq+40wADKO/d7kYb8Lg=;
        b=jYXx+99jAHg/vjbIy6cqwyVbCkRLoVqPvG1bsIjfMvpDF19n4gEZy5pOtZLX3wiypS
         6TNKCk4n3tkQkTxC8a0Ay0wpQdFznL2vqSDpkd8dfeEB25JJo54+OtbzEKK6ADxEk3OO
         GkddYB2q8rZ5HYiHyqIddU47FXBhJT1aQ1ZZqmyV+R0UtVNSY/djfEA3vMakm+yE1M3k
         XZwX8lReEC1XSZiPiEx7W1gZB3Zq0c8TMNYU5DS/6CC3bkKknjMxWpNee/bzCr4ynGsc
         LtJnUDKCHk383yeMnprpEaHvWrHBQWDRkc/4JyF8jd8FxxMw8l541Uq2k4ywBdK6CUda
         AOww==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-466d4b10346si128072541cf.715.2024.12.04.00.45.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Dec 2024 00:45:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tIl0a-00035H-1U; Wed, 04 Dec 2024 03:45:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tIl0Y-00034i-0U; Wed, 04 Dec 2024 03:45:18 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tIl0W-0006xz-J0; Wed, 04 Dec 2024 03:45:17 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Wed, 4 Dec
 2024 16:44:55 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Wed, 4 Dec 2024 16:44:55 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?=
 <clg@redhat.com>
Subject: [PATCH v4 6/6] aspeed/soc: Support eMMC for AST2700
Date: Wed, 4 Dec 2024 16:44:53 +0800
Message-ID: <20241204084453.610660-7-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241204084453.610660-1-jamin_lin@aspeedtech.com>
References: <20241204084453.610660-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
X-TUID: yCQULNUeQhrS

Add SDHCI model for AST2700 eMMC support. The eMMC controller only support 1
slot and registers base address is start at 0x1209_0000 and its interrupt is
connected to GICINT 15.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 hw/arm/aspeed_ast27x0.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
index baddd35ecf..23571584b2 100644
--- a/hw/arm/aspeed_ast27x0.c
+++ b/hw/arm/aspeed_ast27x0.c
@@ -391,6 +391,12 @@ static void aspeed_soc_ast2700_init(Object *obj)
     /* Init sd card slot class here so that they're under the correct parent */
     object_initialize_child(obj, "sd-controller.sdhci",
                             &s->sdhci.slots[0], TYPE_SYSBUS_SDHCI);
+
+    object_initialize_child(obj, "emmc-controller", &s->emmc, typename);
+    object_property_set_int(OBJECT(&s->emmc), "num-slots", 1, &error_abort);
+
+    object_initialize_child(obj, "emmc-controller.sdhci", &s->emmc.slots[0],
+                            TYPE_SYSBUS_SDHCI);
 }
 
 /*
@@ -701,6 +707,15 @@ static void aspeed_soc_ast2700_realize(DeviceState *dev, Error **errp)
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->sdhci), 0,
                        aspeed_soc_get_irq(s, ASPEED_DEV_SDHCI));
 
+    /* eMMC */
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->emmc), errp)) {
+        return;
+    }
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->emmc), 0,
+                    sc->memmap[ASPEED_DEV_EMMC]);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->emmc), 0,
+                       aspeed_soc_get_irq(s, ASPEED_DEV_EMMC));
+
     create_unimplemented_device("ast2700.dpmcu", 0x11000000, 0x40000);
     create_unimplemented_device("ast2700.iomem0", 0x12000000, 0x01000000);
     create_unimplemented_device("ast2700.iomem1", 0x14000000, 0x01000000);
-- 
2.34.1


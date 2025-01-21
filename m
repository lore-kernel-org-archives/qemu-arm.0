Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp6495406njn;
        Mon, 20 Jan 2025 23:08:11 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXsYyCuA5xdau6ZtQ2XG5IhYBZW1pvIoNqG+YRuN6nFxbLnmmMZYt/i3cDgcWCcnNXl65FjQ/EejDhefg==@linaro.org
X-Google-Smtp-Source: AGHT+IFeD7iSVEHFIg2qX7eIhWcComYBc2Rft/P36XrSvIwUc/RkG+V0eggZv9lDMslpU8QUGadt
X-Received: by 2002:ad4:5dcd:0:b0:6da:dc79:a3d2 with SMTP id 6a1803df08f44-6e1b2171505mr270744346d6.5.1737443291631;
        Mon, 20 Jan 2025 23:08:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737443291; cv=none;
        d=google.com; s=arc-20240605;
        b=URIN0AeLOwQxaqK2J2ZZcGk1A1QEc6VS2h6tpOPa6IXUHWoplX0/Mwov6yjo2wrzep
         F9aOgLihD3E15Zr5yZqtArA3Lgy7G1Cm2s2M3U6MlKlhpQI4j9HoGNSPE6mCob2vI1pM
         bohGJL9f7ISQyyu3+isFabUcPz/h0C0cxQI2pR2bs1xx9ieCbKoyUWgHvSxO5D6wz7oo
         S6jvud9PRnyyWnJFTgtr7T78vxmJdP0XVwvuDnnCit5nQid8Xqfhvai0iIxWdhENqXcP
         ZtM8K3V+BSAenc1eIhvCmx2smrF5F4i0vhffkcYRLDV159bCRYSKAYZWL5LOMAoYfMCn
         a+Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=yoaawk28QHROFpTsqtRusaqXSFGT4etevxyXkIsT5+E=;
        fh=dcWtL3UV6hgfvVRRNBgcZIYWwd7971OyicJdpXZbSYo=;
        b=eKrsDjWmlRWSf1iEwDoZu4wrOJtex2ChbZTpMIGXUfscvfgC5Xjqj78hbaRj9Y3H/p
         mpjjtGDXHyIz/HcVnNi5unC8JiDkQwbfVzdcCHqWjTMg/GSCB1OJ9KZu6ct4pV97deF6
         wYljs5lPbE3zYwkYiDxe48Qfqzwpp1Xgdlwhhug1u6+LYAT6F9K1lpDUrFxTc6Mk5/B4
         4J/Rfhd7qwzD5fXyTL74gd/N6wsjffDVPFZpFHEwP8ckmIK6mzCcJDWcEm9bRTbGLQeg
         Jr0JcL83mqm84K3EaODQdeBO7qOVVfZUp0rgh6iut02sKbbQ1htBpuozEk1hURXeJv2k
         7gDQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e1afc1abc2si121609016d6.141.2025.01.20.23.08.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jan 2025 23:08:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ta8Ku-0000Sf-Uh; Tue, 21 Jan 2025 02:06:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1ta8Kp-0008Sn-D6; Tue, 21 Jan 2025 02:06:03 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1ta8Km-0001hy-Rb; Tue, 21 Jan 2025 02:06:02 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 21 Jan
 2025 15:04:30 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 21 Jan 2025 15:04:30 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v1 17/18] hw/arm/aspeed_ast27x0: Add HACE support for AST2700
Date: Tue, 21 Jan 2025 15:04:23 +0800
Message-ID: <20250121070424.2465942-18-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250121070424.2465942-1-jamin_lin@aspeedtech.com>
References: <20250121070424.2465942-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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
X-TUID: jbnr0i81Kjbo

The HACE controller between AST2600 and AST2700 are almost identical.
The HACE controller registers base address starts at 0x1207_0000 and
its alarm interrupt is connected to GICINT4.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/arm/aspeed_ast27x0.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
index e0a29c9053..0b82b2eab5 100644
--- a/hw/arm/aspeed_ast27x0.c
+++ b/hw/arm/aspeed_ast27x0.c
@@ -68,6 +68,7 @@ static const hwaddr aspeed_soc_ast2700_memmap[] = {
     [ASPEED_DEV_SDHCI]     =  0x14080000,
     [ASPEED_DEV_TIMER1]    =  0x12C10000,
     [ASPEED_DEV_INTC1]     =  0x14C18000,
+    [ASPEED_DEV_HACE]      =  0x12070000,
 };
 
 #define AST2700_MAX_IRQ 256
@@ -478,6 +479,9 @@ static void aspeed_soc_ast2700_init(Object *obj)
 
     snprintf(typename, sizeof(typename), "aspeed.timer-%s", socname);
     object_initialize_child(obj, "timerctrl", &s->timerctrl, typename);
+
+    snprintf(typename, sizeof(typename), "aspeed.hace-%s", socname);
+    object_initialize_child(obj, "hace", &s->hace, typename);
 }
 
 /*
@@ -833,6 +837,17 @@ static void aspeed_soc_ast2700_realize(DeviceState *dev, Error **errp)
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


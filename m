Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp1585441njn;
        Sun, 12 Jan 2025 22:46:09 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWgp4undTxzTW8g+Evpxn7//25vGAu7AsqgoK2hAycKtVzL6G6AkOiS32rA8eL04Xcq4Mag4rW4LscMQQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFK8mN0YdpA8cD5xRicXKxPWy8CF2HAymqmIBhNuZpVuoUhA2dzBRY3dE8SQ5GsXYYX3NOj
X-Received: by 2002:a05:6214:4b04:b0:6d4:1613:be3e with SMTP id 6a1803df08f44-6dfa3ad9617mr251549296d6.22.1736750769690;
        Sun, 12 Jan 2025 22:46:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736750769; cv=none;
        d=google.com; s=arc-20240605;
        b=Tac1eDZqNi8LzY2RmYbvhDx8xTrSLg8tp5m35ECemTOV/0ZePYux2lF/zoXE+LTira
         DBsCzxliSgJkNaoT+Oxr8VxhlB0K1hLnlBLRqJE7icBOslpHHg9Gi0WBZ3A3/uc2cmL+
         m5zh5VitstQ4/Js9GzXUF9hq2PseI6kRuN/4zBWzGcYWsjiQzdXk7+IW6mQJjU/kClyl
         bXnQHGQ598MbLCGnRysJejS4whoWcd9jYpBK48vxQ9ybKvPIqEI3bipHMEsYlj9dsYpF
         8I4jFuQtkePPnLyuOAlI3HbDZx3RBJCs9wqF7wFR6a1IF/N6iid1OrG2EBVEOqEwJMUI
         pv9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=BUtzvCsW3W4AlNGM2KTzjPiYt5s6A4pSJYTvytm7OPU=;
        fh=oHzELYP6xEldnfh1elECkRDXzq+40wADKO/d7kYb8Lg=;
        b=bf4sfTc/0ZWk53lIX9rYsqKiRBGdV8UDjh0dhS6TNAVyxyHy1D5uMxZ/+tAQLmETqH
         94tFsNLG4FmAsrZPp8OODV3tHNfdiA2f0EnNCpF+aq55+H4RTIGpsZR1vIov5mGOnLQB
         YN0YFIUIdp+Dk+0n0kNB5hKsMGIKE5WQsn90+UKp0G+/6t3p61AYH6Vvci53LhZIa94p
         bXBX+9DZHPQ/roPRGDeSKtFQTGXgHeRg8JY9OryTPSOwrpjpmKxidGvB1kI8bBicWAQy
         k4HFbepPR25WhfK/GWdS3QP8L84VU0TbkplOEWWYpQftSkMcEDnhyRnlIY6L8d7rGYAE
         poYw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6dfae032343si81381546d6.496.2025.01.12.22.46.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 12 Jan 2025 22:46:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tXECb-0001zS-R9; Mon, 13 Jan 2025 01:45:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tXECR-0001v0-Ma; Mon, 13 Jan 2025 01:45:28 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tXECQ-0003zU-4l; Mon, 13 Jan 2025 01:45:23 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Mon, 13 Jan
 2025 14:44:57 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Mon, 13 Jan 2025 14:44:57 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?=
 <clg@redhat.com>
Subject: [PATCH v2 3/3] aspeed/soc: Support Timer for AST2700
Date: Mon, 13 Jan 2025 14:44:55 +0800
Message-ID: <20250113064455.1660564-4-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250113064455.1660564-1-jamin_lin@aspeedtech.com>
References: <20250113064455.1660564-1-jamin_lin@aspeedtech.com>
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
X-TUID: 0omaMosd/koA

Add Timer model for AST2700 Timer support. The Timer controller include 8 sets
of 32-bit decrement counters.

The base address of TIMER0 to TIMER7 as following.
Base Address of Timer 0 = 0x12C1_0000
Base Address of Timer 1 = 0x12C1_0040
Base Address of Timer 2 = 0x12C1_0080
Base Address of Timer 3 = 0x12C1_00C0
Base Address of Timer 4 = 0x12C1_0100
Base Address of Timer 5 = 0x12C1_0140
Base Address of Timer 6 = 0x12C1_0180
Base Address of Timer 7 = 0x12C1_01C0

The interrupt of TIMER0 to TIMER7 as following.
GICINT16 = TIMER 0 interrupt
GICINT17 = TIMER 1 interrupt
GICINT18 = TIMER 2 interrupt
GICINT19 = TIMER 3 interrupt
GICINT20 = TIMER 4 interrupt
GICINT21 = TIMER 5 interrupt
GICINT22 = TIMER 6 interrupt
GICINT23 = TIMER 7 interrupt

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 hw/arm/aspeed_ast27x0.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
index fee3755837..4114e15ddd 100644
--- a/hw/arm/aspeed_ast27x0.c
+++ b/hw/arm/aspeed_ast27x0.c
@@ -66,6 +66,7 @@ static const hwaddr aspeed_soc_ast2700_memmap[] = {
     [ASPEED_DEV_GPIO]      =  0x14C0B000,
     [ASPEED_DEV_RTC]       =  0x12C0F000,
     [ASPEED_DEV_SDHCI]     =  0x14080000,
+    [ASPEED_DEV_TIMER1]    =  0x12C10000,
 };
 
 #define AST2700_MAX_IRQ 256
@@ -397,6 +398,9 @@ static void aspeed_soc_ast2700_init(Object *obj)
 
     object_initialize_child(obj, "emmc-controller.sdhci", &s->emmc.slots[0],
                             TYPE_SYSBUS_SDHCI);
+
+    snprintf(typename, sizeof(typename), "aspeed.timer-%s", socname);
+    object_initialize_child(obj, "timerctrl", &s->timerctrl, typename);
 }
 
 /*
@@ -716,6 +720,19 @@ static void aspeed_soc_ast2700_realize(DeviceState *dev, Error **errp)
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->emmc), 0,
                        aspeed_soc_get_irq(s, ASPEED_DEV_EMMC));
 
+    /* Timer */
+    object_property_set_link(OBJECT(&s->timerctrl), "scu", OBJECT(&s->scu),
+                             &error_abort);
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->timerctrl), errp)) {
+        return;
+    }
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->timerctrl), 0,
+                    sc->memmap[ASPEED_DEV_TIMER1]);
+    for (i = 0; i < ASPEED_TIMER_NR_TIMERS; i++) {
+        irq = aspeed_soc_get_irq(s, ASPEED_DEV_TIMER1 + i);
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->timerctrl), i, irq);
+    }
+
     create_unimplemented_device("ast2700.dpmcu", 0x11000000, 0x40000);
     create_unimplemented_device("ast2700.iomem0", 0x12000000, 0x01000000);
     create_unimplemented_device("ast2700.iomem1", 0x14000000, 0x01000000);
-- 
2.34.1


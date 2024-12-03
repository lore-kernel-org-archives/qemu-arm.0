Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp3385555njk;
        Mon, 2 Dec 2024 18:16:38 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU316hoaomW4rXb4yEtgZfzW0jSjbOYrx4VbS7a8fCg+PVLmCK+COZ1LpJLlhyzKBgR1su4UJNYR+uLeQ==@linaro.org
X-Google-Smtp-Source: AGHT+IF8c+2Y8RT1t4L+EncdDKaCxY3wnW4dpND9O7S0BiZX97BOnE8mUN2dBX3bzjun5gnVibXP
X-Received: by 2002:a05:622a:1992:b0:463:5bd4:59b8 with SMTP id d75a77b69052e-4670c712e88mr10948911cf.40.1733192198728;
        Mon, 02 Dec 2024 18:16:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733192198; cv=none;
        d=google.com; s=arc-20240605;
        b=ao2DFU98txYORqToHy7a5j3QoNX6gJCi1Pj6bmXGEBeecrwXVftrX68m7Al0ZZYawe
         nF5Nc2iTZMQ1GBdKDviy63aGrPh2IyKMMDvyYwPhSW/IZeGXqBSfNZZxqRuklTV97ZYF
         cVxgm2tXhC4DgzDoL62l5UDB/x6uI8scb9oaNQRXGxDrUz5tfBJzRkmcj9y/kMTj4n5L
         8Y1eoKS6e3ue+orFMplIIF1fMay3X6XTqDbgCKp+VzAPUA366iFDXWBd634uo8QWbhM4
         l+HR5UVUaXe4on1fQolQTHutQ5Jav37erGVzr0WlAnT+NgEtJOOPpMQyoT1zz94ulU7I
         IPEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=HYOb1GU2IPI+Bl40HaaRFKrpsoRlimUfV4dLpocFlaw=;
        fh=dcWtL3UV6hgfvVRRNBgcZIYWwd7971OyicJdpXZbSYo=;
        b=izTfepsQ4zX5w6udzX5B9Xi46VhFp9h77XZUtRHYG8Xe4qibq7kh+CTzj7atk3xwOF
         V1teN+yvck8UDMtR865JdQ6FlmiSEgeg3KuIq8iExCPEwPuo0ZteTjOnMOW8Fa1s4bXI
         ltmv0qmoENfKRBYX4hr+z1mhorA5Wbx9vAs8A/FwPqZOc/ac90hfhyBfg324i2EykCqy
         aD/SPyHkWGYaVWxZWDMkEjdoEP4CXV4/xv8XoY12knFwkttoEWH049fq28tVMhSnZmMy
         s+NhSD7xdd/eNjGinruee3OEV+ElXuwY/0XfoPZj6wdeC4bxwWGjEejRm2JFEB+aIueM
         iUsw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-466c40547c6si132397411cf.103.2024.12.02.18.16.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Dec 2024 18:16:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tIIRm-0005VJ-S6; Mon, 02 Dec 2024 21:15:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tIIRk-0005Tb-6V; Mon, 02 Dec 2024 21:15:28 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tIIRi-0003dt-Tu; Mon, 02 Dec 2024 21:15:27 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 3 Dec
 2024 10:15:01 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 3 Dec 2024 10:15:01 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v2 6/6] aspeed/soc: Support eMMC for AST2700
Date: Tue, 3 Dec 2024 10:15:00 +0800
Message-ID: <20241203021500.3986213-7-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241203021500.3986213-1-jamin_lin@aspeedtech.com>
References: <20241203021500.3986213-1-jamin_lin@aspeedtech.com>
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
X-TUID: K687C4711yTS

Add SDHCI model for AST2700 eMMC support. The eMMC controller only support 1
slot and registers base address is start at 0x1209_0000 and its interrupt is
connected to GICINT 15.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
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


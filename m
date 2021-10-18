Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp3007903lfc;
        Mon, 18 Oct 2021 06:29:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyzvahHo2NeVDViiYyHF9RKmkpAKA0LMnVqVQYIPwXCud3CrZhoErqI3F6p+nhjLAw0WJ6e
X-Received: by 2002:a5d:8719:: with SMTP id u25mr14275142iom.140.1634563786318;
        Mon, 18 Oct 2021 06:29:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634563786; cv=none;
        d=google.com; s=arc-20160816;
        b=EuKvKDRtSdeTtknrQzXPkGlrvktZppqXTOgxVO39mHlkAFsaykVTFBr0YRul1/MEEM
         4O8Ag9zfzpu4iLk9OU6JeVvtDXunNEx9d6Y+cNi4XL/386RFqwdrS9ld8iX6ox3yOC5w
         g4bRGjNvfzhGBdNwuEeMobW5YIXRXTKF1/n3VmXW85Sa1lyWTsEIlsYWBtAxXWLJf+PK
         S+sDdek9uxjThFxUJ+7Baj6rSaJqfP9bYmfhv28WljGKxoiN+MUtgdBXW8pZBwuIkkhn
         CSdHk7nHh/aL8A2sUmXQuNNAA/NeUcwIM9NoMQqlyWKM8gSmdwx7JkLbHl0rMP2hFYn6
         GlOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=hcKAYhbQZaqhUtRC40AhaOqCYbkwcUsokv/2uz/n2J0=;
        b=m1M9kyUrp4rd5qbTnby+SMTdd+ZRbmuVS4f+cV0yFZ2FlEApBPRKrxPXMxPgYw64m/
         2y4KqDOJ0Gagm9ltFEJK0w7303owf2ixUI33u5ZNmW4WvyhQNwZJj6dDBlpAuMs7s7hx
         HbSEz9kiQrPXXuwTraxoRem+mkq0CDv/Fdn2FwgdXUEKUI0mHzGIjV6KMzk0I9iYVvC9
         r0c6i0YybXx+UQqvg6GLgW6KfiirgN3j5P51zkqGGsWIdcPjOfcRPztgE/7pz5PCKXSq
         N13uhuaqpcL7irxd7hc4uDdUrAhKuNHe0VBTtHa/WvFhzPeTn/FZZ2vGrPPRFlFX0qbh
         X9AQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w11si19829018ilu.94.2021.10.18.06.29.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Oct 2021 06:29:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mcSi1-0000ad-J5
	for alex.bennee@linaro.org; Mon, 18 Oct 2021 09:29:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mcSek-0002wo-AH
 for qemu-arm@nongnu.org; Mon, 18 Oct 2021 09:26:23 -0400
Received: from 2.mo548.mail-out.ovh.net ([178.33.255.19]:41713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mcSef-0006DK-LI
 for qemu-arm@nongnu.org; Mon, 18 Oct 2021 09:26:21 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.2])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id B52D1204C4;
 Mon, 18 Oct 2021 13:26:12 +0000 (UTC)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Mon, 18 Oct
 2021 15:26:11 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R0019c4d4946-db25-46d9-8d6d-fbd749b81368,
 F07B6F3C357710E32BAB16EB0BBFA04B60198819) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 2/5] aspeed: Initialize the watchdog device models before
 the FMC models
Date: Mon, 18 Oct 2021 15:26:06 +0200
Message-ID: <20211018132609.160008-3-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211018132609.160008-1-clg@kaod.org>
References: <20211018132609.160008-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 8c6912f3-dfdb-4361-834d-e8e8145ecdf7
X-Ovh-Tracer-Id: 8499418400517884777
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrvddvtddgiedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfhisehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepheehfeegjeeitdfffeetjeduveejueefuefgtdefueelueetveeliefhhffgtdelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=178.33.255.19; envelope-from=clg@kaod.org;
 helo=2.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FLZh7ZDCR9K4

Next changes will map the WDT2 registers in the AST2600 FMC memory
region. Make sure the MemoryRegion pointers are correctly initialized
before setting the object links.

Do the same in the Aspeed AST2400 and AST2500 SoC models for
consistency.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed_ast2600.c | 36 ++++++++++++++++++------------------
 hw/arm/aspeed_soc.c     | 36 ++++++++++++++++++------------------
 2 files changed, 36 insertions(+), 36 deletions(-)

diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index 0384357a9510..3a7aa910b157 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -148,6 +148,11 @@ static void aspeed_soc_ast2600_init(Object *obj)
     snprintf(typename, sizeof(typename), "aspeed.timer-%s", socname);
     object_initialize_child(obj, "timerctrl", &s->timerctrl, typename);
 
+    for (i = 0; i < sc->wdts_num; i++) {
+        snprintf(typename, sizeof(typename), "aspeed.wdt-%s", socname);
+        object_initialize_child(obj, "wdt[*]", &s->wdt[i], typename);
+    }
+
     snprintf(typename, sizeof(typename), "aspeed.adc-%s", socname);
     object_initialize_child(obj, "adc", &s->adc, typename);
 
@@ -175,11 +180,6 @@ static void aspeed_soc_ast2600_init(Object *obj)
     object_property_add_alias(obj, "max-ram-size", OBJECT(&s->sdmc),
                               "max-ram-size");
 
-    for (i = 0; i < sc->wdts_num; i++) {
-        snprintf(typename, sizeof(typename), "aspeed.wdt-%s", socname);
-        object_initialize_child(obj, "wdt[*]", &s->wdt[i], typename);
-    }
-
     for (i = 0; i < sc->macs_num; i++) {
         object_initialize_child(obj, "ftgmac100[*]", &s->ftgmac100[i],
                                 TYPE_FTGMAC100);
@@ -325,6 +325,19 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->timerctrl), i, irq);
     }
 
+    /* Watch dog */
+    for (i = 0; i < sc->wdts_num; i++) {
+        AspeedWDTClass *awc = ASPEED_WDT_GET_CLASS(&s->wdt[i]);
+
+        object_property_set_link(OBJECT(&s->wdt[i]), "scu", OBJECT(&s->scu),
+                                 &error_abort);
+        if (!sysbus_realize(SYS_BUS_DEVICE(&s->wdt[i]), errp)) {
+            return;
+        }
+        sysbus_mmio_map(SYS_BUS_DEVICE(&s->wdt[i]), 0,
+                        sc->memmap[ASPEED_DEV_WDT] + i * awc->offset);
+    }
+
     /* ADC */
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->adc), errp)) {
         return;
@@ -395,19 +408,6 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
     }
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->sdmc), 0, sc->memmap[ASPEED_DEV_SDMC]);
 
-    /* Watch dog */
-    for (i = 0; i < sc->wdts_num; i++) {
-        AspeedWDTClass *awc = ASPEED_WDT_GET_CLASS(&s->wdt[i]);
-
-        object_property_set_link(OBJECT(&s->wdt[i]), "scu", OBJECT(&s->scu),
-                                 &error_abort);
-        if (!sysbus_realize(SYS_BUS_DEVICE(&s->wdt[i]), errp)) {
-            return;
-        }
-        sysbus_mmio_map(SYS_BUS_DEVICE(&s->wdt[i]), 0,
-                        sc->memmap[ASPEED_DEV_WDT] + i * awc->offset);
-    }
-
     /* Net */
     for (i = 0; i < sc->macs_num; i++) {
         object_property_set_bool(OBJECT(&s->ftgmac100[i]), "aspeed", true,
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 7d53cf2f5133..2eb30d14cf94 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -162,6 +162,11 @@ static void aspeed_soc_init(Object *obj)
     snprintf(typename, sizeof(typename), "aspeed.timer-%s", socname);
     object_initialize_child(obj, "timerctrl", &s->timerctrl, typename);
 
+    for (i = 0; i < sc->wdts_num; i++) {
+        snprintf(typename, sizeof(typename), "aspeed.wdt-%s", socname);
+        object_initialize_child(obj, "wdt[*]", &s->wdt[i], typename);
+    }
+
     snprintf(typename, sizeof(typename), "aspeed.adc-%s", socname);
     object_initialize_child(obj, "adc", &s->adc, typename);
 
@@ -189,11 +194,6 @@ static void aspeed_soc_init(Object *obj)
     object_property_add_alias(obj, "max-ram-size", OBJECT(&s->sdmc),
                               "max-ram-size");
 
-    for (i = 0; i < sc->wdts_num; i++) {
-        snprintf(typename, sizeof(typename), "aspeed.wdt-%s", socname);
-        object_initialize_child(obj, "wdt[*]", &s->wdt[i], typename);
-    }
-
     for (i = 0; i < sc->macs_num; i++) {
         object_initialize_child(obj, "ftgmac100[*]", &s->ftgmac100[i],
                                 TYPE_FTGMAC100);
@@ -290,6 +290,19 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->timerctrl), i, irq);
     }
 
+    /* Watch dog */
+    for (i = 0; i < sc->wdts_num; i++) {
+        AspeedWDTClass *awc = ASPEED_WDT_GET_CLASS(&s->wdt[i]);
+
+        object_property_set_link(OBJECT(&s->wdt[i]), "scu", OBJECT(&s->scu),
+                                 &error_abort);
+        if (!sysbus_realize(SYS_BUS_DEVICE(&s->wdt[i]), errp)) {
+            return;
+        }
+        sysbus_mmio_map(SYS_BUS_DEVICE(&s->wdt[i]), 0,
+                        sc->memmap[ASPEED_DEV_WDT] + i * awc->offset);
+    }
+
     /* ADC */
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->adc), errp)) {
         return;
@@ -354,19 +367,6 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
     }
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->sdmc), 0, sc->memmap[ASPEED_DEV_SDMC]);
 
-    /* Watch dog */
-    for (i = 0; i < sc->wdts_num; i++) {
-        AspeedWDTClass *awc = ASPEED_WDT_GET_CLASS(&s->wdt[i]);
-
-        object_property_set_link(OBJECT(&s->wdt[i]), "scu", OBJECT(&s->scu),
-                                 &error_abort);
-        if (!sysbus_realize(SYS_BUS_DEVICE(&s->wdt[i]), errp)) {
-            return;
-        }
-        sysbus_mmio_map(SYS_BUS_DEVICE(&s->wdt[i]), 0,
-                        sc->memmap[ASPEED_DEV_WDT] + i * awc->offset);
-    }
-
     /* Net */
     for (i = 0; i < sc->macs_num; i++) {
         object_property_set_bool(OBJECT(&s->ftgmac100[i]), "aspeed", true,
-- 
2.31.1


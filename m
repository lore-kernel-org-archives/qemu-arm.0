Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp503349wrs;
        Fri, 16 Aug 2019 01:10:56 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx9kw3kksCZEqgNiomr8qnCrylHurn3n2fCct4yXiBy3pt4PtCTilDiYSb93P/6qdRlfrOH
X-Received: by 2002:a50:da88:: with SMTP id q8mr9517830edj.111.1565943055974;
        Fri, 16 Aug 2019 01:10:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565943055; cv=none;
        d=google.com; s=arc-20160816;
        b=WaVAZazJnUmXkL5Ms8XTv/FZlFmPswDoJwGTlJK+mj2d9vThnEhDLm6F3sl5vEthDy
         Q++QmyF8ldoWPu3u200oowAY5SMnw86H8eHttoFS+fNXgoQ+CfEiANx3l5tuoCSpruz2
         ulizUhAvXLNRJ1ajjEQ1paZ1RCa0+h4Xh5bpyt0ouXhrOU63NO6tCr4lgNIAiCOdFgZ2
         dnA4sLZj+1sI9JUydeqE/feoi/4KSu9brbETfEYLJd8WAumetgddq9bYJoEdWqVk7YkM
         fDwXiSAKWp5WsV/luxcIjYIOhwzGIqiPbrZKfReA6tBZc3w53G/nDhD7bxY1o1lIN9UZ
         FX4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:to:from:message-id:dkim-signature;
        bh=liE1j/Zol6+iNfvIahfwyCDPl81txWL0rqUSyiJt5Ag=;
        b=QeSTvxFxQqM0bHE1iC9HCxpMmjh8gNPskDo2Zk7Fp3iMo7lEuPxCUvoCJ67OfvcQGr
         cxIhL+7C7MeEYia4OTrHf01ICm4mIgvdxDnC6uvkDmMgSqHqHJyuNoSYyp3e11BTHYJf
         lf4VZ/tYfu3YqXfkV16bGW7YHxUQDkJ5IHOUkLz0itA7gnZLGHXf4V0a8bvLauMlQa7G
         ri9calCySZjxCcSZ85UnrI5xE0MXa1EgbPl6F4fcv7TZ9W27Ec1wX0ZqEGe9wHDtj/5G
         knQ3Hl6b0jMCaynRBUWnsS6iDbjx0HvLp4bY6ERSgnL23zg69vuEk3c9En0rwIQL6drH
         IqkQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=SRUMwcyO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id of22si2665839ejb.113.2019.08.16.01.10.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Aug 2019 01:10:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=SRUMwcyO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:51422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hyXK2-0003hm-NY
	for alex.bennee@linaro.org; Fri, 16 Aug 2019 04:10:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41612)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <rashmica.g@gmail.com>) id 1hyWqa-0006C5-EB
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 03:40:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <rashmica.g@gmail.com>) id 1hyWqZ-0004Je-3j
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 03:40:28 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:35998)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <rashmica.g@gmail.com>)
 id 1hyWqY-0004JC-ST; Fri, 16 Aug 2019 03:40:27 -0400
Received: by mail-pg1-x543.google.com with SMTP id l21so2536743pgm.3;
 Fri, 16 Aug 2019 00:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=liE1j/Zol6+iNfvIahfwyCDPl81txWL0rqUSyiJt5Ag=;
 b=SRUMwcyO67FKXC16gAxwIssSkI/dN+xgETJ+7mfBnQovNFX5M7nYQ6x7UhN9aKg1vO
 n1RCoLEY1HsZukxY89VuS/iOvlUgERSMkM9El7/mVkfK+tGu093uHneM26ClP4AhkHQV
 fgFLQvSTneQjlBWIxAGNXdT56PbtibHPiaXSyK0HIxekZcRf95fuemGathTw9op5FHOg
 ORtXYQ70fy2hibxGVqeSTh8/HTyvqEEmy1lPkA2oHdOMhkmUfKDHtpkIhl35watAKAf2
 smXMwoBxTCkN83KXFoVZtW8nD2vCmuWotVghWyoVLL8dJFQ8sv9wivb33tH2j1U+KKz6
 e7kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=liE1j/Zol6+iNfvIahfwyCDPl81txWL0rqUSyiJt5Ag=;
 b=dGGFQWe/YsISMYUgOcm19EImkSLQF2bzkqnKsnV8afWzJ4hzxXPvq+Ao4+avc2j6s8
 /S5THi0qSWS13MafdBQzcPniaLTItLOFign4Qu3/OiAvq3xB4YoJ6/e97jSOTPEpZmB3
 SISjGWIpXUJXLnj1PRzpM0bvG00zEIG2mCZ+jEKoRjznPp5BcNrJPh/c/tP7F+HOBPmi
 3gDXE7UV4cfc04Lo/VMmYIIFIrmJtEXtG018MLcvlRtUdj7uWfGoM4Z/9OYlx1KTmv7T
 oAif3TACOLsMaQng3VHfHRfQLrMy2UQY1oYsKzGk2tvf4qLn9oaJGLtqNaVF+zwwoaEQ
 AJZA==
X-Gm-Message-State: APjAAAVZMRV+I9OS32DBZR9Sd81EMkZxQjHBNyrcFZnN+ZIGmv8T8AKJ
 hG+Pre78OVKUo2pgh6AFUvw=
X-Received: by 2002:a62:4e09:: with SMTP id c9mr9835815pfb.130.1565941225774; 
 Fri, 16 Aug 2019 00:40:25 -0700 (PDT)
Received: from rashmica.ozlabs.ibm.com ([122.99.82.10])
 by smtp.googlemail.com with ESMTPSA id m4sm5607970pgs.71.2019.08.16.00.40.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Aug 2019 00:40:25 -0700 (PDT)
Message-ID: <4d0aad7fa699a82bcbecb532551827c30c4c0f3d.camel@gmail.com>
From: Rashmica Gupta <rashmica.g@gmail.com>
To: clg@kaod.org
Date: Fri, 16 Aug 2019 17:40:19 +1000
In-Reply-To: <20190816073229.22787-3-rashmica.g@gmail.com>
References: <20190816073229.22787-1-rashmica.g@gmail.com>
 <20190816073229.22787-3-rashmica.g@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::543
Subject: Re: [Qemu-devel] [PATCH v5 2/3] aspeed: add a GPIO controller to
 the SoC
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, andrew@aj.id.au, qemu-devel@nongnu.org,
 aik@ozlabs.ru, qemu-arm@nongnu.org, joel@jms.id.au
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: n3P+GjJcJIUv

Cédric, this is how I thought changes to the SOC for your aspeed-4.1
branch would look


From 13a07834476fa266c352d9a075b341c483b2edf9 Mon Sep 17 00:00:00 2001
From: Rashmica Gupta <rashmica.g@gmail.com>
Date: Fri, 16 Aug 2019 15:18:22 +1000
Subject: [PATCH] Aspeed SOC changes

---
 include/hw/arm/aspeed_soc.h |  4 +++-
 hw/arm/aspeed_soc.c         | 32 ++++++++++++++++++++++----------
 2 files changed, 25 insertions(+), 11 deletions(-)

diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index 8673661de8..f375271d5a 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -28,6 +28,7 @@
 #define ASPEED_WDTS_NUM  3
 #define ASPEED_CPUS_NUM  2
 #define ASPEED_MACS_NUM  2
+#define ASPEED_GPIOS_NUM  2
 
 typedef struct AspeedSoCState {
     /*< private >*/
@@ -48,7 +49,7 @@ typedef struct AspeedSoCState {
     AspeedSDMCState sdmc;
     AspeedWDTState wdt[ASPEED_WDTS_NUM];
     FTGMAC100State ftgmac100[ASPEED_MACS_NUM];
-    AspeedGPIOState gpio;
+    AspeedGPIOState gpio[ASPEED_GPIOS_NUM];
 } AspeedSoCState;
 
 #define TYPE_ASPEED_SOC "aspeed-soc"
@@ -61,6 +62,7 @@ typedef struct AspeedSoCInfo {
     uint64_t sram_size;
     int spis_num;
     int wdts_num;
+    int gpios_num;
     const int *irqmap;
     const hwaddr *memmap;
     uint32_t num_cpus;
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 7d47647016..414b99c4f3 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -119,6 +119,7 @@ static const AspeedSoCInfo aspeed_socs[] = {
         .sram_size    = 0x8000,
         .spis_num     = 1,
         .wdts_num     = 2,
+        .gpios_num    = 1,
         .irqmap       = aspeed_soc_ast2400_irqmap,
         .memmap       = aspeed_soc_ast2400_memmap,
         .num_cpus     = 1,
@@ -132,6 +133,7 @@ static const AspeedSoCInfo aspeed_socs[] = {
         .irqmap       = aspeed_soc_ast2500_irqmap,
         .memmap       = aspeed_soc_ast2500_memmap,
         .num_cpus     = 1,
+        .gpios_num    = 1,
     },
 };
 
@@ -226,9 +228,15 @@ static void aspeed_soc_init(Object *obj)
     sysbus_init_child_obj(obj, "xdma", OBJECT(&s->xdma), sizeof(s-
>xdma),
                           TYPE_ASPEED_XDMA);
 
-    snprintf(typename, sizeof(typename), "aspeed.gpio-%s", socname);
-    sysbus_init_child_obj(obj, "gpio", OBJECT(&s->gpio), sizeof(s-
>gpio),
-                          typename);
+    for (i = 0; i < sc->info->gpios_num; i++) {
+        if (ASPEED_IS_AST2600(sc->info->silicon_rev)) {
+            snprintf(typename, sizeof(typename), "aspeed.gpio%d-%s",
i, socname);
+        } else {
+            snprintf(typename, sizeof(typename), "aspeed.gpio-%s",
socname);
+        }
+        sysbus_init_child_obj(obj, "gpio[*]", OBJECT(&s->gpio[i]),
sizeof(s->gpio[i]),
+                               typename);
+    }
 }
 
 static void aspeed_soc_realize(DeviceState *dev, Error **errp)
@@ -410,15 +418,19 @@ static void aspeed_soc_realize(DeviceState *dev,
Error **errp)
                        aspeed_soc_get_irq(s, ASPEED_XDMA));
 
     /* GPIO */
-    object_property_set_bool(OBJECT(&s->gpio), true, "realized",
&err);
-    if (err) {
-        error_propagate(errp, err);
-        return;
+    for (i = 0; i < sc->info->gpios_num; i++) {
+        hwaddr addr =  sc->info->memmap[ASPEED_GPIO] + i * 0x800;
+        object_property_set_bool(OBJECT(&s->gpio[i]), true,
"realized", &err);
+        if (err) {
+            error_propagate(errp, err);
+            return;
+        }
+        sysbus_mmio_map(SYS_BUS_DEVICE(&s->gpio[i]), 0, addr);
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->gpio[i]), 0,
+                           aspeed_soc_get_irq(s, ASPEED_GPIO));
     }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->gpio), 0, sc->info-
>memmap[ASPEED_GPIO]);
-    sysbus_connect_irq(SYS_BUS_DEVICE(&s->gpio), 0,
-                       aspeed_soc_get_irq(s, ASPEED_GPIO));
 }
+
 static Property aspeed_soc_properties[] = {
     DEFINE_PROP_UINT32("num-cpus", AspeedSoCState, num_cpus, 0),
     DEFINE_PROP_END_OF_LIST(),
-- 
2.20.1


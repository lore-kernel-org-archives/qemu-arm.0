Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp3731588wrv;
        Sun, 14 Jul 2019 23:19:49 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwHcbVEMENaqOSIFMdGfzSGFkKO1dwL3nquVGc8CEfWYoRDj2P+PfdoaLZIn1IliIGHOrIF
X-Received: by 2002:a17:906:8053:: with SMTP id x19mr18729151ejw.306.1563171589199;
        Sun, 14 Jul 2019 23:19:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563171589; cv=none;
        d=google.com; s=arc-20160816;
        b=CmLzIS2suo8gKV4jPULugRirm4TX6iHWLKGK4OLxq7nn0LpQHdUzaQWxSFyLwUkBga
         osLUvErfKYP33qBtYb57HIeZFLkmEi9XaifgLC0YG3C7Ku4qetn60Jf+PIUJHNzKzoOr
         TExISZpuuqQiCzFGALRohU0STLWwKJGXXY0metqV1xeWEJZR/ngwIyQS3P/oZfZxA3so
         m9XNQjcci1faou4EGHvSzkhUa4ZZEWq6MKFQj2ihALtXFe6BdjfzDv+7TGGo335Ag0tk
         hnnUkaGs5yCmthuNeooGAns5bbvk3Yg5K6DknMArYTSb3QwHxdaCPVL7PHbXT7BcdpzP
         5O0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=lBGGTqXH/nhd6kXXGRtBAmp2V+9X81H4xeVXysgM8vc=;
        b=k7irGXIdi5t5WgMphprTRaJyVcF5MFPKEmaEoUwFILvT3z8DcFUMYBKsnCA9kJymho
         DZVxLle2TEw0vB/4ixwh/ui0kj5ve4092Xp+v6nfElhb71sw/RCtwE9qMXAXq4LOu2vy
         ZPrfRGZ9XCgl9TztMrh59UTpiJ4ZTUc2CAutxSrBngN2PnnqKVy4LzGAHI9EJukBsvfO
         HjI5mIBFSOKhuYB4KoZ20sral2U1vqUwAf+UPcJlrIfbUBnZY8C3Mj7hcs4MFppy6YI4
         GiLI3QhlXV/8V7lR1b+8f/Af628k9KsfCw3cdzf0UYoTLZ6ftJOA2zyUF3vbpfd8Pb5c
         J4Qw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="vQ4s/thr";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w41si9685348eda.9.2019.07.14.23.19.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 14 Jul 2019 23:19:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="vQ4s/thr";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:35416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hmuKy-00013z-3g
	for alex.bennee@linaro.org; Mon, 15 Jul 2019 02:19:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42001)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <rashmica.g@gmail.com>) id 1hmuKt-0000ud-Lu
 for qemu-arm@nongnu.org; Mon, 15 Jul 2019 02:19:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <rashmica.g@gmail.com>) id 1hmuKs-00025V-Fj
 for qemu-arm@nongnu.org; Mon, 15 Jul 2019 02:19:43 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:33063)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <rashmica.g@gmail.com>)
 id 1hmuKs-00025D-9m; Mon, 15 Jul 2019 02:19:42 -0400
Received: by mail-pg1-x541.google.com with SMTP id m4so7200947pgk.0;
 Sun, 14 Jul 2019 23:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lBGGTqXH/nhd6kXXGRtBAmp2V+9X81H4xeVXysgM8vc=;
 b=vQ4s/throNEE+NOHhKSbLCa1ZmLiqj6ajqSYL8zMkEHg+jzuNmgdbiitlZ48Na9loJ
 pRytoSlhu+D0UM9ZRypDB7UOwoBYt3OuDuemogDIJkZii/tGsozrT0WX8/2f2VS2Qw2L
 RkeWmDPvk+LDm/j/nLdAVEbBUTaNSPNvhiV0HaX10+Crq01PTmjM6OmRYMM83E2rs6vT
 v7VpWpLy/IdGL3NzI9LsX/y4xmGvViUGa1vHwKbOv44cI55padV8DNS41lZ8hG0A/0cC
 RKRG7BaOG4z/G4nVccGtGTPnns72WRBwfH+R4SYfdaPsBSH9iOJW3HwZEnxgL3v6bf8k
 qhPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lBGGTqXH/nhd6kXXGRtBAmp2V+9X81H4xeVXysgM8vc=;
 b=jkvV2XXGDjiQd8TKlkAXfmSzVajBVmqtefuVFJzprY45pco+zyxpdWfAcOxp8kdz9G
 DghSAFNGsbA59hYSx1WVkkKCx1Ffsw/qn8wRUwGV/NwNxLegPIN5ytLmhY0GQ5Ahu5Sv
 9Jl7G9EoBdAKHpYFGQm0JKbUNXODOkvCacFsDhUo6GLPn2tN+8VElRWirY9vRX5kjIpG
 aM43VGwvsjtVtAhAfKEQ1kGpUG5xJVV7B3nou1zUJqetiLZpNNS4Yhpjirr7YObuXLQa
 2iq1bc0ss7LbEqfO+tGPp9599ITPeUIaLjkJ0O+yxfmK+FhOg2ey/x4UqUEnvL+tGG9E
 jvfw==
X-Gm-Message-State: APjAAAX0YGV4E5oGyL3xHNXWai64NGdyJSJLw1oerSSVOEHW8AYl6xuI
 sSwzG17yxIzsyBMAECBHgDfjarcL
X-Received: by 2002:a65:458d:: with SMTP id o13mr24881801pgq.34.1563171581229; 
 Sun, 14 Jul 2019 23:19:41 -0700 (PDT)
Received: from rashmica.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id 4sm20020018pfc.92.2019.07.14.23.19.38
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 14 Jul 2019 23:19:40 -0700 (PDT)
From: Rashmica Gupta <rashmica.g@gmail.com>
To: qemu-arm@nongnu.org
Date: Mon, 15 Jul 2019 16:19:25 +1000
Message-Id: <20190715061925.28030-3-rashmica.g@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190715061925.28030-1-rashmica.g@gmail.com>
References: <20190715061925.28030-1-rashmica.g@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
Subject: [Qemu-arm] [PATCH 2/2] aspeed: add a GPIO controller to the SoC
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
Cc: peter.maydell@linaro.org, andrew@aj.id.au, qemu-devel@nongnu.org,
 clg@kaod.org, Rashmica Gupta <rashmica.g@gmail.com>, joel@jms.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nzUqLWpsAJXz

Signed-off-by: Rashmica Gupta <rashmica.g@gmail.com>
---
 hw/arm/aspeed_soc.c         | 17 +++++++++++++++++
 include/hw/arm/aspeed_soc.h |  3 +++
 2 files changed, 20 insertions(+)

diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index c6fb3700f2..ff422c8ad1 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -124,6 +124,7 @@ static const AspeedSoCInfo aspeed_socs[] = {
         .spis_num     = 1,
         .fmc_typename = "aspeed.smc.fmc",
         .spi_typename = aspeed_soc_ast2400_typenames,
+        .gpio_typename = "aspeed.gpio-ast2400",
         .wdts_num     = 2,
         .irqmap       = aspeed_soc_ast2400_irqmap,
         .memmap       = aspeed_soc_ast2400_memmap,
@@ -136,6 +137,7 @@ static const AspeedSoCInfo aspeed_socs[] = {
         .spis_num     = 1,
         .fmc_typename = "aspeed.smc.fmc",
         .spi_typename = aspeed_soc_ast2400_typenames,
+        .gpio_typename = "aspeed.gpio-ast2400",
         .wdts_num     = 2,
         .irqmap       = aspeed_soc_ast2400_irqmap,
         .memmap       = aspeed_soc_ast2400_memmap,
@@ -148,6 +150,7 @@ static const AspeedSoCInfo aspeed_socs[] = {
         .spis_num     = 1,
         .fmc_typename = "aspeed.smc.fmc",
         .spi_typename = aspeed_soc_ast2400_typenames,
+        .gpio_typename = "aspeed.gpio-ast2400",
         .wdts_num     = 2,
         .irqmap       = aspeed_soc_ast2400_irqmap,
         .memmap       = aspeed_soc_ast2400_memmap,
@@ -160,6 +163,7 @@ static const AspeedSoCInfo aspeed_socs[] = {
         .spis_num     = 2,
         .fmc_typename = "aspeed.smc.ast2500-fmc",
         .spi_typename = aspeed_soc_ast2500_typenames,
+        .gpio_typename = "aspeed.gpio-ast2500",
         .wdts_num     = 3,
         .irqmap       = aspeed_soc_ast2500_irqmap,
         .memmap       = aspeed_soc_ast2500_memmap,
@@ -246,6 +250,9 @@ static void aspeed_soc_init(Object *obj)
 
     sysbus_init_child_obj(obj, "xdma", OBJECT(&s->xdma), sizeof(s->xdma),
                           TYPE_ASPEED_XDMA);
+
+    sysbus_init_child_obj(obj, "gpio", OBJECT(&s->gpio), sizeof(s->gpio),
+                          sc->info->gpio_typename);
 }
 
 static void aspeed_soc_realize(DeviceState *dev, Error **errp)
@@ -425,6 +432,16 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
                     sc->info->memmap[ASPEED_XDMA]);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->xdma), 0,
                        aspeed_soc_get_irq(s, ASPEED_XDMA));
+
+    /* GPIO */
+    object_property_set_bool(OBJECT(&s->gpio), true, "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->gpio), 0, sc->info->memmap[ASPEED_GPIO]);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->gpio), 0,
+                       aspeed_soc_get_irq(s, ASPEED_GPIO));
 }
 static Property aspeed_soc_properties[] = {
     DEFINE_PROP_UINT32("num-cpus", AspeedSoCState, num_cpus, 0),
diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index cef605ad6b..fa04abddd8 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -22,6 +22,7 @@
 #include "hw/ssi/aspeed_smc.h"
 #include "hw/watchdog/wdt_aspeed.h"
 #include "hw/net/ftgmac100.h"
+#include "hw/gpio/aspeed_gpio.h"
 
 #define ASPEED_SPIS_NUM  2
 #define ASPEED_WDTS_NUM  3
@@ -47,6 +48,7 @@ typedef struct AspeedSoCState {
     AspeedSDMCState sdmc;
     AspeedWDTState wdt[ASPEED_WDTS_NUM];
     FTGMAC100State ftgmac100[ASPEED_MACS_NUM];
+    AspeedGPIOState gpio;
 } AspeedSoCState;
 
 #define TYPE_ASPEED_SOC "aspeed-soc"
@@ -60,6 +62,7 @@ typedef struct AspeedSoCInfo {
     int spis_num;
     const char *fmc_typename;
     const char **spi_typename;
+    const char *gpio_typename;
     int wdts_num;
     const int *irqmap;
     const hwaddr *memmap;
-- 
2.20.1


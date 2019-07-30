Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp3958917wrv;
        Mon, 29 Jul 2019 22:45:30 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwd/6z3Lst94V8ZVXhKNQtruz1bpLdxUgKVPbkX7izEKamFnVoAgCH5lMD2HAP8QLXqtoRc
X-Received: by 2002:a17:906:a98b:: with SMTP id jr11mr85909028ejb.224.1564465530560;
        Mon, 29 Jul 2019 22:45:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564465530; cv=none;
        d=google.com; s=arc-20160816;
        b=CWl1KlDR6vSfNPnNyg8kTZrUgCpjeJHq+0N4PzbAaNJh5c0eW2iJJSkyCIa+xG3zfJ
         AJfQDWFbm+aLYReFfu4YokbtreVpr8g6n6JjtPd1OrGU1j8t+kKYB4w0xuGHs8A8IeJ0
         PDMktnbh5hHL/m2unsnS8k8JJ+JqlJ9EaOOFWlhnhWnjg8U9oTg5cLNtBA7I45jprpac
         b8SdF+Y5BD3VXI6zpakHlXHoioOzHbbM8jndqIeZuvtpSrShNveI0lGT7zY7EdilS1BK
         FqroPslrKDoivAyDsSWfP3GAC8yTBG0pTM9GB8KYAmXG65FS+v3UjR/xS6jdMgHZ150t
         lEgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=lBGGTqXH/nhd6kXXGRtBAmp2V+9X81H4xeVXysgM8vc=;
        b=RnfBWKHJX5aHFbNcQKIQsKJCdS/zJ9XmFzSJw4+fIILesIbR6/rE7xLulxVYqtvVaC
         9Iw+sah7owQIHYkBeVGjJXb+6b2h4D0fq9tgihXcMCf9gM0gW0Lc3SrXKyl7ivnJFhqs
         5E6IDs7M32K+hsX2qRVTJDxBVhHyqQRyZR20H19nPCyiHoPqqUdoQ+W5MVZwcawQJAZg
         ZLL4jx/Dopr9aXIs5zXyY4xGBOdgalOTP98syrbuTiYZWUIqxhvsm5WTWozoVJaX7F19
         6weJjAbZrLcPESuWBb1ckDEIpSXiF9Zehf5iN6Xb60wRaGbqBeNbW7KzPIy92+DvH9VG
         BPXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=fRc3PSOq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h44si18855376eda.49.2019.07.29.22.45.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Jul 2019 22:45:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=fRc3PSOq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:58080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hsKwz-0002Dv-Kl
	for alex.bennee@linaro.org; Tue, 30 Jul 2019 01:45:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49353)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <rashmica.g@gmail.com>) id 1hsKwq-0002AH-Lz
 for qemu-arm@nongnu.org; Tue, 30 Jul 2019 01:45:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <rashmica.g@gmail.com>) id 1hsKwp-0002lY-HM
 for qemu-arm@nongnu.org; Tue, 30 Jul 2019 01:45:20 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:36057)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <rashmica.g@gmail.com>)
 id 1hsKwp-0002l8-AY; Tue, 30 Jul 2019 01:45:19 -0400
Received: by mail-pl1-x643.google.com with SMTP id k8so28446294plt.3;
 Mon, 29 Jul 2019 22:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lBGGTqXH/nhd6kXXGRtBAmp2V+9X81H4xeVXysgM8vc=;
 b=fRc3PSOqfSXfSWV1hindbmUllwI0YjM3yWKapvdpNdfYzbvKtwuIfaOAOtuuMirVfy
 dgbB5cBJL0kcjyKtk5TtlkPgzlCzr1yUEVxAW3lX3x3U4Ws++sFFKXw4hvyWF5veEroY
 XJrmgRLdfxnACTQTFzfnHtA5RMTdacBFpWCBPJPwriJsdpeK7OJs+3Z+SLZt6Cyiaa6P
 4kPx/1qIsk5IcFgVrOP891PvN8Gf/0me++JaeoMZHRFBvKWm32cIz2MippX2/S9CEKXC
 aOk9aBUmrFvsS4XkQApd5HvXPnUkrUj/QPo9bGh3Wr/axMW+DTBJaadVVLzH82HEPO0S
 962g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lBGGTqXH/nhd6kXXGRtBAmp2V+9X81H4xeVXysgM8vc=;
 b=ntPM/J3QYurHxCeUWHl78MhifBgsEHfx8AXyf/iJ6/N34wV9MO59A45Qlos2OphPuB
 89ADcCcxtJ6VKFtZRq4utuoVHcYEsvkp3PZzNVIzBcIKpeM2u0QVQyzN3PbVknHnD6AV
 CSsePmgSag4IInbaFUBMPA7Ip1GR/y/lG3xUOLk4LpAMEOP2ms01DUakiGrxSWJb5T4G
 Sxb18fITV5LCXCsoAhtaxbaasf/AjOHX1lSd83GslQUPu0DHoGkd5oq4NScXqUgtXbTF
 Sgn3X2yoX/jmW4U4cVan28PYGIBwwZI4X8Y7i7vZ6j9CwM3huUPxnGqBNF3HP0k9qwGX
 Qlpg==
X-Gm-Message-State: APjAAAXzyUSsP7BnFY8z6SUrzYQrW/bgjuSWJoiNGkQuZYEuKSo0UTA7
 Ww3nVL0sPREUzcFXmuhp24E=
X-Received: by 2002:a17:902:e20c:: with SMTP id
 ce12mr117403746plb.130.1564465518542; 
 Mon, 29 Jul 2019 22:45:18 -0700 (PDT)
Received: from rashmica.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id 81sm99171221pfx.111.2019.07.29.22.45.15
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 29 Jul 2019 22:45:18 -0700 (PDT)
From: Rashmica Gupta <rashmica.g@gmail.com>
To: peter.maydell@linaro.org
Date: Tue, 30 Jul 2019 15:45:00 +1000
Message-Id: <20190730054501.32727-3-rashmica.g@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190730054501.32727-1-rashmica.g@gmail.com>
References: <20190730054501.32727-1-rashmica.g@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::643
Subject: [Qemu-arm] [PATCH v3 2/3] aspeed: add a GPIO controller to the SoC
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
Cc: andrew@aj.id.au, qemu-devel@nongnu.org, qemu-arm@nongnu.org, joel@jms.id.au,
 Rashmica Gupta <rashmica.g@gmail.com>, clg@kaod.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4Tp3Cwo0pKlq

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


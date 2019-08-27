Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp4721837wrs;
        Mon, 26 Aug 2019 21:03:59 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxTrDV2f3p7842eDNYF40buiKmOSxKOx2rnECV+jEH7IgmY5V56Q0xHvmlsDl8K5i673nzj
X-Received: by 2002:a50:a5dd:: with SMTP id b29mr22300456edc.34.1566878639469;
        Mon, 26 Aug 2019 21:03:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566878639; cv=none;
        d=google.com; s=arc-20160816;
        b=bt6k0pskn6XPnYEgNza0LX5W+iZh7SYjbWQWlMR9O01ovmkSvWB/WAKZDovWflRPYY
         i+G1/N6h2YwbFvi1IO/lKVNYb550lnCBhn2r0uASk21FH6+ABTvRdFLBXVSOquPONiTS
         QtJ00d1EiiJFr8ZVXUu7D8dKMhxuZXL8BPrMMK56yFdn0bMxaRaSOVP1HRbyx/1M1EHx
         mKNdBMoNYjae4gBpdd+/R2aGWJQqTkCwNhJHr31bH9JKB4D2tGdMmNKOcONM1qFsdees
         T4a87OvpYe6QTzbCJHAiTBJj08Wurs8PivFjciwwRSI0ZrMnkg4Xxhiw9V5uo1TtE169
         5noA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=GJqcqRpxwf/KXzpRUCuBPWefogmRRREDYuiipZvtjSs=;
        b=KTrtF8BUU9nnQ1CYJriiTZ8gzdyTA+6BKtKKYl19/ZwFqY8knOIZYLAmFcawgzyDzE
         uVHlwj50MTlRJ87tmFs0U4cN8VRVz3WiK9+fEYbwSBcNw+hqDrX4jMuH1c+lmj6SN/QX
         EIDGaqbKjxoh1mQQ33ml0xUVMPoyLJpymKD550tRZUUjiGf9CkBeEzYpt7DdasPN6HNy
         mth0mJdm5cNdzczHJ6ZDnAvWC6hxZ6CXRHLeOkwg6YDmu6Jax+P7Il7qcFRmB+PzTYja
         pAopB+ixfQQGJeH42z0FxcuBdHvDxeKR+qhWR6XFHNrHANr8DW9ROAyzCIGN4A8aRVM3
         9p5g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=u2urdrjA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g20si8287477edg.239.2019.08.26.21.03.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Aug 2019 21:03:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=u2urdrjA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:46336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i2Si5-00059J-OI
	for alex.bennee@linaro.org; Tue, 27 Aug 2019 00:03:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59020)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <rashmica.g@gmail.com>) id 1i2Sfm-0002rG-6s
 for qemu-arm@nongnu.org; Tue, 27 Aug 2019 00:01:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <rashmica.g@gmail.com>) id 1i2Sfk-0005BE-Sy
 for qemu-arm@nongnu.org; Tue, 27 Aug 2019 00:01:34 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:33142)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <rashmica.g@gmail.com>)
 id 1i2Sfk-0005B7-MY; Tue, 27 Aug 2019 00:01:32 -0400
Received: by mail-pg1-x541.google.com with SMTP id n190so11866887pgn.0;
 Mon, 26 Aug 2019 21:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GJqcqRpxwf/KXzpRUCuBPWefogmRRREDYuiipZvtjSs=;
 b=u2urdrjABPeGXxgyAJY42jPdHfNlRegSfHsvzfbCv9cM1UJv2WXd4wPw5j9QG5meHy
 FGuTe3TS1WG7d+jLHf0wojmd/2adZJOIMz4HRrF9W3A2kc4PC4Pu2BQ9vT8EB0UIPWg+
 KZcGr/A+VHIsR5+XDnfEnGz+XdR8CmeuaVh205t2LrP/3Amplm8Uz1I4ZdeuMiXrDeJv
 gUPyefD6EqqqbXHNSBP6CIFs9sRS/tP5jBi1vEvtoVyZy/1OlFRBR/w/9EH4d6kcGx9d
 /VFw/8cODBbYmSdQtxlCY7p7ZuJKUF1OzesijeXLpQ7ipg7n/dcgO2Wd2KfmOjuf5nKO
 4jVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GJqcqRpxwf/KXzpRUCuBPWefogmRRREDYuiipZvtjSs=;
 b=N14+hKHmaTZZQXYNwDtG32+EctpxHXE0vek+9TCLPJiyl3rCkvWQ9CQVaCsP8ame0l
 CG9rtZiNT576Msho3kIZ9NjI3HtLE+2g63fT+xJWjGe7GYxxPl1Dyn+2wJxaswRyuPtk
 v+Mt3STCMOdiAQjiwaTEtwGAZkGMXYuVga3K+BNEmN0TnEgAn71QWhJOrX1aD4Rz/iM4
 bsQThc4+f+LVgE0VzefF2Ax8+pTx6+dmo/s1JSfjiVCiuUkaiCAXxo2TKIaNIttwvvx3
 oUV4mynU6b7fVMmkwT9Sv787XYFFcDfAMsrsp+93d6B/y2h0cyB2zYt+KyBpVBik7isQ
 0MgQ==
X-Gm-Message-State: APjAAAVX5tVuHBKL8PoJ38rutF/kIzdFVVYyNgJhhtEeecvicMNU65SS
 CB9yRj3lDNwxQr3XVeavYkBPF2s5F8o=
X-Received: by 2002:a63:5648:: with SMTP id g8mr19059014pgm.81.1566878491778; 
 Mon, 26 Aug 2019 21:01:31 -0700 (PDT)
Received: from rashmica.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id s11sm12004814pgv.13.2019.08.26.21.01.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Aug 2019 21:01:31 -0700 (PDT)
From: Rashmica Gupta <rashmica.g@gmail.com>
To: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Date: Tue, 27 Aug 2019 14:01:13 +1000
Message-Id: <20190827040114.23390-3-rashmica.g@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190827040114.23390-1-rashmica.g@gmail.com>
References: <20190827040114.23390-1-rashmica.g@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
Subject: [Qemu-arm] [PATCH v6 2/3] aspeed: add a GPIO controller to the SoC
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
Cc: andrew@aj.id.au, qemu-devel@nongnu.org, aik@ozlabs.ru, joel@jms.id.au,
 Rashmica Gupta <rashmica.g@gmail.com>, clg@kaod.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hsR6zMRjk6Ou

Signed-off-by: Rashmica Gupta <rashmica.g@gmail.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/arm/aspeed_soc.h |  3 +++
 hw/arm/aspeed_soc.c         | 17 +++++++++++++++++
 2 files changed, 20 insertions(+)

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
-- 
2.20.1


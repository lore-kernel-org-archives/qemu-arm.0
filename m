Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp480533wrs;
        Fri, 16 Aug 2019 00:40:11 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzvjdVIhhoXN/W9pPouxvz+LaeB4eGnLaxR50JtyHI/scdeFuxqhPMGvsmnl3aKoFJbY9Ag
X-Received: by 2002:a17:906:4d87:: with SMTP id s7mr8047057eju.155.1565941211310;
        Fri, 16 Aug 2019 00:40:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565941211; cv=none;
        d=google.com; s=arc-20160816;
        b=spMcWvoZc8gTAQsuI3FJcTFLDODEvREcLa/b0KnLuMNOnMATAIILJalnOZUchR/f7a
         NBHa9pPL7VR8FvLsn4M7cdQJPctXdqiemzXv8sq6Io6fYPqcf3aWTWcEuC7+EulgtCKG
         faVZisdMSPt01VmwG3HR5db5ZuY8T9BauiQ2J18MHtMYSQhRxp8MQlNXqRq6W4GmuySx
         4IoyyL/YjL+r7aoq7EM9RMmEayDewFhHL11GKtlunCqIPtz2Ut6CVZnI3amYDQeIWGUt
         nXK5Ygac3GMfS7KIx1YZ2hIdcBH0cXOcvuIVe7/a5xfD54JE+bSR3li3ss5fk0hT5Eo1
         nY3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=ljyF81NU6v4HO2LcgP50Xe8zeu9wLdfrnocnlpiypN4=;
        b=ycfndm2D0tpSvTC+USXaFAGyoCgJ4/tsLChsUftlrmheH8SYAg4ywlsXO7sCMvUPYU
         46H7CujWkdoKZ2Hr7fNlxb+W4EA48Qpe09EvDfRZXeahhDOnE/mNKzPrP8rWK9Gl6f7a
         S0vkUuZNyyuqW0tgLhX7dib/GynGhl5XsxBGznjChpnth3uIwBKxXj3E3heAbflPkK7k
         VP4/bZINB/QCZVYsd5osPNdPWtDj9Mq+DTD+U1ls+T9hvob/7vqXLfJ7sqBB+BULhkwL
         jok/9VGe9XWfBTbvpzzvEUfMmWtjaEekkarO2IJoAMi/hgWpfbBS9cA99f1pxa76gcTO
         m53A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="iSIXGw/G";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s26si3136149edi.158.2019.08.16.00.40.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Aug 2019 00:40:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="iSIXGw/G";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:50650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hyWqI-0004vc-7J
	for alex.bennee@linaro.org; Fri, 16 Aug 2019 03:40:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39183)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <rashmica.g@gmail.com>) id 1hyWk7-00079Q-7c
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 03:33:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <rashmica.g@gmail.com>) id 1hyWk5-0000W8-W1
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 03:33:47 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:43961)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <rashmica.g@gmail.com>)
 id 1hyWk3-0000UP-90; Fri, 16 Aug 2019 03:33:43 -0400
Received: by mail-pf1-x441.google.com with SMTP id v12so2691419pfn.10;
 Fri, 16 Aug 2019 00:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ljyF81NU6v4HO2LcgP50Xe8zeu9wLdfrnocnlpiypN4=;
 b=iSIXGw/GzXvi4uZPSjFDpJ1pYAQNOR/21h8SL8KG/Qcmj/2gYbJVL6dscnDOBlY3wA
 cE4y39LwPhdSvAktqq2ZPtkKV9cI6kXYDK2s+NofQL2zRekL+hgCnZVmdNUQwlIAMwjP
 CWtKuC3QBHFK/BhOMZePY0reaO9JJ9YhnNHQQ7OsDkdz1XcsLLDlNKn9Y0filHEb3vcv
 fmsX9q+xeF5vDPdtm5GtETqW8VwuUkXMQJycbQn3gur3GflipuKn00xqUilUR6ZYSBLP
 KHivZhRRN6v4szwpIQynPdjFneBFOnjrrtqdFqbOJilB6cRnN/ueCAoFGgL1dkRcqPqb
 BkmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ljyF81NU6v4HO2LcgP50Xe8zeu9wLdfrnocnlpiypN4=;
 b=V4UsrfNKpDLKXwqCnigveiOWKmF9IwY3GAyfsN7qWaVlf6N/hDPAvA1Yl0YcLIeU4j
 2Zu1iPpIZjFDjabYD0pXVrRe41QHQO+kVHXmIpcQ3CGcoagIJkV0LjypetmPjmjrf+40
 XgreJc2jwaU3bywaByQzhI370AibDdrJ7VO4+cbjtk81wV7098Psyw6UiJ5pBpa0qAT7
 FRM365sJBvBjpjjSic2fBAgAYpFfhYITiQuA9Dk2DvHidoHO+CzM7xoJ1F62FX+fan9C
 J23AhcFbKoe8BSsSYmwlieg8cBKZBYDm9OAr2GtySmUJwXoaYPGUzw6K/dQyVDt7YC0+
 ZwIA==
X-Gm-Message-State: APjAAAX2m2eQTnpe0Mi00D0J+kHd70FRW7iBu7ZoXYa5J4qX5e3AOM/K
 diu7HKFQQpd/yJ1GqZUazTg=
X-Received: by 2002:a65:6284:: with SMTP id f4mr6785723pgv.416.1565940822057; 
 Fri, 16 Aug 2019 00:33:42 -0700 (PDT)
Received: from rashmica.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id w129sm5638589pfd.89.2019.08.16.00.33.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Aug 2019 00:33:41 -0700 (PDT)
From: Rashmica Gupta <rashmica.g@gmail.com>
To: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Date: Fri, 16 Aug 2019 17:32:28 +1000
Message-Id: <20190816073229.22787-3-rashmica.g@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190816073229.22787-1-rashmica.g@gmail.com>
References: <20190816073229.22787-1-rashmica.g@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: [Qemu-devel] [PATCH v5 2/3] aspeed: add a GPIO controller to the SoC
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
Cc: andrew@aj.id.au, qemu-devel@nongnu.org, aik@ozlabs.ru, joel@jms.id.au,
 Rashmica Gupta <rashmica.g@gmail.com>, clg@kaod.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qCH705n928i3

Signed-off-by: Rashmica Gupta <rashmica.g@gmail.com>
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


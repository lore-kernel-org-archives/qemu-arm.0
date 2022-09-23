Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp180371ejy;
        Fri, 23 Sep 2022 01:48:32 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6j/HXTrZKBWFvUBeiwPdtRpTrpFigqtmB2QGPRgL9cdTpIrKeONuyGPyekvkS+VKbMzBYg
X-Received: by 2002:a17:90b:4b88:b0:202:e381:e643 with SMTP id lr8-20020a17090b4b8800b00202e381e643mr19681989pjb.148.1663922912104;
        Fri, 23 Sep 2022 01:48:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663922912; cv=none;
        d=google.com; s=arc-20160816;
        b=mbewILF68gzVBaBIN91M5IBLUbSvSUPhCeXvlqusSQGXfyLv5Eg3KXoN3HxqVzviaQ
         zqqsVaOXL/YXD4BHh1+pR+E1FET4LIcgsPIcldNxgp9Xh/FjNT0Zc7aeWq0uAHbHyeYu
         2am70MdSN4pusyxlK/nXsR9nYbrbKYlHY7yX+CYtlr+o9kf/ZiumcLK8EwujbC9cvDVC
         yD9bloQwV2o0x9SwhqC/tTlzQUifOCZalPj6ZwJJkcnKOQ/pUHzEZr7wgHhwUpwAizGD
         eKBeYM1nLEAJLBjZfOCi3ukCO8tMRbN+FllcUDcU2dNwx5OzQFhKzGR5BqMlSR/znKx0
         5ThQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=TQWn8mrtVFjJENhXAorL/DqvuvlarHTGGpamHd5hass=;
        b=aL1WXPZlVut6ijkdAmXV9DS4xhFgeyUDY6HA+efih7u6WyDEmSLd/vcb/Ju0G5Vm6Q
         qV96pJEBHkQU9QlqmJhGEOj39BPsPSxeNK1q/DR+d9WDQHbHMCOKeyDzbLxqyT1W7ulp
         uF/skJ0KmFlciN1cEry65QqjNeOpZBiwcG1pt6wW5J+ojKcc15ighYd9CPDOVhIWbNOT
         D//ag2dsJwmaclTBHmP+mP5+bcexmffLVIE0xzqd2TO38eJ1GlcAQby1Zzk5V3nvJrxj
         4+LX9y/77o6smhRF5v+PwYl0CgLOt/c8VMfdLi8+c57xStenbB97L5ZrBXz4nCHGbU+n
         QHAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of srs0=gbdq=z2=kaod.org=clg@ozlabs.org designates 2404:9400:2221:ea00::3 as permitted sender) smtp.mailfrom="SRS0=gbDQ=Z2=kaod.org=clg@ozlabs.org"
Return-Path: <SRS0=gbDQ=Z2=kaod.org=clg@ozlabs.org>
Received: from gandalf.ozlabs.org (mail.ozlabs.org. [2404:9400:2221:ea00::3])
        by mx.google.com with ESMTPS id h11-20020a056a00170b00b00539d5b84ef9si7750000pfc.177.2022.09.23.01.48.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Sep 2022 01:48:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of srs0=gbdq=z2=kaod.org=clg@ozlabs.org designates 2404:9400:2221:ea00::3 as permitted sender) client-ip=2404:9400:2221:ea00::3;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of srs0=gbdq=z2=kaod.org=clg@ozlabs.org designates 2404:9400:2221:ea00::3 as permitted sender) smtp.mailfrom="SRS0=gbDQ=Z2=kaod.org=clg@ozlabs.org"
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4MYm5V0lfpz4xGk;
	Fri, 23 Sep 2022 18:48:30 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MYm5R41mMz4x3w;
	Fri, 23 Sep 2022 18:48:27 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 6/6] aspeed/smc: Cache AspeedSMCClass
Date: Fri, 23 Sep 2022 10:48:03 +0200
Message-Id: <20220923084803.498337-7-clg@kaod.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220923084803.498337-1-clg@kaod.org>
References: <20220923084803.498337-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: XS17gSzWoUgU

Store a reference on the AspeedSMC class under the flash object and
use it when accessing the flash contents. Avoiding the class cast
checkers in these hot paths improves performance by 10% when running
the aspeed avocado tests.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/ssi/aspeed_smc.h | 2 ++
 hw/ssi/aspeed_smc.c         | 9 ++++-----
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
index 2d5f8f3d8f68..8e1dda556b91 100644
--- a/include/hw/ssi/aspeed_smc.h
+++ b/include/hw/ssi/aspeed_smc.h
@@ -30,6 +30,7 @@
 #include "qom/object.h"
 
 struct AspeedSMCState;
+struct AspeedSMCClass;
 
 #define TYPE_ASPEED_SMC_FLASH "aspeed.smc.flash"
 OBJECT_DECLARE_SIMPLE_TYPE(AspeedSMCFlash, ASPEED_SMC_FLASH)
@@ -37,6 +38,7 @@ struct AspeedSMCFlash {
     SysBusDevice parent_obj;
 
     struct AspeedSMCState *controller;
+    struct AspeedSMCClass *asc;
     uint8_t cs;
 
     MemoryRegion mmio;
diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index faed7e0cbe17..22df4be528a7 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -388,7 +388,7 @@ static inline int aspeed_smc_flash_cmd(const AspeedSMCFlash *fl)
 static inline int aspeed_smc_flash_addr_width(const AspeedSMCFlash *fl)
 {
     const AspeedSMCState *s = fl->controller;
-    AspeedSMCClass *asc = ASPEED_SMC_GET_CLASS(s);
+    AspeedSMCClass *asc = fl->asc;
 
     if (asc->addr_width) {
         return asc->addr_width(s);
@@ -420,7 +420,7 @@ static uint32_t aspeed_smc_check_segment_addr(const AspeedSMCFlash *fl,
                                               uint32_t addr)
 {
     const AspeedSMCState *s = fl->controller;
-    AspeedSMCClass *asc = ASPEED_SMC_GET_CLASS(s);
+    AspeedSMCClass *asc = fl->asc;
     AspeedSegments seg;
 
     asc->reg_to_segment(s, s->regs[R_SEG_ADDR0 + fl->cs], &seg);
@@ -1234,7 +1234,6 @@ static const TypeInfo aspeed_smc_info = {
 static void aspeed_smc_flash_realize(DeviceState *dev, Error **errp)
 {
     AspeedSMCFlash *s = ASPEED_SMC_FLASH(dev);
-    AspeedSMCClass *asc;
     g_autofree char *name = g_strdup_printf(TYPE_ASPEED_SMC_FLASH ".%d", s->cs);
 
     if (!s->controller) {
@@ -1242,14 +1241,14 @@ static void aspeed_smc_flash_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    asc = ASPEED_SMC_GET_CLASS(s->controller);
+    s->asc = ASPEED_SMC_GET_CLASS(s->controller);
 
     /*
      * Use the default segment value to size the memory region. This
      * can be changed by FW at runtime.
      */
     memory_region_init_io(&s->mmio, OBJECT(s), &aspeed_smc_flash_ops,
-                          s, name, asc->segments[s->cs].size);
+                          s, name, s->asc->segments[s->cs].size);
     sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->mmio);
 }
 
-- 
2.37.3

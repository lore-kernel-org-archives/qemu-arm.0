Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp4205256ejn;
        Tue, 25 Oct 2022 08:36:29 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4DDNPmIiEOx/8qVVG8iampAG/i+c1BVYguqi9LZ4UmXcVOEIUg/qADOMJLgSrxs3M6E/9u
X-Received: by 2002:ac8:5a15:0:b0:39c:ec2d:cc47 with SMTP id n21-20020ac85a15000000b0039cec2dcc47mr32010251qta.288.1666712178869;
        Tue, 25 Oct 2022 08:36:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666712178; cv=none;
        d=google.com; s=arc-20160816;
        b=pOn313Nq9l9LgOZqtnOXoV09l48WJKDD8QbVf/mkdsx3LAQhgXyZVf66Gbe1F3CuzH
         LPwrsI1Tn+Y0f98HtSX/DsYLl97xPsnSV/z39Mh3XKkiBDaySCebrJjbAGgZX/gHTTkZ
         tW0mkcEzRvqNxgydY7khyThvxW/ZxRj1jLh3KHNAIHWGvGKR+IQUcYhictD+K/gyWZgq
         yf3KzYqn7WWL5xud/+FGUq26eQ4GkgTSUZhblW1tz0k/1Hey14OtPR1W59Fc//x9Gush
         GDZ3/ddxBCqLJn7lPl6SYzvmEQbvKzre4H16/chiRQwCtJqs+0vSOgjzhlFtawBUfasL
         3JBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=rtVZIexPvhwkpCdZRZuRS9nPK637sa/TsGEN+cjnRy0=;
        b=EvaolcXcaBQgEb+rpaLdm1eqzo+QbuR4bAIAtjmjtU6B9afpmE+8ZdjYgdMkptMzxv
         Q3uVdax3nPR62ozcrAxGwB61+i9q7qJZFP2h29RWjSzn4Fn2ihFBVorIjp1oZxYv12VK
         Xx/jyREwjZAQPZsx3g0xyubrkGDwlJvmxtBsKlrgUFM2Asnqbl8YWPjXQwiwWTCYfF5j
         vKjK/2FYL82/PuCKtoVM6rS5CtSxueeWkkO3e0o4+nCsq+MJTU7sKuxCxSDwJqyDbEfD
         +UMaZbwIAk+E4sfOpFeIK0cTzN1aqvYwYvVIzoO4vUm4e9NqOi+tnu4poJy9rEO6QNvi
         VURw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a11-20020a0562140c2b00b004706ddc03a0si1925613qvd.278.2022.10.25.08.36.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Oct 2022 08:36:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1onLjv-0006l8-6Y; Tue, 25 Oct 2022 11:21:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=KVXu=22=kaod.org=clg@ozlabs.org>)
 id 1onLjq-0006Ye-5X; Tue, 25 Oct 2022 11:21:10 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=KVXu=22=kaod.org=clg@ozlabs.org>)
 id 1onLjo-0004mQ-AB; Tue, 25 Oct 2022 11:21:09 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4MxbHj26QFz4xMh;
 Wed, 26 Oct 2022 02:21:05 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4MxbHf5Kmmz4xGd;
 Wed, 26 Oct 2022 02:21:02 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-block@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 04/16] aspeed/smc: Cache AspeedSMCClass
Date: Tue, 25 Oct 2022 17:20:30 +0200
Message-Id: <20221025152042.278287-5-clg@kaod.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221025152042.278287-1-clg@kaod.org>
References: <20221025152042.278287-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=KVXu=22=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: "Qemu-arm" <qemu-arm-bounces@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: hDJV5yXOHdnW

Store a reference on the AspeedSMC class under the flash object and
use it when accessing the flash contents. Avoiding the class cast
checkers in these hot paths improves performance by 10% when running
the aspeed avocado tests.

Message-Id: <20220923084803.498337-7-clg@kaod.org>
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


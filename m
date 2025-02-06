Received: by 2002:a05:7022:3c17:b0:97:989a:5032 with SMTP id tu23csp669834dlb;
        Wed, 5 Feb 2025 17:35:56 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVFNP5Nv1Fefs5WDkzDhp/ssqVathXr7q/EP09CzySyU06TFXM2NdPk75EmP5tgx+xMfg6A3l2RKpwbIg==@linaro.org
X-Google-Smtp-Source: AGHT+IEcRn29C9hFXHU4A05r48xogiW9FThbJuEpxaM6HXbfWm56gF/61IvuPmuv3pS16p0HFFU+
X-Received: by 2002:a05:622a:90d:b0:467:597a:be4d with SMTP id d75a77b69052e-470281ba2a5mr88851881cf.18.1738805756285;
        Wed, 05 Feb 2025 17:35:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738805756; cv=none;
        d=google.com; s=arc-20240605;
        b=M8pbMhTocXmhC/vBZ4IR/0iNx9mWrSe4gTRMoo2Grjb1N/rohtfrUI92dKv0A1Akud
         KhlhKt1sPaz4rWs8iM/rx+qOi7UQqHm9qTZVh0YwKDGPTJdVV6hQFcX6wd1qZYjkNflp
         ME4Zwo010rJ/8qrkCshG/ivUM79RVXJ/bOUAodAGr6/3LdyJJSL8wRybGc6HjsZnOSoH
         VMkErwk3HPzXxeS59vKZw/7NFAdRGBVlL9VaNJHZAXEomBa2IFCzVgQPuPFjb4MUzDKR
         IwAzV3uY+rLKMHOo1nzPEpLCq8DGUl6ASlws0P+C+QzU0WAI5Y/j2bUqUPRUJo4YHJw5
         jcOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=bdp9jkK1dsukYpE9ksX5x/NIWESjBYrWaYraAo5agjc=;
        fh=zEsyXHM5341ZmEZeRygnyMNFMy/uCeaSHp0n2rhaj2c=;
        b=SIyRFMOVaCnzfwRPAoA96tlwWn/3MNriwpoZSVHqSpn6fEpKpkce5G5giKCVWNX0mK
         LFStbnoDqpGwAkIX81PZ8LZO3IPLPFdQRo91JrmiVvaYyu86UyUwY8LgFHLD1jL9qhue
         AmUvztm/RlK/GKJqsIkE/TVFrzqt3hYzUQ5IEvNTsPKYVuLJd3fHd/UwUeIfEpx9+bHw
         O+x4J7zcmo5a//C3KSLGmHXRscb3W14H/OoHnNz1uG/FueLkc20IQxMHIdALc/Oi3UGW
         sBgVWtdkBwfx1SXIECpWQZAz2d9+RBGbK184vflHPVwy6zaQcf2m41zEWRs2eHcfw2E5
         a1RQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=GQyrJdzP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47153b743casi1537871cf.268.2025.02.05.17.35.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Feb 2025 17:35:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=GQyrJdzP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tfqkT-0005L7-OC; Wed, 05 Feb 2025 20:32:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <35BCkZwgKCNkRPC5JONCBJJBG9.7JHL9HP-5MHIJIBIP.JMB@flex--wuhaotsh.bounces.google.com>)
 id 1tfqjv-0005Cm-7E
 for qemu-arm@nongnu.org; Wed, 05 Feb 2025 20:31:40 -0500
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <35BCkZwgKCNkRPC5JONCBJJBG9.7JHL9HP-5MHIJIBIP.JMB@flex--wuhaotsh.bounces.google.com>)
 id 1tfqjk-0006tH-4r
 for qemu-arm@nongnu.org; Wed, 05 Feb 2025 20:31:28 -0500
Received: by mail-pl1-x64a.google.com with SMTP id
 d9443c01a7336-21f0b6c446dso7529835ad.1
 for <qemu-arm@nongnu.org>; Wed, 05 Feb 2025 17:31:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1738805476; x=1739410276; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=bdp9jkK1dsukYpE9ksX5x/NIWESjBYrWaYraAo5agjc=;
 b=GQyrJdzPJdR2mxGW4PvevnJHsx/Y73aEWgAkyrmGnqr+ExNPP27JY/G7aru1tqd7T+
 fCiGv4Xrv3VXQVkg0//cBB/IpMo6TaJ1yHerq/RQzXw2xfvWgNOk2z1Aaw2ExVUwQ9jT
 2yNdrav0Khow6ty9BQZNcU5A0jEJ0Llv0pUva6aaJMh0vzPdbC9hy9ogpFaXEZXeQnLI
 kWFkFeRcwAjr2Mt98c6dxZRZAQA7XrNANRwihvvMzjcKdKBNBO7Q0lfurXbfKdWgTTcK
 xTzPP/HPuP7I0l1UtqSNRk1D7jzoTQ8xthLf7kC0Qp2zyQWiBThmrUtfAQdEpdsCgAc0
 i+sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738805476; x=1739410276;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bdp9jkK1dsukYpE9ksX5x/NIWESjBYrWaYraAo5agjc=;
 b=WlM/2J20Bc9rYBn2IBbfxvGqqQEzlZ7OHuignEL2f7bCZ0N+qW7Jo3moQQT8NdHKB2
 IwuoAKjPWi3yWhwMdKQDMmWrULDpTuZbgLQK7npFgd4y5tid4tCEMPSijBthAe+oUfbG
 a8AD1xwDPARMhgZc8B+38Jx3GsTUgUo502ZhSpnz+8InSSrR3VQxbF55Sn1p+SdcdHhZ
 fM8z/p5ocoMV1vn2KMIPQlElk2iGmVgK5Bq17U61lEF8bzhh3sSSq6t+TNI1oKc/DaKI
 HFmpv5VyaCiUkLc/by3EQ5r7m70FfSXaQLQ2lDKUGlBiOM6PLyKK0SIMnKnBFn3DZUVY
 ngqw==
X-Gm-Message-State: AOJu0YzuyfBOy+izMXoUa3P57VYH0iayl2H8IYkGpUZTC+5E7hC7CI9e
 lGZ9YhPoYgHXgLEOHBa+YmbIoJWxmHSVHOk/Yy/vcTw8RAU3MRuBBF06DKRyvFiLKWtbXyV08j9
 MhvdUnKQ6bw==
X-Received: from plce20.prod.google.com ([2002:a17:902:f1d4:b0:216:21cb:2dfe])
 (user=wuhaotsh job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:cf12:b0:216:48f4:4f1a with SMTP id
 d9443c01a7336-21f17e4ca85mr88457245ad.16.1738805476161; 
 Wed, 05 Feb 2025 17:31:16 -0800 (PST)
Date: Wed,  5 Feb 2025 17:30:51 -0800
In-Reply-To: <20250206013105.3228344-1-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20250206013105.3228344-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
Message-ID: <20250206013105.3228344-4-wuhaotsh@google.com>
Subject: [PATCH v3 03/17] hw/ssi: Make flash size a property in NPCM7XX FIU
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, titusr@google.com, 
 chli30@nuvoton.corp-partner.google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::64a;
 envelope-from=35BCkZwgKCNkRPC5JONCBJJBG9.7JHL9HP-5MHIJIBIP.JMB@flex--wuhaotsh.bounces.google.com;
 helo=mail-pl1-x64a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: e4AUp32RPkBf

This allows different FIUs to have different flash sizes, useful
in NPCM8XX which has multiple different sized FIU modules.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Hao Wu <wuhaotsh@google.com>
---
 hw/arm/npcm7xx.c             |  6 ++++++
 hw/ssi/npcm7xx_fiu.c         | 11 +++++++----
 include/hw/ssi/npcm7xx_fiu.h |  1 +
 3 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/hw/arm/npcm7xx.c b/hw/arm/npcm7xx.c
index 386b2c35e9..2d6e08b72b 100644
--- a/hw/arm/npcm7xx.c
+++ b/hw/arm/npcm7xx.c
@@ -292,17 +292,21 @@ static const struct {
     hwaddr regs_addr;
     int cs_count;
     const hwaddr *flash_addr;
+    size_t flash_size;
 } npcm7xx_fiu[] = {
     {
         .name = "fiu0",
         .regs_addr = 0xfb000000,
         .cs_count = ARRAY_SIZE(npcm7xx_fiu0_flash_addr),
         .flash_addr = npcm7xx_fiu0_flash_addr,
+        .flash_size = 128 * MiB,
+
     }, {
         .name = "fiu3",
         .regs_addr = 0xc0000000,
         .cs_count = ARRAY_SIZE(npcm7xx_fiu3_flash_addr),
         .flash_addr = npcm7xx_fiu3_flash_addr,
+        .flash_size = 128 * MiB,
     },
 };
 
@@ -735,6 +739,8 @@ static void npcm7xx_realize(DeviceState *dev, Error **errp)
 
         object_property_set_int(OBJECT(sbd), "cs-count",
                                 npcm7xx_fiu[i].cs_count, &error_abort);
+        object_property_set_int(OBJECT(sbd), "flash-size",
+                                npcm7xx_fiu[i].flash_size, &error_abort);
         sysbus_realize(sbd, &error_abort);
 
         sysbus_mmio_map(sbd, 0, npcm7xx_fiu[i].regs_addr);
diff --git a/hw/ssi/npcm7xx_fiu.c b/hw/ssi/npcm7xx_fiu.c
index 21fc489038..ccdce67fa9 100644
--- a/hw/ssi/npcm7xx_fiu.c
+++ b/hw/ssi/npcm7xx_fiu.c
@@ -28,9 +28,6 @@
 
 #include "trace.h"
 
-/* Up to 128 MiB of flash may be accessed directly as memory. */
-#define NPCM7XX_FIU_FLASH_WINDOW_SIZE (128 * MiB)
-
 /* Each module has 4 KiB of register space. Only a fraction of it is used. */
 #define NPCM7XX_FIU_CTRL_REGS_SIZE (4 * KiB)
 
@@ -507,6 +504,11 @@ static void npcm7xx_fiu_realize(DeviceState *dev, Error **errp)
         return;
     }
 
+    if (s->flash_size == 0) {
+        error_setg(errp, "%s: flash size must be set", dev->canonical_path);
+        return;
+    }
+
     s->spi = ssi_create_bus(dev, "spi");
     s->cs_lines = g_new0(qemu_irq, s->cs_count);
     qdev_init_gpio_out_named(DEVICE(s), s->cs_lines, "cs", s->cs_count);
@@ -525,7 +527,7 @@ static void npcm7xx_fiu_realize(DeviceState *dev, Error **errp)
         flash->fiu = s;
         memory_region_init_io(&flash->direct_access, OBJECT(s),
                               &npcm7xx_fiu_flash_ops, &s->flash[i], "flash",
-                              NPCM7XX_FIU_FLASH_WINDOW_SIZE);
+                              s->flash_size);
         sysbus_init_mmio(sbd, &flash->direct_access);
     }
 }
@@ -543,6 +545,7 @@ static const VMStateDescription vmstate_npcm7xx_fiu = {
 
 static const Property npcm7xx_fiu_properties[] = {
     DEFINE_PROP_INT32("cs-count", NPCM7xxFIUState, cs_count, 0),
+    DEFINE_PROP_SIZE("flash-size", NPCM7xxFIUState, flash_size, 0),
 };
 
 static void npcm7xx_fiu_class_init(ObjectClass *klass, void *data)
diff --git a/include/hw/ssi/npcm7xx_fiu.h b/include/hw/ssi/npcm7xx_fiu.h
index a3a1704289..1785ea16f4 100644
--- a/include/hw/ssi/npcm7xx_fiu.h
+++ b/include/hw/ssi/npcm7xx_fiu.h
@@ -60,6 +60,7 @@ struct NPCM7xxFIUState {
     int32_t cs_count;
     int32_t active_cs;
     qemu_irq *cs_lines;
+    size_t flash_size;
     NPCM7xxFIUFlash *flash;
 
     SSIBus *spi;
-- 
2.48.1.362.g079036d154-goog


Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1845837njb;
        Thu, 6 Feb 2025 14:13:12 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXXqFBhTtIWTIXbV/ixktbMB2Hham6XvmHRAwT1SXmKr5nrm/evJRQHMI+gUbdP4EoJoTvoBMU7LhKoBQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHHbNHnXCnAEzfbs5mLfF3NU1dwSw9Tk/J9rxg3+G/3H6Kn33wJe9JzLsgiRtZoyFtt6thV
X-Received: by 2002:a05:620a:3942:b0:7b6:d393:c213 with SMTP id af79cd13be357-7c047c026fbmr133091185a.8.1738879992075;
        Thu, 06 Feb 2025 14:13:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738879992; cv=none;
        d=google.com; s=arc-20240605;
        b=QgQLoJN7a5cx+3rPjtTGjIrbxZAHbmgyMTKwk347pug1pKb/5Xkj0A6+am8SLhoGjj
         fZuGtkiaInNidDN9j0bz/gcLTRrN0lRcmI0Wb6XNVdYtN4BPFfYbghtICtmHmzssi5/q
         XzzsUkYbJKkNnxBxLLTm7U9U7kFA/uuCkLwP+6eVR+DKxx4SlQAqtzYpPECWXUPTCYy/
         TwWYTA47bXRebv3BZo3+xSVCmJJVDKwMKjvpSx263hO3IfQ+kj7hZhzKGbvw32IHvSET
         CE+UGzn+ISLmulg4q5HRd4eSekAyP8aVX5YdjYYNm6McgEkRFUf2Ty8xlf+DwZynwvsk
         Imwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=2548+wS4SpVlfIQMzodXs7r5TmvHPEN3hvBGgeEdGms=;
        fh=biy2AaKCbwpAZ/Lk7Qechxb9C3WSrIx4CYh+Y6obQL0=;
        b=Ju+1ArExFdUGrrkB4Qk93Z3zx4N/rS4D4jzWgCKePzgYZwmm8oTUvNQe3jc9GCLqYC
         mcCL9IJ0q1Yx97uF3h55tYEnlZbMx89bY4mNPtQRGmLM4B3C9Qi9JRKlUDzTZaUw2YAY
         hMkdQn7f9PkSbo6pOV2EIvIROh2bwclxLCHhzZ6i90kbI4CoyQ9abOShzE+pboQsNCVy
         EbWMcvvVEidYDzAfqxunTv3McJfddPpOLr1oTTBPmsaOLhToUZKRYYLZoPFVvpLRpHSR
         uHe2mtcKQ9wUmHYbthVBtzJKDTtWeCLVqfkutz06gvwTd2DKvLkia/92KwtI2t+AGxbN
         +AIw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=nJzgoWzc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c041ed0e47si194686685a.501.2025.02.06.14.13.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2025 14:13:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=nJzgoWzc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tgA6p-0005lu-PR; Thu, 06 Feb 2025 17:12:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3vDOlZwgKCPszxkdrwvkjrrjoh.frpthpx-dupqrqjqx.ruj@flex--wuhaotsh.bounces.google.com>)
 id 1tgA6a-0005ac-8Y
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 17:12:16 -0500
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3vDOlZwgKCPszxkdrwvkjrrjoh.frpthpx-dupqrqjqx.ruj@flex--wuhaotsh.bounces.google.com>)
 id 1tgA6Y-0001Pk-3X
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 17:12:15 -0500
Received: by mail-pl1-x649.google.com with SMTP id
 d9443c01a7336-2165433e229so32205515ad.1
 for <qemu-arm@nongnu.org>; Thu, 06 Feb 2025 14:12:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1738879932; x=1739484732; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=2548+wS4SpVlfIQMzodXs7r5TmvHPEN3hvBGgeEdGms=;
 b=nJzgoWzcyplLjfw2mxcOWJB0S7B0gBl7Ezq2gSvKNYJlsFLaB8hqT/yaC+tp+rJd04
 yTojR/VJts/q0VkFcR4ABmzG9yyUQZvsNh/BxvuQryh+0BkTm5W/CtBdOIzgprtu/sVu
 4P6yJCyyebywmaozeLUx31kRv9UhEesMu/5hxDxIEKdnCQR/DRZaDEMO1V79wcrQfJAq
 KL/kgAJzbVWyaORGWaaHElImZWBuZH1H8ox5K9JaLqOH52B0icKML4h7uLkyt4fnb4CB
 137Zg4TRT4f1Focwlf+5nq010mfMupB5NUCeb+3Z7XfLX8KmdafexEczrNSp1PmERBwC
 Nx5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738879932; x=1739484732;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2548+wS4SpVlfIQMzodXs7r5TmvHPEN3hvBGgeEdGms=;
 b=UbtPRQV6pAzsmRebZKcp4qWJJkdZ4x4ldtIaqPMHqapZ4GIyPTV8KLBRRmR62bdhUP
 w4AE4RI7DyF+sqjk+9sT5sRWLdhqJnAaU7tBD/7VuN/DL1WaBA/KCSQOx+n1ZpPkssdg
 870N+m2VAmjDpYtBzo16jIssu8xpb4Vh3u9zkdQk7TGOn2123HbRNjhkI1sLTzb9jE4w
 4abELnZqu38I0ps6WBIb9ewt6An4LxXDqq7C0FqBDrmz84t+xE4In2oyPJWY+pbobDTf
 uoOW5177xyulgxYPXxEBFHnqRZbK6TsECKsDSkxRdLpgtO0SmOIa0kS1wTV4nE7Va7TT
 +Low==
X-Gm-Message-State: AOJu0YxWpM8XPZMP7bNFlJjoWAOCMdrCFtHRZXTycUfoU5TNjU6uFd22
 bLKeGREwGQ2Jv2gLIhfJ0N7PQAOxRzStjx/XLORNVVG/OKNKnHsoecHGaQk/y5dnouLQTv79puR
 2fs/CTDcXVQ==
X-Received: from pgbcx10.prod.google.com
 ([2002:a05:6a02:220a:b0:86c:1a7f:d25c])
 (user=wuhaotsh job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:9f4a:b0:1e8:bd15:6819 with SMTP id
 adf61e73a8af0-1ee03a5f141mr1877001637.22.1738879932414; 
 Thu, 06 Feb 2025 14:12:12 -0800 (PST)
Date: Thu,  6 Feb 2025 14:11:49 -0800
In-Reply-To: <20250206221203.4187217-1-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20250206221203.4187217-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
Message-ID: <20250206221203.4187217-4-wuhaotsh@google.com>
Subject: [PATCH v4 03/17] hw/ssi: Make flash size a property in NPCM7XX FIU
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, titusr@google.com, 
 chli30@nuvoton.corp-partner.google.com, pbonzini@redhat.com, 
 jasowang@redhat.com, alistair@alistair23.me, philmd@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::649;
 envelope-from=3vDOlZwgKCPszxkdrwvkjrrjoh.frpthpx-dupqrqjqx.ruj@flex--wuhaotsh.bounces.google.com;
 helo=mail-pl1-x649.google.com
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
X-TUID: RqCPYtTecO1d

This allows different FIUs to have different flash sizes, useful
in NPCM8XX which has multiple different sized FIU modules.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Hao Wu <wuhaotsh@google.com>
---
 hw/arm/npcm7xx.c             |  6 ++++++
 hw/ssi/npcm7xx_fiu.c         | 16 ++++++++++++++--
 include/hw/ssi/npcm7xx_fiu.h |  1 +
 3 files changed, 21 insertions(+), 2 deletions(-)

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
index 21fc489038..8df4bec3f1 100644
--- a/hw/ssi/npcm7xx_fiu.c
+++ b/hw/ssi/npcm7xx_fiu.c
@@ -29,7 +29,7 @@
 #include "trace.h"
 
 /* Up to 128 MiB of flash may be accessed directly as memory. */
-#define NPCM7XX_FIU_FLASH_WINDOW_SIZE (128 * MiB)
+#define NPCM7XX_FIU_MAX_FLASH_WINDOW_SIZE (128 * MiB)
 
 /* Each module has 4 KiB of register space. Only a fraction of it is used. */
 #define NPCM7XX_FIU_CTRL_REGS_SIZE (4 * KiB)
@@ -507,6 +507,17 @@ static void npcm7xx_fiu_realize(DeviceState *dev, Error **errp)
         return;
     }
 
+    if (s->flash_size == 0) {
+        error_setg(errp, "%s: flash size must be set", dev->canonical_path);
+        return;
+    }
+
+    if (s->flash_size > NPCM7XX_FIU_MAX_FLASH_WINDOW_SIZE) {
+        error_setg(errp, "%s: flash size should not exceed 128 MiB",
+                   dev->canonical_path);
+        return;
+    }
+
     s->spi = ssi_create_bus(dev, "spi");
     s->cs_lines = g_new0(qemu_irq, s->cs_count);
     qdev_init_gpio_out_named(DEVICE(s), s->cs_lines, "cs", s->cs_count);
@@ -525,7 +536,7 @@ static void npcm7xx_fiu_realize(DeviceState *dev, Error **errp)
         flash->fiu = s;
         memory_region_init_io(&flash->direct_access, OBJECT(s),
                               &npcm7xx_fiu_flash_ops, &s->flash[i], "flash",
-                              NPCM7XX_FIU_FLASH_WINDOW_SIZE);
+                              s->flash_size);
         sysbus_init_mmio(sbd, &flash->direct_access);
     }
 }
@@ -543,6 +554,7 @@ static const VMStateDescription vmstate_npcm7xx_fiu = {
 
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
2.48.1.502.g6dc24dfdaf-goog


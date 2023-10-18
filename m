Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp4629455ejc;
        Wed, 18 Oct 2023 06:15:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSjI8rDApIjsmRB3xQW7FwLO16cX6H2+mGCZ2lZn8aQTKbZW25TnHihCoLiBvINY+hZ82b
X-Received: by 2002:a25:cf10:0:b0:d9c:2953:bde1 with SMTP id f16-20020a25cf10000000b00d9c2953bde1mr5186833ybg.38.1697634952730;
        Wed, 18 Oct 2023 06:15:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697634952; cv=none;
        d=google.com; s=arc-20160816;
        b=a/h5AoBP7EBQboigzh4A8IwmoaKl+fXxdf219jaheuQZfB12n3H1Mfk3VJpdNddwdw
         hzUu41ek7yjsI0aZpXwa7jDQFCARias9dyUKin/0McT6znSi7iuswtOVzWDn82IgZ+Q8
         7EUsUTFPjk7noNXzqe+GUdJPYeBTrhoBwHHR6KxleUs5giwFXiYZrd2vmPBfAo+Gl3x5
         CoHsQbQomjvq+2IzJvPRiWTWk1lGZtoxfw64Wuy7OkfTwhXbFTgKdj+8utnM56rjMvfN
         NP3uRn07+DdE2K744UvJ5lMcKd8XvI0H/8+f6JIEMFzewoAFrL1kWVmR3cB3QvZYF0ej
         ODJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=RG5zLlWN/LC4pJbPVJoFLnGQz4i0tpH2bVvTXsYTeOI=;
        fh=Uq4CCH4qgIScoA1ZlzK6h1LD8Rw6xac8JtYTs6G5zlc=;
        b=nInYgIYVOormcEWB7pB92jSAX1OAN4gl4ozi+XIKxkTm9P7nmn6CdndUJmcB5xpaYd
         lAQklZrI8/t7XO0yTg+MQ9Z2+jNlCGc3NClKBBzsN7Nqj3d5klYjzTbeR7FdbKQZHCNN
         2IlPOOPZQLvXR/KOeZT0ZdQq5+NN06aG8o9aGmqCKopvr87xwxIZZ2tLsDmvD8R3qyF6
         hNrxOwKC0412F/N7WAXy2yCkHELkMc4q3N7nGHX1IBeaz6/J3fwMDriJun5ibD/Qwzyz
         a8ayhXcZv1HCvWHNCAtPD8jrnJ7qlcbKBoyny8MZsek+bf1i7sCPX4H2k1EumLsKy7TG
         HH8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y40qUJps;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b11-20020a0cfb4b000000b0065afce4a725si2586931qvq.47.2023.10.18.06.15.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Oct 2023 06:15:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y40qUJps;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qt6Mh-0008EI-Jg; Wed, 18 Oct 2023 09:13:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qt6MH-0007Vz-GH
 for qemu-arm@nongnu.org; Wed, 18 Oct 2023 09:13:09 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qt6MF-0000nu-ES
 for qemu-arm@nongnu.org; Wed, 18 Oct 2023 09:13:09 -0400
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-9c53e8b7cf4so407350166b.1
 for <qemu-arm@nongnu.org>; Wed, 18 Oct 2023 06:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697634785; x=1698239585; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RG5zLlWN/LC4pJbPVJoFLnGQz4i0tpH2bVvTXsYTeOI=;
 b=Y40qUJpsJNbgIx7vMG4lVxRCHty9Ljn6M0yZK+HaEQAypC8qhPzq1UluE9H4t36JLD
 UOJa/+4sBIZCtt5jYosk+zkz6jlPq24GUzna2iYVu8RXY6L9c3QoSFLtbXvPdhq3k+aw
 lV1J1cKXn2OTzQeTlcL4ZuHi83Hj3d31zTOQ4nRhU+rGIzCSOCQ0yavFDcxG4ZSPiZKH
 Sua1K6hqVJ3K9cTo9Tb/dcXyyuzO0eQVXZGe8872SBrBA52Gt71RipA+tW9iFJ5rEK4j
 o9PpXBmNrZqg01gFK1i5CJN8AYbeoutckxjNJ6axNOuc8vrwT6IMvQI4XRWuVUUg2Afz
 cexg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697634785; x=1698239585;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RG5zLlWN/LC4pJbPVJoFLnGQz4i0tpH2bVvTXsYTeOI=;
 b=qV3AzAZ29wt1WAYy1dSX7gnABszIb0dM3yuu7Ln+Wke+NqR3Fyw7d46SkPTevg8lgF
 V5VXiZ2bjL2dBIlhZeKzjW5X3AKQahxHdTtImFtTWTf9AhzMDW1fMGzAMddLn1xHYiSg
 GcFU4mZLDQHvqAfu5fZVqmfQsYMdQj7Zts2ngZ44076ZpS7WuS2gwjdkhJvy2vrCOXYz
 MJxAiGYVGDDr/gD6HuUUEwQA3toOd+i4yeOZmBRJOGvrWX8sAmwK+1KlFTHpA4Hnbmdq
 nIoJkE1JUAWvhn+91iegAGv8ZFMiiFSWFGJNaT+7/nlLkefSyZycNPfxlhWp5ZGrQ1xL
 e08A==
X-Gm-Message-State: AOJu0Yy1qXBbBudXx6fVZzZG9dbsHl87LM2ABPIKztr3bUUwiGlBDFYW
 CBkKfC/dCW4v6FXtfAmpVUzF8A==
X-Received: by 2002:a17:907:d48d:b0:9c6:7ec2:e129 with SMTP id
 vj13-20020a170907d48d00b009c67ec2e129mr2603043ejc.42.1697634784797; 
 Wed, 18 Oct 2023 06:13:04 -0700 (PDT)
Received: from m1x-phil.lan (gyl59-h01-176-171-218-149.dsl.sta.abo.bbox.fr.
 [176.171.218.149]) by smtp.gmail.com with ESMTPSA id
 z6-20020a17090674c600b00992e14af9c3sm1686110ejl.143.2023.10.18.06.13.03
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 18 Oct 2023 06:13:04 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 7/8] hw/intc/pxa2xx: Pass CPU reference using QOM link property
Date: Wed, 18 Oct 2023 15:12:19 +0200
Message-ID: <20231018131220.84380-8-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231018131220.84380-1-philmd@linaro.org>
References: <20231018131220.84380-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: eJNa6s7y6fnx

QOM objects shouldn't access each other internals fields
except using the QOM API.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/pxa2xx_pic.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/hw/arm/pxa2xx_pic.c b/hw/arm/pxa2xx_pic.c
index 2eb869a605..7e180635c2 100644
--- a/hw/arm/pxa2xx_pic.c
+++ b/hw/arm/pxa2xx_pic.c
@@ -15,6 +15,7 @@
 #include "cpu.h"
 #include "hw/arm/pxa.h"
 #include "hw/sysbus.h"
+#include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
 #include "qom/object.h"
 #include "target/arm/cpregs.h"
@@ -288,7 +289,8 @@ DeviceState *pxa2xx_pic_init(hwaddr base, ARMCPU *cpu)
     DeviceState *dev = qdev_new(TYPE_PXA2XX_PIC);
     PXA2xxPICState *s = PXA2XX_PIC(dev);
 
-    s->cpu = cpu;
+    object_property_set_link(OBJECT(dev), "arm-cpu",
+                             OBJECT(cpu), &error_abort);
 
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
 
@@ -321,11 +323,18 @@ static const VMStateDescription vmstate_pxa2xx_pic_regs = {
     },
 };
 
+static Property pxa2xx_pic_properties[] = {
+    DEFINE_PROP_LINK("arm-cpu", PXA2xxPICState, cpu,
+                     TYPE_ARM_CPU, ARMCPU *),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static void pxa2xx_pic_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     ResettableClass *rc = RESETTABLE_CLASS(klass);
 
+    device_class_set_props(dc, pxa2xx_pic_properties);
     dc->desc = "PXA2xx PIC";
     dc->vmsd = &vmstate_pxa2xx_pic_regs;
     rc->phases.hold = pxa2xx_pic_reset_hold;
-- 
2.41.0


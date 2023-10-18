Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp4629818ejc;
        Wed, 18 Oct 2023 06:16:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqZ3JNpe5BXVH+QGOcNEDwc8ZVj8B57/2cRagbictwMN5KgCNqZqGVSaT0m6/0gGF1BeA9
X-Received: by 2002:a05:620a:d83:b0:76f:44c:5cd0 with SMTP id q3-20020a05620a0d8300b0076f044c5cd0mr5846491qkl.48.1697634975733;
        Wed, 18 Oct 2023 06:16:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697634975; cv=none;
        d=google.com; s=arc-20160816;
        b=wUd+a4rCigRxPbXHnqOgqq1BsFfzFXmUMGaf5DvlswFW7U78BuxpsD2L7odFXLguSJ
         3b0Qso0/jVPX7+GUIJ/UDJZgzTwEUHTLlVD8p0cxzJKagFpi+D0Fof+l1ClMPjwNuHTd
         5skTwDsmKXjI05dNPMxJZeafNHXQWW+UQSSH8ONSkqfwb9CleER42cjE4rakI/0+BSRg
         y3Id+4S+sgsd/FYnnEMmuPKr7Mi9tXJHRwc2cYNLXT3b3gdpu3qxrZef1mt6W7SZbXoN
         2iAFkkfJZD1OSfd5kyDtu6k4077S+5NCs3YYI2Y9fpgZ7htJUJfXEMYmMbDcSpyBqCuL
         bGBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=jWeKlxu/1oSXjew02PYYb/4LgtdqaZA73Poob6GIouM=;
        fh=Uq4CCH4qgIScoA1ZlzK6h1LD8Rw6xac8JtYTs6G5zlc=;
        b=Ju4RGy+90S/krL+2cRj2J+cqsRgpSnsCThQyKXe+NeaMNumE0R2eeySvpz/5IKmwUY
         pC53Ct37rAdFkr1jJ+veYSLllzDhyGs7VcnKyHoITMFgvreEIEcnhUy4i/LxvdkTnKoa
         Ces7ARZ5gBNKqDcedxcUQILlAFPOaYKGjUt4JI4hkd2xLuAF2scD/qqkNiilBYKzq89w
         JZVvJ7D7ppoTCtbeFlsXFgjr2EbXYbX1HJNXGGKFgmOk+22lK5seUt7Egn1j+7tKSqWo
         Es4Igq/QawlgHjpSA4D4oCJTdaxnS8ncAjW2mrf1M9KTSUbqdmYTiDVSKiVs9RKqWo+h
         1RFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YNZvZ6K0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h17-20020a05620a245100b0076ef736e804si2654959qkn.726.2023.10.18.06.16.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Oct 2023 06:16:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YNZvZ6K0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qt6N4-00007B-VM; Wed, 18 Oct 2023 09:14:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qt6MN-0007b3-0g
 for qemu-devel@nongnu.org; Wed, 18 Oct 2023 09:13:16 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qt6ML-0000of-39
 for qemu-devel@nongnu.org; Wed, 18 Oct 2023 09:13:14 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-53b32dca0bfso14261878a12.0
 for <qemu-devel@nongnu.org>; Wed, 18 Oct 2023 06:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697634790; x=1698239590; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jWeKlxu/1oSXjew02PYYb/4LgtdqaZA73Poob6GIouM=;
 b=YNZvZ6K0YcIXBcbBIDv4OiqqgWqEh/JmrCof4jtgfbzYl5zPwvcXU4rbO1j+QKKa7+
 FDXL6agrVGyveRgM7zycpXbIXfCKViargDR9ZtHFwmT1Y58sZXmeTiBnlY73iDoqFUPG
 ZM42Yjh9pUIooDHqJLOWqFjCSSPZy+E1dNXA1nLrDHMGXSt35Kb80mJqSk0tY1buKi9c
 v/DXxE7WCMSK7RfIYs1YfTDeWuOCAqvBUg0rLFCnO6jknWtFaavCysgv5D614w7uLze/
 H8wgoeAtkz0K7MaZdW1mRq5cqX9wgBSY9z6U85Ut3NzNYqpqajGovXRMCqSF9Ww335l2
 FUTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697634790; x=1698239590;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jWeKlxu/1oSXjew02PYYb/4LgtdqaZA73Poob6GIouM=;
 b=ntC+tfzMyDPme5UjyRMEJMFY6JRkG4AYq8SL5xhyO0bKkb5ZqZcYwU14iB9Royjl1x
 p0+McjlyJug7xtxgwhjc2x1i51bVRjCYUa/p0LeGxxTeNfS75LYso5USDa48FMp4rno0
 45vExGo9KcaCtkxihUZiMj/LGIXp7MJcZjClWVPG0nNAvO3uyZ6DJ6RwLpS8uAG/hg0L
 jyvaZ0UF5KNQ16NLH5Bs91ju3rZKVh4bjBw6OgDImVXEF82zi8nLJseqUF0WVyG30/GO
 pMj4XudGUDFNMeU8FKsLpDgMJw0QUYSBHAeURINkp8rfve8fL8Q5nONYg9F9mJrABN/j
 tNgQ==
X-Gm-Message-State: AOJu0YzvKnx2kI6kNJ0gMnrAHH6Ep+QNEt05LcEHJJiRHi8fITDWjhmP
 vYxNYGtIZjbhOh4BDR+Z0VyQTyFZQKFNe19sxtw=
X-Received: by 2002:a50:cb88:0:b0:533:4a89:5b2e with SMTP id
 k8-20020a50cb88000000b005334a895b2emr4718728edi.1.1697634790666; 
 Wed, 18 Oct 2023 06:13:10 -0700 (PDT)
Received: from m1x-phil.lan (gyl59-h01-176-171-218-149.dsl.sta.abo.bbox.fr.
 [176.171.218.149]) by smtp.gmail.com with ESMTPSA id
 k3-20020aa7c043000000b0053ecef8786asm2763606edo.75.2023.10.18.06.13.09
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 18 Oct 2023 06:13:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 8/8] hw/intc/pxa2xx: Factor pxa2xx_pic_realize() out of
 pxa2xx_pic_init()
Date: Wed, 18 Oct 2023 15:12:20 +0200
Message-ID: <20231018131220.84380-9-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231018131220.84380-1-philmd@linaro.org>
References: <20231018131220.84380-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 8183zAWKwmWD

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/pxa2xx_pic.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/hw/arm/pxa2xx_pic.c b/hw/arm/pxa2xx_pic.c
index 7e180635c2..1373a0d275 100644
--- a/hw/arm/pxa2xx_pic.c
+++ b/hw/arm/pxa2xx_pic.c
@@ -287,12 +287,18 @@ static void pxa2xx_pic_reset_hold(Object *obj)
 DeviceState *pxa2xx_pic_init(hwaddr base, ARMCPU *cpu)
 {
     DeviceState *dev = qdev_new(TYPE_PXA2XX_PIC);
-    PXA2xxPICState *s = PXA2XX_PIC(dev);
 
     object_property_set_link(OBJECT(dev), "arm-cpu",
                              OBJECT(cpu), &error_abort);
-
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
+
+    return dev;
+}
+
+static void pxa2xx_pic_realize(DeviceState *dev, Error **errp)
+{
+    PXA2xxPICState *s = PXA2XX_PIC(dev);
 
     qdev_init_gpio_in(dev, pxa2xx_pic_set_irq, PXA2XX_PIC_SRCS);
 
@@ -300,12 +306,9 @@ DeviceState *pxa2xx_pic_init(hwaddr base, ARMCPU *cpu)
     memory_region_init_io(&s->iomem, OBJECT(s), &pxa2xx_pic_ops, s,
                           "pxa2xx-pic", 0x00100000);
     sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->iomem);
-    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
 
     /* Enable IC coprocessor access.  */
-    define_arm_cp_regs_with_opaque(cpu, pxa_pic_cp_reginfo, s);
-
-    return dev;
+    define_arm_cp_regs_with_opaque(s->cpu, pxa_pic_cp_reginfo, s);
 }
 
 static const VMStateDescription vmstate_pxa2xx_pic_regs = {
@@ -335,6 +338,7 @@ static void pxa2xx_pic_class_init(ObjectClass *klass, void *data)
     ResettableClass *rc = RESETTABLE_CLASS(klass);
 
     device_class_set_props(dc, pxa2xx_pic_properties);
+    dc->realize = pxa2xx_pic_realize;
     dc->desc = "PXA2xx PIC";
     dc->vmsd = &vmstate_pxa2xx_pic_regs;
     rc->phases.hold = pxa2xx_pic_reset_hold;
-- 
2.41.0


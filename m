Received: by 2002:a17:906:3953:b0:a3d:1c09:7d3d with SMTP id g19csp215447eje;
        Tue, 13 Feb 2024 07:52:47 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVO5VTy6UxskvhUlIz8pWgOsUbg43OQBM3YhpFvvz9/1K9DBqGxmpB2j0ohqTxWX2iqrGZZO/F7rjBHPzPhlUZxxmfOiTkQ
X-Google-Smtp-Source: AGHT+IHrwdr6l95bXHFhrKk6r5xUi5tdMTkAn7zMQ6JKyY5V7zUI+g2SZfIHtnL4ojgDNpfHjNSv
X-Received: by 2002:a05:620a:ecb:b0:785:bdfe:6430 with SMTP id x11-20020a05620a0ecb00b00785bdfe6430mr8547753qkm.19.1707839567279;
        Tue, 13 Feb 2024 07:52:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707839567; cv=none;
        d=google.com; s=arc-20160816;
        b=gp18VbT2uSr5V9RH81FtUBfn4BsJVCs/0rd5jGDKcthZ8sxGxxbhH51Pgi/dW93kgJ
         VPZWVEa1JPO3ezN/QWHtTyK7sft8VRYYOWOzAr37K3fKJWv2j5mjaxkZkqA5QQgDpHUj
         yjRQcF3n5g/3y5cfvg5xk6BgHwg5DL7X2EBqPC2lLtjTmvSJ+V0lNqSrGmP9glYPsFHR
         5M/XcmLAc0h7VCEe9f+h5nl197C6nZUT1lWuzAblz7HKpGmZrovYyksRQtUcQoMvuDfb
         7G9GAaTv+d2AXIvyA4IgcKjrD1ckjqwoHS++TSl7YVbfrT4uvzAOGOhRnjFUh2yKJg2E
         4u/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=U+S0PIyuWqj36dfp8C1T50Axcx5KgHwe/rvIuK8sOt8=;
        fh=BP1Ogg9DOTunjhGbS4bwm7Vpc0Gfid6KlzIA97KPoOY=;
        b=Vl4Zret8PSGNjVtLhmjVj8Sk/oBmRzkQlvXI4QPaLnXCHnvnQ2gs7iAC6b2EMpzyTn
         6Y2A24q62q0RDRBPCVOHEdJE/O5ubV4WvumcnJoGto5iPzEdK5cuZ+L7F1v7HPLJg9DZ
         Ox6IpNW+8dmp5JOKclh9ye8fbBTYZ62fkCutXBKHNcdMY5V1nJr0IvwIyplLu+rIs6GU
         3+kkso/KDBRtYaXKXcihVJr5k0PdbgrtfL6mpLDmvsgIk1XwFXF3vpcG+9u0S7cBTLWA
         VfDfMp13/h8VIBghJS3Tdl78WTvZ8phQ3KNv3qCxaAoUxycRrnSuLUtulIIXX6DnCCVq
         pecQ==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DGvGivEO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=1; AJvYcCWFfZfAzK1hBGv+jXBWoIEvZfoa/Tj13wZ7JCzBd0uBD8kIKLssmxJoyxua6h4PFJmQar/T8FtygX9anY03lzi/wUYRDRgG
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y14-20020a05620a09ce00b00785d9d11421si3874206qky.727.2024.02.13.07.52.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Feb 2024 07:52:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DGvGivEO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rZv5B-00015X-3y; Tue, 13 Feb 2024 10:52:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rZv58-00012r-Mm
 for qemu-arm@nongnu.org; Tue, 13 Feb 2024 10:52:26 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rZv57-0005le-5J
 for qemu-arm@nongnu.org; Tue, 13 Feb 2024 10:52:26 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4108cbd92b9so24347205e9.1
 for <qemu-arm@nongnu.org>; Tue, 13 Feb 2024 07:52:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707839543; x=1708444343; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U+S0PIyuWqj36dfp8C1T50Axcx5KgHwe/rvIuK8sOt8=;
 b=DGvGivEOHnaarw4F+qcovDKo0ff/GUPOGq80idnwoVP28T5Y7gQzXudt0NWtSepMGz
 OmIKf5c2aO+Um2q66HRF/xc9DjWFTjFi886dYHhfTciL8IlUEFQ+2PrSC1q6ty4qwnx+
 J35rOnIWaQHC5SjPFb/ZgeFvYpFK+WFyVSOza45vJYmSUxcOQ8NCr99hJ0UTLN1KOSU9
 io8gxFDwFLes63mNbmPxI02SYR7E9xiDPzLxr/9t9Tn+MHXm+JxvTcBoyH0zzo8RdAfa
 MOudmZtZpNspUhDePwoPoRbNFHKphqaydtTaQDZbTAIsFaBD/U95zM3rqMQOYveuIx1u
 oK8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707839543; x=1708444343;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U+S0PIyuWqj36dfp8C1T50Axcx5KgHwe/rvIuK8sOt8=;
 b=BmbuqXKvgBImMcZrfDTdpNUQzLu8P5WbUzx7tNgopAB8VySyITmxqoqpa8TCkjC+uY
 kKW1/1sFcVpUUdM7KbIExOEmMPIsNFxfjPlYW6ErMfLe1YWs7r/1ZLpN6uQyJiC/pfVi
 OgJ5dq43vu804rfk6jFkIx8OymDeJACGOQ62Df1+7Rl5jzp4s8EYDVM/CvQH06EVqhrf
 CnegCP92E1SHi+y+vl4IAtMR0CJTxdmvpXMMwJU0txHODZyrA7K9iPIRO/T+LNae3DEW
 TuCfy4HcnksNaJd/Oe1LvkYAoEfRmvl29MiO0tYXoU5QzbxQUBT8dnMDeqBRYGuVj7s7
 2aoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWW3Z6oyBWxemNAuEoC4RoI6ylYGc9Th8l0qAyMCrCt7u92bAyRqBjLWBsjBd6poAlBfcpqVH9dcF+euTVYeKdWbEE2
X-Gm-Message-State: AOJu0YzUHA8fJuIwKy7qjiNaz1so23DyZimlAeR/8Xwdi2kS1tOT31Co
 CFR3TwT4OMWElwd9O6JqBzvsyoY8peMtIwB8RXKKeg2vJV6B4c6oX59H8em0Zqw=
X-Received: by 2002:adf:f84c:0:b0:33b:87fb:7106 with SMTP id
 d12-20020adff84c000000b0033b87fb7106mr3637882wrq.55.1707839543457; 
 Tue, 13 Feb 2024 07:52:23 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWnaSTh5pd2/gZQHNTqQL/MOMe5XV8x67kfuVtsDxZkhKSMw/YkqmWW6rboCuiZ7dnlXqAhvVC9zeIFrQK8Lnh/T94oembmr1OxLwVtvAdOgJz4ZKC+fcJQ646eoAYshHbuvpQ0PNe/i3FRTVbMqSp8WQ==
Received: from m1x-phil.lan ([176.176.128.243])
 by smtp.gmail.com with ESMTPSA id
 bu13-20020a056000078d00b0033b6d5a1244sm9873617wrb.12.2024.02.13.07.52.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 13 Feb 2024 07:52:23 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Gustavo Romero <gustavo.romero@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 1/4] hw/arm/stellaris: Convert ADC controller to Resettable
 interface
Date: Tue, 13 Feb 2024 16:52:11 +0100
Message-ID: <20240213155214.13619-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240213155214.13619-1-philmd@linaro.org>
References: <20240213155214.13619-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: h5erE4IPTt4l

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/stellaris.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index 34c5a86ac2..4fa857970b 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -773,8 +773,9 @@ static void stellaris_adc_trigger(void *opaque, int irq, int level)
     }
 }
 
-static void stellaris_adc_reset(StellarisADCState *s)
+static void stellaris_adc_reset_hold(Object *obj)
 {
+    StellarisADCState *s = STELLARIS_ADC(obj);
     int n;
 
     for (n = 0; n < 4; n++) {
@@ -946,7 +947,6 @@ static void stellaris_adc_init(Object *obj)
     memory_region_init_io(&s->iomem, obj, &stellaris_adc_ops, s,
                           "adc", 0x1000);
     sysbus_init_mmio(sbd, &s->iomem);
-    stellaris_adc_reset(s);
     qdev_init_gpio_in(dev, stellaris_adc_trigger, 1);
 }
 
@@ -1411,7 +1411,9 @@ static const TypeInfo stellaris_i2c_info = {
 static void stellaris_adc_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
 
+    rc->phases.hold = stellaris_adc_reset_hold;
     dc->vmsd = &vmstate_stellaris_adc;
 }
 
-- 
2.41.0


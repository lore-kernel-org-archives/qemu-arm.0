Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp842483njc;
        Sun, 9 Mar 2025 17:07:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXpOtP3iOjknctI6/ef0PLE7EZR5B7B5V/T47McmQ20eMKhKkizzQ+0lkGg2UvG1Hbj/0mr7iA8IsRxQg==@linaro.org
X-Google-Smtp-Source: AGHT+IHECtLpyo4g4w7XqNWjLyk/XaSwajxJ3xHanaADNYmEFeBD2AO3ByXqRnUr2LH6X9poMvhG
X-Received: by 2002:a05:620a:6844:b0:7c5:55be:7bf8 with SMTP id af79cd13be357-7c555be7cebmr111776385a.38.1741565267591;
        Sun, 09 Mar 2025 17:07:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741565267; cv=none;
        d=google.com; s=arc-20240605;
        b=YC4HUCVM6KIe99uREhlaqLejbSg9KcTj6YXo8IuEZRkVnk4Khki6uEi7D64Jzy/ryL
         GHugq7SKCS23V8u0YSlDzTgWP8Cxf4RCKzaXusXTr1/g8fOjAH3SylQkiuWGUOenXy0p
         YL2xDEuVQuJPKnPTaTzmQPcRhfF35dbB3WeQQczCHV/EWKlf+5lkuNZLoPoO0VbRwSb1
         tl50tpmCEIRnRPO80OJa4kFkkQB97w6jtHirPwuORuRw34acG7WNIOV0edHAvtI/qWIK
         m8Sf8bcl958oLmO8v2tyO0d8GryZdqh3op4jx9lvIaQgLVLp/t600K8GOEWJ3lqI9sSr
         B3Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=gbDUibVkXNR8REIQVVOEU7ZYDHi6ABLRhy2a8AYGnao=;
        fh=z7kE+MzD8BmwxtPcFM3lml+qtBJDHmY5Oj8FHfkTnYE=;
        b=POIdc7N8ZTiWTCbdD2Ca3KleJ66h34/uvOlhBnR+gbsXwAY6hQSWbfEN8OPLOkGxtB
         NTNoJjANdZiejwgied27wlaur8T2no59fUxzLLrAaUsmS1mR9ev3Y+dwnD3obayQ/fWE
         1wzDuGXz0abkVPKDZAxdDlAKxx8rnokADRWSlwSU2Aa4ua/f1owzaaBZikn4oOPLOIfa
         jaYfrD0fiBTYKgrB1zxWfc8+ndspkU8cN2Ft5YZiYwcyqcWKAXcxlYywJvx7AK2MMPh9
         9IOdLVbhzsTj00mW77ehRSSER7cOR+tmw1yqj8kfcVhXepg9EwwILGaERDs1mq9t5qRX
         u54g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OtPWoLzv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c53c5d9c99si444138785a.482.2025.03.09.17.07.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 09 Mar 2025 17:07:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OtPWoLzv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1trQfw-0002Dh-Q6; Sun, 09 Mar 2025 20:07:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1trQfq-0002CD-E7
 for qemu-arm@nongnu.org; Sun, 09 Mar 2025 20:07:14 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1trQfo-0007Q7-FK
 for qemu-arm@nongnu.org; Sun, 09 Mar 2025 20:07:13 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43bc63876f1so31289245e9.3
 for <qemu-arm@nongnu.org>; Sun, 09 Mar 2025 17:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741565231; x=1742170031; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gbDUibVkXNR8REIQVVOEU7ZYDHi6ABLRhy2a8AYGnao=;
 b=OtPWoLzvBNGuPVeoSR1K39DckV9OM/kmSmSPWOUkGvyvXLI0+y+6fueluA42oNkSDA
 3mqLlUap8YeLzynHhu/VN6BmJCI5dCUvOC1bS8ab/CHIRg0O0h37jXuhEDG/UKA+mdZ9
 jmZeyoDP8ke+wRtzkFU9efPgNVS+PuYKFJKsO/Vn3IhBjgvjgefWITs7hkkQypy8Qn1r
 p2db93FD9mmhwuwtkjVK/HtGoV+QFuGlAXlYI7/IQSLvnl8lJu5aFbEFVOo8GOHHJV2X
 8DehayfynZU0mG8otkpyvdFpxJr2vcJ/Ckd8kn5fqMjoqnoXV1+PNk5Hzn1ngpvleyLE
 qh+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741565231; x=1742170031;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gbDUibVkXNR8REIQVVOEU7ZYDHi6ABLRhy2a8AYGnao=;
 b=mO9IKb9k2XnbegXdBmxs6q8lzZ3bQrZ6i05tVvT7bo/gSNYIPjraSIZyjQhK0UvSlg
 VpsLM4Ap+Q0gMorBicWOgkwDG1+Y9IxqB4QPcO3KO3O89+YRPiFy8iFyZGvjPJExwwvZ
 K5UZ36V0rvYbKIg1wy3XxmMd7EHk9Mgq1+AfVYlXApSbFTXNLIpH5dZwY4diRosdUmIS
 T2jtll69MqbYLjitBthEhbKJgLIELKAUBfm9xND4CTs7ILlfLFnbeWS1GPyMHolS7Cv1
 Xyq0sBbzFBSvByosxRjCAN5BlrJf5TFtjqZby0bQtkPMKgXh6YAWTvEPM2H639XAH/wq
 i4Ng==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8SSwg59IlfYnHkGCKq/oWu09KugSInlZ5DC/TofrPZxFb25s+G4HUhmrlnWDRoLJXvYZQRHAm4Q==@nongnu.org
X-Gm-Message-State: AOJu0Yx+euK87nhx9dzqKSo1oFxI/nc19ABFCAB1aHB7uOquPkzgq2xy
 USyohf57D22OwXlAgldgzDNq2fbVsRh0IggP+M+Au8bvaGZOEWiE219HB2rZfTQ=
X-Gm-Gg: ASbGnctWDZa/eGqVL4ZX6uM4Gq5ZoktwupOX9bCShX0i7sIU6fLM3qmDl8v8BQNKeSu
 sVcQJeiT2K6FLLeBC6zKvKBdkc65G1rrqMBRUKS8Gf9hrSnN1/Yqagu/1HkdVqCJZGlo4gJMQv/
 OuLAhFiPvxVwxVFh+BEiqF28ElmNGhFpyHzjvDkuTbKxvAsE4fo2li3Vj8WFZ4PZGTyAXoaVS4t
 bc1CJMw8f17IAU1knx9Ky6KyHYNYMYmOBqMjP94U6uxFZY++YjGt8qDGJrIMBvgnjl2dP3UzTES
 Ox47s6qecTvrE5gnxqwFoLwRFt+Blv/Yibi/jT3adtw81XdFL9g5fNHV8uHSI00V2+Ef0fchjUI
 ZUC9aNVp56Mi+uerHnW0=
X-Received: by 2002:a5d:5886:0:b0:391:4684:dbdb with SMTP id
 ffacd0b85a97d-3914684ddbemr1391364f8f.17.1741565231072; 
 Sun, 09 Mar 2025 17:07:11 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912bfb799fsm13080658f8f.2.2025.03.09.17.07.09
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 09 Mar 2025 17:07:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: BALATON Zoltan <balaton@eik.bme.hu>,
	qemu-devel@nongnu.org
Cc: Steven Lee <steven_lee@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
 Bernhard Beschow <shentey@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Guenter Roeck <linux@roeck-us.net>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Troy Lee <leetroy@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-block@nongnu.org, Jamin Lin <jamin_lin@aspeedtech.com>
Subject: [PATCH v5 09/14] hw/sd/sdhci: Allow SDHCI classes to register their
 own MemoryRegionOps
Date: Mon, 10 Mar 2025 01:06:15 +0100
Message-ID: <20250310000620.70120-10-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250310000620.70120-1-philmd@linaro.org>
References: <20250310000620.70120-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: G2t4iCTHNQOU

Add MemoryRegionOps as a class property. For now it is only
used by TYPE_IMX_USDHC.
Otherwise the default remains in little endian.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/sd/sdhci.h |  1 +
 hw/sd/sdhci.c         | 22 ++++++++--------------
 2 files changed, 9 insertions(+), 14 deletions(-)

diff --git a/include/hw/sd/sdhci.h b/include/hw/sd/sdhci.h
index dfa0c214036..108bc1993c6 100644
--- a/include/hw/sd/sdhci.h
+++ b/include/hw/sd/sdhci.h
@@ -117,6 +117,7 @@ struct SDHCIClass {
         SysBusDeviceClass sbd_parent_class;
     };
 
+    const MemoryRegionOps *io_ops;
     uint32_t quirks;
     uint64_t iomem_size;
 };
diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 3467385490d..6868bf68285 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -1428,8 +1428,6 @@ void sdhci_initfn(SDHCIState *s)
     s->transfer_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
                                      sdhci_data_transfer, s);
     s->quirks = s->sc->quirks;
-
-    s->io_ops = &sdhci_mmio_le_ops;
 }
 
 void sdhci_uninitfn(SDHCIState *s)
@@ -1447,6 +1445,7 @@ void sdhci_common_realize(SDHCIState *s, Error **errp)
     SDHCIClass *sc = s->sc;
     const char *class_name = object_get_typename(OBJECT(s));
 
+    s->io_ops = sc->io_ops ?: &sdhci_mmio_le_ops;
     switch (s->endianness) {
     case DEVICE_LITTLE_ENDIAN:
         /* s->io_ops is little endian by default */
@@ -1890,17 +1889,11 @@ static const MemoryRegionOps usdhc_mmio_ops = {
     .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
-static void imx_usdhc_init(Object *obj)
-{
-    SDHCIState *s = SYSBUS_SDHCI(obj);
-
-    s->io_ops = &usdhc_mmio_ops;
-}
-
 static void imx_usdhc_class_init(ObjectClass *oc, void *data)
 {
     SDHCIClass *sc = SYSBUS_SDHCI_CLASS(oc);
 
+    sc->io_ops = &usdhc_mmio_ops;
     sc->quirks = BIT(SDHCI_QUIRK_NO_BUSY_IRQ);
 
     sdhci_common_class_init(oc, data);
@@ -1957,11 +1950,13 @@ static const MemoryRegionOps sdhci_s3c_mmio_ops = {
     .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
-static void sdhci_s3c_init(Object *obj)
+static void sdhci_s3c_class_init(ObjectClass *oc, void *data)
 {
-    SDHCIState *s = SYSBUS_SDHCI(obj);
+    SDHCIClass *sc = SYSBUS_SDHCI_CLASS(oc);
 
-    s->io_ops = &sdhci_s3c_mmio_ops;
+    sc->io_ops = &sdhci_s3c_mmio_ops;
+
+    sdhci_common_class_init(oc, data);
 }
 
 static const TypeInfo sdhci_types[] = {
@@ -1983,13 +1978,12 @@ static const TypeInfo sdhci_types[] = {
     {
         .name = TYPE_IMX_USDHC,
         .parent = TYPE_SYSBUS_SDHCI,
-        .instance_init = imx_usdhc_init,
         .class_init = imx_usdhc_class_init,
     },
     {
         .name = TYPE_S3C_SDHCI,
         .parent = TYPE_SYSBUS_SDHCI,
-        .instance_init = sdhci_s3c_init,
+        .class_init = sdhci_s3c_class_init,
     },
 };
 
-- 
2.47.1


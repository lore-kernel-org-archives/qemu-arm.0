Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp307580njc;
        Sat, 8 Mar 2025 13:39:24 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX58KHSA/cEMtGe0mM5wxBkM4DMvFJLkbJqNfFAiquT18nlqmCy/QPZ28EZIS3HkovxjDKOjOmyhuRnpw==@linaro.org
X-Google-Smtp-Source: AGHT+IH+dnM21ZllmJKkJKv9jTYltDzDKit23fRdPxre+h3tf+NA8nMaceFnLz61JDFtEvRpqDRy
X-Received: by 2002:a05:620a:880c:b0:7c2:4d7e:52e6 with SMTP id af79cd13be357-7c4e6178f86mr1255069685a.35.1741469964173;
        Sat, 08 Mar 2025 13:39:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741469964; cv=none;
        d=google.com; s=arc-20240605;
        b=A+GBV7ylpJtWTt5ldeRz8mOv1TuP6MrfmhhKE4WuFdGI9O3O1XE+E21o/1UwxSzprY
         3WBGoGoMVVbBBFxhQBXB39uBA6vWx2DAmyAWFJcL7pigdYOrkD6L0rhTlpaJVjqI+Xiz
         1UkHRIA+0D0WFkVFbm98vNf5QTAD2KIxzASaNmTJx86SXa4Isne526zue5trPuOUTvGk
         wlQqqq7NUHZdI/ThMeZtwd7paPBvUik3AuYXEahL5gJn26DSlBVgXmLwKHSl78s8ACPY
         OHUhZFX98W/ESjhnF+5zmHlug6r8Uq+wByYUWRWI3tjwKfZ7xHZki2E4xJELENx5AJt0
         se+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=K6w2s7vpLMt8PGTRM64NH99KcirJjbualG9t0DnJnfI=;
        fh=NwDtZJkp8XEipT22vd8G2nTUPLZlvcoPD4+BMb2VwpM=;
        b=EbDSAREVNzBCJPWHELsFpSkhRmH3kdXThtuXnrbn8sWdlREoqt39rrstfY/JNVmIxv
         BpLz/HY0DhlAwTk9jFbx3bz3LED1pkoKLq7jbLSYzx7FuQyAmQYbSuqJeK+wgHRPoDMw
         Z2ESYxwth3g8IbdHnxCmItLWHNtYpmrQMdoBftdD3O+NwBu7IJJz4s24MCN5z81lzwtM
         qXLYplDS9fKx3kHJV8cG2rXjMSmcOIYWF3NIcjwqEsp34lkNmE5nd7d4NzVocB+SW/5E
         KOHoqLeMv0zznfpCG8K2lZFIyBTqxKexLKeFRZBB12itW/rFZGJa+F0NoFCUl8/N0GYC
         mCxw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cyWVjh0z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c5439cb8bcsi146164985a.438.2025.03.08.13.39.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 08 Mar 2025 13:39:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cyWVjh0z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tr1sw-0007v0-A4; Sat, 08 Mar 2025 16:39:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tr1rG-0005au-EF
 for qemu-arm@nongnu.org; Sat, 08 Mar 2025 16:37:31 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tr1rE-0003wT-Qc
 for qemu-arm@nongnu.org; Sat, 08 Mar 2025 16:37:22 -0500
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-390e3b3d3f4so1429179f8f.2
 for <qemu-arm@nongnu.org>; Sat, 08 Mar 2025 13:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741469839; x=1742074639; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K6w2s7vpLMt8PGTRM64NH99KcirJjbualG9t0DnJnfI=;
 b=cyWVjh0z1ZCNvJBY+sgXujX7MvN5vbGkZ6k1fZwzJmzKapkpld6mOoGPYV9owkDRC2
 yysRDLfW6H7aG3N1YzlSYrMD/qxNTNLyNJkBVwBh8eMyQMFdwxFUCKksRXWPBU+BfH3J
 3gEAZGraI5tfpJRtbU7V/jk/mLX/CgO02lY1g7wNNfQs0TVi9/crV+09k7D1GKBka9BK
 bnwxbJgT2rZC2c15jpZKOiNlbaiuA6mVSgP3VBlFWbzWtQ1nIMbTolHUZKuu3IcQl7sj
 u8NwQINJaUi80+fLWZXoLZoZL6V0YocwFm4fwQEk3i+cOTcpJ0zdkQvtRFfrvLnhqpIy
 BrPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741469839; x=1742074639;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K6w2s7vpLMt8PGTRM64NH99KcirJjbualG9t0DnJnfI=;
 b=qXOmlodzFMgYJu//zWQTu1WzCAvmQP5EpdKFZ/sekuOdawm8wZL2Vh1GlJ9r8QEcFO
 xzk0GUPpxXFnyF8VJubv6KS94+tjNj622C63d9PzgT+uPNjHsoAWPRRtK3r9KYAoE1ky
 MXj0/f0hHeCmR0l4+frEjNW789tzoB7KTv4up/NM8kSxeT+WkmeR5ZIJlwq3IRC/nH6Q
 KmAwkDxnblBtcF8GtA6KG7bOaZfFxW/FQzWtgCLxvHYF+h3kM38FgClnk8Wi+Dw1OqGY
 He61rzSAb7PTOYVMJfm82PfX5ip0dgxF+p1RuV2Q/dCxh/isUt3BCazaILq8VrvZin51
 5KzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhWzxBLzf/6sRPfU0XIO3oHPmGvSa0ctobz8tRb+bkmamaZbPYJLqqmvWTUp36NyX6DONyTDZ6dw==@nongnu.org
X-Gm-Message-State: AOJu0Yyc2udas0mLAMsIE/QedYB+Aed/ean2x3bKbUnCwjhFsbqLf9dE
 lc1XCB4sq4Z8YkJ18//uodpUem1XbuQb7kw7jn1L5QAntU5YOTr9KwWxvJYAlgk=
X-Gm-Gg: ASbGncvemIxYOpNsgcdbzACwmP6E4wHrIPWFqyiHOlRyuc5y7lJmjU6Hfl4k29GeUJy
 IMs75WlkeJlRcs5rQ1fAeLlA+asvUzIYcehIkfwYI4TTZTBSsPxc4YwoTzbDNqBAwB9VfApQJCu
 wK549OwdahnoCbsfl8CrU8BJLegMtwcvpOhpKfN7UblDH+E6CfJHqTimckb0ZWL6PJdJYrqPE6M
 PuK2NJTDcQVm4O6X0s67GB5aaD5MvQG0MuAnVluA86Gz1yDHt+2tOsBYJgPPJp1RTn7+f4tdcCe
 e05t2m+wyml8fghXIWXNdCfYN59GpU9zVb8Fq1tGsICnQMqyLh5cBkymRr0C8jw42JAH4niu270
 l7rTqJQxS6BGaWkF62WA=
X-Received: by 2002:a5d:5f45:0:b0:38d:d9bd:18a6 with SMTP id
 ffacd0b85a97d-39132dc545dmr4796426f8f.42.1741469839210; 
 Sat, 08 Mar 2025 13:37:19 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912c1031e3sm9748796f8f.82.2025.03.08.13.37.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 08 Mar 2025 13:37:18 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	BALATON Zoltan <balaton@eik.bme.hu>
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Guenter Roeck <linux@roeck-us.net>, qemu-block@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>, qemu-arm@nongnu.org
Subject: [PATCH v4 07/14] hw/sd/sdhci: Allow SDHCI classes to register their
 own MemoryRegionOps
Date: Sat,  8 Mar 2025 22:36:33 +0100
Message-ID: <20250308213640.13138-8-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250308213640.13138-1-philmd@linaro.org>
References: <20250308213640.13138-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
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
X-TUID: XZPtzGr6aDeH

Add MemoryRegionOps as a class property. For now it is only
used by TYPE_IMX_USDHC.
Otherwise the default remains in little endian.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/sd/sdhci.h |  1 +
 hw/sd/sdhci.c         | 22 ++++++++--------------
 2 files changed, 9 insertions(+), 14 deletions(-)

diff --git a/include/hw/sd/sdhci.h b/include/hw/sd/sdhci.h
index 2709a7a69d5..60a0442c805 100644
--- a/include/hw/sd/sdhci.h
+++ b/include/hw/sd/sdhci.h
@@ -112,6 +112,7 @@ typedef struct SDHCIClass {
         SysBusDeviceClass sbd_parent_class;
     };
 
+    const MemoryRegionOps *io_ops;
     uint32_t quirks;
     uint64_t iomem_size;
 } SDHCIClass;
diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 637067fef50..ae485f90dfe 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -1427,8 +1427,6 @@ void sdhci_initfn(SDHCIState *s)
                                    sdhci_raise_insertion_irq, s);
     s->transfer_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
                                      sdhci_data_transfer, s);
-
-    s->io_ops = &sdhci_mmio_le_ops;
 }
 
 void sdhci_uninitfn(SDHCIState *s)
@@ -1446,6 +1444,7 @@ void sdhci_common_realize(SDHCIState *s, Error **errp)
     SDHCIClass *sc = SYSBUS_SDHCI_GET_CLASS(s);
     const char *class_name = object_get_typename(OBJECT(s));
 
+    s->io_ops = sc->io_ops ?: &sdhci_mmio_le_ops;
     switch (s->endianness) {
     case DEVICE_LITTLE_ENDIAN:
         /* s->io_ops is little endian by default */
@@ -1889,17 +1888,11 @@ static const MemoryRegionOps usdhc_mmio_ops = {
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
     sc->quirks = SDHCI_QUIRK_NO_BUSY_IRQ;
 
     sdhci_common_class_init(oc, data);
@@ -1956,11 +1949,13 @@ static const MemoryRegionOps sdhci_s3c_mmio_ops = {
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
@@ -1982,13 +1977,12 @@ static const TypeInfo sdhci_types[] = {
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


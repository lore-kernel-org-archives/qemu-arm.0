Received: by 2002:a17:906:c0c2:b0:a52:4db9:938b with SMTP id bn2csp1281373ejb;
        Thu, 25 Apr 2024 04:07:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVhMDlfCp9Du3wdrwKUow8h5VHDA+biX2dfRT67/nZvgKKZaAVAcm+5rYhU5QOytWu+h3xxyXi3aEYx2TF3FVgS28CBsRQ6
X-Google-Smtp-Source: AGHT+IHNdP0ucvAGSvXZD7O3NzUmJ7WubLh2Fp7iYkuvw9nIffmBhohOr064/tu1wfFhVnVKNRpX
X-Received: by 2002:a05:622a:5486:b0:437:a0fb:cffe with SMTP id ep6-20020a05622a548600b00437a0fbcffemr5840609qtb.30.1714043224484;
        Thu, 25 Apr 2024 04:07:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714043224; cv=none;
        d=google.com; s=arc-20160816;
        b=jYFjC1XTpCIV8IhyNw5n2Kfswv9dVmMpYKB8NeyXJo5qOLEHaoHJPBsaRPy0/vVFS0
         e99R0F3hau6iHoY+lx9o2pe7BQz2AOOHx5Oq/I3PKiyzzjUlC3VmD9GrjDDl30XnsCz5
         iBFv+u1UH6h9FdpdI51aJ6qGhvOqVHjYCHVP3w8gSgXkRmPOcmCzWD6Ui7iQPrqUNuyM
         C2n3CaGZMZ/RRlWmu467s8J/opTVyo/CDLlA0bmCYySyqq/euJvgl8OKY3wVpANb0e/a
         OtwB5aHW9H27xlXCJKPLA8JMprTMaeI91z7fBenY+OpP2PTu23dpNxaF+LluJ9CgZi9w
         huZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=lYhjl1/jGiesNQD68pOCk3VBrraJnT7fa7wrXc4FOT0=;
        fh=khSsstD5wp7MeXcWmYw7ra0JOLDaL+RBbV1hZba9Zc0=;
        b=mC+aPvxN7AW52idlxelvD3tJAhWnhqXmOJ3yIGefU+Yc9Pk/vE7wWKtGFbHqykduu2
         Ui8F4wSQIyPvWpnmqI10+RgATDC4GBIFwzUGAtesh2ZeYObIebM3Th9L10toq/Ta5Ioo
         7kVkt94QeRJgPSmsPAZoeDcvfm2J7AykBZzV8GfEwxZ9iNnUSr4qzKPQgnU4ZVbDqzfV
         M6we0FQZjb6r9yf0sseAlYCmbM4+lCDaiTT+9dRp3gBhzT8/6+T8wvogdhauylEDt75V
         Dwcd2N2jqgVaJUbI8mOH8yBkZ1VqXnpZ9FFj6SU8mk3isERuKPks5EbZxXLNsB8xhn+S
         V1LQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sS9SNaY2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b16-20020a05622a021000b00434363526f9si12924048qtx.125.2024.04.25.04.07.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Apr 2024 04:07:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sS9SNaY2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rzwtl-0000Xj-QB; Thu, 25 Apr 2024 07:04:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rzwsI-00085n-0E
 for qemu-arm@nongnu.org; Thu, 25 Apr 2024 07:02:47 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rzwsF-0008IO-Mk
 for qemu-arm@nongnu.org; Thu, 25 Apr 2024 07:02:44 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-41b5dd5af48so1782925e9.0
 for <qemu-arm@nongnu.org>; Thu, 25 Apr 2024 04:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714042960; x=1714647760; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lYhjl1/jGiesNQD68pOCk3VBrraJnT7fa7wrXc4FOT0=;
 b=sS9SNaY2m91SB2OuGxhRGe3Zi640dzqYr+7FM0qXPCca7ZjDwL/7jLEsJbRCeN/MHm
 zN1X0yKopOlZPSXZfLa3wjPoTrNBk8SINFYZR/C+049d1tuYW2c5L/Z0ui3IzYdHEbCm
 /hGKBzdn4K+uv4/MTZmHgpTgouyIjQAPlGqBs9O3RxD+gWzDjxjtPcu5D6Z2TY448kok
 03cz9qZGWePMuofu9qcMXjLqfWrk9NMXwUz9movYjDmH9UMh8GuXIE2hefebeWK66uU5
 hz7r/e/mwMwK/3nsJn/wKPm7RR9wIF+FSudPsR3mApq9xr3ehinTIGtLyNoPY+loV+th
 7tww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714042960; x=1714647760;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lYhjl1/jGiesNQD68pOCk3VBrraJnT7fa7wrXc4FOT0=;
 b=ua9l4cnQ4f+xkPKMrKW7B2nRMcwC8pt+VY3RIuRThA9Kg4A5Or5Y+PbUPwcAxaiDRm
 wC1mJVMDG272iiKFxhl+dOo5X5WZoev7kwVGevD1qXgwqONbZ+In7c/S+OzPgqcuISua
 gXj2uU0d+yR3OqO+of58UIB/3PVmUjrb63nQjw+JJc+SMES1aZ6xzzsOCcWjv3QuflS3
 iA1X6/1mHbCV9m52CyLdUCEGyJ/UjnflzkvXiE3MyVoslCMhIyowWNFg8FL1bGowigIA
 Z+EWeskWjPpmv/xMeQ7Gt/O/mF/ynMgxbLSdWc9ACtdhE6+qDGeFnqeBDyTmESyh5xJt
 SxOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlPDosf6FfslCT1Ryy7z7Uo29WAMl/ye0ssB3j88lj6vJ9iumc4lgSbeNxlY/mo5G7RhVA+RZpiGOTH3v/UBhAGO1T
X-Gm-Message-State: AOJu0Yz4JWOEJQU3+Gbq3LNoCDxVeNah2vlwXcgUMlL6tLrCqYB0NTk0
 bQktj+1QzEh3BHtkhYVwSddxeLPbUNKRAJcfFt49EvtHyDKvhrDe0bhT4JW/i0Q=
X-Received: by 2002:a05:6000:47:b0:33d:b376:8a07 with SMTP id
 k7-20020a056000004700b0033db3768a07mr3496522wrx.8.1714042960487; 
 Thu, 25 Apr 2024 04:02:40 -0700 (PDT)
Received: from localhost.localdomain ([92.88.170.77])
 by smtp.gmail.com with ESMTPSA id
 y18-20020a5d4ad2000000b0034a0d3c0715sm19281014wrs.50.2024.04.25.04.02.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 25 Apr 2024 04:02:40 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 07/22] hw/misc/applesmc: Simplify DeviceReset handler
Date: Thu, 25 Apr 2024 13:01:40 +0200
Message-ID: <20240425110157.20328-8-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240425110157.20328-1-philmd@linaro.org>
References: <20240425110157.20328-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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
X-TUID: KIOEGZxFKO0E

Have applesmc_find_key() return a const pointer.
Since the returned buffers are not modified in
applesmc_io_data_write(), it is pointless to
delete and re-add the keys in the DeviceReset
handler. Add them once in DeviceRealize, and
discard them in the DeviceUnrealize handler.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20240410180819.92332-1-philmd@linaro.org>
---
 hw/misc/applesmc.c | 36 +++++++++++++++++++++---------------
 1 file changed, 21 insertions(+), 15 deletions(-)

diff --git a/hw/misc/applesmc.c b/hw/misc/applesmc.c
index 14e3ef667d..59a4899312 100644
--- a/hw/misc/applesmc.c
+++ b/hw/misc/applesmc.c
@@ -145,7 +145,7 @@ static void applesmc_io_cmd_write(void *opaque, hwaddr addr, uint64_t val,
     s->data_pos = 0;
 }
 
-static struct AppleSMCData *applesmc_find_key(AppleSMCState *s)
+static const struct AppleSMCData *applesmc_find_key(AppleSMCState *s)
 {
     struct AppleSMCData *d;
 
@@ -161,7 +161,7 @@ static void applesmc_io_data_write(void *opaque, hwaddr addr, uint64_t val,
                                    unsigned size)
 {
     AppleSMCState *s = opaque;
-    struct AppleSMCData *d;
+    const struct AppleSMCData *d;
 
     smc_debug("DATA received: 0x%02x\n", (uint8_t)val);
     switch (s->cmd) {
@@ -269,23 +269,10 @@ static void applesmc_add_key(AppleSMCState *s, const char *key,
 static void qdev_applesmc_isa_reset(DeviceState *dev)
 {
     AppleSMCState *s = APPLE_SMC(dev);
-    struct AppleSMCData *d, *next;
 
-    /* Remove existing entries */
-    QLIST_FOREACH_SAFE(d, &s->data_def, node, next) {
-        QLIST_REMOVE(d, node);
-        g_free(d);
-    }
     s->status = 0x00;
     s->status_1e = 0x00;
     s->last_ret = 0x00;
-
-    applesmc_add_key(s, "REV ", 6, "\x01\x13\x0f\x00\x00\x03");
-    applesmc_add_key(s, "OSK0", 32, s->osk);
-    applesmc_add_key(s, "OSK1", 32, s->osk + 32);
-    applesmc_add_key(s, "NATJ", 1, "\0");
-    applesmc_add_key(s, "MSSP", 1, "\0");
-    applesmc_add_key(s, "MSSD", 1, "\0x3");
 }
 
 static const MemoryRegionOps applesmc_data_io_ops = {
@@ -343,6 +330,24 @@ static void applesmc_isa_realize(DeviceState *dev, Error **errp)
     }
 
     QLIST_INIT(&s->data_def);
+    applesmc_add_key(s, "REV ", 6, "\x01\x13\x0f\x00\x00\x03");
+    applesmc_add_key(s, "OSK0", 32, s->osk);
+    applesmc_add_key(s, "OSK1", 32, s->osk + 32);
+    applesmc_add_key(s, "NATJ", 1, "\0");
+    applesmc_add_key(s, "MSSP", 1, "\0");
+    applesmc_add_key(s, "MSSD", 1, "\0x3");
+}
+
+static void applesmc_unrealize(DeviceState *dev)
+{
+    AppleSMCState *s = APPLE_SMC(dev);
+    struct AppleSMCData *d, *next;
+
+    /* Remove existing entries */
+    QLIST_FOREACH_SAFE(d, &s->data_def, node, next) {
+        QLIST_REMOVE(d, node);
+        g_free(d);
+    }
 }
 
 static Property applesmc_isa_properties[] = {
@@ -377,6 +382,7 @@ static void qdev_applesmc_class_init(ObjectClass *klass, void *data)
     AcpiDevAmlIfClass *adevc = ACPI_DEV_AML_IF_CLASS(klass);
 
     dc->realize = applesmc_isa_realize;
+    dc->unrealize = applesmc_unrealize;
     dc->reset = qdev_applesmc_isa_reset;
     device_class_set_props(dc, applesmc_isa_properties);
     set_bit(DEVICE_CATEGORY_MISC, dc->categories);
-- 
2.41.0


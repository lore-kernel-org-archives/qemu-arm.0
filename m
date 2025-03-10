Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp843006njc;
        Sun, 9 Mar 2025 17:09:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV9zxvpbYzrwFMbfaHYDlcPz1oozdRO2e8VkkaVAFT9E9Jt9FKbIXOM3IyIWJ3sx9scslqN5qYL9XezQw==@linaro.org
X-Google-Smtp-Source: AGHT+IG3vZr6BdFB6u6z4WJ5/SoXufMaCP8wXz8+Z0A1NF/YrqUslguGKM+CPUdurZUR8w3DUdmF
X-Received: by 2002:a05:6214:20c4:b0:6e8:f940:50af with SMTP id 6a1803df08f44-6e9006b925dmr172358086d6.44.1741565346559;
        Sun, 09 Mar 2025 17:09:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741565346; cv=none;
        d=google.com; s=arc-20240605;
        b=JnUnYS/MERm4ru3jhbDkkf9aZwLpKUz40iBfq3s74osQL/tq43BkQX0rW6xxI45J1d
         jgyRDwC0SEhO4urvlUxP6zrbVMBgDo671HTBHo37Kb+FM/3NFMtYV3J7xGFpo1Cqweqh
         zOQsuDAPsufZMQQnVZ0RjWk11XIRiFqsxK3nUmXN2tm6n/pupz7i1MzGunabcyU7NtGe
         1oQINpfqUaqy9owm7n/FEl3ZvU3mHQpjwpAJffdV8048CXnFnMkP/l5ofjJ477+2RrkJ
         J59McCo34STBlZgzWtojm/2AtRTkmZz0haAXlxOqwVwq4Lx/z0ci+cLeN9gqUT/4VGNw
         qoLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=dQS2FpqOs5TSI58lEsf5ODh6U5Cq4SEzmJ94sUa1jSg=;
        fh=MkSM7oIGlcgcaLi0PTgZHsYllgqQhHNoJ9LoisiR0xA=;
        b=e5dL/obI8Z1HBzx8SawSN3UdhpBdXY+oer4xiR+ccgA68H3XmbATZZoHzsiZWevIE0
         UytGpAnZk/phDT1IDmOiShrt4uTBVXSwXjc2SzaDnZIELo7MImvZmaxzKaiHFTdyvAbd
         XEhr47MuP1zE9fL4VbyWgL4Rp9hPsdRAqF7Cf5KwIrkDn5cNoL895E3tJuyRKgxWpDu3
         w6ze9OJAu+wQENst/lQW+ZmhZ2otru3rwTHXpjtEVXggZFpE6CXl2Z9j/5o+7T4qGiAP
         tyRuu5LcPUO9uueayugaVR2QQQoZrXfy2xqhVWQFaPrXRA9aCEkgcf6Ucgmvx9/+mC4G
         6T3w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hDtuaXB+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e8f716291asi78958916d6.224.2025.03.09.17.09.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 09 Mar 2025 17:09:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hDtuaXB+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1trQfS-0001wC-4X; Sun, 09 Mar 2025 20:06:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1trQfQ-0001ug-0M
 for qemu-arm@nongnu.org; Sun, 09 Mar 2025 20:06:48 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1trQfN-0007L9-Vm
 for qemu-arm@nongnu.org; Sun, 09 Mar 2025 20:06:47 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43cf0d787eeso6715545e9.3
 for <qemu-arm@nongnu.org>; Sun, 09 Mar 2025 17:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741565204; x=1742170004; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dQS2FpqOs5TSI58lEsf5ODh6U5Cq4SEzmJ94sUa1jSg=;
 b=hDtuaXB+7emPGfX07HSZgKmQPenHFt1Ikhz69OYJPeMkJobeRLLTq+Ypf6ntonqor/
 q86+VPYQG0lAKu12tQN4/i9fNN6XWdrslzIszwIj8Pl4WPKCBwUXHDXaRSjfDIn2qkul
 X67GUpq/VLP8Dp0EzkRIZ3AT6BaH8/2xMXw56cNUvEjs4kYGJPZMAtcbgNdUMs6869Lm
 z3ZW9MylhPNjOxqTRK+J3/YWJkSZCvuIeKIiTP4ZKAKoNL75Ds0yYdsTG1iUlt7jRwYO
 24DK4+xSfuHXr/gCssgbhzYfjjWOUuakbaGkcdzKoUAWwDVnMHfrlQKYZI5MGJLbht0z
 hFXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741565204; x=1742170004;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dQS2FpqOs5TSI58lEsf5ODh6U5Cq4SEzmJ94sUa1jSg=;
 b=wAMIBHJSEl8Z/r+GEXNFjZrG8lK89No9uSj0wEhStGSnWGqKo9pO5+6NZnwItFK/a/
 MG7VE3rOCrrRgHQW/Njyx1AOCSzdVVt3eLvJM5WxnHVfw6ht3pBWYEAbwdRn4R9ohxtK
 KLV4dghINMNeG/50vAQOXlV0yhZ77+ro07lnAh/aoNGfm4SLY1HtmgodBO73Y5x6N24q
 hpdssG3CZTp/BKMSGaVVJGuPRp1Kb208FnuzpDgLmHZ7zkQzecxVdHSp7yqSg3MB+V3O
 U+UUSNRCa+ipVyWzJGm63VfuTdB2XCKC69xbMxUau66L0214kNBG1iHr6yUgvUJXREqp
 gDXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6+n37HPWzWUJ1QX+/7rtS3AA6h3hqWlL+VtMavPxPGnYPNk31EL3aZOoCrXcrnNA57Zlab4t/AQ==@nongnu.org
X-Gm-Message-State: AOJu0YxmAim17yXiPieydF7NIA3m7ZL8A7M7kPPrG37cVMF/RO19Jvpo
 QTCLYKgAX2VfT6QqkkEtOmBUPIBzfOqll8xyQDkaxl6Sk6OYOpINSDuAazI1hLE=
X-Gm-Gg: ASbGnctkb39u4j9b8v2Yzz+Agw0YGk+aKomq11jZdWYFkz4yUXWa6giS7SttA3wYS1O
 aGpIwhpWys0rOdoaQU3S/HPAEjb7Blbjq2uWYmwxXzHTo02V2/gZiDfsirXlQcFZYMW09y+xPw8
 uv6TIL6rSd2tRvzSErWkrx4ZM1BFlSaP41ipp6sY70TR8GhPSlJ5z+SZKf0bCO4XKYXdntX2nKB
 LSjCXVB+F6ZsSuYcPd6VttEcWJhGOYna8SOsfCsOyCmoOGGpbOTJaSfo+1MTU/KA5ZyxFsqQlez
 lmeYp8HKyH07JQeZpLZxzqkbaU/7xn9IGYO9y2Pt/pp0TATcE8R9tv+1XJqaXyYh13UFrDf60gM
 Lnn8jMUO+SFmZ4KvHV77pOJ1FFyGoCA==
X-Received: by 2002:a05:600c:5129:b0:43c:f689:88ce with SMTP id
 5b1f17b1804b1-43cf6898affmr12074285e9.20.1741565204360; 
 Sun, 09 Mar 2025 17:06:44 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bdd8db6c7sm127555375e9.22.2025.03.09.17.06.43
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 09 Mar 2025 17:06:43 -0700 (PDT)
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
Subject: [PATCH v5 04/14] hw/sd/sdhci: Include 'wp-inverted' property in quirk
 bitmask
Date: Mon, 10 Mar 2025 01:06:10 +0100
Message-ID: <20250310000620.70120-5-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250310000620.70120-1-philmd@linaro.org>
References: <20250310000620.70120-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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
X-TUID: RhXl8Evotf40

Import Linux's SDHCI_QUIRK_INVERTED_WRITE_PROTECT quirk definition.

Replace 'wp_inverted' boolean by a bit in quirk bitmask.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/sd/sdhci.h | 16 ++++++++++------
 hw/arm/aspeed.c       |  2 +-
 hw/sd/sdhci.c         |  6 +++---
 3 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/include/hw/sd/sdhci.h b/include/hw/sd/sdhci.h
index 096d607f4b7..d2e4f0f0050 100644
--- a/include/hw/sd/sdhci.h
+++ b/include/hw/sd/sdhci.h
@@ -30,7 +30,14 @@
 #include "hw/sd/sd.h"
 #include "qom/object.h"
 
-/* SD/MMC host controller state */
+/*
+ * SD/MMC host controller state
+ *
+ * QEMU interface:
+ *  + QOM property "wp-inverted-quirk" inverts the Write Protect pin
+ *    polarity (by default the polarity is active low for detecting SD
+ *    card to be protected).
+ */
 struct SDHCIState {
     /*< private >*/
     union {
@@ -99,11 +106,6 @@ struct SDHCIState {
     uint8_t endianness;
     uint8_t sd_spec_version;
     uint8_t uhs_mode;
-    /*
-     * Write Protect pin default active low for detecting SD card
-     * to be protected. Set wp_inverted to invert the signal.
-     */
-    bool wp_inverted;
 };
 typedef struct SDHCIState SDHCIState;
 
@@ -114,6 +116,8 @@ typedef struct SDHCIState SDHCIState;
 enum {
     /* Controller does not provide transfer-complete interrupt when not busy. */
     SDHCI_QUIRK_NO_BUSY_IRQ                     = 14,
+    /* Controller reports inverted write-protect state */
+    SDHCI_QUIRK_INVERTED_WRITE_PROTECT          = 16,
 };
 
 #define TYPE_PCI_SDHCI "sdhci-pci"
diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 98bf071139b..daee2376d50 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -412,7 +412,7 @@ static void aspeed_machine_init(MachineState *machine)
     if (amc->sdhci_wp_inverted) {
         for (i = 0; i < bmc->soc->sdhci.num_slots; i++) {
             object_property_set_bool(OBJECT(&bmc->soc->sdhci.slots[i]),
-                                     "wp-inverted", true, &error_abort);
+                                     "wp-inverted-quirk", true, &error_abort);
         }
     }
     if (machine->kernel_filename) {
diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 1dc942a0e06..19c600d5bfc 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -274,7 +274,7 @@ static void sdhci_set_readonly(DeviceState *dev, bool level)
 {
     SDHCIState *s = (SDHCIState *)dev;
 
-    if (s->wp_inverted) {
+    if (s->quirks & BIT(SDHCI_QUIRK_INVERTED_WRITE_PROTECT)) {
         level = !level;
     }
 
@@ -1555,12 +1555,12 @@ void sdhci_common_class_init(ObjectClass *klass, const void *data)
 
 static const Property sdhci_sysbus_properties[] = {
     DEFINE_SDHCI_COMMON_PROPERTIES(SDHCIState),
+    DEFINE_PROP_BIT("wp-inverted-quirk", SDHCIState, quirks,
+                    SDHCI_QUIRK_INVERTED_WRITE_PROTECT, false),
     DEFINE_PROP_BOOL("pending-insert-quirk", SDHCIState, pending_insert_quirk,
                      false),
     DEFINE_PROP_LINK("dma", SDHCIState,
                      dma_mr, TYPE_MEMORY_REGION, MemoryRegion *),
-    DEFINE_PROP_BOOL("wp-inverted", SDHCIState,
-                     wp_inverted, false),
 };
 
 static void sdhci_sysbus_init(Object *obj)
-- 
2.47.1


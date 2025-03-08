Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp251671njc;
        Sat, 8 Mar 2025 11:03:10 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCURsRrQY2Ig5h31qzXFdmxKv2IFfmZ/+f2PkDJjknZMUd4jFyUAZh9BzpLemEXNeeaJMRyBYmwxA1eMmg==@linaro.org
X-Google-Smtp-Source: AGHT+IFMObaY5fPjvQ2n8cQ/KAHy89U39/hwykqZjOHuKmhbLTAZUKo2lXKGAKoanKPfBpV83cFh
X-Received: by 2002:a05:6122:21a1:b0:520:42d3:91bc with SMTP id 71dfb90a1353d-523e403eaffmr6399435e0c.2.1741460589886;
        Sat, 08 Mar 2025 11:03:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741460589; cv=none;
        d=google.com; s=arc-20240605;
        b=HiSq16Hhb40n1cjhf/K/x2hKnTZHUSE6K7pBY3LXCzc8/VRIDn4LL7WAuRXnEjzgAm
         goKDjHQt5kniqeiOkCpfF9Dmlt1EjDOBU4ZEAe+fXw89eaQou9xTRP/Gq5mS6GCmtPPG
         2hNbC83k7zKenufh2uzJrE+HBt6QpNH0M+wGWa1jWuYi4eitb6/P497CmdntMi3m8RJ8
         K3PwREIYd/C0qZ74DOHN9YQnbWwjZRNOZ5R8/XuP8cHIIgwRh/4HjZcq5Dtb5d+LRM2o
         EcQsvaVhDd9XWeQfth8uum7dQ0uVWkP1tu8+m6IA4a3s0azVqNsFzOZYTYdc5ZrwUOdh
         EEgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=F+yC7kcIFYBDlEb5elpDYxZqmpjHBPCkNQfWZnM7SA0=;
        fh=SAtR36XA5V2ux0K41wMJR3JQJwaaF6PTUaAvfV9GAno=;
        b=a839gIbP/O1vSj6g6B84E0Nodr9QapStsH7qQjWk/bc3iDTSL6YxApRExkTqYqHAjo
         Q4CIp0JMjsbwnAvTxYWIKThEpAgnRneVSUl2uY6YzLt2ZW2lp+5c199lYgXsY/Boj6g2
         JDxk/zmrGHH951cQoalc1XcYQ7t5888HUs7njDhOLZxudaOKz7SXAjzIVi0fM6mIBzsU
         HRN/tHJJfjEdkYRtbeZ75tzyI2HbYu27cGTB5YhVGd/jtUhtYajy4cj878AkE2ti5NsQ
         QeAgUeeH5sA9lWNJzkz/7m1vno5rdqerVGvKAw33EtRMkJfkddOib4p9KQJVuS3sR1LF
         3d2A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=C1mePILG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-523d8c59582si1386186e0c.159.2025.03.08.11.03.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 08 Mar 2025 11:03:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=C1mePILG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tqzRs-0006ul-89; Sat, 08 Mar 2025 14:03:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tqzRi-0006m6-PY
 for qemu-arm@nongnu.org; Sat, 08 Mar 2025 14:02:52 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tqzRY-0003UJ-Gd
 for qemu-arm@nongnu.org; Sat, 08 Mar 2025 14:02:45 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4393dc02b78so17536885e9.3
 for <qemu-arm@nongnu.org>; Sat, 08 Mar 2025 11:02:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741460557; x=1742065357; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F+yC7kcIFYBDlEb5elpDYxZqmpjHBPCkNQfWZnM7SA0=;
 b=C1mePILG8sVuHo/ueoqNt0XxoEcLFKwynu4L+UOvlWM4bTOyGzc2fHuWrzUJraQPOo
 sJQxQqhragwb13HwZ1sfzvXHqJqqIBanEz437szcfhBJL0C74bcTesquwkAjtxrzQJOi
 x9y1YvIZLvhSFTvG3C5TeNvHjTVdoPczQJqz3fKr/WLLuGa1332lvkiYkUTVchG8uBNz
 PwexHTZLi7YP5UA3J0JK48WODwyl6F3HcFk2xhsUYAMVph4YFJNet7uyrnPf9zYnPA/3
 Q7jK3G8QOoOJ8fF4HbhuSaVNvHnG2So9SlZvD1hmZwQ6pTDdGLDuboo8BYpvbjM3m9W+
 yy7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741460557; x=1742065357;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F+yC7kcIFYBDlEb5elpDYxZqmpjHBPCkNQfWZnM7SA0=;
 b=LJqc41JScdn3dXJv3PrYbqo9iQtXGBiNa3QZzOZlTsrV6ZJMX+tsGI87koJ9aZoH6P
 5z0jU4G/nnCfVTVHkjBkEzwSM2S0dF2TZ1JhT4NHV7oNYBeMhR6jgLzLwcqkLuU+g3O1
 lC+/pny/irgs9qqXNpWgdRY4UTlOtd8mIXXfBpDR013TU+3AT7xl3WBii9S9g09EwRUJ
 sdyddiviMCHweykue0K7B0bAVSU45YV5U0OuzykAOHKyT3byjHV1fgs69SL+l8ibq6Eu
 cYsmCS6M62QtgOYQlt0juRMd3ZLcIaWLeHL9R0BEvSZJcPRGLw14tKbkEYXd1EGLA0k/
 Gm8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJpRKCCE/iEoBbzEjlRmXq4nYFoFeKTIgq7jHxxLM/igGcja1AE5h/ZpaRuVt0w5yF9RQe+bunAQ==@nongnu.org
X-Gm-Message-State: AOJu0YynWv+RYW+QFcKnbExJ60SEmioj9RzwnYK61PuhvdOyFtWKSuaw
 fr8ehTZp7Lnw+BmEmBZi7banc3tTnxe/mXQDM9/C9ZkwdLxq9beucndv5tHvmAg=
X-Gm-Gg: ASbGncvH6ohuT/wao9l5QWG8ooN2BuRRsjLRdyIt6SBp/ds1Ptllv6KgDpQ7XqBET1s
 u2wrun4hKKqJAC3BcwFCoyV7hhPbnGD9lSfUYuKs94Fg+TRzZ4Qhhu8kiYXx04o68mUgsEuhcl3
 Ajo/fqVydhK0aOByLDgub31if0K55Ss+u5cSRnbtDR2D9SwuAw6V0JT9/JNXm1Hd5Tf629Ypi3H
 HIQFujM63KjZrNOjfTjclraUeczt05tLtZcYjqFqB1kU5Jq6Ed2CwQjFYsyOjKJI2+LsZN2ycea
 HzyN6o3O655lUoZR14tI9Rj6VVgfUXGT6YwqmSQoG8Zvzi8ySHBQOOPZNCgYMWEByfqRfElpmsd
 AE0vFLmhHpVP2M3NCqyU=
X-Received: by 2002:a5d:6d05:0:b0:391:13d6:c9ec with SMTP id
 ffacd0b85a97d-39132d88ee1mr5624207f8f.20.1741460557363; 
 Sat, 08 Mar 2025 11:02:37 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912c1037b4sm9653479f8f.92.2025.03.08.11.02.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 08 Mar 2025 11:02:36 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: BALATON Zoltan <balaton@eik.bme.hu>,
	qemu-devel@nongnu.org
Cc: Bernhard Beschow <shentey@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 Guenter Roeck <linux@roeck-us.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 01/12] hw/sd/sdhci: Remove need for SDHCIState::vendor field
Date: Sat,  8 Mar 2025 20:02:19 +0100
Message-ID: <20250308190230.7508-2-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250308190230.7508-1-philmd@linaro.org>
References: <20250308190230.7508-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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
X-TUID: mAPmkUHPxECz

All instances of TYPE_IMX_USDHC set vendor=SDHCI_VENDOR_IMX.
No need to special-case it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/sd/sdhci-internal.h |  1 -
 include/hw/sd/sdhci.h  |  4 ----
 hw/arm/fsl-imx25.c     |  2 --
 hw/arm/fsl-imx6.c      |  2 --
 hw/arm/fsl-imx6ul.c    |  2 --
 hw/arm/fsl-imx7.c      |  2 --
 hw/arm/fsl-imx8mp.c    |  2 --
 hw/sd/sdhci.c          | 14 ++++----------
 8 files changed, 4 insertions(+), 25 deletions(-)

diff --git a/hw/sd/sdhci-internal.h b/hw/sd/sdhci-internal.h
index 9f768c418e0..9072b06bdde 100644
--- a/hw/sd/sdhci-internal.h
+++ b/hw/sd/sdhci-internal.h
@@ -311,7 +311,6 @@ extern const VMStateDescription sdhci_vmstate;
     DEFINE_PROP_UINT8("endianness", _state, endianness, DEVICE_LITTLE_ENDIAN), \
     DEFINE_PROP_UINT8("sd-spec-version", _state, sd_spec_version, 2), \
     DEFINE_PROP_UINT8("uhs", _state, uhs_mode, UHS_NOT_SUPPORTED), \
-    DEFINE_PROP_UINT8("vendor", _state, vendor, SDHCI_VENDOR_NONE), \
     \
     /* Capabilities registers provide information on supported
      * features of this specific host controller implementation */ \
diff --git a/include/hw/sd/sdhci.h b/include/hw/sd/sdhci.h
index 38c08e28598..48247e9a20f 100644
--- a/include/hw/sd/sdhci.h
+++ b/include/hw/sd/sdhci.h
@@ -99,7 +99,6 @@ struct SDHCIState {
     uint8_t endianness;
     uint8_t sd_spec_version;
     uint8_t uhs_mode;
-    uint8_t vendor;        /* For vendor specific functionality */
     /*
      * Write Protect pin default active low for detecting SD card
      * to be protected. Set wp_inverted to invert the signal.
@@ -108,9 +107,6 @@ struct SDHCIState {
 };
 typedef struct SDHCIState SDHCIState;
 
-#define SDHCI_VENDOR_NONE       0
-#define SDHCI_VENDOR_IMX        1
-
 /*
  * Controller does not provide transfer-complete interrupt when not
  * busy.
diff --git a/hw/arm/fsl-imx25.c b/hw/arm/fsl-imx25.c
index 5359a6d8d3b..02214ca1a1c 100644
--- a/hw/arm/fsl-imx25.c
+++ b/hw/arm/fsl-imx25.c
@@ -243,8 +243,6 @@ static void fsl_imx25_realize(DeviceState *dev, Error **errp)
                                  &error_abort);
         object_property_set_uint(OBJECT(&s->esdhc[i]), "capareg",
                                  IMX25_ESDHC_CAPABILITIES, &error_abort);
-        object_property_set_uint(OBJECT(&s->esdhc[i]), "vendor",
-                                 SDHCI_VENDOR_IMX, &error_abort);
         if (!sysbus_realize(SYS_BUS_DEVICE(&s->esdhc[i]), errp)) {
             return;
         }
diff --git a/hw/arm/fsl-imx6.c b/hw/arm/fsl-imx6.c
index dc86338b3a5..a114dc0d63d 100644
--- a/hw/arm/fsl-imx6.c
+++ b/hw/arm/fsl-imx6.c
@@ -327,8 +327,6 @@ static void fsl_imx6_realize(DeviceState *dev, Error **errp)
                                  &error_abort);
         object_property_set_uint(OBJECT(&s->esdhc[i]), "capareg",
                                  IMX6_ESDHC_CAPABILITIES, &error_abort);
-        object_property_set_uint(OBJECT(&s->esdhc[i]), "vendor",
-                                 SDHCI_VENDOR_IMX, &error_abort);
         if (!sysbus_realize(SYS_BUS_DEVICE(&s->esdhc[i]), errp)) {
             return;
         }
diff --git a/hw/arm/fsl-imx6ul.c b/hw/arm/fsl-imx6ul.c
index 34c4aa15cd0..ce8d3ef535f 100644
--- a/hw/arm/fsl-imx6ul.c
+++ b/hw/arm/fsl-imx6ul.c
@@ -531,8 +531,6 @@ static void fsl_imx6ul_realize(DeviceState *dev, Error **errp)
             FSL_IMX6UL_USDHC2_IRQ,
         };
 
-        object_property_set_uint(OBJECT(&s->usdhc[i]), "vendor",
-                                 SDHCI_VENDOR_IMX, &error_abort);
         sysbus_realize(SYS_BUS_DEVICE(&s->usdhc[i]), &error_abort);
 
         sysbus_mmio_map(SYS_BUS_DEVICE(&s->usdhc[i]), 0,
diff --git a/hw/arm/fsl-imx7.c b/hw/arm/fsl-imx7.c
index 3374018cde0..ed1f10bca26 100644
--- a/hw/arm/fsl-imx7.c
+++ b/hw/arm/fsl-imx7.c
@@ -471,8 +471,6 @@ static void fsl_imx7_realize(DeviceState *dev, Error **errp)
             FSL_IMX7_USDHC3_IRQ,
         };
 
-        object_property_set_uint(OBJECT(&s->usdhc[i]), "vendor",
-                                 SDHCI_VENDOR_IMX, &error_abort);
         sysbus_realize(SYS_BUS_DEVICE(&s->usdhc[i]), &error_abort);
 
         sysbus_mmio_map(SYS_BUS_DEVICE(&s->usdhc[i]), 0,
diff --git a/hw/arm/fsl-imx8mp.c b/hw/arm/fsl-imx8mp.c
index 1ea98e14635..c3f6da63220 100644
--- a/hw/arm/fsl-imx8mp.c
+++ b/hw/arm/fsl-imx8mp.c
@@ -524,8 +524,6 @@ static void fsl_imx8mp_realize(DeviceState *dev, Error **errp)
             { fsl_imx8mp_memmap[FSL_IMX8MP_USDHC3].addr, FSL_IMX8MP_USDHC3_IRQ },
         };
 
-        object_property_set_uint(OBJECT(&s->usdhc[i]), "vendor",
-                                 SDHCI_VENDOR_IMX, &error_abort);
         if (!sysbus_realize(SYS_BUS_DEVICE(&s->usdhc[i]), errp)) {
             return;
         }
diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 1f45a77566c..149b748cbee 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -1731,16 +1731,10 @@ usdhc_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
 
     case USDHC_VENDOR_SPEC:
         s->vendor_spec = value;
-        switch (s->vendor) {
-        case SDHCI_VENDOR_IMX:
-            if (value & USDHC_IMX_FRC_SDCLK_ON) {
-                s->prnsts &= ~SDHC_IMX_CLOCK_GATE_OFF;
-            } else {
-                s->prnsts |= SDHC_IMX_CLOCK_GATE_OFF;
-            }
-            break;
-        default:
-            break;
+        if (value & USDHC_IMX_FRC_SDCLK_ON) {
+            s->prnsts &= ~SDHC_IMX_CLOCK_GATE_OFF;
+        } else {
+            s->prnsts |= SDHC_IMX_CLOCK_GATE_OFF;
         }
         break;
 
-- 
2.47.1


Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp911913njm;
        Wed, 5 Mar 2025 08:13:00 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXl1ePsPWmahyHIQXbVk3gC0eKNseQZc4m5ZrLjFIt6v1umnd3ldQVeyu0XBeuOtKX/Wmx1YTIjzhmTtQ==@linaro.org
X-Received: by 2002:a5d:47a2:0:b0:390:ebfb:ab62 with SMTP id ffacd0b85a97d-3911f72757dmr2227572f8f.4.1741191179952;
        Wed, 05 Mar 2025 08:12:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741191179; cv=none;
        d=google.com; s=arc-20240605;
        b=QmyB+5DnvlRU/jmxCspnWK7lFCSDlHsjAnFVTm3kYCn2uQxjjCF5Ras4uUfcch1yd5
         bY/4Y4Tpb+GUZICLYqD4PzQKOVP2ISBB625jGQdssK+jSG93VwySrzf+PivhcKuVYtFA
         6cy+t64ennP8toSkz+JYMNUMGF6J0Ex6S1P4WoYFz4Lb9RKgzrMUteyA6yQa3Cr6WDGA
         Z07gQaTtKCKhxH42itZbusgLHmtGwDPkKYwzN75ZnTKFM4D4uoFWxnsQnVoEH7Z3xPY4
         ZOoAH7LoA8Q0SwYy+C1xJYrDJW2X1iWvgyXgRLXBYWyQD9ESu6XNG/9Pe+XuxUsaryal
         lCTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=orvtcKfihVUFCViVDE72hkVKr7ZPDEWfYMWfWKQWuPY=;
        fh=YCeeDM3wXqEXksTTQnUFU8V6xFFdhtjWM8aYT0eJ2xc=;
        b=Hpp5MT1tYQC8o320pDjTCoZi7zCYF3czLRdinC3r8AYG0kyOJOLgEmHUM2EJVeVxZI
         ZymTTtgvlMts6rPPFYMfib3jksOyM62Kpq714BdBFBlEDsBFgsaqk4+ozFK9vGlgOyMY
         FMV7wQuSxtWsV+/UiDoEi43LQQhwdb1toIgnGqvuMMAJ4LwJ2sojkWnlxVIMZLBokd73
         MYc+t1nEFG1a2a+IHzZ/FRywxPhJ8xI6ofM1thYuG7wg4+K6CA8Gd2OVQw/wxtsPsG+5
         rRCqGqfBALEq8yc+OPDVAcrfkB5JNzKY7TYiHTBRR2BN5aBMEonMbRMp3p64rO5c9rNG
         Ms6Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=adSxasWh;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-43bd32796ccsor7846935e9.10.2025.03.05.08.12.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 05 Mar 2025 08:12:59 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=adSxasWh;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741191179; x=1741795979; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=orvtcKfihVUFCViVDE72hkVKr7ZPDEWfYMWfWKQWuPY=;
        b=adSxasWhR7DwwXlXnsK7x8nfnL60gUmIuvJinAnhpGA321q7Wyycg4UYNit6UcGnBy
         nTBHozK4+d87ljnDBX9Fz+Qx2dWYOndaCICcsRn+T8HsaVvSn4WSXhPAg5B/OaElENYQ
         iIpyCcTf10g1FXRqIglES0xnORm0ZoLlk7jLjlwZ26sMTbFRpLKbcCeRh6SWmXcBCxqv
         rXRjpz1QxE1AQbC6XAVxNW4Hy3ToixjoBRGIo/YMvDMdyGyQel4JxF3LjjTW6kxrCmpq
         YWiq/SVteS1qOKVe5gvtBPN15JzPNeCZ4FhniwUgn1FDAYz8xMAJL50bLuv9rKvTzoNN
         40xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741191179; x=1741795979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=orvtcKfihVUFCViVDE72hkVKr7ZPDEWfYMWfWKQWuPY=;
        b=eTK7GIVBuxPfqZv4pwn1GBTOuKrqgTTzeb4dTBfo9r+RfG3MmgLYr3ozFCgQZ/MPCS
         FA4pt0+NJ3B7TgulfQJ5CR45b8SFxEDodwc1PpsrDeKjcX72FG5ipqN06WpTA31cGZqI
         XEznNTqRn8ZpgojYKT6+JIE8vUhsSLMEqJkSTmBNIwr/BRuy5WBZYkosg9en/UCXF34y
         RiARyo2vbjjJ3Y26FhskM+z1aQbCvSZAtZZF91+RTXtpPOvvvDfvsJEIfRifecN6wVZk
         +j3o3jY6eW+sgrOPlOwmib+iIpbmCI6hwJ63jz0rMJ+KOzQdM+23UdmRDrdVfDhkdqEZ
         l3pA==
X-Forwarded-Encrypted: i=1; AJvYcCXFaPoyqSsnSJq2Nrro8+Svb3xvg1LfgbOw08uORB66dR/hiCJqfNGxhSVbI306lzO2kMj+6QxJ15C92w==@linaro.org
X-Gm-Message-State: AOJu0Yz0PzjAv2IU5ZkYA+mCN/gRhhwYhzpkCQWA5C+vBK9aUfUYW0Rn
	ko2Qs/b9N8G6+xuwWOVo3JnZXA3wmR0dt6OhWClREgVqWK9bFu3UyleOIaDh/b6x1w==
X-Gm-Gg: ASbGncue3W30f0k1TCX0BTFGGA8s+n6JPesRSnap+jmUSckQcZMUiBK3H4WAjUrQ9l1
	AISOY09CFkkt63OxyH/iXXYHABPvl1dwLWYgNrWfPTAtuyPPAsEpbODwE2Gux6ze7skkdut2ZGd
	2cJHZwQfc48R3yYeH7JDOC6ZEcScF6sMG7ehSKuYd1K3sc/cxHep/q190q/dtqebzTzAhNqMwJI
	mBUZUpF9YC2vPveFDvK6eFjguj861PzryzXr7aSGwB94N9Ypgt3bZeIIc8oOdSO4GgBY1Y/qELq
	jZEC5zz5cLZVOo9+WpYrjcJi34a6mrKy4cHJlBRtmR+SxQYZ0hQx8PaFgXBLihbc+LCZjV7vb+D
	9OQFWwkyoE3xTHxedx+Q=
X-Google-Smtp-Source: AGHT+IHdItuvKX+lQ1X4oGvok1OXlpr6c8Tv3ERZvjrwMhvQRnaiHtRHrPNICpMnfkrfYNsFJGPflA==
X-Received: by 2002:a05:6000:18ab:b0:391:241d:a13e with SMTP id ffacd0b85a97d-391241da3c8mr2108327f8f.48.1741191179375;
        Wed, 05 Mar 2025 08:12:59 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4795d1asm21143947f8f.4.2025.03.05.08.12.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 05 Mar 2025 08:12:58 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	qemu-arm@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC PATCH 2/4] hw/arm/raspi: Replace TARGET_AARCH64 by legacy_binary_is_64bit()
Date: Wed,  5 Mar 2025 17:12:46 +0100
Message-ID: <20250305161248.54901-3-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250305161248.54901-1-philmd@linaro.org>
References: <20250305161248.54901-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Cki/NGAFNvBc

For legacy ARM binaries, legacy_binary_is_64bit() is
equivalent of the compile time TARGET_AARCH64 definition.

Use it as TypeInfo::registerable() callback to dynamically
add Aarch64 specific types in qemu-system-aarch64 binary,
removing the need of TARGET_AARCH64 #ifdef'ry.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/bcm2836.c | 6 ++----
 hw/arm/raspi.c   | 7 +++----
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
index 95e16806fa1..88a32e5fc20 100644
--- a/hw/arm/bcm2836.c
+++ b/hw/arm/bcm2836.c
@@ -12,6 +12,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "qemu/module.h"
+#include "qemu/legacy_binary_info.h"
 #include "hw/arm/bcm2836.h"
 #include "hw/arm/raspi_platform.h"
 #include "hw/sysbus.h"
@@ -195,7 +196,6 @@ static void bcm2836_class_init(ObjectClass *oc, void *data)
     dc->realize = bcm2836_realize;
 };
 
-#ifdef TARGET_AARCH64
 static void bcm2837_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
@@ -208,7 +208,6 @@ static void bcm2837_class_init(ObjectClass *oc, void *data)
     bc->clusterid = 0x0;
     dc->realize = bcm2836_realize;
 };
-#endif
 
 static const TypeInfo bcm283x_types[] = {
     {
@@ -219,12 +218,11 @@ static const TypeInfo bcm283x_types[] = {
         .name           = TYPE_BCM2836,
         .parent         = TYPE_BCM283X,
         .class_init     = bcm2836_class_init,
-#ifdef TARGET_AARCH64
     }, {
         .name           = TYPE_BCM2837,
         .parent         = TYPE_BCM283X,
+        .registerable   = legacy_binary_is_64bit,
         .class_init     = bcm2837_class_init,
-#endif
     }, {
         .name           = TYPE_BCM283X,
         .parent         = TYPE_BCM283X_BASE,
diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index dce35ca11aa..f7e647a9cbf 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -15,6 +15,7 @@
 #include "qemu/osdep.h"
 #include "qemu/units.h"
 #include "qemu/cutils.h"
+#include "qemu/legacy_binary_info.h"
 #include "qapi/error.h"
 #include "hw/arm/boot.h"
 #include "hw/arm/bcm2836.h"
@@ -367,7 +368,6 @@ static void raspi2b_machine_class_init(ObjectClass *oc, void *data)
     raspi_machine_class_init(mc, rmc->board_rev);
 };
 
-#ifdef TARGET_AARCH64
 static void raspi3ap_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -387,7 +387,6 @@ static void raspi3b_machine_class_init(ObjectClass *oc, void *data)
     rmc->board_rev = 0xa02082;
     raspi_machine_class_init(mc, rmc->board_rev);
 };
-#endif /* TARGET_AARCH64 */
 
 static const TypeInfo raspi_machine_types[] = {
     {
@@ -402,16 +401,16 @@ static const TypeInfo raspi_machine_types[] = {
         .name           = MACHINE_TYPE_NAME("raspi2b"),
         .parent         = TYPE_RASPI_MACHINE,
         .class_init     = raspi2b_machine_class_init,
-#ifdef TARGET_AARCH64
     }, {
         .name           = MACHINE_TYPE_NAME("raspi3ap"),
         .parent         = TYPE_RASPI_MACHINE,
+        .registerable   = legacy_binary_is_64bit,
         .class_init     = raspi3ap_machine_class_init,
     }, {
         .name           = MACHINE_TYPE_NAME("raspi3b"),
         .parent         = TYPE_RASPI_MACHINE,
+        .registerable   = legacy_binary_is_64bit,
         .class_init     = raspi3b_machine_class_init,
-#endif
     }, {
         .name           = TYPE_RASPI_MACHINE,
         .parent         = TYPE_RASPI_BASE_MACHINE,
-- 
2.47.1

Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp2426381wrp;
        Thu, 26 Sep 2019 10:36:58 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy2Mk4wJwAOZ+iA2jUpQRFelS6UL9151ZffVe1D4i5xQCpA5FQgy30OUJYhYeUqz/5ja22+
X-Received: by 2002:aed:3527:: with SMTP id a36mr5248841qte.82.1569519418267;
        Thu, 26 Sep 2019 10:36:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569519418; cv=none;
        d=google.com; s=arc-20160816;
        b=ilnwIR6qsIhTO5MTW6qEuQDAuHFdC5UVjTDe5HwSiXm/LSwLUXDR4UaI5yFflnuf0q
         +qNMiPcHbYSz/h99qqMeJ60hYar5LePO8qWKH5zhFPX1V64eVAdOkZfzp+C4eCeRuQAv
         kiwEQTd8L1S2mpHW4xw4k4APF4wGF4GjUNtHGX/IDbGNmBGhUwhQpDW/KxVk3ppe8nXK
         MxzLSTLwM6dtW65IBgPF3uAVpHdEA0/r9+L0CpZvNNxsQKDw+EEtmQrbAmKfsYXNtcnP
         T5YYrr9IzCubBje0xOFqbBKTBE7ULEETxfYfSdMGIPzypL1y9ebWagcuvhzVeF42orxt
         IdGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=GPn4B4lGlzDo8+m39RCSSgR0Dtxp3NBa/HDn4lW4Yr8=;
        b=whDJmVsr1tpeKvFYngvjYk9VRp0ELo0H3TnKk3k7RyYMkIU1iti8j2CTMaulVHluJi
         wOQyFby3913TfobNwCrDDqGPHcxwxq5RXIS3l6BUX0q4rD8eGr8trtijlGKcB/semoqi
         olukOOA5gWV9Jkb297qpcTbt2gZhNQ5DYkclGxePMMMvqdwvBd4SeJO5/T/PMpDxscI/
         oi53fE8IrSH6UN2zdVk6vm6+tCjY6FHk8a9iIYFXjAyvQ9bCwi27TnH0abg6J+5lQhtz
         /0Fkpl6DZrJRN+THosqCeOIlV+oB9Q7WUVJAJ5VJTp3qCMr+xfRFGiki/22ZyyB1zg8B
         VWUw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=DuIsagik;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t6si1812939qkc.273.2019.09.26.10.36.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Sep 2019 10:36:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=DuIsagik;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iDXhI-0005Qf-H5
	for alex.bennee@linaro.org; Thu, 26 Sep 2019 13:36:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58799)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iDXgA-0004LJ-On
 for qemu-arm@nongnu.org; Thu, 26 Sep 2019 13:35:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iDXg9-0002pO-4f
 for qemu-arm@nongnu.org; Thu, 26 Sep 2019 13:35:46 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:53375)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iDXg5-0002gx-On; Thu, 26 Sep 2019 13:35:41 -0400
Received: by mail-wm1-f68.google.com with SMTP id i16so3715114wmd.3;
 Thu, 26 Sep 2019 10:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GPn4B4lGlzDo8+m39RCSSgR0Dtxp3NBa/HDn4lW4Yr8=;
 b=DuIsagikFO3dSsqiNBQ/N+7bHy9sf3Hk13jtq/1UVc9/+lwXRvPlvoHhWcfvEXvfI3
 sMvbbRxgukR96EvL3LKxE2vmgeYGkJjepnSLKzcuRNLZsmg+Q2C0gnEgWfOsyUvfiu4+
 SaLdoH4e1o1SNZHPpMRM9hyyQfKqhrJQm9gDcT7rnTTipc4tjmVZDKQj7SZvSNpuLRxK
 tv301U3u1xTiuvapgaokgWlfYHZKcVkq01diVsL4kj2xcod4e/iuxf7GfT77cf3rz9yu
 vvCKYvwtIKWkLSGwSD6k0JpTTBhiN+/8z7teVKQMkeTijRzJfeh8W93Qtfu0cFR1+sQ9
 gVWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=GPn4B4lGlzDo8+m39RCSSgR0Dtxp3NBa/HDn4lW4Yr8=;
 b=TVKq64zkhrTAjhJvPAt/qLmXycG8OvECqOhZY/L6N8vFhtaS0HibswTr6qaPoO1+EM
 C6ldDwF6RNIPF/3tBEJmj0ha8VShEUCVFl12sHkoiG4s715Ac+k/jcCUhexra7Gn8pb6
 I5oSIZNL/cFCU9Jgb2Aq1Q+fN6ipEMOWhN9Xq4gcFZWMCdlL/o91WtZWCLrxE6fERlv3
 arXMhqGJ2Kyv+Szk3shckyoFD8lkGfGTuYSFEyKo3GhcVwUoWkLDePvSguZVJV+1sFeC
 niG632Y2dvSLJ7C7WfPkCA3k+9SKkQZIYMlo/L1gQPbI8s5Wmj7yxNIldNfacjiHuW15
 hysw==
X-Gm-Message-State: APjAAAWazhsrIojf+wM+IRha3c2dozbsfJDvkDhI1GWUFPQ0JZTKfWbA
 jM81qb70zKT9lTCzaY/p2hQ75d5eCJY=
X-Received: by 2002:a7b:c84f:: with SMTP id c15mr4147070wml.52.1569519277807; 
 Thu, 26 Sep 2019 10:34:37 -0700 (PDT)
Received: from x1w.redhat.com (240.red-88-21-68.staticip.rima-tde.net.
 [88.21.68.240])
 by smtp.gmail.com with ESMTPSA id b186sm9918980wmd.16.2019.09.26.10.34.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2019 10:34:35 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/19] hw/arm/bcm2835_peripherals: Improve logging
Date: Thu, 26 Sep 2019 19:34:10 +0200
Message-Id: <20190926173428.10713-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190926173428.10713-1-f4bug@amsat.org>
References: <20190926173428.10713-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.68
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Zolt=C3=A1n=20Baldaszti?= <bztemail@gmail.com>,
 Laurent Bonnans <laurent.bonnans@here.com>,
 Esteban Bosse <estebanbosse@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, Clement Deschamps <clement.deschamps@antfield.fr>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Cheng Xiang <ext-cheng.xiang@here.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Pekka Enberg <penberg@iki.fi>, Guenter Roeck <linux@roeck-us.net>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nTqVIOX/Q0uj

Various logging improvements as once:
- Use 0x prefix for hex numbers
- Display value written during write accesses
- Move some logs from GUEST_ERROR to UNIMP

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v2: Use PRIx64 format (pm215)
---
 hw/char/bcm2835_aux.c      |  5 +++--
 hw/dma/bcm2835_dma.c       |  8 ++++----
 hw/intc/bcm2836_control.c  |  7 ++++---
 hw/misc/bcm2835_mbox.c     |  7 ++++---
 hw/misc/bcm2835_property.c | 16 ++++++++++------
 5 files changed, 25 insertions(+), 18 deletions(-)

diff --git a/hw/char/bcm2835_aux.c b/hw/char/bcm2835_aux.c
index 3f855196e3..a6fc1bf152 100644
--- a/hw/char/bcm2835_aux.c
+++ b/hw/char/bcm2835_aux.c
@@ -162,8 +162,9 @@ static void bcm2835_aux_write(void *opaque, hwaddr offset, uint64_t value,
     switch (offset) {
     case AUX_ENABLES:
         if (value != 1) {
-            qemu_log_mask(LOG_UNIMP, "%s: unsupported attempt to enable SPI "
-                          "or disable UART\n", __func__);
+            qemu_log_mask(LOG_UNIMP, "%s: unsupported attempt to enable SPI"
+                                     " or disable UART: 0x%"PRIx64"\n",
+                          __func__, value);
         }
         break;
 
diff --git a/hw/dma/bcm2835_dma.c b/hw/dma/bcm2835_dma.c
index 192bd377a0..6acc2b644e 100644
--- a/hw/dma/bcm2835_dma.c
+++ b/hw/dma/bcm2835_dma.c
@@ -180,7 +180,7 @@ static uint64_t bcm2835_dma_read(BCM2835DMAState *s, hwaddr offset,
         res = ch->debug;
         break;
     default:
-        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset %"HWADDR_PRIx"\n",
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%"HWADDR_PRIx"\n",
                       __func__, offset);
         break;
     }
@@ -228,7 +228,7 @@ static void bcm2835_dma_write(BCM2835DMAState *s, hwaddr offset,
         ch->debug = value;
         break;
     default:
-        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset %"HWADDR_PRIx"\n",
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%"HWADDR_PRIx"\n",
                       __func__, offset);
         break;
     }
@@ -247,7 +247,7 @@ static uint64_t bcm2835_dma0_read(void *opaque, hwaddr offset, unsigned size)
         case BCM2708_DMA_ENABLE:
             return s->enable;
         default:
-            qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset %"HWADDR_PRIx"\n",
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%"HWADDR_PRIx"\n",
                           __func__, offset);
             return 0;
         }
@@ -274,7 +274,7 @@ static void bcm2835_dma0_write(void *opaque, hwaddr offset, uint64_t value,
             s->enable = (value & 0xffff);
             break;
         default:
-            qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset %"HWADDR_PRIx"\n",
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%"HWADDR_PRIx"\n",
                           __func__, offset);
         }
     }
diff --git a/hw/intc/bcm2836_control.c b/hw/intc/bcm2836_control.c
index 04229b8a17..61f884ff9e 100644
--- a/hw/intc/bcm2836_control.c
+++ b/hw/intc/bcm2836_control.c
@@ -264,7 +264,7 @@ static uint64_t bcm2836_control_read(void *opaque, hwaddr offset, unsigned size)
     } else if (offset >= REG_MBOX0_RDCLR && offset < REG_LIMIT) {
         return s->mailboxes[(offset - REG_MBOX0_RDCLR) >> 2];
     } else {
-        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset %"HWADDR_PRIx"\n",
+        qemu_log_mask(LOG_UNIMP, "%s: Unsupported offset 0x%"HWADDR_PRIx"\n",
                       __func__, offset);
         return 0;
     }
@@ -293,8 +293,9 @@ static void bcm2836_control_write(void *opaque, hwaddr offset,
     } else if (offset >= REG_MBOX0_RDCLR && offset < REG_LIMIT) {
         s->mailboxes[(offset - REG_MBOX0_RDCLR) >> 2] &= ~val;
     } else {
-        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset %"HWADDR_PRIx"\n",
-                      __func__, offset);
+        qemu_log_mask(LOG_UNIMP, "%s: Unsupported offset 0x%"HWADDR_PRIx
+                                 " value 0x%"PRIx64"\n",
+                      __func__, offset, val);
         return;
     }
 
diff --git a/hw/misc/bcm2835_mbox.c b/hw/misc/bcm2835_mbox.c
index 79bad11631..7690b9afaf 100644
--- a/hw/misc/bcm2835_mbox.c
+++ b/hw/misc/bcm2835_mbox.c
@@ -176,7 +176,7 @@ static uint64_t bcm2835_mbox_read(void *opaque, hwaddr offset, unsigned size)
         break;
 
     default:
-        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset %"HWADDR_PRIx"\n",
+        qemu_log_mask(LOG_UNIMP, "%s: Unsupported offset 0x%"HWADDR_PRIx"\n",
                       __func__, offset);
         return 0;
     }
@@ -228,8 +228,9 @@ static void bcm2835_mbox_write(void *opaque, hwaddr offset,
         break;
 
     default:
-        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset %"HWADDR_PRIx"\n",
-                      __func__, offset);
+        qemu_log_mask(LOG_UNIMP, "%s: Unsupported offset 0x%"HWADDR_PRIx
+                                 " value 0x%"PRIx64"\n",
+                      __func__, offset, value);
         return;
     }
 
diff --git a/hw/misc/bcm2835_property.c b/hw/misc/bcm2835_property.c
index d86d510572..0a1a3eb5d9 100644
--- a/hw/misc/bcm2835_property.c
+++ b/hw/misc/bcm2835_property.c
@@ -56,7 +56,8 @@ static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
             break;
         case 0x00010001: /* Get board model */
             qemu_log_mask(LOG_UNIMP,
-                          "bcm2835_property: %x get board model NYI\n", tag);
+                          "bcm2835_property: 0x%08x get board model NYI\n",
+                          tag);
             resplen = 4;
             break;
         case 0x00010002: /* Get board revision */
@@ -69,7 +70,8 @@ static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
             break;
         case 0x00010004: /* Get board serial */
             qemu_log_mask(LOG_UNIMP,
-                          "bcm2835_property: %x get board serial NYI\n", tag);
+                          "bcm2835_property: 0x%08x get board serial NYI\n",
+                          tag);
             resplen = 8;
             break;
         case 0x00010005: /* Get ARM memory */
@@ -104,7 +106,8 @@ static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
 
         case 0x00038001: /* Set clock state */
             qemu_log_mask(LOG_UNIMP,
-                          "bcm2835_property: %x set clock state NYI\n", tag);
+                          "bcm2835_property: 0x%08x set clock state NYI\n",
+                          tag);
             resplen = 8;
             break;
 
@@ -129,7 +132,8 @@ static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
         case 0x00038004: /* Set max clock rate */
         case 0x00038007: /* Set min clock rate */
             qemu_log_mask(LOG_UNIMP,
-                          "bcm2835_property: %x set clock rates NYI\n", tag);
+                          "bcm2835_property: 0x%08x set clock rate NYI\n",
+                          tag);
             resplen = 8;
             break;
 
@@ -274,8 +278,8 @@ static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
             break;
 
         default:
-            qemu_log_mask(LOG_GUEST_ERROR,
-                          "bcm2835_property: unhandled tag %08x\n", tag);
+            qemu_log_mask(LOG_UNIMP,
+                          "bcm2835_property: unhandled tag 0x%08x\n", tag);
             break;
         }
 
-- 
2.20.1


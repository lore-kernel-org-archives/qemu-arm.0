Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp986623wrp;
        Wed, 4 Sep 2019 10:22:10 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwOeKTJE5U/mOS9ufFhGA7pTrhcXIp7xSpO9E81Lv7h3+9ZfPGDVUphq75/FwzuJ5KEqfNi
X-Received: by 2002:a17:906:c359:: with SMTP id ci25mr18993905ejb.205.1567617730097;
        Wed, 04 Sep 2019 10:22:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567617730; cv=none;
        d=google.com; s=arc-20160816;
        b=Ne/1Xviir9mCIyG4jpipUoK4Vw38/8+1H3zpGqbWEwNAoX/EZ7NKNf+fS5KrS0Lp6z
         GOsa8z7UWPfGc0VA3MZgY9VZDSwT0dRoqLGS0wsu6FExXS2lt92StoxoGijXigfrMSNO
         gubx8u+WaEnToajKAoU30wCJOZv5bkAcUhOTiDiOnMnwOkRJmQYW+Fjuyo/cAOcHGaN5
         0pcsZSrL/4zDlQlnM/LaWW0FtbkXeda+sRFSlzvo++9TQTBHMVS60fWOOlHcPpzzfloS
         wpAR5gnTCf9aX6E20SN+BfvSfAZmIHNpsILkKDQ790OyalKzgJOjifmGAfytBu5Ev0Yb
         /LyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=6rorF+6pSO7+RuiUxEvvJ3ZwjSNHy/kVt8m9gQNTqTU=;
        b=i8rFmnBEflMpdt1WwBW0D8NSNdPKscSB/O7PXyOD0xYvvghuoGdSAK3MiE+Qk7xnPO
         Ox3EvL2G4UgTWB7lUR65A2T0x0X6LbDbEtl+4d6a7EFukwOkEBq1o5Taf3vZ5P531931
         i04YnfWsdjNflSPaea1XRDHYhpemxT+YrZAgTKa/JyxGJPUq3Rb0NoM+LFnkqeK+YfAb
         ijvW5/GEyQfLVO4AZB6qmqcJWVy8zxGLwGt9EIdQ7aXnBztxYbu8qtDMBddEBMyyrWA5
         xZGzIYH4cbnjvP7v35Hjv1mOAMYATPHVwTS/oAGDp9bI9DSJpzlAcKIYnsXPCzBdTVAP
         bz2g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Qi9aqFqQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x51si11392260eda.272.2019.09.04.10.22.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2019 10:22:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Qi9aqFqQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i5Yyu-0007hS-BQ
	for alex.bennee@linaro.org; Wed, 04 Sep 2019 13:22:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48403)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1i5YqW-0001NQ-16
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 13:13:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1i5YqU-000717-60
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 13:13:27 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:37492)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1i5YqT-00070i-V9; Wed, 04 Sep 2019 13:13:26 -0400
Received: by mail-wm1-x32e.google.com with SMTP id r195so4717584wme.2;
 Wed, 04 Sep 2019 10:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6rorF+6pSO7+RuiUxEvvJ3ZwjSNHy/kVt8m9gQNTqTU=;
 b=Qi9aqFqQZ7k44awhU7HIqhTWjc7w+4Ic5LcYatzsadA0Crt8pUjdLBq29i7atvJRJg
 cfOwTk2Kle1xmkGePh3jdc72UXmGhToHojGP2jHJk05DiQhOhF1686p8O8tcMhUhzu74
 TUdONdXIj1E5VugwCSxxe+V+9Ubsg1zki8aeiht90THlBnKcKRZFggIXEm9ruM9ll+dW
 VogKfpo76oFw/qTJnCyY6Mm7CJhpGdJjgyLqfW01QiDR+gF5G9H5gxXxel5qMGLDuvld
 1vOJUrN3ZCopwIi7w0a2CZh4uq/SR8RVMvgt4DSBBiNcdqNgJ53kqOI3VXhxwb3v9NmJ
 MbiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=6rorF+6pSO7+RuiUxEvvJ3ZwjSNHy/kVt8m9gQNTqTU=;
 b=pwSdlgKAJuSuOIUlojxA2CjTOY/3Rp1PgALeaOiz5cc8jI3XXdIn8V9dgG7oQkj5mA
 cnfgLzdIoATx0jX3ps2SsVHbMdCPdoQTGNkC8uc+iAA4rqQDHHB+3+mbcKaQ2CdCxk0z
 uwBp2e7tmT7qng6nzW0TYHuzivf+56l0UgKnKvg+598aj9U2AnVeinzMpPU0biW6fZ7o
 ypgdW/sqErhofM6YDpA9yJB5DQxemDkMAvKxitBj0LwrQbe8IuSAQ7Cljk+KF/BCRPv+
 jGtRdJXnH1xfvDGT8CrNiqn1juEYP3tcLWe6D/N6SHRbDjqmj8N+ydEgLn/a3Zb3A9zr
 W/hg==
X-Gm-Message-State: APjAAAVnBWup+rCAMEOzmqmwlxEiVjVR2G9vBIVd2rk4/FRHLWj+CvBM
 zFKs+abkU6OJ5u2jIHheeMw=
X-Received: by 2002:a1c:a8d8:: with SMTP id r207mr5225450wme.135.1567617204984; 
 Wed, 04 Sep 2019 10:13:24 -0700 (PDT)
Received: from x1w.redhat.com ([195.166.127.210])
 by smtp.gmail.com with ESMTPSA id p19sm2339512wmg.31.2019.09.04.10.13.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 10:13:24 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
 Esteban Bosse <estebanbosse@gmail.com>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-devel@nongnu.org,
 Pekka Enberg <penberg@iki.fi>,
 =?UTF-8?q?Zolt=C3=A1n=20Baldaszti?= <bztemail@gmail.com>
Date: Wed,  4 Sep 2019 19:13:05 +0200
Message-Id: <20190904171315.8354-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190904171315.8354-1-f4bug@amsat.org>
References: <20190904171315.8354-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::32e
Subject: [Qemu-devel] [PATCH 04/14] hw/arm/bcm2835_peripherals: Improve
 logging
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Clement Deschamps <clement.deschamps@antfield.fr>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: j6386rXQQSr9

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
index d8eb28f267..ab66d3572e 100644
--- a/hw/misc/bcm2835_property.c
+++ b/hw/misc/bcm2835_property.c
@@ -56,7 +56,8 @@ static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
             break;
         case 0x00010001: /* Get board model */
             qemu_log_mask(LOG_UNIMP,
-                          "bcm2835_property: %x get board model NYI\n", tag);
+                          "bcm2835_property: 0x%08x get board model NYI\n",
+                          tag);
             /* FIXME returning uninitialized memory */
             resplen = 4;
             break;
@@ -70,7 +71,8 @@ static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
             break;
         case 0x00010004: /* Get board serial */
             qemu_log_mask(LOG_UNIMP,
-                          "bcm2835_property: %x get board serial NYI\n", tag);
+                          "bcm2835_property: 0x%08x get board serial NYI\n",
+                          tag);
             /* FIXME returning uninitialized memory */
             resplen = 8;
             break;
@@ -106,7 +108,8 @@ static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
 
         case 0x00038001: /* Set clock state */
             qemu_log_mask(LOG_UNIMP,
-                          "bcm2835_property: %x set clock state NYI\n", tag);
+                          "bcm2835_property: 0x%08x set clock state NYI\n",
+                          tag);
             resplen = 8;
             break;
 
@@ -139,7 +142,8 @@ static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
         case 0x00038004: /* Set max clock rate */
         case 0x00038007: /* Set min clock rate */
             qemu_log_mask(LOG_UNIMP,
-                          "bcm2835_property: %x set clock rates NYI\n", tag);
+                          "bcm2835_property: 0x%08x set clock rate NYI\n",
+                          tag);
             resplen = 8;
             break;
 
@@ -284,8 +288,8 @@ static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
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


Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp3066187lfb;
        Mon, 18 May 2020 07:04:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyo/19yKubqoLe/ckPW8P6FqVuNQNdX+z5p4RmDvDcRlQ0mWlmYsDEUH5yBA0HGC5ZvCCuP
X-Received: by 2002:ac8:341c:: with SMTP id u28mr17161725qtb.0.1589810662691;
        Mon, 18 May 2020 07:04:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589810662; cv=none;
        d=google.com; s=arc-20160816;
        b=pZVRZJPktT4Ysax0Tuzwc5MluzOTBEFAhitYsE+6ZweP/2k2XvNUyrW9gbghzZnnYb
         rA75BjrnNCFZPXCLpVLQqCNA1qzsR3Xj5k4AfZ6UJ9PAgmohLXIWJarLuHZYP8TmHt7R
         tWP1eW/TzGJ00lwb2pvDS/gfECEPYZJO0lfhbL0DqeRKFoO0mJAWu997ZbqUfzBeSteB
         fCBh5WC78NhHoDj8iFSw4ZXOy0uR6Cf43Xlk4j70YSNEMkgWnXIEzIt7XmiP3bzlzPEd
         ymUiG67PSK2tCj+Sgk7iOuR7Wc8u+fKBph8/dz9V7rPyDx6OLZ+Na5iWh5qsZ2n0kf/r
         qgcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=jz9Gxel1PVIdl5iYkRkenVOs1Gr8Smmd1Imlbqeyfjo=;
        b=DMPbyhUeHMiNFumii1ajSnX2IuI9EgnfSlNqzEERoDiF/At+6lIb1/XMm37tm2PgEt
         ktSWX5adCZuWreuFQLx8eCdp5E98CZ02jpSlMlXHLcAzAUvZSTObpbmCKQm14nb5L8Yg
         peLob6iiNpRe3yCDcV2JrjmBHbIuUZ6x+dv9/Crvcd9O1X18OQd8do0OLyTSkAmVnv5J
         ZXnLQ9TbJ1UrMbl7LvW3idcNLgX0C63BwvmESrATaIRHVmEhJisyNleTVJbiGWFlytp9
         7AD4/i7HiTG3GQdZtNFcNSegXJ/JyR0yurb1sknd3JZv/C9IBYp5ZV99rPUiY3zFe0cH
         uZ0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=i1El2WNW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z5si5479553qvm.195.2020.05.18.07.04.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 May 2020 07:04:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=i1El2WNW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:49096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jagNS-0005eC-1t
	for alex.bennee@linaro.org; Mon, 18 May 2020 10:04:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jagMR-0004AM-T9; Mon, 18 May 2020 10:03:19 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:33943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jagMQ-0001AG-U9; Mon, 18 May 2020 10:03:19 -0400
Received: by mail-wr1-x443.google.com with SMTP id y3so12052260wrt.1;
 Mon, 18 May 2020 07:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jz9Gxel1PVIdl5iYkRkenVOs1Gr8Smmd1Imlbqeyfjo=;
 b=i1El2WNWs5H5msHNsrft29y1PQsYfVZ4bkICXIMQ+kZN+ogz/TlxiLM63LSk5frAdC
 3Y5sJ+Ym15DwSVm++rBqSNX241Aey3Bpf/MjVQgLdHJoZE/rv0sh2ajS3EA+ZMELcgqc
 iYnauOYwsJUWSzp0rIvTuKOg04FD/wdV5jmrUxGDYtJUrtIW9/w/UJsaCW+diasPKtb+
 cMm/3+NzxxbUtaGwt1H2v0tAXEapxLZtMV0e2yICKz7mKcgE4xhT3noUzeEhBJk2OSxN
 3ROA5b1sybuZ/BgwMe0RCOsRNfpAVsJ17HRrttMM3WXDDLJOiGc5jU+y025+UovoYnkh
 78TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=jz9Gxel1PVIdl5iYkRkenVOs1Gr8Smmd1Imlbqeyfjo=;
 b=JGTj0fTDt8G7jz8KFRr10ozmzUk+4W6I1Jdrpc52Sgqc+ZmJj5A7zWVWSbGFk17Fjw
 mRs0WpZUPQ8UJo7TslJ9p7qoiscSCnoMAhdnSAJONcNU46b4k9w0X94pRaKwvKINnqiG
 zwNmIah3/MpPwkes/nxc/BUzA8nEYLCTAKaJWY+hTNAZMabgEs1hpQC0L+F7LdncelH9
 2QG218Lw0l+FHLHTCPxt6R97SP81cx/C1P3mLCJZLsMkXzuKjuOjVsgnYTMTIYN8qzqA
 iJdT1xfYcvq3n8HfYQzFMKSETuAx5N3JQXDyOeHc1zL+zz8NdA8nbkVkXr3Aozg2/E66
 nEdQ==
X-Gm-Message-State: AOAM531rQr2uY/p/D7aWNT5Dz+RBmUWJZHyKX9MWtdwL+wKvJ415kEDp
 /4oEkas8Rgxf/QHsIsgLymBcHWN+Rzw=
X-Received: by 2002:adf:d0cb:: with SMTP id z11mr21290674wrh.116.1589810596883; 
 Mon, 18 May 2020 07:03:16 -0700 (PDT)
Received: from x1w.redhat.com (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id s67sm16611946wmf.3.2020.05.18.07.03.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2020 07:03:15 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/4] hw/arm/pxa2xx: Replace hw_error() by qemu_log_mask()
Date: Mon, 18 May 2020 16:03:07 +0200
Message-Id: <20200518140309.5220-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200518140309.5220-1-f4bug@amsat.org>
References: <20200518140309.5220-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JM0JWbuZra5+

hw_error() calls exit(). This a bit overkill when we can log
the accesses as unimplemented or guest error.

When fuzzing the devices, we don't want the whole process to
exit. Replace some hw_error() calls by qemu_log_mask().

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/pxa2xx_gpio.c    |  7 ++++---
 hw/display/pxa2xx_lcd.c |  8 +++++---
 hw/dma/pxa2xx_dma.c     | 14 +++++++++-----
 3 files changed, 18 insertions(+), 11 deletions(-)

diff --git a/hw/arm/pxa2xx_gpio.c b/hw/arm/pxa2xx_gpio.c
index f8df3cc227..a01db54a51 100644
--- a/hw/arm/pxa2xx_gpio.c
+++ b/hw/arm/pxa2xx_gpio.c
@@ -9,7 +9,6 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "hw/hw.h"
 #include "hw/irq.h"
 #include "hw/qdev-properties.h"
 #include "hw/sysbus.h"
@@ -199,7 +198,8 @@ static uint64_t pxa2xx_gpio_read(void *opaque, hwaddr offset,
         return s->status[bank];
 
     default:
-        hw_error("%s: Bad offset " REG_FMT "\n", __func__, offset);
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%" HWADDR_PRIX "\n",
+                      __func__, offset);
     }
 
     return 0;
@@ -252,7 +252,8 @@ static void pxa2xx_gpio_write(void *opaque, hwaddr offset,
         break;
 
     default:
-        hw_error("%s: Bad offset " REG_FMT "\n", __func__, offset);
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%" HWADDR_PRIX "\n",
+                      __func__, offset);
     }
 }
 
diff --git a/hw/display/pxa2xx_lcd.c b/hw/display/pxa2xx_lcd.c
index 464e93161a..d5f2e82a4e 100644
--- a/hw/display/pxa2xx_lcd.c
+++ b/hw/display/pxa2xx_lcd.c
@@ -11,7 +11,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "hw/hw.h"
+#include "qemu/log.h"
 #include "hw/irq.h"
 #include "migration/vmstate.h"
 #include "ui/console.h"
@@ -407,7 +407,8 @@ static uint64_t pxa2xx_lcdc_read(void *opaque, hwaddr offset,
 
     default:
     fail:
-        hw_error("%s: Bad offset " REG_FMT "\n", __func__, offset);
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%" HWADDR_PRIX "\n",
+                      __func__, offset);
     }
 
     return 0;
@@ -562,7 +563,8 @@ static void pxa2xx_lcdc_write(void *opaque, hwaddr offset,
 
     default:
     fail:
-        hw_error("%s: Bad offset " REG_FMT "\n", __func__, offset);
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%" HWADDR_PRIX "\n",
+                      __func__, offset);
     }
 }
 
diff --git a/hw/dma/pxa2xx_dma.c b/hw/dma/pxa2xx_dma.c
index 88ed4b6ff1..8a2eeb32bc 100644
--- a/hw/dma/pxa2xx_dma.c
+++ b/hw/dma/pxa2xx_dma.c
@@ -9,6 +9,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 #include "hw/hw.h"
 #include "hw/irq.h"
 #include "hw/qdev-properties.h"
@@ -268,7 +269,8 @@ static uint64_t pxa2xx_dma_read(void *opaque, hwaddr offset,
     unsigned int channel;
 
     if (size != 4) {
-        hw_error("%s: Bad access width\n", __func__);
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad access width %u\n",
+                      __func__, size);
         return 5;
     }
 
@@ -315,8 +317,8 @@ static uint64_t pxa2xx_dma_read(void *opaque, hwaddr offset,
             return s->chan[channel].cmd;
         }
     }
-
-    hw_error("%s: Bad offset 0x" TARGET_FMT_plx "\n", __func__, offset);
+    qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%" HWADDR_PRIX "\n",
+                  __func__, offset);
     return 7;
 }
 
@@ -327,7 +329,8 @@ static void pxa2xx_dma_write(void *opaque, hwaddr offset,
     unsigned int channel;
 
     if (size != 4) {
-        hw_error("%s: Bad access width\n", __func__);
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad access width %u\n",
+                      __func__, size);
         return;
     }
 
@@ -420,7 +423,8 @@ static void pxa2xx_dma_write(void *opaque, hwaddr offset,
             break;
         }
     fail:
-        hw_error("%s: Bad offset " TARGET_FMT_plx "\n", __func__, offset);
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%" HWADDR_PRIX "\n",
+                      __func__, offset);
     }
 }
 
-- 
2.21.3


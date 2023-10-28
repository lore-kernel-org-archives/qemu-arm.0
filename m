Received: by 2002:a17:907:d043:b0:9d0:bf65:29fa with SMTP id vb3csp813870ejc;
        Sat, 28 Oct 2023 05:25:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGz6ugflMPBsnq6a+hkxBxyceluuEb2qRpOnuIvtTLT/+0y15umVAmGs3wa1pyLS0iIMUlB
X-Received: by 2002:ac8:5f06:0:b0:418:b8c:1a0a with SMTP id x6-20020ac85f06000000b004180b8c1a0amr5533299qta.25.1698495941796;
        Sat, 28 Oct 2023 05:25:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698495941; cv=none;
        d=google.com; s=arc-20160816;
        b=uv2l1jgqdm39ovZPvcrUp6e1E5wTDYbZ0ycnDBSgjDjzAAITpqUNWOQ7PxGf/P2TTM
         l9qiVSUNvT2nYDowlxt1W2JvgPcQg3c4n+8zXVYnz1Ucz9oJrR4Tw5aHZHCaG+9mlAYL
         bXLQM1YSi3bs0ZqqDIO8myaC1N5uSl+hH9KZ76LWaoSW1ovQTrZqNMZ/D9IGIakm+6/M
         Wl+J+6iGPW/b464gvnh/u2APs5ynaxbZ9t3JprU/Xh806D9bKxFt0LfuqnB1lo3/OPj6
         /4eeGKdi+UYAYRT38S+cq6utD8WSRWZErOPNbrL0ug+v0UTDHiCWm5M2xZnq9/OvKVyO
         SUrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=r/GfajRIrYhgKYmLQLWAkDGqOb+fcd/j2IAGxcdFbD0=;
        fh=mPN9/WblWXCg2g59vjErH+E42ODcsdjD5KgDEJZDWAk=;
        b=ZpKrBH9Na16eV7SQJNPsvL9c8fX3UguqQO3lOrxrNJ/jfoBnWaUtkElFw2OkkdU296
         62sImZRyWpW4+8fWJtlz0faPl107hZ/Gke5BxnOHd9Abphua+125FkHzpjiXSwWyLl1W
         FrC+aeRavXloC6RON8uwa+pYlvXyO6NbSg3B5jPorU53CXLE65DcmuzKnddgqh/shd9L
         ptHKB298X1qnxSltai89Q11gu11Vqp+xwAIPKGfYl4GuujQd7t+2i8Ot/1uMGVVRjqLO
         I95KP0FNvfw7feZLZ6W7Ky6xNcXXYMwfndgZOTCwwz/6VgiotuVdugNnmXcsV6VMagBs
         Vc8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=B8Gu37dh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h9-20020ac87d49000000b00419674b991asi2255424qtb.505.2023.10.28.05.25.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 28 Oct 2023 05:25:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=B8Gu37dh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qwiMo-0006ON-Fi; Sat, 28 Oct 2023 08:24:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1qwiMn-0006Mw-Oz; Sat, 28 Oct 2023 08:24:37 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1qwiMk-0006mB-Rx; Sat, 28 Oct 2023 08:24:37 -0400
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-99c1c66876aso461126966b.2; 
 Sat, 28 Oct 2023 05:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698495872; x=1699100672; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r/GfajRIrYhgKYmLQLWAkDGqOb+fcd/j2IAGxcdFbD0=;
 b=B8Gu37dhyND9fBYOnWoLbBEorHRohFtKn62u9FL/VykHPqGJWMH78vO03jNDM1KLav
 W/wb7ae2ub8oUS0p0lP8sa7B5IcNOVL9RJQxjgezNYnAAzGgE3OveKqsODzjDpnf5zlP
 CJuSOMgf3yQZ0Tj2tz39lZgEc7segfvHPUUuD3pjzeKTwpqjk6IvJKUcAeW7ykZagLxC
 leNqupBeAJKJ9VK0we82qVBZ5bFz6Qr1zHoNFRed8226JwkFTGfJRRywzHH+xK7XKKUY
 qc8WI+5beNzqyomKd3gZVlm+4nztowWf0dK1IE0a6MJ8ZMQnXeUSH5URhz9rii9dU73F
 zKiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698495872; x=1699100672;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r/GfajRIrYhgKYmLQLWAkDGqOb+fcd/j2IAGxcdFbD0=;
 b=bbXWT8VsbZB2T8WKqQGj6w17WekjOR3qXV+wvZ8T4mWkXBJtTvbonQA4KKtkWImqd0
 6WiQ5UVXn9v/DrdQrNYU16nGphO8d4kLfqFyRI53AHbL1LYZ0PUjWZevYwUg+ffTbQIA
 4U9g5jK6Wn0vxJckw5HAFNFBdInFhs2GO7GMf153IVOsHwaIrjg/a5uopuQXd2Fne/7s
 SwleRabLj5TvrbDK32Xim0w/8wOX74UScWPA+jK0kWg6yHvljVoEAroMnZUA5cWIQM0J
 xrt+G27eqlnjLrd4yONXT9quuKayOqIRdUWNDv5+C6+zZvIqaUttAq6qxNLtS/8tTlgf
 I2Qg==
X-Gm-Message-State: AOJu0Yx+wvOPl8CblUWK69c9czIdLgGEUFg2R3U99VvEXvVTIASTTcxS
 79qj8g11EqPqNRzQTJ69eHcxPwPH0ss=
X-Received: by 2002:a17:907:7f1e:b0:9be:9e69:488c with SMTP id
 qf30-20020a1709077f1e00b009be9e69488cmr5166062ejc.59.1698495872225; 
 Sat, 28 Oct 2023 05:24:32 -0700 (PDT)
Received: from archlinux.. (dynamic-089-012-044-170.89.12.pool.telefonica.de.
 [89.12.44.170]) by smtp.gmail.com with ESMTPSA id
 a13-20020a170906190d00b009ae3d711fd9sm2706687eje.69.2023.10.28.05.24.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Oct 2023 05:24:31 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Mads Ynddal <mads@ynddal.dk>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 4/6] hw/misc/imx6_ccm: Convert DPRINTF to trace events
Date: Sat, 28 Oct 2023 14:24:13 +0200
Message-ID: <20231028122415.14869-5-shentey@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231028122415.14869-1-shentey@gmail.com>
References: <20231028122415.14869-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: mHHw1+SmZr3F

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/misc/imx6_ccm.c   | 41 ++++++++++++++---------------------------
 hw/misc/trace-events | 15 +++++++++++++++
 2 files changed, 29 insertions(+), 27 deletions(-)

diff --git a/hw/misc/imx6_ccm.c b/hw/misc/imx6_ccm.c
index 4c830fd89a..85af466c2b 100644
--- a/hw/misc/imx6_ccm.c
+++ b/hw/misc/imx6_ccm.c
@@ -15,18 +15,7 @@
 #include "migration/vmstate.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
-
-#ifndef DEBUG_IMX6_CCM
-#define DEBUG_IMX6_CCM 0
-#endif
-
-#define DPRINTF(fmt, args...) \
-    do { \
-        if (DEBUG_IMX6_CCM) { \
-            fprintf(stderr, "[%s]%s: " fmt , TYPE_IMX6_CCM, \
-                                             __func__, ##args); \
-        } \
-    } while (0)
+#include "trace.h"
 
 static const char *imx6_ccm_reg_name(uint32_t reg)
 {
@@ -263,7 +252,7 @@ static uint64_t imx6_analog_get_pll2_clk(IMX6CCMState *dev)
         freq *= 20;
     }
 
-    DPRINTF("freq = %u\n", (uint32_t)freq);
+    trace_imx6_analog_get_pll2_clk(freq);
 
     return freq;
 }
@@ -275,7 +264,7 @@ static uint64_t imx6_analog_get_pll2_pfd0_clk(IMX6CCMState *dev)
     freq = imx6_analog_get_pll2_clk(dev) * 18
            / EXTRACT(dev->analog[CCM_ANALOG_PFD_528], PFD0_FRAC);
 
-    DPRINTF("freq = %u\n", (uint32_t)freq);
+    trace_imx6_analog_get_pll2_pfd0_clk(freq);
 
     return freq;
 }
@@ -287,7 +276,7 @@ static uint64_t imx6_analog_get_pll2_pfd2_clk(IMX6CCMState *dev)
     freq = imx6_analog_get_pll2_clk(dev) * 18
            / EXTRACT(dev->analog[CCM_ANALOG_PFD_528], PFD2_FRAC);
 
-    DPRINTF("freq = %u\n", (uint32_t)freq);
+    trace_imx6_analog_get_pll2_pfd2_clk(freq);
 
     return freq;
 }
@@ -315,7 +304,7 @@ static uint64_t imx6_analog_get_periph_clk(IMX6CCMState *dev)
         break;
     }
 
-    DPRINTF("freq = %u\n", (uint32_t)freq);
+    trace_imx6_analog_get_periph_clk(freq);
 
     return freq;
 }
@@ -327,7 +316,7 @@ static uint64_t imx6_ccm_get_ahb_clk(IMX6CCMState *dev)
     freq = imx6_analog_get_periph_clk(dev)
            / (1 + EXTRACT(dev->ccm[CCM_CBCDR], AHB_PODF));
 
-    DPRINTF("freq = %u\n", (uint32_t)freq);
+    trace_imx6_ccm_get_ahb_clk(freq);
 
     return freq;
 }
@@ -339,7 +328,7 @@ static uint64_t imx6_ccm_get_ipg_clk(IMX6CCMState *dev)
     freq = imx6_ccm_get_ahb_clk(dev)
            / (1 + EXTRACT(dev->ccm[CCM_CBCDR], IPG_PODF));
 
-    DPRINTF("freq = %u\n", (uint32_t)freq);
+    trace_imx6_ccm_get_ipg_clk(freq);
 
     return freq;
 }
@@ -351,7 +340,7 @@ static uint64_t imx6_ccm_get_per_clk(IMX6CCMState *dev)
     freq = imx6_ccm_get_ipg_clk(dev)
            / (1 + EXTRACT(dev->ccm[CCM_CSCMR1], PERCLK_PODF));
 
-    DPRINTF("freq = %u\n", (uint32_t)freq);
+    trace_imx6_ccm_get_per_clk(freq);
 
     return freq;
 }
@@ -385,7 +374,7 @@ static uint32_t imx6_ccm_get_clock_frequency(IMXCCMState *dev, IMXClk clock)
         break;
     }
 
-    DPRINTF("Clock = %d) = %u\n", clock, freq);
+    trace_imx6_ccm_get_clock_frequency(clock, freq);
 
     return freq;
 }
@@ -394,7 +383,7 @@ static void imx6_ccm_reset(DeviceState *dev)
 {
     IMX6CCMState *s = IMX6_CCM(dev);
 
-    DPRINTF("\n");
+    trace_imx6_ccm_reset();
 
     s->ccm[CCM_CCR] = 0x040116FF;
     s->ccm[CCM_CCDR] = 0x00000000;
@@ -483,7 +472,7 @@ static uint64_t imx6_ccm_read(void *opaque, hwaddr offset, unsigned size)
 
     value = s->ccm[index];
 
-    DPRINTF("reg[%s] => 0x%" PRIx32 "\n", imx6_ccm_reg_name(index), value);
+    trace_imx6_ccm_read(imx6_ccm_reg_name(index), value);
 
     return (uint64_t)value;
 }
@@ -494,8 +483,7 @@ static void imx6_ccm_write(void *opaque, hwaddr offset, uint64_t value,
     uint32_t index = offset >> 2;
     IMX6CCMState *s = (IMX6CCMState *)opaque;
 
-    DPRINTF("reg[%s] <= 0x%" PRIx32 "\n", imx6_ccm_reg_name(index),
-            (uint32_t)value);
+    trace_imx6_ccm_write(imx6_ccm_reg_name(index), (uint32_t)value);
 
     /*
      * We will do a better implementation later. In particular some bits
@@ -591,7 +579,7 @@ static uint64_t imx6_analog_read(void *opaque, hwaddr offset, unsigned size)
         break;
     }
 
-    DPRINTF("reg[%s] => 0x%" PRIx32 "\n", imx6_analog_reg_name(index), value);
+    trace_imx6_analog_read(imx6_analog_reg_name(index), value);
 
     return (uint64_t)value;
 }
@@ -602,8 +590,7 @@ static void imx6_analog_write(void *opaque, hwaddr offset, uint64_t value,
     uint32_t index = offset >> 2;
     IMX6CCMState *s = (IMX6CCMState *)opaque;
 
-    DPRINTF("reg[%s] <= 0x%" PRIx32 "\n", imx6_analog_reg_name(index),
-            (uint32_t)value);
+    trace_imx6_analog_write(imx6_analog_reg_name(index), (uint32_t)value);
 
     switch (index) {
     case CCM_ANALOG_PLL_ARM_SET:
diff --git a/hw/misc/trace-events b/hw/misc/trace-events
index 426a8472b6..f359fb3add 100644
--- a/hw/misc/trace-events
+++ b/hw/misc/trace-events
@@ -196,6 +196,21 @@ iotkit_secctl_s_write(uint32_t offset, uint64_t data, unsigned size) "IoTKit Sec
 iotkit_secctl_ns_read(uint32_t offset, uint64_t data, unsigned size) "IoTKit SecCtl NS regs read: offset 0x%x data 0x%" PRIx64 " size %u"
 iotkit_secctl_ns_write(uint32_t offset, uint64_t data, unsigned size) "IoTKit SecCtl NS regs write: offset 0x%x data 0x%" PRIx64 " size %u"
 
+# imx6_ccm.c
+imx6_analog_get_periph_clk(uint32_t freq) "freq = %u"
+imx6_analog_get_pll2_clk(uint32_t freq) "freq = %u"
+imx6_analog_get_pll2_pfd0_clk(uint32_t freq) "freq = %u"
+imx6_analog_get_pll2_pfd2_clk(uint32_t freq) "freq = %u"
+imx6_analog_read(const char *reg, uint32_t value) "reg[%s] => 0x%" PRIx32
+imx6_analog_write(const char *reg, uint32_t value) "reg[%s] <= 0x%" PRIx32
+imx6_ccm_get_ahb_clk(uint32_t freq) "freq = %u"
+imx6_ccm_get_ipg_clk(uint32_t freq) "freq = %u"
+imx6_ccm_get_per_clk(uint32_t freq) "freq = %u"
+imx6_ccm_get_clock_frequency(unsigned clock, uint32_t freq) "(Clock = %d) = %u"
+imx6_ccm_read(const char *reg, uint32_t value) "reg[%s] => 0x%" PRIx32
+imx6_ccm_reset(void) ""
+imx6_ccm_write(const char *reg, uint32_t value) "reg[%s] <= 0x%" PRIx32
+
 # imx6ul_ccm.c
 ccm_entry(void) ""
 ccm_freq(uint32_t freq) "freq = %d"
-- 
2.42.0


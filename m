Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp1553799njb;
        Wed, 19 Feb 2025 10:48:26 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWS/NWZV/v8cV7NQ4l0xUkV6H1vyflvdlse8NRBJXaLM+1UlCedXsiwjyRuYhaCjfhp4CjndTtE0sRNew==@linaro.org
X-Google-Smtp-Source: AGHT+IFOfi1Y8IjUurO2PQYaMqLqjt+4Nbc4F6KWFRvwZpz6u6qU/WHNw+mA3gdIvc4fY5XTMT9T
X-Received: by 2002:a05:620a:2720:b0:7c0:ac44:d452 with SMTP id af79cd13be357-7c0ac44d6camr1294481885a.48.1739990905853;
        Wed, 19 Feb 2025 10:48:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739990905; cv=none;
        d=google.com; s=arc-20240605;
        b=aoyMov6tiStPv0iQIA3epeM2jSd6kZQKFTF/nzzqeEMlAcXuyQ4nVrDavv+wrWzDNU
         73V04q4ZRwKwGeTj+EXxqJt2yL/RUtkstGo5fraXt+ht4oeoSPVrxZZMHNtvYi6u9WKG
         97LdszXPuGDsPJEVbcOhtgvU4h/g+zCg9NkqRD13mPRTzVp5tpAj+aUT5lVZc760ebMd
         KGnYIQlaQj+SqXyZEpFU0Cf2kYuKUpNwnt3KXwNasnRK49FGQaA/na8ie7YGK+V2KA66
         zjFZOtdnAQ63LGaMvrowEtiXgji1cEiwQMsY0dsYSJOAB/VOoQOuHA8+XGj/BiFaHdA/
         1iRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=eHRnh47Tpg9xYmqeDYt2fiLAz09WUKiZN228zQkMdoo=;
        fh=biy2AaKCbwpAZ/Lk7Qechxb9C3WSrIx4CYh+Y6obQL0=;
        b=ZH3saeOsTSDaynOtHfUrpQJ0TntOe5DzmMLbmNN73GptcLPa6DA/c2bFNLj7oczZuD
         +tj8DFkEWR+jL95JwMJcbto2JeLte6aG3qkukfaRoTK2Lhv1G47KiRW9ZvHDurSxW0Sy
         0mq1gGEdCRYJ3DwAN4piWUvjmsmYs5+s50jBsH6yQpLUxsmhQjAZszPLfPflnexKTOCe
         G0DzhuyXEpfeWh8Y2AkdVaFh8h0mTm65AQjui3bTwXWZKr3fxscDXoafG/oHnf8JDJPR
         R1FFAv2bfi5g9X6Tsb6M449RLkC0foIbn0x7ys/f7/Kb2PXFuTOWizGoJIUp8lCkpE7A
         PbTg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=YFcZvU2A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c09e95ee9asi639411185a.398.2025.02.19.10.48.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Feb 2025 10:48:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=YFcZvU2A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tkp6Q-0003Jt-58; Wed, 19 Feb 2025 13:47:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3Eie2ZwgKCH0xvibputihpphmf.dpnrfnv-bsnopohov.psh@flex--wuhaotsh.bounces.google.com>)
 id 1tkp5r-00033e-Ct
 for qemu-arm@nongnu.org; Wed, 19 Feb 2025 13:46:47 -0500
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3Eie2ZwgKCH0xvibputihpphmf.dpnrfnv-bsnopohov.psh@flex--wuhaotsh.bounces.google.com>)
 id 1tkp5o-0004mo-MW
 for qemu-arm@nongnu.org; Wed, 19 Feb 2025 13:46:47 -0500
Received: by mail-pj1-x1049.google.com with SMTP id
 98e67ed59e1d1-2fbff6426f5so188873a91.3
 for <qemu-arm@nongnu.org>; Wed, 19 Feb 2025 10:46:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1739990802; x=1740595602; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=eHRnh47Tpg9xYmqeDYt2fiLAz09WUKiZN228zQkMdoo=;
 b=YFcZvU2Ag75wFm4W85iEnH2eJURfoHOU+DUXwqK6io1EYUPNwo0I8j8m2PWuoL1qMz
 bzCnTHWmbWVSUpBO+tOq4CUZTQXV4H4CPwH9fPEp/EL/X+9J2HNMxZfIKSoxm8WgQRxM
 X3ywnhUGWefGa05Y3sRYBvF40uZHxQ9COU7Fd6L/20Xe+KSLElBIEuTTsQyO1VpurYzg
 veplSQK1//pfnb98KEqdgdp8qt7EnxA06xHwFQqznohfe0TvnHEUQJr9yaZumVMrhswE
 ZVXBmQBGAR+QBDo/M9XFqGYpJnmP4TxApXKTnQbNl9Gm/WC4bAIZ1p28gA0MWLKrro1E
 PzsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739990802; x=1740595602;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eHRnh47Tpg9xYmqeDYt2fiLAz09WUKiZN228zQkMdoo=;
 b=SSu/Vdrf1SC9SOgX8z+6xUkIRxEAp/5NhUESaRWitoeTvAPSiWnLX/4GbT5uLS1rMb
 1W9LDT73yu5skD/lDBoZMAaXy8rs5YNjQHR9v8lWCeE6ZyxAeE8IKJDtuyp0XKU3zlfC
 jYy3z3EkwY4JQ9YMNr4uAON2/WHBS9EjzO7lGr+VYBRqTntbGSxONOajYcuCXbk5CW82
 z7wuXWUVBRGQEXWIjZN3TY/yc7fqXic6pYtkqHP4ZnIToW9l7krHiHez1tu5PyZ5nPgI
 trbUG2yIcUzaDeEQ6wut+ZZhgy8YKtKgL/iUvBartZ3BKxjzhFVEn0RSC58nUOuUaxW1
 iluw==
X-Gm-Message-State: AOJu0YyNhtZupccceVHFFZvACN1XJItFeoJLum0hJeiMW3qbc8DkS9KY
 Jqbol+gTMc0DacwRGHEoAZEESOXm7pwXMDNmtvuj4lAvnFAtDp5lAJCbmZEM40cGYtWnUV1Dfze
 0N1GqI3fvAQ==
X-Received: from pjh12.prod.google.com ([2002:a17:90b:3f8c:b0:2fc:af0c:4be])
 (user=wuhaotsh job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:4a90:b0:2ee:f80c:6884 with SMTP id
 98e67ed59e1d1-2fc41154065mr31788058a91.33.1739990802231; 
 Wed, 19 Feb 2025 10:46:42 -0800 (PST)
Date: Wed, 19 Feb 2025 10:46:02 -0800
In-Reply-To: <20250219184609.1839281-1-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20250219184609.1839281-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.48.1.601.g30ceb7b040-goog
Message-ID: <20250219184609.1839281-12-wuhaotsh@google.com>
Subject: [PATCH v5 11/17] hw/misc: Move NPCM7XX CLK to NPCM CLK
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, titusr@google.com, 
 chli30@nuvoton.corp-partner.google.com, pbonzini@redhat.com, 
 jasowang@redhat.com, alistair@alistair23.me, philmd@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1049;
 envelope-from=3Eie2ZwgKCH0xvibputihpphmf.dpnrfnv-bsnopohov.psh@flex--wuhaotsh.bounces.google.com;
 helo=mail-pj1-x1049.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: h6TLrsm7L9H1

A lot of NPCM7XX and NPCM8XX CLK modules share the same code,
this commit moves the NPCM7XX CLK to NPCM CLK for these
properties.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Hao Wu <wuhaotsh@google.com>
---
 hw/misc/npcm_clk.c         | 106 +++++++++++++++++++++----------------
 hw/misc/trace-events       |   6 +--
 include/hw/arm/npcm7xx.h   |   2 +-
 include/hw/misc/npcm_clk.h |  22 ++++----
 4 files changed, 76 insertions(+), 60 deletions(-)

diff --git a/hw/misc/npcm_clk.c b/hw/misc/npcm_clk.c
index 2bcb731099..0ecf0df3bb 100644
--- a/hw/misc/npcm_clk.c
+++ b/hw/misc/npcm_clk.c
@@ -198,7 +198,7 @@ static NPCM7xxClockPLL find_pll_by_reg(enum NPCM7xxCLKRegisters reg)
     }
 }
 
-static void npcm7xx_clk_update_all_plls(NPCM7xxCLKState *clk)
+static void npcm7xx_clk_update_all_plls(NPCMCLKState *clk)
 {
     int i;
 
@@ -207,7 +207,7 @@ static void npcm7xx_clk_update_all_plls(NPCM7xxCLKState *clk)
     }
 }
 
-static void npcm7xx_clk_update_all_sels(NPCM7xxCLKState *clk)
+static void npcm7xx_clk_update_all_sels(NPCMCLKState *clk)
 {
     int i;
 
@@ -216,7 +216,7 @@ static void npcm7xx_clk_update_all_sels(NPCM7xxCLKState *clk)
     }
 }
 
-static void npcm7xx_clk_update_all_dividers(NPCM7xxCLKState *clk)
+static void npcm7xx_clk_update_all_dividers(NPCMCLKState *clk)
 {
     int i;
 
@@ -225,7 +225,7 @@ static void npcm7xx_clk_update_all_dividers(NPCM7xxCLKState *clk)
     }
 }
 
-static void npcm7xx_clk_update_all_clocks(NPCM7xxCLKState *clk)
+static void npcm7xx_clk_update_all_clocks(NPCMCLKState *clk)
 {
     clock_update_hz(clk->clkref, NPCM7XX_CLOCK_REF_HZ);
     npcm7xx_clk_update_all_plls(clk);
@@ -635,7 +635,7 @@ static void npcm7xx_clk_divider_init(Object *obj)
 }
 
 static void npcm7xx_init_clock_pll(NPCM7xxClockPLLState *pll,
-        NPCM7xxCLKState *clk, const PLLInitInfo *init_info)
+        NPCMCLKState *clk, const PLLInitInfo *init_info)
 {
     pll->name = init_info->name;
     pll->clk = clk;
@@ -647,7 +647,7 @@ static void npcm7xx_init_clock_pll(NPCM7xxClockPLLState *pll,
 }
 
 static void npcm7xx_init_clock_sel(NPCM7xxClockSELState *sel,
-        NPCM7xxCLKState *clk, const SELInitInfo *init_info)
+        NPCMCLKState *clk, const SELInitInfo *init_info)
 {
     int input_size = init_info->input_size;
 
@@ -664,7 +664,7 @@ static void npcm7xx_init_clock_sel(NPCM7xxClockSELState *sel,
 }
 
 static void npcm7xx_init_clock_divider(NPCM7xxClockDividerState *div,
-        NPCM7xxCLKState *clk, const DividerInitInfo *init_info)
+        NPCMCLKState *clk, const DividerInitInfo *init_info)
 {
     div->name = init_info->name;
     div->clk = clk;
@@ -683,7 +683,7 @@ static void npcm7xx_init_clock_divider(NPCM7xxClockDividerState *div,
     }
 }
 
-static Clock *npcm7xx_get_clock(NPCM7xxCLKState *clk, ClockSrcType type,
+static Clock *npcm7xx_get_clock(NPCMCLKState *clk, ClockSrcType type,
         int index)
 {
     switch (type) {
@@ -700,7 +700,7 @@ static Clock *npcm7xx_get_clock(NPCM7xxCLKState *clk, ClockSrcType type,
     }
 }
 
-static void npcm7xx_connect_clocks(NPCM7xxCLKState *clk)
+static void npcm7xx_connect_clocks(NPCMCLKState *clk)
 {
     int i, j;
     Clock *src;
@@ -724,10 +724,10 @@ static void npcm7xx_connect_clocks(NPCM7xxCLKState *clk)
     }
 }
 
-static uint64_t npcm7xx_clk_read(void *opaque, hwaddr offset, unsigned size)
+static uint64_t npcm_clk_read(void *opaque, hwaddr offset, unsigned size)
 {
     uint32_t reg = offset / sizeof(uint32_t);
-    NPCM7xxCLKState *s = opaque;
+    NPCMCLKState *s = opaque;
     int64_t now_ns;
     uint32_t value = 0;
 
@@ -766,19 +766,19 @@ static uint64_t npcm7xx_clk_read(void *opaque, hwaddr offset, unsigned size)
         break;
     };
 
-    trace_npcm7xx_clk_read(offset, value);
+    trace_npcm_clk_read(offset, value);
 
     return value;
 }
 
-static void npcm7xx_clk_write(void *opaque, hwaddr offset,
+static void npcm_clk_write(void *opaque, hwaddr offset,
                               uint64_t v, unsigned size)
 {
     uint32_t reg = offset / sizeof(uint32_t);
-    NPCM7xxCLKState *s = opaque;
+    NPCMCLKState *s = opaque;
     uint32_t value = v;
 
-    trace_npcm7xx_clk_write(offset, value);
+    trace_npcm_clk_write(offset, value);
 
     if (reg >= NPCM7XX_CLK_NR_REGS) {
         qemu_log_mask(LOG_GUEST_ERROR,
@@ -842,7 +842,7 @@ static void npcm7xx_clk_write(void *opaque, hwaddr offset,
 static void npcm7xx_clk_perform_watchdog_reset(void *opaque, int n,
         int level)
 {
-    NPCM7xxCLKState *clk = NPCM7XX_CLK(opaque);
+    NPCMCLKState *clk = NPCM_CLK(opaque);
     uint32_t rcr;
 
     g_assert(n >= 0 && n <= NPCM7XX_NR_WATCHDOGS);
@@ -856,9 +856,9 @@ static void npcm7xx_clk_perform_watchdog_reset(void *opaque, int n,
     }
 }
 
-static const struct MemoryRegionOps npcm7xx_clk_ops = {
-    .read       = npcm7xx_clk_read,
-    .write      = npcm7xx_clk_write,
+static const struct MemoryRegionOps npcm_clk_ops = {
+    .read       = npcm_clk_read,
+    .write      = npcm_clk_write,
     .endianness = DEVICE_LITTLE_ENDIAN,
     .valid      = {
         .min_access_size        = 4,
@@ -867,9 +867,9 @@ static const struct MemoryRegionOps npcm7xx_clk_ops = {
     },
 };
 
-static void npcm7xx_clk_enter_reset(Object *obj, ResetType type)
+static void npcm_clk_enter_reset(Object *obj, ResetType type)
 {
-    NPCM7xxCLKState *s = NPCM7XX_CLK(obj);
+    NPCMCLKState *s = NPCM_CLK(obj);
 
     QEMU_BUILD_BUG_ON(sizeof(s->regs) != sizeof(cold_reset_values));
 
@@ -882,7 +882,7 @@ static void npcm7xx_clk_enter_reset(Object *obj, ResetType type)
      */
 }
 
-static void npcm7xx_clk_init_clock_hierarchy(NPCM7xxCLKState *s)
+static void npcm7xx_clk_init_clock_hierarchy(NPCMCLKState *s)
 {
     int i;
 
@@ -918,19 +918,19 @@ static void npcm7xx_clk_init_clock_hierarchy(NPCM7xxCLKState *s)
     clock_update_hz(s->clkref, NPCM7XX_CLOCK_REF_HZ);
 }
 
-static void npcm7xx_clk_init(Object *obj)
+static void npcm_clk_init(Object *obj)
 {
-    NPCM7xxCLKState *s = NPCM7XX_CLK(obj);
+    NPCMCLKState *s = NPCM_CLK(obj);
 
-    memory_region_init_io(&s->iomem, obj, &npcm7xx_clk_ops, s,
-                          TYPE_NPCM7XX_CLK, 4 * KiB);
+    memory_region_init_io(&s->iomem, obj, &npcm_clk_ops, s,
+                          TYPE_NPCM_CLK, 4 * KiB);
     sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->iomem);
 }
 
-static int npcm7xx_clk_post_load(void *opaque, int version_id)
+static int npcm_clk_post_load(void *opaque, int version_id)
 {
     if (version_id >= 1) {
-        NPCM7xxCLKState *clk = opaque;
+        NPCMCLKState *clk = opaque;
 
         npcm7xx_clk_update_all_clocks(clk);
     }
@@ -938,10 +938,10 @@ static int npcm7xx_clk_post_load(void *opaque, int version_id)
     return 0;
 }
 
-static void npcm7xx_clk_realize(DeviceState *dev, Error **errp)
+static void npcm_clk_realize(DeviceState *dev, Error **errp)
 {
     int i;
-    NPCM7xxCLKState *s = NPCM7XX_CLK(dev);
+    NPCMCLKState *s = NPCM_CLK(dev);
 
     qdev_init_gpio_in_named(DEVICE(s), npcm7xx_clk_perform_watchdog_reset,
             NPCM7XX_WATCHDOG_RESET_GPIO_IN, NPCM7XX_NR_WATCHDOGS);
@@ -996,15 +996,15 @@ static const VMStateDescription vmstate_npcm7xx_clk_divider = {
     },
 };
 
-static const VMStateDescription vmstate_npcm7xx_clk = {
-    .name = "npcm7xx-clk",
-    .version_id = 1,
-    .minimum_version_id = 1,
-    .post_load = npcm7xx_clk_post_load,
+static const VMStateDescription vmstate_npcm_clk = {
+    .name = "npcm-clk",
+    .version_id = 2,
+    .minimum_version_id = 2,
+    .post_load = npcm_clk_post_load,
     .fields = (const VMStateField[]) {
-        VMSTATE_UINT32_ARRAY(regs, NPCM7xxCLKState, NPCM7XX_CLK_NR_REGS),
-        VMSTATE_INT64(ref_ns, NPCM7xxCLKState),
-        VMSTATE_CLOCK(clkref, NPCM7xxCLKState),
+        VMSTATE_UINT32_ARRAY(regs, NPCMCLKState, NPCM_CLK_MAX_NR_REGS),
+        VMSTATE_INT64(ref_ns, NPCMCLKState),
+        VMSTATE_CLOCK(clkref, NPCMCLKState),
         VMSTATE_END_OF_LIST(),
     },
 };
@@ -1033,17 +1033,23 @@ static void npcm7xx_clk_divider_class_init(ObjectClass *klass, void *data)
     dc->vmsd = &vmstate_npcm7xx_clk_divider;
 }
 
-static void npcm7xx_clk_class_init(ObjectClass *klass, void *data)
+static void npcm_clk_class_init(ObjectClass *klass, void *data)
 {
     ResettableClass *rc = RESETTABLE_CLASS(klass);
     DeviceClass *dc = DEVICE_CLASS(klass);
 
-    QEMU_BUILD_BUG_ON(NPCM7XX_CLK_REGS_END > NPCM7XX_CLK_NR_REGS);
+    dc->vmsd = &vmstate_npcm_clk;
+    dc->realize = npcm_clk_realize;
+    rc->phases.enter = npcm_clk_enter_reset;
+}
+
+static void npcm7xx_clk_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
 
+    QEMU_BUILD_BUG_ON(NPCM7XX_CLK_REGS_END > NPCM_CLK_MAX_NR_REGS);
+    QEMU_BUILD_BUG_ON(NPCM7XX_CLK_REGS_END != NPCM7XX_CLK_NR_REGS);
     dc->desc = "NPCM7xx Clock Control Registers";
-    dc->vmsd = &vmstate_npcm7xx_clk;
-    dc->realize = npcm7xx_clk_realize;
-    rc->phases.enter = npcm7xx_clk_enter_reset;
 }
 
 static const TypeInfo npcm7xx_clk_pll_info = {
@@ -1070,11 +1076,18 @@ static const TypeInfo npcm7xx_clk_divider_info = {
     .class_init         = npcm7xx_clk_divider_class_init,
 };
 
+static const TypeInfo npcm_clk_info = {
+    .name               = TYPE_NPCM_CLK,
+    .parent             = TYPE_SYS_BUS_DEVICE,
+    .instance_size      = sizeof(NPCMCLKState),
+    .instance_init      = npcm_clk_init,
+    .class_init         = npcm_clk_class_init,
+    .abstract           = true,
+};
+
 static const TypeInfo npcm7xx_clk_info = {
     .name               = TYPE_NPCM7XX_CLK,
-    .parent             = TYPE_SYS_BUS_DEVICE,
-    .instance_size      = sizeof(NPCM7xxCLKState),
-    .instance_init      = npcm7xx_clk_init,
+    .parent             = TYPE_NPCM_CLK,
     .class_init         = npcm7xx_clk_class_init,
 };
 
@@ -1083,6 +1096,7 @@ static void npcm7xx_clk_register_type(void)
     type_register_static(&npcm7xx_clk_pll_info);
     type_register_static(&npcm7xx_clk_sel_info);
     type_register_static(&npcm7xx_clk_divider_info);
+    type_register_static(&npcm_clk_info);
     type_register_static(&npcm7xx_clk_info);
 }
 type_init(npcm7xx_clk_register_type);
diff --git a/hw/misc/trace-events b/hw/misc/trace-events
index f25dbd6030..4383808d7a 100644
--- a/hw/misc/trace-events
+++ b/hw/misc/trace-events
@@ -130,9 +130,9 @@ mos6522_set_sr_int(void) "set sr_int"
 mos6522_write(uint64_t addr, const char *name, uint64_t val) "reg=0x%"PRIx64 " [%s] val=0x%"PRIx64
 mos6522_read(uint64_t addr, const char *name, unsigned val) "reg=0x%"PRIx64 " [%s] val=0x%x"
 
-# npcm7xx_clk.c
-npcm7xx_clk_read(uint64_t offset, uint32_t value) " offset: 0x%04" PRIx64 " value: 0x%08" PRIx32
-npcm7xx_clk_write(uint64_t offset, uint32_t value) "offset: 0x%04" PRIx64 " value: 0x%08" PRIx32
+# npcm_clk.c
+npcm_clk_read(uint64_t offset, uint32_t value) " offset: 0x%04" PRIx64 " value: 0x%08" PRIx32
+npcm_clk_write(uint64_t offset, uint32_t value) "offset: 0x%04" PRIx64 " value: 0x%08" PRIx32
 
 # npcm_gcr.c
 npcm_gcr_read(uint64_t offset, uint64_t value) " offset: 0x%04" PRIx64 " value: 0x%08" PRIx64
diff --git a/include/hw/arm/npcm7xx.h b/include/hw/arm/npcm7xx.h
index e80fd91f20..56536565b7 100644
--- a/include/hw/arm/npcm7xx.h
+++ b/include/hw/arm/npcm7xx.h
@@ -90,7 +90,7 @@ struct NPCM7xxState {
     MemoryRegion        *dram;
 
     NPCMGCRState        gcr;
-    NPCM7xxCLKState     clk;
+    NPCMCLKState     clk;
     NPCM7xxTimerCtrlState tim[3];
     NPCM7xxADCState     adc;
     NPCM7xxPWMState     pwm[NPCM7XX_NR_PWM_MODULES];
diff --git a/include/hw/misc/npcm_clk.h b/include/hw/misc/npcm_clk.h
index 0aef81e10c..db03b46a52 100644
--- a/include/hw/misc/npcm_clk.h
+++ b/include/hw/misc/npcm_clk.h
@@ -20,11 +20,12 @@
 #include "hw/clock.h"
 #include "hw/sysbus.h"
 
+#define NPCM7XX_CLK_NR_REGS             (0x70 / sizeof(uint32_t))
 /*
- * Number of registers in our device state structure. Don't change this without
- * incrementing the version_id in the vmstate.
+ * Number of maximum registers in NPCM device state structure. Don't change
+ * this without incrementing the version_id in the vmstate.
  */
-#define NPCM7XX_CLK_NR_REGS             (0x70 / sizeof(uint32_t))
+#define NPCM_CLK_MAX_NR_REGS            NPCM7XX_CLK_NR_REGS
 
 #define NPCM7XX_WATCHDOG_RESET_GPIO_IN "npcm7xx-clk-watchdog-reset-gpio-in"
 
@@ -80,7 +81,7 @@ typedef enum NPCM7xxClockDivider {
     NPCM7XX_CLOCK_NR_DIVIDERS,
 } NPCM7xxClockConverter;
 
-typedef struct NPCM7xxCLKState NPCM7xxCLKState;
+typedef struct NPCMCLKState NPCMCLKState;
 
 /**
  * struct NPCM7xxClockPLLState - A PLL module in CLK module.
@@ -94,7 +95,7 @@ typedef struct NPCM7xxClockPLLState {
     DeviceState parent;
 
     const char *name;
-    NPCM7xxCLKState *clk;
+    NPCMCLKState *clk;
     Clock *clock_in;
     Clock *clock_out;
 
@@ -115,7 +116,7 @@ typedef struct NPCM7xxClockSELState {
     DeviceState parent;
 
     const char *name;
-    NPCM7xxCLKState *clk;
+    NPCMCLKState *clk;
     uint8_t input_size;
     Clock *clock_in[NPCM7XX_CLK_SEL_MAX_INPUT];
     Clock *clock_out;
@@ -140,7 +141,7 @@ typedef struct NPCM7xxClockDividerState {
     DeviceState parent;
 
     const char *name;
-    NPCM7xxCLKState *clk;
+    NPCMCLKState *clk;
     Clock *clock_in;
     Clock *clock_out;
 
@@ -155,7 +156,7 @@ typedef struct NPCM7xxClockDividerState {
     };
 } NPCM7xxClockDividerState;
 
-struct NPCM7xxCLKState {
+struct NPCMCLKState {
     SysBusDevice parent;
 
     MemoryRegion iomem;
@@ -165,7 +166,7 @@ struct NPCM7xxCLKState {
     NPCM7xxClockSELState sels[NPCM7XX_CLOCK_NR_SELS];
     NPCM7xxClockDividerState dividers[NPCM7XX_CLOCK_NR_DIVIDERS];
 
-    uint32_t regs[NPCM7XX_CLK_NR_REGS];
+    uint32_t regs[NPCM_CLK_MAX_NR_REGS];
 
     /* Time reference for SECCNT and CNTR25M, initialized by power on reset */
     int64_t ref_ns;
@@ -174,7 +175,8 @@ struct NPCM7xxCLKState {
     Clock *clkref;
 };
 
+#define TYPE_NPCM_CLK "npcm-clk"
+OBJECT_DECLARE_SIMPLE_TYPE(NPCMCLKState, NPCM_CLK)
 #define TYPE_NPCM7XX_CLK "npcm7xx-clk"
-OBJECT_DECLARE_SIMPLE_TYPE(NPCM7xxCLKState, NPCM7XX_CLK)
 
 #endif /* NPCM_CLK_H */
-- 
2.48.1.601.g30ceb7b040-goog


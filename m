Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33CE4CD98E4
	for <qemu-arm@archiver.kernel.org>; Wed, 17 Jun 2026 12:02:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wZoy5-0003nS-6o; Wed, 17 Jun 2026 08:02:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <163wangjack@gmail.com>)
 id 1wZowJ-00033u-Fj
 for qemu-arm@nongnu.org; Wed, 17 Jun 2026 08:00:15 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <163wangjack@gmail.com>)
 id 1wZowG-0008JE-FR
 for qemu-arm@nongnu.org; Wed, 17 Jun 2026 08:00:15 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-36d98b68d68so3874214a91.2
 for <qemu-arm@nongnu.org>; Wed, 17 Jun 2026 05:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781697610; x=1782302410; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DcM1fU4v1GVwSrrIPjg6LuptyJklzv35LiIaFMncmqI=;
 b=OHo9YKBLDacoCXOGQjtXdi7fZIASFl2E+qUBuoKOFhsvlLLTesz6zaco6Fc5CR5WFt
 //jMaFCE4bFjzbautzeSWR3odwCPt6eblM8+Oc/UND73gfAsWivmx/Az9Knampnn/tIb
 YHUoUHeC8gr3KTRX6WGXD1+B9fudgHy70McDF4PyWptVtfSEgmxWbFP0i5gv2uBjunrw
 42mNNegs6kWW4i00p0SlggEom7rAbHos9Pv9/k+oMY8ozoJgXBBQH7YI2nz29zPxrh2F
 6ixC4tkmlmts9DRAg7buWYEQRNVNKkzYb4qJ0wkmXMCm7re6JYWg6rJt/Lgro2HxuiLv
 2cOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781697610; x=1782302410;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DcM1fU4v1GVwSrrIPjg6LuptyJklzv35LiIaFMncmqI=;
 b=VRTsTIPMGLXAzwTlFnytyKwhtrfQ/bD9r4zfbfeFX4E5gb/EAYDQPlk+a5u31UZ4SO
 oeXFOIt0lkwFzwqu9+XfDdeU8xMiKK1ZPhoDr8OCSSrTh3jB2ID6qnTntohFUil8RJ7H
 sWkZhLLUaEOxxgOnjrnKykAI5mlkfq5LHPPdt8vnnTYs2BM4lJwD5tTosJAr8ggbG5rI
 PtYQFZ3QQJuANK9EIKVNjOp4QXLGId0UyTszZ8F+7dvroE5yW7pjX+yjWVGMNuc8umqm
 Zvwg29TbHQDklTHBpKK5WZjusAUJApMEe76FfNMKlhMKyrGeDTeAc0TARXy+dhuZ+RA7
 nOYw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/11DhQ7Rvyz9vOyJoBWXR3zPIrbxCyMXPh8mGXer1vmWxiJA1huWOf9wBI/SQJEoZuqQdvVgwX5Q==@nongnu.org
X-Gm-Message-State: AOJu0Ywuh3UJtB9ox6yZ2bYYJjVsfBUUNCAJdkir2f9Df6KeEiR7+xnf
 HaUshgJPYx76FWE4AUMRGEe53fHXJH56DCvfE6gwT5ljiFH65MHApDtt
X-Gm-Gg: AfdE7ckAnRO8xlhes8pR0MEqtWUgtp/oX4LV2/eRKhq++/x+TAQwnnPE3WN2NTCkw/o
 TKAsnn29w6x7sjLqtKZKom22uMjUdmAI7Ya9WgnCdmOqxjznlsIppv60unsNlWYPuWAuvJSe8Ve
 OCfIJsaP+iruclVzTzYxevu4R3A6LZCauyA3ezR0v+fdlP+S4De/0T4DdauEuth0jN+ByA3f1bU
 RSKlAxu5C62AvCMoyyOHkpcJpMkUBo8r+ZPKxS33c6+Htr7pTvji/FY/MxfNcudx80KZqtGXq1b
 AvDHCwmngrOiJEi/ojqB5m5RiPkYSlKw8uXa1EaEs9VSX62Ekbis9Bu4QcmZy3BB3lunpFoxWWI
 LOko8k3WgXh5PWvKwvLdjEBCyi8chC3TMaq4vVDHEEstdctLo6EWMY+Q7VFPdvFwC8aVVBpeDem
 X/lALd7j5ZJwzVXkkN3DVgHA2t
X-Received: by 2002:a17:90b:3805:b0:36b:71e6:3df1 with SMTP id
 98e67ed59e1d1-37c930e0adbmr3542661a91.3.1781697610391; 
 Wed, 17 Jun 2026 05:00:10 -0700 (PDT)
Received: from localhost.localdomain ([82.40.42.115])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-37c521ae039sm5912367a91.1.2026.06.17.05.00.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 17 Jun 2026 05:00:09 -0700 (PDT)
From: Wang Yuxin <163wangjack@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-trivial@nongnu.org
Cc: peter.maydell@linaro.org, mjt@tls.msk.ru, laurent@vivier.eu,
 Wang Yuxin <163wangjack@gmail.com>
Subject: [PATCH trivial v2] hw/timer/imx_epit: Replace DPRINTF with trace
 events
Date: Wed, 17 Jun 2026 19:59:49 +0800
Message-ID: <20260617115949.93529-1-163wangjack@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=163wangjack@gmail.com; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_STARTS_WITH_NUMS=0.738, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 17 Jun 2026 08:02:03 -0400
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Clean up the codebase by removing the outdated DEBUG_IMX_EPIT
and DPRINTF macros, replacing them with modern QEMU trace events.

This also removes an empty and meaningless DPRINTF("\n") in the
imx_epit_realize function.

Signed-off-by: jw_mac <163wangjack@gmail.com>
Signed-off-by: Wang Yuxin <163wangjack@gmail.com>
---
 hw/timer/imx_epit.c   | 25 +++++--------------------
 hw/timer/trace-events |  8 ++++++++
 2 files changed, 13 insertions(+), 20 deletions(-)

diff --git a/hw/timer/imx_epit.c b/hw/timer/imx_epit.c
index c67a39f10c..476e2771b3 100644
--- a/hw/timer/imx_epit.c
+++ b/hw/timer/imx_epit.c
@@ -20,18 +20,7 @@
 #include "hw/misc/imx_ccm.h"
 #include "qemu/module.h"
 #include "qemu/log.h"
-
-#ifndef DEBUG_IMX_EPIT
-#define DEBUG_IMX_EPIT 0
-#endif
-
-#define DPRINTF(fmt, args...) \
-    do { \
-        if (DEBUG_IMX_EPIT) { \
-            fprintf(stderr, "[%s]%s: " fmt , TYPE_IMX_EPIT, \
-                                             __func__, ##args); \
-        } \
-    } while (0)
+#include "trace.h"
 
 static const char *imx_epit_reg_name(uint32_t reg)
 {
@@ -80,7 +69,7 @@ static uint32_t imx_epit_get_freq(IMXEPITState *s)
     uint32_t prescaler = 1 + extract32(s->cr, CR_PRESCALE_SHIFT, CR_PRESCALE_BITS);
     uint32_t f_in = imx_ccm_get_clock_frequency(s->ccm, imx_epit_clocks[clksrc]);
     uint32_t freq = f_in / prescaler;
-    DPRINTF("ptimer frequency is %u\n", freq);
+    trace_imx_epit_get_freq(freq);
     return freq;
 }
 
@@ -146,8 +135,7 @@ static uint64_t imx_epit_read(void *opaque, hwaddr offset, unsigned size)
                       HWADDR_PRIx "\n", TYPE_IMX_EPIT, __func__, offset);
         break;
     }
-
-    DPRINTF("(%s) = 0x%08x\n", imx_epit_reg_name(offset >> 2), reg_value);
+    trace_imx_epit_read(imx_epit_reg_name(offset >> 2), reg_value);
 
     return reg_value;
 }
@@ -328,8 +316,7 @@ static void imx_epit_write(void *opaque, hwaddr offset, uint64_t value,
 {
     IMXEPITState *s = IMX_EPIT(opaque);
 
-    DPRINTF("(%s, value = 0x%08x)\n", imx_epit_reg_name(offset >> 2),
-            (uint32_t)value);
+    trace_imx_epit_write(imx_epit_reg_name(offset >> 2), (uint32_t)value);
 
     switch (offset >> 2) {
     case 0: /* CR */
@@ -362,7 +349,7 @@ static void imx_epit_cmp(void *opaque)
     /* The cmp ptimer can't be running when the peripheral is disabled */
     assert(s->cr & CR_EN);
 
-    DPRINTF("sr was %d\n", s->sr);
+    trace_imx_epit_cmp(s->sr);
     /* Set interrupt status bit SR.OCIF and update the interrupt state */
     s->sr |= SR_OCIF;
     imx_epit_update_int(s);
@@ -399,8 +386,6 @@ static void imx_epit_realize(DeviceState *dev, Error **errp)
     IMXEPITState *s = IMX_EPIT(dev);
     SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
 
-    DPRINTF("\n");
-
     sysbus_init_irq(sbd, &s->irq);
     memory_region_init_io(&s->iomem, OBJECT(s), &imx_epit_ops, s, TYPE_IMX_EPIT,
                           0x00001000);
diff --git a/hw/timer/trace-events b/hw/timer/trace-events
index ac5afe84e8..3c282800c6 100644
--- a/hw/timer/trace-events
+++ b/hw/timer/trace-events
@@ -122,3 +122,11 @@ hpet_ram_write_tn_cmp(uint8_t reg_off) "hpet_ram_writel HPET_TN_CMP + %" PRIu8
 hpet_ram_write_invalid_tn_cmp(void) "invalid HPET_TN_CMP + 4 write"
 hpet_ram_write_invalid(void) "invalid hpet_ram_writel"
 hpet_ram_write_counter_write_while_enabled(void) "Writing counter while HPET enabled!"
+
+# imx_epit.c
+imx_epit_get_freq(uint32_t freq) "ptimer frequency is %u"
+imx_epit_read(const char *name, uint32_t value) "(%s) = 0x%08x"
+imx_epit_write(const char *name, uint32_t value) "(%s, value = 0x%08x)"
+imx_epit_cmp(uint32_t sr) "sr was %d"
+
+
-- 
2.53.0



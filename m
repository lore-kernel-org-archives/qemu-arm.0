Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp1500480njf;
        Tue, 3 Sep 2024 09:09:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV/LoHrDfD6S8490c85C1lOJC/L6Hzm6nEWywD5hNfzAx69Vnuoc6mg0CmcQcUhjlSEapN2UfND3Co8jQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHto6BFjq1QmULSLCiIC+oI/+/W2wIrDMV3eyiWygmGuAihrpEo3AEFqKmRU6am+CUm7zgR
X-Received: by 2002:a05:6870:6487:b0:277:caf7:3631 with SMTP id 586e51a60fabf-277caf74b7amr11628707fac.5.1725379793428;
        Tue, 03 Sep 2024 09:09:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725379793; cv=none;
        d=google.com; s=arc-20160816;
        b=zCjgTDAmRtc52XpzuUgIFPmTBc1QLtN4GCVFYSoYB1yubhJ0/AVw1lrv+Cn6Fmb2wa
         Cbsz/5+JHqTqOwVQe04QpmWP3s9VhUlbvb6Ljcm6LghJRN5c1UWAWMcB8Gmu6wmEbTLq
         jlDf2pumAlPm1MQqAS0SOFJO7v8+FAbDHOlwfU159bzS+bHSfsPm1S68dyFCuYDDHNMP
         lSJ+ZdmcWDSgPMxVv6dMxi4rkRmLg1XPQFJUVB92g04Ph+cwCrNuqg3tRrFWm6AOCnn1
         MIYJusTrhLLz3Df1KpDSU6lzWRxT5cyPvgnFzl1fmU62B4TEF2CEtdh7JA5KpoxizsOS
         dvhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=RiaywRbcOCiCgn3347BHWUHpyXbCw1QihnmeQQB1EJU=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=Lof6ZpjgphguDnrOkUQlFqHh6zvdMaCncAwQ1wRvZbWpLNpaf+rrgSqeSm/1GtINlC
         QzZQgKdUH1b6XY6TJ4ERYPIkyL6Lp1K7jmYyAWLkK0RFsdMUd4mpBCEFGy29ihjkrHlN
         VLjBfyb89FBr8MWQoyh398fOWSUfxi/dE9YkahY9k32VCA1dT4NstZAH/NwKGanDnjUo
         Z/5BjUk35Kr+T2/sz5YbMquL/nlgTNh0dnekMVppCCcSVY+ziLMCySf3RhvhbNQgS98h
         XuEn27Kfgdml5VXeg0GWNGK8SSRqWrl2HXVJYm1kYSdmznqzm+4/oqo6Z+13RqA6FYym
         rWdg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xyVzmXup;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-49a5f4197aasi3283843137.28.2024.09.03.09.09.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Sep 2024 09:09:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xyVzmXup;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1slW57-00077s-VF; Tue, 03 Sep 2024 12:08:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1slW57-00074l-9i
 for qemu-arm@nongnu.org; Tue, 03 Sep 2024 12:08:37 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1slW52-0002oL-R7
 for qemu-arm@nongnu.org; Tue, 03 Sep 2024 12:08:37 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-367990aaef3so3276027f8f.0
 for <qemu-arm@nongnu.org>; Tue, 03 Sep 2024 09:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725379711; x=1725984511; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=RiaywRbcOCiCgn3347BHWUHpyXbCw1QihnmeQQB1EJU=;
 b=xyVzmXupd8NeXvBb/5IyzV8IrlYP6p46078k/eX5vPKw4qQnOJWxz9zjyNt5zRPloL
 74OBcA00TUeAw7RQdWrRNl1VUrvHiOL4tynI04IROZ1kF1X0Ga5BOEt0wtRYh47DPU1w
 S/te6PExU+A3Jn0/u5h50NvNoXubLoJfoPNy5zhqtPJStdTGdMeueIK5QITm4H1+DDSu
 inuCmhlTeKzGk8k3O1Za/U7Nppp5m0ZhjbUYjKjuBR7KjMEveGcfTVFECSt0nVdYqfH2
 j0QOfcthUMsCtvWtOzpFzGUfrbd8D+NXeoxhyyMJW1BoYlGwoBvz+NZTIES/x+R+lBib
 ZXWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725379711; x=1725984511;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RiaywRbcOCiCgn3347BHWUHpyXbCw1QihnmeQQB1EJU=;
 b=O3lnfXWTuoYmAGb+nr41xSlupWxSD3KtZJ7pzVExAdjKj4M28m+q7RTs4PaSbCHcHk
 zvsDBvI+lJxKd/V4aENXJOtGiHygWGw0Rg64IPXCNlomMSVUR8TdHuqVJuztbTgicrQo
 IVjsKewphrDm5dcx3LPRQ0xC1bToiNpcRPTqX8wK+tCtWUtRtpgx9UwElBuWaDP02CvE
 q207YNyGHMU2H2HnMCQ9MItOW7volNmILyWsN2Htvliz2O0ipr3r4439uGTYSJW6IdVq
 tfYC4J9rHA21QgiW7Ev7RGtWF2OBwZh4nyzkXdsYN337cxQiHDZUBEM/MlYzY60doBCy
 e+Nw==
X-Gm-Message-State: AOJu0YxE52V+Yeo8jSkkefJgilMWH8+Qm32idHczHDR9OYLdLRaxbPeZ
 y5SAAoynJlcUJcSn77lQqIqy6TnouUyfGK7fncSWUAY9eQWduaAHSW5SMjNZ+CyPDG/De5x9+Sy
 J
X-Received: by 2002:adf:e042:0:b0:374:c8a0:ca8c with SMTP id
 ffacd0b85a97d-376dea47175mr1090766f8f.43.1725379710842; 
 Tue, 03 Sep 2024 09:08:30 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bb6df1066sm175123065e9.18.2024.09.03.09.08.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 09:08:30 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-9.2 21/53] hw/arm: Remove pxa2xx_gpio
Date: Tue,  3 Sep 2024 17:07:19 +0100
Message-Id: <20240903160751.4100218-22-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240903160751.4100218-1-peter.maydell@linaro.org>
References: <20240903160751.4100218-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: eOj4DO0uDX4g

Remove the pxa2xx-specific GPIO device.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/pxa.h |   5 -
 hw/arm/pxa2xx_gpio.c | 365 -------------------------------------------
 hw/arm/meson.build   |   2 +-
 3 files changed, 1 insertion(+), 371 deletions(-)
 delete mode 100644 hw/arm/pxa2xx_gpio.c

diff --git a/include/hw/arm/pxa.h b/include/hw/arm/pxa.h
index 5f98536bc69..fb28a683f38 100644
--- a/include/hw/arm/pxa.h
+++ b/include/hw/arm/pxa.h
@@ -71,9 +71,4 @@
 /* pxa2xx_pic.c */
 DeviceState *pxa2xx_pic_init(hwaddr base, ARMCPU *cpu);
 
-/* pxa2xx_gpio.c */
-DeviceState *pxa2xx_gpio_init(hwaddr base,
-                              ARMCPU *cpu, DeviceState *pic, int lines);
-void pxa2xx_gpio_read_notifier(DeviceState *dev, qemu_irq handler);
-
 #endif /* PXA_H */
diff --git a/hw/arm/pxa2xx_gpio.c b/hw/arm/pxa2xx_gpio.c
deleted file mode 100644
index 41dca036fbb..00000000000
--- a/hw/arm/pxa2xx_gpio.c
+++ /dev/null
@@ -1,365 +0,0 @@
-/*
- * Intel XScale PXA255/270 GPIO controller emulation.
- *
- * Copyright (c) 2006 Openedhand Ltd.
- * Written by Andrzej Zaborowski <balrog@zabor.org>
- *
- * This code is licensed under the GPL.
- */
-
-#include "qemu/osdep.h"
-#include "cpu.h"
-#include "hw/irq.h"
-#include "hw/qdev-properties.h"
-#include "hw/sysbus.h"
-#include "migration/vmstate.h"
-#include "hw/arm/pxa.h"
-#include "qapi/error.h"
-#include "qemu/log.h"
-#include "qemu/module.h"
-#include "qom/object.h"
-
-#define PXA2XX_GPIO_BANKS	4
-
-#define TYPE_PXA2XX_GPIO "pxa2xx-gpio"
-OBJECT_DECLARE_SIMPLE_TYPE(PXA2xxGPIOInfo, PXA2XX_GPIO)
-
-struct PXA2xxGPIOInfo {
-    /*< private >*/
-    SysBusDevice parent_obj;
-    /*< public >*/
-
-    MemoryRegion iomem;
-    qemu_irq irq0, irq1, irqX;
-    int lines;
-    ARMCPU *cpu;
-
-    /* XXX: GNU C vectors are more suitable */
-    uint32_t ilevel[PXA2XX_GPIO_BANKS];
-    uint32_t olevel[PXA2XX_GPIO_BANKS];
-    uint32_t dir[PXA2XX_GPIO_BANKS];
-    uint32_t rising[PXA2XX_GPIO_BANKS];
-    uint32_t falling[PXA2XX_GPIO_BANKS];
-    uint32_t status[PXA2XX_GPIO_BANKS];
-    uint32_t gafr[PXA2XX_GPIO_BANKS * 2];
-
-    uint32_t prev_level[PXA2XX_GPIO_BANKS];
-    qemu_irq handler[PXA2XX_GPIO_BANKS * 32];
-    qemu_irq read_notify;
-};
-
-static struct {
-    enum {
-        GPIO_NONE,
-        GPLR,
-        GPSR,
-        GPCR,
-        GPDR,
-        GRER,
-        GFER,
-        GEDR,
-        GAFR_L,
-        GAFR_U,
-    } reg;
-    int bank;
-} pxa2xx_gpio_regs[0x200] = {
-    [0 ... 0x1ff] = { GPIO_NONE, 0 },
-#define PXA2XX_REG(reg, a0, a1, a2, a3)	\
-    [a0] = { reg, 0 }, [a1] = { reg, 1 }, [a2] = { reg, 2 }, [a3] = { reg, 3 },
-
-    PXA2XX_REG(GPLR, 0x000, 0x004, 0x008, 0x100)
-    PXA2XX_REG(GPSR, 0x018, 0x01c, 0x020, 0x118)
-    PXA2XX_REG(GPCR, 0x024, 0x028, 0x02c, 0x124)
-    PXA2XX_REG(GPDR, 0x00c, 0x010, 0x014, 0x10c)
-    PXA2XX_REG(GRER, 0x030, 0x034, 0x038, 0x130)
-    PXA2XX_REG(GFER, 0x03c, 0x040, 0x044, 0x13c)
-    PXA2XX_REG(GEDR, 0x048, 0x04c, 0x050, 0x148)
-    PXA2XX_REG(GAFR_L, 0x054, 0x05c, 0x064, 0x06c)
-    PXA2XX_REG(GAFR_U, 0x058, 0x060, 0x068, 0x070)
-};
-
-static void pxa2xx_gpio_irq_update(PXA2xxGPIOInfo *s)
-{
-    if (s->status[0] & (1 << 0))
-        qemu_irq_raise(s->irq0);
-    else
-        qemu_irq_lower(s->irq0);
-
-    if (s->status[0] & (1 << 1))
-        qemu_irq_raise(s->irq1);
-    else
-        qemu_irq_lower(s->irq1);
-
-    if ((s->status[0] & ~3) | s->status[1] | s->status[2] | s->status[3])
-        qemu_irq_raise(s->irqX);
-    else
-        qemu_irq_lower(s->irqX);
-}
-
-/* Bitmap of pins used as standby and sleep wake-up sources.  */
-static const int pxa2xx_gpio_wake[PXA2XX_GPIO_BANKS] = {
-    0x8003fe1b, 0x002001fc, 0xec080000, 0x0012007f,
-};
-
-static void pxa2xx_gpio_set(void *opaque, int line, int level)
-{
-    PXA2xxGPIOInfo *s = (PXA2xxGPIOInfo *) opaque;
-    CPUState *cpu = CPU(s->cpu);
-    int bank;
-    uint32_t mask;
-
-    if (line >= s->lines) {
-        printf("%s: No GPIO pin %i\n", __func__, line);
-        return;
-    }
-
-    bank = line >> 5;
-    mask = 1U << (line & 31);
-
-    if (level) {
-        s->status[bank] |= s->rising[bank] & mask &
-                ~s->ilevel[bank] & ~s->dir[bank];
-        s->ilevel[bank] |= mask;
-    } else {
-        s->status[bank] |= s->falling[bank] & mask &
-                s->ilevel[bank] & ~s->dir[bank];
-        s->ilevel[bank] &= ~mask;
-    }
-
-    if (s->status[bank] & mask)
-        pxa2xx_gpio_irq_update(s);
-
-    /* Wake-up GPIOs */
-    if (cpu->halted && (mask & ~s->dir[bank] & pxa2xx_gpio_wake[bank])) {
-        cpu_interrupt(cpu, CPU_INTERRUPT_EXITTB);
-    }
-}
-
-static void pxa2xx_gpio_handler_update(PXA2xxGPIOInfo *s) {
-    uint32_t level, diff;
-    int i, bit, line;
-    for (i = 0; i < PXA2XX_GPIO_BANKS; i ++) {
-        level = s->olevel[i] & s->dir[i];
-
-        for (diff = s->prev_level[i] ^ level; diff; diff ^= 1 << bit) {
-            bit = ctz32(diff);
-            line = bit + 32 * i;
-            qemu_set_irq(s->handler[line], (level >> bit) & 1);
-        }
-
-        s->prev_level[i] = level;
-    }
-}
-
-static uint64_t pxa2xx_gpio_read(void *opaque, hwaddr offset,
-                                 unsigned size)
-{
-    PXA2xxGPIOInfo *s = (PXA2xxGPIOInfo *) opaque;
-    uint32_t ret;
-    int bank;
-    if (offset >= 0x200)
-        return 0;
-
-    bank = pxa2xx_gpio_regs[offset].bank;
-    switch (pxa2xx_gpio_regs[offset].reg) {
-    case GPDR:		/* GPIO Pin-Direction registers */
-        return s->dir[bank];
-
-    case GPSR:		/* GPIO Pin-Output Set registers */
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "pxa2xx GPIO: read from write only register GPSR\n");
-        return 0;
-
-    case GPCR:		/* GPIO Pin-Output Clear registers */
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "pxa2xx GPIO: read from write only register GPCR\n");
-        return 0;
-
-    case GRER:		/* GPIO Rising-Edge Detect Enable registers */
-        return s->rising[bank];
-
-    case GFER:		/* GPIO Falling-Edge Detect Enable registers */
-        return s->falling[bank];
-
-    case GAFR_L:	/* GPIO Alternate Function registers */
-        return s->gafr[bank * 2];
-
-    case GAFR_U:	/* GPIO Alternate Function registers */
-        return s->gafr[bank * 2 + 1];
-
-    case GPLR:		/* GPIO Pin-Level registers */
-        ret = (s->olevel[bank] & s->dir[bank]) |
-                (s->ilevel[bank] & ~s->dir[bank]);
-        qemu_irq_raise(s->read_notify);
-        return ret;
-
-    case GEDR:		/* GPIO Edge Detect Status registers */
-        return s->status[bank];
-
-    default:
-        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%" HWADDR_PRIX "\n",
-                      __func__, offset);
-    }
-
-    return 0;
-}
-
-static void pxa2xx_gpio_write(void *opaque, hwaddr offset,
-                              uint64_t value, unsigned size)
-{
-    PXA2xxGPIOInfo *s = (PXA2xxGPIOInfo *) opaque;
-    int bank;
-    if (offset >= 0x200)
-        return;
-
-    bank = pxa2xx_gpio_regs[offset].bank;
-    switch (pxa2xx_gpio_regs[offset].reg) {
-    case GPDR:		/* GPIO Pin-Direction registers */
-        s->dir[bank] = value;
-        pxa2xx_gpio_handler_update(s);
-        break;
-
-    case GPSR:		/* GPIO Pin-Output Set registers */
-        s->olevel[bank] |= value;
-        pxa2xx_gpio_handler_update(s);
-        break;
-
-    case GPCR:		/* GPIO Pin-Output Clear registers */
-        s->olevel[bank] &= ~value;
-        pxa2xx_gpio_handler_update(s);
-        break;
-
-    case GRER:		/* GPIO Rising-Edge Detect Enable registers */
-        s->rising[bank] = value;
-        break;
-
-    case GFER:		/* GPIO Falling-Edge Detect Enable registers */
-        s->falling[bank] = value;
-        break;
-
-    case GAFR_L:	/* GPIO Alternate Function registers */
-        s->gafr[bank * 2] = value;
-        break;
-
-    case GAFR_U:	/* GPIO Alternate Function registers */
-        s->gafr[bank * 2 + 1] = value;
-        break;
-
-    case GEDR:		/* GPIO Edge Detect Status registers */
-        s->status[bank] &= ~value;
-        pxa2xx_gpio_irq_update(s);
-        break;
-
-    default:
-        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%" HWADDR_PRIX "\n",
-                      __func__, offset);
-    }
-}
-
-static const MemoryRegionOps pxa_gpio_ops = {
-    .read = pxa2xx_gpio_read,
-    .write = pxa2xx_gpio_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
-};
-
-DeviceState *pxa2xx_gpio_init(hwaddr base,
-                              ARMCPU *cpu, DeviceState *pic, int lines)
-{
-    DeviceState *dev;
-
-    dev = qdev_new(TYPE_PXA2XX_GPIO);
-    qdev_prop_set_int32(dev, "lines", lines);
-    object_property_set_link(OBJECT(dev), "cpu", OBJECT(cpu), &error_abort);
-    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
-
-    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
-    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0,
-                    qdev_get_gpio_in(pic, PXA2XX_PIC_GPIO_0));
-    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 1,
-                    qdev_get_gpio_in(pic, PXA2XX_PIC_GPIO_1));
-    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 2,
-                    qdev_get_gpio_in(pic, PXA2XX_PIC_GPIO_X));
-
-    return dev;
-}
-
-static void pxa2xx_gpio_initfn(Object *obj)
-{
-    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
-    DeviceState *dev = DEVICE(sbd);
-    PXA2xxGPIOInfo *s = PXA2XX_GPIO(dev);
-
-    memory_region_init_io(&s->iomem, obj, &pxa_gpio_ops,
-                          s, "pxa2xx-gpio", 0x1000);
-    sysbus_init_mmio(sbd, &s->iomem);
-    sysbus_init_irq(sbd, &s->irq0);
-    sysbus_init_irq(sbd, &s->irq1);
-    sysbus_init_irq(sbd, &s->irqX);
-}
-
-static void pxa2xx_gpio_realize(DeviceState *dev, Error **errp)
-{
-    PXA2xxGPIOInfo *s = PXA2XX_GPIO(dev);
-
-    qdev_init_gpio_in(dev, pxa2xx_gpio_set, s->lines);
-    qdev_init_gpio_out(dev, s->handler, s->lines);
-}
-
-/*
- * Registers a callback to notify on GPLR reads.  This normally
- * shouldn't be needed but it is used for the hack on Spitz machines.
- */
-void pxa2xx_gpio_read_notifier(DeviceState *dev, qemu_irq handler)
-{
-    PXA2xxGPIOInfo *s = PXA2XX_GPIO(dev);
-
-    s->read_notify = handler;
-}
-
-static const VMStateDescription vmstate_pxa2xx_gpio_regs = {
-    .name = "pxa2xx-gpio",
-    .version_id = 1,
-    .minimum_version_id = 1,
-    .fields = (const VMStateField[]) {
-        VMSTATE_UINT32_ARRAY(ilevel, PXA2xxGPIOInfo, PXA2XX_GPIO_BANKS),
-        VMSTATE_UINT32_ARRAY(olevel, PXA2xxGPIOInfo, PXA2XX_GPIO_BANKS),
-        VMSTATE_UINT32_ARRAY(dir, PXA2xxGPIOInfo, PXA2XX_GPIO_BANKS),
-        VMSTATE_UINT32_ARRAY(rising, PXA2xxGPIOInfo, PXA2XX_GPIO_BANKS),
-        VMSTATE_UINT32_ARRAY(falling, PXA2xxGPIOInfo, PXA2XX_GPIO_BANKS),
-        VMSTATE_UINT32_ARRAY(status, PXA2xxGPIOInfo, PXA2XX_GPIO_BANKS),
-        VMSTATE_UINT32_ARRAY(gafr, PXA2xxGPIOInfo, PXA2XX_GPIO_BANKS * 2),
-        VMSTATE_UINT32_ARRAY(prev_level, PXA2xxGPIOInfo, PXA2XX_GPIO_BANKS),
-        VMSTATE_END_OF_LIST(),
-    },
-};
-
-static Property pxa2xx_gpio_properties[] = {
-    DEFINE_PROP_INT32("lines", PXA2xxGPIOInfo, lines, 0),
-    DEFINE_PROP_LINK("cpu", PXA2xxGPIOInfo, cpu, TYPE_ARM_CPU, ARMCPU *),
-    DEFINE_PROP_END_OF_LIST(),
-};
-
-static void pxa2xx_gpio_class_init(ObjectClass *klass, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(klass);
-
-    dc->desc = "PXA2xx GPIO controller";
-    device_class_set_props(dc, pxa2xx_gpio_properties);
-    dc->vmsd = &vmstate_pxa2xx_gpio_regs;
-    dc->realize = pxa2xx_gpio_realize;
-}
-
-static const TypeInfo pxa2xx_gpio_info = {
-    .name          = TYPE_PXA2XX_GPIO,
-    .parent        = TYPE_SYS_BUS_DEVICE,
-    .instance_size = sizeof(PXA2xxGPIOInfo),
-    .instance_init = pxa2xx_gpio_initfn,
-    .class_init    = pxa2xx_gpio_class_init,
-};
-
-static void pxa2xx_gpio_register_types(void)
-{
-    type_register_static(&pxa2xx_gpio_info);
-}
-
-type_init(pxa2xx_gpio_register_types)
diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index 06e57a96cb4..da42d41dc93 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -22,7 +22,7 @@ arm_ss.add(when: 'CONFIG_SABRELITE', if_true: files('sabrelite.c'))
 
 arm_ss.add(when: 'CONFIG_ARM_V7M', if_true: files('armv7m.c'))
 arm_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4210.c'))
-arm_ss.add(when: 'CONFIG_PXA2XX', if_true: files('pxa2xx_gpio.c', 'pxa2xx_pic.c'))
+arm_ss.add(when: 'CONFIG_PXA2XX', if_true: files('pxa2xx_pic.c'))
 arm_ss.add(when: 'CONFIG_DIGIC', if_true: files('digic.c'))
 arm_ss.add(when: 'CONFIG_OMAP', if_true: files('omap1.c'))
 arm_ss.add(when: 'CONFIG_ALLWINNER_A10', if_true: files('allwinner-a10.c', 'cubieboard.c'))
-- 
2.34.1


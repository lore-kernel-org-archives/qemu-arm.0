Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp1500609njf;
        Tue, 3 Sep 2024 09:10:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVWlMWqSx+GRmtAKyyHU9TpdVaicX7nMVwZAC/1fZgmCSLHhkFJZHjE2W4rvxAtBeNHuxnbKo7PA3aaYg==@linaro.org
X-Google-Smtp-Source: AGHT+IGf2FRVDSTd1tG5o5hjmTcW3micMPa6P/DSNX1KYJsrpnwcubhxCHEWvtgK+TCpLwPyRGcT
X-Received: by 2002:a05:6102:32ce:b0:493:e327:8344 with SMTP id ada2fe7eead31-49a5b061486mr17153866137.9.1725379808394;
        Tue, 03 Sep 2024 09:10:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725379808; cv=none;
        d=google.com; s=arc-20160816;
        b=JeO6SaGJpDbK8klaRtOdK0AhuPpmHJWV/EXisca7jF6G4GVAzVBurrUx0i5vtOck0W
         kzIjPznIzgppu/iQDQSq2AVisYnaSHplu1cJ0V+37jXeUoyJwVlIU1iA4Yrn2dPnNf5S
         Sr6WoFHpBBw0eSoNY01CpK/46U0a07fbuxcVm7gX8/rRISL2/oAIr7wN4Zfm7iRBQs9n
         lKSJkI7C5W7jfmA4nM5GxI8SihG5+wjKNMbgG3EjMBELGx4S2cKuIWQsWuJg4fo68QvS
         anmCShCW29AMz3p/w2zkn2CGyUEBNicDew4+l29Gj1ng9xRdKSr616zkQxO0dz2AywlR
         274Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=98dHBXppZY7GIvhfWwkwSB+S+qCyCFrZ2JMSYpx+b9s=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=gsCe1P5y5xosaraTEh8b7u5Pox2hHe5tslcht1FY26L0dyU+PyIrO/HrUnXIpRsSdE
         Kms8bbJQxJl7UvqWyxJSECDxx0U2KkXO932FPZ6HLLU8+SmObS60tmAHzXmbhlAlklwR
         QmBCPnkXAc1v8PS88/ONOZIdXMcGhF2Rufa79g9xk0U7e8oEkAL4AF0aPJmnXYUcub2F
         etW0R4jKRdtKxddE+LjS0Hxg0EAq6edr1N51QldGHFjxKj1wXPb0G/2JSQOWDXgb0jGz
         cDKwh6cWD8PmviDA8q1SWt7ur2WHV3BL8g37A3vmnO0yfOkF08fL8aRnrlNoaXVSrupN
         1Fdg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VIJG3Usi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-49ba98b1175si657673137.689.2024.09.03.09.10.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Sep 2024 09:10:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VIJG3Usi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1slW5h-0002E2-VZ; Tue, 03 Sep 2024 12:09:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1slW5f-0001va-TO
 for qemu-arm@nongnu.org; Tue, 03 Sep 2024 12:09:11 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1slW5c-00030M-Sx
 for qemu-arm@nongnu.org; Tue, 03 Sep 2024 12:09:11 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-374d29ad870so949165f8f.3
 for <qemu-arm@nongnu.org>; Tue, 03 Sep 2024 09:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725379747; x=1725984547; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=98dHBXppZY7GIvhfWwkwSB+S+qCyCFrZ2JMSYpx+b9s=;
 b=VIJG3UsiXrMsogi3ocjPz8wds1OyQVVDoi/a7Oa2gLwPPT/xiSNI9TgsNlkcNKW7Np
 3ZYV9mp2LN3PCVpMUpjpETukgS22LHycWlpndfKlYU1+eLFA2+wpmmjfVBOyXitltM4V
 U34gI5nj2Qa53/gyOb1+QxGkbIKPyMl9Vmw5XPo+AWnmfTslqJ/9gCQmJkSUFJQ9P0sE
 hapzcJMylxSPEZ4lsUgcHq1E5+wH1Nl1Ce41N3AArrO6MiuA8sRYlo60fvuAlA6TUYZy
 PwekQDnEF9yMZvIoSwF1cqhGy3TSsIpmm2Ha/sjtrNuersKv/3WC9I3417ngTW80q2fs
 LWxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725379747; x=1725984547;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=98dHBXppZY7GIvhfWwkwSB+S+qCyCFrZ2JMSYpx+b9s=;
 b=JuZWjv6jaWUBMvJf/pilOPfEhGGqVS+JqD5qukWpaYDDVasFEFRqlxck7f9yF3bhDE
 +o+DHgK7FNgFU88a/mto/RWZCgqC0qx+hJbpwWwObt0zJ8sOLK+tHXC+gUce0P5W0DeZ
 lICLnZs73UVzc/skql+NK+ho2cn5Abk2EYPQSz1G6H0kS28dqjbukhEELNYnNJEnFZbP
 kUEYk/8ABu9R1npLQNc/InY+D7Lo/73HJIbcBOXTk3O2NSkv/w4L3eR9f8Apiu7rONJ3
 rd2cyAeLFfxIlVgy/84hyZJYyo3gn/2NbnTRrTaBHAlRkdcXKTANG0UveuEGJcTQbvR2
 0VJQ==
X-Gm-Message-State: AOJu0YyYV/PMKXaMe6n927eadbZlpGQgXfHq54CkTDwLXYJSt0Er6tR3
 +AdhMBKqg/AqsfnPpGoVE14w4w2yGRljZ41mveJ2AtKIa/Cv0hsyai3e6n9ezU+sJZD85tc8doH
 k
X-Received: by 2002:adf:e602:0:b0:374:b9a0:ddee with SMTP id
 ffacd0b85a97d-374bf1e4a3dmr6742058f8f.56.1725379747195; 
 Tue, 03 Sep 2024 09:09:07 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bb6df1066sm175123065e9.18.2024.09.03.09.09.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 09:09:06 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-9.2 50/53] hw/misc: Remove omap_l4 device
Date: Tue,  3 Sep 2024 17:07:48 +0100
Message-Id: <20240903160751.4100218-51-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240903160751.4100218-1-peter.maydell@linaro.org>
References: <20240903160751.4100218-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: SOd7fQ/cIkmN

The omap_l4 device is OMAP2 only, so we can remove it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/omap.h |  42 -----------
 hw/misc/omap_l4.c     | 162 ------------------------------------------
 hw/misc/meson.build   |   1 -
 3 files changed, 205 deletions(-)
 delete mode 100644 hw/misc/omap_l4.c

diff --git a/include/hw/arm/omap.h b/include/hw/arm/omap.h
index 2300b97716d..f82b820d4d8 100644
--- a/include/hw/arm/omap.h
+++ b/include/hw/arm/omap.h
@@ -108,45 +108,6 @@ DECLARE_INSTANCE_CHECKER(Omap1GpioState, OMAP1_GPIO,
 /* TODO: clock framework (see above) */
 void omap_gpio_set_clk(Omap1GpioState *gpio, omap_clk clk);
 
-/* OMAP2 l4 Interconnect */
-struct omap_l4_s;
-struct omap_l4_region_s {
-    hwaddr offset;
-    size_t size;
-    int access;
-};
-struct omap_l4_agent_info_s {
-    int ta;
-    int region;
-    int regions;
-    int ta_region;
-};
-struct omap_target_agent_s {
-    MemoryRegion iomem;
-    struct omap_l4_s *bus;
-    int regions;
-    const struct omap_l4_region_s *start;
-    hwaddr base;
-    uint32_t component;
-    uint32_t control;
-    uint32_t status;
-};
-struct omap_l4_s *omap_l4_init(MemoryRegion *address_space,
-                               hwaddr base, int ta_num);
-
-struct omap_target_agent_s;
-struct omap_target_agent_s *omap_l4ta_get(
-    struct omap_l4_s *bus,
-    const struct omap_l4_region_s *regions,
-    const struct omap_l4_agent_info_s *agents,
-    int cs);
-hwaddr omap_l4_attach(struct omap_target_agent_s *ta,
-                                         int region, MemoryRegion *mr);
-hwaddr omap_l4_region_base(struct omap_target_agent_s *ta,
-                                       int region);
-hwaddr omap_l4_region_size(struct omap_target_agent_s *ta,
-                                       int region);
-
 /*
  * Common IRQ numbers for level 1 interrupt handler
  * See /usr/include/asm-arm/arch-omap/irqs.h in Linux.
@@ -890,9 +851,6 @@ struct omap_mpu_state_s {
         uint16_t dsp_idlect2;
         uint16_t dsp_rstct2;
     } clkm;
-
-    /* OMAP2-only peripherals */
-    struct omap_l4_s *l4;
 };
 
 /* omap1.c */
diff --git a/hw/misc/omap_l4.c b/hw/misc/omap_l4.c
deleted file mode 100644
index b7875489da3..00000000000
--- a/hw/misc/omap_l4.c
+++ /dev/null
@@ -1,162 +0,0 @@
-/*
- * TI OMAP L4 interconnect emulation.
- *
- * Copyright (C) 2007-2009 Nokia Corporation
- * Written by Andrzej Zaborowski <andrew@openedhand.com>
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License as
- * published by the Free Software Foundation; either version 2 or
- * (at your option) any later version of the License.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License along
- * with this program; if not, see <http://www.gnu.org/licenses/>.
- */
-#include "qemu/osdep.h"
-#include "hw/arm/omap.h"
-
-struct omap_l4_s {
-    MemoryRegion *address_space;
-    hwaddr base;
-    int ta_num;
-    struct omap_target_agent_s ta[];
-};
-
-struct omap_l4_s *omap_l4_init(MemoryRegion *address_space,
-                               hwaddr base, int ta_num)
-{
-    struct omap_l4_s *bus = g_malloc0(
-                    sizeof(*bus) + ta_num * sizeof(*bus->ta));
-
-    bus->address_space = address_space;
-    bus->ta_num = ta_num;
-    bus->base = base;
-
-    return bus;
-}
-
-hwaddr omap_l4_region_base(struct omap_target_agent_s *ta,
-                                       int region)
-{
-    return ta->bus->base + ta->start[region].offset;
-}
-
-hwaddr omap_l4_region_size(struct omap_target_agent_s *ta,
-                                       int region)
-{
-    return ta->start[region].size;
-}
-
-static uint64_t omap_l4ta_read(void *opaque, hwaddr addr, unsigned size)
-{
-    struct omap_target_agent_s *s = opaque;
-
-    if (size != 2) {
-        return omap_badwidth_read16(opaque, addr);
-    }
-
-    switch (addr) {
-    case 0x00:	/* COMPONENT */
-        return s->component;
-
-    case 0x20:	/* AGENT_CONTROL */
-        return s->control;
-
-    case 0x28:	/* AGENT_STATUS */
-        return s->status;
-    }
-
-    OMAP_BAD_REG(addr);
-    return 0;
-}
-
-static void omap_l4ta_write(void *opaque, hwaddr addr,
-                            uint64_t value, unsigned size)
-{
-    struct omap_target_agent_s *s = opaque;
-
-    if (size != 4) {
-        omap_badwidth_write32(opaque, addr, value);
-        return;
-    }
-
-    switch (addr) {
-    case 0x00:	/* COMPONENT */
-    case 0x28:	/* AGENT_STATUS */
-        OMAP_RO_REG(addr);
-        break;
-
-    case 0x20:	/* AGENT_CONTROL */
-        s->control = value & 0x01000700;
-        if (value & 1)					/* OCP_RESET */
-            s->status &= ~1;				/* REQ_TIMEOUT */
-        break;
-
-    default:
-        OMAP_BAD_REG(addr);
-    }
-}
-
-static const MemoryRegionOps omap_l4ta_ops = {
-    .read = omap_l4ta_read,
-    .write = omap_l4ta_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
-};
-
-struct omap_target_agent_s *omap_l4ta_get(struct omap_l4_s *bus,
-        const struct omap_l4_region_s *regions,
-        const struct omap_l4_agent_info_s *agents,
-        int cs)
-{
-    int i;
-    struct omap_target_agent_s *ta = NULL;
-    const struct omap_l4_agent_info_s *info = NULL;
-
-    for (i = 0; i < bus->ta_num; i ++)
-        if (agents[i].ta == cs) {
-            ta = &bus->ta[i];
-            info = &agents[i];
-            break;
-        }
-    if (!ta) {
-        fprintf(stderr, "%s: bad target agent (%i)\n", __func__, cs);
-        exit(-1);
-    }
-
-    ta->bus = bus;
-    ta->start = &regions[info->region];
-    ta->regions = info->regions;
-
-    ta->component = ('Q' << 24) | ('E' << 16) | ('M' << 8) | ('U' << 0);
-    ta->status = 0x00000000;
-    ta->control = 0x00000200;	/* XXX 01000200 for L4TAO */
-
-    memory_region_init_io(&ta->iomem, NULL, &omap_l4ta_ops, ta, "omap.l4ta",
-                          omap_l4_region_size(ta, info->ta_region));
-    omap_l4_attach(ta, info->ta_region, &ta->iomem);
-
-    return ta;
-}
-
-hwaddr omap_l4_attach(struct omap_target_agent_s *ta,
-                                         int region, MemoryRegion *mr)
-{
-    hwaddr base;
-
-    if (region < 0 || region >= ta->regions) {
-        fprintf(stderr, "%s: bad io region (%i)\n", __func__, region);
-        exit(-1);
-    }
-
-    base = ta->bus->base + ta->start[region].offset;
-    if (mr) {
-        memory_region_add_subregion(ta->bus->address_space, base, mr);
-    }
-
-    return base;
-}
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index b7e97e47cf9..a2951951b59 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -75,7 +75,6 @@ system_ss.add(when: 'CONFIG_NPCM7XX', if_true: files(
 ))
 system_ss.add(when: 'CONFIG_OMAP', if_true: files(
   'omap_clk.c',
-  'omap_l4.c',
 ))
 system_ss.add(when: 'CONFIG_RASPI', if_true: files(
   'bcm2835_mbox.c',
-- 
2.34.1


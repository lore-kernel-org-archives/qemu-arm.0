Received: by 2002:a17:504:794b:b0:1be9:327d:8ee3 with SMTP id uo11csp851973njb;
        Wed, 27 Nov 2024 07:08:59 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXP1NXj/iLRfw9lO6SVIv4x15ia/ByksGfiYxJTdy3AlycssgEiwGXnMmd+kCDkJNsmAcCnRqCw2ZqGIw==@linaro.org
X-Google-Smtp-Source: AGHT+IFqdMlBSDEskCnayExu/1oseYENxG0dDipMDLXypFwCclFjLF2BAlC7JmdrD2JKtxPzpC1t
X-Received: by 2002:a05:6358:94a9:b0:1c3:724e:f4d5 with SMTP id e5c5f4694b2df-1cab16b920bmr192663255d.26.1732720139315;
        Wed, 27 Nov 2024 07:08:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732720139; cv=none;
        d=google.com; s=arc-20240605;
        b=jQ8e4+tb2KViex3chn/ZE6X5I3WC6yoZZS/aHvJwQM9dzBx8kqtOKcXAoVYcCyo3MP
         y8+Pr9Jjl6bv4WPzoVhzWrubujJD90FcbHlyeaaibs0mDa+DyFp5Xg0YbaGGhUsJ4BRL
         wL9x0pGI+AtT3nwZ3BMb5Efoch+WhlovdJuANC/QA+ERXCBoEr8vB3VoyYNFY1z5QW9A
         IM/DiqK5iBLrP9pcXBFwK5LlX3nVFVFL2ByVqGjvJN1Lt9cAjMuElVgeVBxi4z14LBIb
         +YBKLheH6Wqu3IeMQw1+Lzkf4n7wTlNiZLVsBd3nK9QM4wQZbem0aHx4mOpKTyXtSqQN
         GIGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=eD7MJs3r84SBzX4ObGFcoh1sx/E1Dk/XLpA94N0Z7Bk=;
        fh=u3qriGeHvyJwqO4xG+KfGMvPlJQxjAMT/MhcFhKFWNw=;
        b=JXJrhII2BUBNZt29uFvkQh4+y57K2RwA9KQsSQC5ApPw5zIO4k1izLSA81lmM2zZ82
         EZrgb6BHOEfjS6f7WnQm3+xAW26PrqqeYANQ62sv6wjOO0UDV/umDkxCpDopVmSqGlN6
         0AnyfqY4w7Jw8ZZ3eFF6Y2hlh/4a+AAWHnJPdwXzsuehFw3/3H9EIaUUKhbIz+N36DBO
         PORRjJiV69rb4eGTuVrSHdGyKnINyfPzji2x9fiu4tLdI5Ux6eHvEiQS2EBrZl4BLlUx
         xQiICoPb1WR4IxrmFf/aBIcxGypiB3/OgQXG4hLgMTe38KmE2vRBfckP8KOtW6fdR7rJ
         Pa7g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=GR+OPAAg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4af35952424si1632462137.678.2024.11.27.07.08.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Nov 2024 07:08:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=GR+OPAAg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tGJe4-0003q7-0k; Wed, 27 Nov 2024 10:08:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tGJcn-0001xs-Cq
 for qemu-arm@nongnu.org; Wed, 27 Nov 2024 10:06:42 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tGJcj-000060-ET
 for qemu-arm@nongnu.org; Wed, 27 Nov 2024 10:06:40 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-434a8640763so14973885e9.1
 for <qemu-arm@nongnu.org>; Wed, 27 Nov 2024 07:06:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1732719996; x=1733324796;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eD7MJs3r84SBzX4ObGFcoh1sx/E1Dk/XLpA94N0Z7Bk=;
 b=GR+OPAAge+8z2ZRMljsB2WyZHXvS8l5/OLAeniLqFlo3l/sRJHLBYI6qmca4nlt3ko
 Lu1JX0edXELqVThqhAtH2RWrmRTgbkBQmOddt+baUDi2clvljAB98o0b6chn1uHuTw5i
 mavhbShWDSmQNiWA0/dccpmIZDU7p2pKkDfZDWHHtN8qUBv22A+XL4RxBCyZ6ouaEhYs
 tQPMnWnZ5mh09VzFF7ayJEDrTRY0bNY3eyplqgTPRrIQq3aX/bAFrLk7RK/kMZ0jRHMe
 os8yG0I2jPjcXhcZk3frPT/iF818kDXYgvFyiDNAqSgLFOxM6BSM5xpWx+JTqDgRDkWt
 1Xog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732719996; x=1733324796;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eD7MJs3r84SBzX4ObGFcoh1sx/E1Dk/XLpA94N0Z7Bk=;
 b=QA6qJLDFNssPG0VINEPCnfgQxpQigwkoJHTjZqJIZmX3cvSSFWhOK3hSiOIiqfaGm5
 YnTWCuN4TORVPAkX3W/FMtQ6jjk7A9QNrKR2CpKHg5+OLsINDm0FVWemCzWWl1vA5bgg
 2LLmxPExPiTKlU55xZe5O8COacmu/NGrlN5M9EOxpdoVjWYVAyzeJ6jL4BxWMAN3KaZq
 RSnHQaFeMFRwBaiolKDEdJlzT1fudTGrf/ZUKOc4Pwo4BtuH7yf1u9HY0c+6oB3e9emT
 8PKjmlyOYdCmmwyA101jZD3qZ0fA+H9498cgX8OvsrLdoKdd108d96HUV9YcrsRsX9EZ
 ExKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbZQR6HSXYc7Utm5qhzejtsKYlBb1sVzYVkPvqlTPQgeHAU+cv1llEuCqlYpu4U1T8E0BWKbCxxA==@nongnu.org
X-Gm-Message-State: AOJu0YyxrpjSb2upUnNWKSU/ewPpFby/ylWqqo8FAY8Q6qVc0dZeMtSx
 M2/AYqANPVv9WezUHo2oy8yafCRFqcqM0NMvcAsKC7Q91y30FczzIWna2wkhtw==
X-Gm-Gg: ASbGnctO2sSPlf1GqWdbn6gQRoMW65ChywTwFRT0yvNnJYNLfVWDpCoCCWOEklfxUBh
 JwNNbKaVksw0YBPvSwDHNKDT3zUpU4ddXuTGYIOYIeXDQEzVJJdLLdpSWinZda8LDYVZEYJPgUX
 2rxRXO+bpe7RoVXOhJiGLgnaI17BekoWY26fMqo8F0m3x4KjqK7pBoEB8ifLwmTalSby1AnLZtY
 MAgXd7QkE4mw6jmwr2ZqOErL+MRsjb+XMoZfctMTlb4+utVZRxr8GPq4sOZnTUlo2DXPb5m/Zyn
 UWUP0IHWEXL0V9FfCNBXlMJoxA==
X-Received: by 2002:a05:600c:4fc1:b0:434:a29d:6c71 with SMTP id
 5b1f17b1804b1-434a9df0385mr30198195e9.27.1732719987286; 
 Wed, 27 Nov 2024 07:06:27 -0800 (PST)
Received: from localhost.localdomain (h082218084190.host.wavenet.at.
 [82.218.84.190]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434aa7e256esm23339155e9.32.2024.11.27.07.06.25
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 27 Nov 2024 07:06:26 -0800 (PST)
From: Phil Dennis-Jordan <phil@philjordan.eu>
To: qemu-devel@nongnu.org
Cc: agraf@csgraf.de, phil@philjordan.eu, peter.maydell@linaro.org,
 pbonzini@redhat.com, rad@semihalf.com, quic_llindhol@quicinc.com,
 stefanha@redhat.com, mst@redhat.com, slp@redhat.com,
 richard.henderson@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 chenhuacai@kernel.org, kwolf@redhat.com, hreitz@redhat.com,
 philmd@linaro.org, shorne@gmail.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bmeng.cn@gmail.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 jcmvbkbc@gmail.com, marcandre.lureau@redhat.com, berrange@redhat.com,
 akihiko.odaki@daynix.com, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, balaton@eik.bme.hu, Alexander Graf <graf@amazon.com>
Subject: [PATCH v11 12/15] hw/vmapple/cfg: Introduce vmapple cfg region
Date: Wed, 27 Nov 2024 16:02:46 +0100
Message-Id: <20241127150249.50767-13-phil@philjordan.eu>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20241127150249.50767-1-phil@philjordan.eu>
References: <20241127150249.50767-1-phil@philjordan.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: neutral client-ip=2a00:1450:4864:20::336;
 envelope-from=phil@philjordan.eu; helo=mail-wm1-x336.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779 autolearn=no autolearn_force=no
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
X-TUID: HAtxzq4ubCfm

From: Alexander Graf <graf@amazon.com>

Instead of device tree or other more standardized means, VMApple passes
platform configuration to the first stage boot loader in a binary encoded
format that resides at a dedicated RAM region in physical address space.

This patch models this configuration space as a qdev device which we can
then map at the fixed location in the address space. That way, we can
influence and annotate all configuration fields easily.

Signed-off-by: Alexander Graf <graf@amazon.com>
Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>
Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---

v3:

 * Replaced legacy device reset method with Resettable method

v4:

 * Fixed initialisation of default values for properties
 * Dropped superfluous endianness conversions
 * Moved most header code to .c, device name #define goes in vmapple.h

v5:

 * Improved error reporting in case of string property buffer overflow.

v7:

 * Changed error messages for overrun of properties with
   fixed-length strings to be more useful to users than developers.

v8:

 * Consistent parenthesising of macro arguments for better safety.

v10:

 * Slightly tidier error reporting for overlong property values.

 hw/vmapple/Kconfig           |   3 +
 hw/vmapple/cfg.c             | 196 +++++++++++++++++++++++++++++++++++
 hw/vmapple/meson.build       |   1 +
 include/hw/vmapple/vmapple.h |   2 +
 4 files changed, 202 insertions(+)
 create mode 100644 hw/vmapple/cfg.c

diff --git a/hw/vmapple/Kconfig b/hw/vmapple/Kconfig
index 68f88876eb9..8bbeb9a9237 100644
--- a/hw/vmapple/Kconfig
+++ b/hw/vmapple/Kconfig
@@ -4,3 +4,6 @@ config VMAPPLE_AES
 config VMAPPLE_BDIF
     bool
 
+config VMAPPLE_CFG
+    bool
+
diff --git a/hw/vmapple/cfg.c b/hw/vmapple/cfg.c
new file mode 100644
index 00000000000..d854b49269b
--- /dev/null
+++ b/hw/vmapple/cfg.c
@@ -0,0 +1,196 @@
+/*
+ * VMApple Configuration Region
+ *
+ * Copyright © 2023 Amazon.com, Inc. or its affiliates. All Rights Reserved.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/vmapple/vmapple.h"
+#include "hw/sysbus.h"
+#include "qemu/log.h"
+#include "qemu/module.h"
+#include "qapi/error.h"
+#include "net/net.h"
+
+OBJECT_DECLARE_SIMPLE_TYPE(VMAppleCfgState, VMAPPLE_CFG)
+
+#define VMAPPLE_CFG_SIZE 0x00010000
+
+typedef struct VMAppleCfg {
+    uint32_t version;         /* 0x000 */
+    uint32_t nr_cpus;         /* 0x004 */
+    uint32_t unk1;            /* 0x008 */
+    uint32_t unk2;            /* 0x00c */
+    uint32_t unk3;            /* 0x010 */
+    uint32_t unk4;            /* 0x014 */
+    uint64_t ecid;            /* 0x018 */
+    uint64_t ram_size;        /* 0x020 */
+    uint32_t run_installer1;  /* 0x028 */
+    uint32_t unk5;            /* 0x02c */
+    uint32_t unk6;            /* 0x030 */
+    uint32_t run_installer2;  /* 0x034 */
+    uint32_t rnd;             /* 0x038 */
+    uint32_t unk7;            /* 0x03c */
+    MACAddr mac_en0;          /* 0x040 */
+    uint8_t pad1[2];
+    MACAddr mac_en1;          /* 0x048 */
+    uint8_t pad2[2];
+    MACAddr mac_wifi0;        /* 0x050 */
+    uint8_t pad3[2];
+    MACAddr mac_bt0;          /* 0x058 */
+    uint8_t pad4[2];
+    uint8_t reserved[0xa0];   /* 0x060 */
+    uint32_t cpu_ids[0x80];   /* 0x100 */
+    uint8_t scratch[0x200];   /* 0x180 */
+    char serial[32];          /* 0x380 */
+    char unk8[32];            /* 0x3a0 */
+    char model[32];           /* 0x3c0 */
+    uint8_t unk9[32];         /* 0x3e0 */
+    uint32_t unk10;           /* 0x400 */
+    char soc_name[32];        /* 0x404 */
+} VMAppleCfg;
+
+struct VMAppleCfgState {
+    SysBusDevice parent_obj;
+    VMAppleCfg cfg;
+
+    MemoryRegion mem;
+    char *serial;
+    char *model;
+    char *soc_name;
+};
+
+static void vmapple_cfg_reset(Object *obj, ResetType type)
+{
+    VMAppleCfgState *s = VMAPPLE_CFG(obj);
+    VMAppleCfg *cfg;
+
+    cfg = memory_region_get_ram_ptr(&s->mem);
+    memset(cfg, 0, VMAPPLE_CFG_SIZE);
+    *cfg = s->cfg;
+}
+
+static bool set_fixlen_property_or_error(char *restrict dst,
+                                         const char *restrict src,
+                                         size_t dst_size, Error **errp,
+                                         const char *property_name)
+{
+    ERRP_GUARD();
+    size_t len;
+
+    len = g_strlcpy(dst, src, dst_size);
+    if (len < dst_size) { /* len does not count nul terminator */
+        return true;
+    }
+
+    error_setg(errp, "Provided value too long for property '%s'", property_name);
+    error_append_hint(errp, "length (%zu) exceeds maximum of %zu\n",
+                      len, dst_size - 1);
+    return false;
+}
+
+#define set_fixlen_property_or_return(dst_array, src, errp, property_name) \
+    do { \
+        if (!set_fixlen_property_or_error((dst_array), (src), \
+                                          ARRAY_SIZE(dst_array), \
+                                          (errp), (property_name))) { \
+            return; \
+        } \
+    } while (0)
+
+static void vmapple_cfg_realize(DeviceState *dev, Error **errp)
+{
+    VMAppleCfgState *s = VMAPPLE_CFG(dev);
+    uint32_t i;
+
+    if (!s->serial) {
+        s->serial = g_strdup("1234");
+    }
+    if (!s->model) {
+        s->model = g_strdup("VM0001");
+    }
+    if (!s->soc_name) {
+        s->soc_name = g_strdup("Apple M1 (Virtual)");
+    }
+
+    set_fixlen_property_or_return(s->cfg.serial, s->serial, errp, "serial");
+    set_fixlen_property_or_return(s->cfg.model, s->model, errp, "model");
+    set_fixlen_property_or_return(s->cfg.soc_name, s->soc_name, errp, "soc_name");
+    set_fixlen_property_or_return(s->cfg.unk8, "D/A", errp, "unk8");
+    s->cfg.version = 2;
+    s->cfg.unk1 = 1;
+    s->cfg.unk2 = 1;
+    s->cfg.unk3 = 0x20;
+    s->cfg.unk4 = 0;
+    s->cfg.unk5 = 1;
+    s->cfg.unk6 = 1;
+    s->cfg.unk7 = 0;
+    s->cfg.unk10 = 1;
+
+    if (s->cfg.nr_cpus > ARRAY_SIZE(s->cfg.cpu_ids)) {
+        error_setg(errp,
+                   "Failed to create %u CPUs, vmapple machine supports %zu max",
+                   s->cfg.nr_cpus, ARRAY_SIZE(s->cfg.cpu_ids));
+        return;
+    }
+    for (i = 0; i < s->cfg.nr_cpus; i++) {
+        s->cfg.cpu_ids[i] = i;
+    }
+}
+
+static void vmapple_cfg_init(Object *obj)
+{
+    VMAppleCfgState *s = VMAPPLE_CFG(obj);
+
+    memory_region_init_ram(&s->mem, obj, "VMApple Config", VMAPPLE_CFG_SIZE,
+                           &error_fatal);
+    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mem);
+}
+
+static Property vmapple_cfg_properties[] = {
+    DEFINE_PROP_UINT32("nr-cpus", VMAppleCfgState, cfg.nr_cpus, 1),
+    DEFINE_PROP_UINT64("ecid", VMAppleCfgState, cfg.ecid, 0),
+    DEFINE_PROP_UINT64("ram-size", VMAppleCfgState, cfg.ram_size, 0),
+    DEFINE_PROP_UINT32("run_installer1", VMAppleCfgState, cfg.run_installer1, 0),
+    DEFINE_PROP_UINT32("run_installer2", VMAppleCfgState, cfg.run_installer2, 0),
+    DEFINE_PROP_UINT32("rnd", VMAppleCfgState, cfg.rnd, 0),
+    DEFINE_PROP_MACADDR("mac-en0", VMAppleCfgState, cfg.mac_en0),
+    DEFINE_PROP_MACADDR("mac-en1", VMAppleCfgState, cfg.mac_en1),
+    DEFINE_PROP_MACADDR("mac-wifi0", VMAppleCfgState, cfg.mac_wifi0),
+    DEFINE_PROP_MACADDR("mac-bt0", VMAppleCfgState, cfg.mac_bt0),
+    DEFINE_PROP_STRING("serial", VMAppleCfgState, serial),
+    DEFINE_PROP_STRING("model", VMAppleCfgState, model),
+    DEFINE_PROP_STRING("soc_name", VMAppleCfgState, soc_name),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void vmapple_cfg_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
+
+    dc->realize = vmapple_cfg_realize;
+    dc->desc = "VMApple Configuration Region";
+    device_class_set_props(dc, vmapple_cfg_properties);
+    rc->phases.hold = vmapple_cfg_reset;
+}
+
+static const TypeInfo vmapple_cfg_info = {
+    .name          = TYPE_VMAPPLE_CFG,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(VMAppleCfgState),
+    .instance_init = vmapple_cfg_init,
+    .class_init    = vmapple_cfg_class_init,
+};
+
+static void vmapple_cfg_register_types(void)
+{
+    type_register_static(&vmapple_cfg_info);
+}
+
+type_init(vmapple_cfg_register_types)
diff --git a/hw/vmapple/meson.build b/hw/vmapple/meson.build
index d4624713deb..64b78693a31 100644
--- a/hw/vmapple/meson.build
+++ b/hw/vmapple/meson.build
@@ -1,2 +1,3 @@
 system_ss.add(when: 'CONFIG_VMAPPLE_AES',  if_true: files('aes.c'))
 system_ss.add(when: 'CONFIG_VMAPPLE_BDIF', if_true: files('bdif.c'))
+system_ss.add(when: 'CONFIG_VMAPPLE_CFG',  if_true: files('cfg.c'))
diff --git a/include/hw/vmapple/vmapple.h b/include/hw/vmapple/vmapple.h
index 9090e9c5ac8..3bba59f5ec7 100644
--- a/include/hw/vmapple/vmapple.h
+++ b/include/hw/vmapple/vmapple.h
@@ -16,4 +16,6 @@
 
 #define TYPE_VMAPPLE_BDIF "vmapple-bdif"
 
+#define TYPE_VMAPPLE_CFG "vmapple-cfg"
+
 #endif /* HW_VMAPPLE_VMAPPLE_H */
-- 
2.39.5 (Apple Git-154)


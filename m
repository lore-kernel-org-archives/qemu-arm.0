Received: by 2002:a17:504:5682:b0:1be9:327d:8ee3 with SMTP id r2csp229135njx;
        Thu, 24 Oct 2024 03:33:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX6eiR3UjMcunxjP6yuQ12g+K/7BMUdH6akiS9GtY4PnjGgwSMX7ki1UZbsz3wgWOw8Ab6/LKgQxVGsZg==@linaro.org
X-Google-Smtp-Source: AGHT+IG8glS0MCMyt/VCa1Hq8xPRH9Sp2711o8U+p5K4invBfCn1Ff6nztQGsek3SiJc+Ot/OMkX
X-Received: by 2002:a05:6902:2501:b0:e26:9b7:599d with SMTP id 3f1490d57ef6-e2f2fc11515mr1293515276.51.1729765993292;
        Thu, 24 Oct 2024 03:33:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729765993; cv=none;
        d=google.com; s=arc-20240605;
        b=hYAzdMIZB9+4OmqFSsKOu8WfLpnlWUCazNBKZ35XUGEFUgmEKh+sVs+MWg1MQCKc1U
         8AoeDLMvflDZdErV1XmaRiQ8sXwUwfbmrzM+l/AUotC1loBcjlyQnJAA2jtiKSdbOsXK
         HLw+EhLYkezX9ksQR8eJE0S07wVylwAlkWyVx0J/Eq+8mnKSPqLnPICU9vAOOYep6dMQ
         aFs9k6x+krbuQLqaI1Obgvgt2Opqyh2eYZse454Z/ZfTN4JMVpYYedOYnt3CkwR2fria
         mv9iLU7ZwlsfYfkU8r/fT9AScwASpxzsTLPyAG9Siuly9biyQKrFYmtpQ8eQ4AkNQkPZ
         NNVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=0nReO9r9RrbUk1hvaDfJ9iU/fN5yRbIfPdkL/UxhNLg=;
        fh=dkYSO3MRNTur3fALaPSWjjVnezdVdfzCd2CEi6U3me0=;
        b=aTPfVzfRNtu+yf6B0B794Az6tSAhBYLSFF6d4Dmao7PkM/AiN1KDlL5iSzklDm3cD3
         NMsmqhdFzbOFR3nKiq5E9F/viHqLAHie/LqD7ZxBpsC9d9RyRG6M3Uqo7iq/jIbGPYTm
         zbEDoee6790nZM+4NN1DGc8b6cFNJmMNbhJ2iqD93qhCO9e9sl/xsfYlM/7A/Cbvf/qn
         u/BLy8XahUtohhpzGYWAmG/uf+dCZ8r0F12e63iim2ds7OU7CgojIQv45JiZUjrCHIEw
         AbAkSdyOIbjSqo8zeiErXVWiSEpKjC0rjO+k46m8wL85z09IR3HE7BB4LSlt5TQnr9yn
         CM0g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=Xlt5OIUr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-460d3d5abf0si106883351cf.563.2024.10.24.03.33.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 24 Oct 2024 03:33:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=Xlt5OIUr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t3v5O-00017f-S5; Thu, 24 Oct 2024 06:28:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1t3v5M-000148-2e
 for qemu-arm@nongnu.org; Thu, 24 Oct 2024 06:28:56 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1t3v5J-0008IY-EU
 for qemu-arm@nongnu.org; Thu, 24 Oct 2024 06:28:55 -0400
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a9acafdb745so153083466b.0
 for <qemu-arm@nongnu.org>; Thu, 24 Oct 2024 03:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1729765732; x=1730370532;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0nReO9r9RrbUk1hvaDfJ9iU/fN5yRbIfPdkL/UxhNLg=;
 b=Xlt5OIUrLFQbm13tXIROyivFsqYkH7W4bNZS8Vr3o+bNSBFJC1CKJw0j7G+3eTDMqD
 WeXgzEM4dpPjXAjyzwmxcI50bDsEhfqO8c6hodaiTCLGU/0qv0EuHzXcebElysEq03LE
 ANFukznq35YS3cVcu2jUHBiwfxjXeGyIdxabOIkk/+kO3TUXJUf0+jjMTZtVmDzs9Srn
 U/Wn517umiV4vldFcC1w2H5IY+QeUat3FMy7De+c7V1a2sS/BxzSYUhRh9ufb6SVblst
 4HvAQfimFOl0oBVJ3UC7/KKPNEArDAgSyTVUlFJOUXinGPVPsUx2qkOaVqODR8/G8t7p
 J/aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729765732; x=1730370532;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0nReO9r9RrbUk1hvaDfJ9iU/fN5yRbIfPdkL/UxhNLg=;
 b=pSSvO5QCJFwbPM2bGG1bHQdh4D65+61HlahFzTtP6tgoQ+M9WcI9peBL4QygTsZyAh
 quJZGO/lj24C9KSiNxwep2qKLR9BQ2chboGXtzdKD/8HdlQufFYiWNGkCUv6ipCm2U9p
 y+At98jBdP2Ocxic0ht48rcavnuJf8AfIijJS2hIgPj6VrK1zq/TQkBNrnvQthPxK2LZ
 Fv2gq5vE7XyEDC+SLBeNRrx0PscnTW380DhqBIPy+ZF+ZzIV/J+kC6AnobentoPRDFnJ
 fPsxrGAU0F5bLKv6hHSziJ/J2RbKx0RZL1rLAba52jH8XhbbYB+E5/3REgzqusR7CCK6
 exEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+vLzMyW36/9x2ZDAGTvc4CP62yjI+w/e2Z8Xo6oDZibZizmwMJsg1HAgBFmVFG+cCrqEcbi69Hg==@nongnu.org
X-Gm-Message-State: AOJu0YxWXIgXoL4R51snJSkqoYrVF5QbiQogHaC6J3I0AbWs5saMPcjC
 877Uj0GzPXN9gFuZIaD4FvsdQHRp35cXy3oLddIy507O3GrIwvQaFpWEc+REHg==
X-Received: by 2002:a17:907:7f0e:b0:a9a:cf0:8fd4 with SMTP id
 a640c23a62f3a-a9ad19d4c3dmr168980766b.18.1729765731784; 
 Thu, 24 Oct 2024 03:28:51 -0700 (PDT)
Received: from localhost.localdomain (h082218084190.host.wavenet.at.
 [82.218.84.190]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a913706d3sm601019066b.134.2024.10.24.03.28.49
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 24 Oct 2024 03:28:51 -0700 (PDT)
From: Phil Dennis-Jordan <phil@philjordan.eu>
To: qemu-devel@nongnu.org
Cc: agraf@csgraf.de, phil@philjordan.eu, peter.maydell@linaro.org,
 pbonzini@redhat.com, rad@semihalf.com, quic_llindhol@quicinc.com,
 marcin.juszkiewicz@linaro.org, stefanha@redhat.com, mst@redhat.com,
 slp@redhat.com, richard.henderson@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 chenhuacai@kernel.org, kwolf@redhat.com, hreitz@redhat.com,
 philmd@linaro.org, shorne@gmail.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bmeng.cn@gmail.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 jcmvbkbc@gmail.com, marcandre.lureau@redhat.com, berrange@redhat.com,
 akihiko.odaki@daynix.com, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, Alexander Graf <graf@amazon.com>
Subject: [PATCH v4 12/15] hw/vmapple/cfg: Introduce vmapple cfg region
Date: Thu, 24 Oct 2024 12:28:10 +0200
Message-Id: <20241024102813.9855-13-phil@philjordan.eu>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <20241024102813.9855-1-phil@philjordan.eu>
References: <20241024102813.9855-1-phil@philjordan.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: neutral client-ip=2a00:1450:4864:20::62e;
 envelope-from=phil@philjordan.eu; helo=mail-ej1-x62e.google.com
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
X-TUID: KOnyAsY7oMxn

From: Alexander Graf <graf@amazon.com>

Instead of device tree or other more standardized means, VMApple passes
platform configuration to the first stage boot loader in a binary encoded
format that resides at a dedicated RAM region in physical address space.

This patch models this configuration space as a qdev device which we can
then map at the fixed location in the address space. That way, we can
influence and annotate all configuration fields easily.

Signed-off-by: Alexander Graf <graf@amazon.com>
Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>
---
v3:

 * Replaced legacy device reset method with Resettable method

v4:

 * Fixed initialisation of default values for properties
 * Dropped superfluous endianness conversions
 * Moved most header code to .c, device name #define goes in vmapple.h

 hw/vmapple/Kconfig           |   3 +
 hw/vmapple/cfg.c             | 197 +++++++++++++++++++++++++++++++++++
 hw/vmapple/meson.build       |   1 +
 include/hw/vmapple/vmapple.h |   2 +
 4 files changed, 203 insertions(+)
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
index 00000000000..aeb76ba363c
--- /dev/null
+++ b/hw/vmapple/cfg.c
@@ -0,0 +1,197 @@
+/*
+ * VMApple Configuration Region
+ *
+ * Copyright © 2023 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
+    memset((void *)cfg, 0, VMAPPLE_CFG_SIZE);
+    *cfg = s->cfg;
+}
+
+static bool strlcpy_set_error(char *restrict dst, const char *restrict src,
+                              size_t dst_size, Error **errp,
+                              const char *parent_func, const char *location,
+                              const char *buffer_name)
+{
+    size_t len;
+
+    len = g_strlcpy(dst, src, dst_size);
+    if (len < dst_size) { /* len does not count nul terminator */
+        return true;
+    }
+
+    error_setg(errp,
+               "strlcpy_set_error: %s (%s): Destination buffer %s too small "
+               "(need %zu, have %zu)",
+               parent_func, location, buffer_name, len + 1, dst_size);
+    return false;
+}
+
+/*
+ * String copying wrapper that returns and reports a runtime error in
+ * case of truncation due to insufficient destination buffer space.
+ */
+#define strlcpy_array_return_error(dst_array, src, errp) \
+    do { \
+        if (!strlcpy_set_error((dst_array), (src), ARRAY_SIZE(dst_array), (errp),\
+                               __func__, stringify(__LINE__), # dst_array)) { \
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
+    strlcpy_array_return_error(s->cfg.serial, s->serial, errp);
+    strlcpy_array_return_error(s->cfg.model, s->model, errp);
+    strlcpy_array_return_error(s->cfg.soc_name, s->soc_name, errp);
+    strlcpy_array_return_error(s->cfg.unk8, "D/A", errp);
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
index a4c87b166d5..984281b6a67 100644
--- a/include/hw/vmapple/vmapple.h
+++ b/include/hw/vmapple/vmapple.h
@@ -12,4 +12,6 @@
 
 #define TYPE_VMAPPLE_BDIF "vmapple-bdif"
 
+#define TYPE_VMAPPLE_CFG "vmapple-cfg"
+
 #endif /* HW_VMAPPLE_VMAPPLE_H */
-- 
2.39.3 (Apple Git-145)


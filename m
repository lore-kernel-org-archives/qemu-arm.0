Received: by 2002:a17:906:b794:b0:9b6:5cec:e61e with SMTP id dt20csp19092ejb;
        Wed, 18 Oct 2023 11:13:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFR3rRKEd1HxjIdabr89fh/mJXBx9T8fwAmkTO+aRzXyB1BG7P1d8uneByniL6foxtXdgjE
X-Received: by 2002:a05:620a:219b:b0:774:2113:7432 with SMTP id g27-20020a05620a219b00b0077421137432mr5615930qka.67.1697652789957;
        Wed, 18 Oct 2023 11:13:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697652789; cv=none;
        d=google.com; s=arc-20160816;
        b=F+NYE+Xz97dxTNWyCv/lOGr/rWbHglLdmrxfDQGqA3x1DlPrl7Df740RpQrmzj+VmK
         3H5a50d725JOKFY3ayXY1F91LUPDGaSZBPvkIX7K3Ah0En2Cj7qm/58xVfIpmmU9j3c4
         j+lx6DqzuLnZlpupUEFXSMIICmK36xnpQ+c9fwhPlFXMl5EjY8qxMfngesCd4X0DRIct
         eTaIYJmG7NQ6YtUa3BDZEu6yMi7PyNvG4VE7jZpYqpgy91NsD04r9ycW8aXeJA1cQObQ
         X5At/MdCFmtXB5rkl6LsOOocSJ7fbnBQY+J9HMtujspqEHCNbdBqho5MTqKXcDjQ1AGC
         RE2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=9IwQhgzY/4WB0G514bYmvy7511PySa+MNsIIEJuBgmc=;
        fh=8TcdNm2PUOSTOLTAPwKw1HRZgze8qTDV0WK6iGCckjQ=;
        b=Z+sGgmX5jC5PqUniloaAJYuSTa6Aj45FOly13Q+K+vh3MRLYAo6RF/4Q+zQTFN0cZG
         uAGnH/vYOdOL9Bv+poY1HcoaqDRWLOXCIXcrmLO1Q2POAxdO6MzwVTcUfelu1lYyr+st
         zwHobCmF6pusHx7hSPF7phpa7xk6JXFTimDXlqFFD8YHqJ3C1atJXvIkZHJ1m2iiQOKZ
         njXxsSOcwz9AvZQJkRNL8+9Be8ME489YxQMMIr0TWwJY5h/HC790W/4opXqn5oKNuSeW
         CuiPM0eoFybGLXRmZN1lbBrKZ9XRuLfTriRBdEmf2Esj+lmcaOVipazP5+e5Fj0Z7fA2
         arwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=HxT4B5SJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s11-20020a05620a254b00b0076ef0378208si344378qko.731.2023.10.18.11.13.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Oct 2023 11:13:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=HxT4B5SJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtB1e-0006Zg-TF; Wed, 18 Oct 2023 14:12:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <39R8wZQwKCCYPCDKJGUVGHCPIQQING.EQOSGOW-CTOPQPIPW.QTI@flex--nabihestefan.bounces.google.com>)
 id 1qtB1d-0006VR-Fn
 for qemu-arm@nongnu.org; Wed, 18 Oct 2023 14:12:09 -0400
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <39R8wZQwKCCYPCDKJGUVGHCPIQQING.EQOSGOW-CTOPQPIPW.QTI@flex--nabihestefan.bounces.google.com>)
 id 1qtB1a-0008Ae-Lz
 for qemu-arm@nongnu.org; Wed, 18 Oct 2023 14:12:09 -0400
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-5a7b9e83b70so54764417b3.0
 for <qemu-arm@nongnu.org>; Wed, 18 Oct 2023 11:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1697652725; x=1698257525; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=9IwQhgzY/4WB0G514bYmvy7511PySa+MNsIIEJuBgmc=;
 b=HxT4B5SJvPKiqnZkDU52lZW3j207qIAzTtTi4ijlSJdWnS7AoLAOi5N3NoZNG1uk7r
 rCNATGD85pjrj9ihu5zN+UuF9YbvExFN2YUToAv9MvI97Bybl/oza4t13BURRJ2f8oaH
 0ScfRZd0GXHt+qlM/Cu9sqXOvFWknUmlK3Yml9N9SIVE6SDaLWIG23YgBI80C8s4opBz
 +3C59PFZmON4KkYLZNjqg9JCsgjK3s9GvQ6HhFcIqNWTuCFHbCLhhvIXTd8MMlgBzQmg
 nWuSFFyHOujtSh6BUucgrvGzttVTYBilFYiCvlLHvI6bxHZMj5lTpX0SnMuI4SZOhXQ6
 lTTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697652725; x=1698257525;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9IwQhgzY/4WB0G514bYmvy7511PySa+MNsIIEJuBgmc=;
 b=nCPFz7Xo+401puaS9ARyrL431QxqXlE/mfy4FTDkgj+6i27gYWG91xt6SypVc3q0FO
 7boZTtyG0eXWefDTPQlx0+qZnBBLjzXwC7qz/vOToUhw3WoEgCKwHbyT8ZPqfW7T+mp+
 uZkzPj9DD65IHILrQXfwCqj2XQ8vWaYfwhJ/FlWyAX9p+OByodViRQ8QzA6zSwP7T+eU
 Wannnzx1MAkui9PGEAfMcQTYEJt3XmbM7hn3cIqsvgiMbLifUBQeMkB2uan8aImCTTKD
 6gG0RKFc8jx/Ix8W4hAAdcDnGCNWI+ka47eM2ofNDPOm6+fXjU6wIcbaejttSVTiMOpT
 a65Q==
X-Gm-Message-State: AOJu0Yxc0kOsfm8aXYbTDI7kI0yHblgzRELRn4RBD0EvgpgtvcZOWZKv
 0FZ0y5bP/r4YtJvvE9zd63PtO0HmWDXJPROOeEk=
X-Received: from nabihestefan.c.googlers.com
 ([fda3:e722:ac3:cc00:20:ed76:c0a8:2737])
 (user=nabihestefan job=sendgmr) by 2002:a81:a192:0:b0:59b:e663:23b0 with SMTP
 id y140-20020a81a192000000b0059be66323b0mr3809ywg.4.1697652725654; Wed, 18
 Oct 2023 11:12:05 -0700 (PDT)
Date: Wed, 18 Oct 2023 18:11:47 +0000
In-Reply-To: <20231018181152.745496-1-nabihestefan@google.com>
Mime-Version: 1.0
References: <20231018181152.745496-1-nabihestefan@google.com>
X-Mailer: git-send-email 2.42.0.655.g421f12c284-goog
Message-ID: <20231018181152.745496-7-nabihestefan@google.com>
Subject: [PATCH 06/11] tests/qtest: Creating qtest for GMAC Module
From: Nabih Estefan <nabihestefan@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 wuhaotsh@google.com, jasonwang@redhat.com, avi.fishman@nuvoton.com, 
 nabihestefan@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::114a;
 envelope-from=39R8wZQwKCCYPCDKJGUVGHCPIQQING.EQOSGOW-CTOPQPIPW.QTI@flex--nabihestefan.bounces.google.com;
 helo=mail-yw1-x114a.google.com
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
X-TUID: wthFlJGnXZy1

From: Nabih Estefan Diaz <nabihestefan@google.com>

 - Created qtest to check initialization of registers in GMAC Module.
 - Implemented test into Build File.

Signed-off-by: Nabih Estefan Diaz <nabihestefan@google.com>
---
 tests/qtest/meson.build      |   7 +-
 tests/qtest/npcm_gmac-test.c | 209 +++++++++++++++++++++++++++++++++++
 2 files changed, 211 insertions(+), 5 deletions(-)
 create mode 100644 tests/qtest/npcm_gmac-test.c

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 05d26e9292..7ed68520f4 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -205,9 +205,6 @@ qtests_arm = \
   (config_all_devices.has_key('CONFIG_ASPEED_SOC') ? qtests_aspeed : []) + \
   (config_all_devices.has_key('CONFIG_NPCM7XX') ? qtests_npcm7xx : []) + \
   (config_all_devices.has_key('CONFIG_GENERIC_LOADER') ? ['hexloader-test'] : []) + \
-  (config_all_devices.has_key('CONFIG_TPM_TIS_I2C') ? ['tpm-tis-i2c-test'] : []) + \
-  (config_all_devices.has_key('CONFIG_VEXPRESS') ? ['test-arm-mptimer'] : []) + \
-  (config_all_devices.has_key('CONFIG_MICROBIT') ? ['microbit-test'] : []) + \
   ['arm-cpu-features',
    'boot-serial-test']
 
@@ -219,8 +216,8 @@ qtests_aarch64 = \
   (config_all_devices.has_key('CONFIG_XLNX_ZYNQMP_ARM') ? ['xlnx-can-test', 'fuzz-xlnx-dp-test'] : []) + \
   (config_all_devices.has_key('CONFIG_XLNX_VERSAL') ? ['xlnx-canfd-test'] : []) + \
   (config_all_devices.has_key('CONFIG_RASPI') ? ['bcm2835-dma-test'] : []) +  \
-  (config_all.has_key('CONFIG_TCG') and                                            \
-   config_all_devices.has_key('CONFIG_TPM_TIS_I2C') ? ['tpm-tis-i2c-test'] : []) + \
+  (config_all_devices.has_key('CONFIG_ASPEED_SOC') ? qtests_aspeed : []) + \
+  (config_all_devices.has_key('CONFIG_NPCM7XX') ? qtests_npcm7xx : []) + \
   ['arm-cpu-features',
    'numa-test',
    'boot-serial-test',
diff --git a/tests/qtest/npcm_gmac-test.c b/tests/qtest/npcm_gmac-test.c
new file mode 100644
index 0000000000..77a83c4c58
--- /dev/null
+++ b/tests/qtest/npcm_gmac-test.c
@@ -0,0 +1,209 @@
+/*
+ * QTests for Nuvoton NPCM7xx/8xx GMAC Modules.
+ *
+ * Copyright 2023 Google LLC
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License as published by the
+ * Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
+ * for more details.
+ */
+
+#include "qemu/osdep.h"
+#include "libqos/libqos.h"
+
+/* Name of the GMAC Device */
+#define TYPE_NPCM_GMAC "npcm-gmac"
+
+typedef struct GMACModule {
+    int irq;
+    uint64_t base_addr;
+} GMACModule;
+
+typedef struct TestData {
+    const GMACModule *module;
+} TestData;
+
+/* Values extracted from hw/arm/npcm8xx.c */
+static const GMACModule gmac_module_list[] = {
+    {
+        .irq        = 14,
+        .base_addr  = 0xf0802000
+    },
+    {
+        .irq        = 15,
+        .base_addr  = 0xf0804000
+    },
+    {
+        .irq        = 16,
+        .base_addr  = 0xf0806000
+    },
+    {
+        .irq        = 17,
+        .base_addr  = 0xf0808000
+    }
+};
+
+/* Returns the index of the GMAC module. */
+static int gmac_module_index(const GMACModule *mod)
+{
+    ptrdiff_t diff = mod - gmac_module_list;
+
+    g_assert_true(diff >= 0 && diff < ARRAY_SIZE(gmac_module_list));
+
+    return diff;
+}
+
+/* 32-bit register indices. Taken from npcm_gmac.c */
+typedef enum NPCMRegister {
+    /* DMA Registers */
+    NPCM_DMA_BUS_MODE = 0x1000,
+    NPCM_DMA_XMT_POLL_DEMAND = 0x1004,
+    NPCM_DMA_RCV_POLL_DEMAND = 0x1008,
+    NPCM_DMA_RCV_BASE_ADDR = 0x100c,
+    NPCM_DMA_TX_BASE_ADDR = 0x1010,
+    NPCM_DMA_STATUS = 0x1014,
+    NPCM_DMA_CONTROL = 0x1018,
+    NPCM_DMA_INTR_ENA = 0x101c,
+    NPCM_DMA_MISSED_FRAME_CTR = 0x1020,
+    NPCM_DMA_HOST_TX_DESC = 0x1048,
+    NPCM_DMA_HOST_RX_DESC = 0x104c,
+    NPCM_DMA_CUR_TX_BUF_ADDR = 0x1050,
+    NPCM_DMA_CUR_RX_BUF_ADDR = 0x1054,
+    NPCM_DMA_HW_FEATURE = 0x1058,
+
+    /* GMAC Registers */
+    NPCM_GMAC_MAC_CONFIG = 0x0,
+    NPCM_GMAC_FRAME_FILTER = 0x4,
+    NPCM_GMAC_HASH_HIGH = 0x8,
+    NPCM_GMAC_HASH_LOW = 0xc,
+    NPCM_GMAC_MII_ADDR = 0x10,
+    NPCM_GMAC_MII_DATA = 0x14,
+    NPCM_GMAC_FLOW_CTRL = 0x18,
+    NPCM_GMAC_VLAN_FLAG = 0x1c,
+    NPCM_GMAC_VERSION = 0x20,
+    NPCM_GMAC_WAKEUP_FILTER = 0x28,
+    NPCM_GMAC_PMT = 0x2c,
+    NPCM_GMAC_LPI_CTRL = 0x30,
+    NPCM_GMAC_TIMER_CTRL = 0x34,
+    NPCM_GMAC_INT_STATUS = 0x38,
+    NPCM_GMAC_INT_MASK = 0x3c,
+    NPCM_GMAC_MAC0_ADDR_HI = 0x40,
+    NPCM_GMAC_MAC0_ADDR_LO = 0x44,
+    NPCM_GMAC_MAC1_ADDR_HI = 0x48,
+    NPCM_GMAC_MAC1_ADDR_LO = 0x4c,
+    NPCM_GMAC_MAC2_ADDR_HI = 0x50,
+    NPCM_GMAC_MAC2_ADDR_LO = 0x54,
+    NPCM_GMAC_MAC3_ADDR_HI = 0x58,
+    NPCM_GMAC_MAC3_ADDR_LO = 0x5c,
+    NPCM_GMAC_RGMII_STATUS = 0xd8,
+    NPCM_GMAC_WATCHDOG = 0xdc,
+    NPCM_GMAC_PTP_TCR = 0x700,
+    NPCM_GMAC_PTP_SSIR = 0x704,
+    NPCM_GMAC_PTP_STSR = 0x708,
+    NPCM_GMAC_PTP_STNSR = 0x70c,
+    NPCM_GMAC_PTP_STSUR = 0x710,
+    NPCM_GMAC_PTP_STNSUR = 0x714,
+    NPCM_GMAC_PTP_TAR = 0x718,
+    NPCM_GMAC_PTP_TTSR = 0x71c,
+} NPCMRegister;
+
+static uint32_t gmac_read(QTestState *qts, const GMACModule *mod,
+                          NPCMRegister regno)
+{
+    return qtest_readl(qts, mod->base_addr + regno);
+}
+
+/* Check that GMAC registers are reset to default value */
+static void test_init(gconstpointer test_data)
+{
+    const TestData *td = test_data;
+    const GMACModule *mod = td->module;
+    QTestState *qts = qtest_init("-machine npcm845-evb");
+
+#define CHECK_REG32(regno, value) \
+    do { \
+        g_assert_cmphex(gmac_read(qts, mod, (regno)), ==, (value)); \
+    } while (0)
+
+    CHECK_REG32(NPCM_DMA_BUS_MODE, 0x00020100);
+    CHECK_REG32(NPCM_DMA_XMT_POLL_DEMAND, 0);
+    CHECK_REG32(NPCM_DMA_RCV_POLL_DEMAND, 0);
+    CHECK_REG32(NPCM_DMA_RCV_BASE_ADDR, 0);
+    CHECK_REG32(NPCM_DMA_TX_BASE_ADDR, 0);
+    CHECK_REG32(NPCM_DMA_STATUS, 0);
+    CHECK_REG32(NPCM_DMA_CONTROL, 0);
+    CHECK_REG32(NPCM_DMA_INTR_ENA, 0);
+    CHECK_REG32(NPCM_DMA_MISSED_FRAME_CTR, 0);
+    CHECK_REG32(NPCM_DMA_HOST_TX_DESC, 0);
+    CHECK_REG32(NPCM_DMA_HOST_RX_DESC, 0);
+    CHECK_REG32(NPCM_DMA_CUR_TX_BUF_ADDR, 0);
+    CHECK_REG32(NPCM_DMA_CUR_RX_BUF_ADDR, 0);
+    CHECK_REG32(NPCM_DMA_HW_FEATURE, 0x100d4f37);
+
+    CHECK_REG32(NPCM_GMAC_MAC_CONFIG, 0);
+    CHECK_REG32(NPCM_GMAC_FRAME_FILTER, 0);
+    CHECK_REG32(NPCM_GMAC_HASH_HIGH, 0);
+    CHECK_REG32(NPCM_GMAC_HASH_LOW, 0);
+    CHECK_REG32(NPCM_GMAC_MII_ADDR, 0);
+    CHECK_REG32(NPCM_GMAC_MII_DATA, 0);
+    CHECK_REG32(NPCM_GMAC_FLOW_CTRL, 0);
+    CHECK_REG32(NPCM_GMAC_VLAN_FLAG, 0);
+    CHECK_REG32(NPCM_GMAC_VERSION, 0x00001037);
+    CHECK_REG32(NPCM_GMAC_WAKEUP_FILTER, 0);
+    CHECK_REG32(NPCM_GMAC_PMT, 0);
+    CHECK_REG32(NPCM_GMAC_LPI_CTRL, 0);
+    CHECK_REG32(NPCM_GMAC_TIMER_CTRL, 0x03e80000);
+    CHECK_REG32(NPCM_GMAC_INT_STATUS, 0);
+    CHECK_REG32(NPCM_GMAC_INT_MASK, 0);
+    CHECK_REG32(NPCM_GMAC_MAC0_ADDR_HI, 0x8000ffff);
+    CHECK_REG32(NPCM_GMAC_MAC0_ADDR_LO, 0xffffffff);
+    CHECK_REG32(NPCM_GMAC_MAC1_ADDR_HI, 0x0000ffff);
+    CHECK_REG32(NPCM_GMAC_MAC1_ADDR_LO, 0xffffffff);
+    CHECK_REG32(NPCM_GMAC_MAC2_ADDR_HI, 0x0000ffff);
+    CHECK_REG32(NPCM_GMAC_MAC2_ADDR_LO, 0xffffffff);
+    CHECK_REG32(NPCM_GMAC_MAC3_ADDR_HI, 0x0000ffff);
+    CHECK_REG32(NPCM_GMAC_MAC3_ADDR_LO, 0xffffffff);
+    CHECK_REG32(NPCM_GMAC_RGMII_STATUS, 0);
+    CHECK_REG32(NPCM_GMAC_WATCHDOG, 0);
+    CHECK_REG32(NPCM_GMAC_PTP_TCR, 0x00002000);
+    CHECK_REG32(NPCM_GMAC_PTP_SSIR, 0);
+    CHECK_REG32(NPCM_GMAC_PTP_STSR, 0);
+    CHECK_REG32(NPCM_GMAC_PTP_STNSR, 0);
+    CHECK_REG32(NPCM_GMAC_PTP_STSUR, 0);
+    CHECK_REG32(NPCM_GMAC_PTP_STNSUR, 0);
+    CHECK_REG32(NPCM_GMAC_PTP_TAR, 0);
+    CHECK_REG32(NPCM_GMAC_PTP_TTSR, 0);
+
+    qtest_quit(qts);
+}
+
+static void gmac_add_test(const char *name, const TestData* td,
+                          GTestDataFunc fn)
+{
+    g_autofree char *full_name = g_strdup_printf(
+            "npcm7xx_gmac/gmac[%d]/%s", gmac_module_index(td->module), name);
+    qtest_add_data_func(full_name, td, fn);
+}
+
+int main(int argc, char **argv)
+{
+    TestData test_data_list[ARRAY_SIZE(gmac_module_list)];
+
+    g_test_init(&argc, &argv, NULL);
+
+    for (int i = 0; i < ARRAY_SIZE(gmac_module_list); ++i) {
+        TestData *td = &test_data_list[i];
+
+        td->module = &gmac_module_list[i];
+
+        gmac_add_test("init", td, test_init);
+    }
+
+    return g_test_run();
+}
-- 
2.42.0.655.g421f12c284-goog


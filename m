Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp1414180njn;
        Sun, 12 Jan 2025 13:03:30 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUCI8+gapuc6gvf5XQOa8Dt88ARR+GVDGKfk8sGVs0ahZaviBbgN6KLC1eJdPUrCH6vdJk0VEzhW6t+xA==@linaro.org
X-Google-Smtp-Source: AGHT+IETVglm3+ivyOF5FkatfRSNtghI9iAllaf7wyKk4ftFSjLwTwhjA8QWnTiKJ+7Sh7Zo6IuA
X-Received: by 2002:a05:6102:b06:b0:4af:adf8:523f with SMTP id ada2fe7eead31-4b3d0f97294mr14078212137.9.1736715810026;
        Sun, 12 Jan 2025 13:03:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736715810; cv=none;
        d=google.com; s=arc-20240605;
        b=GYL84vsXc6pHfZnBwlgJ6NheDVw//nAd9cN0vbY6Q9Z3BGCUgAT6FsvT4RrqbAxdtz
         NP6A8K07KDbRvAy0SDBBv503Y81izQxcqeBjykbou4ZjvbDLv3K24k12xJhgxzTe/sJ6
         wOWkXN3ZHFp5B8KqACAPbxFrmZjGI5324uGll+VcfO0n/uJUm9LbjY6pkcBmum9IjOSA
         eavS7mrxhviJV6oLqCzSQaOl/DndSen8yxJTXocdle/zGF/rzQCFt9rCEEIheE+dZLHm
         CeW+VCuyPzd+8nC17T9nBFPJTFfOiuzJL/rwMtLKAwlmux4ICgvkiIzUdHSKdaIrEF5V
         BYRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=liNdKvBpu1LtydQ4lkcdQgjVge6ofa3sK80Zzec5mL0=;
        fh=WkZc0AEIwouWZa4PFeibbrN2HcMdISMUbqgMc8+JG6o=;
        b=fkc4Dvbih7aPQl9DZnKJQkdJwm1L4/rN8vsNlEjOtzQX++Ecwt56aYeUYVDtONp2MM
         6htt9XwwIjMcYkE4e4WR/VICgSE5aWGeIRW9RwLZ09dLp+ANh5p2hdXrjetdkZNFRTNi
         lxJ5sWnIxaZo3hf0vsYh01e+HJoBLOhlH7W898DDY1JrDOcvjy0GPig40Q3FmXpLNUez
         WXlmyJZasGdfY1oUSQrAr7MP8vFcD2yFbICWHnB8VCSKFHdyBpMdWawg0k6vwrkb6i7d
         nr9qLTK/+1DwyYIGEEcxEbsTKwuVJ3DYnHaPPLaqgBbprrEitSH7UoFq9AGTBWYEUuIE
         djIA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=Q3pUa+h6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-8623b4166d1si1917043241.168.2025.01.12.13.03.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 12 Jan 2025 13:03:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=Q3pUa+h6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tX56N-0004nd-3Z; Sun, 12 Jan 2025 16:02:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tX55X-0004W4-1q
 for qemu-arm@nongnu.org; Sun, 12 Jan 2025 16:01:39 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tX55U-0006OZ-1u
 for qemu-arm@nongnu.org; Sun, 12 Jan 2025 16:01:38 -0500
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-aae81f4fdc4so726051466b.0
 for <qemu-arm@nongnu.org>; Sun, 12 Jan 2025 13:01:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1736715693; x=1737320493;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=liNdKvBpu1LtydQ4lkcdQgjVge6ofa3sK80Zzec5mL0=;
 b=Q3pUa+h6pbsa0yzKFy4uEwX10l4MQ8wAFGakkGebe4n3MzjmUrFXNy8+ymw1EhKtrb
 4EpxdlX23giawekx7fQFntqewj2c1/x7+KEmhu1ee/e26V/jHr2K1jrW2NFImTxTNgvQ
 dG8J5kEIedsQ17krUfLMZckNN3gEEWyJdGB2lZUIySecwvbCCfvFluFDF6yi0e07D+US
 UWBEHu8oPbdyWhQDYlCKlMgVR2rahmh/PUkaeo5JI0rCKw7TAs/5MvosclaosPc3g/Rl
 ATRDMBggbMpq3RDjtwq1RaZosHQzKlYojcyqbbmuSWMb8wA5Xpiqa9cLDfaaFEUyHpHN
 nx/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736715693; x=1737320493;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=liNdKvBpu1LtydQ4lkcdQgjVge6ofa3sK80Zzec5mL0=;
 b=Gxss+ONCj7ozgX8spjGKPUDel1XUPIqYv0I44fS6xLUFAyuBZUTjh1R7wML4BflmGs
 /YG9eZspyUS4Klsn2QD71+WaCa7+8Vl/CxnPrIX6ApTBke+TkxYrR2dmwl1iC6HU685F
 tDNzK9mfiI3LA/ZpojhuzHKFaRjEciVrU9OXN9Dstbs/ZuNIW7BeZLiJ6EDoRUywog/G
 8/WD9/XJp651G2P7ZPM/H+9ipLYNX20PPV1Rjasc4MHIl8w3OdubPUYAbaw72r8HdnIT
 hQdkJO6Zluos3NER/feQRYsHo/xb7eWJQvCW+Vwa3+wqRunhOfJ7avs643n3H9uT51u2
 FWYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXofF6UX/3NXoy+tGCybmMrZ+e2PylLnK+6rL3hbiRLKJ8VbA0tsygwH6xFJ+PmLqcgxfTCVpSh7A==@nongnu.org
X-Gm-Message-State: AOJu0YzaZSKUtsSCcvUkjBU1KBVNVHd7663G1npPOby5Go3vGkgsJoUE
 M4PV2f86TE5nkRRISQmgUxZ3L9IL+NYlnwezD9OikoZzi5hjCoWvbif8+N17kA==
X-Gm-Gg: ASbGnct5hPgm5jTE98CsgaYadKxXWgd2BChs4T7lsKLbb329pj6gL8qHVvXgV/d+q3Z
 gTcqmt6P7toWjpc5XLdrbPRqj6x4tBVIOBDI+V2d5xTSsKmC9d63ZywpVu0K1a128n8hlvxePqi
 GHPIdMbUoeY87l1EqtjajYaZs1m/nDa7fbYD5E7JuOSNnFenk86b96VokwqH+Wj9RwPf400RjxS
 WTwCJ5fX71cjRDqcP007cxBrjKDwK/waXIRHMPP9aj0FNDH604+D3ZeEf7GORtbjJ9HgvI39zA7
 W0X5OzJRFZkunIPWyvKWnXEcRhsPac34
X-Received: by 2002:a17:907:6090:b0:aae:eb12:3332 with SMTP id
 a640c23a62f3a-ab2ab73b688mr1630913266b.25.1736715693081; 
 Sun, 12 Jan 2025 13:01:33 -0800 (PST)
Received: from localhost.localdomain (h082218084190.host.wavenet.at.
 [82.218.84.190]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2c905e283sm418276666b.31.2025.01.12.13.01.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 12 Jan 2025 13:01:32 -0800 (PST)
From: Phil Dennis-Jordan <phil@philjordan.eu>
To: qemu-devel@nongnu.org
Cc: agraf@csgraf.de, phil@philjordan.eu, peter.maydell@linaro.org,
 pbonzini@redhat.com, mst@redhat.com, stefanha@redhat.com, kwolf@redhat.com,
 hreitz@redhat.com, berrange@redhat.com, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, marcandre.lureau@redhat.com, philmd@linaro.org,
 eblake@redhat.com, armbru@redhat.com, qemu-block@nongnu.org,
 qemu-arm@nongnu.org, Alexander Graf <graf@amazon.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v17 05/11] hw/vmapple/aes: Introduce aes engine
Date: Sun, 12 Jan 2025 22:00:50 +0100
Message-Id: <20250112210056.16658-6-phil@philjordan.eu>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250112210056.16658-1-phil@philjordan.eu>
References: <20250112210056.16658-1-phil@philjordan.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: neutral client-ip=2a00:1450:4864:20::62d;
 envelope-from=phil@philjordan.eu; helo=mail-ej1-x62d.google.com
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
X-TUID: AUwMUhAXHZ9t

From: Alexander Graf <graf@amazon.com>

VMApple contains an "aes" engine device that it uses to encrypt and
decrypt its nvram. It has trivial hard coded keys it uses for that
purpose.

Add device emulation for this device model.

Signed-off-by: Alexander Graf <graf@amazon.com>
Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>
Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Tested-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---

v3:

 * Rebased on latest upstream and fixed minor breakages.
 * Replaced legacy device reset method with Resettable method

v4:

 * Improved logging of unimplemented functions and guest errors.
 * Better adherence to naming and coding conventions.
 * Cleaner error handling and recovery, including using g_autoptr

v5:

 * More logging improvements
 * Use xxx64_overflow() functions for hexdump buffer size calculations.

v7:

 * Coding style tweaks.

v8:

 * Further improved logging of guest errors.

v9:

 * Replaced a use of cpu_physical_memory_write with dma_memory_write.
 * Dropped unnecessary use of ternary operator for bool -> 0/1.

v10:

 * Code style and comment improvements.

v16:

 * Fixed #include path breakage from recent sysemu->system path rename.

 hw/vmapple/Kconfig           |   2 +
 hw/vmapple/aes.c             | 581 +++++++++++++++++++++++++++++++++++
 hw/vmapple/meson.build       |   1 +
 hw/vmapple/trace-events      |  14 +
 include/hw/vmapple/vmapple.h |  17 +
 include/qemu/cutils.h        |  15 +
 util/hexdump.c               |  18 ++
 7 files changed, 648 insertions(+)
 create mode 100644 hw/vmapple/aes.c
 create mode 100644 include/hw/vmapple/vmapple.h

diff --git a/hw/vmapple/Kconfig b/hw/vmapple/Kconfig
index 8b13789179..a73504d599 100644
--- a/hw/vmapple/Kconfig
+++ b/hw/vmapple/Kconfig
@@ -1 +1,3 @@
+config VMAPPLE_AES
+    bool
 
diff --git a/hw/vmapple/aes.c b/hw/vmapple/aes.c
new file mode 100644
index 0000000000..3a7641ab4b
--- /dev/null
+++ b/hw/vmapple/aes.c
@@ -0,0 +1,581 @@
+/*
+ * QEMU Apple AES device emulation
+ *
+ * Copyright © 2023 Amazon.com, Inc. or its affiliates. All Rights Reserved.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "trace.h"
+#include "crypto/hash.h"
+#include "crypto/aes.h"
+#include "crypto/cipher.h"
+#include "hw/irq.h"
+#include "hw/sysbus.h"
+#include "hw/vmapple/vmapple.h"
+#include "migration/vmstate.h"
+#include "qemu/cutils.h"
+#include "qemu/log.h"
+#include "qemu/module.h"
+#include "system/dma.h"
+
+OBJECT_DECLARE_SIMPLE_TYPE(AESState, APPLE_AES)
+
+#define MAX_FIFO_SIZE     9
+
+#define CMD_KEY           0x1
+#define CMD_KEY_CONTEXT_SHIFT    27
+#define CMD_KEY_CONTEXT_MASK     (0x1 << CMD_KEY_CONTEXT_SHIFT)
+#define CMD_KEY_SELECT_MAX_IDX   0x7
+#define CMD_KEY_SELECT_SHIFT     24
+#define CMD_KEY_SELECT_MASK      (CMD_KEY_SELECT_MAX_IDX << CMD_KEY_SELECT_SHIFT)
+#define CMD_KEY_KEY_LEN_NUM      4u
+#define CMD_KEY_KEY_LEN_SHIFT    22
+#define CMD_KEY_KEY_LEN_MASK     ((CMD_KEY_KEY_LEN_NUM - 1u) << CMD_KEY_KEY_LEN_SHIFT)
+#define CMD_KEY_ENCRYPT_SHIFT    20
+#define CMD_KEY_ENCRYPT_MASK     (0x1 << CMD_KEY_ENCRYPT_SHIFT)
+#define CMD_KEY_BLOCK_MODE_SHIFT 16
+#define CMD_KEY_BLOCK_MODE_MASK  (0x3 << CMD_KEY_BLOCK_MODE_SHIFT)
+#define CMD_IV            0x2
+#define CMD_IV_CONTEXT_SHIFT     26
+#define CMD_IV_CONTEXT_MASK      (0x3 << CMD_KEY_CONTEXT_SHIFT)
+#define CMD_DSB           0x3
+#define CMD_SKG           0x4
+#define CMD_DATA          0x5
+#define CMD_DATA_KEY_CTX_SHIFT   27
+#define CMD_DATA_KEY_CTX_MASK    (0x1 << CMD_DATA_KEY_CTX_SHIFT)
+#define CMD_DATA_IV_CTX_SHIFT    25
+#define CMD_DATA_IV_CTX_MASK     (0x3 << CMD_DATA_IV_CTX_SHIFT)
+#define CMD_DATA_LEN_MASK        0xffffff
+#define CMD_STORE_IV      0x6
+#define CMD_STORE_IV_ADDR_MASK   0xffffff
+#define CMD_WRITE_REG     0x7
+#define CMD_FLAG          0x8
+#define CMD_FLAG_STOP_MASK       BIT(26)
+#define CMD_FLAG_RAISE_IRQ_MASK  BIT(27)
+#define CMD_FLAG_INFO_MASK       0xff
+#define CMD_MAX           0x10
+
+#define CMD_SHIFT         28
+
+#define REG_STATUS            0xc
+#define REG_STATUS_DMA_READ_RUNNING     BIT(0)
+#define REG_STATUS_DMA_READ_PENDING     BIT(1)
+#define REG_STATUS_DMA_WRITE_RUNNING    BIT(2)
+#define REG_STATUS_DMA_WRITE_PENDING    BIT(3)
+#define REG_STATUS_BUSY                 BIT(4)
+#define REG_STATUS_EXECUTING            BIT(5)
+#define REG_STATUS_READY                BIT(6)
+#define REG_STATUS_TEXT_DPA_SEEDED      BIT(7)
+#define REG_STATUS_UNWRAP_DPA_SEEDED    BIT(8)
+
+#define REG_IRQ_STATUS        0x18
+#define REG_IRQ_STATUS_INVALID_CMD      BIT(2)
+#define REG_IRQ_STATUS_FLAG             BIT(5)
+#define REG_IRQ_ENABLE        0x1c
+#define REG_WATERMARK         0x20
+#define REG_Q_STATUS          0x24
+#define REG_FLAG_INFO         0x30
+#define REG_FIFO              0x200
+
+static const uint32_t key_lens[CMD_KEY_KEY_LEN_NUM] = {
+    [0] = 16,
+    [1] = 24,
+    [2] = 32,
+    [3] = 64,
+};
+
+typedef struct Key {
+    uint32_t key_len;
+    uint8_t key[32];
+} Key;
+
+typedef struct IV {
+    uint32_t iv[4];
+} IV;
+
+static Key builtin_keys[CMD_KEY_SELECT_MAX_IDX + 1] = {
+    [1] = {
+        .key_len = 32,
+        .key = { 0x1 },
+    },
+    [2] = {
+        .key_len = 32,
+        .key = { 0x2 },
+    },
+    [3] = {
+        .key_len = 32,
+        .key = { 0x3 },
+    }
+};
+
+struct AESState {
+    SysBusDevice parent_obj;
+
+    qemu_irq irq;
+    MemoryRegion iomem1;
+    MemoryRegion iomem2;
+    AddressSpace *as;
+
+    uint32_t status;
+    uint32_t q_status;
+    uint32_t irq_status;
+    uint32_t irq_enable;
+    uint32_t watermark;
+    uint32_t flag_info;
+    uint32_t fifo[MAX_FIFO_SIZE];
+    uint32_t fifo_idx;
+    Key key[2];
+    IV iv[4];
+    bool is_encrypt;
+    QCryptoCipherMode block_mode;
+};
+
+static void aes_update_irq(AESState *s)
+{
+    qemu_set_irq(s->irq, !!(s->irq_status & s->irq_enable));
+}
+
+static uint64_t aes1_read(void *opaque, hwaddr offset, unsigned size)
+{
+    AESState *s = opaque;
+    uint64_t res = 0;
+
+    switch (offset) {
+    case REG_STATUS:
+        res = s->status;
+        break;
+    case REG_IRQ_STATUS:
+        res = s->irq_status;
+        break;
+    case REG_IRQ_ENABLE:
+        res = s->irq_enable;
+        break;
+    case REG_WATERMARK:
+        res = s->watermark;
+        break;
+    case REG_Q_STATUS:
+        res = s->q_status;
+        break;
+    case REG_FLAG_INFO:
+        res = s->flag_info;
+        break;
+
+    default:
+        qemu_log_mask(LOG_UNIMP, "%s: Unknown AES MMIO offset %" PRIx64 "\n",
+                      __func__, offset);
+        break;
+    }
+
+    trace_aes_read(offset, res);
+
+    return res;
+}
+
+static void fifo_append(AESState *s, uint64_t val)
+{
+    if (s->fifo_idx == MAX_FIFO_SIZE) {
+        /* Exceeded the FIFO. Bail out */
+        return;
+    }
+
+    s->fifo[s->fifo_idx++] = val;
+}
+
+static bool has_payload(AESState *s, uint32_t elems)
+{
+    return s->fifo_idx >= elems + 1;
+}
+
+static bool cmd_key(AESState *s)
+{
+    uint32_t cmd = s->fifo[0];
+    uint32_t key_select = (cmd & CMD_KEY_SELECT_MASK) >> CMD_KEY_SELECT_SHIFT;
+    uint32_t ctxt = (cmd & CMD_KEY_CONTEXT_MASK) >> CMD_KEY_CONTEXT_SHIFT;
+    uint32_t key_len;
+
+    switch ((cmd & CMD_KEY_BLOCK_MODE_MASK) >> CMD_KEY_BLOCK_MODE_SHIFT) {
+    case 0:
+        s->block_mode = QCRYPTO_CIPHER_MODE_ECB;
+        break;
+    case 1:
+        s->block_mode = QCRYPTO_CIPHER_MODE_CBC;
+        break;
+    default:
+        return false;
+    }
+
+    s->is_encrypt = cmd & CMD_KEY_ENCRYPT_MASK;
+    key_len = key_lens[(cmd & CMD_KEY_KEY_LEN_MASK) >> CMD_KEY_KEY_LEN_SHIFT];
+
+    if (key_select) {
+        trace_aes_cmd_key_select_builtin(ctxt, key_select,
+                                         s->is_encrypt ? "en" : "de",
+                                         QCryptoCipherMode_str(s->block_mode));
+        s->key[ctxt] = builtin_keys[key_select];
+    } else {
+        trace_aes_cmd_key_select_new(ctxt, key_len,
+                                     s->is_encrypt ? "en" : "de",
+                                     QCryptoCipherMode_str(s->block_mode));
+        if (key_len > sizeof(s->key[ctxt].key)) {
+            return false;
+        }
+        if (!has_payload(s, key_len / sizeof(uint32_t))) {
+            /* wait for payload */
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: No payload\n", __func__);
+            return false;
+        }
+        memcpy(&s->key[ctxt].key, &s->fifo[1], key_len);
+        s->key[ctxt].key_len = key_len;
+    }
+
+    return true;
+}
+
+static bool cmd_iv(AESState *s)
+{
+    uint32_t cmd = s->fifo[0];
+    uint32_t ctxt = (cmd & CMD_IV_CONTEXT_MASK) >> CMD_IV_CONTEXT_SHIFT;
+
+    if (!has_payload(s, 4)) {
+        /* wait for payload */
+        return false;
+    }
+    memcpy(&s->iv[ctxt].iv, &s->fifo[1], sizeof(s->iv[ctxt].iv));
+    trace_aes_cmd_iv(ctxt, s->fifo[1], s->fifo[2], s->fifo[3], s->fifo[4]);
+
+    return true;
+}
+
+static void dump_data(const char *desc, const void *p, size_t len)
+{
+    static const size_t MAX_LEN = 0x1000;
+    char hex[MAX_LEN * 2 + 1] = "";
+
+    if (len > MAX_LEN) {
+        return;
+    }
+
+    qemu_hexdump_to_buffer(hex, sizeof(hex), p, len);
+    trace_aes_dump_data(desc, hex);
+}
+
+static bool cmd_data(AESState *s)
+{
+    uint32_t cmd = s->fifo[0];
+    uint32_t ctxt_iv = 0;
+    uint32_t ctxt_key = (cmd & CMD_DATA_KEY_CTX_MASK) >> CMD_DATA_KEY_CTX_SHIFT;
+    uint32_t len = cmd & CMD_DATA_LEN_MASK;
+    uint64_t src_addr = s->fifo[2];
+    uint64_t dst_addr = s->fifo[3];
+    QCryptoCipherAlgo alg;
+    g_autoptr(QCryptoCipher) cipher = NULL;
+    g_autoptr(GByteArray) src = NULL;
+    g_autoptr(GByteArray) dst = NULL;
+    MemTxResult r;
+
+    src_addr |= ((uint64_t)s->fifo[1] << 16) & 0xffff00000000ULL;
+    dst_addr |= ((uint64_t)s->fifo[1] << 32) & 0xffff00000000ULL;
+
+    trace_aes_cmd_data(ctxt_key, ctxt_iv, src_addr, dst_addr, len);
+
+    if (!has_payload(s, 3)) {
+        /* wait for payload */
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: No payload\n", __func__);
+        return false;
+    }
+
+    if (ctxt_key >= ARRAY_SIZE(s->key) ||
+        ctxt_iv >= ARRAY_SIZE(s->iv)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Invalid key or iv\n", __func__);
+        return false;
+    }
+
+    src = g_byte_array_sized_new(len);
+    g_byte_array_set_size(src, len);
+    dst = g_byte_array_sized_new(len);
+    g_byte_array_set_size(dst, len);
+
+    r = dma_memory_read(s->as, src_addr, src->data, len, MEMTXATTRS_UNSPECIFIED);
+    if (r != MEMTX_OK) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: DMA read of %"PRIu32" bytes "
+                      "from 0x%"PRIx64" failed. (r=%d)\n",
+                      __func__, len, src_addr, r);
+        return false;
+    }
+
+    dump_data("cmd_data(): src_data=", src->data, len);
+
+    switch (s->key[ctxt_key].key_len) {
+    case 128 / 8:
+        alg = QCRYPTO_CIPHER_ALGO_AES_128;
+        break;
+    case 192 / 8:
+        alg = QCRYPTO_CIPHER_ALGO_AES_192;
+        break;
+    case 256 / 8:
+        alg = QCRYPTO_CIPHER_ALGO_AES_256;
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Invalid key length\n", __func__);
+        return false;
+    }
+    cipher = qcrypto_cipher_new(alg, s->block_mode,
+                                s->key[ctxt_key].key,
+                                s->key[ctxt_key].key_len, NULL);
+    if (!cipher) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Failed to create cipher object\n",
+                      __func__);
+        return false;
+    }
+    if (s->block_mode != QCRYPTO_CIPHER_MODE_ECB) {
+        if (qcrypto_cipher_setiv(cipher, (void *)s->iv[ctxt_iv].iv,
+                                 sizeof(s->iv[ctxt_iv].iv), NULL) != 0) {
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: Failed to set IV\n", __func__);
+            return false;
+        }
+    }
+    if (s->is_encrypt) {
+        if (qcrypto_cipher_encrypt(cipher, src->data, dst->data, len, NULL) != 0) {
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: Encryption failed\n", __func__);
+            return false;
+        }
+    } else {
+        if (qcrypto_cipher_decrypt(cipher, src->data, dst->data, len, NULL) != 0) {
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: Decryption failed\n", __func__);
+            return false;
+        }
+    }
+
+    dump_data("cmd_data(): dst_data=", dst->data, len);
+    r = dma_memory_write(s->as, dst_addr, dst->data, len, MEMTXATTRS_UNSPECIFIED);
+    if (r != MEMTX_OK) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: DMA write of %"PRIu32" bytes "
+                      "to 0x%"PRIx64" failed. (r=%d)\n",
+                      __func__, len, src_addr, r);
+        return false;
+    }
+
+    return true;
+}
+
+static bool cmd_store_iv(AESState *s)
+{
+    uint32_t cmd = s->fifo[0];
+    uint32_t ctxt = (cmd & CMD_IV_CONTEXT_MASK) >> CMD_IV_CONTEXT_SHIFT;
+    uint64_t addr = s->fifo[1];
+    MemTxResult dma_result;
+
+    if (!has_payload(s, 1)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: No payload\n", __func__);
+        return false;
+    }
+
+    if (ctxt >= ARRAY_SIZE(s->iv)) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Invalid context. ctxt = %u, allowed: 0..%zu\n",
+                      __func__, ctxt, ARRAY_SIZE(s->iv) - 1);
+        return false;
+    }
+
+    addr |= ((uint64_t)cmd << 32) & 0xff00000000ULL;
+    dma_result = dma_memory_write(&address_space_memory, addr,
+                                  &s->iv[ctxt].iv, sizeof(s->iv[ctxt].iv),
+                                  MEMTXATTRS_UNSPECIFIED);
+
+    trace_aes_cmd_store_iv(ctxt, addr, s->iv[ctxt].iv[0], s->iv[ctxt].iv[1],
+                           s->iv[ctxt].iv[2], s->iv[ctxt].iv[3]);
+
+    return dma_result == MEMTX_OK;
+}
+
+static bool cmd_flag(AESState *s)
+{
+    uint32_t cmd = s->fifo[0];
+    uint32_t raise_irq = cmd & CMD_FLAG_RAISE_IRQ_MASK;
+
+    /* We always process data when it's coming in, so fire an IRQ immediately */
+    if (raise_irq) {
+        s->irq_status |= REG_IRQ_STATUS_FLAG;
+    }
+
+    s->flag_info = cmd & CMD_FLAG_INFO_MASK;
+
+    trace_aes_cmd_flag(!!raise_irq, s->flag_info);
+
+    return true;
+}
+
+static void fifo_process(AESState *s)
+{
+    uint32_t cmd = s->fifo[0] >> CMD_SHIFT;
+    bool success = false;
+
+    if (!s->fifo_idx) {
+        return;
+    }
+
+    switch (cmd) {
+    case CMD_KEY:
+        success = cmd_key(s);
+        break;
+    case CMD_IV:
+        success = cmd_iv(s);
+        break;
+    case CMD_DATA:
+        success = cmd_data(s);
+        break;
+    case CMD_STORE_IV:
+        success = cmd_store_iv(s);
+        break;
+    case CMD_FLAG:
+        success = cmd_flag(s);
+        break;
+    default:
+        s->irq_status |= REG_IRQ_STATUS_INVALID_CMD;
+        break;
+    }
+
+    if (success) {
+        s->fifo_idx = 0;
+    }
+
+    trace_aes_fifo_process(cmd, success);
+}
+
+static void aes1_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
+{
+    AESState *s = opaque;
+
+    trace_aes_write(offset, val);
+
+    switch (offset) {
+    case REG_IRQ_STATUS:
+        s->irq_status &= ~val;
+        break;
+    case REG_IRQ_ENABLE:
+        s->irq_enable = val;
+        break;
+    case REG_FIFO:
+        fifo_append(s, val);
+        fifo_process(s);
+        break;
+    default:
+        qemu_log_mask(LOG_UNIMP,
+                      "%s: Unknown AES MMIO offset %"PRIx64", data %"PRIx64"\n",
+                      __func__, offset, val);
+        return;
+    }
+
+    aes_update_irq(s);
+}
+
+static const MemoryRegionOps aes1_ops = {
+    .read = aes1_read,
+    .write = aes1_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+    .valid = {
+        .min_access_size = 4,
+        .max_access_size = 8,
+    },
+    .impl = {
+        .min_access_size = 4,
+        .max_access_size = 4,
+    },
+};
+
+static uint64_t aes2_read(void *opaque, hwaddr offset, unsigned size)
+{
+    uint64_t res = 0;
+
+    switch (offset) {
+    case 0:
+        res = 0;
+        break;
+    default:
+        qemu_log_mask(LOG_UNIMP,
+                      "%s: Unknown AES MMIO 2 offset %"PRIx64"\n",
+                      __func__, offset);
+        break;
+    }
+
+    trace_aes_2_read(offset, res);
+
+    return res;
+}
+
+static void aes2_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
+{
+    trace_aes_2_write(offset, val);
+
+    switch (offset) {
+    default:
+        qemu_log_mask(LOG_UNIMP,
+                      "%s: Unknown AES MMIO 2 offset %"PRIx64", data %"PRIx64"\n",
+                      __func__, offset, val);
+        return;
+    }
+}
+
+static const MemoryRegionOps aes2_ops = {
+    .read = aes2_read,
+    .write = aes2_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+    .valid = {
+        .min_access_size = 4,
+        .max_access_size = 8,
+    },
+    .impl = {
+        .min_access_size = 4,
+        .max_access_size = 4,
+    },
+};
+
+static void aes_reset(Object *obj, ResetType type)
+{
+    AESState *s = APPLE_AES(obj);
+
+    s->status = 0x3f80;
+    s->q_status = 2;
+    s->irq_status = 0;
+    s->irq_enable = 0;
+    s->watermark = 0;
+}
+
+static void aes_init(Object *obj)
+{
+    AESState *s = APPLE_AES(obj);
+
+    memory_region_init_io(&s->iomem1, obj, &aes1_ops, s, TYPE_APPLE_AES, 0x4000);
+    memory_region_init_io(&s->iomem2, obj, &aes2_ops, s, TYPE_APPLE_AES, 0x4000);
+    sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->iomem1);
+    sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->iomem2);
+    sysbus_init_irq(SYS_BUS_DEVICE(s), &s->irq);
+    s->as = &address_space_memory;
+}
+
+static void aes_class_init(ObjectClass *klass, void *data)
+{
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
+
+    rc->phases.hold = aes_reset;
+}
+
+static const TypeInfo aes_info = {
+    .name          = TYPE_APPLE_AES,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(AESState),
+    .class_init    = aes_class_init,
+    .instance_init = aes_init,
+};
+
+static void aes_register_types(void)
+{
+    type_register_static(&aes_info);
+}
+
+type_init(aes_register_types)
diff --git a/hw/vmapple/meson.build b/hw/vmapple/meson.build
index e69de29bb2..bcd4dcb28d 100644
--- a/hw/vmapple/meson.build
+++ b/hw/vmapple/meson.build
@@ -0,0 +1 @@
+system_ss.add(when: 'CONFIG_VMAPPLE_AES',  if_true: files('aes.c'))
diff --git a/hw/vmapple/trace-events b/hw/vmapple/trace-events
index 9ccc579048..0d4a73d7d1 100644
--- a/hw/vmapple/trace-events
+++ b/hw/vmapple/trace-events
@@ -1,2 +1,16 @@
 # See docs/devel/tracing.rst for syntax documentation.
 
+# aes.c
+aes_read(uint64_t offset, uint64_t res) "offset=0x%"PRIx64" res=0x%"PRIx64
+aes_cmd_key_select_builtin(uint32_t ctx, uint32_t key_id, const char *direction, const char *cipher) "[%d] Selecting builtin key %d to %scrypt with %s"
+aes_cmd_key_select_new(uint32_t ctx, uint32_t key_len, const char *direction, const char *cipher) "[%d] Selecting new key size=%d to %scrypt with %s"
+aes_cmd_iv(uint32_t ctx, uint32_t iv0, uint32_t iv1, uint32_t iv2, uint32_t iv3) "[%d] 0x%08x 0x%08x 0x%08x 0x%08x"
+aes_cmd_data(uint32_t key, uint32_t iv, uint64_t src, uint64_t dst, uint32_t len) "[key=%d iv=%d] src=0x%"PRIx64" dst=0x%"PRIx64" len=0x%x"
+aes_cmd_store_iv(uint32_t ctx, uint64_t addr, uint32_t iv0, uint32_t iv1, uint32_t iv2, uint32_t iv3) "[%d] addr=0x%"PRIx64"x -> 0x%08x 0x%08x 0x%08x 0x%08x"
+aes_cmd_flag(uint32_t raise, uint32_t flag_info) "raise=%d flag_info=0x%x"
+aes_fifo_process(uint32_t cmd, bool success) "cmd=%d success=%d"
+aes_write(uint64_t offset, uint64_t val) "offset=0x%"PRIx64" val=0x%"PRIx64
+aes_2_read(uint64_t offset, uint64_t res) "offset=0x%"PRIx64" res=0x%"PRIx64
+aes_2_write(uint64_t offset, uint64_t val) "offset=0x%"PRIx64" val=0x%"PRIx64
+aes_dump_data(const char *desc, const char *hex) "%s%s"
+
diff --git a/include/hw/vmapple/vmapple.h b/include/hw/vmapple/vmapple.h
new file mode 100644
index 0000000000..6762b6c869
--- /dev/null
+++ b/include/hw/vmapple/vmapple.h
@@ -0,0 +1,17 @@
+/*
+ * Devices specific to the VMApple machine type
+ *
+ * Copyright © 2023 Amazon.com, Inc. or its affiliates. All Rights Reserved.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef HW_VMAPPLE_VMAPPLE_H
+#define HW_VMAPPLE_VMAPPLE_H
+
+#define TYPE_APPLE_AES "apple-aes"
+
+#endif /* HW_VMAPPLE_VMAPPLE_H */
diff --git a/include/qemu/cutils.h b/include/qemu/cutils.h
index 34a9b9b220..36c68ce86c 100644
--- a/include/qemu/cutils.h
+++ b/include/qemu/cutils.h
@@ -302,4 +302,19 @@ GString *qemu_hexdump_line(GString *str, const void *buf, size_t len,
 void qemu_hexdump(FILE *fp, const char *prefix,
                   const void *bufptr, size_t size);
 
+/**
+ * qemu_hexdump_to_buffer:
+ * @buffer: output string buffer
+ * @buffer_size: amount of available space in buffer. Must be at least
+ *               data_size*2+1.
+ * @data: input bytes
+ * @data_size: number of bytes in data
+ *
+ * Converts the @data_size bytes in @data into hex digit pairs, writing them to
+ * @buffer. Finally, a nul terminating character is written; @buffer therefore
+ * needs space for (data_size*2+1) chars.
+ */
+void qemu_hexdump_to_buffer(char *restrict buffer, size_t buffer_size,
+                            const uint8_t *restrict data, size_t data_size);
+
 #endif
diff --git a/util/hexdump.c b/util/hexdump.c
index ae0d4992dc..f29ffceb74 100644
--- a/util/hexdump.c
+++ b/util/hexdump.c
@@ -15,6 +15,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/cutils.h"
+#include "qemu/host-utils.h"
 
 static inline char hexdump_nibble(unsigned x)
 {
@@ -97,3 +98,20 @@ void qemu_hexdump(FILE *fp, const char *prefix,
     }
 
 }
+
+void qemu_hexdump_to_buffer(char *restrict buffer, size_t buffer_size,
+                            const uint8_t *restrict data, size_t data_size)
+{
+    size_t i;
+    uint64_t required_buffer_size;
+    bool overflow = umul64_overflow(data_size, 2, &required_buffer_size);
+    overflow |= uadd64_overflow(required_buffer_size, 1, &required_buffer_size);
+    assert(!overflow && buffer_size >= required_buffer_size);
+
+    for (i = 0; i < data_size; i++) {
+        uint8_t val = data[i];
+        *(buffer++) = hexdump_nibble(val >> 4);
+        *(buffer++) = hexdump_nibble(val & 0xf);
+    }
+    *buffer = '\0';
+}
-- 
2.39.5 (Apple Git-154)


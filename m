Received: by 2002:a17:504:26c2:b0:1be9:327d:8ee3 with SMTP id j2csp20444nji;
        Mon, 26 Aug 2024 23:52:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWXu7L0eWZqwmgArEFiPM/915KSQcF+4q14yMRUrGG9UnCmldzvQrhhNzN6+7lMRKO8vQN/3UIvsg3STw==@linaro.org
X-Google-Smtp-Source: AGHT+IEVLDVkUNyldx6fYsxy1YkKYpEVqTjheQdaei2xadFh3k2ARRmUOyFA3YurnEgAuCc43eNb
X-Received: by 2002:a05:6214:3990:b0:6bf:8b86:7b0a with SMTP id 6a1803df08f44-6c16dc602fbmr155669676d6.18.1724741557143;
        Mon, 26 Aug 2024 23:52:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724741557; cv=none;
        d=google.com; s=arc-20160816;
        b=NNxuyRTS+sr6BMO7Ui/R3nZixTeY0i8iVd3DBz5J6CuqxVF24L65tNg3/T5VnrrIw/
         rpHkQ4ikmnKTMw6wgqrn4JZMcFKNkYpN5h3eZa20MvHeWFrRy7B0LXqj6FNiZ+hl8hz3
         v+NyFDMRTaLOx3GhP5F+zEuDJXblIK4ioFWNWyNBSuxGE9sujyumGE4UTqFzulA+0CoY
         uP0eyqetOM/avjkFJ1yuLDTEX7FB9pvfMG76feLlys2hG4NN6s4fKcM3X0Zr8OrE9qJY
         pPgdQRJHgXZRTDOAjaJYpNsntOwD6Co3c8BoS6RaP5oZyKKwL6brcJAuGmj8iP3jKMog
         vkgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=I/L0033+ew0b7Dw3M+WEE4Qrh6IGsFEIpeM87W+pWsE=;
        fh=2mssAqYKJuMcD/Ya5YUzhxP7uPixmdZ7O75Bi0gtEhM=;
        b=RmEeRPYguets5Son7pjVlMTPZt+1wQYjIbDO0liHF4biX5EpTSm/gzMBiyTSN/kvup
         I5veNyTmkTRBeDGoac2I6BqRepEW4rZiiLd+/TBLHBEMTspGjLh/SLxloDkqcNyNhhEn
         yk3XGypnu4F3gRG4goUSMUWNS2HAfuuv4BnamfVRAe++Opm3xOYAxLjjTxZvFVioBoZn
         LGX1cEVgmj0Vb5IKNJF4hKmnyCYzF+dSDMf3gxymj7PvkwQ8Y4ccCng4iyfkSU3NHeAU
         kwGgGN4etvFgLBcRz+wSa0iJvSXIZOt8z7Xg0vLVnK1BdGOYWt9/Wna5gVMEMW/ekrZM
         VyyQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=SQIa5lHP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c162dd5c5dsi124006276d6.373.2024.08.26.23.52.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Aug 2024 23:52:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=SQIa5lHP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sipyV-0005IN-TH; Tue, 27 Aug 2024 02:46:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3KXbNZgUKCog5m7u1s00sxq.o0y2qy6-pq7qxz0zsz6.03s@flex--tavip.bounces.google.com>)
 id 1sipyG-00048f-1V
 for qemu-devel@nongnu.org; Tue, 27 Aug 2024 02:46:31 -0400
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3KXbNZgUKCog5m7u1s00sxq.o0y2qy6-pq7qxz0zsz6.03s@flex--tavip.bounces.google.com>)
 id 1sipy8-00069x-8Y
 for qemu-devel@nongnu.org; Tue, 27 Aug 2024 02:46:23 -0400
Received: by mail-yb1-xb4a.google.com with SMTP id
 3f1490d57ef6-e1651bac405so9400728276.3
 for <qemu-devel@nongnu.org>; Mon, 26 Aug 2024 23:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1724741162; x=1725345962; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=I/L0033+ew0b7Dw3M+WEE4Qrh6IGsFEIpeM87W+pWsE=;
 b=SQIa5lHPRVawVvQ7wp28SOeFKuzdNC/w0sBWp0jle6t/II832aW9C5L8xiYutRclvV
 eg/Ob0IGfj6IxK3pLy8bgWt4xNpXos9br7pbU2Yui1b/11F6IFL/NcqWk0Yy64TycQ1L
 k2CjvLf9eOjjz+Ozu2cffI5aCWaurd2HTqQrDUE4HPrWCxl6hN5/EM/xKVb6nFj/4Wah
 pfx63g9D7BpjLacT8M5P4VGBAEhyTUFZaB74FX2oB8JW/dcKC+MdJmyJJSC3F7uKQ2nf
 pVGVrOYMzK1zhfJ9T6F9sULK3vdY3GEsRgcSBPRaUbWl6lgQDIubC3kPnnNOQ5MWiOKG
 HqCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724741162; x=1725345962;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=I/L0033+ew0b7Dw3M+WEE4Qrh6IGsFEIpeM87W+pWsE=;
 b=f0ThQex1tuLmfss/mD9RuwOmDPw+UuF24L5i0soR+e3iQyJSJElc1WL4JVmq/1Z+uu
 q5Tmel5/f2kV7ufHy2HDw8O17YiFlf9hHQ6m/HcfFM6LjuDxdmb3B4ukL63WNteidDjg
 NJS9oMikGW5DsIb0JzQNu5las/EIZk2tDbhuvsLDbbDcZ0eETjmKDh0fmBkaFI1Gi/f5
 2KOPpPza5yED4qIYI8I4daUKonPSGBojOfmTLd9SR8UC5hjzYYGREwPU/N/sTYf68RYA
 db+B6KyWvEAypOs2DacZUXGod8V5ITazCcvUskMG2C3xXlz7DEkhNCwh/ynQzld2PO/T
 LhDA==
X-Gm-Message-State: AOJu0YyPmUof99y8j6eckQWGmNLVNzwopcNxxSXQEROFYeVcFE+/NgYS
 UxEm5M24mzk2nZZMmhMzpVnVihRuwucuQOdkkOKDj6PqcYOgLQ3Ur+++fFZApCJSxMQlO6C6ZSH
 TiFSeSuNkyubrxv8xIGWcaafKZ68ZFIYzTc7iQprdKQjCdi388texPO4fLr60+/aQJ7dPTtHgN1
 6BoNyCjpXhHZmhXwmSO8JhIbvTdw==
X-Received: from warp10.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:750])
 (user=tavip job=sendgmr) by 2002:a5b:84b:0:b0:e0e:499f:3d9b with
 SMTP id
 3f1490d57ef6-e17bc013223mr18337276.1.1724741161472; Mon, 26 Aug 2024 23:46:01
 -0700 (PDT)
Date: Mon, 26 Aug 2024 23:45:20 -0700
In-Reply-To: <20240827064529.1246786-1-tavip@google.com>
Mime-Version: 1.0
References: <20240827064529.1246786-1-tavip@google.com>
X-Mailer: git-send-email 2.46.0.295.g3b9ea8a38a-goog
Message-ID: <20240827064529.1246786-17-tavip@google.com>
Subject: [RFC PATCH v3 16/24] tests/qtest: add flexcomm tests
From: Octavian Purdila <tavip@google.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, stefanst@google.com, pbonzini@redhat.com, 
 peter.maydell@linaro.org, marcandre.lureau@redhat.com, berrange@redhat.com, 
 eduardo@habkost.net, luc@lmichel.fr, damien.hedde@dahe.fr, 
 alistair@alistair23.me, thuth@redhat.com, philmd@linaro.org, jsnow@redhat.com, 
 crosa@redhat.com, lvivier@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3KXbNZgUKCog5m7u1s00sxq.o0y2qy6-pq7qxz0zsz6.03s@flex--tavip.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: B64ifrYqbvON

Add flexcomm function selection unit tests.

Signed-off-by: Octavian Purdila <tavip@google.com>
---
 tests/qtest/flexcomm-test.c | 86 +++++++++++++++++++++++++++++++++++++
 tests/qtest/meson.build     |  1 +
 2 files changed, 87 insertions(+)
 create mode 100644 tests/qtest/flexcomm-test.c

diff --git a/tests/qtest/flexcomm-test.c b/tests/qtest/flexcomm-test.c
new file mode 100644
index 0000000000..2258633646
--- /dev/null
+++ b/tests/qtest/flexcomm-test.c
@@ -0,0 +1,86 @@
+/*
+ * Copyright (C) 2024 Google LLC
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "qemu/module.h"
+#include "qemu/main-loop.h"
+#include "exec/memory.h"
+#include "hw/irq.h"
+#include "hw/qdev-properties.h"
+
+#include "hw/misc/flexcomm.h"
+#include "hw/arm/svd/flexcomm.h"
+#include "hw/arm/svd/rt500.h"
+#include "reg-utils.h"
+
+#define FLEXCOMM_BASE RT500_FLEXCOMM0_BASE
+
+static void select_test(gconstpointer data)
+{
+    static const struct {
+        int persel;
+        int func;
+    } persel_func_map[] = {
+        { FLEXCOMM_PERSEL_USART, FLEXCOMM_FUNC_USART },
+        { FLEXCOMM_PERSEL_SPI, FLEXCOMM_FUNC_SPI },
+        { FLEXCOMM_PERSEL_I2C, FLEXCOMM_FUNC_I2C },
+    };
+
+    g_assert(REG32_READ_FIELD(FLEXCOMM, PSELID, PERSEL) == 0);
+
+    /* no register access until a function is selected  */
+    readl_fail(FLEXCOMM_BASE);
+    writel_fail(FLEXCOMM_BASE, 0);
+
+    for (int i = 0; i < ARRAY_SIZE(persel_func_map); i++) {
+        int persel = persel_func_map[i].persel;
+
+        REG32_WRITE(FLEXCOMM, PSELID, persel);
+        g_assert_cmpuint(REG32_READ_FIELD(FLEXCOMM, PSELID, PERSEL), ==,
+                         persel);
+
+        /* test that we can access function registers */
+        writel(FLEXCOMM_BASE + 0x10, 0xabcd);
+        readl(FLEXCOMM_BASE + 0x10);
+    }
+
+    /* try to select something invalid */
+    REG32_WRITE(FLEXCOMM, PSELID, 7);
+    /* check for no function selected */
+    g_assert_cmpuint(REG32_READ_FIELD(FLEXCOMM, PSELID, PERSEL), ==, 0);
+
+    /* now select and lock USART */
+    REG32_WRITE(FLEXCOMM, PSELID,
+                FIELD_DP32(FLEXCOMM_PERSEL_USART, FLEXCOMM_PSELID, LOCK, 1));
+    g_assert_cmpuint(REG32_READ_FIELD(FLEXCOMM, PSELID, PERSEL), ==,
+                     FLEXCOMM_PERSEL_USART);
+    g_assert_cmpuint(REG32_READ_FIELD(FLEXCOMM, PSELID, LOCK), ==, 1);
+
+    /* try to change the selection to spi */
+    REG32_WRITE(FLEXCOMM, PSELID, FLEXCOMM_PERSEL_SPI);
+    /* it should still be locked USART */
+    g_assert_cmpuint(REG32_READ_FIELD(FLEXCOMM, PSELID, PERSEL), ==,
+                     FLEXCOMM_PERSEL_USART);
+    g_assert_cmpuint(REG32_READ_FIELD(FLEXCOMM, PSELID, LOCK), ==, 1);
+}
+
+int main(int argc, char **argv)
+{
+    int ret;
+
+    g_test_init(&argc, &argv, NULL);
+
+    qtest_add_data_func("/flexcomm/select", NULL, select_test);
+    qtest_start("-M rt595-evk");
+    ret = g_test_run();
+    qtest_end();
+
+    return ret;
+}
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 12792948ff..9631b6c401 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -229,6 +229,7 @@ qtests_arm = \
   (config_all_devices.has_key('CONFIG_FSI_APB2OPB_ASPEED') ? ['aspeed_fsi-test'] : []) + \
   (config_all_devices.has_key('CONFIG_STM32L4X5_SOC') and
    config_all_devices.has_key('CONFIG_DM163')? ['dm163-test'] : []) + \
+  (config_all_devices.has_key('CONFIG_FLEXCOMM')? ['flexcomm-test'] : []) + \
   ['arm-cpu-features',
    'boot-serial-test']
 
-- 
2.46.0.295.g3b9ea8a38a-goog


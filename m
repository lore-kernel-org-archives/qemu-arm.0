Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp5192379lfb;
        Tue, 7 Sep 2021 16:26:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzm6hHO/aUrJe7+ZTeK+kPOPH5ijyOFo1ZA5XDyDi6WFw2sQ4OKHj2R9G9qydAAmOKUIta0
X-Received: by 2002:a92:d20d:: with SMTP id y13mr563443ily.294.1631057214365;
        Tue, 07 Sep 2021 16:26:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631057214; cv=none;
        d=google.com; s=arc-20160816;
        b=BThmgBHduURCecZhfXvA6H/dg4HR4anU4FiGh34I70eRmnhdQQXKCKdsckM3p2geYK
         73hYx6nnw1OC5kdoZKftNSaoFIEKeMPnt7ZRjvasy/zoEpNjW5grPounhWPP0RCcHpAM
         li7ci3CoO5jvpwJH5thwocTHEZi0vF3FkC6nrYPvas8kYKrwh4FT5i6Y5bip9d9NxBeM
         vRQ9CrADmVfhTcQ2QwNvZg+2hfJxQnRc9ZyeSzPyyJZv1hftdHtSzB0T9abmHHR0OoVm
         Z4UXRzScdy5gQbCJPq5xqYieYOHO9sK8kJaEv1wOto969UPiNwAg40QQfADnFSfVrX7d
         4ohw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=hgo31a1Pu74o2wAfbf6NQnOyO4IeBKoFrlmKiTTXIcg=;
        b=S7n4BVEv5e59wvyVHJR5+IonzzNzl8RS4b9tiGZRzbkOaZ3d2GJl1wW+P5S1j4U49R
         ejD1G1IiKXoGQ64UPs2P8A4/Vt8Q8wg++3ilXZKZn6uPedP/FZPtxA5P+O3S4N97nj+v
         9UMY4L+x1lSTFFoeQx0WkNr3qRa7hlXqgTJMz0WaaF629JcdiP79Ji2byvyBeYO//kg1
         SinMkJI6yOeK8cyjm9vmRFyfCItrPrA5zoccSvTy6QF8X7RDR0MQOOVr1wzTvswOm9Xq
         gJhegCnx9iSQRThvjUREKyjDA5CraAaTv/l2bXcMr7eI+lOU2E1/col+p1svW70m8kQJ
         ZAEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=CXv7ziNF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j24si325084jaa.10.2021.09.07.16.26.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Sep 2021 16:26:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=CXv7ziNF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:53680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mNkUP-0000OE-N5
	for alex.bennee@linaro.org; Tue, 07 Sep 2021 19:26:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3JvU3YQgKCAExvibputihpphmf.dpnrfnv-bsnopohov.psh@flex--wuhaotsh.bounces.google.com>)
 id 1mNkU8-0000Jk-RK
 for qemu-arm@nongnu.org; Tue, 07 Sep 2021 19:26:36 -0400
Received: from mail-qt1-x84a.google.com ([2607:f8b0:4864:20::84a]:41609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3JvU3YQgKCAExvibputihpphmf.dpnrfnv-bsnopohov.psh@flex--wuhaotsh.bounces.google.com>)
 id 1mNkU3-00041G-Tg
 for qemu-arm@nongnu.org; Tue, 07 Sep 2021 19:26:36 -0400
Received: by mail-qt1-x84a.google.com with SMTP id
 f34-20020a05622a1a2200b0029c338949c1so684086qtb.8
 for <qemu-arm@nongnu.org>; Tue, 07 Sep 2021 16:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=hgo31a1Pu74o2wAfbf6NQnOyO4IeBKoFrlmKiTTXIcg=;
 b=CXv7ziNFNqBMy7n3iUjV7elW7tjNqEc62rrJF/MqKqZLGwgSiv9/KKadqugGvoDrwm
 0KhZaT6LN29FhNhkph4n6aexBVhai4c1gTwxkZ7YZozp2YOuJZs/vfG+3KdpUuPK3pS/
 0N9KUgyG/DsJ4yLDEJQSyCm4Ikq9z8TmbMnGEOMFrHSV0Cqy8lIa0WZpOjzinNbfT25Q
 eIzUbxiBl2eopBD5q3vqa1uvORB+gxzQV3sTMQuImahI8/4zohiJ2vFelIz56kN5PSYB
 D3V3eq5FJdX7eDl51PhYUz1A/bjs1pNw1CjpT/dkohYn8flmZP/ujEJHJi9jPgAXHWQU
 dUvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=hgo31a1Pu74o2wAfbf6NQnOyO4IeBKoFrlmKiTTXIcg=;
 b=BTF6ex31tTs/uoogzPbjjZE0yZBUQ2LZV+J+yQ+vrU+/Wsftv5eWHzS8IUbYGrylao
 eyOWBo3Rw08e06sZyk1lfPwGwzyt4NdCx2kZuWghYX7nl0rFTjQMDxn6FQhpewlrZ7zL
 lzra2Ub0OX64MD2pUyMwPA3APPrDLjaJK9k9ZP8SxPjcj49YfGA3ZDfFTrAyO5/f/k1s
 bqCvITPzgvZW0S0ZhD1nITSwxBrSzptCHHQ7IpEc4SrMqsmbuKhi2C9BYuWd+w6SfIZi
 darC3sMBViUlxfegiUlg6AeOqIg+ByATlbAfJGndSukbqOF46gJ1c0ccdn5JBpVlPPwb
 VdXA==
X-Gm-Message-State: AOAM530ssMt4zvrdeJ0iyL6sHReP7OpiRomzalVfSWbdj90xTrX58tcy
 HkA37fRZsKeV3Hu5HUIudl98/1Doa12olw==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:ad4:4667:: with SMTP id
 z7mr716120qvv.67.1631057190375; Tue, 07 Sep 2021 16:26:30 -0700 (PDT)
Date: Tue,  7 Sep 2021 16:25:52 -0700
In-Reply-To: <20210907232555.3268967-1-wuhaotsh@google.com>
Message-Id: <20210907232555.3268967-2-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20210907232555.3268967-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.33.0.153.gba50c8fa24-goog
Subject: [PATCH 1/4] tests/qtest/libqos: add SDHCI commands
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, f4bug@amsat.org, bin.meng@windriver.com, 
 qemu-block@nongnu.org, Shengtan Mao <stmao@google.com>,
 Chris Rauer <crauer@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::84a;
 envelope-from=3JvU3YQgKCAExvibputihpphmf.dpnrfnv-bsnopohov.psh@flex--wuhaotsh.bounces.google.com;
 helo=mail-qt1-x84a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hPB6VUMpaTBi

From: Shengtan Mao <stmao@google.com>

Signed-off-by: Shengtan Mao <stmao@google.com>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Chris Rauer <crauer@google.com>
Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
---
 tests/qtest/libqos/meson.build |   1 +
 tests/qtest/libqos/sdhci-cmd.c | 116 +++++++++++++++++++++++++++++++++
 tests/qtest/libqos/sdhci-cmd.h |  70 ++++++++++++++++++++
 3 files changed, 187 insertions(+)
 create mode 100644 tests/qtest/libqos/sdhci-cmd.c
 create mode 100644 tests/qtest/libqos/sdhci-cmd.h

diff --git a/tests/qtest/libqos/meson.build b/tests/qtest/libqos/meson.build
index 1f5c8f1053..4af1f04787 100644
--- a/tests/qtest/libqos/meson.build
+++ b/tests/qtest/libqos/meson.build
@@ -5,6 +5,7 @@ libqos_srcs = files('../libqtest.c',
         'fw_cfg.c',
         'malloc.c',
         'libqos.c',
+        'sdhci-cmd.c',
 
         # spapr
         'malloc-spapr.c',
diff --git a/tests/qtest/libqos/sdhci-cmd.c b/tests/qtest/libqos/sdhci-cmd.c
new file mode 100644
index 0000000000..2d9e518341
--- /dev/null
+++ b/tests/qtest/libqos/sdhci-cmd.c
@@ -0,0 +1,116 @@
+/*
+ * MMC Host Controller Commands
+ *
+ * Copyright (c) 2021 Google LLC
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
+#include "sdhci-cmd.h"
+#include "libqtest.h"
+
+static ssize_t read_fifo(QTestState *qts, uint64_t reg, char *msg, size_t count)
+{
+    uint32_t mask = 0xff;
+    size_t index = 0;
+    uint32_t msg_frag;
+    int size;
+    while (index < count) {
+        size = count - index;
+        if (size > 4) {
+            size = 4;
+        }
+        msg_frag = qtest_readl(qts, reg);
+        while (size > 0) {
+            msg[index] = msg_frag & mask;
+            if (msg[index++] == 0) {
+                return index;
+            }
+            msg_frag >>= 8;
+            --size;
+        }
+    }
+    return index;
+}
+
+static void write_fifo(QTestState *qts, uint64_t reg, const char *msg,
+                       size_t count)
+{
+    size_t index = 0;
+    uint32_t msg_frag;
+    int size;
+    int frag_i;
+    while (index < count) {
+        size = count - index;
+        if (size > 4) {
+            size = 4;
+        }
+        msg_frag = 0;
+        frag_i = 0;
+        while (frag_i < size) {
+            msg_frag |= ((uint32_t)msg[index++]) << (frag_i * 8);
+            ++frag_i;
+        }
+        qtest_writel(qts, reg, msg_frag);
+    }
+}
+
+static void fill_block(QTestState *qts, uint64_t reg, int count)
+{
+    while (--count >= 0) {
+        qtest_writel(qts, reg, 0);
+    }
+}
+
+void sdhci_cmd_regs(QTestState *qts, uint64_t base_addr, uint16_t blksize,
+                    uint16_t blkcnt, uint32_t argument, uint16_t trnmod,
+                    uint16_t cmdreg)
+{
+    qtest_writew(qts, base_addr + SDHC_BLKSIZE, blksize);
+    qtest_writew(qts, base_addr + SDHC_BLKCNT, blkcnt);
+    qtest_writel(qts, base_addr + SDHC_ARGUMENT, argument);
+    qtest_writew(qts, base_addr + SDHC_TRNMOD, trnmod);
+    qtest_writew(qts, base_addr + SDHC_CMDREG, cmdreg);
+}
+
+ssize_t sdhci_read_cmd(QTestState *qts, uint64_t base_addr, char *msg,
+                       size_t count)
+{
+    sdhci_cmd_regs(qts, base_addr, count, 1, 0,
+                   SDHC_TRNS_MULTI | SDHC_TRNS_READ | SDHC_TRNS_BLK_CNT_EN,
+                   SDHC_READ_MULTIPLE_BLOCK | SDHC_CMD_DATA_PRESENT);
+
+    /* read sd fifo_buffer */
+    ssize_t bytes_read = read_fifo(qts, base_addr + SDHC_BDATA, msg, count);
+
+    sdhci_cmd_regs(qts, base_addr, 0, 0, 0,
+                   SDHC_TRNS_MULTI | SDHC_TRNS_READ | SDHC_TRNS_BLK_CNT_EN,
+                   SDHC_STOP_TRANSMISSION);
+
+    return bytes_read;
+}
+
+void sdhci_write_cmd(QTestState *qts, uint64_t base_addr, const char *msg,
+                     size_t count, size_t blksize)
+{
+    sdhci_cmd_regs(qts, base_addr, blksize, 1, 0,
+                   SDHC_TRNS_MULTI | SDHC_TRNS_WRITE | SDHC_TRNS_BLK_CNT_EN,
+                   SDHC_WRITE_MULTIPLE_BLOCK | SDHC_CMD_DATA_PRESENT);
+
+    /* write to sd fifo_buffer */
+    write_fifo(qts, base_addr + SDHC_BDATA, msg, count);
+    fill_block(qts, base_addr + SDHC_BDATA, (blksize - count) / 4);
+
+    sdhci_cmd_regs(qts, base_addr, 0, 0, 0,
+                   SDHC_TRNS_MULTI | SDHC_TRNS_WRITE | SDHC_TRNS_BLK_CNT_EN,
+                   SDHC_STOP_TRANSMISSION);
+}
diff --git a/tests/qtest/libqos/sdhci-cmd.h b/tests/qtest/libqos/sdhci-cmd.h
new file mode 100644
index 0000000000..64763c5a2a
--- /dev/null
+++ b/tests/qtest/libqos/sdhci-cmd.h
@@ -0,0 +1,70 @@
+/*
+ * MMC Host Controller Commands
+ *
+ * Copyright (c) 2021 Google LLC
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
+#include "libqtest.h"
+
+/* more details at hw/sd/sdhci-internal.h */
+#define SDHC_BLKSIZE 0x04
+#define SDHC_BLKCNT 0x06
+#define SDHC_ARGUMENT 0x08
+#define SDHC_TRNMOD 0x0C
+#define SDHC_CMDREG 0x0E
+#define SDHC_BDATA 0x20
+#define SDHC_PRNSTS 0x24
+#define SDHC_BLKGAP 0x2A
+#define SDHC_CLKCON 0x2C
+#define SDHC_SWRST 0x2F
+#define SDHC_CAPAB 0x40
+#define SDHC_MAXCURR 0x48
+#define SDHC_HCVER 0xFE
+
+/* TRNSMOD Reg */
+#define SDHC_TRNS_BLK_CNT_EN 0x0002
+#define SDHC_TRNS_READ 0x0010
+#define SDHC_TRNS_WRITE 0x0000
+#define SDHC_TRNS_MULTI 0x0020
+
+/* CMD Reg */
+#define SDHC_CMD_DATA_PRESENT (1 << 5)
+#define SDHC_ALL_SEND_CID (2 << 8)
+#define SDHC_SEND_RELATIVE_ADDR (3 << 8)
+#define SDHC_SELECT_DESELECT_CARD (7 << 8)
+#define SDHC_SEND_CSD (9 << 8)
+#define SDHC_STOP_TRANSMISSION (12 << 8)
+#define SDHC_READ_MULTIPLE_BLOCK (18 << 8)
+#define SDHC_WRITE_MULTIPLE_BLOCK (25 << 8)
+#define SDHC_APP_CMD (55 << 8)
+
+/* SWRST Reg */
+#define SDHC_RESET_ALL 0x01
+
+/* CLKCTRL Reg */
+#define SDHC_CLOCK_INT_EN 0x0001
+#define SDHC_CLOCK_INT_STABLE 0x0002
+#define SDHC_CLOCK_SDCLK_EN (1 << 2)
+
+/* Set registers needed to send commands to SD */
+void sdhci_cmd_regs(QTestState *qts, uint64_t base_addr, uint16_t blksize,
+                    uint16_t blkcnt, uint32_t argument, uint16_t trnmod,
+                    uint16_t cmdreg);
+
+/* Read at most 1 block of SD using non-DMA  */
+ssize_t sdhci_read_cmd(QTestState *qts, uint64_t base_addr, char *msg,
+                       size_t count);
+
+/* Write at most 1 block of SD using non-DMA  */
+void sdhci_write_cmd(QTestState *qts, uint64_t base_addr, const char *msg,
+                     size_t count, size_t blksize);
-- 
2.33.0.153.gba50c8fa24-goog


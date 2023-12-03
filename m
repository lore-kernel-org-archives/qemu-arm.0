Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp2370184ejb;
        Sun, 3 Dec 2023 15:43:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGl4A5eJiZwl60m+kSlowjRKzHqq+Y4tTSxFFmPumWnZRFfboepKep0w168n604wNUmMesm
X-Received: by 2002:a05:620a:290a:b0:77f:402:f3b9 with SMTP id m10-20020a05620a290a00b0077f0402f3b9mr3533918qkp.55.1701647027424;
        Sun, 03 Dec 2023 15:43:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701647027; cv=none;
        d=google.com; s=arc-20160816;
        b=JB2EJCZJuPvRGHt8lRvWryxb/KIcJXFu7g/5vnXMhgXuqKlGdqb89c8ictfKpE3g2P
         7vYuS4/3kprJdnvfAj/GPi9zdDPFlc/9BAPmwGr6PvUFnzh/snuW4oL5ig4LQOVsnp03
         mOe/0HxlWEcoXX6c5C3wN4UgR0TAGGXZnXzpchtcAZ6QJDM1VDhLss109Gkh4O2l1fhs
         bLRcGAZ/u6t3wUZesH/+mQXHtsaX6TIdnuAiZU2sqbplfM4Xy5dNKlfXGoAlKYfzo+e2
         kQML2MbgHKoW/A7/psFdtm4zJXNn7FEyrg2sLJ+m6AyLkCL0lCZ0+omprODGh/k6wjNu
         AqTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=3uN6I/0hgCFTTQOiKlRUms5E1PdG9Gf9E46rNDtv+HU=;
        fh=1CWWAdYo81brd4jeYOgzhc83mN/ncVbe89i2SJzFql0=;
        b=j9qMWinK9ZiTWnaS5uoxO34S6Tzf5ZSmrP0i0vR04lf6EGP0N6mQAZuiODko/ydV0Z
         c6lPcHiC0hrg+JYJdRPCwkl1MWkb9AMp4gJKBK3lRtC7E/NbMHLlHZIocVj+RM+3TgYY
         3naAAZbJQbIeWj+wlQELODn6wSnTpmMuHraSmxsrldjxbPstfH2FeJQ6dMYH02tul3FV
         7XEI8Ehe3XFDtTY2OeekCRNoSwqNaV21G6sCTVQD711uQfe5qZ0uxGPTEhCMSb/akPmz
         re+8zXK8FGN5GB+SG/wcrRAN9wGAhVDyr9wF/Gbl820cPDR+B83hoRCihZqAIcsSMD1S
         w9nw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=TYTTltAh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y16-20020a05620a44d000b0077dabd477f6si8658021qkp.761.2023.12.03.15.43.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Dec 2023 15:43:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=TYTTltAh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r9w7c-0007kl-LC; Sun, 03 Dec 2023 18:43:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1r9w72-0007M3-TM; Sun, 03 Dec 2023 18:43:01 -0500
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1r9w6z-0002q0-R2; Sun, 03 Dec 2023 18:43:00 -0500
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-5d74186170fso11422387b3.3; 
 Sun, 03 Dec 2023 15:42:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701646976; x=1702251776; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3uN6I/0hgCFTTQOiKlRUms5E1PdG9Gf9E46rNDtv+HU=;
 b=TYTTltAhWN3OC15gragkDyMrji7TA1S3ZKQ1w+schVjUg+cfEY+iZyCcziIO43nKUU
 ZGbaxDhxRt8EWG4xxvDGB+YKtZO0yHrRb0mT1AWmYIHyDpyZJ2j1YqOWTWiQnmQfXJvY
 ikpNQCVKUV3gBlyibMHYwQ89d3pxgRMPIwsAFUXMAO3yyoveyI+2UWQpupa8My8EiCKZ
 ElBSXBGaHmGrOxcUiApSHqny7qb3GAVqMBNV0PnbXaXylLdNAt0nGYuwbMEW6b2/bNDn
 YSeo4sjNiLMJbWT8Sde0I5Q2DBPrBTA5O69iBNIdxXsyqj3pwiijYzl3SJFr1SVwMjpZ
 UESA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701646976; x=1702251776;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3uN6I/0hgCFTTQOiKlRUms5E1PdG9Gf9E46rNDtv+HU=;
 b=FdHonKbwOdzXKr1jlk7pTWBR0mnL4BWgKaal+XxqB1G8xwlaoXzofrAsiiWO7toQnN
 skMI8p1qeoYtqmfXOr/fhx/l+JSh1WkHwxEUUWAuIEWxc6EoP+zOP5OuDG24oNDtzTVN
 m76b7Hq0P62sgLEN87XKhT6MeX88GMPltsUOP+8o+H9GXLrc3KdvVKAXANd8yeNV2fSM
 eUsRlT8XzVxMx+p8ruTb0QksBTofF6ePWGoAQlIDN+WbaWohaF2wEM5IJWijVAXmrcxz
 Sp08/vifwRHSozY2SvsFKMbP/MFe4BGxCBclaR/Fa6Hp7seHyoMH4Yr6DznOhBnTN0a1
 K2Zw==
X-Gm-Message-State: AOJu0Yx6njYoU1DcEl1cCcE2VXrWjHY6+UzpPE9GVNgBcsc4GwGdN6I7
 6Eie1QOPmb5Jb2nvv40MTOp6XxLX68foYA==
X-Received: by 2002:a81:4c07:0:b0:5d7:1940:7d6e with SMTP id
 z7-20020a814c07000000b005d719407d6emr2015462ywa.69.1701646976246; 
 Sun, 03 Dec 2023 15:42:56 -0800 (PST)
Received: from localhost.localdomain ([201.206.180.22])
 by smtp.gmail.com with ESMTPSA id
 c126-20020a0dda84000000b005d718fff165sm1536299ywe.78.2023.12.03.15.42.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Dec 2023 15:42:56 -0800 (PST)
From: Sergey Kambalin <serg.oker@gmail.com>
X-Google-Original-From: Sergey Kambalin <sergey.kambalin@auriga.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	Sergey Kambalin <sergey.kambalin@auriga.com>
Subject: [PATCH v3 35/45] Add mailbox test stub
Date: Sun,  3 Dec 2023 17:42:03 -0600
Message-Id: <20231203234213.1366214-36-sergey.kambalin@auriga.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230726132512.149618-1-sergey.kambalin@auriga.com>
References: <20230726132512.149618-1-sergey.kambalin@auriga.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=serg.oker@gmail.com; helo=mail-yw1-x1133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-TUID: /LxNmsjzz9zM

Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
---
 include/hw/arm/bcm2838_peripherals.h |  2 +
 tests/qtest/bcm2838-mailbox.c        | 71 ++++++++++++++++++++++++++++
 tests/qtest/bcm2838-mailbox.h        | 46 ++++++++++++++++++
 tests/qtest/meson.build              |  1 +
 4 files changed, 120 insertions(+)
 create mode 100644 tests/qtest/bcm2838-mailbox.c
 create mode 100644 tests/qtest/bcm2838-mailbox.h

diff --git a/include/hw/arm/bcm2838_peripherals.h b/include/hw/arm/bcm2838_peripherals.h
index cdeb892f04..2b97e55048 100644
--- a/include/hw/arm/bcm2838_peripherals.h
+++ b/include/hw/arm/bcm2838_peripherals.h
@@ -56,6 +56,8 @@
 #define BCM2838_MPHI_OFFSET     0xb200
 #define BCM2838_MPHI_SIZE       0x200
 
+#define GENET_OFFSET            0x1580000
+
 #define TYPE_BCM2838_PERIPHERALS "bcm2838-peripherals"
 OBJECT_DECLARE_TYPE(BCM2838PeripheralState, BCM2838PeripheralClass,
                     BCM2838_PERIPHERALS)
diff --git a/tests/qtest/bcm2838-mailbox.c b/tests/qtest/bcm2838-mailbox.c
new file mode 100644
index 0000000000..2edc24e15e
--- /dev/null
+++ b/tests/qtest/bcm2838-mailbox.c
@@ -0,0 +1,71 @@
+/*
+ * Helper functions to work with BCM2838 mailbox via qtest interface.
+ *
+ * Copyright (c) 2023 Auriga LLC
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/registerfields.h"
+#include "libqtest-single.h"
+#include "bcm2838-mailbox.h"
+
+
+static uint32_t qtest_mbox0_read_reg32(QTestState *s, uint32_t offset)
+{
+    return qtest_readl(s, MBOX0_BASE + offset);
+}
+
+static void qtest_mbox1_write_reg32(QTestState *s, uint32_t offset, uint32_t value)
+{
+    return qtest_writel(s, MBOX1_BASE + offset, value);
+}
+
+static void qtest_mbox1_write(QTestState *s, uint8_t channel, uint32_t data)
+{
+    uint32_t reg;
+
+    reg = FIELD_DP32(reg, MBOX_WRITE_REG, CHANNEL, channel);
+    reg = FIELD_DP32(reg, MBOX_WRITE_REG, DATA, data);
+    qtest_mbox1_write_reg32(s, MBOX_REG_WRITE, reg);
+}
+
+int qtest_mbox0_has_data(QTestState *s) {
+    return !(qtest_mbox0_read_reg32(s, MBOX_REG_STATUS) & MBOX_READ_EMPTY);
+}
+
+int mbox0_has_data(void) {
+    return qtest_mbox0_has_data(global_qtest);
+}
+
+void qtest_mbox0_read_message(QTestState *s,
+                              uint8_t channel,
+                              void *msgbuf,
+                              size_t msgbuf_size)
+{
+    uint32_t reg;
+    uint32_t msgaddr;
+
+    g_assert(qtest_mbox0_has_data(s));
+    reg = qtest_mbox0_read_reg32(s, MBOX_REG_READ);
+    g_assert_cmphex(FIELD_EX32(reg, MBOX_WRITE_REG, CHANNEL), ==, channel);
+    msgaddr = FIELD_EX32(reg, MBOX_WRITE_REG, DATA) << 4;
+    qtest_memread(s, msgaddr, msgbuf, msgbuf_size);
+}
+
+void mbox0_read_message(uint8_t channel, void *msgbuf, size_t msgbuf_size) {
+    qtest_mbox0_read_message(global_qtest, channel, msgbuf, msgbuf_size);
+}
+
+void qtest_mbox1_write_message(QTestState *s, uint8_t channel, uint32_t msg_addr)
+{
+    qtest_mbox1_write(s, channel, msg_addr >> 4);
+}
+
+
+void mbox1_write_message(uint8_t channel, uint32_t msg_addr)
+{
+    qtest_mbox1_write_message(global_qtest, channel, msg_addr);
+}
diff --git a/tests/qtest/bcm2838-mailbox.h b/tests/qtest/bcm2838-mailbox.h
new file mode 100644
index 0000000000..1d02ca9c2c
--- /dev/null
+++ b/tests/qtest/bcm2838-mailbox.h
@@ -0,0 +1,46 @@
+/*
+ * Declarations for BCM2838 mailbox test.
+ *
+ * Copyright (c) 2023 Auriga LLC
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+
+REG32(MBOX_WRITE_REG, 0)
+FIELD(MBOX_WRITE_REG, CHANNEL, 0, 4)
+FIELD(MBOX_WRITE_REG, DATA, 4, 28)
+
+REG32(MBOX_SIZE_STAT, 0)
+FIELD(MBOX_WRITE_REG, SIZE, 0, 30)
+FIELD(MBOX_WRITE_REG, SUCCESS, 30, 1)
+
+typedef struct {
+    uint32_t size;
+    uint32_t req_resp_code;
+} MboxBufHeader;
+
+#define DECLARE_TAG_TYPE(TypeName, RequestValueType, ResponseValueType) \
+typedef struct {                                                        \
+    uint32_t id;                                                        \
+    uint32_t value_buffer_size;                                         \
+    union {                                                             \
+        struct {                                                        \
+            uint32_t zero;                                              \
+            RequestValueType value;                                     \
+        } request;                                                      \
+        struct {                                                        \
+            uint32_t size_stat;                                         \
+            ResponseValueType value;                                    \
+        } response;                                                     \
+    };                                                                  \
+} TypeName
+
+
+int mbox0_has_data(void);
+void mbox0_read_message(uint8_t channel, void *msgbuf, size_t msgbuf_size);
+void mbox1_write_message(uint8_t channel, uint32_t msg_addr);
+int qtest_mbox0_has_data(QTestState *s);
+void qtest_mbox0_read_message(QTestState *s, uint8_t channel, void *msgbuf, size_t msgbuf_size);
+void qtest_mbox1_write_message(QTestState *s, uint8_t channel, uint32_t msg_addr);
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 47dabf91d0..92eba5ac99 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -321,6 +321,7 @@ qtests = {
   'virtio-net-failover': files('migration-helpers.c'),
   'vmgenid-test': files('boot-sector.c', 'acpi-utils.c'),
   'netdev-socket': files('netdev-socket.c', '../unit/socket-helpers.c'),
+  'bcm2838-mbox-property-test' : files('bcm2838-mailbox.c'),
 }
 
 if vnc.found()
-- 
2.34.1


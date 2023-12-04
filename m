Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp2387630ejb;
        Sun, 3 Dec 2023 16:33:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG9xtMZUdEvI22Gq+/7o+55qVI/xC6jCXrPl1fehyXETTjmXRGAs1e+RugFUBVaYRDF2E9S
X-Received: by 2002:ac8:580b:0:b0:403:a8fa:b4f5 with SMTP id g11-20020ac8580b000000b00403a8fab4f5mr4915160qtg.4.1701650021313;
        Sun, 03 Dec 2023 16:33:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701650021; cv=none;
        d=google.com; s=arc-20160816;
        b=ubGjgFDT6fd+auxashrZ9/Y8d5PIJWEeELday1pLMDUw7yImRb0czoxZHOs6u8JiOD
         84i4YTv1GZX5X+K6hc0r6r/le+YLEMXshSvgonHwt0hUYQFaKMbP38a0OPqZ3qrKv9dJ
         BNIzOMGk1xQBPR6HVkPkDIBI1NM3qBmG8L1tgMWkmTcbcEBXl8HoZn9+LzXtxN2S6Thl
         a8fkhG4CY7oEE9Ipo4sUOfCpydi0B8e6V7eyLnFTt5aybWtVUVtVVXt/SyQnveyQ6H+V
         L0ZKFsFpS/XlIdfywqmKegG8myBa03fAVPjB7Dzl5ukUiRgxSvK9VxAK8EVKVk2PEeIn
         EODw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=3uN6I/0hgCFTTQOiKlRUms5E1PdG9Gf9E46rNDtv+HU=;
        fh=1CWWAdYo81brd4jeYOgzhc83mN/ncVbe89i2SJzFql0=;
        b=dBNWUcAhVNuAFt24CBavZAbq1Aq1YgqbrOa8YG21+pP24meKUXQLcaKDIsM5ldOTyy
         FWpk9lsQnN3Yp/09tVNy7ZFijn7bdS2NxrvgLh07uZxmGAsDEsYpz3P0zahM8jpqtXNy
         h6fALhBbPMn/8pBbZzSbAvJMyWxUxOdOGvzeg1CcpBSYR0tv/2EGktljtata+fQOfD/p
         RIiPDqv7VxhaPVX/zbwhe7lGUSd/VsM0cIUxt7d+W5I2DvKtF78k4JwH5029KT439k2B
         ojJrTp6jNjiS+3KZSgwGCA4/NdegfWP49eTYltVUe0o89Ukza+9TsLs4B7+ojm7t7m3D
         1EQg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="iHIoJI/v";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bt9-20020ac86909000000b004254853d3d4si3681723qtb.265.2023.12.03.16.33.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Dec 2023 16:33:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="iHIoJI/v";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r9woN-0006bk-3I; Sun, 03 Dec 2023 19:27:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1r9wnn-0004mN-N8; Sun, 03 Dec 2023 19:27:11 -0500
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1r9wnm-0000Hz-00; Sun, 03 Dec 2023 19:27:11 -0500
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-59b5484fbe6so44198147b3.1; 
 Sun, 03 Dec 2023 16:27:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701649628; x=1702254428; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3uN6I/0hgCFTTQOiKlRUms5E1PdG9Gf9E46rNDtv+HU=;
 b=iHIoJI/vWjWXZl6xrmg8Zkx88FdX813ngKtNX/4IQ35kdoz6V3sQl7nKp1d68sw4/5
 coOZ0R6dlXsyme23FT+OryqD1sXG29154us8RLPFBlpulAU1Z9tMJcKsI9bJXGuesUZI
 x2pgHDnXdgkXpyybTYm3ULtBUPfsuMuEiOK+ekL8wmyD4SJ0zzf6ONyEjID7+Vacf4B2
 iQ6qrbFa29qqFYiEGq1o/WTj4Pg/xKAn1pZNEC6wIAALYeiAVjeyXGH/iaXxdbB1oysb
 4DF92czCZYjLM7uMhNvjQS4Tr9ayZlA2OzjgflijBES0qwLJrYENHH3GAC2fPJs1Nzhe
 IRqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701649628; x=1702254428;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3uN6I/0hgCFTTQOiKlRUms5E1PdG9Gf9E46rNDtv+HU=;
 b=g5C9VGrOGsdkgSYJmyMf2J8/hunNWBjTqbIlQaVM8ENmTQJ9F+EOAk/0UFBM77U1y8
 FyZzwmayocEpcjCm7ME13v9bq+zr0XPYed1CzEUP+Csz8TW8K6LKU9d9k9simdGKSQlP
 nhjhkqzQTvhzLt0EeKGGvcn5AhRar+y6O3oz+6zg6sV7f6gCWoiWQp0ZAr6SSIU89svH
 vAq0zcI6fBMRUc6VYXuiu3xO0UmpWBMzNvGkXCwa47dRkmM5gnj0PuhgQcBFbGHqysDw
 3Za5q5/0ssQ6e0OnMGriVlgWzjVJL0qMvcL4YKDnjGERaXB294/8BcSHnpTu+DgramhZ
 mKdQ==
X-Gm-Message-State: AOJu0YyoWXZzVB6FD8Tf9GSDMDgouDwfHL1TjJH/U1RB5xCtSqNacS5y
 pWPHXO/91Ry/l+lrwAn3lHwEH/GB6+hQJA==
X-Received: by 2002:a81:8485:0:b0:5d7:1940:b381 with SMTP id
 u127-20020a818485000000b005d71940b381mr2853019ywf.77.1701649628354; 
 Sun, 03 Dec 2023 16:27:08 -0800 (PST)
Received: from localhost.localdomain ([201.206.180.22])
 by smtp.gmail.com with ESMTPSA id
 l63-20020a0de242000000b005d3e6ce07e7sm2443187ywe.6.2023.12.03.16.27.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Dec 2023 16:27:07 -0800 (PST)
From: Sergey Kambalin <serg.oker@gmail.com>
X-Google-Original-From: Sergey Kambalin <sergey.kambalin@auriga.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	Sergey Kambalin <sergey.kambalin@auriga.com>
Subject: [PATCH v3 35/45] Add mailbox test stub
Date: Sun,  3 Dec 2023 18:26:09 -0600
Message-Id: <20231204002619.1367044-36-sergey.kambalin@auriga.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231204002619.1367044-1-sergey.kambalin@auriga.com>
References: <20231204002619.1367044-1-sergey.kambalin@auriga.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=serg.oker@gmail.com; helo=mail-yw1-x1130.google.com
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
X-TUID: wUYZ+lTKPRei

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


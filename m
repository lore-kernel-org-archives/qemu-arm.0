Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65C0606A31A
	for <qemu-arm@archiver.kernel.org>; Mon, 26 Oct 2026 22:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=iVpwGsll
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xLSkY-0008VM-8z; Mon, 26 Oct 2026 18:01:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gessingate@gmail.com>)
 id 1xLSG8-0001OG-He
 for qemu-arm@nongnu.org; Mon, 26 Oct 2026 17:29:36 -0400
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gessingate@gmail.com>)
 id 1xLSG5-00078x-19
 for qemu-arm@nongnu.org; Mon, 26 Oct 2026 17:29:36 -0400
Received: by mail-qk1-x729.google.com with SMTP id
 af79cd13be357-93f2b8cf037so301179085a.1
 for <qemu-arm@nongnu.org>; Mon, 26 Oct 2026 14:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1793050172; x=1793654972; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=k2u1PWgZRU74VUdlNdbK+4RzaMJaUZF0s+sRC5nrzqM=;
 b=iVpwGsll8HFhYS2BETqOEXm/hN58PXkjFaYUwYd+eARTW3khId+yX6ND5+tR8xPHX3
 r4RFQ4mQukPMgvsDwtXW8xgpqlTOlPzvQ9ShcNokTYNbpm5Ii/wNjLimMAlfq0/+/UBe
 e+cvrY92ZJxLNSOlIl7uv8Dt/4JbO1rt0kbMAEtZRk5X/At1DgiTg0RMzEXJOiHUqN/s
 tawKKt+13ZRyO1B6EvebiPD5NbH+Q4G/vlVqTa+Rqp5ZDmqllchcWzWvsAx/1cbTrL4Y
 g8zAWgE1P0rmvbp9mstYJfEx7MTuW54/ZRBp717jk5OjVrSlS9weqEnYnnR1kd6URkFm
 53mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793050172; x=1793654972;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=k2u1PWgZRU74VUdlNdbK+4RzaMJaUZF0s+sRC5nrzqM=;
 b=PhnPZit+rttroPNwbzONwvA0A7M50gCPOFWnqcAKXtnvJVQR8IrYKmVJj6PVr6BJJT
 elMnyQQCndLfkTSFBpduT0pv9cZ9LVgMFnd2K1YXgjimSQ4gS79pljY3+Iw9vP8Cnwpe
 nGQkz1+TmRheZD32BuY6qunhEIqg/IBHdUUAOgMIXb5SjQodobsK0GSjRfFoZcd0Rvqx
 NV7/Q0WArBOhlwp8r5hjxw5Md5NugI2XUrdaJYyCXdyd4Y5pMt7zea7B3kNf3260vDrw
 nE+7cvg1W+IWikgqq5z0QFVWZBisUBUv68S9Ulwi2YhEdYd4SmJT8Mr3Ky3xC+WKUfnn
 Rq/g==
X-Forwarded-Encrypted: i=1;
 AKwUvByjViuYWz1fOLRk2ldUicykklqY9mQW3E32ZeIke8BS3RotwNt6Vcjq5DJapciO4hdkZuGt0tPfVg==@nongnu.org
X-Gm-Message-State: AFq9FYI64FSdQT/lky3xzEp8C1Nxd3TEyKoeU2wGmAyz/kwsIceyvUJS
 O9ac9iDaQdtnlg/z+uhZV6AnsICEe3uQ9GuU8YPxck0XDm5w91j0fvq2MZ01fkdUdV0=
X-Gm-Gg: AYBFou2mrvC1IJUor5N2C/+GOzTXxU+OVkdDb6jiWFjzpxpAYU3PNxKIrwDRhLsW8n1
 8b/G49dJPaOfkz8CDTvEi7E6Xl3GLP8ibNgbiD3HGQwOsHT++/KIpK6lQEiWFAY5XQXgXVntUrl
 Ig3XminNC7UkMboChfFQ8jGlHbOGRuPF+kkiYKtCyMALNzPqUsk0qy1JX+2cvszvQzEBLS/QkRk
 N7G4dcR6GZt82keYQkP9Gl31AvxrK04SO21YdF1afDpVrV54EnTg7Mhtt6VnOw0VC+E8kDqsXxD
 41GcmpClgW7bUqSqhwje8kuNZ0ID3whlefzj/ClwFPYhccD4IK5QUYLUJUmALfqPOqB7rdFy/Wd
 TqTvTO3tSn+D5f2G+KpcSguMJfTFom6loAy8ZIrE4qUy1aH8clBBbphfs/cCJwkmxNXrsGJEwv9
 VVXOzlIrAG2fLOEzQW1a4h/i9R9wRHlCEaexyrcybsPA40sThLdXkGZw8r/1Hn7wH6b/EIb3bzq
 /tUfQUcHCN96M6wsOJnfvDARnwG74h3NjP23HHBuYtYrXXBQPziI72SutrVQOBfr5dLHc18FHTm
 KQ4ZIGSH7L88/bq5jDhQTmFRd0VGiSYBsVtY
X-Received: by 2002:a05:620a:3184:b0:93f:1936:b1f2 with SMTP id
 af79cd13be357-940ef9ca117mr1184860385a.81.1793050171685; 
 Mon, 26 Oct 2026 14:29:31 -0700 (PDT)
Received: from [127.0.1.1] (95-24-99-141.broadband.corbina.ru. [95.24.99.141])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91c47c6f3bcsm85206376d6.29.2026.10.26.14.29.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2026 14:29:31 -0700 (PDT)
From: Timur Maksimov <gessingate@gmail.com>
Date: Tue, 27 Oct 2026 00:28:42 +0300
Subject: [PATCH 6/6] tests/qtest: Add cases for 32-bit Aspeed I2C controllers
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261027-aspeed-i2c-nonpkt-fix-v1-6-076cdde514f8@gmail.com>
References: <20261027-aspeed-i2c-nonpkt-fix-v1-0-076cdde514f8@gmail.com>
In-Reply-To: <20261027-aspeed-i2c-nonpkt-fix-v1-0-076cdde514f8@gmail.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 qemu-arm@nongnu.org, Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Timur Maksimov <gessingate@gmail.com>, 
 "Timur Maksimov gessingate"@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793050151; l=29581;
 i=gessingate@gmail.com; s=20261022; h=from:subject:message-id;
 bh=IGqwWMVP/Fh9vmbewkm2b2oJnbkUuvzNehKP8n0KSTo=;
 b=MyU0smi44FIFF0CuYmGN2u3GTXFisU+7Z4Vvou+omg+PgmnlYwmcv57uSr9gg1OSM36hQS2lh
 bFav38Un6zrAzfTWNlxfcs4OiH5qQX3PM82BGZ4bEfroxN6eEmFmImW
X-Developer-Key: i=gessingate@gmail.com; a=ed25519;
 pk=xF4NKIzSbKMdte17nQ66S/q9m/A2gu6GiEWc8ZnyJmo=
Received-SPF: pass client-ip=2607:f8b0:4864:20::729;
 envelope-from=gessingate@gmail.com; helo=mail-qk1-x729.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 26 Oct 2026 18:00:54 -0400
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Test all supported register and transfer modes.

Signed-off-by: Timur Maksimov gessingate@gmail.com
---
 tests/qtest/aspeed_i2c-test.c | 836 ++++++++++++++++++++++++++++++++++++++++++
 tests/qtest/meson.build       |   2 +
 2 files changed, 838 insertions(+)

diff --git a/tests/qtest/aspeed_i2c-test.c b/tests/qtest/aspeed_i2c-test.c
new file mode 100644
index 0000000000..7fb1debb56
--- /dev/null
+++ b/tests/qtest/aspeed_i2c-test.c
@@ -0,0 +1,836 @@
+/*
+ * QTest testcase for Aspeed I2C controller
+ *
+ * Copyright (c) 2026 Timur Maksimov <gessingate@gmail.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "libqtest-single.h"
+#include "hw/i2c/aspeed_i2c.h"
+
+typedef enum TestAspeedI2CMode {
+    TEST_I2C_MODE_OLD,
+    TEST_I2C_MODE_NEW,
+    TEST_I2C_MODE_PKT,
+} TestAspeedI2CMode;
+
+typedef enum TestAspeedMachine {
+    TEST_MACHINE_AST2400,
+    TEST_MACHINE_AST2500,
+    TEST_MACHINE_AST2600,
+} TestAspeedMachine;
+
+typedef struct TestData {
+    const char *name;
+    TestAspeedMachine machine;
+    TestAspeedI2CMode mode;
+} TestData;
+
+typedef struct TestFixture {
+    hwaddr base_addr;
+    hwaddr bus_offset;
+    int irq_no;
+    uint32_t pool_base;
+} TestFixture;
+
+static const uint8_t tx_data[] = {0x10, 0x11, 0x12};
+static const uint8_t rx_data[] = {0x30, 0x31, 0x32};
+
+#define DRAM_BASE      0x80000000
+#define DRAM_TX_OFFSET 0x1000
+#define DRAM_RX_OFFSET 0x2000
+
+static void aspeed_i2c_write(TestFixture *f, uint32_t offset, uint32_t val)
+{
+    qtest_writel(global_qtest, f->base_addr + f->bus_offset + offset, val);
+}
+
+static void aspeed_i2c_write_pool(TestFixture *f, uint32_t offset, uint8_t val)
+{
+    qtest_writeb(global_qtest, f->base_addr + f->pool_base + offset, val);
+}
+
+static void aspeed_i2c_write_dma(TestFixture *f, uint32_t offset, uint8_t val)
+{
+    qtest_writeb(global_qtest, DRAM_BASE + offset, val);
+}
+
+static uint32_t aspeed_i2c_read(TestFixture *f, uint32_t offset)
+{
+    return qtest_readl(global_qtest, f->base_addr + f->bus_offset + offset);
+}
+
+static uint8_t aspeed_i2c_read_pool(TestFixture *f, uint32_t offset)
+{
+    return qtest_readb(global_qtest, f->base_addr + f->pool_base + offset);
+}
+
+static uint8_t aspeed_i2c_read_dma(TestFixture *f, uint32_t offset)
+{
+    return qtest_readb(global_qtest, DRAM_BASE + offset);
+}
+
+static bool aspeed_i2c_irq(TestFixture *f)
+{
+    return qtest_get_irq(global_qtest, f->irq_no);
+}
+
+static uint32_t aspeed_i2c_ctrl_offset(const TestData *td)
+{
+    if (td->mode == TEST_I2C_MODE_OLD) {
+        return A_I2CD_FUN_CTRL;
+    } else {
+        return A_I2CC_FUN_CTRL;
+    }
+}
+
+static uint32_t aspeed_i2c_cmd_offset(const TestData *td)
+{
+    if (td->mode == TEST_I2C_MODE_OLD) {
+        return A_I2CD_CMD;
+    } else {
+        return A_I2CM_CMD;
+    }
+}
+
+
+static uint32_t aspeed_i2c_intr_ctrl_offset(const TestData *td)
+{
+    if (td->mode == TEST_I2C_MODE_OLD) {
+        return A_I2CD_INTR_CTRL;
+    } else {
+        return A_I2CM_INTR_CTRL;
+    }
+}
+
+static uint32_t aspeed_i2c_intr_sts_offset(const TestData *td)
+{
+    if (td->mode == TEST_I2C_MODE_OLD) {
+        return A_I2CD_INTR_STS;
+    } else {
+        return A_I2CM_INTR_STS;
+    }
+}
+
+static uint32_t aspeed_i2c_pool_ctrl_offset(const TestData *td)
+{
+    if (td->mode == TEST_I2C_MODE_OLD) {
+        return A_I2CD_POOL_CTRL;
+    } else {
+        return A_I2CC_POOL_CTRL;
+    }
+}
+
+static uint32_t aspeed_i2c_byte_buf_offset(const TestData *td)
+{
+    if (td->mode == TEST_I2C_MODE_OLD) {
+        return A_I2CD_BYTE_BUF;
+    } else {
+        return A_I2CC_MS_TXRX_BYTE_BUF;
+    }
+}
+
+static void aspeed_i2c_write_slave_addr(TestFixture *f, const TestData *td,
+                                        uint8_t addr)
+{
+    if (td->mode == TEST_I2C_MODE_OLD) {
+        aspeed_i2c_write(f, A_I2CD_DEV_ADDR, addr);
+    } else {
+        aspeed_i2c_write(f, A_I2CS_DEV_ADDR, addr);
+    }
+}
+
+static void aspeed_i2c_write_dma_addr(TestFixture *f, const TestData *td,
+                                     uint32_t val, bool rx)
+{
+    uint32_t offset;
+
+    if (td->mode == TEST_I2C_MODE_OLD) {
+        offset = A_I2CD_DMA_ADDR;
+    } else {
+        offset = rx ? A_I2CM_DMA_RX_ADDR : A_I2CM_DMA_TX_ADDR;
+    }
+    aspeed_i2c_write(f, offset, val);
+}
+
+static void aspeed_i2c_write_dma_len(TestFixture *f, const TestData *td,
+                                     uint16_t val, bool rx)
+{
+    uint32_t reg;
+
+    if (td->mode == TEST_I2C_MODE_OLD) {
+        aspeed_i2c_write(f, A_I2CD_DMA_LEN, val + 1);
+        return;
+    }
+
+    if (rx) {
+        reg = FIELD_DP32(0, I2CM_DMA_LEN, RX_BUF_LEN_W1T, 1);
+        reg = FIELD_DP32(reg, I2CM_DMA_LEN, RX_BUF_LEN, val);
+    } else {
+        reg = FIELD_DP32(0, I2CM_DMA_LEN, TX_BUF_LEN_W1T, 1);
+        reg = FIELD_DP32(reg, I2CM_DMA_LEN, TX_BUF_LEN, val);
+    }
+    aspeed_i2c_write(f, A_I2CM_DMA_LEN, reg);
+}
+
+static uint8_t aspeed_i2c_get_txstate(TestFixture *f, const TestData *td)
+{
+    uint32_t offset;
+
+    if (td->mode == TEST_I2C_MODE_OLD) {
+        offset = A_I2CD_CMD;
+    } else {
+        offset = A_I2CC_MS_TXRX_BYTE_BUF;
+    }
+    return SHARED_FIELD_EX32(aspeed_i2c_read(f, offset), TX_STATE);
+}
+
+static bool aspeed_i2c_get_busy_sts(TestFixture *f, const TestData *td)
+{
+    uint32_t offset;
+
+    if (td->mode == TEST_I2C_MODE_OLD) {
+        offset = A_I2CD_CMD;
+    } else {
+        offset = A_I2CC_MS_TXRX_BYTE_BUF;
+    }
+    return SHARED_FIELD_EX32(aspeed_i2c_read(f, offset), BUS_BUSY_STS);
+}
+
+/* Write a data byte in a byte mode transfer */
+static
+void aspeed_i2c_write_byte(TestFixture *f, const TestData *td, uint8_t val)
+{
+    aspeed_i2c_write(f, aspeed_i2c_byte_buf_offset(td),
+                     SHARED_FIELD_DP32(0, TX_BUF, val));
+}
+
+/* Read a data byte in a byte mode transfer */
+static uint8_t aspeed_i2c_read_byte(TestFixture *f, const TestData *td)
+{
+    uint32_t reg;
+
+    reg = aspeed_i2c_read(f, aspeed_i2c_byte_buf_offset(td));
+    return SHARED_FIELD_EX32(reg, RX_BUF);
+}
+
+static void aspeed_i2c_send_start(TestFixture *f, const TestData *td,
+                                  uint32_t cmd)
+{
+    cmd = SHARED_FIELD_DP32(cmd, M_START_CMD, 1);
+    aspeed_i2c_write(f, aspeed_i2c_cmd_offset(td), cmd);
+}
+
+static uint8_t qom_i2c_dummy_get_uint8(const char *prop)
+{
+    QDict *r;
+    uint8_t u;
+
+    r = qtest_qmp(global_qtest,
+                  "{ 'execute': 'qom-get', 'arguments': "
+                  "{ 'path': 'i2c-dummy', 'property': %s } }",
+                  prop);
+    u = qdict_get_uint(r, "return");
+    qobject_unref(r);
+    return u;
+}
+
+static void qom_i2c_dummy_set_uint8(const char *prop, uint8_t data)
+{
+    QDict *r;
+
+    r = qtest_qmp(global_qtest,
+                  "{ 'execute': 'qom-set', 'arguments': "
+                  "{ 'path': 'i2c-dummy', 'property': %s, 'value': %d } }",
+                  prop, data);
+    qobject_unref(r);
+}
+
+static void qom_i2c_dummy_set_rx(uint8_t idx, uint8_t data)
+{
+    g_autofree char *prop = g_strdup_printf("rx[%d]", idx);
+
+    qom_i2c_dummy_set_uint8(prop, data);
+}
+
+static uint8_t qom_i2c_dummy_get_tx(int8_t idx)
+{
+    g_autofree char *prop = g_strdup_printf("tx[%d]", idx);
+
+    return qom_i2c_dummy_get_uint8(prop);
+}
+
+#define I2C_ADDR_NACK  0x10
+#define I2C_ADDR_DUMMY 0x20
+#define I2C_ADDR_ECHO  0x30
+#define I2C_ADDR_SLAVE 0x40
+
+#define CHECK_I2C_IDLE(f, td) do {                                          \
+    g_assert_cmphex(aspeed_i2c_get_txstate(f, td), ==, I2CD_IDLE);          \
+    g_assert_false(aspeed_i2c_get_busy_sts(f, td));                         \
+    g_assert_cmphex(aspeed_i2c_read(f, aspeed_i2c_intr_sts_offset(td)), ==, \
+                    0);                                                     \
+    g_assert_false(aspeed_i2c_irq(f));                                      \
+} while (0)
+
+#define CHECK_I2C_INTR(f, td, reg) do {                                     \
+    g_assert_true(aspeed_i2c_irq(f));                                       \
+    g_assert_cmphex(aspeed_i2c_read(f, aspeed_i2c_intr_sts_offset(td)), ==, \
+                    reg);                                                   \
+} while (0)
+
+#define CHECK_I2C_BUS_ACTIVE(f, td) do {                                    \
+    g_assert_cmphex(aspeed_i2c_get_txstate(f, td), ==, I2CD_MACTIVE);       \
+    g_assert_true(aspeed_i2c_get_busy_sts(f, td));                          \
+} while (0)
+
+#define CHECK_I2C_ACK(f, td) do {                                           \
+    g_assert_cmphex(aspeed_i2c_get_txstate(f, td), ==, I2CD_MACTIVE);       \
+    g_assert_true(aspeed_i2c_get_busy_sts(f, td));                          \
+    CLEAR_I2C_INTR(f, td, SHARED_FIELD_DP32(0, TX_ACK, 1));                 \
+} while (0)
+
+#define CLEAR_I2C_INTR(f, td, reg) do {                                     \
+    CHECK_I2C_INTR(f, td, reg);                                             \
+    aspeed_i2c_write(f, aspeed_i2c_intr_sts_offset(td), reg);               \
+    g_assert_cmphex(aspeed_i2c_read(f, aspeed_i2c_intr_sts_offset(td)), ==, \
+                    0);                                                     \
+} while (0)
+
+#define SEND_I2C_STOP(f, td) do {                                           \
+    aspeed_i2c_write(f, aspeed_i2c_cmd_offset(td),                          \
+                     SHARED_FIELD_DP32(0, M_STOP_CMD, 1));                  \
+    CLEAR_I2C_INTR(f, td, SHARED_FIELD_DP32(0, NORMAL_STOP, 1));            \
+    CHECK_I2C_IDLE(f, td);                                                  \
+} while (0)
+
+#define CHECK_I2C_DUMMY_DEVICE() do {                                       \
+     for (uint8_t i = 0; i < ARRAY_SIZE(tx_data); i++) {                    \
+        g_assert_cmphex(qom_i2c_dummy_get_tx(i), ==, tx_data[i]);           \
+    }                                                                       \
+    g_assert_cmphex(qom_i2c_dummy_get_uint8("tx-pos"), ==,                  \
+                    ARRAY_SIZE(tx_data));                                   \
+    g_assert_cmphex(qom_i2c_dummy_get_uint8("rx-pos"), ==,                  \
+                    ARRAY_SIZE(rx_data));                                   \
+} while (0)
+
+static void aspeed_i2c_init(TestFixture *f, const TestData *td)
+{
+    uint32_t reg;
+
+    qtest_qmp(global_qtest, "{ 'execute': 'system_reset' }");
+
+    aspeed_i2c_write_slave_addr(f, td, I2C_ADDR_SLAVE);
+
+    reg = FIELD_DP32(0, I2C_CTRL_GLOBAL, SRAM_EN, 1);
+    if (td->mode != TEST_I2C_MODE_OLD) {
+        reg = FIELD_DP32(reg, I2C_CTRL_GLOBAL, REG_MODE, 1);
+    }
+    qtest_writel(global_qtest, f->base_addr + A_I2C_CTRL_GLOBAL, reg);
+
+    reg = SHARED_FIELD_DP32(0, MASTER_EN, 1);
+    reg = SHARED_FIELD_DP32(reg, SLAVE_EN, 1);
+    aspeed_i2c_write(f, aspeed_i2c_ctrl_offset(td), reg);
+
+    /* Enable all interrupts */
+    reg = SHARED_FIELD_DP32(0, TX_ACK, 1);
+    reg = SHARED_FIELD_DP32(reg, TX_NAK, 1);
+    reg = SHARED_FIELD_DP32(reg, RX_DONE, 1);
+    reg = SHARED_FIELD_DP32(reg, ARBIT_LOSS, 1);
+    reg = SHARED_FIELD_DP32(reg, NORMAL_STOP, 1);
+    reg = SHARED_FIELD_DP32(reg, ABNORMAL, 1);
+    if (td->mode != TEST_I2C_MODE_OLD) {
+        reg = FIELD_DP32(reg, I2CM_INTR_STS, PKT_CMD_DONE, 1);
+        reg = FIELD_DP32(reg, I2CM_INTR_STS, PKT_CMD_FAIL, 1);
+    }
+    aspeed_i2c_write(f, aspeed_i2c_intr_ctrl_offset(td), reg);
+
+    for (uint8_t i = 0; i < ARRAY_SIZE(rx_data); i++) {
+        qom_i2c_dummy_set_rx(i, rx_data[i]);
+    }
+}
+
+static uint32_t aspeed_i2c_pkt_set_addr_cmd(const TestData *td, uint8_t addr)
+{
+    uint32_t cmd;
+
+    cmd = FIELD_DP32(0, I2CM_CMD, PKT_OP_EN, 1);
+    cmd = FIELD_DP32(cmd, I2CM_CMD, PKT_DEV_ADDR, addr);
+    return cmd;
+}
+
+static
+uint32_t aspeed_i2c_byte_set_addr_cmd(TestFixture *f, const TestData *td,
+                                      uint8_t addr, bool is_recv)
+{
+    if (td->mode == TEST_I2C_MODE_PKT) {
+        return aspeed_i2c_pkt_set_addr_cmd(td, addr);
+    } else {
+        aspeed_i2c_write_byte(f, td, addr << 1 | (is_recv ? 1 : 0));
+        return SHARED_FIELD_DP32(0, M_TX_CMD, 1);
+    }
+}
+
+static
+uint32_t aspeed_i2c_buf_set_addr_cmd(TestFixture *f, const TestData *td,
+                                     uint8_t addr, bool is_recv)
+{
+    if (td->mode == TEST_I2C_MODE_PKT) {
+        return aspeed_i2c_pkt_set_addr_cmd(td, addr);
+    } else {
+        aspeed_i2c_write_pool(f, 0, addr << 1 | (is_recv ? 1 : 0));
+        return SHARED_FIELD_DP32(0, M_TX_CMD, 1);
+    }
+}
+
+static
+uint32_t aspeed_i2c_dma_set_addr_cmd(TestFixture *f, const TestData *td,
+                                     uint8_t addr, bool is_recv)
+{
+    if (td->mode == TEST_I2C_MODE_PKT) {
+        return aspeed_i2c_pkt_set_addr_cmd(td, addr);
+    } else {
+        aspeed_i2c_write_dma(f, DRAM_TX_OFFSET, addr << 1 | (is_recv ? 1 : 0));
+        return SHARED_FIELD_DP32(0, M_TX_CMD, 1);
+    }
+}
+
+
+static uint32_t aspeed_i2c_send_addr_status(TestFixture *f, const TestData *td)
+{
+    uint32_t sts;
+
+    if (td->mode == TEST_I2C_MODE_PKT) {
+        sts = FIELD_DP32(0, I2CM_INTR_STS, PKT_CMD_DONE, 1);
+    } else {
+        sts = SHARED_FIELD_DP32(0, TX_ACK, 1);
+    }
+    return sts;
+}
+
+/*
+ * Send an address byte to a non existing device.
+ * The TX_NAK interrupt should be raised.
+ */
+static void test_nack(TestFixture *f, gconstpointer p_data)
+{
+    const TestData *td = (const TestData *)p_data;
+    uint32_t sts, cmd;
+
+    cmd = aspeed_i2c_byte_set_addr_cmd(f, td, I2C_ADDR_NACK, false);
+    aspeed_i2c_send_start(f, td, cmd);
+
+    g_assert_cmphex(aspeed_i2c_get_txstate(f, td), ==, I2CD_MSTART);
+    g_assert_false(aspeed_i2c_get_busy_sts(f, td));
+    sts = SHARED_FIELD_DP32(0, TX_NAK, 1);
+    if (td->mode == TEST_I2C_MODE_PKT) {
+        sts = FIELD_DP32(sts, I2CM_INTR_STS, PKT_CMD_FAIL, 1);
+        sts = FIELD_DP32(sts, I2CM_INTR_STS, PKT_CMD_DONE, 1);
+    }
+    CLEAR_I2C_INTR(f, td, sts);
+
+    aspeed_i2c_write(f, aspeed_i2c_cmd_offset(td),
+                     SHARED_FIELD_DP32(0, M_STOP_CMD, 1));
+    CLEAR_I2C_INTR(f, td, SHARED_FIELD_DP32(0, NORMAL_STOP, 1));
+    CHECK_I2C_IDLE(f, td);
+    qtest_hmp(global_qtest, "system_reset");
+}
+
+
+static void test_dummy_byte(TestFixture *f, gconstpointer p_data)
+{
+    const TestData *td = (const TestData *)p_data;
+    uint32_t cmd, sts;
+    bool pkt_mode = td->mode == TEST_I2C_MODE_PKT;
+
+    /* Write device address (Write) */
+    cmd = aspeed_i2c_byte_set_addr_cmd(f, td, I2C_ADDR_DUMMY, false);
+    aspeed_i2c_send_start(f, td, cmd);
+    CHECK_I2C_BUS_ACTIVE(f, td);
+    CLEAR_I2C_INTR(f, td, aspeed_i2c_send_addr_status(f, td));
+
+    /* Write data */
+    sts = SHARED_FIELD_DP32(0, TX_ACK, 1);
+    if (pkt_mode) {
+        sts = FIELD_DP32(sts, I2CM_INTR_STS, PKT_CMD_DONE, 1);
+        cmd = aspeed_i2c_pkt_set_addr_cmd(td, I2C_ADDR_DUMMY);
+    } else {
+        cmd = 0;
+    }
+    cmd = SHARED_FIELD_DP32(cmd, M_TX_CMD, 1);
+    for (uint8_t i = 0; i < ARRAY_SIZE(tx_data); i++) {
+        aspeed_i2c_write_byte(f, td, tx_data[i]);
+        aspeed_i2c_write(f, aspeed_i2c_cmd_offset(td), cmd);
+        CHECK_I2C_BUS_ACTIVE(f, td);
+        CLEAR_I2C_INTR(f, td, sts);
+    }
+
+    /* Read data */
+    cmd = aspeed_i2c_byte_set_addr_cmd(f, td, I2C_ADDR_DUMMY, true);
+    cmd = SHARED_FIELD_DP32(cmd, M_RX_CMD, 1);
+    cmd = SHARED_FIELD_DP32(cmd, M_START_CMD, 1);
+    sts = aspeed_i2c_send_addr_status(f, td);
+
+    for (uint8_t i = 0; i < ARRAY_SIZE(rx_data); i++) {
+        cmd = SHARED_FIELD_DP32(cmd, M_RX_CMD, 1);
+        if (i == ARRAY_SIZE(rx_data) - 1) {
+            cmd = SHARED_FIELD_DP32(cmd, M_S_RX_CMD_LAST, 1);
+        }
+        aspeed_i2c_write(f, aspeed_i2c_cmd_offset(td), cmd);
+        CHECK_I2C_BUS_ACTIVE(f, td);
+        sts = SHARED_FIELD_DP32(sts, RX_DONE, 1);
+        if (pkt_mode) {
+            sts = FIELD_DP32(sts, I2CM_INTR_STS, PKT_CMD_DONE, 1);
+            cmd = aspeed_i2c_pkt_set_addr_cmd(td, I2C_ADDR_DUMMY);
+        } else {
+            cmd = 0;
+        }
+        CLEAR_I2C_INTR(f, td, sts);
+        g_assert_cmphex(aspeed_i2c_read_byte(f, td), ==, rx_data[i]);
+        sts = 0;
+    }
+
+    SEND_I2C_STOP(f, td);
+    CHECK_I2C_DUMMY_DEVICE();
+    qtest_hmp(global_qtest, "system_reset");
+}
+
+static void test_dummy_buf(TestFixture *f, gconstpointer p_data)
+{
+    const TestData *td = (const TestData *)p_data;
+    uint32_t cmd, sts, pool_ctrl;
+    bool pkt_mode = td->mode == TEST_I2C_MODE_PKT;
+
+    /* Write data with device address */
+    for (uint8_t i = 0; i < ARRAY_SIZE(tx_data); i++) {
+        aspeed_i2c_write_pool(f, i + (pkt_mode ? 0 : 1), tx_data[i]);
+    }
+    pool_ctrl = SHARED_FIELD_DP32(0, TX_COUNT,
+                                  ARRAY_SIZE(tx_data) - (pkt_mode ? 1 : 0));
+    aspeed_i2c_write(f, aspeed_i2c_pool_ctrl_offset(td), pool_ctrl);
+    cmd = aspeed_i2c_buf_set_addr_cmd(f, td, I2C_ADDR_DUMMY, false);
+    cmd = SHARED_FIELD_DP32(cmd, M_START_CMD, 1);
+    cmd = SHARED_FIELD_DP32(cmd, M_TX_CMD, 1);
+    cmd = SHARED_FIELD_DP32(cmd, TX_BUFF_EN, 1);
+    sts = SHARED_FIELD_DP32(0, TX_ACK, 1);
+    if (pkt_mode) {
+        sts = FIELD_DP32(sts, I2CM_INTR_STS, PKT_CMD_DONE, 1);
+    }
+    aspeed_i2c_write(f, aspeed_i2c_cmd_offset(td), cmd);
+    CHECK_I2C_BUS_ACTIVE(f, td);
+    CLEAR_I2C_INTR(f, td, sts);
+
+    /* Write device address (Read) in non packet mde */
+    if (pkt_mode) {
+        cmd = aspeed_i2c_pkt_set_addr_cmd(td, I2C_ADDR_DUMMY);
+        cmd = SHARED_FIELD_DP32(cmd, M_START_CMD, 1);
+    } else {
+        aspeed_i2c_write_byte(f, td, (I2C_ADDR_DUMMY << 1) | 1);
+        aspeed_i2c_send_start(f, td, SHARED_FIELD_DP32(0, M_TX_CMD, 1));
+        CHECK_I2C_BUS_ACTIVE(f, td);
+        CLEAR_I2C_INTR(f, td, aspeed_i2c_send_addr_status(f, td));
+        cmd = 0;
+    }
+
+    /* Read data */
+    pool_ctrl = SHARED_FIELD_DP32(0, RX_SIZE,
+                                  ARRAY_SIZE(rx_data) - 1);
+    aspeed_i2c_write(f, aspeed_i2c_pool_ctrl_offset(td), pool_ctrl);
+    cmd = SHARED_FIELD_DP32(cmd, M_RX_CMD, 1);
+    cmd = SHARED_FIELD_DP32(cmd, M_S_RX_CMD_LAST, 1);
+    cmd = SHARED_FIELD_DP32(cmd, RX_BUFF_EN, 1);
+    sts = SHARED_FIELD_DP32(0, RX_DONE, 1);
+    if (pkt_mode) {
+        sts = FIELD_DP32(sts, I2CM_INTR_STS, PKT_CMD_DONE, 1);
+    }
+    aspeed_i2c_write(f, aspeed_i2c_cmd_offset(td), cmd);
+    CHECK_I2C_BUS_ACTIVE(f, td);
+    CLEAR_I2C_INTR(f, td, sts);
+    for (uint8_t i = 0; i < ARRAY_SIZE(rx_data); i++) {
+        g_assert_cmphex(aspeed_i2c_read_pool(f, i), ==, rx_data[i]);
+    }
+
+    SEND_I2C_STOP(f, td);
+    CHECK_I2C_DUMMY_DEVICE();
+    qtest_hmp(global_qtest, "system_reset");
+}
+
+static void test_dummy_dma(TestFixture *f, gconstpointer p_data)
+{
+    const TestData *td = (const TestData *)p_data;
+    uint32_t cmd, sts;
+    bool pkt_mode = td->mode == TEST_I2C_MODE_PKT;
+
+    /* Write data with device address*/
+    for (uint8_t i = 0; i < ARRAY_SIZE(tx_data); i++) {
+        aspeed_i2c_write_dma(f, DRAM_TX_OFFSET + (pkt_mode ? 0 : 1) + i,
+                             tx_data[i]);
+    }
+    aspeed_i2c_write_dma_addr(f, td, DRAM_TX_OFFSET, false);
+    aspeed_i2c_write_dma_len(f, td,
+                             ARRAY_SIZE(tx_data) - (pkt_mode ? 1 : 0), false);
+    cmd = aspeed_i2c_dma_set_addr_cmd(f, td, I2C_ADDR_DUMMY, false);
+
+    cmd = SHARED_FIELD_DP32(cmd, M_START_CMD, 1);
+    cmd = SHARED_FIELD_DP32(cmd, M_TX_CMD, 1);
+    cmd = SHARED_FIELD_DP32(cmd, TX_DMA_EN, 1);
+    sts = SHARED_FIELD_DP32(0, TX_ACK, 1);
+    if (pkt_mode) {
+        sts = FIELD_DP32(sts, I2CM_INTR_STS, PKT_CMD_DONE, 1);
+    }
+    aspeed_i2c_write(f, aspeed_i2c_cmd_offset(td), cmd);
+    CHECK_I2C_BUS_ACTIVE(f, td);
+    CLEAR_I2C_INTR(f, td, sts);
+
+    /* Write device address (Read) in non packet mode */
+    if (pkt_mode) {
+        cmd = aspeed_i2c_pkt_set_addr_cmd(td, I2C_ADDR_DUMMY);
+        cmd = SHARED_FIELD_DP32(cmd, M_START_CMD, 1);
+    } else {
+        aspeed_i2c_write_byte(f, td, (I2C_ADDR_DUMMY << 1) | 1);
+        aspeed_i2c_send_start(f, td, SHARED_FIELD_DP32(0, M_TX_CMD, 1));
+        CHECK_I2C_BUS_ACTIVE(f, td);
+        CLEAR_I2C_INTR(f, td, aspeed_i2c_send_addr_status(f, td));
+        cmd = 0;
+    }
+
+    /* Read data */
+    aspeed_i2c_write_dma_addr(f, td, DRAM_RX_OFFSET, true);
+    aspeed_i2c_write_dma_len(f, td, ARRAY_SIZE(rx_data) - 1, true);
+    cmd = SHARED_FIELD_DP32(cmd, M_RX_CMD, 1);
+    cmd = SHARED_FIELD_DP32(cmd, M_S_RX_CMD_LAST, 1);
+    cmd = SHARED_FIELD_DP32(cmd, RX_DMA_EN, 1);
+    sts = SHARED_FIELD_DP32(0, RX_DONE, 1);
+    if (pkt_mode) {
+        sts = FIELD_DP32(sts, I2CM_INTR_STS, PKT_CMD_DONE, 1);
+    }
+    aspeed_i2c_write(f, aspeed_i2c_cmd_offset(td), cmd);
+    CHECK_I2C_BUS_ACTIVE(f, td);
+    CLEAR_I2C_INTR(f, td, sts);
+    for (uint8_t i = 0; i < ARRAY_SIZE(rx_data); i++) {
+        g_assert_cmphex(aspeed_i2c_read_dma(f, DRAM_RX_OFFSET + i), ==,
+                        rx_data[i]);
+    }
+
+    SEND_I2C_STOP(f, td);
+    CHECK_I2C_DUMMY_DEVICE();
+    qtest_hmp(global_qtest, "system_reset");
+}
+
+static void test_slave(TestFixture *f, gconstpointer p_data)
+{
+    const TestData *td = (const TestData *)p_data;
+    uint32_t cmd, sts, tmp;
+    bool pkt_mode = td->mode == TEST_I2C_MODE_PKT;
+    uint8_t offset = pkt_mode ? 0 : 1;
+
+    aspeed_i2c_write_pool(f, offset + 0, I2C_ADDR_SLAVE);
+    aspeed_i2c_write_pool(f, offset + 1, tx_data[0]);
+    aspeed_i2c_write_pool(f, offset + 2, tx_data[1]);
+
+    tmp = SHARED_FIELD_DP32(0, TX_COUNT, pkt_mode ? 2 : 3);
+    aspeed_i2c_write(f, aspeed_i2c_pool_ctrl_offset(td), tmp);
+
+    cmd = aspeed_i2c_buf_set_addr_cmd(f, td, I2C_ADDR_ECHO, false);
+    cmd = SHARED_FIELD_DP32(cmd, M_START_CMD, 1);
+    cmd = SHARED_FIELD_DP32(cmd, M_TX_CMD, 1);
+    cmd = SHARED_FIELD_DP32(cmd, TX_BUFF_EN, 1);
+    sts = SHARED_FIELD_DP32(0, TX_ACK, 1);
+    if (pkt_mode) {
+        sts = FIELD_DP32(sts, I2CM_INTR_STS, PKT_CMD_DONE, 1);
+    }
+    aspeed_i2c_write(f, aspeed_i2c_cmd_offset(td), cmd);
+    CHECK_I2C_BUS_ACTIVE(f, td);
+    CLEAR_I2C_INTR(f, td, sts);
+
+    /* Send stop and handle i2c-echo response as a slave */
+    if (td->mode == TEST_I2C_MODE_OLD) {
+        aspeed_i2c_write(f, aspeed_i2c_cmd_offset(td),
+                        SHARED_FIELD_DP32(0, M_STOP_CMD, 1));
+        clock_step(1);
+        g_assert_cmphex(aspeed_i2c_read_byte(f, td), ==, I2C_ADDR_SLAVE << 1);
+        sts = SHARED_FIELD_DP32(0, NORMAL_STOP, 1);
+        sts = SHARED_FIELD_DP32(sts, RX_DONE, 1);
+        sts = FIELD_DP32(sts, I2CD_INTR_STS, SLAVE_ADDR_RX_MATCH, 1);
+        CHECK_I2C_INTR(f, td, sts);
+        aspeed_i2c_write(f, aspeed_i2c_intr_sts_offset(td), sts);
+
+        g_assert_cmphex(aspeed_i2c_read_byte(f, td), ==, tx_data[0]);
+        sts = SHARED_FIELD_DP32(0, RX_DONE, 1);
+        CHECK_I2C_INTR(f, td, sts);
+        aspeed_i2c_write(f, aspeed_i2c_intr_sts_offset(td), sts);
+
+        g_assert_cmphex(aspeed_i2c_read_byte(f, td), ==, tx_data[1]);
+        sts = SHARED_FIELD_DP32(0, RX_DONE, 1);
+        CHECK_I2C_INTR(f, td, sts);
+        aspeed_i2c_write(f, aspeed_i2c_intr_sts_offset(td), sts);
+    } else {
+        aspeed_i2c_write(f, A_I2CS_DMA_RX_ADDR, DRAM_RX_OFFSET);
+        tmp = SHARED_FIELD_DP32(0, RX_DMA_EN, 1);
+        aspeed_i2c_write(f, A_I2CS_CMD, tmp);
+
+        aspeed_i2c_write(f, aspeed_i2c_cmd_offset(td),
+                        SHARED_FIELD_DP32(0, M_STOP_CMD, 1));
+        clock_step(1);
+
+        tmp = FIELD_DP32(0, I2CS_DMA_LEN_STS, RX_LEN, 2);
+        g_assert_cmphex(aspeed_i2c_read(f, A_I2CS_DMA_LEN_STS), ==, tmp);
+        for (uint8_t i = 0; i < 2; i++) {
+            g_assert_cmphex(aspeed_i2c_read_dma(f, DRAM_RX_OFFSET + i), ==,
+                            tx_data[i]);
+        }
+    }
+
+    sts = SHARED_FIELD_DP32(0, NORMAL_STOP, 1);
+    CLEAR_I2C_INTR(f, td, sts);
+    CHECK_I2C_IDLE(f, td);
+
+    qtest_hmp(global_qtest, "system_reset");
+}
+
+static void aspeed_i2c_init_fixture(TestFixture *fixture, const TestData *td)
+{
+    switch (td->machine) {
+    case TEST_MACHINE_AST2400:
+        fixture->base_addr = 0x1E78A000;
+        fixture->bus_offset = 0x40;
+        fixture->irq_no = 12;
+        fixture->pool_base = 0x800;
+        break;
+    case TEST_MACHINE_AST2500:
+        fixture->base_addr = 0x1E78A000;
+        fixture->bus_offset = 0x40;
+        fixture->irq_no = 12;
+        fixture->pool_base = 0x200;
+        break;
+    case TEST_MACHINE_AST2600:
+        fixture->base_addr = 0x1E78A000;
+        fixture->bus_offset = 0x80;
+        fixture->irq_no = 110;
+        fixture->pool_base = 0xC00;
+        break;
+    default:
+        return;
+    }
+}
+
+static void aspeed_i2c_init_test(TestFixture *fixture, const TestData *td)
+{
+    aspeed_i2c_init(fixture, td);
+    CHECK_I2C_IDLE(fixture, td);
+}
+
+static void aspeed_i2c_init_new_machine(TestFixture *fixture,
+                                        gconstpointer p_data)
+{
+    const TestData *td = (const TestData *)p_data;
+    const char *machine;
+    const char *irq_dev;
+
+    aspeed_i2c_init_fixture(fixture, td);
+
+    if (global_qtest) {
+        qtest_quit(global_qtest);
+    }
+
+    switch (td->machine) {
+    case TEST_MACHINE_AST2400:
+        machine = "palmetto-bmc";
+        irq_dev = "/machine/soc/vic";
+        break;
+    case TEST_MACHINE_AST2500:
+        machine = "ast2500-evb";
+        irq_dev = "/machine/soc/vic";
+        break;
+    case TEST_MACHINE_AST2600:
+        machine = "ast2600-evb";
+        irq_dev = "/machine/soc/a7mpcore/gic";
+        break;
+    default:
+        g_test_fail();
+        return;
+    }
+
+    global_qtest = qtest_initf(
+        "-machine %s -nographic "
+        "-device i2c-echo,id=i2c-echo,bus=aspeed.i2c.bus.0,address=%d "
+        "-device i2c-dummy-device,id=i2c-dummy,bus=aspeed.i2c.bus.0,address=%d",
+        machine, I2C_ADDR_ECHO, I2C_ADDR_DUMMY);
+    qtest_irq_intercept_in(global_qtest, irq_dev);
+
+    aspeed_i2c_init_test(fixture, td);
+}
+
+static void aspeed_i2c_init_machine(TestFixture *fixture,
+                                    gconstpointer p_data)
+{
+    const TestData *td = (const TestData *)p_data;
+
+    aspeed_i2c_init_fixture(fixture, td);
+    aspeed_i2c_init_test(fixture, td);
+}
+
+static void add_test(const TestData *td, const char *name,
+                     void (*func)(TestFixture *, const void *),
+                     bool setup)
+{
+    g_autofree char *test_name;
+
+    test_name = g_strdup_printf("%s/%s", td->name, name);
+
+    qtest_add(test_name, TestFixture, td,
+              setup ? aspeed_i2c_init_new_machine : aspeed_i2c_init_machine,
+              func, NULL);
+}
+
+#define ADD_TEST(td, test, new) add_test(td, #test, test_##test, new)
+
+static const TestData test_data[] = {
+    {
+        .name = "ast2400",
+        .machine = TEST_MACHINE_AST2400,
+    },
+    {
+        .name = "ast2500",
+        .machine = TEST_MACHINE_AST2500,
+    },
+    {
+        .name = "ast2600",
+        .machine = TEST_MACHINE_AST2600,
+    },
+    {
+        .name = "ast2600-new",
+        .machine = TEST_MACHINE_AST2600,
+        .mode = TEST_I2C_MODE_NEW,
+    },
+    {
+        .name = "ast2600-packet",
+        .machine = TEST_MACHINE_AST2600,
+        .mode = TEST_I2C_MODE_PKT,
+    },
+};
+
+int main(int argc, char **argv)
+{
+    int ret;
+    bool setup;
+
+    g_test_init(&argc, &argv, NULL);
+
+    for (int i = 0; i < ARRAY_SIZE(test_data); i++) {
+        setup = i == 0 || test_data[i].machine != test_data[i - 1].machine;
+        ADD_TEST(&test_data[i], nack, setup);
+        ADD_TEST(&test_data[i], dummy_byte, false);
+        ADD_TEST(&test_data[i], dummy_buf, false);
+        if (test_data[i].machine != TEST_MACHINE_AST2400) {
+            ADD_TEST(&test_data[i], dummy_dma, false);
+        }
+        ADD_TEST(&test_data[i], slave, false);
+    }
+
+    ret = g_test_run();
+    qtest_quit(global_qtest);
+    return ret;
+}
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 46685d6d46..f4d328ee4e 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -233,12 +233,14 @@ qtests_aspeed = \
   ['aspeed-acry-test',
    'aspeed_gpio-test',
    'aspeed_hace-test',
+   'aspeed_i2c-test',
    'aspeed-sbc-test',
    'aspeed_scu-test',
    'aspeed_smc-test']
 qtests_aspeed64 = \
   ['ast2700-gpio-test',
    'ast2700-hace-test',
+   'aspeed_i2c-test',
    'ast2700-sgpio-test',
    'ast2700-smc-test']
 

-- 
2.53.0



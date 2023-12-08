Received: by 2002:a17:906:fa94:b0:a1c:d2de:9065 with SMTP id lt20csp2045171ejb;
        Thu, 7 Dec 2023 18:35:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGZrovFGxhJejU4oH6URYd7XJGWclZkTcFX/ug4i6G56frQKh8O0JPM9Id8SoB5647/rUcL
X-Received: by 2002:a05:620a:3b0a:b0:77e:fdcb:780f with SMTP id tl10-20020a05620a3b0a00b0077efdcb780fmr2220519qkn.68.1702002944325;
        Thu, 07 Dec 2023 18:35:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702002944; cv=none;
        d=google.com; s=arc-20160816;
        b=r5fdPlgKD0AlvB9+9VgfGsNsRwHNoQDkTfk7xA0bLUF68tVDrNgn5ghYyQXqAFjUfX
         hiwiuXuEmsIeQPuo+/fNF7A9Jx1v5eHnqwuOhk/iIEM7DmEB13l3VnPQCAVJGWU4ZIPk
         o5HzG1f94xOTPoM6PssNnBO3qaNYEQXnXSoHggqdHId1lFSheDsfeqXI50SF/eaMJsG5
         CUWk7ChVQ52J+01r4b7oKDO6Ix1AUOtOXAqHLGpSMux6IStwq67b58mmb2kZvF7OY6IV
         iN/8Q/yUr1AlriMttEvqo7b/dB7dp08/AdYR1o43ikvlvYg/Xt5NOvVEW/pYgT+Luyci
         YQYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=KEcoat7SC4jN+C9La2rhXqQ9NFVHbLoJsMPiUtjdyFI=;
        fh=1CWWAdYo81brd4jeYOgzhc83mN/ncVbe89i2SJzFql0=;
        b=Ei1NAMldTJAXUW5ly/gzUj4Lo36UvNbLlQsgoLNW2sK0LnUlivVoyfd6X77UotIhUF
         7SbK5kRDkc6xStREU2aQaJVlluXXxSX9/If/BZNFYAkLt51/1GFWBYAJ0LW6iKerSnoY
         SRTPQMKjc0jQb3DRNl0oqbtIuaUzbVzSyfnkHRlQgknGKf2SnLkPSts4TkZhgbGhUrEq
         oeUbSpZkJvSxLR16i7WS6alTuNZwZ4PdzwALSZehSOrY8Imh69iQyyxsrvBfXy03i1M6
         z4kCNWbav2AMPXGbUpiQMGfV/fArS1yMupH50ZoZyoOTDGio2bAL6NO1rF/y8bTOMBso
         axgA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=D26kzPRT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cx22-20020a05620a51d600b0077dcee13716si1056970qkb.604.2023.12.07.18.35.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Dec 2023 18:35:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=D26kzPRT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rBQh5-0001Q9-Ra; Thu, 07 Dec 2023 21:34:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1rBQh3-00019P-Pm; Thu, 07 Dec 2023 21:34:21 -0500
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1rBQh1-0002qy-0B; Thu, 07 Dec 2023 21:34:21 -0500
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2ca02def690so18920231fa.3; 
 Thu, 07 Dec 2023 18:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702002856; x=1702607656; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KEcoat7SC4jN+C9La2rhXqQ9NFVHbLoJsMPiUtjdyFI=;
 b=D26kzPRTH/QH4g0OnvL0Nr4AF1DPfWJXDf2EzKtWAW0DThTDbeZlA1tCLuIhDrs6iW
 Lt9PwVmf4ALZfK/WC2+gtaPhxd+oSyia3XNIY8UIG6Mfxa9w7Ja0gS8pXMTwlV1tCm8z
 MqCZFNk8UutMtxfYnZFzcovP9N0cmy0nkD3k6sRun9s1/sFjoxxaUgjOrCL7y2uPwvQQ
 lXukD9VGZtFhkDO2N7956u1+l2M6/veLQYSn4/INPExsRLUj1eaK2Aqt6h1p8vary8Oz
 rUIIIUX9mTGfrPxvqF0pPdE88cZohURPrG+z3oL4OrAz4TV6ArpUYqow9VvhCqsTnDzV
 r40g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702002856; x=1702607656;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KEcoat7SC4jN+C9La2rhXqQ9NFVHbLoJsMPiUtjdyFI=;
 b=NaLHSLGRHBBodBadyRynqZvoevSz2TsmK3gz3M8p++eonBGzU+8UPQdYDOEq9lIYQn
 CthbmIDz4AdEjNoczClbvNXrsf2rO3teJq3zv4t3bLg9lIrc/4mv/Kvws3mjid+qocLE
 b4JuZwBddLXKp+FZDUQvSbMIGJp74gr6BaFKlUZigTO4Ei1XBDlqtSZWMXttaZuFh0eb
 BP5KncHeDoh9k3pVAVYHH4BSvkNOnPcv+ElTTcEFSw+jCq+7cNDCy0DlEFKNWBEGTcZ0
 7LUj/WcLUGdSsr4IaTZBBe51ib+/JEcNhiU9+/yY6yImHNspLckCyNLHYOSmFX+itQjm
 Ap5w==
X-Gm-Message-State: AOJu0YyIFQWBCWuot7Zg+li+GtpXN2BnVKiDydtQoNsbahcSyH5A+1ty
 yBQK1i8+2v3E1/OxWFPP3xZ/zQgyur6esQ==
X-Received: by 2002:a2e:a4bb:0:b0:2ca:2e14:dce6 with SMTP id
 g27-20020a2ea4bb000000b002ca2e14dce6mr1208892ljm.55.1702002856517; 
 Thu, 07 Dec 2023 18:34:16 -0800 (PST)
Received: from localhost.localdomain ([185.200.240.39])
 by smtp.gmail.com with ESMTPSA id
 r1-20020a2e94c1000000b002c9e6cbf78esm99062ljh.19.2023.12.07.18.34.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Dec 2023 18:34:15 -0800 (PST)
From: Sergey Kambalin <serg.oker@gmail.com>
X-Google-Original-From: Sergey Kambalin <sergey.kambalin@auriga.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	Sergey Kambalin <sergey.kambalin@auriga.com>
Subject: [PATCH v4 40/45] Add mailbox property tests. Part 1
Date: Thu,  7 Dec 2023 20:31:40 -0600
Message-Id: <20231208023145.1385775-41-sergey.kambalin@auriga.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231208023145.1385775-1-sergey.kambalin@auriga.com>
References: <20231208023145.1385775-1-sergey.kambalin@auriga.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22b;
 envelope-from=serg.oker@gmail.com; helo=mail-lj1-x22b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: Mw1wr+wPn6oK

Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
---
 tests/qtest/bcm2838-mailbox.c            |  34 ++--
 tests/qtest/bcm2838-mailbox.h            |  18 +-
 tests/qtest/bcm2838-mbox-property-test.c | 206 +++++++++++++++++++++++
 tests/qtest/meson.build                  |   2 +-
 4 files changed, 220 insertions(+), 40 deletions(-)
 create mode 100644 tests/qtest/bcm2838-mbox-property-test.c

diff --git a/tests/qtest/bcm2838-mailbox.c b/tests/qtest/bcm2838-mailbox.c
index 2edc24e15e..4b160cd56c 100644
--- a/tests/qtest/bcm2838-mailbox.c
+++ b/tests/qtest/bcm2838-mailbox.c
@@ -12,6 +12,10 @@
 #include "libqtest-single.h"
 #include "bcm2838-mailbox.h"
 
+REG32(MBOX_EXCHNG_REG,          0)
+FIELD(MBOX_EXCHNG_REG, CHANNEL, 0, 4)
+FIELD(MBOX_EXCHNG_REG, DATA,    4, 28)
+
 
 static uint32_t qtest_mbox0_read_reg32(QTestState *s, uint32_t offset)
 {
@@ -25,47 +29,33 @@ static void qtest_mbox1_write_reg32(QTestState *s, uint32_t offset, uint32_t val
 
 static void qtest_mbox1_write(QTestState *s, uint8_t channel, uint32_t data)
 {
-    uint32_t reg;
+    uint32_t mbox_reg = 0;
 
-    reg = FIELD_DP32(reg, MBOX_WRITE_REG, CHANNEL, channel);
-    reg = FIELD_DP32(reg, MBOX_WRITE_REG, DATA, data);
-    qtest_mbox1_write_reg32(s, MBOX_REG_WRITE, reg);
+    mbox_reg = FIELD_DP32(mbox_reg, MBOX_EXCHNG_REG, CHANNEL, channel);
+    mbox_reg = FIELD_DP32(mbox_reg, MBOX_EXCHNG_REG, DATA, data);
+    qtest_mbox1_write_reg32(s, MBOX_REG_WRITE, mbox_reg);
 }
 
 int qtest_mbox0_has_data(QTestState *s) {
     return !(qtest_mbox0_read_reg32(s, MBOX_REG_STATUS) & MBOX_READ_EMPTY);
 }
 
-int mbox0_has_data(void) {
-    return qtest_mbox0_has_data(global_qtest);
-}
-
 void qtest_mbox0_read_message(QTestState *s,
                               uint8_t channel,
                               void *msgbuf,
                               size_t msgbuf_size)
 {
-    uint32_t reg;
+    uint32_t mbox_reg;
     uint32_t msgaddr;
 
     g_assert(qtest_mbox0_has_data(s));
-    reg = qtest_mbox0_read_reg32(s, MBOX_REG_READ);
-    g_assert_cmphex(FIELD_EX32(reg, MBOX_WRITE_REG, CHANNEL), ==, channel);
-    msgaddr = FIELD_EX32(reg, MBOX_WRITE_REG, DATA) << 4;
+    mbox_reg = qtest_mbox0_read_reg32(s, MBOX_REG_READ);
+    g_assert_cmphex(FIELD_EX32(mbox_reg, MBOX_EXCHNG_REG, CHANNEL), ==, channel);
+    msgaddr = FIELD_EX32(mbox_reg, MBOX_EXCHNG_REG, DATA) << 4;
     qtest_memread(s, msgaddr, msgbuf, msgbuf_size);
 }
 
-void mbox0_read_message(uint8_t channel, void *msgbuf, size_t msgbuf_size) {
-    qtest_mbox0_read_message(global_qtest, channel, msgbuf, msgbuf_size);
-}
-
 void qtest_mbox1_write_message(QTestState *s, uint8_t channel, uint32_t msg_addr)
 {
     qtest_mbox1_write(s, channel, msg_addr >> 4);
 }
-
-
-void mbox1_write_message(uint8_t channel, uint32_t msg_addr)
-{
-    qtest_mbox1_write_message(global_qtest, channel, msg_addr);
-}
diff --git a/tests/qtest/bcm2838-mailbox.h b/tests/qtest/bcm2838-mailbox.h
index 2b140a5d32..7e660e65a7 100644
--- a/tests/qtest/bcm2838-mailbox.h
+++ b/tests/qtest/bcm2838-mailbox.h
@@ -77,7 +77,7 @@
 #define TAG_SET_GPIO_STATE         0x00038041
 #define TAG_INITIALIZE_VCHIQ       0x00048010
 
-#define BOARD_REVISION    11546898
+#define BOARD_REVISION    0xB03115
 #define FIRMWARE_REVISION 346337
 #define FIRMWARE_VARIANT  0x77777777 /* TODO: Find the real value */
 
@@ -147,22 +147,6 @@
 /* Used to test stubs that don't perform actual work */
 #define DUMMY_VALUE 0x12345678
 
-REG32(MBOX_WRITE_REG,          0)
-FIELD(MBOX_WRITE_REG, CHANNEL, 0, 4)
-FIELD(MBOX_WRITE_REG, DATA,    4, 28)
-
-REG32(MBOX_SIZE_STAT,          0)
-FIELD(MBOX_SIZE_STAT, SIZE,    0, 30)
-FIELD(MBOX_SIZE_STAT, SUCCESS, 30, 1)
-
-REG32(SET_DEVICE_POWER_STATE_CMD,        0)
-FIELD(SET_DEVICE_POWER_STATE_CMD, EN,    0, 1)
-FIELD(SET_DEVICE_POWER_STATE_CMD, WAIT,  1, 1)
-
-REG32(GET_CLOCK_STATE_CMD,        0)
-FIELD(GET_CLOCK_STATE_CMD, EN,    0, 1)
-FIELD(GET_CLOCK_STATE_CMD, NPRES, 1, 1)
-
 typedef struct {
     uint32_t size;
     uint32_t req_resp_code;
diff --git a/tests/qtest/bcm2838-mbox-property-test.c b/tests/qtest/bcm2838-mbox-property-test.c
new file mode 100644
index 0000000000..80746dbb95
--- /dev/null
+++ b/tests/qtest/bcm2838-mbox-property-test.c
@@ -0,0 +1,206 @@
+/*
+ * Tests set for BCM2838 mailbox property interface.
+ *
+ * Copyright (c) 2022 Auriga
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
+REG32(MBOX_SIZE_STAT,          0)
+FIELD(MBOX_SIZE_STAT, SIZE,    0, 31)
+FIELD(MBOX_SIZE_STAT, SUCCESS, 31, 1)
+
+REG32(SET_DEVICE_POWER_STATE_CMD,        0)
+FIELD(SET_DEVICE_POWER_STATE_CMD, EN,    0, 1)
+FIELD(SET_DEVICE_POWER_STATE_CMD, WAIT,  1, 1)
+
+REG32(GET_CLOCK_STATE_CMD,        0)
+FIELD(GET_CLOCK_STATE_CMD, EN,    0, 1)
+FIELD(GET_CLOCK_STATE_CMD, NPRES, 1, 1)
+
+#define MBOX_TEST_MESSAGE_ADDRESS 0x10000000
+
+#define TEST_TAG(x) TAG_ ## x
+#define TEST_TAG_TYPE(x) TAG_##x##_t
+
+#define TEST_FN_NAME(test, subtest) \
+    test ## _ ## subtest ## _test
+
+#define SETUP_FN_NAME(test, subtest) \
+    test ## _ ## subtest ## _setup
+
+#define CHECK_FN_NAME(test, subtest) \
+    test ## _ ## subtest ## _spec_check
+
+#define DECLARE_TEST_CASE_SETUP(testname, ...)              \
+    void SETUP_FN_NAME(testname, __VA_ARGS__)               \
+                             (TEST_TAG_TYPE(testname) * tag)
+
+/*----------------------------------------------------------------------------*/
+#define DECLARE_TEST_CASE(testname, ...)                                       \
+    __attribute__((weak))                                                      \
+    void SETUP_FN_NAME(testname, __VA_ARGS__)                                  \
+                      (TEST_TAG_TYPE(testname) * tag);                         \
+    static void CHECK_FN_NAME(testname, __VA_ARGS__)                           \
+                             (TEST_TAG_TYPE(testname) *tag);                   \
+    static void TEST_FN_NAME(testname, __VA_ARGS__)(void) {                    \
+        struct {                                                               \
+            MboxBufHeader header;                                              \
+            TEST_TAG_TYPE(testname) tag;                                       \
+            uint32_t end_tag;                                                  \
+        } mailbox_buffer = { 0 };                                              \
+                                                                               \
+        QTestState *qts = qtest_init("-machine raspi4b-2g");                   \
+                                                                               \
+        mailbox_buffer.header.size = sizeof(mailbox_buffer);                   \
+        mailbox_buffer.header.req_resp_code = MBOX_PROCESS_REQUEST;            \
+                                                                               \
+        mailbox_buffer.tag.id = TEST_TAG(testname);                            \
+        mailbox_buffer.tag.value_buffer_size = MAX(                            \
+            sizeof(mailbox_buffer.tag.request.value),                          \
+            sizeof(mailbox_buffer.tag.response.value));                        \
+        mailbox_buffer.tag.request.zero = 0;                                   \
+                                                                               \
+        mailbox_buffer.end_tag = TAG_END;                                      \
+                                                                               \
+        if (SETUP_FN_NAME(testname, __VA_ARGS__)) {                            \
+            SETUP_FN_NAME(testname, __VA_ARGS__)(&mailbox_buffer.tag);         \
+        }                                                                      \
+                                                                               \
+        qtest_memwrite(qts, MBOX_TEST_MESSAGE_ADDRESS,                         \
+                    &mailbox_buffer, sizeof(mailbox_buffer));                  \
+        qtest_mbox1_write_message(qts, MBOX_CHANNEL_ID_PROPERTY,               \
+                            MBOX_TEST_MESSAGE_ADDRESS);                        \
+                                                                               \
+        qtest_mbox0_read_message(qts, MBOX_CHANNEL_ID_PROPERTY,                \
+                            &mailbox_buffer, sizeof(mailbox_buffer));          \
+                                                                               \
+        g_assert_cmphex(mailbox_buffer.header.req_resp_code, ==, MBOX_SUCCESS);\
+                                                                               \
+        g_assert_cmphex(mailbox_buffer.tag.id, ==, TEST_TAG(testname));        \
+                                                                               \
+        uint32_t size = FIELD_EX32(mailbox_buffer.tag.response.size_stat,      \
+                                   MBOX_SIZE_STAT, SIZE);                      \
+        uint32_t success = FIELD_EX32(mailbox_buffer.tag.response.size_stat,   \
+                                      MBOX_SIZE_STAT, SUCCESS);                \
+        g_assert_cmpint(size, ==, sizeof(mailbox_buffer.tag.response.value));  \
+        g_assert_cmpint(success, ==, 1);                                       \
+                                                                               \
+        CHECK_FN_NAME(testname, __VA_ARGS__)(&mailbox_buffer.tag);             \
+                                                                               \
+        qtest_quit(qts);                                                       \
+    }                                                                          \
+    static void CHECK_FN_NAME(testname, __VA_ARGS__)                           \
+                             (TEST_TAG_TYPE(testname) * tag)
+
+/*----------------------------------------------------------------------------*/
+
+#define QTEST_ADD_TEST_CASE(testname, ...)                                     \
+    qtest_add_func(stringify(/bcm2838/mbox/property/                           \
+                   TEST_FN_NAME(testname, __VA_ARGS__)-test),                  \
+                   TEST_FN_NAME(testname, __VA_ARGS__))
+
+/*----------------------------------------------------------------------------*/
+DECLARE_TEST_CASE(GET_FIRMWARE_REVISION) {
+    g_assert_cmpint(tag->response.value.revision, ==, FIRMWARE_REVISION);
+}
+
+// /*----------------------------------------------------------------------------*/
+DECLARE_TEST_CASE(GET_BOARD_REVISION) {
+    g_assert_cmpint(tag->response.value.revision, ==, BOARD_REVISION);
+}
+
+/*----------------------------------------------------------------------------*/
+DECLARE_TEST_CASE(GET_ARM_MEMORY) {
+    g_assert_cmphex(tag->response.value.base, ==, ARM_MEMORY_BASE);
+    g_assert_cmphex(tag->response.value.size, ==, ARM_MEMORY_SIZE);
+}
+
+/*----------------------------------------------------------------------------*/
+DECLARE_TEST_CASE(GET_VC_MEMORY) {
+    g_assert_cmphex(tag->response.value.base, ==, VC_MEMORY_BASE);
+    g_assert_cmphex(tag->response.value.size, ==, VC_MEMORY_SIZE);
+}
+
+/*----------------------------------------------------------------------------*/
+DECLARE_TEST_CASE(SET_DEVICE_POWER_STATE) {
+    uint32_t enabled =
+        FIELD_EX32(tag->response.value.cmd, SET_DEVICE_POWER_STATE_CMD, EN);
+    uint32_t wait =
+        FIELD_EX32(tag->response.value.cmd, SET_DEVICE_POWER_STATE_CMD, WAIT);
+    g_assert_cmphex(tag->response.value.device_id, ==, DEVICE_ID_UART0);
+    g_assert_cmpint(enabled, ==, 1);
+    g_assert_cmpint(wait, ==, 0);
+}
+DECLARE_TEST_CASE_SETUP(SET_DEVICE_POWER_STATE) {
+    tag->request.value.device_id = DEVICE_ID_UART0;
+    tag->response.value.cmd =
+        FIELD_DP32(tag->response.value.cmd, SET_DEVICE_POWER_STATE_CMD, EN, 1);
+    tag->response.value.cmd =
+        FIELD_DP32(tag->response.value.cmd, SET_DEVICE_POWER_STATE_CMD, WAIT, 1);
+}
+
+/*----------------------------------------------------------------------------*/
+DECLARE_TEST_CASE(GET_CLOCK_STATE) {
+    uint32_t enabled =
+        FIELD_EX32(tag->response.value.cmd, GET_CLOCK_STATE_CMD, EN);
+    uint32_t not_present =
+        FIELD_EX32(tag->response.value.cmd, GET_CLOCK_STATE_CMD, NPRES);
+    g_assert_cmphex(tag->response.value.clock_id, ==, CLOCK_ID_CORE);
+    g_assert_cmphex(enabled, ==, 1);
+    g_assert_cmphex(not_present, ==, 0);
+}
+DECLARE_TEST_CASE_SETUP(GET_CLOCK_STATE) {
+   tag->request.value.clock_id = CLOCK_ID_CORE;
+}
+
+/*----------------------------------------------------------------------------*/
+DECLARE_TEST_CASE(GET_CLOCK_RATE, EMMC) {
+    g_assert_cmphex(tag->response.value.clock_id, ==, CLOCK_ID_EMMC);
+    g_assert_cmphex(tag->response.value.rate, ==, CLOCK_RATE_EMMC);
+}
+DECLARE_TEST_CASE_SETUP(GET_CLOCK_RATE, EMMC) {
+    tag->request.value.clock_id = CLOCK_ID_EMMC;
+}
+
+/*----------------------------------------------------------------------------*/
+DECLARE_TEST_CASE(GET_MAX_CLOCK_RATE, EMMC) {
+    g_assert_cmphex(tag->response.value.clock_id, ==, CLOCK_ID_EMMC);
+    g_assert_cmphex(tag->response.value.rate, ==, CLOCK_RATE_EMMC);
+}
+DECLARE_TEST_CASE_SETUP(GET_MAX_CLOCK_RATE, EMMC) {
+    tag->request.value.clock_id = CLOCK_ID_EMMC;
+}
+
+/*----------------------------------------------------------------------------*/
+DECLARE_TEST_CASE(GET_MIN_CLOCK_RATE, EMMC) {
+    g_assert_cmphex(tag->response.value.clock_id, ==, CLOCK_ID_EMMC);
+    g_assert_cmphex(tag->response.value.rate, ==, CLOCK_RATE_EMMC);
+}
+DECLARE_TEST_CASE_SETUP(GET_MIN_CLOCK_RATE, EMMC) {
+    tag->request.value.clock_id = CLOCK_ID_EMMC;
+}
+
+/*----------------------------------------------------------------------------*/
+int main(int argc, char **argv)
+{
+    g_test_init(&argc, &argv, NULL);
+
+    QTEST_ADD_TEST_CASE(GET_FIRMWARE_REVISION);
+    QTEST_ADD_TEST_CASE(GET_BOARD_REVISION);
+    QTEST_ADD_TEST_CASE(GET_ARM_MEMORY);
+    QTEST_ADD_TEST_CASE(GET_VC_MEMORY);
+    QTEST_ADD_TEST_CASE(SET_DEVICE_POWER_STATE);
+    QTEST_ADD_TEST_CASE(GET_CLOCK_STATE);
+    QTEST_ADD_TEST_CASE(GET_CLOCK_RATE, EMMC);
+    QTEST_ADD_TEST_CASE(GET_MAX_CLOCK_RATE, EMMC);
+    QTEST_ADD_TEST_CASE(GET_MIN_CLOCK_RATE, EMMC);
+
+    return g_test_run();
+}
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 92eba5ac99..2351e99fd5 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -217,7 +217,7 @@ qtests_aarch64 = \
     ['tpm-tis-device-test', 'tpm-tis-device-swtpm-test'] : []) +                                         \
   (config_all_devices.has_key('CONFIG_XLNX_ZYNQMP_ARM') ? ['xlnx-can-test', 'fuzz-xlnx-dp-test'] : []) + \
   (config_all_devices.has_key('CONFIG_XLNX_VERSAL') ? ['xlnx-canfd-test', 'xlnx-versal-trng-test'] : []) + \
-  (config_all_devices.has_key('CONFIG_RASPI') ? ['bcm2835-dma-test'] : []) +  \
+  (config_all_devices.has_key('CONFIG_RASPI') ? ['bcm2835-dma-test', 'bcm2838-mbox-property-test'] : []) +  \
   (config_all.has_key('CONFIG_TCG') and                                            \
    config_all_devices.has_key('CONFIG_TPM_TIS_I2C') ? ['tpm-tis-i2c-test'] : []) + \
   ['arm-cpu-features',
-- 
2.34.1


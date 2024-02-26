Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp1763067ejf;
        Sun, 25 Feb 2024 16:06:41 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVioUJDuT4Vi4x6efXyvuJ+ENAC4ZHf1qTx2eBBEqz8/eCSjoHCvKY3MuLSHrTHWD8fR88zVJ6eEMflYlmqDnIEh40fd05/
X-Google-Smtp-Source: AGHT+IFFW9/JaOhxjrMRDw1jsZm9ucyI81xyuDOBB4j/Dz3PtXt6medX1kBmlo6WMiICkBpKoCUE
X-Received: by 2002:a0c:f542:0:b0:68f:39bf:35ff with SMTP id p2-20020a0cf542000000b0068f39bf35ffmr6298261qvm.58.1708906001036;
        Sun, 25 Feb 2024 16:06:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708906001; cv=none;
        d=google.com; s=arc-20160816;
        b=wv/EwSduRUoVoXsY5vKiP6QAs5VYYSrIoihwgsejAYf5fhNM0p48si5hDrcrXcJ64S
         fmbd4+zALMTG/vVmnwCbURjMv1al7rMMwx4sCgq5+6pcjAAFdcDAzgexd09CUm/ibfcb
         PLTa7Y6ccE0LuiL6ysVmA3E/9SVYx4YtDW59wjwL4Rv0K1ha6XpzQOt5BjwflOSFNMQu
         ulopQTwiG2Usns5if5qefC96yhNvTLDdd+2f2eKCGIh9kYsBpBNzFpqtxmpfTVrPMFyz
         DqdPXlGoK6E07k468oLkj3+8Mibgg25nnB7gc3R30JlyNkcpANbSmo5BGbhFBgyl0Mp9
         DaMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=B1qiUg43qFf4fDzjm0il25qz/RHiJ49XsRgqOpb6has=;
        fh=1CWWAdYo81brd4jeYOgzhc83mN/ncVbe89i2SJzFql0=;
        b=wFGS901ISPFs7rIR4jyB1JFBwqZvoq32Sm0AFKK/rQKyiusK/XJqf7EZW+p+SoWHmz
         J4bDXn4RwEbXG+8iPD1bLPJPPT0WjcUSAqr5N7YF+hVaQwSG9yW2J52xQRAW+FJsqxMr
         +HU01UbRq8dssK92lo41it0LhmGUbCcCD8X+5GC9Y7xB4dakW3EXyxgEH+dSkxDMmAy+
         hAuFSCPR75I6gfeQjCqfauyyQ0IVDsiDiCakwSN+U9VAHHZev0lobOY0GlVI43qS2ztz
         /gTnxIxHNxDZ5YVHOj4qlQg8LWLK2iPog6a/DOTY6gktt+XcBH5BcThPF3tTa0I1ax7E
         B0+g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=W8WSuNFb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id iw8-20020a0562140f2800b0068f2b1e5a40si3933082qvb.308.2024.02.25.16.06.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 25 Feb 2024 16:06:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=W8WSuNFb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1reOU0-0007wn-Tv; Sun, 25 Feb 2024 19:04:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1reOTM-0006zq-4Y; Sun, 25 Feb 2024 19:04:00 -0500
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1reOTF-0000aS-Vx; Sun, 25 Feb 2024 19:03:54 -0500
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-609018048c3so1157047b3.3; 
 Sun, 25 Feb 2024 16:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708905826; x=1709510626; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B1qiUg43qFf4fDzjm0il25qz/RHiJ49XsRgqOpb6has=;
 b=W8WSuNFbX5OY4nJO44KcEN48BW7Fb1cW5Cj2YA35UdlYbzRJi1QfHC8KAhzOljcd1P
 5lZaFvzMffn9IX/RJAQaBMrejWmyAtrvpePxQhex5Og83CLoSE9RtvIB9/BL/r6DTIpE
 AKAFBopQIuOyGumIR9lZaA3P96/mYnfulaZ9CaJxwPCIblGbllJ0RKXitTkDCgWqTlBv
 Av6JO2Fx6YLJ4C5xzWKE97c65T6IfYJWSpTwMUqEH2CfnsKYD3b5PsKJZhwu9u64qNEa
 KQU66Urwj3Qjh3z+MPzPolsBw7KDpwiyG+pCVukonUWRWVfF2uY6opQdHmQ9tfUg2AXQ
 lVIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708905826; x=1709510626;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B1qiUg43qFf4fDzjm0il25qz/RHiJ49XsRgqOpb6has=;
 b=TzdXohkTOJmUzZbhzXvw6LC0Pxwr0xX+x/qo2VouWT37Bcuqeovcbev201QINtHaDv
 +vkWDN0b2zGEs/A/WnwTPT9vWWJh639t8hMqKRnckOjgDke+QZYG+UcEQuRBqm5SNBRn
 faErZKODuyV47rfJJRm3htWDCr/xb+Jenki5j7GnmiGUwCoumf+XgirM/0V1gqCjZVa9
 LfjUcquGnVHSjRpQ3Dao3ZsDe2HHKbcNBAbL5BakbnkjJBw17W29sojFr9QQHfuPbI5s
 cSD6tMzt22zucVTjCs3Ii269oim9V2+Vwb+UyEBmWptRoVLkN2MRTq+97ms2gjw8eKpC
 b50A==
X-Gm-Message-State: AOJu0Yxg9Sk9H3DeWhRz1LuVM3+wtd5nkUPBT4ufQpCRbu59xj1jhCdX
 cc79XLMIlbmdNW1SfVQqbo1FMD4hq40hMq3ImI11LQGOX6FkWvWGX8I2WTNe0zC9WA==
X-Received: by 2002:a05:690c:72b:b0:607:85b3:b52f with SMTP id
 bt11-20020a05690c072b00b0060785b3b52fmr4727520ywb.22.1708905825965; 
 Sun, 25 Feb 2024 16:03:45 -0800 (PST)
Received: from localhost.localdomain ([201.203.117.224])
 by smtp.gmail.com with ESMTPSA id
 t18-20020a818312000000b00607bfa1913csm938171ywf.114.2024.02.25.16.03.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Feb 2024 16:03:45 -0800 (PST)
From: Sergey Kambalin <serg.oker@gmail.com>
X-Google-Original-From: Sergey Kambalin <sergey.kambalin@auriga.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	Sergey Kambalin <sergey.kambalin@auriga.com>
Subject: [PATCH v6 36/41] Add mailbox property tests. Part 1
Date: Sun, 25 Feb 2024 18:02:54 -0600
Message-Id: <20240226000259.2752893-37-sergey.kambalin@auriga.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240226000259.2752893-1-sergey.kambalin@auriga.com>
References: <20240226000259.2752893-1-sergey.kambalin@auriga.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=serg.oker@gmail.com; helo=mail-yw1-x1131.google.com
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
X-TUID: 3odEJxESxjQo

Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
---
 tests/qtest/bcm2838-mailbox.c            |   1 -
 tests/qtest/bcm2838-mbox-property-test.c | 207 +++++++++++++++++++++++
 tests/qtest/meson.build                  |   2 +-
 3 files changed, 208 insertions(+), 2 deletions(-)
 create mode 100644 tests/qtest/bcm2838-mbox-property-test.c

diff --git a/tests/qtest/bcm2838-mailbox.c b/tests/qtest/bcm2838-mailbox.c
index 1efd3c628a..0928a3dff8 100644
--- a/tests/qtest/bcm2838-mailbox.c
+++ b/tests/qtest/bcm2838-mailbox.c
@@ -11,7 +11,6 @@
 #include "hw/registerfields.h"
 #include "libqtest-single.h"
 #include "bcm2838-mailbox.h"
-#include "hw/arm/raspberrypi-fw-defs.h"
 
 REG32(MBOX_EXCHNG_REG,          0)
 FIELD(MBOX_EXCHNG_REG, CHANNEL, 0, 4)
diff --git a/tests/qtest/bcm2838-mbox-property-test.c b/tests/qtest/bcm2838-mbox-property-test.c
new file mode 100644
index 0000000000..acb421915b
--- /dev/null
+++ b/tests/qtest/bcm2838-mbox-property-test.c
@@ -0,0 +1,207 @@
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
+#include "hw/arm/raspberrypi-fw-defs.h"
+
+REG32(MBOX_SIZE_STAT,          0)
+FIELD(MBOX_SIZE_STAT, SIZE,    0, 31)
+FIELD(MBOX_SIZE_STAT, SUCCESS, 31, 1)
+
+REG32(SET_POWER_STATE_CMD,        0)
+FIELD(SET_POWER_STATE_CMD, EN,    0, 1)
+FIELD(SET_POWER_STATE_CMD, WAIT,  1, 1)
+
+REG32(GET_CLOCK_STATE_CMD,        0)
+FIELD(GET_CLOCK_STATE_CMD, EN,    0, 1)
+FIELD(GET_CLOCK_STATE_CMD, NPRES, 1, 1)
+
+#define MBOX_TEST_MESSAGE_ADDRESS 0x10000000
+
+#define TEST_TAG(x) RPI_FWREQ_ ## x
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
+        mailbox_buffer.end_tag = RPI_FWREQ_PROPERTY_END;                       \
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
+DECLARE_TEST_CASE(SET_POWER_STATE) {
+    uint32_t enabled =
+        FIELD_EX32(tag->response.value.cmd, SET_POWER_STATE_CMD, EN);
+    uint32_t wait =
+        FIELD_EX32(tag->response.value.cmd, SET_POWER_STATE_CMD, WAIT);
+    g_assert_cmphex(tag->response.value.device_id, ==, DEVICE_ID_UART0);
+    g_assert_cmpint(enabled, ==, 1);
+    g_assert_cmpint(wait, ==, 0);
+}
+DECLARE_TEST_CASE_SETUP(SET_POWER_STATE) {
+    tag->request.value.device_id = DEVICE_ID_UART0;
+    tag->response.value.cmd =
+        FIELD_DP32(tag->response.value.cmd, SET_POWER_STATE_CMD, EN, 1);
+    tag->response.value.cmd =
+        FIELD_DP32(tag->response.value.cmd, SET_POWER_STATE_CMD, WAIT, 1);
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
+    QTEST_ADD_TEST_CASE(SET_POWER_STATE);
+    QTEST_ADD_TEST_CASE(GET_CLOCK_STATE);
+    QTEST_ADD_TEST_CASE(GET_CLOCK_RATE, EMMC);
+    QTEST_ADD_TEST_CASE(GET_MAX_CLOCK_RATE, EMMC);
+    QTEST_ADD_TEST_CASE(GET_MIN_CLOCK_RATE, EMMC);
+
+    return g_test_run();
+}
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index e49ce4f092..194ddf3510 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -230,7 +230,7 @@ qtests_aarch64 = \
     ['tpm-tis-device-test', 'tpm-tis-device-swtpm-test'] : []) +                                         \
   (config_all_devices.has_key('CONFIG_XLNX_ZYNQMP_ARM') ? ['xlnx-can-test', 'fuzz-xlnx-dp-test'] : []) + \
   (config_all_devices.has_key('CONFIG_XLNX_VERSAL') ? ['xlnx-canfd-test', 'xlnx-versal-trng-test'] : []) + \
-  (config_all_devices.has_key('CONFIG_RASPI') ? ['bcm2835-dma-test'] : []) +  \
+  (config_all_devices.has_key('CONFIG_RASPI') ? ['bcm2835-dma-test', 'bcm2838-mbox-property-test'] : []) +  \
   (config_all_accel.has_key('CONFIG_TCG') and                                            \
    config_all_devices.has_key('CONFIG_TPM_TIS_I2C') ? ['tpm-tis-i2c-test'] : []) + \
   ['arm-cpu-features',
-- 
2.34.1


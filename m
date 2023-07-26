Received: by 2002:a17:906:2484:b0:98d:b2f5:1316 with SMTP id e4csp575410ejb;
        Wed, 26 Jul 2023 07:10:46 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHSl8SbCMjITVaC7jBLEB7ewGP1d0bKgAr+fO7X3xHR2bDZGDBdLGGuGBwkmRktSX/0grs5
X-Received: by 2002:a05:622a:180d:b0:400:8e9d:106a with SMTP id t13-20020a05622a180d00b004008e9d106amr2770436qtc.45.1690380646579;
        Wed, 26 Jul 2023 07:10:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690380646; cv=none;
        d=google.com; s=arc-20160816;
        b=A+81JzykTorD6k+BayExxCSlNvYh8Y7beC9gbmFeC4WqSYkDd5l0uyXpIk5I2hC5Fx
         HvPXZxBBKCZwpkhVRK33nC2YPKdAYDr5O7kvWuCGFyzD5gd48wvpy/GposMyMBqeNxmr
         TjspJ8Ok0Dt+T3cC/FDc4H7Q+0h9e374NjIIU7tn8qIsWDrVcO6Yt1Jw00doOX1haqz8
         yX8KmFKyefBA+PiO+u4EfUwjfMLeG+Vt+nKqzWzLerFe5NjJn0a+Bf2KRRRb/AloRvNu
         xGamJ9vvoIoMIqpaciyctr4vk3lEM01cEhA5JTFmxY8fAT/Jht+C5pT0mMHS1VzzuAH4
         hx7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=/8TXbdqkkjhJHoVaXuhrzNVLx0BsIskBc09ZcYShoto=;
        fh=f5jt6gD4kTKAQV2ukO6ZfXPs+EJm4Q1+uDtHV6gcJRE=;
        b=RzT78GseDV+dyGs6puzdpVJmi9Jc6OdgDyW7h4xqFt+6sjNsjJpklIHwx15rqQl4wz
         PhH+mElDjiyWd1eG0dxmwC2A7GcJHqQSgWuCmYD4HkR5jZKYJ9bDbfrk2ExyzL1uRcR8
         uqADaHCh87TXdqPU6zpdJL+pKLWSv902L535mNa2Lv52FOikTL4D+VhG4KcXJTHK7EpF
         bIye+ZhbCT97GFOMhgIV+gwcNVtpYH06EaOqDjLxb8Gt0vXkz6ORp/p6hv61qRTHWrUU
         etB6CL04a9y6vbFraXsLFEa62HdKjjUqT4B+x7TwB9ky9JteVl6UBOJm7vaut5q2weWr
         KjXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=SGPuunAT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i14-20020ac85c0e000000b004055a9783c2si5429530qti.495.2023.07.26.07.10.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Jul 2023 07:10:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=SGPuunAT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qOeWx-00039c-Cf; Wed, 26 Jul 2023 09:26:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1qOeWr-00034A-89; Wed, 26 Jul 2023 09:26:13 -0400
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1qOeWo-0003WY-HX; Wed, 26 Jul 2023 09:26:12 -0400
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-4fb7dc16ff0so10519212e87.2; 
 Wed, 26 Jul 2023 06:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690377967; x=1690982767;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/8TXbdqkkjhJHoVaXuhrzNVLx0BsIskBc09ZcYShoto=;
 b=SGPuunAT98eoytvmUohHah72R2diMYey3cV9i4Tg4ai/TrcqkC42xq5SeouicfMdV7
 OmepWWXuB+2AboO+Ug4ub+ekr2lu8NkbZJ7YlOJHmDRZcMxirqcf8YFjQ8q0yA2fP9Dz
 Ari2vC1h8cXTR4cdcPt+nARamIQ+UCFqFoWE3tm4du+NYQQ3JNhETbl+dsH54chcXvhr
 RG3HCo+Bl2tjo7up6jF1dZYjQjXUxqTYa/Z6HWLDXkF2jCC5DGGx4nXZAP5PBOlps25A
 L4a4cWkoJt/N8qhgmQFyrkw7JsVOI0NSovKvvadIdHTkrlYWp2lhBtdg9JxXkfmwrbt+
 P+GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690377967; x=1690982767;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/8TXbdqkkjhJHoVaXuhrzNVLx0BsIskBc09ZcYShoto=;
 b=Tsdodj46uxUY7VPnGqPSG/z+SJHCOsvmh796PQ62FI411pnPvIUHtGRGmIoDnIhrxh
 cx2+x5cySeRRDKjC6yrRaQCV1nnl37Tqb6JIiwY12V2v19yvz0JKCZ7Tdpp18bxIV3d7
 XmIIcJuE2DhyfXcBvogLyXjXETSVPDOPnjHfoYoI2tbXJfvuPd0m/CZr3HpPRUNv9m8r
 UcnZRL4s8k2ZJOVKgZLfiONXpMcfFYlaN75vjvSJbq7szAsT8taEqWTnNWUihwp+EkMq
 G9U/KpBqUqcLA1o7ffX1gHV/UQJkB6d2YoAGg7PKiIfpTGs96l/13Pbq3B7DrAOGK3wu
 0cJQ==
X-Gm-Message-State: ABy/qLafO7HlRGarAWouzJnWhORs5bzbmKxer2FXXkODQCLF6/XUIgZS
 4N+EyOrTO4jG1X0NnuVuhOh4UyiH7TY=
X-Received: by 2002:ac2:5e2f:0:b0:4fb:caed:95c3 with SMTP id
 o15-20020ac25e2f000000b004fbcaed95c3mr1536670lfg.53.1690377967396; 
 Wed, 26 Jul 2023 06:26:07 -0700 (PDT)
Received: from sergevik-thinkpad.localdomain ([213.197.136.186])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a19f516000000b004fe0c3d8bb4sm565079lfb.84.2023.07.26.06.26.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jul 2023 06:26:07 -0700 (PDT)
From: Sergey Kambalin <serg.oker@gmail.com>
X-Google-Original-From: Sergey Kambalin <sergey.kambalin@auriga.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	Sergey Kambalin <sergey.kambalin@auriga.com>
Subject: [PATCH 40/44] Add mailbox property tests. Part 1
Date: Wed, 26 Jul 2023 16:25:08 +0300
Message-Id: <20230726132512.149618-41-sergey.kambalin@auriga.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230726132512.149618-1-sergey.kambalin@auriga.com>
References: <20230726132512.149618-1-sergey.kambalin@auriga.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::133;
 envelope-from=serg.oker@gmail.com; helo=mail-lf1-x133.google.com
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
X-TUID: HyHTqRFzV2xz

Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
---
 tests/qtest/bcm2838-mbox-property-test.c | 179 +++++++++++++++++++++++
 tests/qtest/meson.build                  |   2 +-
 2 files changed, 180 insertions(+), 1 deletion(-)
 create mode 100644 tests/qtest/bcm2838-mbox-property-test.c

diff --git a/tests/qtest/bcm2838-mbox-property-test.c b/tests/qtest/bcm2838-mbox-property-test.c
new file mode 100644
index 0000000000..ac173ed3ff
--- /dev/null
+++ b/tests/qtest/bcm2838-mbox-property-test.c
@@ -0,0 +1,179 @@
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
+#include "libqtest-single.h"
+#include "bcm2838-mailbox.h"
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
+        QTestState *qts = qtest_init("-machine raspi4b2g");                    \
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
+        g_assert_cmpint(mailbox_buffer.tag.response.size, ==,                  \
+                    sizeof(mailbox_buffer.tag.response.value));                \
+        g_assert_cmpint(mailbox_buffer.tag.response.success, ==, 1);           \
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
+/*----------------------------------------------------------------------------*/
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
+    g_assert_cmphex(tag->response.value.device_id, ==, DEVICE_ID_UART0);
+    g_assert_cmpint(tag->response.value.enabled, ==, 1);
+    g_assert_cmpint(tag->response.value.wait, ==, 0);
+}
+DECLARE_TEST_CASE_SETUP(SET_DEVICE_POWER_STATE) {
+    tag->request.value.device_id = DEVICE_ID_UART0;
+    tag->request.value.enabled = 1;
+    tag->request.value.wait = 1;
+}
+
+/*----------------------------------------------------------------------------*/
+DECLARE_TEST_CASE(GET_CLOCK_STATE) {
+    g_assert_cmphex(tag->response.value.clock_id, ==, CLOCK_ID_CORE);
+    g_assert_cmphex(tag->response.value.enabled, ==, 1);
+    g_assert_cmphex(tag->response.value.not_present, ==, 0);
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
index 61e9aab835..91393fcbd9 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -217,7 +217,7 @@ qtests_aarch64 = \
     ['tpm-tis-device-test', 'tpm-tis-device-swtpm-test'] : []) +                                         \
   (config_all_devices.has_key('CONFIG_XLNX_ZYNQMP_ARM') ? ['xlnx-can-test', 'fuzz-xlnx-dp-test'] : []) + \
   (config_all_devices.has_key('CONFIG_XLNX_VERSAL') ? ['xlnx-canfd-test'] : []) + \
-  (config_all_devices.has_key('CONFIG_RASPI') ? ['bcm2835-dma-test'] : []) +  \
+  (config_all_devices.has_key('CONFIG_RASPI') ? ['bcm2835-dma-test', 'bcm2838-mbox-property-test'] : []) +  \
   (config_all.has_key('CONFIG_TCG') and                                            \
    config_all_devices.has_key('CONFIG_TPM_TIS_I2C') ? ['tpm-tis-i2c-test'] : []) + \
   ['arm-cpu-features',
-- 
2.34.1


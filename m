Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp2370464ejb;
        Sun, 3 Dec 2023 15:44:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEADJvAyPaPQ/txyE3AgwfG4TEG5d/TukmOGyG3t9xXsKLdDn3cONa7gJl/6chZjrX4RLMr
X-Received: by 2002:a05:6214:8ce:b0:67a:98bc:4b45 with SMTP id da14-20020a05621408ce00b0067a98bc4b45mr5447735qvb.25.1701647088935;
        Sun, 03 Dec 2023 15:44:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701647088; cv=none;
        d=google.com; s=arc-20160816;
        b=a7O3oA57AhKhnuT0R5tUNcWeYNGXPMbU6a6GPpwTOI0W2uv82uzmE4nn8izIrr+Uk6
         8DPWu6NWj9dF5siTUWryBo8FgVB89F0TzPeTCy9A5FKsAf51MEqsIVZFjSpiixemnG/H
         UhY0IL9ppIW3fZb0lOSLsY0xcxsqrBHQJML80tU4EZcTtJdRalYdOJdzmVrMdEXaUoVr
         kOCYREHXG+rCI6gDqnbJB1PoPlMM2ybiyuRKeveC/cQdOXNQvVolIZzKeR/geX4R2PPM
         oz6NQJo1X9CjHOZijinBCZQhgFQSfPty5Jp8nCNf4VUF2GhreqBpY+B2M+ENWppqpwkl
         B3RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=VOsDq4GO7J9Ybd/9mWWm7M2ltcuRdDgkXqPddf6YrXg=;
        fh=1CWWAdYo81brd4jeYOgzhc83mN/ncVbe89i2SJzFql0=;
        b=WT9PKtOhJCIwTWEVB/JZoEQPT1vFoCYlx6gF5nF8mEpNhTzBBF/8DAcdVouLBNUM8/
         VghB77YxkW0USgTc/v83v3WclwnDtmaLaY+AkVKemNliIhX/G9JkgJukx/3M/rtJJY5f
         myQaUKFh+cpNCEEFIgeTherDDjhcNSXA4/hsMg8f2HxajxoFXak6VhZiNiHvPXQByUq+
         tnAC29d6lWEWZxCsfYFfKqYXSezO4roe87qNo2J4rR3lqEp4eEHKUzXqZhg6mUhhLdkj
         V5qz6VXh1MxIZcrxnwA7iIt3LxcF+IAQ6i8ZNwKUt6aKXEhcB9ub8oqI4YobY7D3AaU7
         16mg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=D4N79DNc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v12-20020a0cf90c000000b0067a9a7a845esi6251503qvn.174.2023.12.03.15.44.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Dec 2023 15:44:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=D4N79DNc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r9w85-00011d-Nf; Sun, 03 Dec 2023 18:44:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1r9w7H-0007Xk-8b; Sun, 03 Dec 2023 18:43:15 -0500
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1r9w7E-0002tp-2r; Sun, 03 Dec 2023 18:43:15 -0500
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-59b5484fbe6so43981447b3.1; 
 Sun, 03 Dec 2023 15:43:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701646987; x=1702251787; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VOsDq4GO7J9Ybd/9mWWm7M2ltcuRdDgkXqPddf6YrXg=;
 b=D4N79DNcCTe9tpyQ/d8k0ExWn1YWIxIXmXqetTOK9g1/I3caGnxnhI+PWLmHAl+ZQS
 9woV2DUtmkJcCbbbw5Y8hYUOY/oeIXuP/eTWh2pZ0nsMp76+SvlpmceSkDJsEWZa5f/Q
 R0WSEyMpdsnI9/7oHvGfkBPwUWODdTy356+bWQuRh/9HjBOX0ZzJsAnHKpg6/qjXnLou
 IHKrbi97do0TqYwH2XNuY9x3O5wjsIqXnsQPqkv311jHchr7353TXr1kfuzFYgWOTAmK
 aiHBuy53L/N5gT0dP3tMrm3DFFOJiccDIqjNfLPXn7YvigOyIUMtd3NqJbyZwT7/yk83
 BxnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701646987; x=1702251787;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VOsDq4GO7J9Ybd/9mWWm7M2ltcuRdDgkXqPddf6YrXg=;
 b=Najy7ynd6t4g+LIqa/7H1PI9zaFvRCxkDJf+Xm0M4+5rHr6cI/zBpfOuoWrjciJ4aa
 rJVp1Pc+sF1EAeTqiHXo3uUSPNs2Gcu+CvHjt/cBICzA+eBi/CtX0zkm8AJop7sqZZaP
 mxYXnYt7qOok7xiEBXzMkhYaNUtBqvftDpE0Ar9/JcY9zWUCbLEtswBmHY4fQtT5jc3x
 A70059y39ptMr1hG5bqmTQaHW0VH+VbYQjokWiOd7y1nyg+/YLqo6AIA8wVb+vEtyZ8v
 7IywXdH0xEidHLcmTD6dO4XaIO2vRk33N1DjaDxewcm/qu9FwMaYFaYYLPDh4geZGNUH
 V30Q==
X-Gm-Message-State: AOJu0Yx5yzGhyve5ZGxH8rSTSt90XRowFkfZx8VBg3FjFo9WyJISfLBt
 Hj1Bn+FxQU6euyuNTvd0PWOWkzXCpmzFEg==
X-Received: by 2002:a81:ae0f:0:b0:5d7:1940:b36a with SMTP id
 m15-20020a81ae0f000000b005d71940b36amr2611473ywh.54.1701646987470; 
 Sun, 03 Dec 2023 15:43:07 -0800 (PST)
Received: from localhost.localdomain ([201.206.180.22])
 by smtp.gmail.com with ESMTPSA id
 c126-20020a0dda84000000b005d718fff165sm1536299ywe.78.2023.12.03.15.43.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Dec 2023 15:43:02 -0800 (PST)
From: Sergey Kambalin <serg.oker@gmail.com>
X-Google-Original-From: Sergey Kambalin <sergey.kambalin@auriga.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	Sergey Kambalin <sergey.kambalin@auriga.com>
Subject: [PATCH v3 41/45] Add mailbox property tests. Part 2
Date: Sun,  3 Dec 2023 17:42:09 -0600
Message-Id: <20231203234213.1366214-42-sergey.kambalin@auriga.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230726132512.149618-1-sergey.kambalin@auriga.com>
References: <20230726132512.149618-1-sergey.kambalin@auriga.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=serg.oker@gmail.com; helo=mail-yw1-x112a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
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
X-TUID: qY0ADjFrbe/n

Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
---
 tests/qtest/bcm2838-mbox-property-test.c | 196 ++++++++++++++++++++++-
 1 file changed, 195 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/bcm2838-mbox-property-test.c b/tests/qtest/bcm2838-mbox-property-test.c
index 80746dbb95..5322c563a0 100644
--- a/tests/qtest/bcm2838-mbox-property-test.c
+++ b/tests/qtest/bcm2838-mbox-property-test.c
@@ -49,7 +49,8 @@ FIELD(GET_CLOCK_STATE_CMD, NPRES, 1, 1)
                       (TEST_TAG_TYPE(testname) * tag);                         \
     static void CHECK_FN_NAME(testname, __VA_ARGS__)                           \
                              (TEST_TAG_TYPE(testname) *tag);                   \
-    static void TEST_FN_NAME(testname, __VA_ARGS__)(void) {                    \
+    static void TEST_FN_NAME(testname, __VA_ARGS__)(void)                      \
+    {                                                                          \
         struct {                                                               \
             MboxBufHeader header;                                              \
             TEST_TAG_TYPE(testname) tag;                                       \
@@ -188,6 +189,179 @@ DECLARE_TEST_CASE_SETUP(GET_MIN_CLOCK_RATE, EMMC) {
 }
 
 /*----------------------------------------------------------------------------*/
+DECLARE_TEST_CASE(GET_CLOCK_RATE, UART) {
+    g_assert_cmphex(tag->response.value.clock_id, ==, CLOCK_ID_UART);
+    g_assert_cmphex(tag->response.value.rate, ==, CLOCK_RATE_UART);
+}
+DECLARE_TEST_CASE_SETUP(GET_CLOCK_RATE, UART) {
+    tag->request.value.clock_id = CLOCK_ID_UART;
+}
+
+/*----------------------------------------------------------------------------*/
+DECLARE_TEST_CASE(GET_MAX_CLOCK_RATE, UART) {
+    g_assert_cmphex(tag->response.value.clock_id, ==, CLOCK_ID_UART);
+    g_assert_cmphex(tag->response.value.rate, ==, CLOCK_RATE_UART);
+}
+DECLARE_TEST_CASE_SETUP(GET_MAX_CLOCK_RATE, UART) {
+    tag->request.value.clock_id = CLOCK_ID_UART;
+}
+
+/*----------------------------------------------------------------------------*/
+DECLARE_TEST_CASE(GET_MIN_CLOCK_RATE, UART) {
+    g_assert_cmphex(tag->response.value.clock_id, ==, CLOCK_ID_UART);
+    g_assert_cmphex(tag->response.value.rate, ==, CLOCK_RATE_UART);
+}
+DECLARE_TEST_CASE_SETUP(GET_MIN_CLOCK_RATE, UART) {
+    tag->request.value.clock_id = CLOCK_ID_UART;
+}
+
+/*----------------------------------------------------------------------------*/
+DECLARE_TEST_CASE(GET_CLOCK_RATE, CORE) {
+    g_assert_cmphex(tag->response.value.clock_id, ==, CLOCK_ID_CORE);
+    g_assert_cmphex(tag->response.value.rate, ==, CLOCK_RATE_CORE);
+}
+DECLARE_TEST_CASE_SETUP(GET_CLOCK_RATE, CORE) {
+    tag->request.value.clock_id = CLOCK_ID_CORE;
+}
+
+/*----------------------------------------------------------------------------*/
+DECLARE_TEST_CASE(GET_MAX_CLOCK_RATE, CORE) {
+    g_assert_cmphex(tag->response.value.clock_id, ==, CLOCK_ID_CORE);
+    g_assert_cmphex(tag->response.value.rate, ==, CLOCK_RATE_CORE);
+}
+DECLARE_TEST_CASE_SETUP(GET_MAX_CLOCK_RATE, CORE) {
+    tag->request.value.clock_id = CLOCK_ID_CORE;
+}
+
+/*----------------------------------------------------------------------------*/
+DECLARE_TEST_CASE(GET_MIN_CLOCK_RATE, CORE) {
+    g_assert_cmphex(tag->response.value.clock_id, ==, CLOCK_ID_CORE);
+    g_assert_cmphex(tag->response.value.rate, ==, CLOCK_RATE_CORE);
+}
+DECLARE_TEST_CASE_SETUP(GET_MIN_CLOCK_RATE, CORE) {
+    tag->request.value.clock_id = CLOCK_ID_CORE;
+}
+
+/*----------------------------------------------------------------------------*/
+DECLARE_TEST_CASE(GET_CLOCK_RATE, ANY) {
+    g_assert_cmphex(tag->response.value.clock_id, ==, CLOCK_ID_UNDEFINED);
+    g_assert_cmphex(tag->response.value.rate, ==, CLOCK_RATE_ANY);
+}
+DECLARE_TEST_CASE_SETUP(GET_CLOCK_RATE, ANY) {
+    tag->request.value.clock_id = CLOCK_ID_UNDEFINED;
+}
+
+/*----------------------------------------------------------------------------*/
+DECLARE_TEST_CASE(GET_MAX_CLOCK_RATE, ANY) {
+    g_assert_cmphex(tag->response.value.clock_id, ==, CLOCK_ID_UNDEFINED);
+    g_assert_cmphex(tag->response.value.rate, ==, CLOCK_RATE_ANY);
+}
+DECLARE_TEST_CASE_SETUP(GET_MAX_CLOCK_RATE, ANY) {
+    tag->request.value.clock_id = CLOCK_ID_UNDEFINED;
+}
+
+/*----------------------------------------------------------------------------*/
+DECLARE_TEST_CASE(GET_MIN_CLOCK_RATE, ANY) {
+    g_assert_cmphex(tag->response.value.clock_id, ==, CLOCK_ID_UNDEFINED);
+    g_assert_cmphex(tag->response.value.rate, ==, CLOCK_RATE_ANY);
+}
+DECLARE_TEST_CASE_SETUP(GET_MIN_CLOCK_RATE, ANY) {
+    tag->request.value.clock_id = CLOCK_ID_UNDEFINED;
+}
+
+/*----------------------------------------------------------------------------*/
+DECLARE_TEST_CASE(GET_TEMPERATURE) {
+    g_assert_cmphex(tag->response.value.temperature_id, ==, TEMPERATURE_ID_SOC);
+    g_assert_cmpint(tag->response.value.temperature, ==, TEMPERATURE_SOC);
+}
+DECLARE_TEST_CASE_SETUP(GET_TEMPERATURE) {
+    tag->request.value.temperature_id = TEMPERATURE_ID_SOC;
+}
+
+/*----------------------------------------------------------------------------*/
+DECLARE_TEST_CASE(GET_MAX_TEMPERATURE) {
+    g_assert_cmphex(tag->response.value.temperature_id, ==, TEMPERATURE_ID_SOC);
+    g_assert_cmpint(tag->response.value.temperature, ==, TEMPERATURE_SOC_MAX);
+}
+DECLARE_TEST_CASE_SETUP(GET_MAX_TEMPERATURE) {
+    tag->request.value.temperature_id = TEMPERATURE_ID_SOC;
+}
+
+/*----------------------------------------------------------------------------*/
+DECLARE_TEST_CASE(ALLOCATE_BUFFER) {
+    g_assert_cmphex(tag->response.value.base, ==, VC_FB_BASE);
+    g_assert_cmphex(tag->response.value.size, ==, VC_FB_SIZE);
+}
+DECLARE_TEST_CASE_SETUP(ALLOCATE_BUFFER) {
+    tag->request.value.alignment = ALIGN_4K;
+}
+
+/*----------------------------------------------------------------------------*/
+DECLARE_TEST_CASE(RELEASE_FRAMEBUFFER) { 
+    /* No special checks are needed for this test */
+}
+
+/*----------------------------------------------------------------------------*/
+DECLARE_TEST_CASE(BLANK_FRAMEBUFFER) {
+    g_assert_cmphex(tag->response.value.on, ==, 0);
+}
+DECLARE_TEST_CASE_SETUP(BLANK_FRAMEBUFFER) {
+    tag->request.value.on = 0;
+}
+
+/*----------------------------------------------------------------------------*/
+DECLARE_TEST_CASE(TEST_FB_PHYS_WIDTH) {
+    g_assert_cmpint(tag->response.value.width, ==, DUMMY_VALUE);
+    g_assert_cmpint(tag->response.value.height, ==, DUMMY_VALUE);
+}
+DECLARE_TEST_CASE_SETUP(TEST_FB_PHYS_WIDTH) {
+    tag->request.value.width = DUMMY_VALUE;
+    tag->request.value.height = DUMMY_VALUE;
+}
+
+/*----------------------------------------------------------------------------*/
+DECLARE_TEST_CASE(GET_FB_PHYS_WIDTH, INITIAL) {
+    g_assert_cmpint(tag->response.value.width, ==, 640);
+    g_assert_cmpint(tag->response.value.height, ==, 480);
+}
+
+/*----------------------------------------------------------------------------*/
+DECLARE_TEST_CASE(SET_FB_PHYS_WIDTH) {
+    g_assert_cmpint(tag->response.value.width, ==, 800);
+    g_assert_cmpint(tag->response.value.height, ==, 600);
+}
+DECLARE_TEST_CASE_SETUP(SET_FB_PHYS_WIDTH) {
+    tag->request.value.width = 800;
+    tag->request.value.height = 600;
+}
+
+/*----------------------------------------------------------------------------*/
+DECLARE_TEST_CASE(TEST_FB_VIRT_WIDTH) {
+    g_assert_cmpint(tag->response.value.width, ==, DUMMY_VALUE);
+    g_assert_cmpint(tag->response.value.height, ==, DUMMY_VALUE);
+}
+DECLARE_TEST_CASE_SETUP(TEST_FB_VIRT_WIDTH) {
+    tag->request.value.width = DUMMY_VALUE;
+    tag->request.value.height = DUMMY_VALUE;
+}
+
+/*----------------------------------------------------------------------------*/
+DECLARE_TEST_CASE(GET_FB_VIRT_WIDTH, INITIAL) {
+    g_assert_cmpint(tag->response.value.width, ==, 640);
+    g_assert_cmpint(tag->response.value.height, ==, 480);
+}
+
+/*----------------------------------------------------------------------------*/
+DECLARE_TEST_CASE(SET_FB_VIRT_WIDTH) {
+    g_assert_cmpint(tag->response.value.width, ==, 800);
+    g_assert_cmpint(tag->response.value.height, ==, 600);
+}
+DECLARE_TEST_CASE_SETUP(SET_FB_VIRT_WIDTH) {
+    tag->request.value.width = 800;
+    tag->request.value.height = 600;
+}
+
+//==============================================================================
 int main(int argc, char **argv)
 {
     g_test_init(&argc, &argv, NULL);
@@ -201,6 +375,26 @@ int main(int argc, char **argv)
     QTEST_ADD_TEST_CASE(GET_CLOCK_RATE, EMMC);
     QTEST_ADD_TEST_CASE(GET_MAX_CLOCK_RATE, EMMC);
     QTEST_ADD_TEST_CASE(GET_MIN_CLOCK_RATE, EMMC);
+    QTEST_ADD_TEST_CASE(GET_CLOCK_RATE, UART);
+    QTEST_ADD_TEST_CASE(GET_MAX_CLOCK_RATE, UART);
+    QTEST_ADD_TEST_CASE(GET_MIN_CLOCK_RATE, UART);
+    QTEST_ADD_TEST_CASE(GET_CLOCK_RATE, CORE);
+    QTEST_ADD_TEST_CASE(GET_MAX_CLOCK_RATE, CORE);
+    QTEST_ADD_TEST_CASE(GET_MIN_CLOCK_RATE, CORE);
+    QTEST_ADD_TEST_CASE(GET_CLOCK_RATE, ANY);
+    QTEST_ADD_TEST_CASE(GET_MAX_CLOCK_RATE, ANY);
+    QTEST_ADD_TEST_CASE(GET_MIN_CLOCK_RATE, ANY);
+    QTEST_ADD_TEST_CASE(GET_TEMPERATURE);
+    QTEST_ADD_TEST_CASE(GET_MAX_TEMPERATURE);
+    QTEST_ADD_TEST_CASE(ALLOCATE_BUFFER);
+    QTEST_ADD_TEST_CASE(RELEASE_FRAMEBUFFER);
+    QTEST_ADD_TEST_CASE(BLANK_FRAMEBUFFER);
+    QTEST_ADD_TEST_CASE(TEST_FB_PHYS_WIDTH);
+    QTEST_ADD_TEST_CASE(GET_FB_PHYS_WIDTH, INITIAL);
+    QTEST_ADD_TEST_CASE(SET_FB_PHYS_WIDTH);
+    QTEST_ADD_TEST_CASE(TEST_FB_VIRT_WIDTH);
+    QTEST_ADD_TEST_CASE(GET_FB_VIRT_WIDTH, INITIAL);
+    QTEST_ADD_TEST_CASE(SET_FB_VIRT_WIDTH);
 
     return g_test_run();
 }
-- 
2.34.1


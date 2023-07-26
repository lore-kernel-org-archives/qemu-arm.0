Received: by 2002:a17:906:2484:b0:98d:b2f5:1316 with SMTP id e4csp551099ejb;
        Wed, 26 Jul 2023 06:34:29 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHaxAGnbGKXRhBOxypLLwJ8uy92KbF8USkJBB/Wmwkrz8oYLsa0Yg/J3ffAd+Ol68LN9/Dh
X-Received: by 2002:a05:6214:4a4d:b0:635:d5c5:15d2 with SMTP id ph13-20020a0562144a4d00b00635d5c515d2mr1822645qvb.18.1690378469742;
        Wed, 26 Jul 2023 06:34:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690378469; cv=none;
        d=google.com; s=arc-20160816;
        b=0uBt6aPbINQyt9YqOeX8Bkwkhg3cSZbjxfTL0y+unT4D+ArZThSEv0CtIZSo8OeHNc
         TwVn6erQG/zgFEFATQ9g3ocFt5YW02DIaCD6LnEfG39Ad3sWUvf8lk+AwzXSuXawz7NI
         5ZBPKuy8fnLZJlb/skDEBVtDy1YH349dtcbrga75/Io/OgFj0j2+p52k3B1MoU/0JpOq
         qXNLeo3rhqE4luFIHRgPTdstievDtiOME79swmQDmu6riOecMJ7gJ27SzviA1lJwo+H/
         Pg9vqViE0U9YKC1XxkCChd2qwa5Umr3LvFIiaZXryJrzg3ZgGV0BStmZFmB0z3KEQr4u
         dKmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=bQnjdK8b0RxyGeJP30LASlRTWUyivm6n+TKneE6OaFM=;
        fh=f5jt6gD4kTKAQV2ukO6ZfXPs+EJm4Q1+uDtHV6gcJRE=;
        b=rNY0wcdjXCQtuBq6jhePiAcug5GHnHgsUoXKJf1I73jfGHoefHnoAFlNTfBJe0KkTF
         Hl18jBLkLoRqYiMOgpiAQt//skZJElYyG7uqATeoJSIDLmBuySNfwkE7eyLjaOcvlFLS
         NEJ1Bo0lficA5GgXIb0DTM/nr/IF78zg3kcU4QN+mvCSVOCNCQ5+9xF6x7Hv1FtMKmE5
         GnvHevP7bFxCHqM08xfBC//GSyGe8cLZ6+B3c1xtfniKr/QOPZLGzU1FxhRcyrNzUR34
         xymlDd/QicutCxO9H4J18LrSQwbwEAa0X3K/7oz0/Czfad4hjFdLJE5DOcI/lBKkVd1/
         1y8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=fNcood1H;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l4-20020a0cac04000000b0062b68fcf6e8si7779033qvb.342.2023.07.26.06.34.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Jul 2023 06:34:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=fNcood1H;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qOeXO-0003HG-7w; Wed, 26 Jul 2023 09:26:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1qOeWr-00034L-BS; Wed, 26 Jul 2023 09:26:13 -0400
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1qOeWp-0003XB-3l; Wed, 26 Jul 2023 09:26:13 -0400
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-4fe05fbe250so2998050e87.0; 
 Wed, 26 Jul 2023 06:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690377969; x=1690982769;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bQnjdK8b0RxyGeJP30LASlRTWUyivm6n+TKneE6OaFM=;
 b=fNcood1H4RlCy/L6vb2rP6q/4MNie9vFENiXMxi0GHwpuKt/0jCd/53MsH81xFWWI5
 9nwxu/fxE+dDUh6FiBYF/wT52BaRBAtbUfcP3kTZpnMsVcjHYJMjS+F3WUThaFkG1KGz
 tjbeZIwStYohT6MbYDlsfYH2lhbzK7E1UzMz5zmzSnUfNtx8Knxd3zs3gM1rc9+4czW4
 ZZl+c++dWujaGDxQI4rN7qyBkIkb0hdMuV2kybZ7xQ86wCoubwWOBvtzlRIVUeu0+81V
 a9CDBh52oMyYFq1Aj/EHmQQQyZyEfRSuPuTLxNTkmemBjgegbLeccuBP38Tyhspopa+G
 Mn2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690377969; x=1690982769;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bQnjdK8b0RxyGeJP30LASlRTWUyivm6n+TKneE6OaFM=;
 b=jRBIq8AMyXxewNAaNUw/MU7p2YE9OJYvVps7FAyPzulWlijf29oIxvnM6omnTeP5/j
 QMCikCkp3VNUBlEE/J0fahPq1itKVIHRmMimw6+ivt38aV/klTLJfyYeum1aGdqmptMj
 zSS7W0xVMTgDr3FtcH5ypMWb6mnWy9Xt+b8GY2BVH9BcQxVI9BCewfnxXT/6Lo4GYrT1
 eoQ7UtbHi8IsI02OcBxiXMyyCSaYBJIzyhZ9sY6lzw5PU5bED46yOA+3nblNubiZJyrT
 o7e+WqEZFSWaryzZaTo58cfoWAKWWh5CFB9X/DYLVFVHHmJb6NVjNL4eFUUQ2BRNzRjW
 uCPQ==
X-Gm-Message-State: ABy/qLadEPCu2wn9bvohMbZ0xkbD/wOkD1ZcFIogypfOHdFjnBmYI9JS
 4bs9e+2LHxYUb3n7s+S5cO0dTPoRvtI=
X-Received: by 2002:a05:6512:2824:b0:4f9:5196:5ed0 with SMTP id
 cf36-20020a056512282400b004f951965ed0mr1747883lfb.7.1690377968621; 
 Wed, 26 Jul 2023 06:26:08 -0700 (PDT)
Received: from sergevik-thinkpad.localdomain ([213.197.136.186])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a19f516000000b004fe0c3d8bb4sm565079lfb.84.2023.07.26.06.26.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jul 2023 06:26:08 -0700 (PDT)
From: Sergey Kambalin <serg.oker@gmail.com>
X-Google-Original-From: Sergey Kambalin <sergey.kambalin@auriga.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	Sergey Kambalin <sergey.kambalin@auriga.com>
Subject: [PATCH 41/44] Add mailbox property tests. Part 2
Date: Wed, 26 Jul 2023 16:25:09 +0300
Message-Id: <20230726132512.149618-42-sergey.kambalin@auriga.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230726132512.149618-1-sergey.kambalin@auriga.com>
References: <20230726132512.149618-1-sergey.kambalin@auriga.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=serg.oker@gmail.com; helo=mail-lf1-x136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
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
X-TUID: lH+qkV4Iw3wC

Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
---
 tests/qtest/bcm2838-mbox-property-test.c | 196 ++++++++++++++++++++++-
 1 file changed, 195 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/bcm2838-mbox-property-test.c b/tests/qtest/bcm2838-mbox-property-test.c
index ac173ed3ff..bcee9971c6 100644
--- a/tests/qtest/bcm2838-mbox-property-test.c
+++ b/tests/qtest/bcm2838-mbox-property-test.c
@@ -36,7 +36,8 @@
                       (TEST_TAG_TYPE(testname) * tag);                         \
     static void CHECK_FN_NAME(testname, __VA_ARGS__)                           \
                              (TEST_TAG_TYPE(testname) *tag);                   \
-    static void TEST_FN_NAME(testname, __VA_ARGS__)(void) {                    \
+    static void TEST_FN_NAME(testname, __VA_ARGS__)(void)                      \
+    {                                                                          \
         struct {                                                               \
             MboxBufHeader header;                                              \
             TEST_TAG_TYPE(testname) tag;                                       \
@@ -161,6 +162,179 @@ DECLARE_TEST_CASE_SETUP(GET_MIN_CLOCK_RATE, EMMC) {
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
@@ -174,6 +348,26 @@ int main(int argc, char **argv)
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


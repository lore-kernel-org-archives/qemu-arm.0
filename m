Received: by 2002:a17:906:2484:b0:98d:b2f5:1316 with SMTP id e4csp550985ejb;
        Wed, 26 Jul 2023 06:34:20 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHM2FmaaxijvqnASbZ9fytm/q4vj8DkxPhRZD1RnsRqjWBcSEJKEg7n+e+5Bm+8cWapDT2v
X-Received: by 2002:a05:622a:19a3:b0:403:ce19:6b5f with SMTP id u35-20020a05622a19a300b00403ce196b5fmr2625450qtc.29.1690378460632;
        Wed, 26 Jul 2023 06:34:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690378460; cv=none;
        d=google.com; s=arc-20160816;
        b=sNl0W1X+8aZP24z9lmo6pmmmJNkzz3nsJDfEQWvJskpszLBTiW/NWvEJGHclfZxVQ9
         5asOSdWRJTL3EkNL72SKB7J9vsub1HBFs9mozJZeqMYY8ExsT2mGtVLgFjteQmIsrj7n
         uI7gir0bM2ollVvoofOMWbsfuwoCPjcS2spqrHdY08JH7in5LJM2dQbYBsdP2E7q8hJP
         Ekp29zMP4dhDpxy7C/zzORSl0l/vcJJqr2TJe8K3yTknvWSwhDhNYsQ2084tK9oLJItF
         SASqO+tTFrwIkG346KaEJxWPz7vb8ZSbz2WO7syyYMYgE+YUgiOFzB5hDYrDutWw0lCq
         yOGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=wG1D4Ma/JZJTJFnb417vchh1oBLdE5LjuMoc7/LtHd8=;
        fh=f5jt6gD4kTKAQV2ukO6ZfXPs+EJm4Q1+uDtHV6gcJRE=;
        b=kfn8lr/mIbvydDnaslr3k/lRvxIGqlYK1hN1UC5Xajw7Gux4so5ZsYF+zwCyRl4iBT
         MO8qkQJ0IZOATxm9aa8if924RQL7dYbqQzy46NugKM4xc3z4apbTVWlhpAo710Kq+HyJ
         zlm4X0YYiDMgb/clTzNWIK4HDmGaKgyoXV/1oC2/iKtmWpJlYpxuqYsJjMfqU9pW9+J1
         /lITnUJFt8tejILpUUEUye7i3+/F+QBq86U1MCLsCGORvNeMtkp8otE4TOOOi0xjg5YD
         IfcE0tWDIV5Rb9ZpsGGcbElq6+1s9FAaocyiw/yHx4S+s6bgt7PWrqV1J6Fd4bhjtnfY
         HQjg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=kG6DwNJ3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y10-20020a05622a004a00b003f9a7314533si8342492qtw.127.2023.07.26.06.34.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Jul 2023 06:34:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=kG6DwNJ3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qOeXP-0003IL-Tu; Wed, 26 Jul 2023 09:26:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1qOeWs-00036I-DQ; Wed, 26 Jul 2023 09:26:14 -0400
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1qOeWq-0003Xk-95; Wed, 26 Jul 2023 09:26:14 -0400
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4fe1344b707so775120e87.1; 
 Wed, 26 Jul 2023 06:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690377970; x=1690982770;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wG1D4Ma/JZJTJFnb417vchh1oBLdE5LjuMoc7/LtHd8=;
 b=kG6DwNJ3H9tnNYBzxEabrcgx/7m6H+c+jq70pbq8JxDVc2d6tvVaMNGS7iKP1aR/eS
 DhtAahT7+5D12qBMsaTc8X1F6U0nbYCYZUtNt1Er6Qtf+mPNXNIhayzLqXIkhBWudqus
 Ocie4JylnyVzX7ehxNRpLWn03/UWIjrNMy9pn4SYrQfAVj9V7DFm98KjMGIXqLMvOtor
 VzitR4qwnNtdlqiwG/izJZz+7Nw0nAOELfOmJIFLus1/v6LMw9vxd1mLlDZqSWaU3DpB
 24BdfPBTQCNNNDxG9XaXBtMMXxUDtIgb2/lJdwklMZmzYFzPsgh/0QZdH6YS0zQ9Jd9z
 vF8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690377970; x=1690982770;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wG1D4Ma/JZJTJFnb417vchh1oBLdE5LjuMoc7/LtHd8=;
 b=ZaI1aCQtJKQsqBs5DW8h1u0FOdJAzG7i9nGgnRPGyai+wASAUSzPkzL4Ftp+ZR+DMC
 zXzBHBVWkH+L2ndNF0FlYtlS7HYgEsMKHjXKuof8MH9D2PrHb0ftqV6v9y0Yl8Q76n8Y
 6lhuG3+fnzVtrj7SuaZEWwsWzQpkv6dVxTInycrJjJNT19K/6FnJ607T9dL/Q+ZNn9UK
 rQpua1QgEnmvNrtk2FHWbkCezycSDEhY7UNyQ7t9JAXxZ9MnkPQ9PZGJRugrOe9L1X79
 I2Ys5DHUXiPGeoiIGCwybpGM1xJgt3K+SewAxZjNYUTRIZntSdm5sjE1YL98hPmTqPgK
 Ou3A==
X-Gm-Message-State: ABy/qLbZ0tBhxjGLs0SlruvulhB+tlkf8IwJ4ezHaV9dwLT0cpOux51r
 xUoZLgk2blfJbC608VcaPFYqHrbtloA=
X-Received: by 2002:a19:5e56:0:b0:4fe:df7:bcf5 with SMTP id
 z22-20020a195e56000000b004fe0df7bcf5mr1509562lfi.8.1690377969689; 
 Wed, 26 Jul 2023 06:26:09 -0700 (PDT)
Received: from sergevik-thinkpad.localdomain ([213.197.136.186])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a19f516000000b004fe0c3d8bb4sm565079lfb.84.2023.07.26.06.26.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jul 2023 06:26:09 -0700 (PDT)
From: Sergey Kambalin <serg.oker@gmail.com>
X-Google-Original-From: Sergey Kambalin <sergey.kambalin@auriga.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	Sergey Kambalin <sergey.kambalin@auriga.com>
Subject: [PATCH 42/44] Add mailbox property tests. Part 3
Date: Wed, 26 Jul 2023 16:25:10 +0300
Message-Id: <20230726132512.149618-43-sergey.kambalin@auriga.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230726132512.149618-1-sergey.kambalin@auriga.com>
References: <20230726132512.149618-1-sergey.kambalin@auriga.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=serg.oker@gmail.com; helo=mail-lf1-x134.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_OTHER_BAD_TLD=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
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
X-TUID: h6M7ry3Tk3st

Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
---
 tests/qtest/bcm2838-mbox-property-test.c | 213 ++++++++++++++++++++++-
 1 file changed, 212 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/bcm2838-mbox-property-test.c b/tests/qtest/bcm2838-mbox-property-test.c
index bcee9971c6..e833529a00 100644
--- a/tests/qtest/bcm2838-mbox-property-test.c
+++ b/tests/qtest/bcm2838-mbox-property-test.c
@@ -334,7 +334,194 @@ DECLARE_TEST_CASE_SETUP(SET_FB_VIRT_WIDTH) {
     tag->request.value.height = 600;
 }
 
-//==============================================================================
+/*----------------------------------------------------------------------------*/
+DECLARE_TEST_CASE(TEST_FB_DEPTH) {
+    g_assert_cmpint(tag->response.value.bpp, ==, DUMMY_VALUE);
+}
+DECLARE_TEST_CASE_SETUP(TEST_FB_DEPTH) {
+    tag->request.value.bpp = DUMMY_VALUE;
+}
+
+/*----------------------------------------------------------------------------*/
+DECLARE_TEST_CASE(GET_FB_DEPTH) {
+    g_assert_cmpint(tag->response.value.bpp, ==, 16);
+}
+
+/*----------------------------------------------------------------------------*/
+DECLARE_TEST_CASE(SET_FB_DEPTH) {
+    g_assert_cmpint(tag->response.value.bpp, ==, 24);
+}
+DECLARE_TEST_CASE_SETUP(SET_FB_DEPTH) {
+    tag->request.value.bpp = 24;
+}
+
+/*----------------------------------------------------------------------------*/
+DECLARE_TEST_CASE(TEST_PIXEL_ORDER) {
+    g_assert_cmphex(tag->response.value.pixel_order, ==, DUMMY_VALUE);
+}
+DECLARE_TEST_CASE_SETUP(TEST_PIXEL_ORDER) {
+    tag->request.value.pixel_order = DUMMY_VALUE;
+}
+
+/*----------------------------------------------------------------------------*/
+DECLARE_TEST_CASE(GET_PIXEL_ORDER) {
+    g_assert_cmphex(tag->response.value.pixel_order, ==, PIXEL_ORDER_RGB);
+}
+
+/*----------------------------------------------------------------------------*/
+DECLARE_TEST_CASE(SET_PIXEL_ORDER, BGR) {
+    g_assert_cmphex(tag->response.value.pixel_order, ==, PIXEL_ORDER_BGR);
+}
+DECLARE_TEST_CASE_SETUP(SET_PIXEL_ORDER, BGR) {
+    tag->request.value.pixel_order = PIXEL_ORDER_BGR;
+}
+
+/*----------------------------------------------------------------------------*/
+DECLARE_TEST_CASE(SET_PIXEL_ORDER, RGB) {
+    g_assert_cmphex(tag->response.value.pixel_order, ==, PIXEL_ORDER_BGR);
+}
+DECLARE_TEST_CASE_SETUP(SET_PIXEL_ORDER, RGB) {
+    tag->request.value.pixel_order = PIXEL_ORDER_BGR;
+}
+
+/*----------------------------------------------------------------------------*/
+DECLARE_TEST_CASE(TEST_FB_ALPHA_MODE) {
+    g_assert_cmphex(tag->response.value.alpha_mode, ==, DUMMY_VALUE);
+}
+DECLARE_TEST_CASE_SETUP(TEST_FB_ALPHA_MODE) {
+    tag->request.value.alpha_mode = DUMMY_VALUE;
+}
+
+/*----------------------------------------------------------------------------*/
+DECLARE_TEST_CASE(GET_FB_ALPHA_MODE) {
+    g_assert_cmphex(tag->response.value.alpha_mode, ==, ALPHA_MODE_IGNORED);
+}
+
+/*----------------------------------------------------------------------------*/
+DECLARE_TEST_CASE(SET_FB_ALPHA_MODE, ENABLED) {
+    g_assert_cmphex(tag->response.value.alpha_mode, ==, ALPHA_MODE_ENABLED);
+}
+DECLARE_TEST_CASE_SETUP(SET_FB_ALPHA_MODE, ENABLED) {
+    tag->request.value.alpha_mode = ALPHA_MODE_ENABLED;
+}
+
+/*----------------------------------------------------------------------------*/
+DECLARE_TEST_CASE(SET_FB_ALPHA_MODE, REVERSED) {
+    g_assert_cmphex(tag->response.value.alpha_mode, ==, ALPHA_MODE_REVERSED);
+}
+DECLARE_TEST_CASE_SETUP(SET_FB_ALPHA_MODE, REVERSED) {
+    tag->request.value.alpha_mode = ALPHA_MODE_REVERSED;
+}
+
+/*----------------------------------------------------------------------------*/
+DECLARE_TEST_CASE(SET_FB_ALPHA_MODE, IGNORED) {
+    g_assert_cmphex(tag->response.value.alpha_mode, ==, ALPHA_MODE_IGNORED);
+}
+DECLARE_TEST_CASE_SETUP(SET_FB_ALPHA_MODE, IGNORED) {
+    tag->request.value.alpha_mode = ALPHA_MODE_IGNORED;
+}
+
+/*----------------------------------------------------------------------------*/
+DECLARE_TEST_CASE(GET_PITCH) {
+    g_assert_cmpint(tag->response.value.pitch, ==, 1280);
+}
+
+/*----------------------------------------------------------------------------*/
+DECLARE_TEST_CASE(TEST_VIRTUAL_OFFSET) {
+    g_assert_cmpint(tag->response.value.x, ==, DUMMY_VALUE);
+    g_assert_cmpint(tag->response.value.y, ==, DUMMY_VALUE);
+}
+DECLARE_TEST_CASE_SETUP(TEST_VIRTUAL_OFFSET) {
+    tag->request.value.x = DUMMY_VALUE;
+    tag->request.value.y = DUMMY_VALUE;
+}
+
+/*----------------------------------------------------------------------------*/
+DECLARE_TEST_CASE(GET_VIRTUAL_OFFSET) {
+    g_assert_cmpint(tag->response.value.x, ==, 0);
+    g_assert_cmpint(tag->response.value.y, ==, 0);
+}
+
+/*----------------------------------------------------------------------------*/
+DECLARE_TEST_CASE(SET_VIRTUAL_OFFSET, _0_) {
+    g_assert_cmpint(tag->response.value.x, ==, 0);
+    g_assert_cmpint(tag->response.value.y, ==, 0);
+}
+DECLARE_TEST_CASE_SETUP(SET_VIRTUAL_OFFSET, _0_) {
+    tag->request.value.x = 0;
+    tag->request.value.y = 0;
+}
+
+/*----------------------------------------------------------------------------*/
+DECLARE_TEST_CASE(SET_VIRTUAL_OFFSET, _42_) {
+    g_assert_cmpint(tag->response.value.x, ==, 42);
+    g_assert_cmpint(tag->response.value.y, ==, 42);
+}
+DECLARE_TEST_CASE_SETUP(SET_VIRTUAL_OFFSET, _42_) {
+    tag->request.value.x = 42;
+    tag->request.value.y = 42;
+}
+
+/*----------------------------------------------------------------------------*/
+DECLARE_TEST_CASE(GET_OVERSCAN) {
+    g_assert_cmpint(tag->response.value.top, ==, 0);
+    g_assert_cmpint(tag->response.value.bottom, ==, 0);
+    g_assert_cmpint(tag->response.value.left, ==, 0);
+    g_assert_cmpint(tag->response.value.right, ==, 0);
+}
+
+/*----------------------------------------------------------------------------*/
+DECLARE_TEST_CASE(TEST_OVERSCAN) {
+    g_assert_cmpint(tag->response.value.top, ==, 0);
+    g_assert_cmpint(tag->response.value.bottom, ==, 0);
+    g_assert_cmpint(tag->response.value.left, ==, 0);
+    g_assert_cmpint(tag->response.value.right, ==, 0);
+}
+DECLARE_TEST_CASE_SETUP(TEST_OVERSCAN) {
+    tag->request.value.top = DUMMY_VALUE;
+    tag->request.value.bottom = DUMMY_VALUE;
+    tag->request.value.left = DUMMY_VALUE;
+    tag->request.value.right = DUMMY_VALUE;
+}
+
+/*----------------------------------------------------------------------------*/
+DECLARE_TEST_CASE(SET_OVERSCAN) {
+    g_assert_cmpint(tag->response.value.top, ==, 0);
+    g_assert_cmpint(tag->response.value.bottom, ==, 0);
+    g_assert_cmpint(tag->response.value.left, ==, 0);
+    g_assert_cmpint(tag->response.value.right, ==, 0);
+}
+DECLARE_TEST_CASE_SETUP(SET_OVERSCAN) {
+    tag->request.value.top = DUMMY_VALUE;
+    tag->request.value.bottom = DUMMY_VALUE;
+    tag->request.value.left = DUMMY_VALUE;
+    tag->request.value.right = DUMMY_VALUE;
+}
+
+/*----------------------------------------------------------------------------*/
+DECLARE_TEST_CASE(GET_DMA_CHANNELS) {
+    g_assert_cmphex(tag->response.value.mask, ==, GPIO_MASK);
+}
+
+/*----------------------------------------------------------------------------*/
+DECLARE_TEST_CASE(GET_COMMANDLINE) {
+    /* No special checks are needed for this test case */
+}
+
+/*----------------------------------------------------------------------------*/
+DECLARE_TEST_CASE(GET_NUM_DISPLAYS) {
+    g_assert_cmpint(tag->response.value.num_displays, ==, 1);
+}
+
+/*----------------------------------------------------------------------------*/
+DECLARE_TEST_CASE(SET_PITCH) {
+    /* No special checks are needed for this test case */
+}
+DECLARE_TEST_CASE_SETUP(SET_PITCH) {
+    tag->request.value.pitch = DUMMY_VALUE;
+}
+
+/*----------------------------------------------------------------------------*/
 int main(int argc, char **argv)
 {
     g_test_init(&argc, &argv, NULL);
@@ -368,6 +555,30 @@ int main(int argc, char **argv)
     QTEST_ADD_TEST_CASE(TEST_FB_VIRT_WIDTH);
     QTEST_ADD_TEST_CASE(GET_FB_VIRT_WIDTH, INITIAL);
     QTEST_ADD_TEST_CASE(SET_FB_VIRT_WIDTH);
+    QTEST_ADD_TEST_CASE(TEST_FB_DEPTH);
+    QTEST_ADD_TEST_CASE(GET_FB_DEPTH);
+    QTEST_ADD_TEST_CASE(SET_FB_DEPTH);
+    QTEST_ADD_TEST_CASE(TEST_PIXEL_ORDER);
+    QTEST_ADD_TEST_CASE(GET_PIXEL_ORDER);
+    QTEST_ADD_TEST_CASE(SET_PIXEL_ORDER, BGR);
+    QTEST_ADD_TEST_CASE(SET_PIXEL_ORDER, RGB);
+    QTEST_ADD_TEST_CASE(TEST_FB_ALPHA_MODE);
+    QTEST_ADD_TEST_CASE(GET_FB_ALPHA_MODE);
+    QTEST_ADD_TEST_CASE(SET_FB_ALPHA_MODE, ENABLED);
+    QTEST_ADD_TEST_CASE(SET_FB_ALPHA_MODE, REVERSED);
+    QTEST_ADD_TEST_CASE(SET_FB_ALPHA_MODE, IGNORED);
+    QTEST_ADD_TEST_CASE(GET_PITCH);
+    QTEST_ADD_TEST_CASE(TEST_VIRTUAL_OFFSET);
+    QTEST_ADD_TEST_CASE(GET_VIRTUAL_OFFSET);
+    QTEST_ADD_TEST_CASE(SET_VIRTUAL_OFFSET, _0_);
+    QTEST_ADD_TEST_CASE(SET_VIRTUAL_OFFSET, _42_);
+    QTEST_ADD_TEST_CASE(GET_OVERSCAN);
+    QTEST_ADD_TEST_CASE(TEST_OVERSCAN);
+    QTEST_ADD_TEST_CASE(SET_OVERSCAN);
+    QTEST_ADD_TEST_CASE(GET_DMA_CHANNELS);
+    QTEST_ADD_TEST_CASE(GET_COMMANDLINE);
+    QTEST_ADD_TEST_CASE(GET_NUM_DISPLAYS);
+    QTEST_ADD_TEST_CASE(SET_PITCH);
 
     return g_test_run();
 }
-- 
2.34.1


Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp424999ejb;
        Sun, 18 Feb 2024 17:23:51 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWVwMUq5tNqoHx8WBX0VnFiJ3d0+xcv055qnKhBHK74x3ydpG9KcDMpEtWsqJ8flJdeMY8D2OIqbHILCbZNNsN4nfp6qQpC
X-Google-Smtp-Source: AGHT+IGrJwf+zWQKF5gb7FkYR6gJYQkcAR4I8NR/k0AsQ+1oO+wUckouigft4kghHgIL2wl/q4/W
X-Received: by 2002:a1f:4fc5:0:b0:4c0:1dae:c6a1 with SMTP id d188-20020a1f4fc5000000b004c01daec6a1mr7623087vkb.14.1708305831550;
        Sun, 18 Feb 2024 17:23:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708305831; cv=none;
        d=google.com; s=arc-20160816;
        b=FktD+BWW0yyUIgi12G12Ywu/zhwlm9H7hwx0B/Sqqf8sy6PyWUvKSAlJuX3Gqj8F6I
         25b+QEGgaEj/Zbg1O2MB2HKQ5TH5rrvxSbycSTsQF2N0yW1KoE9HCm+rJuo02CzQxxEe
         Ef/de9raHns+NRz6BfRp8U7s8yD9iVGJfwWDWjf+eWEiJRWIq/bpyzF9qAHzDg3hLQTA
         p2z2e13VwF+ATG6ATaaSjRvJmxNpoTBB5XcK3DF4Shbk5MuwtrYmh0jK53dl5pIFAc2b
         tnVIP9lopNfzOjFcYVHaLXGFaPnzhX7fDpdDXdICAQRdJzkMaQ2DWWOxa5eQRjJXeRlK
         gGng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=6LPieYvae6Kwvk084Ug9jqeJE8wb+azVsaM2Ww4+ELQ=;
        fh=1CWWAdYo81brd4jeYOgzhc83mN/ncVbe89i2SJzFql0=;
        b=t4x9M99gC4ZKy9Z+oi5umKAb7bc3shblqxz+CLsiCB/CRVZ0lN+FRcfc8n981BD7Hg
         MISweQnsLvAL7DtLRKOFAkCHOT3r8/F9Cj0Pg90YNlPcm3V7qwl6+KdR4l5txDTbk9Lu
         vCSg0OAVcrOE463y8fDwQMJWjh/xpIBE7S0ZfX73adIphur7AEGdOoT2xReC7ygJc7vm
         NqQJLEoO27wPlkLXAUKh6/NgDaR1gAp976RtF4SC+2/oGhQqP21PvK94D9yPKAPsmTOd
         f+5Zbn/6FdNFKet/tvDvBkhSHwxu2psAaxGdwsvchzODhck8tf0JmYsYRkYELrWEKm0B
         wxNg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="SQN4/9Fs";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f13-20020ac8498d000000b0042dd6707e2esi5174669qtq.525.2024.02.18.17.23.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 18 Feb 2024 17:23:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="SQN4/9Fs";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rbsJY-0005Ol-Iw; Sun, 18 Feb 2024 20:19:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1rbsIk-0003c0-FG; Sun, 18 Feb 2024 20:18:35 -0500
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1rbsIe-0004L7-Pz; Sun, 18 Feb 2024 20:18:34 -0500
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-6084165494eso664997b3.1; 
 Sun, 18 Feb 2024 17:18:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708305507; x=1708910307; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6LPieYvae6Kwvk084Ug9jqeJE8wb+azVsaM2Ww4+ELQ=;
 b=SQN4/9FssZF31fx3SgneeaR6ZOcVdsbV2p6mmNqkkrg/ZbIVdldFqVzA8QGqP7iD72
 7ii4OAcDv/Ldm6lgkSE3wL1Bp/Y56d7yPy1OZcA3FQHQzBqDVU+6QybutuB5xuGUCN8E
 RY0oHOEVn2+I3wuJlTN775Ubie8qrC8sAIDmdvCJpxeiGPE4pasldH+iLQikDf+CaZo3
 epUBsPJj+6P06l+s55VYc4s5LqBkqYMCelt8WjzUX76Z5fFhb9+VzznljLMEUeu52JKG
 VbCUSzdYQ8HNELtntdx0fkgvBcVnoXoM1+bCGYq0sy5CF0k6vaumxjLr2EtOzXRp9+Z4
 Zbjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708305507; x=1708910307;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6LPieYvae6Kwvk084Ug9jqeJE8wb+azVsaM2Ww4+ELQ=;
 b=F2W+VtwKqie8HcBwVy31USmwJJzqfTlhi4gkFc7g+Bq5Gkc6FISF9jMfENpAzv75fQ
 51h65lGhEqnwNqxpu3BXi8vrs7vz3jk2eOQAb3L6ew4EW2fdTsc9fFQhScQyZDmY/B+z
 PvQZG6LaBBRpOSxssQLzRe6l5dx0gpc4CD+2M0guPtez0R7/uTYeN/HVXjFnMwroFm+o
 LRbICQ7g3ITu7rNf7CftWqC4hys47HLlfMr9ToQZwGvIYU9dD2lRVAPcJVziKv/6x3Ti
 h0Rac5g1W8b0CnQfUa6V3W8vkXUczwKNt39koHT6MvFKbziqxf3LvZ/ZKpEDEaocV3UQ
 BQ2A==
X-Gm-Message-State: AOJu0YwLwDuekriyY4n0xoqWcqxSXzja4yvgBXK6H+juEjcrtI5zYRTk
 roPc77qd63VuB/JDBXnJtPNAtH2G2pHJQSlgHzing8IDf/8GOyuldG8nn+u21ds=
X-Received: by 2002:a81:71d6:0:b0:604:a75:4274 with SMTP id
 m205-20020a8171d6000000b006040a754274mr10609664ywc.51.1708305506886; 
 Sun, 18 Feb 2024 17:18:26 -0800 (PST)
Received: from localhost.localdomain ([201.203.117.224])
 by smtp.gmail.com with ESMTPSA id
 m12-20020a819e0c000000b00607ff905ed3sm1204704ywj.58.2024.02.18.17.18.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Feb 2024 17:18:26 -0800 (PST)
From: Sergey Kambalin <serg.oker@gmail.com>
X-Google-Original-From: Sergey Kambalin <sergey.kambalin@auriga.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	Sergey Kambalin <sergey.kambalin@auriga.com>
Subject: [PATCH v5 38/41] Add mailbox property tests. Part 3
Date: Sun, 18 Feb 2024 19:17:36 -0600
Message-Id: <20240219011739.2316619-39-sergey.kambalin@auriga.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240219011739.2316619-1-sergey.kambalin@auriga.com>
References: <20240219011739.2316619-1-sergey.kambalin@auriga.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=serg.oker@gmail.com; helo=mail-yw1-x112b.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_OTHER_BAD_TLD=1.999, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-TUID: tW0fpyBg12La

Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
---
 tests/qtest/bcm2838-mbox-property-test.c | 213 ++++++++++++++++++++++-
 1 file changed, 212 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/bcm2838-mbox-property-test.c b/tests/qtest/bcm2838-mbox-property-test.c
index b251d3f552..c96a9ba3f3 100644
--- a/tests/qtest/bcm2838-mbox-property-test.c
+++ b/tests/qtest/bcm2838-mbox-property-test.c
@@ -362,7 +362,194 @@ DECLARE_TEST_CASE_SETUP(FRAMEBUFFER_SET_VIRTUAL_WIDTH_HEIGHT) {
     tag->request.value.height = 600;
 }
 
-//==============================================================================
+/*----------------------------------------------------------------------------*/
+DECLARE_TEST_CASE(FRAMEBUFFER_TEST_DEPTH) {
+    g_assert_cmpint(tag->response.value.bpp, ==, DUMMY_VALUE);
+}
+DECLARE_TEST_CASE_SETUP(FRAMEBUFFER_TEST_DEPTH) {
+    tag->request.value.bpp = DUMMY_VALUE;
+}
+
+/*----------------------------------------------------------------------------*/
+DECLARE_TEST_CASE(FRAMEBUFFER_GET_DEPTH) {
+    g_assert_cmpint(tag->response.value.bpp, ==, 16);
+}
+
+/*----------------------------------------------------------------------------*/
+DECLARE_TEST_CASE(FRAMEBUFFER_SET_DEPTH) {
+    g_assert_cmpint(tag->response.value.bpp, ==, 24);
+}
+DECLARE_TEST_CASE_SETUP(FRAMEBUFFER_SET_DEPTH) {
+    tag->request.value.bpp = 24;
+}
+
+/*----------------------------------------------------------------------------*/
+DECLARE_TEST_CASE(FRAMEBUFFER_TEST_PIXEL_ORDER) {
+    g_assert_cmphex(tag->response.value.pixel_order, ==, DUMMY_VALUE);
+}
+DECLARE_TEST_CASE_SETUP(FRAMEBUFFER_TEST_PIXEL_ORDER) {
+    tag->request.value.pixel_order = DUMMY_VALUE;
+}
+
+/*----------------------------------------------------------------------------*/
+DECLARE_TEST_CASE(FRAMEBUFFER_GET_PIXEL_ORDER) {
+    g_assert_cmphex(tag->response.value.pixel_order, ==, PIXEL_ORDER_RGB);
+}
+
+/*----------------------------------------------------------------------------*/
+DECLARE_TEST_CASE(FRAMEBUFFER_SET_PIXEL_ORDER, BGR) {
+    g_assert_cmphex(tag->response.value.pixel_order, ==, PIXEL_ORDER_BGR);
+}
+DECLARE_TEST_CASE_SETUP(FRAMEBUFFER_SET_PIXEL_ORDER, BGR) {
+    tag->request.value.pixel_order = PIXEL_ORDER_BGR;
+}
+
+/*----------------------------------------------------------------------------*/
+DECLARE_TEST_CASE(FRAMEBUFFER_SET_PIXEL_ORDER, RGB) {
+    g_assert_cmphex(tag->response.value.pixel_order, ==, PIXEL_ORDER_BGR);
+}
+DECLARE_TEST_CASE_SETUP(FRAMEBUFFER_SET_PIXEL_ORDER, RGB) {
+    tag->request.value.pixel_order = PIXEL_ORDER_BGR;
+}
+
+/*----------------------------------------------------------------------------*/
+DECLARE_TEST_CASE(FRAMEBUFFER_TEST_ALPHA_MODE) {
+    g_assert_cmphex(tag->response.value.alpha_mode, ==, DUMMY_VALUE);
+}
+DECLARE_TEST_CASE_SETUP(FRAMEBUFFER_TEST_ALPHA_MODE) {
+    tag->request.value.alpha_mode = DUMMY_VALUE;
+}
+
+/*----------------------------------------------------------------------------*/
+DECLARE_TEST_CASE(FRAMEBUFFER_GET_ALPHA_MODE) {
+    g_assert_cmphex(tag->response.value.alpha_mode, ==, ALPHA_MODE_IGNORED);
+}
+
+/*----------------------------------------------------------------------------*/
+DECLARE_TEST_CASE(FRAMEBUFFER_SET_ALPHA_MODE, ENABLED) {
+    g_assert_cmphex(tag->response.value.alpha_mode, ==, ALPHA_MODE_ENABLED);
+}
+DECLARE_TEST_CASE_SETUP(FRAMEBUFFER_SET_ALPHA_MODE, ENABLED) {
+    tag->request.value.alpha_mode = ALPHA_MODE_ENABLED;
+}
+
+/*----------------------------------------------------------------------------*/
+DECLARE_TEST_CASE(FRAMEBUFFER_SET_ALPHA_MODE, REVERSED) {
+    g_assert_cmphex(tag->response.value.alpha_mode, ==, ALPHA_MODE_REVERSED);
+}
+DECLARE_TEST_CASE_SETUP(FRAMEBUFFER_SET_ALPHA_MODE, REVERSED) {
+    tag->request.value.alpha_mode = ALPHA_MODE_REVERSED;
+}
+
+/*----------------------------------------------------------------------------*/
+DECLARE_TEST_CASE(FRAMEBUFFER_SET_ALPHA_MODE, IGNORED) {
+    g_assert_cmphex(tag->response.value.alpha_mode, ==, ALPHA_MODE_IGNORED);
+}
+DECLARE_TEST_CASE_SETUP(FRAMEBUFFER_SET_ALPHA_MODE, IGNORED) {
+    tag->request.value.alpha_mode = ALPHA_MODE_IGNORED;
+}
+
+/*----------------------------------------------------------------------------*/
+DECLARE_TEST_CASE(FRAMEBUFFER_GET_PITCH) {
+    g_assert_cmpint(tag->response.value.pitch, ==, 1280);
+}
+
+/*----------------------------------------------------------------------------*/
+DECLARE_TEST_CASE(FRAMEBUFFER_TEST_VIRTUAL_OFFSET) {
+    g_assert_cmpint(tag->response.value.x, ==, DUMMY_VALUE);
+    g_assert_cmpint(tag->response.value.y, ==, DUMMY_VALUE);
+}
+DECLARE_TEST_CASE_SETUP(FRAMEBUFFER_TEST_VIRTUAL_OFFSET) {
+    tag->request.value.x = DUMMY_VALUE;
+    tag->request.value.y = DUMMY_VALUE;
+}
+
+/*----------------------------------------------------------------------------*/
+DECLARE_TEST_CASE(FRAMEBUFFER_GET_VIRTUAL_OFFSET) {
+    g_assert_cmpint(tag->response.value.x, ==, 0);
+    g_assert_cmpint(tag->response.value.y, ==, 0);
+}
+
+/*----------------------------------------------------------------------------*/
+DECLARE_TEST_CASE(FRAMEBUFFER_SET_VIRTUAL_OFFSET, _0_) {
+    g_assert_cmpint(tag->response.value.x, ==, 0);
+    g_assert_cmpint(tag->response.value.y, ==, 0);
+}
+DECLARE_TEST_CASE_SETUP(FRAMEBUFFER_SET_VIRTUAL_OFFSET, _0_) {
+    tag->request.value.x = 0;
+    tag->request.value.y = 0;
+}
+
+/*----------------------------------------------------------------------------*/
+DECLARE_TEST_CASE(FRAMEBUFFER_SET_VIRTUAL_OFFSET, _42_) {
+    g_assert_cmpint(tag->response.value.x, ==, 42);
+    g_assert_cmpint(tag->response.value.y, ==, 42);
+}
+DECLARE_TEST_CASE_SETUP(FRAMEBUFFER_SET_VIRTUAL_OFFSET, _42_) {
+    tag->request.value.x = 42;
+    tag->request.value.y = 42;
+}
+
+/*----------------------------------------------------------------------------*/
+DECLARE_TEST_CASE(FRAMEBUFFER_GET_OVERSCAN) {
+    g_assert_cmpint(tag->response.value.top, ==, 0);
+    g_assert_cmpint(tag->response.value.bottom, ==, 0);
+    g_assert_cmpint(tag->response.value.left, ==, 0);
+    g_assert_cmpint(tag->response.value.right, ==, 0);
+}
+
+/*----------------------------------------------------------------------------*/
+DECLARE_TEST_CASE(FRAMEBUFFER_TEST_OVERSCAN) {
+    g_assert_cmpint(tag->response.value.top, ==, 0);
+    g_assert_cmpint(tag->response.value.bottom, ==, 0);
+    g_assert_cmpint(tag->response.value.left, ==, 0);
+    g_assert_cmpint(tag->response.value.right, ==, 0);
+}
+DECLARE_TEST_CASE_SETUP(FRAMEBUFFER_TEST_OVERSCAN) {
+    tag->request.value.top = DUMMY_VALUE;
+    tag->request.value.bottom = DUMMY_VALUE;
+    tag->request.value.left = DUMMY_VALUE;
+    tag->request.value.right = DUMMY_VALUE;
+}
+
+/*----------------------------------------------------------------------------*/
+DECLARE_TEST_CASE(FRAMEBUFFER_SET_OVERSCAN) {
+    g_assert_cmpint(tag->response.value.top, ==, 0);
+    g_assert_cmpint(tag->response.value.bottom, ==, 0);
+    g_assert_cmpint(tag->response.value.left, ==, 0);
+    g_assert_cmpint(tag->response.value.right, ==, 0);
+}
+DECLARE_TEST_CASE_SETUP(FRAMEBUFFER_SET_OVERSCAN) {
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
+DECLARE_TEST_CASE(GET_COMMAND_LINE) {
+    /* No special checks are needed for this test case */
+}
+
+/*----------------------------------------------------------------------------*/
+DECLARE_TEST_CASE(FRAMEBUFFER_GET_NUM_DISPLAYS) {
+    g_assert_cmpint(tag->response.value.num_displays, ==, 1);
+}
+
+/*----------------------------------------------------------------------------*/
+DECLARE_TEST_CASE(FRAMEBUFFER_SET_PITCH) {
+    /* No special checks are needed for this test case */
+}
+DECLARE_TEST_CASE_SETUP(FRAMEBUFFER_SET_PITCH) {
+    tag->request.value.pitch = DUMMY_VALUE;
+}
+
+/*----------------------------------------------------------------------------*/
 int main(int argc, char **argv)
 {
     g_test_init(&argc, &argv, NULL);
@@ -396,6 +583,30 @@ int main(int argc, char **argv)
     QTEST_ADD_TEST_CASE(FRAMEBUFFER_TEST_VIRTUAL_WIDTH_HEIGHT);
     QTEST_ADD_TEST_CASE(FRAMEBUFFER_GET_VIRTUAL_WIDTH_HEIGHT, INITIAL);
     QTEST_ADD_TEST_CASE(FRAMEBUFFER_SET_VIRTUAL_WIDTH_HEIGHT);
+    QTEST_ADD_TEST_CASE(FRAMEBUFFER_TEST_DEPTH);
+    QTEST_ADD_TEST_CASE(FRAMEBUFFER_GET_DEPTH);
+    QTEST_ADD_TEST_CASE(FRAMEBUFFER_SET_DEPTH);
+    QTEST_ADD_TEST_CASE(FRAMEBUFFER_TEST_PIXEL_ORDER);
+    QTEST_ADD_TEST_CASE(FRAMEBUFFER_GET_PIXEL_ORDER);
+    QTEST_ADD_TEST_CASE(FRAMEBUFFER_SET_PIXEL_ORDER, BGR);
+    QTEST_ADD_TEST_CASE(FRAMEBUFFER_SET_PIXEL_ORDER, RGB);
+    QTEST_ADD_TEST_CASE(FRAMEBUFFER_TEST_ALPHA_MODE);
+    QTEST_ADD_TEST_CASE(FRAMEBUFFER_GET_ALPHA_MODE);
+    QTEST_ADD_TEST_CASE(FRAMEBUFFER_SET_ALPHA_MODE, ENABLED);
+    QTEST_ADD_TEST_CASE(FRAMEBUFFER_SET_ALPHA_MODE, REVERSED);
+    QTEST_ADD_TEST_CASE(FRAMEBUFFER_SET_ALPHA_MODE, IGNORED);
+    QTEST_ADD_TEST_CASE(FRAMEBUFFER_GET_PITCH);
+    QTEST_ADD_TEST_CASE(FRAMEBUFFER_TEST_VIRTUAL_OFFSET);
+    QTEST_ADD_TEST_CASE(FRAMEBUFFER_GET_VIRTUAL_OFFSET);
+    QTEST_ADD_TEST_CASE(FRAMEBUFFER_SET_VIRTUAL_OFFSET, _0_);
+    QTEST_ADD_TEST_CASE(FRAMEBUFFER_SET_VIRTUAL_OFFSET, _42_);
+    QTEST_ADD_TEST_CASE(FRAMEBUFFER_GET_OVERSCAN);
+    QTEST_ADD_TEST_CASE(FRAMEBUFFER_TEST_OVERSCAN);
+    QTEST_ADD_TEST_CASE(FRAMEBUFFER_SET_OVERSCAN);
+    QTEST_ADD_TEST_CASE(GET_DMA_CHANNELS);
+    QTEST_ADD_TEST_CASE(GET_COMMAND_LINE);
+    QTEST_ADD_TEST_CASE(FRAMEBUFFER_GET_NUM_DISPLAYS);
+    QTEST_ADD_TEST_CASE(FRAMEBUFFER_SET_PITCH);
 
     return g_test_run();
 }
-- 
2.34.1


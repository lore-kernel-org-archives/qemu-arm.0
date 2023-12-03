Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp2334641ejb;
        Sun, 3 Dec 2023 13:52:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFRXI2lCpJPQszGc0Z002/yoIqe4bA6CNZ6ExrIZ8sMQw5bhs/Zd+JGRlkxEVDbBfoGUuB4
X-Received: by 2002:ad4:530e:0:b0:67a:a721:82ef with SMTP id y14-20020ad4530e000000b0067aa72182efmr4467772qvr.73.1701640343689;
        Sun, 03 Dec 2023 13:52:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701640343; cv=none;
        d=google.com; s=arc-20160816;
        b=vWEYV/c1N5Ude6MNJJEZHiCpgAAz/+r206mFdgSAHJxQw3yheCt2g70LF2TarJbTwZ
         r0zUTd3YHKeGT60wM2/wiohq28SdMWgAjguiDv5Pux9iiREiRMG/ALYOMRMXKTPtPJxJ
         +zp9C/OHYH+HANPgcK4ZyaGN14HBwvMaffyb13hKWuc3QbmzQpmdOoxPDpGB6XQVXLqI
         RFEoad+sTashZAJp+sU4i+SQZOpRLMq5o0VSDYNmmTWkE4yb2Zn6uP6knTtgCyiT3e96
         MI7MDVpbyEVQziVIXVIdt2kEoE7Jdctk017xkKBVjo8AGY91cSNIL1ocDLSh8+8GZA/Z
         ZQHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=pjKhO+PzqqrLoVjDzrdEJqubBSeVITy6r+qEgUKg3Ec=;
        fh=1CWWAdYo81brd4jeYOgzhc83mN/ncVbe89i2SJzFql0=;
        b=LDDYvkWnOqZSpPAx1JHjo+j+hWQSfFxYNbP3vTAWt5gyL1nbT/QQhJHE+3bOCRPlT3
         Vh8xZC9yfTveEmgm5bhcyj6QNEvGTZEjc19Hf9BpfwZotERQ7EwRX1m+18RB//lkDw92
         qDziL6ksrwSaVPEgtigtUEvjCJDWWmb3uZa8pacsxIaX5PQiDH+Vh/9gKLqDLlA3nJTI
         LZx+DXXoDuzOlDxgf3bqnBOKeizs6hD39K3V7xZNUIHmj77W1Uu4ut0vOhFuylf6+mtD
         oUquvv/RGBAZuOEMqzR9B7F4gX5YzSDog9DEVNvuiDCIKWkCJ5wqLEtJOBS1vgoC1Y7/
         CLpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=cI5ODfa+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u4-20020a05620a430400b0077dc71760cdsi8449562qko.73.2023.12.03.13.52.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Dec 2023 13:52:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=cI5ODfa+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r9uLo-0003jF-So; Sun, 03 Dec 2023 16:50:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1r9uLm-0003hD-T7; Sun, 03 Dec 2023 16:50:06 -0500
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1r9uLl-0000Eo-Ay; Sun, 03 Dec 2023 16:50:06 -0500
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-5d3687a6574so36443607b3.2; 
 Sun, 03 Dec 2023 13:50:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701640203; x=1702245003; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pjKhO+PzqqrLoVjDzrdEJqubBSeVITy6r+qEgUKg3Ec=;
 b=cI5ODfa+54RUSJPiqo2KEH3BFuAjtdVyGFUw5oLCc/cea+IPbAMlG/A2q1wRLAcOn+
 ZgqGROoGiyVdR6YRllj/JpmA5MMsdYMXjtQ5rl3HzkqeDsKZm4K+du8TMxYSLrXOILDQ
 OjsVo5KeW74OQHxnP8vaoFP+FUg4hYVFuRvPQVFeTQoVjk/mTJxDup9Zh3hqpobWiGdq
 GlGLNJDovlutrPqkRdf7I+FcbTY1TGE/ZjIFfdn2TzwMKalhHQnge8mcNsT2enV3DsdR
 mJ0IYrwtlzmxv1PgtYOM2vp4gquM9kaequRaylTMkVOPjUqWaRM32d6o2YKRP19vI9uP
 LB2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701640203; x=1702245003;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pjKhO+PzqqrLoVjDzrdEJqubBSeVITy6r+qEgUKg3Ec=;
 b=msxZ7lDXRYcVNSXi+6ThhWcIPukzX/wWdpMOowqNR6ehomvCXuNxrHZ2H5JZ3JXqP1
 nEO3nz7LmbLBcrtI+eEkPFvek69DsTDSmGhC2BZDv36q4BXaL6bG1NV9XYnH6pHKJp9L
 8qGR4/MnJBhitEZukkMRAYcZRfQNZgZjWAsZVDVSnXDFaNOp4L86fGkSFYQ8bn6Uv/qr
 L1WPimnxrOxBTblgYIPpHrunBOrFQWJxET3pcJGf4XFW2o37f748nls3Ece6fpAYSCCF
 NGpyQzPVrBui7ibSMKoz1uKrNwW0z3hcii67ouVDOFr3lPA0aOpp6f7m+yXKFqoL4OiY
 psxA==
X-Gm-Message-State: AOJu0Ywj2O8EhggeVXtkGlyp/CvO7p9Oyjxj+uccj0tdewy70z7Ey1dU
 jUCjlMU3+dJ9sHbShuFTI0olZ99ikCbMKA==
X-Received: by 2002:a81:4311:0:b0:5d7:1940:7d76 with SMTP id
 q17-20020a814311000000b005d719407d76mr1935725ywa.77.1701640203483; 
 Sun, 03 Dec 2023 13:50:03 -0800 (PST)
Received: from localhost.localdomain ([201.206.180.22])
 by smtp.gmail.com with ESMTPSA id
 z2-20020a816502000000b00597e912e67esm2832788ywb.131.2023.12.03.13.50.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Dec 2023 13:50:03 -0800 (PST)
From: Sergey Kambalin <serg.oker@gmail.com>
X-Google-Original-From: Sergey Kambalin <sergey.kambalin@auriga.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	Sergey Kambalin <sergey.kambalin@auriga.com>
Subject: [PATCH v3 44/45] Append added properties to mailbox test
Date: Sun,  3 Dec 2023 15:49:09 -0600
Message-Id: <20231203214910.1364468-45-sergey.kambalin@auriga.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231203214910.1364468-44-sergey.kambalin@auriga.com>
References: <20230726132512.149618-1-sergey.kambalin@auriga.com>
 <20231203214910.1364468-1-sergey.kambalin@auriga.com>
 <20231203214910.1364468-2-sergey.kambalin@auriga.com>
 <20231203214910.1364468-3-sergey.kambalin@auriga.com>
 <20231203214910.1364468-4-sergey.kambalin@auriga.com>
 <20231203214910.1364468-5-sergey.kambalin@auriga.com>
 <20231203214910.1364468-6-sergey.kambalin@auriga.com>
 <20231203214910.1364468-7-sergey.kambalin@auriga.com>
 <20231203214910.1364468-8-sergey.kambalin@auriga.com>
 <20231203214910.1364468-9-sergey.kambalin@auriga.com>
 <20231203214910.1364468-10-sergey.kambalin@auriga.com>
 <20231203214910.1364468-11-sergey.kambalin@auriga.com>
 <20231203214910.1364468-12-sergey.kambalin@auriga.com>
 <20231203214910.1364468-13-sergey.kambalin@auriga.com>
 <20231203214910.1364468-14-sergey.kambalin@auriga.com>
 <20231203214910.1364468-15-sergey.kambalin@auriga.com>
 <20231203214910.1364468-16-sergey.kambalin@auriga.com>
 <20231203214910.1364468-17-sergey.kambalin@auriga.com>
 <20231203214910.1364468-18-sergey.kambalin@auriga.com>
 <20231203214910.1364468-19-sergey.kambalin@auriga.com>
 <20231203214910.1364468-20-sergey.kambalin@auriga.com>
 <20231203214910.1364468-21-sergey.kambalin@auriga.com>
 <20231203214910.1364468-22-sergey.kambalin@auriga.com>
 <20231203214910.1364468-23-sergey.kambalin@auriga.com>
 <20231203214910.1364468-24-sergey.kambalin@auriga.com>
 <20231203214910.1364468-25-sergey.kambalin@auriga.com>
 <20231203214910.1364468-26-sergey.kambalin@auriga.com>
 <20231203214910.1364468-27-sergey.kambalin@auriga.com>
 <20231203214910.1364468-28-sergey.kambalin@auriga.com>
 <20231203214910.1364468-29-sergey.kambalin@auriga.com>
 <20231203214910.1364468-30-sergey.kambalin@auriga.com>
 <20231203214910.1364468-31-sergey.kambalin@auriga.com>
 <20231203214910.1364468-32-sergey.kambalin@auriga.com>
 <20231203214910.1364468-33-sergey.kambalin@auriga.com>
 <20231203214910.1364468-34-sergey.kambalin@auriga.com>
 <20231203214910.1364468-35-sergey.kambalin@auriga.com>
 <20231203214910.1364468-36-sergey.kambalin@auriga.com>
 <20231203214910.1364468-37-sergey.kambalin@auriga.com>
 <20231203214910.1364468-38-sergey.kambalin@auriga.com>
 <20231203214910.1364468-39-sergey.kambalin@auriga.com>
 <20231203214910.1364468-40-sergey.kambalin@auriga.com>
 <20231203214910.1364468-41-sergey.kambalin@auriga.com>
 <20231203214910.1364468-42-sergey.kambalin@auriga.com>
 <20231203214910.1364468-43-sergey.kambalin@auriga.com>
 <20231203214910.1364468-44-sergey.kambalin@auriga.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=serg.oker@gmail.com; helo=mail-yw1-x112e.google.com
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
X-TUID: wZ5OBVXbfqGv

Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
---
 tests/qtest/bcm2838-mbox-property-test.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/tests/qtest/bcm2838-mbox-property-test.c b/tests/qtest/bcm2838-mbox-property-test.c
index 1b4a2ed9cb..3a2e7f9194 100644
--- a/tests/qtest/bcm2838-mbox-property-test.c
+++ b/tests/qtest/bcm2838-mbox-property-test.c
@@ -269,6 +269,12 @@ DECLARE_TEST_CASE_SETUP(GET_MIN_CLOCK_RATE, ANY) {
     tag->request.value.clock_id = CLOCK_ID_UNDEFINED;
 }
 
+/*----------------------------------------------------------------------------*/
+DECLARE_TEST_CASE(GET_CLOCKS) {
+    g_assert_cmphex(tag->response.value.root_clock, ==, CLOCK_ID_ROOT);
+    g_assert_cmphex(tag->response.value.arm_clock, ==, CLOCK_ID_ARM);
+}
+
 /*----------------------------------------------------------------------------*/
 DECLARE_TEST_CASE(GET_TEMPERATURE) {
     g_assert_cmphex(tag->response.value.temperature_id, ==, TEMPERATURE_ID_SOC);
@@ -535,17 +541,19 @@ DECLARE_TEST_CASE(GET_COMMANDLINE) {
     /* No special checks are needed for this test case */
 }
 
+/*----------------------------------------------------------------------------*/
+DECLARE_TEST_CASE(GET_THROTTLED) {
+    g_assert_cmpint(tag->response.value.throttled, ==, 0);
+}
+
 /*----------------------------------------------------------------------------*/
 DECLARE_TEST_CASE(GET_NUM_DISPLAYS) {
     g_assert_cmpint(tag->response.value.num_displays, ==, 1);
 }
 
 /*----------------------------------------------------------------------------*/
-DECLARE_TEST_CASE(SET_PITCH) {
-    /* No special checks are needed for this test case */
-}
-DECLARE_TEST_CASE_SETUP(SET_PITCH) {
-    tag->request.value.pitch = DUMMY_VALUE;
+DECLARE_TEST_CASE(INITIALIZE_VCHIQ) {
+    g_assert_cmpint(tag->response.value.zero, ==, 0);
 }
 
 /*----------------------------------------------------------------------------*/
@@ -571,6 +579,7 @@ int main(int argc, char **argv)
     QTEST_ADD_TEST_CASE(GET_CLOCK_RATE, ANY);
     QTEST_ADD_TEST_CASE(GET_MAX_CLOCK_RATE, ANY);
     QTEST_ADD_TEST_CASE(GET_MIN_CLOCK_RATE, ANY);
+    QTEST_ADD_TEST_CASE(GET_CLOCKS);
     QTEST_ADD_TEST_CASE(GET_TEMPERATURE);
     QTEST_ADD_TEST_CASE(GET_MAX_TEMPERATURE);
     QTEST_ADD_TEST_CASE(ALLOCATE_BUFFER);
@@ -604,8 +613,9 @@ int main(int argc, char **argv)
     QTEST_ADD_TEST_CASE(SET_OVERSCAN);
     QTEST_ADD_TEST_CASE(GET_DMA_CHANNELS);
     QTEST_ADD_TEST_CASE(GET_COMMANDLINE);
+    QTEST_ADD_TEST_CASE(GET_THROTTLED);
     QTEST_ADD_TEST_CASE(GET_NUM_DISPLAYS);
-    QTEST_ADD_TEST_CASE(SET_PITCH);
+    QTEST_ADD_TEST_CASE(INITIALIZE_VCHIQ);
 
     return g_test_run();
 }
-- 
2.34.1


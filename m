Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp2386889ejb;
        Sun, 3 Dec 2023 16:31:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGwBTbKYF0kXG4RyBEsJGDAhsSX49cGSX2G0nPhP5hHhU+rJ9+jBxa4YxMPiN5Tpdovfgvx
X-Received: by 2002:ac8:5bc6:0:b0:425:4043:5f1d with SMTP id b6-20020ac85bc6000000b0042540435f1dmr5305896qtb.91.1701649892204;
        Sun, 03 Dec 2023 16:31:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701649892; cv=none;
        d=google.com; s=arc-20160816;
        b=dIixfSu0Ecl+GFbVw+8xjOmQuB52+T+PJHE7JjAU7qNg5pYWr5SYv4umL5d17bBHmZ
         zCM0qJgtK81TmkRSOUMKwzqGm5aNr6QTm1EoIE75bTyAlHg70vYRRMTAgTF8BbTv1tYn
         8APbxK7Jt9MxfEJ8+cp9ahpugtoh5qqgVuRqmWV368nZIadJHaWxQklCBgOtmxSNtQiZ
         rdU9i/CZdXUyANkyix3w7iKMTyBJ8y3xBP+RGSZOEAFM2/0Bttffk+kFVhI74mrvnish
         Kh8bDqK8vVgnUWzQDA7tXTcfu0nOisFukhIDabI8uJfD+R6Bzr0mISqrlCNwwIw1AFhd
         w8eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=pjKhO+PzqqrLoVjDzrdEJqubBSeVITy6r+qEgUKg3Ec=;
        fh=1CWWAdYo81brd4jeYOgzhc83mN/ncVbe89i2SJzFql0=;
        b=jSMXAs8cfYKbVBPq6JyhGzm8v3SlebolLbH1G5JO/tnCnvAwScFKzJIW/A4IddIaRH
         zOkuIto5uKoWGOGsY7uUuHK40t3RLbSXbuk4mQ9OmBQLumZpfZBZNcjWaMk3faNADDDd
         zGyz7dWFj6EYaY/isD5ysoQkypAq0B9GoD4QlJhddxjX7IiWQ0q7xFg/Qlhm7b8cuU+H
         gT/T8X6+UWSBxFTAGNWvsybB+0GbAim6us0xo0Qw45XOZgbv40vMhqhSpgauSFs5+zKK
         T4/qiDjYLgUkro2794A8hDpAOGVMolmoDJIy0COfOb5HkrwJgbCVrmHMCmrZg/c7UNrF
         oR/w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="cpBst/ZY";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d8-20020ac80608000000b0041803fe8db8si7814477qth.293.2023.12.03.16.31.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Dec 2023 16:31:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="cpBst/ZY";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1r9woS-00077b-3W; Sun, 03 Dec 2023 19:27:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1r9wny-00051b-HG; Sun, 03 Dec 2023 19:27:24 -0500
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1r9wnw-0000Kq-VV; Sun, 03 Dec 2023 19:27:22 -0500
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-5cbcfdeaff3so46283097b3.0; 
 Sun, 03 Dec 2023 16:27:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701649639; x=1702254439; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pjKhO+PzqqrLoVjDzrdEJqubBSeVITy6r+qEgUKg3Ec=;
 b=cpBst/ZYSaL9c7a6DR+/F784kiHlijwZcFysNqFZZwBIGx4cBYkm7drmRUu/5BqjWA
 GBKTr4x2Hk7+IhRM7XAxt06Jbced7RGmnlLC4troO7mQdFyl67/tVWGOZhnWUFgYvuuQ
 6mwSc9+yUl86pobgL+BJZvrPsgySLkFluorYSET0vC+3/+Skj9k+S2faac3z/+LOataJ
 xBxNOIeiLMdTwBh8P5Qo4mimt05b795SMjQwJH/qtkOjeeDoyQxHOPcZYJSoUHxANWQN
 ScosK403tfKx+QmLjViXxA7CNHKxrVGZGkfV0uncqX5rxj8F8SXj0N2B4FAniMERul/U
 g0nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701649639; x=1702254439;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pjKhO+PzqqrLoVjDzrdEJqubBSeVITy6r+qEgUKg3Ec=;
 b=IvQtqeNHZtjCV9jySPqAzguyrgc+NLZBBltdCUmNb1/T4QUI93RK5lkSgQe5bAB8jP
 GzXbBuoihdCSjGj+f9DNojk5VFEyNlVbmirOY6aO13Tpebpuqah2mzALLgdHRN0+kiiD
 zMOTKHvnhEMymWUDgJhUmR/1Be09tAGEJVVbfr8K+JWeilXMuVZC8WflI0PQPAcc1RYY
 haBWiz+Na/A6PrjBcoDTiVZmBAQxgJHjh2Adi+8HFQeuMnTU1PvbYozvKFlKSEbmWErX
 sgKYMZuWKs6lH0zOX8qks/VhoZ+w2btU9U1xANG/S1NIVFJvAtJpkKmH8vGeZvM/jgcR
 2WPA==
X-Gm-Message-State: AOJu0YxPfOYmzhnBDbG17bcrf72zH5BjSSwE201tjMpzcCjc/4NomefZ
 6VDChSaBoEGJOcxdomfpgsZlllr0llnkLA==
X-Received: by 2002:a81:4325:0:b0:5d7:1940:f3dc with SMTP id
 q37-20020a814325000000b005d71940f3dcmr2489624ywa.68.1701649639384; 
 Sun, 03 Dec 2023 16:27:19 -0800 (PST)
Received: from localhost.localdomain ([201.206.180.22])
 by smtp.gmail.com with ESMTPSA id
 l63-20020a0de242000000b005d3e6ce07e7sm2443187ywe.6.2023.12.03.16.27.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Dec 2023 16:27:19 -0800 (PST)
From: Sergey Kambalin <serg.oker@gmail.com>
X-Google-Original-From: Sergey Kambalin <sergey.kambalin@auriga.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	Sergey Kambalin <sergey.kambalin@auriga.com>
Subject: [PATCH v3 44/45] Append added properties to mailbox test
Date: Sun,  3 Dec 2023 18:26:18 -0600
Message-Id: <20231204002619.1367044-45-sergey.kambalin@auriga.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231204002619.1367044-1-sergey.kambalin@auriga.com>
References: <20231204002619.1367044-1-sergey.kambalin@auriga.com>
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
X-TUID: 0g6plUaZSOUw

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


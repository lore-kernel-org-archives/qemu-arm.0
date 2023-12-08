Received: by 2002:a17:906:fa94:b0:a1c:d2de:9065 with SMTP id lt20csp2047118ejb;
        Thu, 7 Dec 2023 18:41:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFTwQqm1ijkGfMme8NJG336jirlioGXkzRzmGc1Dp/AzUHDT8fjyhxdbO4L4NDyDH2LLtXR
X-Received: by 2002:a05:622a:1ba3:b0:425:4043:7637 with SMTP id bp35-20020a05622a1ba300b0042540437637mr3874482qtb.95.1702003287883;
        Thu, 07 Dec 2023 18:41:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702003287; cv=none;
        d=google.com; s=arc-20160816;
        b=ZzR8u4w6LHCmAh/HDj2/AFJ4DWS4Nwutgw/25WKHchXVpp6S/A4wx96XLFaPayZEsy
         w/2PCE9Ro6HvmYnbgZpywDPyUpVW5S6sLXez0T+2D949DMwG7S0mf9KJgOFzoy/xSTuw
         mMVlJZb5mKFpfc63lih6LSeOFitHR+WlW0ppkG/pQABsxCg5XVLoRoAtfJUW0sjS2bjc
         gHEB6AEoojUi4BI0jWSzDXvsl4s7ZFeCf29Nzaxzh8HIK7Lbf4+h3kPgcCVxC7j8BzNA
         ZgQE1fd0pBZPAm9DmF+/NrkxgetIcZ7+B5Ym3Hn3Xsxlv8xcUgw5ck4xaTc8NDc2DkcR
         JMvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=pjKhO+PzqqrLoVjDzrdEJqubBSeVITy6r+qEgUKg3Ec=;
        fh=1CWWAdYo81brd4jeYOgzhc83mN/ncVbe89i2SJzFql0=;
        b=whLUrQoaj16V81W6lVSwoqbQCk0tEdZT5Nat1x9IMHb6xTsNSsEMRAhp3/1zcTSMeO
         sfuonsDZ6UW9cx0A65c3gGJEIU3iXBRay7zvQVdX9C8tK1FoVJoCwwr92vOXaag6tUod
         qySuAYVu5OvvFJwGhsHOooFO5uyzYevH8jRoQwmslrwZxx1mkj5cxjwft9Soykb/tapE
         CAKS7kmJsZlrWnXTDoRhpPXidPN6NsfbBoK2KiyeN2oZJdrKtwpMPschXDybPF17EfFp
         H59rJTz2HR2kNb9NAwxPWtojTsUFs6hV7IuDD0P2McvamHpUuNXfBwxFuWT5i6Q6RYIa
         eyNg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=hah7HyQD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l9-20020ac80789000000b0042547b40c20si1053061qth.723.2023.12.07.18.41.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Dec 2023 18:41:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=hah7HyQD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rBQhU-00039g-0w; Thu, 07 Dec 2023 21:34:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1rBQhH-0002aQ-IW; Thu, 07 Dec 2023 21:34:36 -0500
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1rBQhF-0002ti-TV; Thu, 07 Dec 2023 21:34:35 -0500
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2ca0c36f5beso20183971fa.1; 
 Thu, 07 Dec 2023 18:34:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702002870; x=1702607670; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pjKhO+PzqqrLoVjDzrdEJqubBSeVITy6r+qEgUKg3Ec=;
 b=hah7HyQDA9bh6DYhYsXFkI7TnDjoank+PLHho5qSc0SLcYEov55A5wo8NphQ/L3/HQ
 5/52CjB1o+8tOpnrhHmugDZx2QjC5cEJjvreIAwfGWss0R/Kb7FL57FFLc3q+OUBp7yT
 nY+JobeDhtga2lk/bpDMtzeVMbpKpRh300j3kALZCQNGb8BuLZGV3g/7nXajnI7SdMfs
 W9X6hlgumDxYkPcQaku3GQJ0DxpzDhehP0dCi7AtBThnSs7MqfAYhsk5dsumVL+disOv
 X16Zv5DCSYycpAvrQANwNb1fqUy86mO2Ca4vu8jy0k4Url3usPk4OzVtC9FYLWTBGnhu
 1dVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702002870; x=1702607670;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pjKhO+PzqqrLoVjDzrdEJqubBSeVITy6r+qEgUKg3Ec=;
 b=BrD8uS1zjVB6X4ed8ZtZkQzyqgChIDzizzzccP7Yb+FTX31dDZJhgZcc6r7OcBgSrL
 WPXa5yJU0GMf/635sTpM6lSOi8wSNg5/tl7MvYScwx69jtpkn+dDNjiGt33H5WtcfOvS
 ygAWOFCUw/D7KSO0xuCMP1NRugA54YBc4eaqtJVbwaBG8FeWlA4GysGFBjVgRG5l+VhB
 yOJglIqdSL5wqsfZkGCNzXmzOYjENfBa5y+dR6j3zU9bTjyeqJdo0hwjEHuipQIJWmc/
 JLUgjBPb9Ihd28jUIC5qJQqzLiVmCZUiV801MJQC2mgv4iEP2/tBHu9uWF4X87oTNW4g
 7LMA==
X-Gm-Message-State: AOJu0YzSsdDu/IKlbgx2JjMFNNKchszSIIPRZF6d9jh5T0KGfz2HyuGt
 17bjVmf75XBLrp+2WWJIuP2E6uDZbEDWwQ==
X-Received: by 2002:a2e:99d8:0:b0:2ca:3c4:3443 with SMTP id
 l24-20020a2e99d8000000b002ca03c43443mr2050428ljj.80.1702002870010; 
 Thu, 07 Dec 2023 18:34:30 -0800 (PST)
Received: from localhost.localdomain ([185.200.240.39])
 by smtp.gmail.com with ESMTPSA id
 r1-20020a2e94c1000000b002c9e6cbf78esm99062ljh.19.2023.12.07.18.34.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Dec 2023 18:34:29 -0800 (PST)
From: Sergey Kambalin <serg.oker@gmail.com>
X-Google-Original-From: Sergey Kambalin <sergey.kambalin@auriga.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	Sergey Kambalin <sergey.kambalin@auriga.com>
Subject: [PATCH v4 44/45] Append added properties to mailbox test
Date: Thu,  7 Dec 2023 20:31:44 -0600
Message-Id: <20231208023145.1385775-45-sergey.kambalin@auriga.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231208023145.1385775-1-sergey.kambalin@auriga.com>
References: <20231208023145.1385775-1-sergey.kambalin@auriga.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22e;
 envelope-from=serg.oker@gmail.com; helo=mail-lj1-x22e.google.com
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
X-TUID: QaFbyyc382LD

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


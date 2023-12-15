Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp3078923ejo;
        Fri, 15 Dec 2023 06:35:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF+6uT29Nj3IuSsE0mtFKpROAZE24zSBWepzO/AekvWZqkcicOOTziyoGn5g8qeqrYo2uuj
X-Received: by 2002:a05:620a:1271:b0:77e:fba3:a7a4 with SMTP id b17-20020a05620a127100b0077efba3a7a4mr8504391qkl.130.1702650952992;
        Fri, 15 Dec 2023 06:35:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702650952; cv=none;
        d=google.com; s=arc-20160816;
        b=m6l248EPNgL5XES2ZbsVmtGcstW0EapG5oexPvQ6uTwWox3zPo//YMQ5R5hwfgo3YM
         V8Sf7zFWuHIN2EAYasksBY1arbi0V6dBXrrfHso1sy3iOreDWLSlCZhj8e73kplq1u4G
         ZfNjtAIK9qz/YAiBWbG7+mX5psfZRydxoeabF+FD5kczwVpETPg4EChBLwpEBmT24pm4
         taU7y/El4ZUBbST4+655KxHeCYCHY5/hzxYQstUIJ6D+eI7t46zvvnue7M+mebcDZ4UY
         /4FYIOLB/RseHW8JVk8Lu+o3RJnd2LHRC4X/kcLJRH2WB6qpVrp2mVpHslivZ2F/RWc9
         3ZpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=PjESo1hGicrXSJuzc8/ikLJy3g7YZsAZPMf0CYcl+Xo=;
        fh=KAckGS8cluMEU0VODVvNv996HS0WruXBMef6XWL5mFs=;
        b=umTsHU2nQqIpntD7L01+u5W1lmtRrqqbYhiLGwfFYE1jzUDeHosJILkeUiGuQi0fIT
         cUY1jgMuiFNWesiy4TEDsWogaUpULW702VJ2crrpcUsxkef++zPv4OagWBEc14B82EX0
         UFuf3dgMP6ubRAb3oJSmq2wgOSWFuNcf6MEEQaL59Zyj0Y5LiFHyRG7YcQTMvRqtLOqX
         qi2Nf4BLnxFwQHGztiCdsYSKqFtgs4Nhv5E2Ns6H4Usdq/7qWX1rWJCjRkSv3btoYc5I
         MaC2NmB+L98t34GhVfFI6twhI95RS/+1zfv8cvSiIM4Q6843YS9YyN/e6El/7xkBpTTV
         7pmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Tc1O9UOG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x22-20020a05620a0b5600b0077effeed954si16383700qkg.115.2023.12.15.06.35.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Dec 2023 06:35:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Tc1O9UOG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rE9Hy-0000rk-MG; Fri, 15 Dec 2023 09:35:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rE9Hw-0000pq-L0
 for qemu-arm@nongnu.org; Fri, 15 Dec 2023 09:35:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rE9Hu-0003JA-M0
 for qemu-arm@nongnu.org; Fri, 15 Dec 2023 09:35:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1702650933;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=PjESo1hGicrXSJuzc8/ikLJy3g7YZsAZPMf0CYcl+Xo=;
 b=Tc1O9UOGsOU7J8tfYSgHDgA0dYTbM7vL0Ux4MiunbbC4uHgRX+G/bZDF4tNn1HP//HW9/6
 i5YxZWhzlkQ6VlGldkJbUeVC9QZ4xh1f3Le31tHuk1o54SuY0BfYpLO2FjUQtFW0aRVgn3
 qmDgWxUu0PJMcd/o6HtQU8ZarEoOEuY=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-693-f9RH8w1ZMtGsWSsAMTu6XQ-1; Fri,
 15 Dec 2023 09:35:27 -0500
X-MC-Unique: f9RH8w1ZMtGsWSsAMTu6XQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4A9491C0BB53;
 Fri, 15 Dec 2023 14:35:27 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.39.193.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5C16451D5;
 Fri, 15 Dec 2023 14:35:25 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Tyrone Ting <kfting@nuvoton.com>,
 Hao Wu <wuhaotsh@google.com>
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH] tests/qtest/npcm7xx_pwm-test: Only do full testing in slow
 mode
Date: Fri, 15 Dec 2023 15:35:24 +0100
Message-ID: <20231215143524.49241-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: p4OrHbhQRp7r

The npcm7xx_pwm-test can take quite a while when running with
--enable-debug on a loaded system. The tests here are quite
repetitive - by default it should be fine if we only execute
some of them and only execute all when running in slow testing mode.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/npcm7xx_pwm-test.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/tests/qtest/npcm7xx_pwm-test.c b/tests/qtest/npcm7xx_pwm-test.c
index ea4ca1d106..b53a43c417 100644
--- a/tests/qtest/npcm7xx_pwm-test.c
+++ b/tests/qtest/npcm7xx_pwm-test.c
@@ -606,6 +606,7 @@ static void test_toggle(gconstpointer test_data)
     uint32_t ppr, csr, pcr, cnr, cmr;
     int i, j, k, l;
     uint64_t expected_freq, expected_duty;
+    int cnr_step = g_test_quick() ? 2 : 1;
 
     mft_init(qts, td);
 
@@ -618,7 +619,7 @@ static void test_toggle(gconstpointer test_data)
             csr = csr_list[j];
             pwm_write_csr(qts, td, csr);
 
-            for (k = 0; k < ARRAY_SIZE(cnr_list); ++k) {
+            for (k = 0; k < ARRAY_SIZE(cnr_list); k += cnr_step) {
                 cnr = cnr_list[k];
                 pwm_write_cnr(qts, td, cnr);
 
@@ -678,6 +679,7 @@ static void pwm_add_test(const char *name, const TestData* td,
 int main(int argc, char **argv)
 {
     TestData test_data_list[ARRAY_SIZE(pwm_module_list) * ARRAY_SIZE(pwm_list)];
+    int pwm_module_list_cnt = 1, pwm_list_cnt = 1;
 
     char *v_env = getenv("V");
 
@@ -687,8 +689,13 @@ int main(int argc, char **argv)
 
     g_test_init(&argc, &argv, NULL);
 
-    for (int i = 0; i < ARRAY_SIZE(pwm_module_list); ++i) {
-        for (int j = 0; j < ARRAY_SIZE(pwm_list); ++j) {
+    if (!g_test_quick()) {
+        pwm_module_list_cnt = ARRAY_SIZE(pwm_module_list);
+        pwm_list_cnt = ARRAY_SIZE(pwm_list);
+    }
+
+    for (int i = 0; i < pwm_module_list_cnt; ++i) {
+        for (int j = 0; j < pwm_list_cnt; ++j) {
             TestData *td = &test_data_list[i * ARRAY_SIZE(pwm_list) + j];
 
             td->module = &pwm_module_list[i];
-- 
2.43.0


Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp2329466ejb;
        Sun, 3 Dec 2023 13:33:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGUhWi3T18c2SIb8bSIRBbLjfcCmS7zxIKqnBMgof+l6E05t6gTW+6dQ7aVfKgJ3aimLWCe
X-Received: by 2002:a0c:e786:0:b0:67a:a45b:60ab with SMTP id x6-20020a0ce786000000b0067aa45b60abmr4041053qvn.17.1701639233847;
        Sun, 03 Dec 2023 13:33:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701639233; cv=none;
        d=google.com; s=arc-20160816;
        b=Qx78yhYjmmIVRH2J2nbBpq//nq3/RzyXOT27AFvG4H1aK9Ai5iA+TgOTSvB6fA5uTo
         h5KbS5uoCQ7yXt3aQ+cMsHd/7/SpFqY6Uy9owpbfM18Azajkuvh907rsPcjnZY5xNdui
         Pd0CAHyGI59usB8esAqScbACRA6VxT4MkWLMN6VKZGJWn4qvKgEF1R4byz9UTOvi9Jz4
         8qnbfWHr5UtbtkpnaCiROCz9Y7bRaLWTljja4ZzrWlsiX3WIUGtJl1wGn691E45BPCpU
         1sYFZLcFrNkXsW6sHxWXn5p33YSMHXdfq0bNGhPctdqp5PzSwU/IfwmyfwcRxZLm/TV3
         KwXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=pjKhO+PzqqrLoVjDzrdEJqubBSeVITy6r+qEgUKg3Ec=;
        fh=1CWWAdYo81brd4jeYOgzhc83mN/ncVbe89i2SJzFql0=;
        b=L6SBZuDJLQnePGZwRB4M82KPSWdubJCIk4kZZfuaE1EpeLbBTMoUtCFg1LWQWDap1Q
         ZlZLJvJ06fG5wUiKDf11g2sWy1AMKv2cTlmrsGjC+W868G0uAGt4Aa9JLJGVM00ku9Uu
         icArw9ycrZL2yIjWaz2oWcreqvomvB2ZvfHlMK2tC7FE+LZzuhVd/fdjf6ZM8JuSxCRf
         2Eb8WuIyuQyR8Gfe1F+fWUDqoYIdeHRkX+x+EtEJoqJPFEsAeFWsDJWiOgMaLnV/8dOK
         LiZyLKBrtHMJavGRlg2aoAZ6ock454FegK1FecItOTSnPiI3KxScNXCeOphVBLNggocG
         1woQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=h8KuwIY8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n18-20020ad444b2000000b0067a97f4f39dsi6524690qvt.101.2023.12.03.13.33.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Dec 2023 13:33:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=h8KuwIY8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r9u2U-0002YS-Rd; Sun, 03 Dec 2023 16:30:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1r9u2H-0002BO-Jb; Sun, 03 Dec 2023 16:29:57 -0500
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1r9u2G-0005aJ-2t; Sun, 03 Dec 2023 16:29:57 -0500
Received: by mail-yb1-xb2e.google.com with SMTP id
 3f1490d57ef6-da7ea62e76cso2173509276.3; 
 Sun, 03 Dec 2023 13:29:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701638994; x=1702243794; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pjKhO+PzqqrLoVjDzrdEJqubBSeVITy6r+qEgUKg3Ec=;
 b=h8KuwIY8o3PnH230wgqySbQqjmg1lraZjRHFU+iUgQ9iqSwFXphwGpGA6fPXSM7Slc
 XO2F+XtfVFNOMCPqzpMbWo2p6mfEUvJ9YZDqO0F8dYCIHXB88Bq6S4akcX61sDxsVvdP
 nMhYxUDAoNGYswtjcq/BjhODGGUPg0zJFWzjUyD//sdrvmEyME6ZEt9P/8ZT9PlfrWB5
 LOsrkVH+dDHK1nvMoA6wSaHTnctbFN8OSKWXpkQjmPUKMmREvPDbOp2f5VN9B8GSafQq
 WzmXbHkuQby7llXsN35dVetOVTQ3vsm9FYZ7c1VPL/9C+RhZynQcVJeiLqGi+sHVXsq3
 w6Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701638994; x=1702243794;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pjKhO+PzqqrLoVjDzrdEJqubBSeVITy6r+qEgUKg3Ec=;
 b=O/VyYfRRzUP2EY4EJC1ogSaWAtAJ1x2c+AdOcQRI1qJDsGglc/GuqPcGRu48WHcJ90
 Xl7RaLjzLnog5/2qJ5peSTC6RZ4Z1OT7xn3X4PIG7occpvcJxYFeZwdC1YJbvBvda8BK
 nHEVfCmC/WieaeyLokZuus/fkYbImUMt3iUNEC8/6Xu+TDGAxEFnsKsogTM05ZDDVbcr
 XlSTw9N+P5kAJjIoeror5vTMBecMaUsuxpApaRIKoLCLArMFQWRlgTr338SfOE3KF+a/
 UFdGulxIX/i4qWaDjyZgYoZEew4tsGeRM5NMpsxK7dfzbFnm2uTJUO3Y5NmNBxK2nIuL
 JzpQ==
X-Gm-Message-State: AOJu0YyklatUj4oN0wg3EQEqgGq0bBLDOFkPJ90W1mW0+L5xOXw4k4tN
 b75lIZJUHAn3gVsgQhB6IVUkbLYCVpDpfQ==
X-Received: by 2002:a25:6605:0:b0:db9:34c9:87c9 with SMTP id
 a5-20020a256605000000b00db934c987c9mr1408674ybc.101.1701638994583; 
 Sun, 03 Dec 2023 13:29:54 -0800 (PST)
Received: from localhost.localdomain ([201.206.180.22])
 by smtp.gmail.com with ESMTPSA id
 c17-20020a25a291000000b00d9cc606c78csm1807318ybi.41.2023.12.03.13.29.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Dec 2023 13:29:54 -0800 (PST)
From: Sergey Kambalin <serg.oker@gmail.com>
X-Google-Original-From: Sergey Kambalin <sergey.kambalin@auriga.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	Sergey Kambalin <sergey.kambalin@auriga.com>
Subject: [PATCH 44/45] Append added properties to mailbox test
Date: Sun,  3 Dec 2023 15:29:04 -0600
Message-Id: <20231203212905.1364036-45-sergey.kambalin@auriga.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231203212905.1364036-44-sergey.kambalin@auriga.com>
References: <20230726132512.149618-1-sergey.kambalin@auriga.com>
 <20231203212905.1364036-1-sergey.kambalin@auriga.com>
 <20231203212905.1364036-2-sergey.kambalin@auriga.com>
 <20231203212905.1364036-3-sergey.kambalin@auriga.com>
 <20231203212905.1364036-4-sergey.kambalin@auriga.com>
 <20231203212905.1364036-5-sergey.kambalin@auriga.com>
 <20231203212905.1364036-6-sergey.kambalin@auriga.com>
 <20231203212905.1364036-7-sergey.kambalin@auriga.com>
 <20231203212905.1364036-8-sergey.kambalin@auriga.com>
 <20231203212905.1364036-9-sergey.kambalin@auriga.com>
 <20231203212905.1364036-10-sergey.kambalin@auriga.com>
 <20231203212905.1364036-11-sergey.kambalin@auriga.com>
 <20231203212905.1364036-12-sergey.kambalin@auriga.com>
 <20231203212905.1364036-13-sergey.kambalin@auriga.com>
 <20231203212905.1364036-14-sergey.kambalin@auriga.com>
 <20231203212905.1364036-15-sergey.kambalin@auriga.com>
 <20231203212905.1364036-16-sergey.kambalin@auriga.com>
 <20231203212905.1364036-17-sergey.kambalin@auriga.com>
 <20231203212905.1364036-18-sergey.kambalin@auriga.com>
 <20231203212905.1364036-19-sergey.kambalin@auriga.com>
 <20231203212905.1364036-20-sergey.kambalin@auriga.com>
 <20231203212905.1364036-21-sergey.kambalin@auriga.com>
 <20231203212905.1364036-22-sergey.kambalin@auriga.com>
 <20231203212905.1364036-23-sergey.kambalin@auriga.com>
 <20231203212905.1364036-24-sergey.kambalin@auriga.com>
 <20231203212905.1364036-25-sergey.kambalin@auriga.com>
 <20231203212905.1364036-26-sergey.kambalin@auriga.com>
 <20231203212905.1364036-27-sergey.kambalin@auriga.com>
 <20231203212905.1364036-28-sergey.kambalin@auriga.com>
 <20231203212905.1364036-29-sergey.kambalin@auriga.com>
 <20231203212905.1364036-30-sergey.kambalin@auriga.com>
 <20231203212905.1364036-31-sergey.kambalin@auriga.com>
 <20231203212905.1364036-32-sergey.kambalin@auriga.com>
 <20231203212905.1364036-33-sergey.kambalin@auriga.com>
 <20231203212905.1364036-34-sergey.kambalin@auriga.com>
 <20231203212905.1364036-35-sergey.kambalin@auriga.com>
 <20231203212905.1364036-36-sergey.kambalin@auriga.com>
 <20231203212905.1364036-37-sergey.kambalin@auriga.com>
 <20231203212905.1364036-38-sergey.kambalin@auriga.com>
 <20231203212905.1364036-39-sergey.kambalin@auriga.com>
 <20231203212905.1364036-40-sergey.kambalin@auriga.com>
 <20231203212905.1364036-41-sergey.kambalin@auriga.com>
 <20231203212905.1364036-42-sergey.kambalin@auriga.com>
 <20231203212905.1364036-43-sergey.kambalin@auriga.com>
 <20231203212905.1364036-44-sergey.kambalin@auriga.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=serg.oker@gmail.com; helo=mail-yb1-xb2e.google.com
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
X-TUID: yTjsj/GCHb3c

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


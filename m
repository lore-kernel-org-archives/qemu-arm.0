Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp4401615lfa;
        Mon, 2 Nov 2020 17:28:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzq7ec+Gu3kngUs54Zabgg3IbqwqYhlpGHjF8mGGq44c95D0s8JOkxMy14VbD6W9NhrOqT0
X-Received: by 2002:ad4:4512:: with SMTP id k18mr24852913qvu.5.1604366922262;
        Mon, 02 Nov 2020 17:28:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604366922; cv=none;
        d=google.com; s=arc-20160816;
        b=oFMRBJREtBGpfcrIooQGHA22mEqKH2RVMNtR97LGOMctInTZexx0PI3/fv6uhQuaGv
         HSWXKOHQT5xltjKPziRwAgc/XJgQJpYCvm/Wu1Rnd0PgdYY6gl1PAFCzwiGN4kr7MAx6
         rOjixxcbZOhB1Phfx6QRXuCzrR1MhSsk+7xTXZHfRSMOHfmv4t3dJYou1csIbiK/e4ka
         vY8ttrq8yitLHX6QjlGLH36nR2WpYjWAiutldHtg3GQSNLp+tMwQSBM7/5vqEulx8yX0
         0mZzSCZnBsV5mBE2AY7SJJM30qFQf7r8WyuM5qUckdxt3MprDuHColIvlI+T1aKEXN3L
         LytA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:cc:to:subject
         :references:mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=SJM2AYQixjJryNNj/i7eG9v9yAAu5bw1l8yViAnTvj4=;
        b=TV8CwgRrjTgDI5o3sDpF+PY+Gr4Jvpl0jUvDPNTIwQPXAuFAR+bvHGGkR+HW3SVGca
         OCHT/2JM0m3yhemBAg4MLI32rMvf8T2UjbdpOFmOuhQiFUxtDT5Oos/oBSlpRxsdSfd8
         nAarfFvZMA/0F1dH517+qkqMVeZPcuFrLexjaI6j9Up42e7VfnbKcnJK+tq5KJNXwDBM
         aSIeuoFWuxX+Gnkp/2fZkUrfzq1CqaRFaE1vDRv/WYWZFSbl5g2IqEgdZLos1rsnBh+o
         nMYfEkItdtD/GiF14hNc6zSqqvUMh/wwtq3oTeIL/Kkwq3giPTLJAGIC92IAeSbs/zz8
         58IQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=q9q40D6b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d13si6958269qkn.102.2020.11.02.17.28.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Nov 2020 17:28:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=q9q40D6b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:57544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kZl7p-0000u5-Kd
	for alex.bennee@linaro.org; Mon, 02 Nov 2020 20:28:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3Iq-gXwsKCAcozrpuultvlunvvnsl.jvtxlt1-hytuvunu1.vyn@flex--hskinnemoen.bounces.google.com>)
 id 1kZkuv-00085A-SB
 for qemu-arm@nongnu.org; Mon, 02 Nov 2020 20:15:21 -0500
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649]:49188)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3Iq-gXwsKCAcozrpuultvlunvvnsl.jvtxlt1-hytuvunu1.vyn@flex--hskinnemoen.bounces.google.com>)
 id 1kZkur-0005nY-Cg
 for qemu-arm@nongnu.org; Mon, 02 Nov 2020 20:15:21 -0500
Received: by mail-pl1-x649.google.com with SMTP id g10so9679416plq.16
 for <qemu-arm@nongnu.org>; Mon, 02 Nov 2020 17:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=SJM2AYQixjJryNNj/i7eG9v9yAAu5bw1l8yViAnTvj4=;
 b=q9q40D6bxBCEqS6/6skOnTYnQSFABghCHv/Qk8DturrbS5Azv0zmaWXFnTPERZJS10
 a2dZTr0XBQtaBWh8OAcWhr473g02yuPqEtRpGIzOij0z/YPjvWBH5UPyXw56Rem8AHsA
 7oeo2AfD85D072avgcpwUXyQdPMnZGjYg5EZiff+6kDckajUx4LCooDdePVQOyE/LO7a
 ecU1MhJNpOnhHxoO/Uq20XNZn+mENbmigo+QkJida+QMZR8J6HdojyyYc37v/RZDpXp1
 SASsNaRv/inLl2/trH+b2PIawvvXZ9oV+cue1QJyBCELSAbvL+5PhN+V3AC/Zj5OfZV+
 dsSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=SJM2AYQixjJryNNj/i7eG9v9yAAu5bw1l8yViAnTvj4=;
 b=Lz9HYuXCJw/2N5NNDDTparWoIABK+JDjW9AhpL56eUaD93Bf+9rPgCtFkJjzARyhg6
 /creDm0Gt33Y6/YIfJs484bsTNO/1/vYlCjc74z9Gq3930cFmCe0TwMPaZgZU/CiG8j5
 MstECiIcIx5d08v7F+pfehbyFQcFgvBDAYqXn57S7Qpkbw/IbpXDriBGZcIQ+2G7a7U/
 E1OMIRgyP1Z3q+XxySFtiljD/3F4d5ilPQslMUfkz5wIuH0kmdwgXnqCmcX2aC++MzZK
 zTdsyvhS9P9mv0J9ZiP5LW3QKTuZavoQfeWmh4+ZtUeTA4pO+GNzTyg/KxRvjn8kPtPW
 Acxw==
X-Gm-Message-State: AOAM53326BbAGdkjqmsSSHKaS7Vux4espSPibT6q/qfcDfhcKjGcaPz2
 3+RQRCGJQ4uxMlPLEYxicLHLGMF6VidZ3B+XSg==
X-Received: from skybert.c.googlers.com ([fda3:e722:ac3:10:24:72f4:c0a8:3107])
 (user=hskinnemoen job=sendgmr) by
 2002:aa7:83d7:0:b029:164:28d:f350 with SMTP
 id j23-20020aa783d70000b0290164028df350mr23235253pfn.71.1604366114522; Mon,
 02 Nov 2020 17:15:14 -0800 (PST)
Date: Mon,  2 Nov 2020 17:14:56 -0800
In-Reply-To: <20201103011457.2959989-1-hskinnemoen@google.com>
Message-Id: <20201103011457.2959989-3-hskinnemoen@google.com>
Mime-Version: 1.0
References: <20201103011457.2959989-1-hskinnemoen@google.com>
X-Mailer: git-send-email 2.29.1.341.ge80a0c044ae-goog
Subject: [PATCH 2/3] tests/qtest/npcm7xx: Don't call
 g_test_set_nonfatal_assertions
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Havard Skinnemoen <hskinnemoen@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::649;
 envelope-from=3Iq-gXwsKCAcozrpuultvlunvvnsl.jvtxlt1-hytuvunu1.vyn@flex--hskinnemoen.bounces.google.com;
 helo=mail-pl1-x649.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Reply-to: Havard Skinnemoen <hskinnemoen@google.com>
From: Havard Skinnemoen via <qemu-arm@nongnu.org>
X-TUID: L2BhUY4n2Zy5

Even though g_test_set_nonfatal_assertions() makes test failure
reporting a lot better, no other tests currently do this so we'll turn
it off as well.

Signed-off-by: Havard Skinnemoen <hskinnemoen@google.com>
---
 tests/qtest/npcm7xx_gpio-test.c           | 1 -
 tests/qtest/npcm7xx_rng-test.c            | 1 -
 tests/qtest/npcm7xx_timer-test.c          | 1 -
 tests/qtest/npcm7xx_watchdog_timer-test.c | 1 -
 4 files changed, 4 deletions(-)

diff --git a/tests/qtest/npcm7xx_gpio-test.c b/tests/qtest/npcm7xx_gpio-test.c
index 1004cef812..3af49173a7 100644
--- a/tests/qtest/npcm7xx_gpio-test.c
+++ b/tests/qtest/npcm7xx_gpio-test.c
@@ -357,7 +357,6 @@ int main(int argc, char **argv)
     int i;
 
     g_test_init(&argc, &argv, NULL);
-    g_test_set_nonfatal_assertions();
 
     qtest_add_func("/npcm7xx_gpio/dout_to_din", test_dout_to_din);
     qtest_add_func("/npcm7xx_gpio/pullup_pulldown", test_pullup_pulldown);
diff --git a/tests/qtest/npcm7xx_rng-test.c b/tests/qtest/npcm7xx_rng-test.c
index 57787c5ffc..d7e42cf062 100644
--- a/tests/qtest/npcm7xx_rng-test.c
+++ b/tests/qtest/npcm7xx_rng-test.c
@@ -261,7 +261,6 @@ int main(int argc, char **argv)
     int ret;
 
     g_test_init(&argc, &argv, NULL);
-    g_test_set_nonfatal_assertions();
 
     qtest_add_func("npcm7xx_rng/enable_disable", test_enable_disable);
     qtest_add_func("npcm7xx_rng/rosel", test_rosel);
diff --git a/tests/qtest/npcm7xx_timer-test.c b/tests/qtest/npcm7xx_timer-test.c
index f08b0cd62a..77e6e0d472 100644
--- a/tests/qtest/npcm7xx_timer-test.c
+++ b/tests/qtest/npcm7xx_timer-test.c
@@ -530,7 +530,6 @@ int main(int argc, char **argv)
     int i, j;
 
     g_test_init(&argc, &argv, NULL);
-    g_test_set_nonfatal_assertions();
 
     for (i = 0; i < ARRAY_SIZE(timer_block); i++) {
         for (j = 0; j < ARRAY_SIZE(timer); j++) {
diff --git a/tests/qtest/npcm7xx_watchdog_timer-test.c b/tests/qtest/npcm7xx_watchdog_timer-test.c
index 54d5d6d8f2..426303ecfa 100644
--- a/tests/qtest/npcm7xx_watchdog_timer-test.c
+++ b/tests/qtest/npcm7xx_watchdog_timer-test.c
@@ -303,7 +303,6 @@ static void watchdog_add_test(const char *name, const Watchdog* wd,
 int main(int argc, char **argv)
 {
     g_test_init(&argc, &argv, NULL);
-    g_test_set_nonfatal_assertions();
 
     for (int i = 0; i < ARRAY_SIZE(watchdog_list); ++i) {
         const Watchdog *wd = &watchdog_list[i];
-- 
2.29.1.341.ge80a0c044ae-goog


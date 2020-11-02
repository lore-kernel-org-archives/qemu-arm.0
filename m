Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp4019668lfa;
        Mon, 2 Nov 2020 07:25:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxXpGBAqs18dMF861aYT9b8RVsOxbJNgul3DyIg88NJ+padm3WlRhBYK/XGxLH7fdz33Wzh
X-Received: by 2002:a37:9a13:: with SMTP id c19mr15416055qke.126.1604330747736;
        Mon, 02 Nov 2020 07:25:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604330747; cv=none;
        d=google.com; s=arc-20160816;
        b=kC42U6MXzBpK1hHFtid1Qlib1sy68yRbwkndX9QYv2tcNr4QlNgL9rscHU2dinZJOq
         EzUXIbHZNAPstr/IbH8f3J/mwDyltRx/Clu8BTcbltE74FvMm9lvfTNXttppzKoRE9FB
         UiSvWkXHTMT1jSW1q1jOQ1Q4Ygx/7Afutkci8br/P+NwacMOWJeTXDam94WBzmOR9rKa
         ln2eA8CQdjVBId/6CmaIdiMgZ8/iF6fgK8zM3awCzSDCsxdAfNLkaSWA062yi65f/O5k
         Z98Uwh7X4TBUYJts1W/fHgJLxe55oTi73NThBcMml9z7glYY/GM0Nx5yJSBvGyzeK9Qi
         OkAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=tOVjHBCUTdpVBGeIO9jNhl1R0X/cU6YKPF5ubl/f53w=;
        b=YIWcQC4rCpeAPgHg4WXaKM6nfnYKVReq6Mggp0DQEBdBu6Aws7UD4yMfiJlf/vZuAr
         tCUAQcD9YAvBW5UacjY5G41MxWBlxuYiD/6D2GWTir4dDEoHcN49GFY+hL4UwllSLTPU
         ez7W+VPpw3Lo0slmoLmFWGC5qZ4oULqtDfXp9DfMQE1LYUM6ubBsmuJuzuGQ5hKg0SGm
         IzalEMZURLdIOXW/b5Q42c9LwrvMqcXqpD7Te3DMbvNfueHeQmsOcP3aSyW4mHRjoOVe
         SjLTkLiVz0L45PWeGU/l00cQrxLnA/xmYQc6UvgJcmU5FZkAjfbFnJIEx+fqwqcU5f4F
         oVqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MRQfBfzt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w8si6157682qvl.103.2020.11.02.07.25.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Nov 2020 07:25:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MRQfBfzt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kZbiN-0003i0-4C
	for alex.bennee@linaro.org; Mon, 02 Nov 2020 10:25:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kZbhi-00031r-CS
 for qemu-arm@nongnu.org; Mon, 02 Nov 2020 10:25:06 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:46198)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kZbha-0007zc-S1
 for qemu-arm@nongnu.org; Mon, 02 Nov 2020 10:25:05 -0500
Received: by mail-wr1-x441.google.com with SMTP id k10so13739010wrw.13
 for <qemu-arm@nongnu.org>; Mon, 02 Nov 2020 07:24:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tOVjHBCUTdpVBGeIO9jNhl1R0X/cU6YKPF5ubl/f53w=;
 b=MRQfBfzts61X2h0olj0xATIoGOjvf2UUVUtcF9cwHL9M/910ZGabOhReW+a8jPG0Uu
 V0ORSBidldCTbp4nQy7fwzRS1HHIT8i/9oNkaVhGamqWNSqLJrijsUF+trAMlulPTkuv
 nsax5Q18vHVouIvKNS2ODrnZuucNy4DY7j2I231B3Is3ICjTJi57W3cXbFeKVqEKJlvm
 5RUd31bBNKWhKAMzqyjxdY2RoQsPuyl2d9l7zUdn2R+O1vjzseHKK2Ni87tymVUL3JW7
 0njtw4IbSqHbjHtAFjfQm3YyqWgVM7LKeUTUJlT1GMPQ6K9+EuvSceQWunx+QR7F7K2K
 paEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tOVjHBCUTdpVBGeIO9jNhl1R0X/cU6YKPF5ubl/f53w=;
 b=sCf3WPEXzMNNq9rVKc2IxuNFwwngivadzRi5AbThZPqZAhK4Wi3NJcifpqzBWyAa30
 m18+9IJucGwYIBbhSszK/3mNundmcz6kjkSBbb01RX84VurHggGsMZa2wODissiaR5Iz
 J5oR9nTwJHMhQ2N2snAUhdO5yCsPD4xCtWTgEX5H8ENrLPZuJYJVmf/78K6Xq17C9kkA
 KhpUZ3SsakhoN+Lm1M99VAQRbo865Whe8rWwY77IC+HJWKPCKx+q5py3QWkVlBy3W27D
 lxSNHf3FP7OarNR3QvVWkyuGflFNnwhJNyQ1HNhQTy4ycsGqVilbtkSaKj7JHbHos54K
 rVwQ==
X-Gm-Message-State: AOAM530TJG5UD5+9BYdno9iG8TVM+1L+8qwwE7qmuUOcL5A+J3GSKKoN
 r5E9z70txWeaopxIFw697j+NU1thoLLlAw==
X-Received: by 2002:adf:bc0f:: with SMTP id s15mr21065035wrg.83.1604330696935; 
 Mon, 02 Nov 2020 07:24:56 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 9sm12907632wmk.5.2020.11.02.07.24.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 07:24:56 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] tests/qtest/npcm7xx_rng-test: Disable randomness tests
Date: Mon,  2 Nov 2020 15:24:54 +0000
Message-Id: <20201102152454.8287-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Tyrone Ting <kfting@nuvoton.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Havard Skinnemoen <hskinnemoen@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oup3hfeXLBFT

The randomness tests in the NPCM7xx RNG test fail intermittently
but fairly frequently. On my machine running the test in a loop:
 while QTEST_QEMU_BINARY=./qemu-system-aarch64 ./tests/qtest/npcm7xx_rng-test; do true; done

will fail in less than a minute with an error like:
ERROR:../../tests/qtest/npcm7xx_rng-test.c:256:test_first_byte_runs:
assertion failed (calc_runs_p(buf.l, sizeof(buf) * BITS_PER_BYTE) > 0.01): (0.00286205989 > 0.01)

(Failures have been observed on all 4 of the randomness tests,
not just first_byte_runs.)

It's not clear why these tests are failing like this, but intermittent
failures make CI and merge testing awkward, so disable running them
unless a developer specifically sets QEMU_TEST_FLAKY_RNG_TESTS when
running the test suite, until we work out the cause.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/qtest/npcm7xx_rng-test.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/tests/qtest/npcm7xx_rng-test.c b/tests/qtest/npcm7xx_rng-test.c
index da6e639bf6f..e7cde85fbbc 100644
--- a/tests/qtest/npcm7xx_rng-test.c
+++ b/tests/qtest/npcm7xx_rng-test.c
@@ -265,10 +265,16 @@ int main(int argc, char **argv)
 
     qtest_add_func("npcm7xx_rng/enable_disable", test_enable_disable);
     qtest_add_func("npcm7xx_rng/rosel", test_rosel);
-    qtest_add_func("npcm7xx_rng/continuous/monobit", test_continuous_monobit);
-    qtest_add_func("npcm7xx_rng/continuous/runs", test_continuous_runs);
-    qtest_add_func("npcm7xx_rng/first_byte/monobit", test_first_byte_monobit);
-    qtest_add_func("npcm7xx_rng/first_byte/runs", test_first_byte_runs);
+    /*
+     * These tests fail intermittently; only run them on explicit
+     * request until we figure out why.
+     */
+    if (getenv("QEMU_TEST_FLAKY_RNG_TESTS")) {
+        qtest_add_func("npcm7xx_rng/continuous/monobit", test_continuous_monobit);
+        qtest_add_func("npcm7xx_rng/continuous/runs", test_continuous_runs);
+        qtest_add_func("npcm7xx_rng/first_byte/monobit", test_first_byte_monobit);
+        qtest_add_func("npcm7xx_rng/first_byte/runs", test_first_byte_runs);
+    }
 
     qtest_start("-machine npcm750-evb");
     ret = g_test_run();
-- 
2.20.1


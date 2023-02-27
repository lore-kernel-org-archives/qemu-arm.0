Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4304188ejc;
        Sun, 26 Feb 2023 21:56:20 -0800 (PST)
X-Google-Smtp-Source: AK7set/cMMPf3zeD/UlBrd9qFn0JK63CrDY8ujh8q7rPI/Y/XIV6muK+VvOuJyniQfw/TDuKiVyX
X-Received: by 2002:ac8:5801:0:b0:3bc:dd23:cbb2 with SMTP id g1-20020ac85801000000b003bcdd23cbb2mr13133490qtg.33.1677477380149;
        Sun, 26 Feb 2023 21:56:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677477380; cv=none;
        d=google.com; s=arc-20160816;
        b=jaosOyD+PFzAocjc5PGeIqhwR2RXkMBf4NczAZCuyzp86H8bp5TUtZuYyWYSTOiyCg
         ebZGwjOnZ8u7G54yBLhjRIuF30PeXV4bzzDvIpzNollFITHJ4pXbvdUgFuNY1/gHUNcb
         9SC4jKoqr9vV9fXDv5JZy/i6JhcZomX+fqNR1Km4TdzpK90v/7M6B9fHcDSW56L3DOpG
         t8QJwtWs6/lUMGNvrY7fqMv+xYAvbEv5ymU0OaB4r62TUUU5XCKIT2L83Z1mmjd6WqFl
         PDinGQW41t5MONkPcPBTAP9pSdrAj8OE3d3ZcLeoyB1JyPL7ZfhWo19lTBSND/uWtENM
         7T9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=pbVY1YRte3qR5fLZYESRSG1NLBaIN6wrPtZwVv1o2+w=;
        b=JIp53ldCEtUIqTHi85ozdqSBNDM6jh2xBvnN8XOQR895DU9ucBaGjzSCcl4OK/S3OV
         k+pBFaa+HdjkFYkoDKqi0OGODSUTtT1h7Hc1YCcrSMgRAi5gcKoTwZYA+POMia3takjH
         j1qkK5HJ6Igqm5AxhEZqniRkxRUDG6mmK6LXVMXEyACjSsnm9zqqdph4DeduLk+HyfXG
         jEkWmqMiQzTjWaQ3LK92ikHBhblJS1FkbgUj+XxT4fsUCqJv8tU+yUEH3q8uXNbhBx0J
         q5KXaOv8WbcWOljCU6Yu+kQiUwfS0UxDN/iIalCEBayVNUf3qru5fEvYin5t8PvSknft
         hxSw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y2IPbJks;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t8-20020ac85888000000b003b69d412591si6176646qta.292.2023.02.26.21.56.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Feb 2023 21:56:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y2IPbJks;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWWOE-0007oM-5E; Mon, 27 Feb 2023 00:49:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWNA-0003qU-62
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:48:28 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWN6-0007Gb-SF
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:48:27 -0500
Received: by mail-pj1-x1030.google.com with SMTP id x34so4953315pjj.0
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 21:48:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pbVY1YRte3qR5fLZYESRSG1NLBaIN6wrPtZwVv1o2+w=;
 b=Y2IPbJksQGxF2PSh23bEjGAI9C1Jhl6nAcH1ozPNe+Sv4mz35dJzDlRHRKmuRd/WSA
 ZktUPd20LwGAYEOa5MPpQtAcgYtM62xgdNlj9mbedPWgQEL4kfEJv2jIqqlNh6PRgRGg
 bOwJZqL+Q9qulBIOJJXXZn40wBlYc2Y3kCVDDuL4VavsfMMg2qh3Lw/fA81dynCqwgK/
 QsaCXSqNxzbBwVRcSwaA/OyenjIFOYQorXrnXl4oOS2zcw34BS3PptQ6/qvOK3EcWk28
 +zLDgn6MaLZMN3zp7JAq+8GMGm1jbASAUws3mzcFAHnCsOI8B523h6i393LjuDTdgLWs
 8F5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pbVY1YRte3qR5fLZYESRSG1NLBaIN6wrPtZwVv1o2+w=;
 b=MOilupxiJxxojVNYm6bqhMj9t2y4vUM+W5g6iF0RzoXF7moeL4lKb6VJHlTNreF/hp
 zZG+hEViFb2ToBGtmORagS37xzEPW6hfunqrUiEOtCpqMxRbfNUTERdwLMC6GWr+3n/2
 vuHnIVNoSMKb3/G6Gc4i/4sqFT4VUgi5kCHt8Dh/YIvXhR+jm+Y16u494L/Kih/kqeG8
 c4akJeW7+QqB7E+bzUD/sYnOpbAmFbtJvHzPl3Ocdh11rH2EWwKbYqco/KXUFE6Ihzox
 WbUR8SEG0CZF6+qzXYFb2tuIfj4R3zacWE6zuPwx9DxcT8NC5rEtRRCJoyIYGk3uk6cz
 S1Gg==
X-Gm-Message-State: AO0yUKXGOvmhwdP24xKle8ZuY/Yu1EwoUwQFCHOCj+XL3wBGm6V6jUl2
 sCvlvfjSiqBTk46yY8UEGrl5P6uj+YHuSqRhV2Q=
X-Received: by 2002:a17:903:189:b0:19c:df6e:6aec with SMTP id
 z9-20020a170903018900b0019cdf6e6aecmr8702614plg.7.1677476903767; 
 Sun, 26 Feb 2023 21:48:23 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 im16-20020a170902bb1000b0019a983f0119sm3553986plb.307.2023.02.26.21.48.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:48:23 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 60/70] target/tricore: Drop some temp initialization
Date: Sun, 26 Feb 2023 19:42:23 -1000
Message-Id: <20230227054233.390271-61-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: BffVepm1RIw6

The temp variables here are always set afterward;
the initialization with a constant was discarded.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/tricore/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/tricore/translate.c b/target/tricore/translate.c
index 6b7b876808..71c8f3d568 100644
--- a/target/tricore/translate.c
+++ b/target/tricore/translate.c
@@ -6906,7 +6906,7 @@ static void decode_rrr1_maddq_h(DisasContext *ctx)
     r4 = MASK_OP_RRR1_D(ctx->opcode);
     n = MASK_OP_RRR1_N(ctx->opcode);
 
-    temp = tcg_const_i32(n);
+    temp = tcg_temp_new();
     temp2 = tcg_temp_new();
 
     switch (op2) {
@@ -7388,7 +7388,7 @@ static void decode_rrr1_msubq_h(DisasContext *ctx)
     r4 = MASK_OP_RRR1_D(ctx->opcode);
     n = MASK_OP_RRR1_N(ctx->opcode);
 
-    temp = tcg_const_i32(n);
+    temp = tcg_temp_new();
     temp2 = tcg_temp_new();
 
     switch (op2) {
-- 
2.34.1


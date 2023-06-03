Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp1545191ejb;
        Fri, 2 Jun 2023 19:37:38 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ47ere5i3s4r6OCzODqypjmA1W8vpu1Pmcnw7Fn1SwT7x0MnqretccwB+qxFdyurkc3uMJL
X-Received: by 2002:a05:620a:1a92:b0:75b:23a1:441 with SMTP id bl18-20020a05620a1a9200b0075b23a10441mr15578126qkb.7.1685759858282;
        Fri, 02 Jun 2023 19:37:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685759858; cv=none;
        d=google.com; s=arc-20160816;
        b=lRauzGgqQRl5yJyPj6nsW4FQZIVYuw7CVYKqrMrrll84Pbqi1hIjTIgUueMvd+BM/7
         ie/Jkr2kVeWVuCXMrLiweEeb6xyMmuMyr1pP2lemF0ie4z69MuSGpdAuxwAQchHhztA7
         SRba89Zbd7te50+yfj3UObKIvl6PqtYHsakvmkzRogwuxKSMJbzYAxcAyyXMgT2LsFM6
         XKr03rTG2OtCUiKtLwdRKIpgi7ZCxgJN6zvW3OEY/ZBYxRzT0GpqbnvuqmjsQJRZ9dha
         GljL0LLYZTLf35dqkng22YThj+07Aa0sqVZ7en8dT6H0PNRxYzbuMLgWbOSvSNxElYuK
         /rhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=NHMbOR1QTwjqbFmiHyO/57gsxTa7l7mfudPzWiBLsfE=;
        b=yt3DwQgZF0fYGREn6R8oc0slzZObErFLi9xr6NwMpfampusSRwkCL1Rvf8rFX5PLad
         SSl67Kq9fdwXF7HTVziDd08P1vIgUp+6RXN5DNR7Wj0tdtXSyWg2LjTWvdtPW9DdfFx/
         NUsZfi2C0v5p2ao/+qmHZ034owwLYbU6kgNBya9CzyfXtzpbaWxH7hvoBohDjvr43KGw
         AgVHG0BZOSUi8mHYrh7OaWiocT3aVNUscNe7h96HRxnL7bZNfXbrNRcjNfrG+3ZINx++
         En7p1gU2IxTYWcMpPQ5u5arwAOadAa3Jp0o8YVybmAwzJ1vNeT1otulnLUY0QCh8ErCJ
         sHRg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=O2kQUFMA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m9-20020a05620a13a900b0075cd7286b80si275612qki.691.2023.06.02.19.37.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Jun 2023 19:37:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=O2kQUFMA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q5H7P-0001UO-RQ; Fri, 02 Jun 2023 22:35:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5H6U-0000WU-Rg
 for qemu-arm@nongnu.org; Fri, 02 Jun 2023 22:34:55 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5H6I-0004iS-GO
 for qemu-arm@nongnu.org; Fri, 02 Jun 2023 22:34:53 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-256931ec244so2369470a91.3
 for <qemu-arm@nongnu.org>; Fri, 02 Jun 2023 19:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685759681; x=1688351681;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NHMbOR1QTwjqbFmiHyO/57gsxTa7l7mfudPzWiBLsfE=;
 b=O2kQUFMAJssvVwjdVtP543asKyifbJiYycdkVPl+LZYcIhJF1fqerPkgNWxGM1XZuD
 6mVUtF1V9ahNEaLp0k8pqGKg31CdyO/ivX1u3LBpz+kknxm0njxuGI5DrPYOM0jehVjm
 wUZB05plRK+X1kC+r5uu4rEQUNVxbNYUiO5cFhxHYiSQiTlt5SjVHvjCpAl7iKf9jP5O
 G6M7sdgNUw0+J812mFTijS3ygJt9RGyCKKllwvilwyhnObYw70a1wMN7ycVkBML2iaxo
 gSp+GYhldBVRPfM/kaDwR/s1yansMNDpe5Eo3ooADUWVZR9GuwUAIBkbJPaJ6o/BkOyE
 zgeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685759681; x=1688351681;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NHMbOR1QTwjqbFmiHyO/57gsxTa7l7mfudPzWiBLsfE=;
 b=RxzY7i1vspsncSVhD1ixS/AFZwIVHlGRJvnEhL+/6FhZ7Rgzaqb+dihhj4i5buYLhv
 kZj+Uznn6t1FzKZ4vLYM37jJum5GYal+LbYDCf9zS9/UZdNFxAeRu/2gnmOs4ihUVrjj
 uDKOOVOmGUplqbYC9iZD59cSxdtabN3KU4Nkuc0hRAcHRaDS6gra5G8LTNtJFJS6xvuh
 5cATifdhOtTFy/lSeknaRuWdnOgk91F/NN7Vf3QJo0v1fLK0hOmsf9UzXbniy49NQ7HO
 7CLj2BZFKc6IrwXz1GE8bIPK2nBRyBaTItfXjZx3sXFeVkrqYfd8O62jcKOMMsgp0oTo
 ChmQ==
X-Gm-Message-State: AC+VfDzpOxYY1b6fe6RJMP9fVFckl7E6iu1uIr4zZsG6mQ4b2zkAprg/
 oHiZ2q7Cu31XCUY85jpkL97R8g==
X-Received: by 2002:a17:90a:de96:b0:258:b097:f692 with SMTP id
 n22-20020a17090ade9600b00258b097f692mr1512947pjv.43.1685759681615; 
 Fri, 02 Jun 2023 19:34:41 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:66a6:82c2:d794:68f6])
 by smtp.gmail.com with ESMTPSA id
 e91-20020a17090a6fe400b002508d73f4e8sm3914289pjk.57.2023.06.02.19.34.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jun 2023 19:34:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
Subject: [PATCH 16/35] target/arm: Use aesenc_MC
Date: Fri,  2 Jun 2023 19:34:07 -0700
Message-Id: <20230603023426.1064431-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230603023426.1064431-1-richard.henderson@linaro.org>
References: <20230603023426.1064431-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: BB706njm32TO

This implements the AESMC instruction.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/crypto_helper.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/target/arm/tcg/crypto_helper.c b/target/arm/tcg/crypto_helper.c
index d7b644851f..a0fec08771 100644
--- a/target/arm/tcg/crypto_helper.c
+++ b/target/arm/tcg/crypto_helper.c
@@ -118,7 +118,20 @@ void HELPER(crypto_aesmc)(void *vd, void *vm, uint32_t desc)
     intptr_t i, opr_sz = simd_oprsz(desc);
 
     for (i = 0; i < opr_sz; i += 16) {
-        do_crypto_aesmc(vd + i, vm + i, AES_mc_rot);
+        AESState *ad = (AESState *)(vd + i);
+        AESState *st = (AESState *)(vm + i);
+        AESState t;
+
+        /* Our uint64_t are in the wrong order for big-endian. */
+        if (HOST_BIG_ENDIAN) {
+            t.d[0] = st->d[1];
+            t.d[1] = st->d[0];
+            aesenc_MC(&t, &t, false);
+            ad->d[0] = t.d[1];
+            ad->d[1] = t.d[0];
+        } else {
+            aesenc_MC(ad, st, false);
+        }
     }
     clear_tail(vd, opr_sz, simd_maxsz(desc));
 }
-- 
2.34.1


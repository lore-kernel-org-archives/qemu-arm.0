Received: by 2002:a17:906:6dca:b0:989:33b4:be89 with SMTP id j10csp807598ejt;
        Wed, 21 Jun 2023 05:20:07 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6sJg09gCYP79tLgExHny7tKZTFoPqBDoNdpGahG5oTOSlB7GRaknQhMpqtnLMik2waiBAB
X-Received: by 2002:a1f:e201:0:b0:471:4ceb:675f with SMTP id z1-20020a1fe201000000b004714ceb675fmr3478881vkg.9.1687350006961;
        Wed, 21 Jun 2023 05:20:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687350006; cv=none;
        d=google.com; s=arc-20160816;
        b=hHIfGumJ31hZpaVkX3ZqKVTV9Wk16sd0aB3zKXDU9bP8DJ6wI0jp7OQXhKcSlgdMqL
         JmhkY4t6P2wGMadoSxFeNL5i9/VEWnIXP7lsAEJkdWq0fsvZiCilCRbRscpXChKc8Ztw
         ZIZecq2tBxOfFtvSF52W71aCUiaaywi8uSYOfvyPYNq9a8hsExN6/7Dj8CtGplB8yVt5
         3itx6NA+lX8lYa/Z6Os+7k30Pj+yjkEJNS1t5hDiBjxYLOgEYM8wyzZKpCKkKoH8Guo9
         5/dHVpgQFbnbHfqMjPDrxjWArxjnZqk+mnvw+n3Etx32oFV1NlrSEmA4svb9832GWPss
         uZvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=WgK1EIUfPfmDl3mDe16euilTLpZ88cE9U2pqwrFaRA8=;
        b=zwdBdofIRtNapg7NlneqKM769wdlNyiedAM2sne3JDIDKfe3vwtHEP3jAQYz7dS7ne
         gbudhBEJCXfG5YJbe2LQkP/3SGKa3n+sAAbdtwUFst5L57PAINrdl18BRpU1xTaZ2NCN
         KmEcAjEiFHAKorZxEWjK8NlFm6U/j55a6Ix3Kl21uid5WyEBdphPqcm9u9aOiWPksLmw
         wAj/2PO9P5qE2XlX7YrbZMkIwUfdGbnIyRYvJKNBx35ggRPCfRhz0I2tv7/s9fkcIkwc
         c/bbhhRJ9kKun3bn+sT/GjTfnXUcnTZVVibxNmClpxnqEZZc2kregiDgYA5ouTn64CNL
         RNhw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lacepKTW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i4-20020ad45c64000000b006300180acbesi1712663qvh.158.2023.06.21.05.20.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Jun 2023 05:20:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lacepKTW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qBwoG-0006sL-Q4; Wed, 21 Jun 2023 08:19:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBwnn-0006dW-Tf
 for qemu-devel@nongnu.org; Wed, 21 Jun 2023 08:19:18 -0400
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBwnl-0000Gv-8D
 for qemu-devel@nongnu.org; Wed, 21 Jun 2023 08:19:11 -0400
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4f766777605so7771048e87.1
 for <qemu-devel@nongnu.org>; Wed, 21 Jun 2023 05:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687349947; x=1689941947;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WgK1EIUfPfmDl3mDe16euilTLpZ88cE9U2pqwrFaRA8=;
 b=lacepKTW1gnxSO9oNe0llyWMElfFPc2lQImfAyDAsFjhjEtGfHxaiMNULpZAO3YUbx
 LWtyMsA3mbqn599AoWQ7pkqzt9H1xRY30uOtsbY6hZNl4Q3K3nrZ9U14X5zBjO5IM2a3
 mYGaXE822QGcq+4PYF/Ha5wva8998mkPoL9Rktwj6LQA3A9ASIjgevJZHw2ndICW+7Fd
 m6SBR2827gbRCKoHCozAXFa46vjTingLGjMjm076GQgHhnOVmpVdmryVgJjLLFtYSSbH
 WK3+uZtpp7mrb9VMLIQok5YkOdsw6jl1uX914dZjD0K/Gkc/XMF4CUFFVX9R41gmdY72
 J2WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687349947; x=1689941947;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WgK1EIUfPfmDl3mDe16euilTLpZ88cE9U2pqwrFaRA8=;
 b=QQrv08PugwYXUExB8CuoYjzllukD3myMEn9g21j7vEnZqIjW/4jAizEum9Bkj8KwEM
 crgXPvOWJMYNlYPrwGB6dlHeDKTBqUxwXQ86iIj1Zs0cdlkFhUiMS6+I880avQ6gP0lR
 ipHzCrSpc9cMH1tVR0Ocxf3Mjpg2DpyerKPt9K2XYSp3qGhWstYHy8Ze0uRZjk1V2VXf
 zlv1ocvqV4Y/WylHwZP/TWw/qQlsBQH4rl4iE0FU8Oq0rhL27eFwyiVRFsHZ6H95drug
 0xFlB4aBTTAf72qoqXE5TKT4MKhkqlmaOOBm5ZdcNF6n26YaKK2r2fqLixo2Wh8ea1nK
 ZTXA==
X-Gm-Message-State: AC+VfDz8bC0vzOVlRbNRvMSQq251Knn5NLWuQFZmSHbpZ80V6r1Aehru
 E6aEIBQD71aFw0DPiH4odL4DAa1YUyyldz2Zgxz1iAtW
X-Received: by 2002:a05:6512:449:b0:4f8:674c:415b with SMTP id
 y9-20020a056512044900b004f8674c415bmr6083742lfk.42.1687349947415; 
 Wed, 21 Jun 2023 05:19:07 -0700 (PDT)
Received: from stoup.lan ([176.176.128.70]) by smtp.gmail.com with ESMTPSA id
 s6-20020a056402014600b0051bdf152295sm543176edu.76.2023.06.21.05.19.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jun 2023 05:19:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 3/9] accel/tcg: Renumber TLB_DISCARD_WRITE
Date: Wed, 21 Jun 2023 14:18:56 +0200
Message-Id: <20230621121902.1392277-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230621121902.1392277-1-richard.henderson@linaro.org>
References: <20230621121902.1392277-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=richard.henderson@linaro.org; helo=mail-lf1-x12e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: M+1Ze9tHg3e3

Move to fill a hole in the set of bits.
Reduce the total number of tlb bits by 1.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu-all.h | 4 ++--
 tcg/tcg-op-ldst.c      | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index b5618613cc..8018ce783e 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -325,10 +325,10 @@ CPUArchState *cpu_copy(CPUArchState *env);
 #define TLB_NOTDIRTY        (1 << (TARGET_PAGE_BITS_MIN - 2))
 /* Set if TLB entry is an IO callback.  */
 #define TLB_MMIO            (1 << (TARGET_PAGE_BITS_MIN - 3))
+/* Set if TLB entry writes ignored.  */
+#define TLB_DISCARD_WRITE   (1 << (TARGET_PAGE_BITS_MIN - 4))
 /* Set if the slow path must be used; more flags in CPUTLBEntryFull. */
 #define TLB_FORCE_SLOW      (1 << (TARGET_PAGE_BITS_MIN - 5))
-/* Set if TLB entry writes ignored.  */
-#define TLB_DISCARD_WRITE   (1 << (TARGET_PAGE_BITS_MIN - 6))
 
 /*
  * Use this mask to check interception with an alignment mask
diff --git a/tcg/tcg-op-ldst.c b/tcg/tcg-op-ldst.c
index a4f51bfb6e..0fcc1618e5 100644
--- a/tcg/tcg-op-ldst.c
+++ b/tcg/tcg-op-ldst.c
@@ -39,7 +39,7 @@ static void check_max_alignment(unsigned a_bits)
      * The requested alignment cannot overlap the TLB flags.
      * FIXME: Must keep the count up-to-date with "exec/cpu-all.h".
      */
-    tcg_debug_assert(a_bits + 6 <= tcg_ctx->page_bits);
+    tcg_debug_assert(a_bits + 5 <= tcg_ctx->page_bits);
 #endif
 }
 
-- 
2.34.1


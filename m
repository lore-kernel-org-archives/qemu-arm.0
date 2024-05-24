Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp1994323ejb;
        Fri, 24 May 2024 16:27:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWE9mq/0CdkR0GjiQwv/jQ7M0kVjD6XwqOEoP1JIPHMvihTjId7NlpMaMX9OFKaH/0BUwqosA3foUT+mQTPeyGLkv/IIgQZ
X-Google-Smtp-Source: AGHT+IGf1prcYU6w2Y0NxiOgk7lPO9HrrY6kEOmQz/WUmS05RfAb+JV5in4nbJ1aXhww98ssH7VC
X-Received: by 2002:a05:6214:3da1:b0:6aa:dc36:5cb1 with SMTP id 6a1803df08f44-6abcd0cd485mr52345016d6.25.1716593233620;
        Fri, 24 May 2024 16:27:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716593233; cv=none;
        d=google.com; s=arc-20160816;
        b=kw6wTtaa2YnWbzjrdCTrGxS1T3TCCHQZrtsWsretJmRnrlP1KA1avDS5ZBBohsNs6O
         qEwvgGwqX658mkq/EC9/ZEOOb5M94qncRXDCPhS4cyRm1VbJDew7udWrsScPIMyXvjKP
         m81+FAgt8qRJMdp7KmYxloeFkmd7ZMaOdn3f5FX6SlmV881t+zFxn7BY+MBXiZPfXzqW
         bRP4qunmDGaWvFhZ77yWCr6TBu2RQ7KW6Qu39OLR/Gb7MtQP62+ojL7RSBHOnyKbzs5S
         OOxnDUC6jyjUbis1AMeg9duv6ftoRlHAkVriIB5uwIJ1byJ7tZfC6xC6ow6YJpGTbPNK
         FLqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=AtfQDDvhCTAQzr/cA9Eff/uGFAgvLsYs3JLC/5fgqLQ=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=PYsmfeyEkB/K3PlKPFMkL5AO9EYTLlDNe8laJBaTxzh0HIygNXOpuKCTgNvj80fuKK
         2jyhRkEVwS8oVtgJCTwhBBDpv/qNKivz1DVoCx4anygZgSenD2bbF7BiO9AICNjAZD7v
         3HTW6fWUpQ8xdjYowZgH/xkz6dVfy4QqrgsLYl/JHmURwh6rf6Wn2nGnNERgKiJ2g7zL
         HHWfFvUDm6tP6NCaQhl4HRa/Xwldw0MtIxHXFDadqv1mGod0fyyDXUjCKm7dlwX9WZmb
         Afz/PBBCnMV3ZOudfGZHvnHY/PYLo9+qDstUsj2H3DHJH67lZrPLvS8rRkvC1SSdEbZG
         0rdQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wZil00SE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6ac162b251dsi27347616d6.472.2024.05.24.16.27.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 May 2024 16:27:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wZil00SE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sAeIq-0002UP-HN; Fri, 24 May 2024 19:26:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sAeHv-0007Q2-Gu
 for qemu-arm@nongnu.org; Fri, 24 May 2024 19:25:28 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sAeHj-0006u2-Du
 for qemu-arm@nongnu.org; Fri, 24 May 2024 19:25:26 -0400
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-657a07878easo3451944a12.0
 for <qemu-arm@nongnu.org>; Fri, 24 May 2024 16:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716593111; x=1717197911; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AtfQDDvhCTAQzr/cA9Eff/uGFAgvLsYs3JLC/5fgqLQ=;
 b=wZil00SEDRebx9oyUjm0ciRTCUZ6A1cmUQ8o8pVWRiGH2XTDNfCUgxFSrurqdarTa1
 uw4/SqP8Iy5pofz1Z6iJ98OwEwPUl0L1dIZ+xOCNBtuHkqUAoLO/tODinOHNEp+m2oZX
 r9mK4OKrZYjLJ6Vm0uMiA5HskLWHqnl5C/UVYVPddBWqVtC5hIGjaA0wrBrOYYeN/Cap
 +tmHehs+He1qLf7SNRTqcJOsL5dP9T/4uYPmprcag2nsQTSOvzVg0AVHRcofa7KXWfNw
 9swO1cQVGwXB9wZglG6nNCHM7P+1Axq3wHIh3MbpJhhMxQ5dy4k5L6UEWzp5VSvjmakL
 yRTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716593111; x=1717197911;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AtfQDDvhCTAQzr/cA9Eff/uGFAgvLsYs3JLC/5fgqLQ=;
 b=guFP4AnEyzotz0UjWwueQF/dAKRisidmaB459uZlCKaNHDr20JAaDHjDTWQR60DbXn
 cK3XCTCukyR9txiLeZbngzoKGgyCl4EZRR5AYAg7lZwrKcKoZO29CcWSNKRR4/wm/BrL
 MORkYVMKwEGkTi8+QcQozKpkThHNCKpp+W5GSpvY5yNYd4AYVRSmJz+DPaWyMgy6M5d5
 pkHuyOBo2JL6mpiFDLJzx6BPmfIfYklR9KdqwRPRLcmpqJa41l4096E6ofPS8I/MbFZR
 n+j5Dvw52JXyWxX0DMScs+Brodp+C+FKS6YCV4EV1Uu+ktcDoJLB8Yc1Q1CabAVMDpg/
 1WSw==
X-Gm-Message-State: AOJu0Yxw7eM9eoFU76Zgn5xMwD7+OT7aKayBZeNd9CTytcXtwnGTOm2n
 UN9F+yT7cJA05/VqvEYe7lq3sHw7iAK+/yMQQjJ9bMG/QFp9vWeYfJ/9QEyOVTg=
X-Received: by 2002:a05:6a21:19c:b0:1a7:2e17:efd3 with SMTP id
 adf61e73a8af0-1b212cbcefamr6073493637.5.1716593111450; 
 Fri, 24 May 2024 16:25:11 -0700 (PDT)
Received: from stoup.. (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f8fbf2cfd1sm1591695b3a.3.2024.05.24.16.25.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 May 2024 16:25:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 55/67] target/arm: Convert SHADD, UHADD to decodetree
Date: Fri, 24 May 2024 16:21:09 -0700
Message-Id: <20240524232121.284515-56-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240524232121.284515-1-richard.henderson@linaro.org>
References: <20240524232121.284515-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: Ym6j4XWt0IIu

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/a64.decode      |  2 ++
 target/arm/tcg/translate-a64.c | 11 +++--------
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 3061e26242..e33d91fd0a 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -912,6 +912,8 @@ CMGE_v          0.00 1110 ..1 ..... 00111 1 ..... ..... @qrrr_e
 CMHS_v          0.10 1110 ..1 ..... 00111 1 ..... ..... @qrrr_e
 CMTST_v         0.00 1110 ..1 ..... 10001 1 ..... ..... @qrrr_e
 CMEQ_v          0.10 1110 ..1 ..... 10001 1 ..... ..... @qrrr_e
+SHADD_v         0.00 1110 ..1 ..... 00000 1 ..... ..... @qrrr_e
+UHADD_v         0.10 1110 ..1 ..... 00000 1 ..... ..... @qrrr_e
 
 ### Advanced SIMD scalar x indexed element
 
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 5f3423513d..00c04425c1 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -5454,6 +5454,8 @@ TRANS(UQRSHL_v, do_gvec_fn3, a, gen_neon_uqrshl)
 
 TRANS(ADD_v, do_gvec_fn3, a, tcg_gen_gvec_add)
 TRANS(SUB_v, do_gvec_fn3, a, tcg_gen_gvec_sub)
+TRANS(SHADD_v, do_gvec_fn3_no64, a, gen_gvec_shadd)
+TRANS(UHADD_v, do_gvec_fn3_no64, a, gen_gvec_uhadd)
 
 static bool do_cmop_v(DisasContext *s, arg_qrrr_e *a, TCGCond cond)
 {
@@ -10920,7 +10922,6 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
             return;
         }
         /* fall through */
-    case 0x0: /* SHADD, UHADD */
     case 0x2: /* SRHADD, URHADD */
     case 0x4: /* SHSUB, UHSUB */
     case 0xc: /* SMAX, UMAX */
@@ -10946,6 +10947,7 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
         }
         break;
 
+    case 0x0: /* SHADD, UHADD */
     case 0x01: /* SQADD, UQADD */
     case 0x05: /* SQSUB, UQSUB */
     case 0x06: /* CMGT, CMHI */
@@ -10965,13 +10967,6 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
     }
 
     switch (opcode) {
-    case 0x00: /* SHADD, UHADD */
-        if (u) {
-            gen_gvec_fn3(s, is_q, rd, rn, rm, gen_gvec_uhadd, size);
-        } else {
-            gen_gvec_fn3(s, is_q, rd, rn, rm, gen_gvec_shadd, size);
-        }
-        return;
     case 0x0c: /* SMAX, UMAX */
         if (u) {
             gen_gvec_fn3(s, is_q, rd, rn, rm, tcg_gen_gvec_umax, size);
-- 
2.34.1


Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp703404lfb;
        Thu, 9 Jun 2022 14:16:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxlbs7G5BGCL86zDfSATRZpTxSay/5YhnZJgKl7XS0fRSxDmKPHkDI5clJ5DBgZp8Uj8Rbh
X-Received: by 2002:a05:6214:2342:b0:42d:7c8b:9eac with SMTP id hu2-20020a056214234200b0042d7c8b9eacmr86306006qvb.5.1654809393036;
        Thu, 09 Jun 2022 14:16:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654809393; cv=none;
        d=google.com; s=arc-20160816;
        b=w/rA41bF3x1SXWlLPfvWLIRlmWza738j3TTgrzbzjnCF1ulHz4Jev1EME0R3QebePW
         XKbMu8pH31up3kgU8rfEd8UsfqhTNK6cUYszJ5wJCQbObd0gO4dSJoOCXeumIek+J53i
         EBEuPAY933PHzo4SrpjMJ4ihOira5w24H1myKGPkbJhUCVEVYJaVlbjeihDlUfLtLErI
         HLLQGvF61ZMVb2U0XRFeMcOgHurPRJXI9GA6zq5yxVJSZNuMegASoQ74EkWQn8f45nGd
         N8i50yNQsP7mSfHCrNX0+854ni+3cDheq/vJk8ww9GQJrz+I1q+1jBFTBsfMtf9ZDtpE
         g2Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=XrwBHtaJMwMweCtn22KfTI+wKyoZs8cSGLm5AgDVmqM=;
        b=YnEWuHmVZQvnZ+46IVhn5RqwHfginEr4pjTTn0YicKClT3qrofjzVJsaT9Q02kKrzv
         uNRdQCRxOluRph8ZgRxAGr9F15N+GPFg6HOzaP+Mp2Hp609/ZKGSC9NM/92eRvqsVyqS
         XjAataDt/NFx/N5Jpyssf+WDVDI2GSQ26CQIPMLsoqefMmhIS2w7I/7tuGc7FMbv6d5g
         6Z72mI4yVa/ZMBJR5yR4lRau8LFssyc80niD6GZfOwgE4W7BuLHHklY775wJlChBIChS
         SsePC7j1PJEhMZxKFUMBCez2x0U3iPE9dXo8C0A9TMy81tErtmwW4NH2CtPKONhXiRbc
         QBVA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rG05RsYB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n5-20020ac85a05000000b0030502339b74si3183504qta.248.2022.06.09.14.16.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jun 2022 14:16:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rG05RsYB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nzPW4-0004bC-HY
	for alex.bennee@linaro.org; Thu, 09 Jun 2022 17:16:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzOmR-00047e-6S
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 16:29:23 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:52108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzOmN-0008QZ-Fj
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 16:29:22 -0400
Received: by mail-pj1-x1035.google.com with SMTP id cx11so22331417pjb.1
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 13:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XrwBHtaJMwMweCtn22KfTI+wKyoZs8cSGLm5AgDVmqM=;
 b=rG05RsYBVVZX4resqdsV4lWMMMoA/I6969GUg5VNcYfPayMV0AtXfIBQXQ1oYTQo+S
 P9XsKFcERVz+EgXSNN59wEeVFVlD8Z/YdJuBdxQkPg4+UbJHaT45PzOnWll++SAzbnz1
 AMey7Dg2hRtvS4EceJ+f5Yf1r5YdG1pAyzKYfqzwDj/khhbOKu5jkhnkpUZmL6n0yNZx
 /4ksd/YlmA00oo45Izr1wZDsIOdKVDP0e23DR3fgHJ503IcRBoUCssvEsYPYQEVzLMgT
 qy0hATtMMzXs4d/jNOTsGUi+VtogncXLoz8XWNIOtQxvfn4UUn6XTdRDTUU/kRkD7CJY
 yeBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XrwBHtaJMwMweCtn22KfTI+wKyoZs8cSGLm5AgDVmqM=;
 b=X/NsDTg9JmPip5qqZJ3+D9PUNeupdvRvcctx+uWHRfEkCHazZpV6WAJY0ZRkVuYkKF
 TrT+MGvzYIR2dTv5D8SRKdu04OowVd68rM2HLNcpwuAQOorQ+xnusOQByrl/gsa/sQC5
 xIWb2iIterGXax1Q1Pf0xTfVRiZ8Wpwsc5F0ixGJz8XVlijzDFbYSqazWw9Lyom5NuxL
 FDxTZxplkyguL74zC7I1xhSdIwi/yvQbWn8FBVrBjgwp8AkKyscAJJPxnVe/Q7IejYFg
 R63sutrPtZCMCysdntjb1HzPjZk7T2jldmBSl0K56MfmsNt60Bx+ylzkmVsjit8k5gLu
 m8fA==
X-Gm-Message-State: AOAM533aeR6q7dn8AkoeBCzmiisN9koIQ4b53SAUWcPzG5qNVnxbWGlX
 HVOWWCqNjnNOhxznVJC9q0VZ+k5Untotzg==
X-Received: by 2002:a17:903:22d0:b0:164:ec0:178c with SMTP id
 y16-20020a17090322d000b001640ec0178cmr42012398plg.127.1654806558676; 
 Thu, 09 Jun 2022 13:29:18 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:839f:476f:678:38a])
 by smtp.gmail.com with ESMTPSA id
 r20-20020a635d14000000b003fded88238esm7528139pgb.36.2022.06.09.13.29.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 13:29:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 18/23] target/arm: Introduce gen_exception_el_v
Date: Thu,  9 Jun 2022 13:28:56 -0700
Message-Id: <20220609202901.1177572-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220609202901.1177572-1-richard.henderson@linaro.org>
References: <20220609202901.1177572-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jAOf4ic6l/j2

Split out a common helper function for gen_exception_el
and gen_exception_insn_el_v.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 5a48937ede..fcb6ee648b 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1086,11 +1086,15 @@ static void gen_exception_internal_insn(DisasContext *s, uint32_t pc, int excp)
     s->base.is_jmp = DISAS_NORETURN;
 }
 
-static void gen_exception_el(int excp, uint32_t syndrome, uint32_t target_el)
+static void gen_exception_el_v(int excp, uint32_t syndrome, TCGv_i32 tcg_el)
 {
     gen_helper_exception_with_syndrome_el(cpu_env, tcg_constant_i32(excp),
-                                          tcg_constant_i32(syndrome),
-                                          tcg_constant_i32(target_el));
+                                          tcg_constant_i32(syndrome), tcg_el);
+}
+
+static void gen_exception_el(int excp, uint32_t syndrome, uint32_t target_el)
+{
+    gen_exception_el_v(excp, syndrome, tcg_constant_i32(target_el));
 }
 
 static void gen_exception(DisasContext *s, int excp, uint32_t syndrome)
@@ -1107,8 +1111,7 @@ static void gen_exception_insn_el_v(DisasContext *s, uint64_t pc, int excp,
         gen_set_condexec(s);
         gen_set_pc_im(s, pc);
     }
-    gen_helper_exception_with_syndrome_el(cpu_env, tcg_constant_i32(excp),
-                                          tcg_constant_i32(syn), tcg_el);
+    gen_exception_el_v(excp, syn, tcg_el);
     s->base.is_jmp = DISAS_NORETURN;
 }
 
-- 
2.34.1


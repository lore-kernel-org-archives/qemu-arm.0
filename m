Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp5210318lfh;
        Thu, 2 Jun 2022 15:18:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzOjl7wm5CqaXfXTn+SFcKsCu5duOgpSHJXWPS++H2PLSYC7FeJ+J6l2ROSOjfFE4BqNQnu
X-Received: by 2002:a05:622a:7:b0:2f3:c136:b7bc with SMTP id x7-20020a05622a000700b002f3c136b7bcmr5347683qtw.243.1654208286200;
        Thu, 02 Jun 2022 15:18:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654208286; cv=none;
        d=google.com; s=arc-20160816;
        b=MNz6BlxW6yP4g5+YmNcRbJo05HgEmifNI0dbccBdQDdoQyHiA9A6MEL0/iVBE7sr1t
         kfIdKXDGbxtJDHHxUDG/hAgc39lqd0753yWxQPPuVSPt/0GmNa4ljNGBCaD4v5FzlucB
         REytgbigOLnw9CHyOW7yyTHdOgzNm1zJnW+kw6+DsY/xnmGmby1yHEa9hJX2/atNWXDI
         GL2PlGv9puq4D8UzbLBOEOfWNxKJgWAwEzTgbo1v5gHYDWZA9OwLlrkmTztaPXAh5+gv
         ZfUvUDd4C6ChXG3jYB4l22altHF9nFgsy8/mlLIWzEXOebStNTJ7X7ByizeBZ2zUNdgp
         UA5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=vIa3IKSRhaxqBOPG/jC3fFgT7YknLf0taajsFi5iMbc=;
        b=PH75h2/Cc8jFeWB0j1qLqYtka0ufkWtNGfzeSWl3rcgbuzRRiqrbYLmrl1WNypQSvr
         9c3Wb6JohmylH8r0z21ZonjWO76mhOvlT42Umdcg1sM2tD5lZCotmLSFygsmpvwMwb5l
         zv36bYO6zYthSV55H6364grsKHa0puwN/M3ZlEwnb5RaKwe6EfZCBOHqwV7mxrGuvz1T
         wZ8m27NgCuSnw9M8Z5lVK50MDKTQFSIVckSSOIbB7866zbq5mOi53mRUycdQ2KJxQYAd
         ccYz1jcLjzU/J6pIdQE2NE6f1pw6/bGniuRW/ah4tNdD+0qkMQQW2LguQxojFI8SNxFl
         zEVw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CxkQgTgD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s2-20020a372c02000000b006a579a1c4absi2605224qkh.670.2022.06.02.15.18.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Jun 2022 15:18:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CxkQgTgD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nwt8n-0007d7-MM
	for alex.bennee@linaro.org; Thu, 02 Jun 2022 18:18:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwshB-0005Cn-L7
 for qemu-arm@nongnu.org; Thu, 02 Jun 2022 17:49:34 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:46932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsh8-0000FN-44
 for qemu-arm@nongnu.org; Thu, 02 Jun 2022 17:49:33 -0400
Received: by mail-pl1-x631.google.com with SMTP id w3so5504077plp.13
 for <qemu-arm@nongnu.org>; Thu, 02 Jun 2022 14:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vIa3IKSRhaxqBOPG/jC3fFgT7YknLf0taajsFi5iMbc=;
 b=CxkQgTgDspiCl6evqzvPC5yvHEv0VHs/h01QaGsfqfhxlD4VVrRyTad1kbeuDLI53m
 9MRIx1YDMIBs6ua6wXZi8TA2e6BdvTYAt1FabKkug8VC1EM8NfHL28F87O64ukcMJ6zw
 cAwWi9e2dAIc7nzazVeDcBzpUZnBAut/OCXES2ewALjVzGIFl3wkLrf3IkK6IlFNRr3w
 wGp21w+bt/2QojUKt0jVYRa3erloOEZujl27LxtX4dU5hyT2gruUo82uyX08ihyO03mq
 gXIjnFrrqWiFmUhz/4WK4hxJw7SUuWwKpDqc2HDNTauMF62oTTLr/M19bI8wS5pzZLw8
 Ywog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vIa3IKSRhaxqBOPG/jC3fFgT7YknLf0taajsFi5iMbc=;
 b=vwq9fPQl4BbMMBEHX/1Zym7jJbDtmap7GS1KGdNQMF6Bjmc/mL4ICzy7x+Utvx2K9t
 6n0ZUMFd0ZEc4+XVhbAUoWQSWf6vZLqPk4LjMP4P2N6h9p4Pl/IZkJ4oZXKAUkFWCw2k
 EIddZ0KTYXVhB2zUlo9tABxvsxPxMiH+7IviO9To3uu8Z8G6pLsNg3jZ2jSolYl/g+BW
 O6SiBtYqXU0LdCogQldjYmZqbU69Hp0NmlCL5Lqvdgt4ZR6TqQpxZ5DJR7W3wjrBCWtX
 6wgIiWZGPzpgRhRE7MNIOm5v2QplshZi3c/Q1KjzuxctZHzY1Tl6Paw+xze5Gvc5ZR+V
 xdOQ==
X-Gm-Message-State: AOAM530M13TLlrcjL9A0caYGMMGqtd7nUbVynziKnk3LnKLD9xu3NOum
 zgnMbQ5UsgxFzN/5M8lgtpPk+CQdt5qeTQ==
X-Received: by 2002:a17:90b:1d08:b0:1e3:2a4f:6935 with SMTP id
 on8-20020a17090b1d0800b001e32a4f6935mr20021139pjb.174.1654206568670; 
 Thu, 02 Jun 2022 14:49:28 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 bf7-20020a170902b90700b00163c6ac211fsm3988760plb.111.2022.06.02.14.49.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 14:49:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 39/71] target/arm: Add SVL to TB flags
Date: Thu,  2 Jun 2022 14:48:21 -0700
Message-Id: <20220602214853.496211-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602214853.496211-1-richard.henderson@linaro.org>
References: <20220602214853.496211-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: A5+UbTaqcc2l

We need SVL separate from VL for RDSVL at al, as well as
ZA storage loads and stores, which do not require PSTATE.SM.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h           | 12 ++++++++++++
 target/arm/translate.h     |  1 +
 target/arm/helper.c        |  8 +++++++-
 target/arm/translate-a64.c |  1 +
 4 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index e41a75a3a3..0c32c3afaa 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3292,6 +3292,7 @@ FIELD(TBFLAG_A64, MTE0_ACTIVE, 19, 1)
 FIELD(TBFLAG_A64, SMEEXC_EL, 20, 2)
 FIELD(TBFLAG_A64, PSTATE_SM, 22, 1)
 FIELD(TBFLAG_A64, PSTATE_ZA, 23, 1)
+FIELD(TBFLAG_A64, SVL, 24, 4)
 
 /*
  * Helpers for using the above.
@@ -3337,6 +3338,17 @@ static inline int sve_vq_cached(CPUARMState *env)
     return EX_TBFLAG_A64(env->hflags, VL) + 1;
 }
 
+/**
+ * sme_vq_cached
+ * @env: the cpu context
+ *
+ * Return the SVL cached within env->hflags, in units of quadwords.
+ */
+static inline int sme_vq_cached(CPUARMState *env)
+{
+    return EX_TBFLAG_A64(env->hflags, SVL) + 1;
+}
+
 static inline bool bswap_code(bool sctlr_b)
 {
 #ifdef CONFIG_USER_ONLY
diff --git a/target/arm/translate.h b/target/arm/translate.h
index fbd6713572..1330281f8b 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -44,6 +44,7 @@ typedef struct DisasContext {
     int sve_excp_el; /* SVE exception EL or 0 if enabled */
     int sme_excp_el; /* SME exception EL or 0 if enabled */
     int vl;          /* current vector length in bytes */
+    int svl;         /* current streaming vector length in bytes */
     /* Flag indicating that exceptions from secure mode are routed to EL3. */
     bool secure_routed_to_el3;
     bool vfp_enabled; /* FP enabled via FPSCR.EN */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index cb78d2354a..c9db12d524 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -13874,7 +13874,13 @@ static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
         DP_TBFLAG_A64(flags, SVEEXC_EL, sve_el);
     }
     if (cpu_isar_feature(aa64_sme, env_archcpu(env))) {
-        DP_TBFLAG_A64(flags, SMEEXC_EL, sme_exception_el(env, el));
+        int sme_el = sme_exception_el(env, el);
+
+        DP_TBFLAG_A64(flags, SMEEXC_EL, sme_el);
+        if (sme_el == 0) {
+            /* Similarly, do not compute SVL if SME is disabled. */
+            DP_TBFLAG_A64(flags, SVL, sve_vqm1_for_el_sm(env, el, true));
+        }
         if (FIELD_EX64(env->svcr, SVCR, SM)) {
             DP_TBFLAG_A64(flags, PSTATE_SM, 1);
         }
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 40f2e53983..b1d2840819 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -14652,6 +14652,7 @@ static void aarch64_tr_init_disas_context(DisasContextBase *dcbase,
     dc->sve_excp_el = EX_TBFLAG_A64(tb_flags, SVEEXC_EL);
     dc->sme_excp_el = EX_TBFLAG_A64(tb_flags, SMEEXC_EL);
     dc->vl = (EX_TBFLAG_A64(tb_flags, VL) + 1) * 16;
+    dc->svl = (EX_TBFLAG_A64(tb_flags, SVL) + 1) * 16;
     dc->pauth_active = EX_TBFLAG_A64(tb_flags, PAUTH_ACTIVE);
     dc->bt = EX_TBFLAG_A64(tb_flags, BT);
     dc->btype = EX_TBFLAG_A64(tb_flags, BTYPE);
-- 
2.34.1


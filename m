Received: by 2002:a17:906:1c87:0:0:0:0 with SMTP id g7csp2854550ejh;
        Tue, 6 Sep 2022 03:13:26 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6d/GbdLWTWz0gYOclPpoq9IWEWVJ/10J5r3uumhfly5Nfl7VUxfhCudt6RizJaYN968Gs1
X-Received: by 2002:a05:622a:1986:b0:343:225d:f9e1 with SMTP id u6-20020a05622a198600b00343225df9e1mr43315997qtc.651.1662459206016;
        Tue, 06 Sep 2022 03:13:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1662459206; cv=none;
        d=google.com; s=arc-20160816;
        b=O5Nfzy2NLJoKBwyXhCelbdXvFZp+LZ0lgoXnjrbPdB3NqTRsuW+60yIEX/nSz9wUxE
         ye4NDYbyEr3zD2fa1Tv5GDCVpeoku9sLDozmnV/EK3r8IfOFMs4ZqpVPQ0eLw9omPrmD
         AbQP2dQ03zbXpQmrLL5Udx/zjeheknjUakJHRBiGQ0UPFoak20SB2ve91cVZNH9hzXhU
         EKOw+YDAokNsJizqdAdHDcl6D2NHboycgprd0DQd8Asi3n4FTw8SO0FkssuZIroJCBqi
         gGYqH9FY2XH+yBQW9GLVM1tOikEKg9fCECT0Rh7MofS86Ficbxr6tRZ2Gjioymf5WBiL
         mwPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=A1suykGSR20eVXqFN1Yv/5dGPd3G7DCTm6fMJu/rgAk=;
        b=aBkmu3Oc9qlNQ7Tm1lRtJQ9Qhrvu8f/LOoFBGWGEp8RH//YdzRiW8b+adT5EYUvoQL
         AzDoQC3WQixYecfxAmQonVzFdKH+1gGwq3c4lL44crEYOV9hnH1AP/JJF8rD5ZbYh2oQ
         Ky73pTITwy2NdoNQ5Fr5ELWkSzqGif3MGxVuW/8PGSvqSP3JptnnQsCGkAdnHFh04rgU
         jRSJZ088Cvo6uqK2jXMPZ64OLAsJsK2Gc+bTgHm0hb8irhToD3pglPcjW9Y6r4LYaq6e
         o+biNbs2O3T3pUMVM/NaCNjuqW+Edj9yOBd8YdCX+e2vJ9HyS0ygZezvYU3eImXI7aAX
         PheQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fdjAEDlL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f17-20020a05620a409100b006bc4415d41csi7835320qko.343.2022.09.06.03.13.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Sep 2022 03:13:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fdjAEDlL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oVVa9-0006Xl-EY
	for alex.bennee@linaro.org; Tue, 06 Sep 2022 06:13:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVSl-00048p-DJ
 for qemu-arm@nongnu.org; Tue, 06 Sep 2022 06:05:52 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:45989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVSf-00034G-5K
 for qemu-arm@nongnu.org; Tue, 06 Sep 2022 06:05:47 -0400
Received: by mail-wr1-x42f.google.com with SMTP id bj14so1372616wrb.12
 for <qemu-arm@nongnu.org>; Tue, 06 Sep 2022 03:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=A1suykGSR20eVXqFN1Yv/5dGPd3G7DCTm6fMJu/rgAk=;
 b=fdjAEDlL3QU314MN/5L1d70mTMcBszvfP4DRj5kmVJFoiqbbU+gPhu6IZcsw4FdqCR
 b0/wP/81PI2y4H5emPBuhflUVCyW3FmVmg1R9dekWUAjWLrV9o9dfxa4FFW2dpBFO0i5
 lT5y3pjZ6MKSHg67a9snHNfHEIWhwE5A+CiJcCpDwcqkFuSJX5DP4BqZcATLHC/ot1gv
 T6A/Gk+XC4kfmqmqXLWaR8nBRx7W1qfD6w9XEUhPu4BeJwi3Q0xNdUjZoIb1eSxM0NZs
 4UkLgnM4PetB7S/vA9SHwmZ3Fqq1yAL9VQWLgP/FqfcyRdGHDixCvka+aTGjOE53ABGa
 HM5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=A1suykGSR20eVXqFN1Yv/5dGPd3G7DCTm6fMJu/rgAk=;
 b=7TSIAjOZ7x5Em52WBOIad8oLRCMR6mfISxp2Gzb42vNZLK/POj85XnGiBMxhY+qwp3
 JmYDd8Fb5GY40XZt5Bv9VRAJp3DNcaslNCi6mhYt36Qg/AFNXM4NhVA7HtGlj7PMuPEV
 gSaZUBG58NRZEQXSvc4z8rlVg+WYyU+aFuRLbzb1hvLmMNu6p6+VipnY5foxXXX4yJ/G
 xOHpHluZv8eOnX5BKPxV+i3EWzFE4dwvoroN8SRbeO84dc6ewDw2rJjaA4yoRFW7iWa+
 9+XYCCUH+L0AdSRUtUbgs2w2rjx63CATdpVQoXXMIt3KhBUjqv0ST3k8M3V7Mmz3/eTJ
 PVjg==
X-Gm-Message-State: ACgBeo3nBayIN0khB4Uwhra3upRLE8OLW/OAfz4/94AtgEjMHASq9OXl
 Wl1p3qc9/M2E/EfFbJ+ggBJjlYWunJ/YI3W/
X-Received: by 2002:adf:f54c:0:b0:228:d41f:9f86 with SMTP id
 j12-20020adff54c000000b00228d41f9f86mr2513227wrp.699.1662458736278; 
 Tue, 06 Sep 2022 03:05:36 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:8084:a5c0:5a80:ba98:3a71:8524:e0b1])
 by smtp.gmail.com with ESMTPSA id
 d15-20020a5d6dcf000000b00225307f43fbsm12271081wrz.44.2022.09.06.03.05.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 03:05:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 5/9] target/arm: Change gen_exception_internal to work on
 displacements
Date: Tue,  6 Sep 2022 11:05:24 +0100
Message-Id: <20220906100528.343244-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906100528.343244-1-richard.henderson@linaro.org>
References: <20220906100528.343244-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42f.google.com
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
X-TUID: mYM5Tkvnbeme

In preparation for TARGET_TB_PCREL, reduce reliance on absolute values.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c |  6 +++---
 target/arm/translate.c     | 10 +++++-----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 17ea8b5650..9bb744fad3 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -340,9 +340,9 @@ static void gen_exception_internal(int excp)
     gen_helper_exception_internal(cpu_env, tcg_constant_i32(excp));
 }
 
-static void gen_exception_internal_insn(DisasContext *s, uint64_t pc, int excp)
+static void gen_exception_internal_insn(DisasContext *s, int pc_diff, int excp)
 {
-    gen_a64_update_pc(s, pc - s->pc_curr);
+    gen_a64_update_pc(s, pc_diff);
     gen_exception_internal(excp);
     s->base.is_jmp = DISAS_NORETURN;
 }
@@ -2229,7 +2229,7 @@ static void disas_exc(DisasContext *s, uint32_t insn)
                 break;
             }
 #endif
-            gen_exception_internal_insn(s, s->pc_curr, EXCP_SEMIHOST);
+            gen_exception_internal_insn(s, 0, EXCP_SEMIHOST);
         } else {
             unallocated_encoding(s);
         }
diff --git a/target/arm/translate.c b/target/arm/translate.c
index d441e31d3a..63a41ed438 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1078,10 +1078,10 @@ static inline void gen_smc(DisasContext *s)
     s->base.is_jmp = DISAS_SMC;
 }
 
-static void gen_exception_internal_insn(DisasContext *s, uint32_t pc, int excp)
+static void gen_exception_internal_insn(DisasContext *s, int pc_diff, int excp)
 {
     gen_set_condexec(s);
-    gen_update_pc(s, pc - s->pc_curr);
+    gen_update_pc(s, pc_diff);
     gen_exception_internal(excp);
     s->base.is_jmp = DISAS_NORETURN;
 }
@@ -1175,7 +1175,7 @@ static inline void gen_hlt(DisasContext *s, int imm)
         s->current_el != 0 &&
 #endif
         (imm == (s->thumb ? 0x3c : 0xf000))) {
-        gen_exception_internal_insn(s, s->pc_curr, EXCP_SEMIHOST);
+        gen_exception_internal_insn(s, 0, EXCP_SEMIHOST);
         return;
     }
 
@@ -6565,7 +6565,7 @@ static bool trans_BKPT(DisasContext *s, arg_BKPT *a)
         !IS_USER(s) &&
 #endif
         (a->imm == 0xab)) {
-        gen_exception_internal_insn(s, s->pc_curr, EXCP_SEMIHOST);
+        gen_exception_internal_insn(s, 0, EXCP_SEMIHOST);
     } else {
         gen_exception_bkpt_insn(s, syn_aa32_bkpt(a->imm, false));
     }
@@ -8773,7 +8773,7 @@ static bool trans_SVC(DisasContext *s, arg_SVC *a)
         !IS_USER(s) &&
 #endif
         (a->imm == semihost_imm)) {
-        gen_exception_internal_insn(s, s->pc_curr, EXCP_SEMIHOST);
+        gen_exception_internal_insn(s, 0, EXCP_SEMIHOST);
     } else {
         gen_update_pc(s, curr_insn_len(s));
         s->svc_imm = a->imm;
-- 
2.34.1


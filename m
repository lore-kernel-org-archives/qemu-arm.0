Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp2009244ejf;
        Tue, 16 Aug 2022 13:35:04 -0700 (PDT)
X-Received: by 2002:a05:6870:461c:b0:115:8a17:f32f with SMTP id z28-20020a056870461c00b001158a17f32fmr141837oao.11.1660682104785;
        Tue, 16 Aug 2022 13:35:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660682104; cv=none;
        d=google.com; s=arc-20160816;
        b=GIUoALjv5PzQRrkkrxQwR4OZF9Umhrx24YssEXQRpCoewh+AGW4JZ0njfX6+LBxxST
         sVZlP1SdLSw3JYM/0Yiv66AJbJB8JpCrO1SFyBzLd00hhs6J11X+AbHfLrgNyaSDM+I4
         r03UbRjlNZKNNcbJneZ/iHWtb/mpI5g/MuAnpfC+PMkELEFSnRXW4r/Q4hvd1EtlZ+rB
         ub+SLdX1iHYpypVUnG9s9aWjFSM2qYKfAuic47ibavCKM0IBoYVYXOGSKjE9O0DbdUoy
         IuJRWfkzl+MV2NrvJ+VrjP5cKlstjlP0r6ATR4MK53mjPGR+CQZlNtzU6EA8CwcscddV
         f9+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=sptqSn2q1MUxoiSJ0oXgREmv1FSN9FwBedSu534JEYA=;
        b=RH6w44h08iHawacicGn9yi5HCECczD080AN4lpvK9eU7yap6Tw/y/8augltDN1eB0y
         HNdMTynFAoZflV1E9KEBJWlH0xFDGOh1vnE6n4notuAxjfAF8AGUl55Fed2puovUKU41
         HjdyBDP9thpq5AbDfrVcPFh8P90xxHS4uf2f4eP5vgXv3nVgvq0xMxHAFuDdOEdJ1+QH
         cujnuJehq4/51fodde+ECPX/tzj2Vg8heukoZpBl5LrygXM+LsliPi6RdbbvWepIFQnU
         GEKHjUJ+do9F2DQQIszN3EH+SrY6Euq32DkhQ8uj3RrnbJ2q/te1CfIvRVj0JS5+cTNu
         caSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QJkm7u5y;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 25-20020a056870119900b001167e133288sor2239939oau.169.2022.08.16.13.35.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 16 Aug 2022 13:35:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QJkm7u5y;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=sptqSn2q1MUxoiSJ0oXgREmv1FSN9FwBedSu534JEYA=;
        b=QJkm7u5yuz/Z3unkMZbM3/+58u7EYXgzO/R1zTUHQVD7fBWD2VKZkmgRlxk77QZoCA
         mppM16SqURfNvT+8ekV35LGKQ6+FMqE8xKUt3SZs1eVDrI5m4AajVUi1jPA5ZQs9yxTD
         iI1Uc/rn28pme70vOvBbG0gOE11X2oxJQjTZ0nH8tSKdGfjrA9MpxFv7A+TkCrkt5TT+
         qgdJcoWMu0Yt75OemSxqNI55Af0v8+hv9cxwZd9LogmD1RvLJAkENjzU3C4D3ghHgOgT
         cvBFPL82PVbyMFvqQ24SZXfCtq8P3aXc+9il7H0iUTXtvYEK5/v18rv+I8VnH8v54ow7
         oe+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=sptqSn2q1MUxoiSJ0oXgREmv1FSN9FwBedSu534JEYA=;
        b=dVPT+zlngk7nE7LqdPDQQRtmjp2WN/4lxj1Fnio3HmvqRRvF5+V/fBdjd6cIQdyd/y
         12VP0SNuOI6hBuYX70fiNtK/Jvk7Avstbq4MhHS+OX86Op1gtaYXAWFIV83M8GI4ERVt
         ML95ha3aZyo4nL6xbwbIQaattHjkAmiFjnaPhEtdy6WeWpAxgqJ8YFPam6Jpvx/94Yfa
         uUku2HI5mYyPSuJWeauTWKspNRIZM7osmlJWh/dq1ZJgQlpCML0Jc6/7SI5QbF0vew+m
         PFYjvSaYjg2aXeriqTottS6XvMBeS/sabI6sTK7ULK/sbv6laNQ4pogoz0O4DEvaHD+6
         zbNw==
X-Gm-Message-State: ACgBeo33eyMimFQK4sq95dbVDHbNT7FcRPjQDiLrnbz2k/YTySaRISSO
	Fvl/7U5egMcOPWPq5oJrmCwCX3/B
X-Google-Smtp-Source: AA6agR6bjv33hZ0/vVhxE52+Firfvq/XvzgyksC1HZKgwTCfR+ZObduGr4BA99kW/LoZHZ4gM91r3Q==
X-Received: by 2002:a05:6870:ea9d:b0:112:cf7c:d06d with SMTP id s29-20020a056870ea9d00b00112cf7cd06dmr137244oap.295.1660682104404;
        Tue, 16 Aug 2022 13:35:04 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. ([2605:ef80:80f6:61fa:9bc2:5095:d612:5e22])
        by smtp.gmail.com with ESMTPSA id y23-20020a056870b01700b0010ef8ccde67sm2285220oae.13.2022.08.16.13.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 13:35:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	iii@linux.ibm.com
Subject: [PATCH v2 29/33] target/arm: Change gen_exception_internal to work on displacements
Date: Tue, 16 Aug 2022 15:33:56 -0500
Message-Id: <20220816203400.161187-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220816203400.161187-1-richard.henderson@linaro.org>
References: <20220816203400.161187-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 2Vh0NiwF8aRx

In preparation for TARGET_TB_PCREL, reduce reliance on absolute values.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c |  6 +++---
 target/arm/translate.c     | 10 +++++-----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 422ce9288d..b777742643 100644
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

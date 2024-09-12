Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp368334nji;
        Wed, 11 Sep 2024 19:43:18 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXqG9uP1HFXY314IklWtLIFOr7k3ElIHjsiRumxtfCbPW8WLVtTm9SwmC9BeRcR9KHVr5118y1xssSveA==@linaro.org
X-Google-Smtp-Source: AGHT+IGxYvoXM1hC0wOYlqKYr/Q4pvMWRppdb8hphJj+CGIG4+O9HO/l1KhjjiFmJTIYjPjMf6Va
X-Received: by 2002:a05:6214:3bc6:b0:6c3:3efe:3fac with SMTP id 6a1803df08f44-6c573aacc92mr28570516d6.3.1726108997951;
        Wed, 11 Sep 2024 19:43:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726108997; cv=none;
        d=google.com; s=arc-20240605;
        b=LfT2yXVkonKLr3igyYEQFKYo5fOrLHorhijO35aKx2XHAMei93uN7EXoB1Tgf5KoBR
         UV3oaTzhLVhBm4ylfXT0H90coOlskRMXrFxIXJEeUn7cZyiWhY0NjL01yq/jmjZmjM0/
         w4AO1+onf8+1EWJH8UhpVREJ3ZAPQKCB67Ga/J9So7O0nAm0CgeFeMow5LIfTwzPogQi
         gkgftHSPXYAercb5+MXp9caAweUwh0J+RlEIVIaKKGIHSq00zTN0xHIiFg0z9v7e3Dwv
         UGUwsTNOld7cDlW/h4HbRVU1EukFx8zYiL/WHnS3imNJGM+d12o90A+EbUM4QMwyKFVZ
         yjFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=rkXBvyX56rezRPuXpFz/dXJhKRh6RJ5INCTz9rG8X5g=;
        fh=ZhBia3nL9o1nuf7SbgdYn/0pDmAeja6gisyWXi2cqYE=;
        b=fZa36L6+pBcLQCbOCxFx6p6+rcG0wSBfv0rwPvjpYlpScGp1FWFvOOKTYg8ccrCeby
         zYXsFb6LPK7KLLWyK1/DUzgtd2JP/mdd6yhmwrGruCcskySdvENlbiwUBnOFW4c2SqMP
         PYz6H6u8doYEAydlZI5XjidLDSbPhDVwhMpkrwFCegiZc/zvZrOkio0Hh+lvZdCY8kWI
         PZr5B7ATrMo0p9dbKf1R5wChM6crzev/mYEFuXXfoakjaZjGYORQVuiYL54pK4NXP+YF
         Og0lqU1vNazJeSpm9Dqo1Pi50SJ7VH0N7xP7Rzgq3qaHiRL2eAHGZZcGrajdN2B06dbq
         fyQw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oLRvMETT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c534784576si115159126d6.433.2024.09.11.19.43.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Sep 2024 19:43:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oLRvMETT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1soZmM-0004UA-0I; Wed, 11 Sep 2024 22:41:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1soZm0-00034D-O8
 for qemu-devel@nongnu.org; Wed, 11 Sep 2024 22:41:32 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1soZly-0004BQ-T0
 for qemu-devel@nongnu.org; Wed, 11 Sep 2024 22:41:32 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-20573eb852aso10682475ad.1
 for <qemu-devel@nongnu.org>; Wed, 11 Sep 2024 19:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726108889; x=1726713689; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rkXBvyX56rezRPuXpFz/dXJhKRh6RJ5INCTz9rG8X5g=;
 b=oLRvMETTWwtlNINcQhlHpyv4q3mou9GAdIwtkI/4v1uEU+1RER6OiZJPa88dtkcbBi
 4B2DNCJOOZ08NUchpDZYHPIugK+MHZU7UU2VRYf5mlMBR70e2fxjlWYIwPpRZSV4/eJN
 iJwddjt3fLH9Y7Fwsi00Sx6tnj8zCXiqqWuMUsQdu/4Swxhs0J6DGGzuKi/3LvFPG2eQ
 eOWQ7iljJMSzGlTNLOaCj/Khfl/cnSiUYHvudtEQSc4w0EEWeBYPFy5G4RH7yP2Qchcn
 +0TclVNAa7kkGwsje4w8XqQsjoRKfgF3l0Fllv8gN+VR1IuIhzJU7hN8ncU16cT9Caa7
 jOWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726108889; x=1726713689;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rkXBvyX56rezRPuXpFz/dXJhKRh6RJ5INCTz9rG8X5g=;
 b=m+cvF2s6+jmljIgIJCwKL8p1Q/h79vz7zJSQJgujQFsTbmGRySnjqwad5mARk15weU
 mZ84vJPz9fQiTCzLjFkmRKuitDoInztYWO03000AJSN+4IAWMVLrvoorEveZQ+lLSnhh
 qSPXRPzxBqsSQBP4J8Y1CUwJ81Hp4jmddizqfPiJ738A11YjpR12SjiZlqCG+9MsZSdA
 ZqfyxntjHc1vlDBlJDFKDKYjoPbeQ/Y3np0bLsp+YWV4PSJapaVFnxqX7P13YHkiIujH
 2JCJ38fxW6k7Grimf8cJSiP9hGWN4fAYraDoLvYtP+dqvVcOkxkquM3m6FZy6GewJsyn
 41GQ==
X-Gm-Message-State: AOJu0YyI17W6LYZlne1TAxOWtu93ZBHIqvWdiOZuo/HNhHYA7HRKML4c
 m/x7vb2UiKxQpGAxnDrqK4YltQbMAJjk7vgANYbvnxnEQfm9LepVaXPCAAC/KU8MkKxK6/mV5A1
 L
X-Received: by 2002:a17:903:1112:b0:206:9818:5431 with SMTP id
 d9443c01a7336-2076e5f7c1dmr17603545ad.20.1726108888950; 
 Wed, 11 Sep 2024 19:41:28 -0700 (PDT)
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2076afe9c61sm5635915ad.231.2024.09.11.19.41.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2024 19:41:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 14/29] target/arm: Introduce gen_gvec_sshr, gen_gvec_ushr
Date: Wed, 11 Sep 2024 19:40:59 -0700
Message-ID: <20240912024114.1097832-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240912024114.1097832-1-richard.henderson@linaro.org>
References: <20240912024114.1097832-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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
X-TUID: Jm9gSKJX/8b4

Handle the two special cases within these new
functions instead of higher in the call stack.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate.h      |  5 +++++
 target/arm/tcg/gengvec.c        | 19 +++++++++++++++++++
 target/arm/tcg/translate-a64.c  | 16 +---------------
 target/arm/tcg/translate-neon.c | 25 ++-----------------------
 4 files changed, 27 insertions(+), 38 deletions(-)

diff --git a/target/arm/tcg/translate.h b/target/arm/tcg/translate.h
index 3f0e9ceaa3..45990ae292 100644
--- a/target/arm/tcg/translate.h
+++ b/target/arm/tcg/translate.h
@@ -514,6 +514,11 @@ void gen_sqsub_d(TCGv_i64 d, TCGv_i64 q, TCGv_i64 a, TCGv_i64 b);
 void gen_gvec_sqsub_qc(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
                        uint32_t rm_ofs, uint32_t opr_sz, uint32_t max_sz);
 
+void gen_gvec_sshr(unsigned vece, uint32_t rd_ofs, uint32_t rm_ofs,
+                   int64_t shift, uint32_t opr_sz, uint32_t max_sz);
+void gen_gvec_ushr(unsigned vece, uint32_t rd_ofs, uint32_t rm_ofs,
+                   int64_t shift, uint32_t opr_sz, uint32_t max_sz);
+
 void gen_gvec_ssra(unsigned vece, uint32_t rd_ofs, uint32_t rm_ofs,
                    int64_t shift, uint32_t opr_sz, uint32_t max_sz);
 void gen_gvec_usra(unsigned vece, uint32_t rd_ofs, uint32_t rm_ofs,
diff --git a/target/arm/tcg/gengvec.c b/target/arm/tcg/gengvec.c
index c5fc1b6cfb..33c5084ea6 100644
--- a/target/arm/tcg/gengvec.c
+++ b/target/arm/tcg/gengvec.c
@@ -88,6 +88,25 @@ GEN_CMP0(gen_gvec_cgt0, TCG_COND_GT)
 
 #undef GEN_CMP0
 
+void gen_gvec_sshr(unsigned vece, uint32_t rd_ofs, uint32_t rm_ofs,
+                   int64_t shift, uint32_t opr_sz, uint32_t max_sz)
+{
+    /* Signed shift out of range results in all-sign-bits */
+    shift = MIN(shift, (8 << vece) - 1);
+    tcg_gen_gvec_sari(vece, rd_ofs, rm_ofs, shift, opr_sz, max_sz);
+}
+
+void gen_gvec_ushr(unsigned vece, uint32_t rd_ofs, uint32_t rm_ofs,
+                   int64_t shift, uint32_t opr_sz, uint32_t max_sz)
+{
+    /* Unsigned shift out of range results in all-zero-bits */
+    if (shift >= (8 << vece)) {
+        tcg_gen_gvec_dup_imm(vece, rd_ofs, opr_sz, max_sz, 0);
+    } else {
+        tcg_gen_gvec_shri(vece, rd_ofs, rm_ofs, shift, opr_sz, max_sz);
+    }
+}
+
 static void gen_ssra8_i64(TCGv_i64 d, TCGv_i64 a, int64_t shift)
 {
     tcg_gen_vec_sar8i_i64(a, a, shift);
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 53022f4fc0..032bd33650 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -10452,21 +10452,7 @@ static void handle_vec_simd_shri(DisasContext *s, bool is_q, bool is_u,
         break;
 
     case 0x00: /* SSHR / USHR */
-        if (is_u) {
-            if (shift == 8 << size) {
-                /* Shift count the same size as element size produces zero.  */
-                tcg_gen_gvec_dup_imm(size, vec_full_reg_offset(s, rd),
-                                     is_q ? 16 : 8, vec_full_reg_size(s), 0);
-                return;
-            }
-            gvec_fn = tcg_gen_gvec_shri;
-        } else {
-            /* Shift count the same size as element size produces all sign.  */
-            if (shift == 8 << size) {
-                shift -= 1;
-            }
-            gvec_fn = tcg_gen_gvec_sari;
-        }
+        gvec_fn = is_u ? gen_gvec_ushr : gen_gvec_sshr;
         break;
 
     case 0x04: /* SRSHR / URSHR (rounding) */
diff --git a/target/arm/tcg/translate-neon.c b/target/arm/tcg/translate-neon.c
index 13cd31aad4..a31a78c347 100644
--- a/target/arm/tcg/translate-neon.c
+++ b/target/arm/tcg/translate-neon.c
@@ -1099,29 +1099,8 @@ DO_2SH(VRSHR_S, gen_gvec_srshr)
 DO_2SH(VRSHR_U, gen_gvec_urshr)
 DO_2SH(VRSRA_S, gen_gvec_srsra)
 DO_2SH(VRSRA_U, gen_gvec_ursra)
-
-static bool trans_VSHR_S_2sh(DisasContext *s, arg_2reg_shift *a)
-{
-    /* Signed shift out of range results in all-sign-bits */
-    a->shift = MIN(a->shift, (8 << a->size) - 1);
-    return do_vector_2sh(s, a, tcg_gen_gvec_sari);
-}
-
-static void gen_zero_rd_2sh(unsigned vece, uint32_t rd_ofs, uint32_t rm_ofs,
-                            int64_t shift, uint32_t oprsz, uint32_t maxsz)
-{
-    tcg_gen_gvec_dup_imm(vece, rd_ofs, oprsz, maxsz, 0);
-}
-
-static bool trans_VSHR_U_2sh(DisasContext *s, arg_2reg_shift *a)
-{
-    /* Shift out of range is architecturally valid and results in zero. */
-    if (a->shift >= (8 << a->size)) {
-        return do_vector_2sh(s, a, gen_zero_rd_2sh);
-    } else {
-        return do_vector_2sh(s, a, tcg_gen_gvec_shri);
-    }
-}
+DO_2SH(VSHR_S, gen_gvec_sshr)
+DO_2SH(VSHR_U, gen_gvec_ushr)
 
 static bool do_2shift_env_64(DisasContext *s, arg_2reg_shift *a,
                              NeonGenTwo64OpEnvFn *fn)
-- 
2.43.0


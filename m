Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp1142335njb;
        Sat, 1 Feb 2025 08:41:40 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUwA9iBzJuaA7dE0de2jEu3n6UucNr4aymaeYvHbrIK3OggG7UI/EdmDfCVPzAUpEOtMtsR5NT4pdb/Cg==@linaro.org
X-Google-Smtp-Source: AGHT+IHzGH+FhH16x17H8VliScEIJWjUYV32r3xsNs53tx9mxP6EcYs+CpqEwPEs5XMZ6aEXh+2s
X-Received: by 2002:ac8:5ace:0:b0:466:a119:f4d3 with SMTP id d75a77b69052e-46fd0b90ff3mr226291941cf.45.1738428100229;
        Sat, 01 Feb 2025 08:41:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738428100; cv=none;
        d=google.com; s=arc-20240605;
        b=INh+HBtNUyzxlUVX/E4olzGMC4YkU4nLhX7mgooGpBmYdofqGNYKiBHBygXy+JyOFs
         eGh9vCbhsQv+nqRRyn3lIBgDRQNOnxa966bQVowo4L/tJtj8c0STO0PjDt2NLhAh22VR
         K8Xi13ayoCWCb4Z4KR4CeuA+t7ZTJzorSfSqwJzTqxWAb5F7gN+0H1hE/w4+Ms04QSqD
         0Wvh7moG3BcbjxtSn1YC/I61B6z3ajYWDSblePoQjLKiMDX9rgth21hzHafIKSSOCEn7
         OMuPlCgh/mLcMVdYHCaTg3AZvzmVTTKBOGYeifBbqkKHxI8juB79N7fh1+G9j2DsKA4T
         /i8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=vpMSdd/6TkdfCRr5FCGHe6DC8lmbsXPDu8N06iR71b8=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=YMCYNYg8gaALqRxOYMhw42hI46K9LMZAJyiin+1a2JFoUqMFmkR3xY1mP92joiupmm
         VlrldEdo1twp/6I0xANl/4mgxRLbotNuRw2HJyXo2YJSuu5SLq40kkB2wXybJzL9HZP+
         6BXu4paJxVsC6zCoJ4nYxo4HwNtkamoy9obv8eLVUnuxm6DMEOat+AUg+tDbP3ugeXjm
         H0xOTvPqQBQgwvf4SozPhwAATEr/7HjoO2lvpJwOXBDR1VHt7KTR+31dE1hduUdneTC+
         HsDam0Br5H6jSpWnYDj/b9b/Mnd+qIijcP4N8VXhMEkgYrBCf7bEQSM1Q9fkI1er72ER
         IoCw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=W+fnfKXA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46fdf0ab198si60929861cf.47.2025.02.01.08.41.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 01 Feb 2025 08:41:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=W+fnfKXA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1teGYE-0006Oi-Fq; Sat, 01 Feb 2025 11:40:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1teGYB-0006J5-1q
 for qemu-arm@nongnu.org; Sat, 01 Feb 2025 11:40:55 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1teGY9-0001Av-BO
 for qemu-arm@nongnu.org; Sat, 01 Feb 2025 11:40:54 -0500
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3862d16b4f5so1861877f8f.0
 for <qemu-arm@nongnu.org>; Sat, 01 Feb 2025 08:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738428052; x=1739032852; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=vpMSdd/6TkdfCRr5FCGHe6DC8lmbsXPDu8N06iR71b8=;
 b=W+fnfKXAHxNd11GVJe8XfgbUnp0j6bMQ5X69kNssREYBq9X8IlDtRbdUiuxiW+ZZ2K
 S08dJXBaE9VxooHwswqQncH2RzbqzTQ0wZFv/cmWgU5Zmrgo1A/odGnSNS0+o4LDJ1C0
 u1fQWFueapgf3J8CtUigXuo0qAbo0FMrIHjAkch8AQNbv4P/yNvrjOydlwAZrZw7dcwG
 C6x/iYFzkCYZinWQGr8GUbro8rBr3m/NLDdv3QfErPdcMuj1Lqkd97+NEfFEvv0ba7r5
 0wYTxgB9M7OZRrVV0ukYGfIRsWZFtQeS/vv8bpLS9YUKxp1Mv59zhn2gYFrc9tI5ZnDP
 nJEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738428052; x=1739032852;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vpMSdd/6TkdfCRr5FCGHe6DC8lmbsXPDu8N06iR71b8=;
 b=mYseIAitlhcFWhGjgzZuF5sJTP8wXXteg585tdOr5uLjR1FfFGNX/sRBIyruv9ps6e
 t7m9Ny3e/N0cPSBL3Kayq0GFwsfEnJQvh6kmsKQTPjJ9IJEQdke6/9yDv/wUWbp/HxdJ
 wVH0KCiV9Bd+DSGLz/QR5hKjxwokgiOccE5B/2WaKmFngEZtbS4I35Qu+22JQpx8VpJx
 e9ckirrngI7ncqOXZyZqdUKOghbV55I0pYuSrYF9wLDQS6PmrDO1yW/4spdV1vgI4OuR
 vk5v/eyhBfVgQJX8MVgC5j/MCMEkBqBlQY6ksBsgmBeJQBdQ91TqeefAtuHZjd4XewhR
 SD4A==
X-Gm-Message-State: AOJu0YxBarKK4lL/r0sAGjQatEek5+p7h9ZXdm3PDfBvPP2jotjiTqR/
 eYm57q9WECGvGNNrtbzQhl9APQMqvlek5N9tZ0FHny+6za6Srkg9KucN6WhAONNEZzghOKjfSEY
 J
X-Gm-Gg: ASbGncsyxluJ/pwh7XGTvZ5sms5o5dBeI1cXWXkaudqhaJiHL5qvKT66q2WggDwT64N
 szstpLpDPp8whoPqo4w090/cpt9CysJcnPutCW4pDjyRa2pnco5cSncfLTmrQ1cqJ9t3cHio2Ck
 O+fG/iYu+CnncDEOIk3S1a2SixPcoEfdZ4UM+Z4hj/6YPlGaUTB2QX1cCuidTz1ntOqrkHWaFC7
 /dAV1JF+i1WBqhVm19T7BgOeCMDPlNbPKRAGAbjjt4/ze14le4PevUSI8KWaENNqEn3v9EPedgI
 od3QSsZ90qTi6jlKW7W3
X-Received: by 2002:a5d:6d84:0:b0:386:3672:73e7 with SMTP id
 ffacd0b85a97d-38c60f149e9mr5800661f8f.9.1738428051902; 
 Sat, 01 Feb 2025 08:40:51 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc81d74sm127401525e9.37.2025.02.01.08.40.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Feb 2025 08:40:51 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 27/69] target/arm: Implement FPCR.AH semantics for FMINP
 and FMAXP
Date: Sat,  1 Feb 2025 16:39:30 +0000
Message-Id: <20250201164012.1660228-28-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250201164012.1660228-1-peter.maydell@linaro.org>
References: <20250201164012.1660228-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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
X-TUID: sP/blZzaaN74

Implement the FPCR.AH semantics for the pairwise floating
point minimum/maximum insns FMINP and FMAXP.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/helper-sve.h    | 14 ++++++++++++++
 target/arm/tcg/translate-a64.c | 25 +++++++++++++++++++++----
 target/arm/tcg/vec_helper.c    | 10 ++++++++++
 3 files changed, 45 insertions(+), 4 deletions(-)

diff --git a/target/arm/tcg/helper-sve.h b/target/arm/tcg/helper-sve.h
index f1b4606f763..8349752e99b 100644
--- a/target/arm/tcg/helper-sve.h
+++ b/target/arm/tcg/helper-sve.h
@@ -986,6 +986,20 @@ DEF_HELPER_FLAGS_5(gvec_ah_fmin_s, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_5(gvec_ah_fmin_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, fpst, i32)
 
+DEF_HELPER_FLAGS_5(gvec_ah_fmaxp_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_5(gvec_ah_fmaxp_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_5(gvec_ah_fmaxp_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, fpst, i32)
+
+DEF_HELPER_FLAGS_5(gvec_ah_fminp_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_5(gvec_ah_fminp_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_5(gvec_ah_fminp_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, fpst, i32)
+
 DEF_HELPER_FLAGS_4(sve_faddv_h, TCG_CALL_NO_RWG,
                    i64, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_4(sve_faddv_s, TCG_CALL_NO_RWG,
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 80a6562ed51..7af727b606d 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -5776,14 +5776,24 @@ static gen_helper_gvec_3_ptr * const f_vector_fmaxp[3] = {
     gen_helper_gvec_fmaxp_s,
     gen_helper_gvec_fmaxp_d,
 };
-TRANS(FMAXP_v, do_fp3_vector, a, 0, f_vector_fmaxp)
+static gen_helper_gvec_3_ptr * const f_vector_ah_fmaxp[3] = {
+    gen_helper_gvec_ah_fmaxp_h,
+    gen_helper_gvec_ah_fmaxp_s,
+    gen_helper_gvec_ah_fmaxp_d,
+};
+TRANS(FMAXP_v, do_fp3_vector_2fn, a, 0, f_vector_fmaxp, f_vector_ah_fmaxp)
 
 static gen_helper_gvec_3_ptr * const f_vector_fminp[3] = {
     gen_helper_gvec_fminp_h,
     gen_helper_gvec_fminp_s,
     gen_helper_gvec_fminp_d,
 };
-TRANS(FMINP_v, do_fp3_vector, a, 0, f_vector_fminp)
+static gen_helper_gvec_3_ptr * const f_vector_ah_fminp[3] = {
+    gen_helper_gvec_ah_fminp_h,
+    gen_helper_gvec_ah_fminp_s,
+    gen_helper_gvec_ah_fminp_d,
+};
+TRANS(FMINP_v, do_fp3_vector_2fn, a, 0, f_vector_fminp, f_vector_ah_fminp)
 
 static gen_helper_gvec_3_ptr * const f_vector_fmaxnmp[3] = {
     gen_helper_gvec_fmaxnump_h,
@@ -6775,9 +6785,16 @@ static bool do_fp3_scalar_pair(DisasContext *s, arg_rr_e *a, const FPScalar *f)
     return true;
 }
 
+static bool do_fp3_scalar_pair_2fn(DisasContext *s, arg_rr_e *a,
+                                   const FPScalar *fnormal,
+                                   const FPScalar *fah)
+{
+    return do_fp3_scalar_pair(s, a, s->fpcr_ah ? fah : fnormal);
+}
+
 TRANS(FADDP_s, do_fp3_scalar_pair, a, &f_scalar_fadd)
-TRANS(FMAXP_s, do_fp3_scalar_pair, a, &f_scalar_fmax)
-TRANS(FMINP_s, do_fp3_scalar_pair, a, &f_scalar_fmin)
+TRANS(FMAXP_s, do_fp3_scalar_pair_2fn, a, &f_scalar_fmax, &f_scalar_fmax_ah)
+TRANS(FMINP_s, do_fp3_scalar_pair_2fn, a, &f_scalar_fmin, &f_scalar_fmin_ah)
 TRANS(FMAXNMP_s, do_fp3_scalar_pair, a, &f_scalar_fmaxnm)
 TRANS(FMINNMP_s, do_fp3_scalar_pair, a, &f_scalar_fminnm)
 
diff --git a/target/arm/tcg/vec_helper.c b/target/arm/tcg/vec_helper.c
index 9f77aa6b919..61e6e54570c 100644
--- a/target/arm/tcg/vec_helper.c
+++ b/target/arm/tcg/vec_helper.c
@@ -2444,6 +2444,16 @@ DO_3OP_PAIR(gvec_fminnump_h, float16_minnum, float16, H2)
 DO_3OP_PAIR(gvec_fminnump_s, float32_minnum, float32, H4)
 DO_3OP_PAIR(gvec_fminnump_d, float64_minnum, float64, )
 
+#ifdef TARGET_AARCH64
+DO_3OP_PAIR(gvec_ah_fmaxp_h, helper_vfp_ah_maxh, float16, H2)
+DO_3OP_PAIR(gvec_ah_fmaxp_s, helper_vfp_ah_maxs, float32, H4)
+DO_3OP_PAIR(gvec_ah_fmaxp_d, helper_vfp_ah_maxd, float64, )
+
+DO_3OP_PAIR(gvec_ah_fminp_h, helper_vfp_ah_minh, float16, H2)
+DO_3OP_PAIR(gvec_ah_fminp_s, helper_vfp_ah_mins, float32, H4)
+DO_3OP_PAIR(gvec_ah_fminp_d, helper_vfp_ah_mind, float64, )
+#endif
+
 #undef DO_3OP_PAIR
 
 #define DO_3OP_PAIR(NAME, FUNC, TYPE, H) \
-- 
2.34.1


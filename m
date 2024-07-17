Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp614978njk;
        Tue, 16 Jul 2024 23:10:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWLjsPYSiED4a1l7RmXTYrfkX8J3abiy/4SKJsu8vUGGiDgCTHtEzwJt2/NO3Fx3TpBIkAcPZWNupYo4y8l+uTbtTHfT7bV
X-Google-Smtp-Source: AGHT+IGNiPAM9DIltE7OXKqLUKnBA+dafLWm7+O8UK46qvrLKY7HC9EesbqYQONyqtC910ydajBE
X-Received: by 2002:a05:6214:2b0f:b0:6b5:ef1:72b with SMTP id 6a1803df08f44-6b78e442943mr9614726d6.50.1721196610824;
        Tue, 16 Jul 2024 23:10:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721196610; cv=none;
        d=google.com; s=arc-20160816;
        b=W7oEBU7RImATbUaTQcwIfu9sqA1Cm8557AI25QtTl/JH8WtIHphYjDy95JEzeG/q/A
         3zMAPywL29aUD7AbEj1a4lZ6QCUGr4LhyNIHHH9FitfXv9YWUw4anDi2rSoio7F81jub
         9kKp+aBGeqKY85ZliedcFjDxA0PGPYIkGxDS+QCZ/HTsyUDOvRO1kFPbWv6wqiO9hBer
         cGkWgFMY0E5GbpjVg2qsDRtC1+yKsz+pCSRYMCu4JVvTbq4suJaBDCp0KIh7h9SUM8sQ
         Nc01z5dpxY4KflVEcVUXAxK/cfriPTwr2nis3XZ+9Pk38VqjLeAw6qX28qcWocrPekpB
         MBcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=6VF3yXySyHxycuIv5IJw23OAgkwvwvSkw9Ee2WxvfpM=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=VLInUAv6tw2JWmFqxYmdT8frIp61KUPXiyOyN6mLIJeRwb8a+BKlzfJIgtmkgz+VNY
         0oKqf2x/AIHbD6QkxG51gkXeHKL3jJygYwqIUfAe5J8xUU3H6+lTCExukhFCfuMUFouZ
         lu4qwFQuz5bOwuKSU7LXfq7KUgokkrucWkESh1+XkgPe5u2g6NzSSq0wkNkuIor9CTpm
         Y9ERV2HqueeucT5hp3UIEsglrRiRDEnB24s+arQag26/fFwlH2gfGL6fiYHR2LpTuuzv
         M2PE6tMXgJyjc/GzG3FubeOpvHGulwj82LnghTCNgehyX8MLfiUmELiR5JXqmOhYriEO
         tSoQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gGnuIa3S;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b761a02df7si91199976d6.269.2024.07.16.23.10.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jul 2024 23:10:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gGnuIa3S;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sTxrL-0005Th-Lt; Wed, 17 Jul 2024 02:09:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sTxr8-0004aF-So
 for qemu-devel@nongnu.org; Wed, 17 Jul 2024 02:09:39 -0400
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sTxr7-00034J-5O
 for qemu-devel@nongnu.org; Wed, 17 Jul 2024 02:09:38 -0400
Received: by mail-ot1-x32e.google.com with SMTP id
 46e09a7af769-6f8d0a1e500so5553333a34.3
 for <qemu-devel@nongnu.org>; Tue, 16 Jul 2024 23:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721196576; x=1721801376; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6VF3yXySyHxycuIv5IJw23OAgkwvwvSkw9Ee2WxvfpM=;
 b=gGnuIa3S02V+7ghedOjD9wvtC0qtX6EPaYpSUS5EfgLPeg51YT5Wi8VjtUiEHH6Aud
 QERWdBUadYu+oCrtNDvSmMNC0ag4IlwafZAwkK+Cl0qoE8rBgvtb5MAKcEbfPIYMkrmK
 DjVBWwkjAG3FhgMv1BSd1y8Dt629KMEOjXSeWQSzSqGVJchrUBheI/JTyGBWWpOaNlm8
 QBcdqXhmLdmsBSFNKTQQ8qkWz6Li1GnlP+nmRubh6sB5BtQyyO9BgDoRcBaISRc4r/Xc
 0ZtVxfypuO8nirGOjoMUPDI5/qqQB9qXGS+V17l9WS+fstQ7rMkzcH9+5Vh5ag0CFD73
 lg5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721196576; x=1721801376;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6VF3yXySyHxycuIv5IJw23OAgkwvwvSkw9Ee2WxvfpM=;
 b=SNydR1STJupxdqlZsB4Vg1t63UkMOh1UicrNoxRScfJAO6GkEsikZ+v7Qkomqw6wds
 WOAOgnnrRgcDPlwGr8RXDYduLWlkDSQnDTfzoxuCVd7MPeNIf71n8SLrGj3YB9L8Xeb+
 wpeOECanK0n6S8dkx9Jg6NciYDDR+U/8ZkckhvXRhvZqBpEJZvO16s/C48MOEYuqBBbE
 +bOcEN2JOcJlz/jIxZzYhVCpiQx7gblgN7jG/F9PCFkpJvQj8vVFT8v/QLPOb1lG1gHS
 0T+hFWGlnLKDBfS6IiX2GuCCIvuZC1Wy8rY8qp55/RWJOQ7Ey+XLeI2zTAFkxL0RTnuj
 FVuA==
X-Gm-Message-State: AOJu0YxuGtwr+H16KoiQj0fYb0me4cSHHWbLxwHiOgvsK3GH22/z+a23
 D7j+G9NEoP6eBzsFP9ZxSrT+/lgOfEqHHUEJGqr2chlP055ut/poZod+uLgzMi2CXpCWMX7SpuA
 Nnzs=
X-Received: by 2002:a05:6830:3909:b0:6f9:8000:53e5 with SMTP id
 46e09a7af769-708e37f0bbcmr847583a34.23.1721196575929; 
 Tue, 16 Jul 2024 23:09:35 -0700 (PDT)
Received: from stoup.. ([203.56.128.103]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70b7ecd603bsm7330404b3a.219.2024.07.16.23.09.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 23:09:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 10/17] target/arm: Introduce gen_gvec_sshr, gen_gvec_ushr
Date: Wed, 17 Jul 2024 16:08:56 +1000
Message-ID: <20240717060903.205098-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240717060903.205098-1-richard.henderson@linaro.org>
References: <20240717060903.205098-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32e.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: zOvQ1gaWfPqC

Handle the two special cases within these new
functions instead of higher in the call stack.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate.h      |  5 +++++
 target/arm/tcg/gengvec.c        | 19 +++++++++++++++++++
 target/arm/tcg/translate-a64.c  | 16 +---------------
 target/arm/tcg/translate-neon.c | 25 ++-----------------------
 4 files changed, 27 insertions(+), 38 deletions(-)

diff --git a/target/arm/tcg/translate.h b/target/arm/tcg/translate.h
index a8672c857c..d1a836ca6f 100644
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
index 56a1dc1f75..47ac2634ce 100644
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
index 1fa9dc3172..d0a3450d75 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -10411,21 +10411,7 @@ static void handle_vec_simd_shri(DisasContext *s, bool is_q, bool is_u,
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
index 915c9e56db..05d4016633 100644
--- a/target/arm/tcg/translate-neon.c
+++ b/target/arm/tcg/translate-neon.c
@@ -1068,29 +1068,8 @@ DO_2SH(VRSHR_S, gen_gvec_srshr)
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


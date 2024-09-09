Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp984335njb;
        Mon, 9 Sep 2024 09:24:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXDdgjQp/t4vGJu+z6XQinn6yVnHm2eZ33oyZCqxFmn2hwhCHYUcAfNGfVBuPOIBRvoJ6u2268zRnd2gA==@linaro.org
X-Google-Smtp-Source: AGHT+IHUSZIvwIVf961D+PgalFDgqqAENLZe7bUONdhWPRiBYffUuM7Vt4qY1o1xCzALV4TkkdPQ
X-Received: by 2002:a05:622a:8f:b0:456:8119:ec15 with SMTP id d75a77b69052e-4580c66fbf6mr143572541cf.3.1725899065785;
        Mon, 09 Sep 2024 09:24:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725899065; cv=none;
        d=google.com; s=arc-20240605;
        b=abP6eUBGYGSF13VCzFQB9kEgSRpWJLjMbJYKElfltgO6FnE2SJmUIszrN4pF7t1vqn
         YF+w8mYUBr7Hzyf0nkAdGF3frjCD7mhgrWlkIHUDfNGBHq4BJ60PrL7HKF6xhEP6wUdM
         lU0qzBNACoa+u8EqUkB/aCFYpF9sKf4Mx7AmPiYp1lH72yMsulOtaO+5UcGLWSUuRL5n
         gKRV5csyD/mnZhgJzzuk+en+RT9S2I7QwfzJ7JRDD1Sx7ulJGPcaHggZTbBNhxziUN6o
         ZwnoLOsVai+p00kSARchC0BNEqhyVUzrL6mWWzdifHSGcwmkzx/eglkBGRfBAE23MxhW
         w3CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=A5Plnw0/isz+iSOx2ASaOf8ekZzLK2/V5JGeOINqCmQ=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=WoOrfkdmz/SdMGYVTtf2uNBgz3+7OP2mSTMQsdS4UJjaXE0CCQqUymaTfqAQVEFwNI
         ZTPwudBlJunSgxmS6fE1zfHhCbgK21wfUfH/KeO9W0+ZqcFGlR5f//ot9yqaioweb52Y
         SScfANBXc1v3DmwO82q7A9bmZbFdnhkMcqacAN3aRJvrZ5Z41rlUzDmi9TCxBGf4F10o
         ITan8ikGPskLVkxcYLoE5F3Emolh0r1P0FQzXsBycIVb2+ZC5FQm9ivyZBsIBW6Qdagv
         tvy+3Weahq/O7brDvT/0TQAGKltK+cLSitXicg1lkBC7kocdqYv8k18UHeMsa8bQDsui
         rEIA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BiJGugSY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-458313ac127si31426691cf.693.2024.09.09.09.24.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Sep 2024 09:24:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BiJGugSY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1snhAQ-0003SY-2j; Mon, 09 Sep 2024 12:23:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1snhAO-0003GA-8U
 for qemu-arm@nongnu.org; Mon, 09 Sep 2024 12:23:04 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1snhAM-0007mj-CX
 for qemu-arm@nongnu.org; Mon, 09 Sep 2024 12:23:03 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-205659dc63aso44150125ad.1
 for <qemu-arm@nongnu.org>; Mon, 09 Sep 2024 09:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725898981; x=1726503781; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A5Plnw0/isz+iSOx2ASaOf8ekZzLK2/V5JGeOINqCmQ=;
 b=BiJGugSY2GZkceRsee7tx3WUSV2LVUOFU/dv1Rc0/MB9CAJPjC+d4iV4nQo3RIAYNe
 aVZd+ixa9UzKa0LLoJH30L7UuPaI6wLlr9QGb2NXmMUMKOVC8luV/DZqRZjGhTwBiky4
 hohpu99Rg6UD+tFj0JHq7F0E0AHGRJxtaqxJJj2DCMdIe9MjB/Hd8YL6PG9gMKwJ9/2f
 fFJCvM8o+lb68cU5kuBbR6N/0gpH2AuwZ+9lsfvkNP3OXhodYOGHyGgtaZ739WEUcFmy
 SP82Os7nVZU4UH8UtvYAll69Q3zfa0ifxE0LFTqnZV1FFObeat2BzBmfISCy1+I0m8ya
 ZwWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725898981; x=1726503781;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A5Plnw0/isz+iSOx2ASaOf8ekZzLK2/V5JGeOINqCmQ=;
 b=O9tbLDRLftDZdiC2pEAfNTSLNg7XLHd8szuC25Nnkhbxnhqtet22NEMGiPv3aJThQ2
 f4dtwDAis9BU6mL2EmptstGV/XPiiv4ru4oQhUFIvKY/F5nOXErU8CmPl1UWWbUi5HqR
 fLy5Ww2kLQdly99sQpAE6O8jxL42q0VnsDO1XPAAShLjrI/dSrSZBs+9warX6wrmxs+J
 RhsPXc5v0eqcavXACyOfVbsJB7M9jSQOvnne5xAzrDY+CofvRcrhsw33M3VjtoWTS5zW
 qwdWVmG0N0mhC+wnKfMq/KozfuFYIBHY6Aeq9jI5+mLijeKEid0CPY0rbKS7WrLDtE7M
 hK2Q==
X-Gm-Message-State: AOJu0Yy467EGI+EvHhex3eGlgaCmsgtqKwz2c0GZwsT3Hf8q83c+DbL0
 +9yCZSvBXbtOFjag1qnTJMWFCNnSYVuPRx2qqk1Ssmne3Vum6iTxzcokkT1Lf04wiF9dX1Iq6lD
 c
X-Received: by 2002:a17:903:230d:b0:202:2e81:27a3 with SMTP id
 d9443c01a7336-206f0531120mr114964755ad.29.1725898981084; 
 Mon, 09 Sep 2024 09:23:01 -0700 (PDT)
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20710f35d79sm35753305ad.288.2024.09.09.09.23.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 09:23:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 21/29] target/arm: Split out subroutines of
 handle_shri_with_rndacc
Date: Mon,  9 Sep 2024 09:22:31 -0700
Message-ID: <20240909162240.647173-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240909162240.647173-1-richard.henderson@linaro.org>
References: <20240909162240.647173-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: az9yOyCVSxYV

There isn't a lot of commonality along the different paths of
handle_shri_with_rndacc.  Split them out to separate functions,
which will be usable during the decodetree conversion.

Simplify 64-bit rounding operations to not require double-word arithmetic.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 138 ++++++++++++++++++++-------------
 1 file changed, 82 insertions(+), 56 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index e59236330a..f4deacd554 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -7019,6 +7019,78 @@ static bool do_vec_shift_imm_wide(DisasContext *s, arg_qrri_e *a, bool is_u)
 TRANS(SSHLL_v, do_vec_shift_imm_wide, a, false)
 TRANS(USHLL_v, do_vec_shift_imm_wide, a, true)
 
+static void gen_sshr_d(TCGv_i64 dst, TCGv_i64 src, int64_t shift)
+{
+    assert(shift >= 0 && shift <= 64);
+    tcg_gen_sari_i64(dst, src, MIN(shift, 63));
+}
+
+static void gen_ushr_d(TCGv_i64 dst, TCGv_i64 src, int64_t shift)
+{
+    assert(shift >= 0 && shift <= 64);
+    if (shift == 64) {
+        tcg_gen_movi_i64(dst, 0);
+    } else {
+        tcg_gen_shri_i64(dst, src, shift);
+    }
+}
+
+static void gen_srshr_bhs(TCGv_i64 dst, TCGv_i64 src, int64_t shift)
+{
+    assert(shift >= 0 && shift <= 32);
+    if (shift) {
+        TCGv_i64 rnd = tcg_constant_i64(1ull << (shift - 1));
+        tcg_gen_add_i64(dst, src, rnd);
+        tcg_gen_sari_i64(dst, dst, shift);
+    } else {
+        tcg_gen_mov_i64(dst, src);
+    }
+}
+
+static void gen_urshr_bhs(TCGv_i64 dst, TCGv_i64 src, int64_t shift)
+{
+    assert(shift >= 0 && shift <= 32);
+    if (shift) {
+        TCGv_i64 rnd = tcg_constant_i64(1ull << (shift - 1));
+        tcg_gen_add_i64(dst, src, rnd);
+        tcg_gen_shri_i64(dst, dst, shift);
+    } else {
+        tcg_gen_mov_i64(dst, src);
+    }
+}
+
+static void gen_srshr_d(TCGv_i64 dst, TCGv_i64 src, int64_t shift)
+{
+    assert(shift >= 0 && shift <= 64);
+    if (shift == 0) {
+        tcg_gen_mov_i64(dst, src);
+    } else if (shift == 64) {
+        /* Extension of sign bit (0,-1) plus sign bit (0,1) is zero. */
+        tcg_gen_movi_i64(dst, 0);
+    } else {
+        TCGv_i64 rnd = tcg_temp_new_i64();
+        tcg_gen_extract_i64(rnd, src, shift - 1, 1);
+        tcg_gen_sari_i64(dst, src, shift);
+        tcg_gen_add_i64(dst, dst, rnd);
+    }
+}
+
+static void gen_urshr_d(TCGv_i64 dst, TCGv_i64 src, int64_t shift)
+{
+    assert(shift >= 0 && shift <= 64);
+    if (shift == 0) {
+        tcg_gen_mov_i64(dst, src);
+    } else if (shift == 64) {
+        /* Rounding will propagate bit 63 into bit 64. */
+        tcg_gen_shri_i64(dst, src, 63);
+    } else {
+        TCGv_i64 rnd = tcg_temp_new_i64();
+        tcg_gen_extract_i64(rnd, src, shift - 1, 1);
+        tcg_gen_shri_i64(dst, src, shift);
+        tcg_gen_add_i64(dst, dst, rnd);
+    }
+}
+
 /* Shift a TCGv src by TCGv shift_amount, put result in dst.
  * Note that it is the caller's responsibility to ensure that the
  * shift amount is in range (ie 0..31 or 0..63) and provide the ARM
@@ -9208,69 +9280,23 @@ static void handle_shri_with_rndacc(TCGv_i64 tcg_res, TCGv_i64 tcg_src,
                                     bool round, bool accumulate,
                                     bool is_u, int size, int shift)
 {
-    bool extended_result = false;
-    int ext_lshift = 0;
-    TCGv_i64 tcg_src_hi;
-
-    if (round && size == 3) {
-        extended_result = true;
-        ext_lshift = 64 - shift;
-        tcg_src_hi = tcg_temp_new_i64();
-    } else if (shift == 64) {
-        if (!accumulate && is_u) {
-            /* result is zero */
-            tcg_gen_movi_i64(tcg_res, 0);
-            return;
-        }
-    }
-
-    /* Deal with the rounding step */
-    if (round) {
-        TCGv_i64 tcg_rnd = tcg_constant_i64(1ull << (shift - 1));
-        if (extended_result) {
-            TCGv_i64 tcg_zero = tcg_constant_i64(0);
-            if (!is_u) {
-                /* take care of sign extending tcg_res */
-                tcg_gen_sari_i64(tcg_src_hi, tcg_src, 63);
-                tcg_gen_add2_i64(tcg_src, tcg_src_hi,
-                                 tcg_src, tcg_src_hi,
-                                 tcg_rnd, tcg_zero);
-            } else {
-                tcg_gen_add2_i64(tcg_src, tcg_src_hi,
-                                 tcg_src, tcg_zero,
-                                 tcg_rnd, tcg_zero);
-            }
+    if (!round) {
+        if (is_u) {
+            gen_ushr_d(tcg_src, tcg_src, shift);
         } else {
-            tcg_gen_add_i64(tcg_src, tcg_src, tcg_rnd);
+            gen_sshr_d(tcg_src, tcg_src, shift);
         }
-    }
-
-    /* Now do the shift right */
-    if (round && extended_result) {
-        /* extended case, >64 bit precision required */
-        if (ext_lshift == 0) {
-            /* special case, only high bits matter */
-            tcg_gen_mov_i64(tcg_src, tcg_src_hi);
+    } else if (size == MO_64) {
+        if (is_u) {
+            gen_urshr_d(tcg_src, tcg_src, shift);
         } else {
-            tcg_gen_shri_i64(tcg_src, tcg_src, shift);
-            tcg_gen_shli_i64(tcg_src_hi, tcg_src_hi, ext_lshift);
-            tcg_gen_or_i64(tcg_src, tcg_src, tcg_src_hi);
+            gen_srshr_d(tcg_src, tcg_src, shift);
         }
     } else {
         if (is_u) {
-            if (shift == 64) {
-                /* essentially shifting in 64 zeros */
-                tcg_gen_movi_i64(tcg_src, 0);
-            } else {
-                tcg_gen_shri_i64(tcg_src, tcg_src, shift);
-            }
+            gen_urshr_bhs(tcg_src, tcg_src, shift);
         } else {
-            if (shift == 64) {
-                /* effectively extending the sign-bit */
-                tcg_gen_sari_i64(tcg_src, tcg_src, 63);
-            } else {
-                tcg_gen_sari_i64(tcg_src, tcg_src, shift);
-            }
+            gen_srshr_bhs(tcg_src, tcg_src, shift);
         }
     }
 
-- 
2.43.0


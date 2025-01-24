Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp936152njk;
        Fri, 24 Jan 2025 08:45:10 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXWgi34hoVS8SRC30ADpUpOLavsF/3JFIRgcRYEvapIpqVwJyWewHT7WCtwLhMe2I0cxrHV5FTLSBvvGw==@linaro.org
X-Google-Smtp-Source: AGHT+IEER6aBxjBoKtbVj0hF0h+9SzjjyMk4SUg1NQKDHAzF+zhXb/drrvrTj+xJk+aD0qL6qoSB
X-Received: by 2002:a05:620a:1a07:b0:7b6:d97a:2608 with SMTP id af79cd13be357-7be6321c005mr4614440285a.17.1737737110299;
        Fri, 24 Jan 2025 08:45:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737737110; cv=none;
        d=google.com; s=arc-20240605;
        b=kwBhPjPvCCUbyTAyfrcyH8sN3caYzPzATPngrn+JqtuT/6qRHdZdT95MurJK6w0Ce7
         h+7oIFdbI3oZmZEHcYGsMTfQKYfW5NNMS7O69ujErWyL1I4QAZfChFcWd7jztTtPOxrS
         YdvmZIRcjrKBB0/A9/bHprrOOkeE6+AawNBAVgtiBGyhtiGUtiAkpCPaHS6tdsEEG4SH
         Q7REkcR+jf8XV5j/C7q22WPFaz2QtgonIHS563a2Ft1GlYv+S5pwl1hlQLpb9l1Qw7h6
         gQ1PsCwE6IfnjPaX3Lu3Ra/pG9jabTYdCYJyFpa72ft7rP1RfYC7XgA3qOMoblEzsIAp
         PRGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=U0j6vRTPpETqpomxsJi6W+TLpbdYei71WZ9Mhto3dnA=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=ADB2/kYFCw7HgizhUjKHJoAS/Wj6+w6npBLV6sy814IdTFLxP0r9wEsQM6eDCXMlOB
         Oz2LWkAmOlYpntFLOW16YMETw8cy3qxzLhGchjpZl1aM1Asc7ycD0TNrsRs4PG3TPchI
         z/rnsH9b2kPNZKNemKXEI44tWgKk9xkROSnTN6sOGfsimAWL2sS9X5UHjbYX2AtbvycB
         /Qxq+URAU7VQJcQml95SUAt7rUPZe6cTlAkNQStN6scsthwEQsplYUe3FoESlMWPe4qE
         hYOyjVTAmAJoXh78rf3NOzVId5W2ujiqZOV7WFerG2a0ZWW2Gtsjq3AVFFatgMuu3Upd
         H9aQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=o7LvzkYC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7be9aee161esi305478985a.282.2025.01.24.08.45.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jan 2025 08:45:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=o7LvzkYC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tbMen-0003Dy-Le; Fri, 24 Jan 2025 11:35:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMYu-0005V8-9P
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 11:29:40 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMYs-0005hD-GJ
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 11:29:40 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-438a3216fc2so23580765e9.1
 for <qemu-arm@nongnu.org>; Fri, 24 Jan 2025 08:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737736177; x=1738340977; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=U0j6vRTPpETqpomxsJi6W+TLpbdYei71WZ9Mhto3dnA=;
 b=o7LvzkYCRis4MNGikRj3QZtusYAyxCPmH3/QGMhHSqCJVleMzICav91bzqs5HK00Ns
 2xFY8oAfqgZ/kTdrFB+ye4+uJa3n17UoGU178cS1XyrbKtoB4rlxPQwFXdot/uQLbBBT
 hayJIb1HIIRBz2+PCZ64N9Si2LPOPM8pkVkHDdKa25CJIHOsrOl4jLvrjXV5W+1dXJ/2
 ge48MOlHby6p+CJPIS4BAw91AeV8WJXspnrOnF+d7Lv9KXSeEDpUCRLijosx5mqDJkfR
 Z4u0iuPqkkKH8BRmr9K2mBiquYQs4ShOqZAFffyDAKAUyx4yi6gHoT/gdeuRioxARREO
 Jrxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737736177; x=1738340977;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U0j6vRTPpETqpomxsJi6W+TLpbdYei71WZ9Mhto3dnA=;
 b=W6driBUAcIKIw/0UzN9OtLe4tJahaLp2chr4Qpl4jdS1GQ/QwOMw7D8VKmAUilfLu8
 WnsMcJqbr1j2G21CmATzy+bGSwn1tyHcGYbo6mlwRmksq3+nJH0ZJjrJEuiwjUGR1Ozi
 kYOZnEkf6FCVUEJU64KG8XS+GPKH2P7DGB4bnVG/wXOAP8NxIjNJtJ2e5wPIn9569Hj1
 EJtK2GRMJ2gKnp+5tmHM06uCUnwcz/WO9DGv4dubEeYTK1ygojSTebXIqpbj29rLpqC3
 ZYO3h/C6M8J3+h0DqRO2oGcdLfVcEo2NDuyBzgKxCnN35kC17Qj+5ciatq6u7aQkTVAK
 NQMQ==
X-Gm-Message-State: AOJu0YzCiV5oIKiuHWYoLDBK3wxNt6nqder+5NOhHFxi9DQ/V+04OTTQ
 G0QJtKLz5Z5zH1mOrqnR/Q8UHsSFqr2Q0u6veTm92PFbIxxaXvOANPFy7abAVHgaU7hnVqfzzvT
 g
X-Gm-Gg: ASbGncsew+y92kURDLEGvraW2Rkp/0aXXZmUDRLciSU2twIrJ04bUTjSfpyrUP7tRFv
 qj8H7I7KhJnEythsXk4rNa0T0EZmqaJP964lvd+ROf4H9yrDMFbx9+8eqXzToKquMUicPpaX8ne
 3xYSSYxZvRvNvNwMBS2IQXT6KUFlQ+L2/SMEXpJI6YYdT+AtkNZLKBMssbbG3+qOpCl7DLfncH7
 vNYULtBzU72sBqnlLphEZIOUGrxLA51n27fNkR1Aivx6qn2LOibTysWWecdM05XjlMf8YnO03m3
 NPHvuINEJQo=
X-Received: by 2002:a05:600c:3149:b0:434:e9ee:c2d with SMTP id
 5b1f17b1804b1-4389144eee4mr250975805e9.26.1737736176994; 
 Fri, 24 Jan 2025 08:29:36 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd47eecasm31683025e9.6.2025.01.24.08.29.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 08:29:36 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 48/76] target/arm: Implement FPCR.AH semantics for FMINP and
 FMAXP
Date: Fri, 24 Jan 2025 16:28:08 +0000
Message-Id: <20250124162836.2332150-49-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250124162836.2332150-1-peter.maydell@linaro.org>
References: <20250124162836.2332150-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: kluCzaU12iTJ

Implement the FPCR.AH semantics for the pairwise floating
point minimum/maximum insns FMINP and FMAXP.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
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
index c07e22bad31..9d164b80c22 100644
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
index c7af9a04a27..d3f2eaa807e 100644
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


Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1778343njb;
        Thu, 6 Feb 2025 12:00:22 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUqtoaD6zdncWFh03HkO0U4qYeHWE3sneVA6LVEWJF0iFlRQhaARENEljlEDJMzBTtZgy9FJGszXl7OZA==@linaro.org
X-Google-Smtp-Source: AGHT+IE/D7LSnRMm0vrXCiP2Cy4CCvsbBkXSnQ6XPJtsKSNZ3Uf+vchKE0/2EhihJk+P3wo1+WQc
X-Received: by 2002:a05:6214:e66:b0:6d8:8742:137c with SMTP id 6a1803df08f44-6e44569341cmr3408206d6.24.1738872022260;
        Thu, 06 Feb 2025 12:00:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738872022; cv=none;
        d=google.com; s=arc-20240605;
        b=SrGm0fkAu7LIqK7RfBS3aBK2HYGy1hKeWVK1vxPRBp8zEZFM4Nx1IioH6ZKSqrnEsm
         xC+ktfmug1845NoP93srihCoulx2HdTT5x6NifZ5uG+WNJ+ou46z3pNoxWjpCAz0V7fw
         YMblDlWQyDQ3ylmhNIc/0EMmHFUH1Yj2VdM/Xxcr0LYQBiaHqA5wgsq/3DCPHar8e6+4
         igYYh7IMbyr9PXl3zOhgb6OML3SicpnhBOnhmRsgUeIZvs8W0hVXrXEThK1uGmC4QIqf
         i8W8KLF4Ebl96BTm6mHpwLHGWXwJtY6s6ZkX9T/EeL38TARGNI94fs0sjFB6UgQS+Gy5
         +eOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ogwZ1cQjO9+u/pCRTY5leFDQ2fKRdmFX0siW/iyyt04=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=FBwkmDh4Bcqmx+GEXcyo+vG10SnBHv0AyKi+oZJ73F+o/PZikixibRlr0yaWQ0Qm4e
         Qhfu59axfeaPN3LRVRsRBDhBLqKFCZ/Ptti2lbEZGCE9YZTbI/+cEc8sZhi7L41Z8bSK
         3X8sZP4f4yUfGPRszXVFCSQXpa9rNw0witm3zXc7tSf3hw8HbQ7RDwGD3rUKIx2Hoas9
         BX6hWI767qKVUAOG2eDvZFoIJRRAWIn4AgcM2twJ4y9DgIECk4LcIMgGRvF+5tmIVBgo
         dpFeAJqZzvqxMDnCsmTmjfppnFWGfkZtx5fF5/A5o0rALzzt6maSlsBByvOlsooxnYCo
         ccVw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KdQvUDOo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e43ba398f1si17476726d6.155.2025.02.06.12.00.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2025 12:00:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KdQvUDOo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tg80t-0008LT-Gw; Thu, 06 Feb 2025 14:58:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tg80P-0007Ih-Ab
 for qemu-devel@nongnu.org; Thu, 06 Feb 2025 14:57:45 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tg80K-0000aQ-SJ
 for qemu-devel@nongnu.org; Thu, 06 Feb 2025 14:57:44 -0500
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-21f50895565so205035ad.2
 for <qemu-devel@nongnu.org>; Thu, 06 Feb 2025 11:57:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738871859; x=1739476659; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ogwZ1cQjO9+u/pCRTY5leFDQ2fKRdmFX0siW/iyyt04=;
 b=KdQvUDOowrILlKzFXc1VhU9lpu4txbPRbT8ANQsBq2nxJuWImDOiQjR89PK010CW6E
 t5rhW7tPBK4BAnc+lvDZMqGex9WwgHTmll6kQzqXke/wujSm30yW/5Qe/5vADJZ2HW2q
 0JYILEhx85dUOmvTEnFS2fhtQLRFQzeEujBeiEtVrDPC866QFfZXK42MViZSygviqKM9
 HGn5UukzplmTZBaB7ZlCZNjAET5K7gHLuz2TR/fAFRGaLKJurKfvbq0JZpycD9YygsWU
 z9vy8zuVf/bPjlIHW+kw+ABOUv878mlv6BTQlNYo/ZXqH17Lv4KMZO3jYZzI51JUbEiS
 7Rvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738871859; x=1739476659;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ogwZ1cQjO9+u/pCRTY5leFDQ2fKRdmFX0siW/iyyt04=;
 b=MIwBLsRaLOGgcBjB5rMj4YASbujXraTaAtqbJ+MaSmvu9MA03UzfVwglo14fIR2VzP
 ie7vTx45AO5Qp1rkqAZVfdDCWJlN3NRVZGHZGJy+80EhYFYm1M26POxM7LZDO6sTNF/h
 IQAL7alrlfLLenqHmBcQyGNOAaKWDrIHA5VfLyz1F4SClJtiy+vEyVKQzqvs7lJLpcjg
 sP56VH1JlpA2M+MAPS1OwMIFUoJ1qM+vzjBrtwkSRA335HjdQa4SkgThQWXMg/zZDIdW
 mnwZ6c5fgk3+6zJ3btC+yn5y3/gByt+dpAjQV3jWCVQqIU9dKjjbW79Ajc7b8ELHpFrb
 RVtw==
X-Gm-Message-State: AOJu0Yx7EviPf5HeQ9tkAI4Xa4W+m9KCwbUXko50cbs5e+t1/JgInjZa
 cAf8faMMz/OaBCkrgTKHMYp2viG5vPrjEZVipkHo0P3+eE2dKGsekaKKZ7ih+BlmDyKBbsTkxBx
 s
X-Gm-Gg: ASbGncuAOr+8QLBV/JoQy2pqU9BX9o4sMDk/atlkChGs4l47DlULywQx3wVHEzPocCN
 ZcI/ceq8NmsRqXFvHlLDU7uUgimrMbI+24RsnUE+14kSyrA9EhqZsNHMNpATegQYoZui/kdxDzp
 BFUOABz0H6NM2yxB6fhfcbSqQ3+wnL8Q0Q4ONQteavln3MMVTq4w504LASUl/o5G5j729H8+HBK
 MGq0A6/0Hjh/PwfjfycZr5qJrUbKm9IJ0M7k7allv6iX8ZtXVHFiafP9FVx0niwAv+xyQ/V4M2L
 +z8ewLHucZ2go4nsUr0Rz0EkGd5g6BPVoa4jfgET21sYNs4=
X-Received: by 2002:a05:6a00:230c:b0:725:e4b9:a600 with SMTP id
 d2e1a72fcca58-7305d4f0412mr919708b3a.16.1738871859186; 
 Thu, 06 Feb 2025 11:57:39 -0800 (PST)
Received: from stoup.. (71-212-39-66.tukw.qwest.net. [71.212.39.66])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73048c16370sm1666993b3a.152.2025.02.06.11.57.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2025 11:57:38 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 30/61] target/arm: Pass ZA to helper_sve2_fmlal_zz[zx]w_s
Date: Thu,  6 Feb 2025 11:56:44 -0800
Message-ID: <20250206195715.2150758-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250206195715.2150758-1-richard.henderson@linaro.org>
References: <20250206195715.2150758-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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
X-TUID: 07Q3bf1ieFgQ

Indicate whether to use FPST_FPCR or FPST_ZA via bit 2 of
simd_data(desc).  For SVE, this bit remains zero.
For do_FMLAL_zzzw, this requires no change.
For do_FMLAL_zzxw, move the index up one bit.

Read fz16 directly from env->fpcr.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-sve.c | 2 +-
 target/arm/tcg/vec_helper.c    | 8 +++++---
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 0907a4e9e9..e56ef6ad68 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -7168,7 +7168,7 @@ static bool do_FMLAL_zzxw(DisasContext *s, arg_rrxr_esz *a, bool sub, bool sel)
 {
     return gen_gvec_ptr_zzzz(s, gen_helper_sve2_fmlal_zzxw_s,
                              a->rd, a->rn, a->rm, a->ra,
-                             (a->index << 2) | (sel << 1) | sub, tcg_env);
+                             (a->index << 3) | (sel << 1) | sub, tcg_env);
 }
 
 TRANS_FEAT(FMLALB_zzxw, aa64_sve2, do_FMLAL_zzxw, a, false, false)
diff --git a/target/arm/tcg/vec_helper.c b/target/arm/tcg/vec_helper.c
index 671777ce52..16ddd35239 100644
--- a/target/arm/tcg/vec_helper.c
+++ b/target/arm/tcg/vec_helper.c
@@ -2191,7 +2191,8 @@ void HELPER(sve2_fmlal_zzzw_s)(void *vd, void *vn, void *vm, void *va,
     intptr_t i, oprsz = simd_oprsz(desc);
     bool is_s = extract32(desc, SIMD_DATA_SHIFT, 1);
     intptr_t sel = extract32(desc, SIMD_DATA_SHIFT + 1, 1) * sizeof(float16);
-    float_status *status = &env->vfp.fp_status[FPST_A64];
+    bool za = extract32(desc, SIMD_DATA_SHIFT + 2, 1);
+    float_status *status = &env->vfp.fp_status[za ? FPST_ZA : FPST_A64];
     bool fz16 = env->vfp.fpcr & FPCR_FZ16;
     int negx = 0, negf = 0;
 
@@ -2274,8 +2275,9 @@ void HELPER(sve2_fmlal_zzxw_s)(void *vd, void *vn, void *vm, void *va,
     intptr_t i, j, oprsz = simd_oprsz(desc);
     bool is_s = extract32(desc, SIMD_DATA_SHIFT, 1);
     intptr_t sel = extract32(desc, SIMD_DATA_SHIFT + 1, 1) * sizeof(float16);
-    intptr_t idx = extract32(desc, SIMD_DATA_SHIFT + 2, 3) * sizeof(float16);
-    float_status *status = &env->vfp.fp_status[FPST_A64];
+    bool za = extract32(desc, SIMD_DATA_SHIFT + 2, 1);
+    intptr_t idx = extract32(desc, SIMD_DATA_SHIFT + 3, 3) * sizeof(float16);
+    float_status *status = &env->vfp.fp_status[za ? FPST_ZA : FPST_A64];
     bool fz16 = env->vfp.fpcr & FPCR_FZ16;
     int negx = 0, negf = 0;
 
-- 
2.43.0


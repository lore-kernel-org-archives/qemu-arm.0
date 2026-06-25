Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10212CDE00E
	for <qemu-arm@archiver.kernel.org>; Thu, 25 Jun 2026 22:37:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wcsfm-0005Bs-Is; Thu, 25 Jun 2026 18:35:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wcsf5-0004ay-B1
 for qemu-arm@nongnu.org; Thu, 25 Jun 2026 18:35:14 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wcsew-0002KD-CS
 for qemu-arm@nongnu.org; Thu, 25 Jun 2026 18:35:06 -0400
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-845385adf4cso113885b3a.0
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2026 15:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782426726; x=1783031526; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5VrRnJosjYdk7ReXbYXe4e+aE+6WVwgVQYm3ptI+BiQ=;
 b=KvycuxCM/ADurw+mCt+yOkkbruFQsCsczisjRnVIvXNwDqtRefSOt1cqPI9LfKCStW
 JQkmJw0eRRENJckSzqDfngcZfJ9djDVixlW+FvFJj2MOeqJHKt2oJ8q9yEkZIDYPaslu
 U76xyCAp5R5vQI0eveJMNja1RQmY7kYtVr9zJuTGd95EM2xAFtRs+KF5ILVFdeRRmSem
 egRy3tRIOM672zb7zCbyOfCs/VKL2wFeULWCXI2BWmW4XeNmm5Am3t7fdJVn9rNRj8qu
 zay0ncf/R+cz2ljBs6TAAXQZ3tJjkeO9JMMmKgveU2jEk1GIDqFVlPt9r2SxLITYiaw6
 nmyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782426726; x=1783031526;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5VrRnJosjYdk7ReXbYXe4e+aE+6WVwgVQYm3ptI+BiQ=;
 b=UvpYxW6vhqqwmKzjed6F6Lhv6cEPhYRMxmYiZDJABJvS13kP9QyWokAZixbTPaWbzW
 y1dFyveONp4u67ANlFtyd320iD7pSYR25bpeajw8kCfV8cnx6rWv/UhUsjWujXigzQMQ
 RpbMpTsJ8O18C/qeujHX6vh8iEigCABP/grAZOGHzrVZQKNaAdCTP9FSfn4maga4oJEM
 odQ0AtR29raKI/oQ/RNpdU48unGcAHbZ6LQyFbT7UHgdCup+ymnf2BMZG7ooB6cYQwlB
 Ll5gLBGhlEmTrMAM43O9wQkbTpu/6QfXegW1k7RAnDInHF/Krte33P/0RJQEKcyp+Z+i
 U97w==
X-Gm-Message-State: AOJu0YzY79sl2AIQ1YDseWmmlMw9QBy/ACfx+PqI8Icl2RLE/gC9siNR
 Cche+mbGGcY1bCusrwzEkhD20m8uk6ghZX48DqZTP/Mx4MgBIsbc783sgwY1bRSPI76m5zvNME8
 bMU0Q
X-Gm-Gg: AfdE7cmsCXpff7I35MeQ5EP1/DDMnOQtsqaF5TpbK1D2kk0NbbYEC5l5obeUn68vQdU
 IY9WXbhVrWMaG3R/3Be0OQoti5r4RHRdGdvP74Pzdr4gxYfUqFhLoDHLxYjPzehcWLBIQJRH4Z9
 hQgKYU2Dr3178zrLaDvFrnG3NY1DS67CioO6V4HacC1fbAQg2/1pzyFKkykvQ3rzAhl5NrNKwV2
 ibV2GxdGhbEllHggCQmYvwHsyn6oiv1qIAwnUz/QdEDwo48yZ68e4jGVAtxPeZmf5mt50EVoH5e
 w/lxQ1gJVcxwpa+yc+MWDSh9MU+OzDUmrPVDbs6fdkNhr1c/C4zXsOnAgV5tklHyNWYbjPGdH/I
 PfzZ49XwUCtOyI2y/AL1I8jpnMLZHpSdiPfp6h98J5/bvelXhUIKbXR4w1PUtNT7CKsjMYu1HlQ
 oDBco8HBu/lXrDy02OES16GRDDhHwcLCkQBaEOfeCM2oj0o0ONUsRlh56izSK+
X-Received: by 2002:a05:6a00:1d21:b0:845:259f:8925 with SMTP id
 d2e1a72fcca58-845b39c4b5dmr5201890b3a.6.1782426725921; 
 Thu, 25 Jun 2026 15:32:05 -0700 (PDT)
Received: from stoup.. (174-21-129-215.tukw.qwest.net. [174.21.129.215])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-845a412e5e9sm5450139b3a.54.2026.06.25.15.32.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jun 2026 15:32:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 06/15] target/arm: Implement FMOP4 (widening,
 2-way fp16 to fp32)
Date: Thu, 25 Jun 2026 15:31:51 -0700
Message-ID: <20260625223200.763198-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260625223200.763198-1-richard.henderson@linaro.org>
References: <20260625223200.763198-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/helper-sme-defs.h |  4 +++
 target/arm/tcg/sme_helper.c      | 51 ++++++++++++++++++++++++++++++++
 target/arm/tcg/translate-sme.c   |  7 +++++
 target/arm/tcg/sme.decode        |  1 +
 4 files changed, 63 insertions(+)

diff --git a/target/arm/tcg/helper-sme-defs.h b/target/arm/tcg/helper-sme-defs.h
index 0e4bb12b38..780b8f162a 100644
--- a/target/arm/tcg/helper-sme-defs.h
+++ b/target/arm/tcg/helper-sme-defs.h
@@ -375,3 +375,7 @@ DEF_HELPER_FLAGS_5(sme_ah_bfmop4s_hh, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst
 DEF_HELPER_FLAGS_5(sme_bfmop4a_sh, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_FLAGS_5(sme_bfmop4s_sh, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_FLAGS_5(sme_ah_bfmop4s_sh, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, env, i32)
+
+DEF_HELPER_FLAGS_5(sme_fmop4a_sh, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_FLAGS_5(sme_fmop4s_sh, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_FLAGS_5(sme_ah_fmop4s_sh, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, env, i32)
diff --git a/target/arm/tcg/sme_helper.c b/target/arm/tcg/sme_helper.c
index 5a661ca616..123f459342 100644
--- a/target/arm/tcg/sme_helper.c
+++ b/target/arm/tcg/sme_helper.c
@@ -2887,3 +2887,54 @@ void HELPER(sme_ah_bfmop4s_sh)(void *vza, void *vzn, void *vzm,
              is_ebf(env, &fpst) ? inner_ebf_ah_bfmop4s_sh
                                 : inner_ah_bfmop4s_sh);
 }
+
+static void inner_fmop4a_sh(void *vd, void *vn, void *vm, void *vinfo)
+{
+    float32 *d = vd;
+    uint32_t *n = vn, *m = vm;
+    CPUArchState *env = vinfo;
+
+    *d = f16_dotadd(*d, *n, *m,
+                    &env->vfp.fp_status[FPST_ZA_F16],
+                    &env->vfp.fp_status[FPST_ZA]);
+}
+
+void HELPER(sme_fmop4a_sh)(void *vza, void *vzn, void *vzm,
+                           CPUArchState *env, uint32_t desc)
+{
+    sme_mop4(vza, vzn, vzm, env, desc, sizeof(float32), inner_fmop4a_sh);
+}
+
+static void inner_fmop4s_sh(void *vd, void *vn, void *vm, void *vinfo)
+{
+    float32 *d = vd;
+    uint32_t *n = vn, *m = vm;
+    CPUArchState *env = vinfo;
+
+    *d = f16_dotadd(*d, *n ^ 0x80008000u, *m,
+                    &env->vfp.fp_status[FPST_ZA_F16],
+                    &env->vfp.fp_status[FPST_ZA]);
+}
+
+void HELPER(sme_fmop4s_sh)(void *vza, void *vzn, void *vzm,
+                           CPUArchState *env, uint32_t desc)
+{
+    sme_mop4(vza, vzn, vzm, env, desc, sizeof(float32), inner_fmop4s_sh);
+}
+
+static void inner_ah_fmop4s_sh(void *vd, void *vn, void *vm, void *vinfo)
+{
+    float32 *d = vd;
+    uint32_t *n = vn, *m = vm;
+    CPUArchState *env = vinfo;
+
+    *d = f16_dotadd(*d, f16mop_ah_neg_adj_pair(*n, -1), *m,
+                    &env->vfp.fp_status[FPST_ZA_F16],
+                    &env->vfp.fp_status[FPST_ZA]);
+}
+
+void HELPER(sme_ah_fmop4s_sh)(void *vza, void *vzn, void *vzm,
+                              CPUArchState *env, uint32_t desc)
+{
+    sme_mop4(vza, vzn, vzm, env, desc, sizeof(float32), inner_ah_fmop4s_sh);
+}
diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index df4a5c2125..544a825595 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -2065,3 +2065,10 @@ static gen_helper_gvec_3_ptr * const bfmop4_sh[3] = {
     gen_helper_sme_ah_bfmop4s_sh
 };
 TRANS_FEAT(BFMOP4_sh, aa64_sme_mop4, do_mop4_fp, a, MO_32, FPST_ENV, bfmop4_sh)
+
+static gen_helper_gvec_3_ptr * const fmop4_sh[3] = {
+    gen_helper_sme_fmop4a_sh,
+    gen_helper_sme_fmop4s_sh,
+    gen_helper_sme_ah_fmop4s_sh
+};
+TRANS_FEAT(FMOP4_sh, aa64_sme_mop4, do_mop4_fp, a, MO_32, FPST_ENV, fmop4_sh)
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index 12a3a61432..ea9f459e38 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -1107,3 +1107,4 @@ FMOP4_ss        1000 0000 000. ...0 0000 00.. ..0. 00..         @mop4_o2
 FMOP4_dd        1000 0000 110. ...0 0000 00.. ..0. 1...         @mop4_o3
 
 BFMOP4_sh       1000 0001 000. ...0 0000 00.. ..0. 00..         @mop4_o2
+FMOP4_sh        1000 0001 001. ...0 0000 00.. ..0. 00..         @mop4_o2
-- 
2.43.0



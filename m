Received: by 2002:a05:622a:6187:b0:4a7:49b6:ba6e with SMTP id hh7csp3708066qtb;
        Wed, 2 Jul 2025 05:41:36 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUvkMZNypgD+g9BcvuZWW6AQllifwJORHzgPcRZ44s8cf+yTR4qAcs193pGjkOK8nfsal5Okkv/au50vA==@linaro.org
X-Google-Smtp-Source: AGHT+IF51U67a3oijXg8p/LTlMhyR3ZHrN4RsGZwBiV4XbDt7kwZRdCdbPYNAuM0Tgl05+dQPFCS
X-Received: by 2002:a05:622a:53c3:b0:4a7:7b5c:90a5 with SMTP id d75a77b69052e-4a9768b7c07mr41471041cf.7.1751460095890;
        Wed, 02 Jul 2025 05:41:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751460095; cv=none;
        d=google.com; s=arc-20240605;
        b=a4TWTUZYBTZ9K5+3WcKi366plU9P1q2Evq522dJ4jn0Lb9OYaEceGeA3YCcfPX0tNz
         UCyyddNUIc3Ut/aBoQcKI6D/Lh7Ml0bLLs2VaLAW472xyav0r6E+bXexx6hKjpU6aGlo
         X6eN4eQz6Tz/K9xY6ob9+JLJ2wlqbIiR1cUVxnak+poy9XAroYpLPscVjL5BywLNxAIR
         k9KtNBN8G63x/0t1whYm+eScxpPUyGBVHylKSr5B7KTVl+a+sruunkaJbluZJZQQvzbF
         iwTBVO/yoSzfE96T1MCJha5JJ6lAcB/52Bl+oix9SJ1hWtZV4PKG7eogpPorIhUSJJb6
         dvdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=EbbY0UNuv2OZtIhgDd0q5AMsStJCHOR+ODfwOIpwKCc=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=f/42UzsMVoOdGZ8EgR0gl84AiTVJs+qQuC5y1KysUCK8Zy7MATq9nnYXPRScves1NK
         M+cMYLPBeBxMPhU6uyktvQAFVNvB0dx+LLQxlsv7opUW6lOK4vZWwu4e6sChjr5Kx5Pj
         An9Zv7NDFvNNeqDYOuv5viN3lfq5ZchQFx64nGSsC+HaSX9xyT3sb65Hu7EmkZJNizEP
         FWDiHKxiuMyw6P8EHpzRLJfYLQKD/xA2F88BhnAcWJ9hgIJBjFs/4mDxVkBFK1B/8ci+
         iZRZU5DsSjW7lvdEK3v11UzJnkNt1sEZ8rKVVwwUQO4bu/f1Co76So2cY0CUUUBpSXkQ
         kKVQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ssnivuL/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a7fc1e9272si127458931cf.284.2025.07.02.05.41.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Jul 2025 05:41:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ssnivuL/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uWwgw-0000qr-Ry; Wed, 02 Jul 2025 08:35:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWwgB-000828-3x
 for qemu-devel@nongnu.org; Wed, 02 Jul 2025 08:35:11 -0400
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWwfr-000163-Dq
 for qemu-devel@nongnu.org; Wed, 02 Jul 2025 08:35:10 -0400
Received: by mail-ot1-x32a.google.com with SMTP id
 46e09a7af769-73afbe1494fso2505984a34.0
 for <qemu-devel@nongnu.org>; Wed, 02 Jul 2025 05:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751459689; x=1752064489; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EbbY0UNuv2OZtIhgDd0q5AMsStJCHOR+ODfwOIpwKCc=;
 b=ssnivuL/Y2x3DGg3y3vRKu6x8IgGu/h7cPK7YkC4HVXvr2fHxGMrQLyg4rrLK7W4Ji
 ImFLsDTeOaD0lt9RbUlS/K1hrtl4OEYNFFs0Yo3RkdSh3XIXDwy5jJqLH6diThkqmA4X
 bGnch7VEQx3ufBi7GVe7Ot+eGAln/VsKYZS9gSt4+PRitytNqENMwd2NATauelgWvEZn
 uyELsUfE0o1qnSnrt+XIpETcvw+oxjbmvVM94BjJSy7BD9khqpyBj3Ulo2F5C9EeOaCF
 c9tRLabJ+TFJ9BQdwCDhBVVxVxC2B4hvz6gQS9AnRLEnPTiDNy2T6YPORn34xDFoGZdY
 zUCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751459689; x=1752064489;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EbbY0UNuv2OZtIhgDd0q5AMsStJCHOR+ODfwOIpwKCc=;
 b=RRTevAbpPou7GQCLJf0FtBlLepLtJbL07RSZ2dl2d+EuqUpjjJpWdA8kl3W72DyiuH
 gAJzA1IYuIZ8iltjTryI8qNgxduGzstbTO162cWmNN/jfHmTGOxqmIaTQrglo1gkQWBf
 pwFz+aDYbGzUnc0489bxWk4iwJdj/eIcA/lg1GtOeJNU2AmaslRqEVSZccnMjdhusjZ3
 JUicEP3g3WZRYG1sJTuHTkhpP/P1Ul2Kw2Nrzf2f2h3YYJ+9HJ70+cLPn61nqaGhXe0t
 blASijkQWUzTeHeKaJXYCtsnYvTnlbOIYy4qgrMni7TDZvuYUoo4VjQ4Gpj0YLqj9OLT
 DEHg==
X-Gm-Message-State: AOJu0YzCyavo8VROD3wgHV+aCwA0fsohaXAsiux25XBKplAQvnsf/4ba
 LX1pbO7j5ttkpdBcny6RcTmwtdi/T7/uP2eJ7ZMfJptTd0aWJQSmdYRcf8CMrunRF06wstQuc4G
 aFAcQtYs=
X-Gm-Gg: ASbGncvP+4rX6UssER9J5qJIMDWekg/Y4P2+Iv8yxKX7IkfCOxOSyTN3QodZw208zy9
 vG2HIfy/1+FcKZrbO+G31f6N6FdPUjYM2aHtnxXucSi+pDWjqg6D7dCoTS2KnwSkyAs62MkE+8Z
 WLKLUcCnYRVEV8nEnxLwZ5pofXC+NW1GTQ3cCF8OVHESubzw3bt4jYQJU96kv9s1OQwLkLiWXxU
 rm0C9W4VQJ3D4CNniKX52f8XwifSbcXEnU6zwhNw3rnmSngVFUNO3a59tElI+IK/IfW1ymf2Z3a
 TPZMuOUgYOOETS7v79vt9yeRjGweLOTrgRaLEcEdje+cpYJjFTBLmaRe+2iXG7iqRf0W0cX9PrK
 xm+nO
X-Received: by 2002:a05:6830:3495:b0:72b:9993:11a5 with SMTP id
 46e09a7af769-73b4ce34aa0mr2256218a34.9.1751459688656; 
 Wed, 02 Jul 2025 05:34:48 -0700 (PDT)
Received: from stoup.. ([187.210.107.185]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2efd50b1b2fsm3864281fac.32.2025.07.02.05.34.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 05:34:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v3 29/97] target/arm: Implement SME2 FVDOT, BFVDOT
Date: Wed,  2 Jul 2025 06:33:02 -0600
Message-ID: <20250702123410.761208-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702123410.761208-1-richard.henderson@linaro.org>
References: <20250702123410.761208-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32a;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: mnc/16es9TiW

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/helper-sme.h    |  2 ++
 target/arm/tcg/helper.h        |  2 ++
 target/arm/tcg/sme_helper.c    | 30 ++++++++++++++++++++++++++
 target/arm/tcg/translate-sme.c | 24 +++++++++++++++++++++
 target/arm/tcg/vec_helper.c    | 39 ++++++++++++++++++++++++++++++++++
 target/arm/tcg/sme.decode      |  3 +++
 6 files changed, 100 insertions(+)

diff --git a/target/arm/tcg/helper-sme.h b/target/arm/tcg/helper-sme.h
index ec93ff57ff..8f5a1b3c90 100644
--- a/target/arm/tcg/helper-sme.h
+++ b/target/arm/tcg/helper-sme.h
@@ -178,3 +178,5 @@ DEF_HELPER_FLAGS_6(sme2_fdot_h, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_FLAGS_6(sme2_fdot_idx_h, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_FLAGS_6(sme2_fvdot_idx_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, env, i32)
diff --git a/target/arm/tcg/helper.h b/target/arm/tcg/helper.h
index a05b63380c..d8d389af2b 100644
--- a/target/arm/tcg/helper.h
+++ b/target/arm/tcg/helper.h
@@ -1089,6 +1089,8 @@ DEF_HELPER_FLAGS_6(gvec_bfdot, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_FLAGS_6(gvec_bfdot_idx, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_FLAGS_6(sme2_bfvdot_idx, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, env, i32)
 
 DEF_HELPER_FLAGS_6(gvec_bfmmla, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, env, i32)
diff --git a/target/arm/tcg/sme_helper.c b/target/arm/tcg/sme_helper.c
index 60322be3d0..8b45865461 100644
--- a/target/arm/tcg/sme_helper.c
+++ b/target/arm/tcg/sme_helper.c
@@ -1196,6 +1196,36 @@ void HELPER(sme2_fdot_idx_h)(void *vd, void *vn, void *vm, void *va,
     }
 }
 
+void HELPER(sme2_fvdot_idx_h)(void *vd, void *vn, void *vm, void *va,
+                              CPUARMState *env, uint32_t desc)
+{
+    intptr_t i, j, oprsz = simd_maxsz(desc);
+    intptr_t elements = oprsz / sizeof(float32);
+    intptr_t eltspersegment = MIN(4, elements);
+    int idx = extract32(desc, SIMD_DATA_SHIFT, 2);
+    int sel = extract32(desc, SIMD_DATA_SHIFT + 2, 1);
+    float_status fpst_odd, *fpst_std, *fpst_f16;
+    float32 *d = vd, *a = va;
+    uint16_t *n0 = vn;
+    uint16_t *n1 = vn + sizeof(ARMVectorReg);
+    uint32_t *m = (uint32_t *)vm + H4(idx);
+
+    fpst_std = &env->vfp.fp_status[FPST_ZA];
+    fpst_f16 = &env->vfp.fp_status[FPST_ZA_F16];
+    fpst_odd = *fpst_std;
+    set_float_rounding_mode(float_round_to_odd, &fpst_odd);
+
+    for (i = 0; i < elements; i += eltspersegment) {
+        uint32_t mm = m[i];
+        for (j = 0; j < eltspersegment; ++j) {
+            uint32_t nn = (n0[H2(2 * (i + j) + sel)])
+                        | (n1[H2(2 * (i + j) + sel)] << 16);
+            d[i + H4(j)] = f16_dotadd(a[i + H4(j)], nn, mm,
+                                      fpst_f16, fpst_std, &fpst_odd);
+        }
+    }
+}
+
 void HELPER(sme_bfmopa)(void *vza, void *vzn, void *vzm,
                         void *vpn, void *vpm, CPUARMState *env, uint32_t desc)
 {
diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index 965a49465e..410a8d037c 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -938,3 +938,27 @@ static bool do_bfdot_nx(DisasContext *s, arg_azx_n *a)
 }
 
 TRANS_FEAT(BFDOT_nx, aa64_sme2, do_bfdot_nx, a)
+
+static bool do_vdot(DisasContext *s, arg_azx_n *a, gen_helper_gvec_4_ptr *fn)
+{
+    if (sme_smza_enabled_check(s)) {
+        int svl = streaming_vec_reg_size(s);
+        int vstride = svl / 2;
+        TCGv_ptr t_za = get_zarray(s, a->rv, a->off, 2, 1);
+        TCGv_ptr t_zn = vec_full_reg_ptr(s, a->zn);
+        TCGv_ptr t_zm = vec_full_reg_ptr(s, a->zm);
+        TCGv_ptr t = tcg_temp_new_ptr();
+
+        for (int i = 0; i < 2; ++i) {
+            int o_za = i * vstride * sizeof(ARMVectorReg);
+            int desc = simd_desc(svl, svl, a->idx | (i << 2));
+
+            tcg_gen_addi_ptr(t, t_za, o_za);
+            fn(t, t_zn, t_zm, t, tcg_env, tcg_constant_i32(desc));
+        }
+    }
+    return true;
+}
+
+TRANS_FEAT(FVDOT, aa64_sme, do_vdot, a, gen_helper_sme2_fvdot_idx_h)
+TRANS_FEAT(BFVDOT, aa64_sme, do_vdot, a, gen_helper_sme2_bfvdot_idx)
diff --git a/target/arm/tcg/vec_helper.c b/target/arm/tcg/vec_helper.c
index 3ebee97e68..130f040f7b 100644
--- a/target/arm/tcg/vec_helper.c
+++ b/target/arm/tcg/vec_helper.c
@@ -3110,6 +3110,45 @@ void HELPER(gvec_bfdot_idx)(void *vd, void *vn, void *vm,
     clear_tail(d, opr_sz, simd_maxsz(desc));
 }
 
+void HELPER(sme2_bfvdot_idx)(void *vd, void *vn, void *vm,
+                             void *va, CPUARMState *env, uint32_t desc)
+{
+    intptr_t i, j, opr_sz = simd_oprsz(desc);
+    intptr_t idx = extract32(desc, SIMD_DATA_SHIFT, 2);
+    intptr_t sel = extract32(desc, SIMD_DATA_SHIFT + 2, 1);
+    intptr_t elements = opr_sz / 4;
+    intptr_t eltspersegment = MIN(16 / 4, elements);
+    float32 *d = vd, *a = va;
+    uint16_t *n0 = vn;
+    uint16_t *n1 = vn + sizeof(ARMVectorReg);
+    uint32_t *m = vm;
+    float_status fpst, fpst_odd;
+
+    if (is_ebf(env, &fpst, &fpst_odd)) {
+        for (i = 0; i < elements; i += eltspersegment) {
+            uint32_t m_idx = m[i + H4(idx)];
+
+            for (j = 0; j < eltspersegment; j++) {
+                uint32_t nn = (n0[H2(2 * (i + j) + sel)])
+                            | (n1[H2(2 * (i + j) + sel)] << 16);
+                d[i + H4(j)] = bfdotadd_ebf(a[i + H4(j)], nn, m_idx,
+                                            &fpst, &fpst_odd);
+            }
+        }
+    } else {
+        for (i = 0; i < elements; i += eltspersegment) {
+            uint32_t m_idx = m[i + H4(idx)];
+
+            for (j = 0; j < eltspersegment; j++) {
+                uint32_t nn = (n0[H2(2 * (i + j) + sel)])
+                            | (n1[H2(2 * (i + j) + sel)] << 16);
+                d[i + H4(j)] = bfdotadd(a[i + H4(j)], nn, m_idx, &fpst);
+            }
+        }
+    }
+    clear_tail(d, opr_sz, simd_maxsz(desc));
+}
+
 void HELPER(gvec_bfmmla)(void *vd, void *vn, void *vm, void *va,
                          CPUARMState *env, uint32_t desc)
 {
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index 18e625605f..7c057bcad2 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -374,3 +374,6 @@ FDOT_nx         11000001 0101 .... 1 .. 1 .. ...00 01 ...   @azx_4x1_i2_o3
 
 BFDOT_nx        11000001 0101 .... 0 .. 1 .. ....0 11 ...   @azx_2x1_i2_o3
 BFDOT_nx        11000001 0101 .... 1 .. 1 .. ...00 11 ...   @azx_4x1_i2_o3
+
+FVDOT           11000001 0101 .... 0 .. 0 .. ....0 01 ...   @azx_2x1_i2_o3
+BFVDOT          11000001 0101 .... 0 .. 0 .. ....0 11 ...   @azx_2x1_i2_o3
-- 
2.43.0


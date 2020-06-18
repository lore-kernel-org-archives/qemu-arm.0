Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1284562lfm;
        Wed, 17 Jun 2020 22:09:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzF4kn/eOIidy57UCSUmN5+dlb51HL7Y0usIyHAKTZ579Fn3rS6dKkamD9wF3d+aMYsqpPh
X-Received: by 2002:a25:400e:: with SMTP id n14mr3374429yba.424.1592456951576;
        Wed, 17 Jun 2020 22:09:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592456951; cv=none;
        d=google.com; s=arc-20160816;
        b=qPDb7I+lsFn4faZ/OfgBTtdabzPJdlCnbt6aoRHxKietiSDF1rrq9V1sUJechOEMwT
         77SkHkSUdowlng/B6ET+3GxLOJ4ot2g/dI7qMfj58QoKbkZRLN7aCuAoOIupH1V9fn4z
         Q/KpBOaLM9QpbXNI/tvS/iVu1i8jr/AiBW7dPNhbbFw/O27uas1n7PCld7rL1OzS567V
         sDGDHyV93V8iK+xv+76MeyaQxPgrxzadLvR2mD+na/w54ngIGrNLt9iQRWz75EwhTU9n
         esOlo/SH+SrVdLh5Yx+vU2All8H6I9WI9Gykt08Ozo0LYBwyoAeqyHo0nNLr/mJtIGMl
         uwbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=QYWLjCAC1bjiMEtNtx+p9mrduvwzbVheqlkAGXRrIF8=;
        b=jTM0Mu94JJNde2OzbnMsj5odWvTCjITYgewENTn399vdqxmIq910WkPGvNbZNKzUHf
         INxMGQMHhRGywFgu32UUqds8wwFO3ReEHAgq6ylsU2OgxMf7dzIvX2qY+1BSkqTjeR8w
         34/QVPksuAKNbbC4xLx74c17IKZ58ReM8huWtsvvTaWMXZFj7h3bRjPMgAes+7+pmhJS
         WStNAuyXQmM13eD73eEQTGkGiNb7B/0iF65f5vdjP0uXboFPNXFP+nQ1hUK8/zW+tRg0
         dL/DGrs3yazpfh8LWNAXQJ0Gc3vqF9pM+ftwq5crFrJVfhXFKqrQ0uoJZHCtFDxfmnyR
         AKgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=E8MqqfYx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t2si1542688ybl.343.2020.06.17.22.09.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jun 2020 22:09:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=E8MqqfYx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlmnW-0008Ci-UA
	for alex.bennee@linaro.org; Thu, 18 Jun 2020 01:09:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlmEE-0005ws-2A
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:32:42 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:45994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlmEC-0003ZH-52
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:32:41 -0400
Received: by mail-pl1-x642.google.com with SMTP id d8so1900609plo.12
 for <qemu-arm@nongnu.org>; Wed, 17 Jun 2020 21:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QYWLjCAC1bjiMEtNtx+p9mrduvwzbVheqlkAGXRrIF8=;
 b=E8MqqfYxYiseAKFXUz0qb5r/ciM/KuqNowv0tnKGm8ORIURCNmRJmQrYPJ3H4Ltodf
 ODhEZJuPDmSkW6IHQgRhlgjQ9d3J2AWPNtE2YY5FsQ0YQW6vVgeBJS9DKJWjtJerBcsQ
 cixhTUiS3CoRr/LI15oCyulLV6FyJtcXie/qWsVNjmKhRto2rs5KWyQwrBBXa/O6+Lyc
 xc11BnEf0e/fASRwNLD4ozcKcCIlsAmD8iQTRewykvfgTe4S16LjG0u4X4MzVUR116YU
 SdUCUsRozInATprVl8pTCvsRUgF+pOHnBrdN0a2DSNjweJ/nDvf01ZO/HRrxa9aA+v9S
 X7yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QYWLjCAC1bjiMEtNtx+p9mrduvwzbVheqlkAGXRrIF8=;
 b=RitPXy4SQsW8qb9q3A8Xk5tpNXU/sUb4MfRpIJedVTBh6jVI/5iVrzedKdnX7I68Nd
 feFMZt3DCMmlHAwH73XRNC3ssDhzK2b6EUiEtbfnQPCmG2CSF1uht9lurWHcuM6Axigv
 6fJfLtIX0vLf3Jpx9b1COZLT8MB46KmV9UDwUF9dqH11Ych+5cDKLLUYZ+3peL3nkrKf
 xql6rAxcTuxkAVEfT48UWRgNLnxrtD0rRmNyD5sfBDngKXbLDeZC4cqMPBdDyya7Sm/6
 nuQHwfzeHpWked9jfjtE5l1nrTraR1TTeZ+25XIy32845V19/uBbX3hGHc4O4QVCfPz5
 iL2g==
X-Gm-Message-State: AOAM530gB3bJVUsemaXvvPsDuYEKmG/ryfhq73cQxibpjfmBCqQIxM1x
 K8NC9ABYVDIbl7jbuBa+DkanqA==
X-Received: by 2002:a17:90a:6e2:: with SMTP id
 k89mr2454789pjk.74.1592454758869; 
 Wed, 17 Jun 2020 21:32:38 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id d2sm1165766pgp.56.2020.06.17.21.32.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 21:32:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 080/100] target/arm: Use helper_neon_sq{,
 r}dmul_* for aa64 advsimd
Date: Wed, 17 Jun 2020 21:26:24 -0700
Message-Id: <20200618042644.1685561-81-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618042644.1685561-1-richard.henderson@linaro.org>
References: <20200618042644.1685561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::642;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x642.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, steplong@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iTlaBVjMzZzi

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h        | 10 ++++++++
 target/arm/translate-a64.c | 33 +++++++++++++++++--------
 target/arm/vec_helper.c    | 49 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 82 insertions(+), 10 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index ce6ff95672..e1cac31e95 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -807,6 +807,16 @@ DEF_HELPER_FLAGS_5(gvec_mls_idx_s, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_5(gvec_mls_idx_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_5(neon_sqdmulh_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(neon_sqdmulh_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(neon_sqrdmulh_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(neon_sqrdmulh_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_4(sve2_sqdmulh_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_sqdmulh_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_sqdmulh_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 5ef6ecfbf1..7c98938077 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -605,6 +605,20 @@ static void gen_gvec_op3_fpst(DisasContext *s, bool is_q, int rd, int rn,
     tcg_temp_free_ptr(fpst);
 }
 
+/* Expand a 3-operand + qc + operation using an out-of-line helper.  */
+static void gen_gvec_op3_qc(DisasContext *s, bool is_q, int rd, int rn,
+                            int rm, gen_helper_gvec_3_ptr *fn)
+{
+    TCGv_ptr qc_ptr = tcg_temp_new_ptr();
+
+    tcg_gen_addi_ptr(qc_ptr, cpu_env, offsetof(CPUARMState, vfp.qc));
+    tcg_gen_gvec_3_ptr(vec_full_reg_offset(s, rd),
+                       vec_full_reg_offset(s, rn),
+                       vec_full_reg_offset(s, rm), qc_ptr,
+                       is_q ? 16 : 8, vec_full_reg_size(s), 0, fn);
+    tcg_temp_free_ptr(qc_ptr);
+}
+
 /* Expand a 4-operand operation using an out-of-line helper.  */
 static void gen_gvec_op4_ool(DisasContext *s, bool is_q, int rd, int rn,
                              int rm, int ra, int data, gen_helper_gvec_4 *fn)
@@ -11270,6 +11284,15 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
             gen_gvec_fn3(s, is_q, rd, rn, rm, gen_gvec_mla, size);
         }
         return;
+    case 0x16: /* SQDMULH, SQRDMULH */
+        {
+            static gen_helper_gvec_3_ptr * const fns[2][2] = {
+                { gen_helper_neon_sqdmulh_h, gen_helper_neon_sqrdmulh_h },
+                { gen_helper_neon_sqdmulh_s, gen_helper_neon_sqrdmulh_s },
+            };
+            gen_gvec_op3_qc(s, is_q, rd, rn, rm, fns[size - 1][u]);
+        }
+        return;
     case 0x11:
         if (!u) { /* CMTST */
             gen_gvec_fn3(s, is_q, rd, rn, rm, gen_gvec_cmtst, size);
@@ -11381,16 +11404,6 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
                 genenvfn = fns[size][u];
                 break;
             }
-            case 0x16: /* SQDMULH, SQRDMULH */
-            {
-                static NeonGenTwoOpEnvFn * const fns[2][2] = {
-                    { gen_helper_neon_qdmulh_s16, gen_helper_neon_qrdmulh_s16 },
-                    { gen_helper_neon_qdmulh_s32, gen_helper_neon_qrdmulh_s32 },
-                };
-                assert(size == 1 || size == 2);
-                genenvfn = fns[size - 1][u];
-                break;
-            }
             default:
                 g_assert_not_reached();
             }
diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index 766555a5d6..d73c1afe30 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -194,6 +194,30 @@ void HELPER(sve2_sqrdmlsh_h)(void *vd, void *vn, void *vm,
     }
 }
 
+void HELPER(neon_sqdmulh_h)(void *vd, void *vn, void *vm,
+                            void *vq, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    int16_t *d = vd, *n = vn, *m = vm;
+
+    for (i = 0; i < opr_sz / 2; ++i) {
+        d[i] = do_sqrdmlah_h(n[i], m[i], 0, false, false, vq);
+    }
+    clear_tail(d, opr_sz, simd_maxsz(desc));
+}
+
+void HELPER(neon_sqrdmulh_h)(void *vd, void *vn, void *vm,
+                             void *vq, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    int16_t *d = vd, *n = vn, *m = vm;
+
+    for (i = 0; i < opr_sz / 2; ++i) {
+        d[i] = do_sqrdmlah_h(n[i], m[i], 0, false, true, vq);
+    }
+    clear_tail(d, opr_sz, simd_maxsz(desc));
+}
+
 void HELPER(sve2_sqdmulh_h)(void *vd, void *vn, void *vm, uint32_t desc)
 {
     intptr_t i, opr_sz = simd_oprsz(desc);
@@ -291,6 +315,7 @@ void HELPER(sve2_sqrdmlah_s)(void *vd, void *vn, void *vm,
     }
 }
 
+
 void HELPER(sve2_sqrdmlsh_s)(void *vd, void *vn, void *vm,
                              void *va, uint32_t desc)
 {
@@ -303,6 +328,30 @@ void HELPER(sve2_sqrdmlsh_s)(void *vd, void *vn, void *vm,
     }
 }
 
+void HELPER(neon_sqdmulh_s)(void *vd, void *vn, void *vm,
+                            void *vq, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    int32_t *d = vd, *n = vn, *m = vm;
+
+    for (i = 0; i < opr_sz / 4; ++i) {
+        d[i] = do_sqrdmlah_s(n[i], m[i], 0, false, false, vq);
+    }
+    clear_tail(d, opr_sz, simd_maxsz(desc));
+}
+
+void HELPER(neon_sqrdmulh_s)(void *vd, void *vn, void *vm,
+                             void *vq, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    int32_t *d = vd, *n = vn, *m = vm;
+
+    for (i = 0; i < opr_sz / 4; ++i) {
+        d[i] = do_sqrdmlah_s(n[i], m[i], 0, false, true, vq);
+    }
+    clear_tail(d, opr_sz, simd_maxsz(desc));
+}
+
 void HELPER(sve2_sqdmulh_s)(void *vd, void *vn, void *vm, uint32_t desc)
 {
     intptr_t i, opr_sz = simd_oprsz(desc);
-- 
2.25.1


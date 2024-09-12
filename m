Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp368542nji;
        Wed, 11 Sep 2024 19:44:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVigM3PkfrcawGYRSTDQa9bYFoXurAWrK1IpZM6qxRWpwKWkMkLT/prIN339NfCU9y3HYYKRDGItQdU2g==@linaro.org
X-Google-Smtp-Source: AGHT+IHt5pvPeNKRm1u/kSMl1OuIjlDbjfX4DE0K70Ld0yPyzT1IXGXgCqmIIib8CuvNoxGk2Khm
X-Received: by 2002:a05:620a:29cd:b0:7a9:be7a:9220 with SMTP id af79cd13be357-7a9e5f7a9d1mr285885385a.60.1726109062752;
        Wed, 11 Sep 2024 19:44:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726109062; cv=none;
        d=google.com; s=arc-20240605;
        b=OEWwkRSEh7kOhEfb2fnJ/3v9I46OUsaz3LcjF2IE8ADBxADRhX/wBPxKWBRa+CoO6b
         tPnrMGeu+W34FpAVy9SqPfO7cdAD8dQQQuksu6jAAZh8/NZ/WPicMM2obgWI1EZfavIJ
         nU9xuBYi2PMv2rcQX5hqLtp+A9fNSy6eegDccWTlhy8U3XEVm5Wq4P2T9NimscTJD1Sp
         FNJ652fE/ujQd/CD+tDDT7nnj60zSTN09Hu1YSAewajmdCeTOuiz/wQVcG98JlGsqe5B
         ahIhDY8nrVN1Dbe2gspnIBpcluauzUzzBmAIM7/uFeW7RvWKtsFoQR2AYtt9Dq6uFzNX
         MoHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Kd7sbT2+qo4Y0Y0LTQ84CGhFrmHEA3wjVrmyStO+VLM=;
        fh=ZhBia3nL9o1nuf7SbgdYn/0pDmAeja6gisyWXi2cqYE=;
        b=MD6NbIG9c3d1S48Ws/HPnR1Ml3aFX1liao7Oc962VqMZCX95EynDBgfAm338CAn+jd
         JaSB1FvFRuu4eMjm1UtSFZZ/CSf3M0jUDLrYSgaNS4sQg+cA0/VR+j8WyiPZ3K/qGmjq
         CdOgHlFO/N3sx40+yhYUEi60X2BDZu1vBlJLtlBVrbdwI1adhWFtysHIzcZpMHFQQcmi
         QFFztyiZVxswbAflbL8835SaQLnYM/yXeSMjB0HJD/L3wCebwWv67OAeLID4vyfmw7j2
         m3EgnyBfpJ/oAVa4CbkO26bpMLOmYaXBrbcADnA27aOjEKCfB2H1pIOrY6onMH/hZw0M
         QoNw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YJF69Znw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a9a79c5246si1166827085a.8.2024.09.11.19.44.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Sep 2024 19:44:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YJF69Znw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1soZml-0006fO-TV; Wed, 11 Sep 2024 22:42:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1soZmE-00042c-0S
 for qemu-arm@nongnu.org; Wed, 11 Sep 2024 22:41:46 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1soZmB-0004H3-KQ
 for qemu-arm@nongnu.org; Wed, 11 Sep 2024 22:41:45 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-2068a7c9286so5759245ad.1
 for <qemu-arm@nongnu.org>; Wed, 11 Sep 2024 19:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726108902; x=1726713702; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Kd7sbT2+qo4Y0Y0LTQ84CGhFrmHEA3wjVrmyStO+VLM=;
 b=YJF69ZnwHPcruAq8SKt8JL6lGH3MR9OQYqP9hKLi+ZloBqwec1F8gtJ8MF06FMwevw
 CghgYeoDCN+NbbwFPHGiRTl6rdLb9CUHBYc7jyw7Z9u9uOJUYY5Psfpzaj6cgiSl1XiR
 lSkIRX+60QweEFtmYyEHgteEu6ZRHjgpMXiPl1pwAicKcf7WfDBm1yW/Pnd/5EbjB/tp
 m9yLu8ryvd8gOuejsI4anm6a44BEAo1MbireqQhR8Zt76+jcaPTFRf+DegqdtRvY2+wk
 UYO8Jx0ldr2K/xOR2mcYfNckW6NwProl9LUyiZ4s8VgMimEqKdIBa/U1JuOdC0s3PB0x
 Eekw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726108902; x=1726713702;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Kd7sbT2+qo4Y0Y0LTQ84CGhFrmHEA3wjVrmyStO+VLM=;
 b=AzQlRcQaZhKp/IDqnef59rgGnE+XhIGECSslegz3RXcsEl7B2uUQsmaYxVe8TGpHSF
 VnxrvutqwJ3/LoHfnV5mRXKsAZTETxX6LkPEwpcX31C8sdhN2Prbx6DLOwgIL0Bi4Mb9
 nYwpt6kwQ7RApbnxiPxG8aBsjHncueyG3VaMQy3W2J1lLwCzRM3Mmu6rxySRzKhY0l7d
 v0hIsptrsdwnckjbKQPFqQdUPfr9IVAFKX+BBbrhECK8LjxjcQs9sicic2O074t0pooe
 eE8pt0cI5puHrdA2XDp1WvIY3/EZi1r0plHcHpARqWlNHPcTcLjGjZEN66SQEhEAHSHP
 5zjQ==
X-Gm-Message-State: AOJu0YwrybzLGbueSbK9b6X0weUIMeul89Tk8iSH/XM79yB/51bBQKQ6
 3VlpeSuc/70EOXRvYqZrknk1mVwXRkVIy9qeGHsdOzCwUBCCb1ON7oZT8xMts6w=
X-Received: by 2002:a17:902:c946:b0:207:3a68:79c with SMTP id
 d9443c01a7336-2076e3b6181mr20442215ad.33.1726108902122; 
 Wed, 11 Sep 2024 19:41:42 -0700 (PDT)
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2076afe9c61sm5635915ad.231.2024.09.11.19.41.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2024 19:41:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 29/29] target/arm: Convert scalar [US]QSHRN, [US]QRSHRN,
 SQSHRUN to decodetree
Date: Wed, 11 Sep 2024 19:41:14 -0700
Message-ID: <20240912024114.1097832-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240912024114.1097832-1-richard.henderson@linaro.org>
References: <20240912024114.1097832-1-richard.henderson@linaro.org>
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
X-TUID: bg0B/JLExCub

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 160 +++++++--------------------------
 target/arm/tcg/a64.decode      |  30 +++++++
 2 files changed, 63 insertions(+), 127 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index e6290e1145..071b6349fc 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -7456,6 +7456,35 @@ TRANS(SQSHL_si, do_scalar_shift_imm, a, f_scalar_sqshli[a->esz], false, 0)
 TRANS(UQSHL_si, do_scalar_shift_imm, a, f_scalar_uqshli[a->esz], false, 0)
 TRANS(SQSHLU_si, do_scalar_shift_imm, a, f_scalar_sqshlui[a->esz], false, 0)
 
+static bool do_scalar_shift_imm_narrow(DisasContext *s, arg_rri_e *a,
+                                       WideShiftImmFn * const fns[3],
+                                       MemOp sign, bool zext)
+{
+    MemOp esz = a->esz;
+
+    tcg_debug_assert(esz >= MO_8 && esz <= MO_32);
+
+    if (fp_access_check(s)) {
+        TCGv_i64 rd = tcg_temp_new_i64();
+        TCGv_i64 rn = tcg_temp_new_i64();
+
+        read_vec_element(s, rn, a->rn, 0, (esz + 1) | sign);
+        fns[esz](rd, rn, a->imm);
+        if (zext) {
+            tcg_gen_ext_i64(rd, rd, esz);
+        }
+        write_fp_dreg(s, a->rd, rd);
+    }
+    return true;
+}
+
+TRANS(SQSHRN_si, do_scalar_shift_imm_narrow, a, sqshrn_fns, MO_SIGN, true)
+TRANS(SQRSHRN_si, do_scalar_shift_imm_narrow, a, sqrshrn_fns, MO_SIGN, true)
+TRANS(UQSHRN_si, do_scalar_shift_imm_narrow, a, uqshrn_fns, 0, false)
+TRANS(UQRSHRN_si, do_scalar_shift_imm_narrow, a, uqrshrn_fns, 0, false)
+TRANS(SQSHRUN_si, do_scalar_shift_imm_narrow, a, sqshrun_fns, MO_SIGN, false)
+TRANS(SQRSHRUN_si, do_scalar_shift_imm_narrow, a, sqrshrun_fns, MO_SIGN, false)
+
 /* Shift a TCGv src by TCGv shift_amount, put result in dst.
  * Note that it is the caller's responsibility to ensure that the
  * shift amount is in range (ie 0..31 or 0..63) and provide the ARM
@@ -9635,119 +9664,6 @@ static void disas_data_proc_fp(DisasContext *s, uint32_t insn)
     }
 }
 
-/*
- * Common SSHR[RA]/USHR[RA] - Shift right (optional rounding/accumulate)
- *
- * This code is handles the common shifting code and is used by both
- * the vector and scalar code.
- */
-static void handle_shri_with_rndacc(TCGv_i64 tcg_res, TCGv_i64 tcg_src,
-                                    bool round, bool accumulate,
-                                    bool is_u, int size, int shift)
-{
-    if (!round) {
-        if (is_u) {
-            gen_ushr_d(tcg_src, tcg_src, shift);
-        } else {
-            gen_sshr_d(tcg_src, tcg_src, shift);
-        }
-    } else if (size == MO_64) {
-        if (is_u) {
-            gen_urshr_d(tcg_src, tcg_src, shift);
-        } else {
-            gen_srshr_d(tcg_src, tcg_src, shift);
-        }
-    } else {
-        if (is_u) {
-            gen_urshr_bhs(tcg_src, tcg_src, shift);
-        } else {
-            gen_srshr_bhs(tcg_src, tcg_src, shift);
-        }
-    }
-
-    if (accumulate) {
-        tcg_gen_add_i64(tcg_res, tcg_res, tcg_src);
-    } else {
-        tcg_gen_mov_i64(tcg_res, tcg_src);
-    }
-}
-
-/* SQSHRN/SQSHRUN - Saturating (signed/unsigned) shift right with
- * (signed/unsigned) narrowing */
-static void handle_vec_simd_sqshrn(DisasContext *s, bool is_scalar, bool is_q,
-                                   bool is_u_shift, bool is_u_narrow,
-                                   int immh, int immb, int opcode,
-                                   int rn, int rd)
-{
-    int immhb = immh << 3 | immb;
-    int size = 32 - clz32(immh) - 1;
-    int esize = 8 << size;
-    int shift = (2 * esize) - immhb;
-    int elements = is_scalar ? 1 : (64 / esize);
-    bool round = extract32(opcode, 0, 1);
-    MemOp ldop = (size + 1) | (is_u_shift ? 0 : MO_SIGN);
-    TCGv_i64 tcg_rn, tcg_rd, tcg_final;
-
-    static NeonGenOne64OpEnvFn * const signed_narrow_fns[4][2] = {
-        { gen_helper_neon_narrow_sat_s8,
-          gen_helper_neon_unarrow_sat8 },
-        { gen_helper_neon_narrow_sat_s16,
-          gen_helper_neon_unarrow_sat16 },
-        { gen_helper_neon_narrow_sat_s32,
-          gen_helper_neon_unarrow_sat32 },
-        { NULL, NULL },
-    };
-    static NeonGenOne64OpEnvFn * const unsigned_narrow_fns[4] = {
-        gen_helper_neon_narrow_sat_u8,
-        gen_helper_neon_narrow_sat_u16,
-        gen_helper_neon_narrow_sat_u32,
-        NULL
-    };
-    NeonGenOne64OpEnvFn *narrowfn;
-
-    int i;
-
-    assert(size < 4);
-
-    if (extract32(immh, 3, 1)) {
-        unallocated_encoding(s);
-        return;
-    }
-
-    if (!fp_access_check(s)) {
-        return;
-    }
-
-    if (is_u_shift) {
-        narrowfn = unsigned_narrow_fns[size];
-    } else {
-        narrowfn = signed_narrow_fns[size][is_u_narrow ? 1 : 0];
-    }
-
-    tcg_rn = tcg_temp_new_i64();
-    tcg_rd = tcg_temp_new_i64();
-    tcg_final = tcg_temp_new_i64();
-
-    for (i = 0; i < elements; i++) {
-        read_vec_element(s, tcg_rn, rn, i, ldop);
-        handle_shri_with_rndacc(tcg_rd, tcg_rn, round,
-                                false, is_u_shift, size+1, shift);
-        narrowfn(tcg_rd, tcg_env, tcg_rd);
-        if (i == 0) {
-            tcg_gen_extract_i64(tcg_final, tcg_rd, 0, esize);
-        } else {
-            tcg_gen_deposit_i64(tcg_final, tcg_final, tcg_rd, esize * i, esize);
-        }
-    }
-
-    if (!is_q) {
-        write_vec_element(s, tcg_final, rd, 0, MO_64);
-    } else {
-        write_vec_element(s, tcg_final, rd, 1, MO_64);
-    }
-    clear_vec_high(s, is_q, rd);
-}
-
 /* Common vector code for handling integer to FP conversion */
 static void handle_simd_intfp_conv(DisasContext *s, int rd, int rn,
                                    int elements, int is_signed,
@@ -10013,20 +9929,6 @@ static void disas_simd_scalar_shift_imm(DisasContext *s, uint32_t insn)
         handle_simd_shift_intfp_conv(s, true, false, is_u, immh, immb,
                                      opcode, rn, rd);
         break;
-    case 0x10: /* SQSHRUN, SQSHRUN2 */
-    case 0x11: /* SQRSHRUN, SQRSHRUN2 */
-        if (!is_u) {
-            unallocated_encoding(s);
-            return;
-        }
-        handle_vec_simd_sqshrn(s, true, false, false, true,
-                               immh, immb, opcode, rn, rd);
-        break;
-    case 0x12: /* SQSHRN, SQSHRN2, UQSHRN */
-    case 0x13: /* SQRSHRN, SQRSHRN2, UQRSHRN, UQRSHRN2 */
-        handle_vec_simd_sqshrn(s, true, false, is_u, is_u,
-                               immh, immb, opcode, rn, rd);
-        break;
     case 0x1f: /* FCVTZS, FCVTZU */
         handle_simd_shift_fpint_conv(s, true, false, is_u, immh, immb, rn, rd);
         break;
@@ -10039,6 +9941,10 @@ static void disas_simd_scalar_shift_imm(DisasContext *s, uint32_t insn)
     case 0x0a: /* SHL / SLI */
     case 0x0c: /* SQSHLU */
     case 0x0e: /* SQSHL, UQSHL */
+    case 0x10: /* SQSHRUN */
+    case 0x11: /* SQRSHRUN */
+    case 0x12: /* SQSHRN, UQSHRN */
+    case 0x13: /* SQRSHRN, UQRSHRN */
         unallocated_encoding(s);
         break;
     }
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 042dc79d88..331a8e180c 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -1328,6 +1328,12 @@ SQRSHRUN_v      0.10 11110 .... ... 10001 1 ..... .....     @q_shri_s
 
 # Advanced SIMD scalar shift by immediate
 
+@shri_b         .... ..... 0001 ... ..... . rn:5 rd:5   \
+                &rri_e esz=0 imm=%neon_rshift_i3
+@shri_h         .... ..... 001 .... ..... . rn:5 rd:5   \
+                &rri_e esz=1 imm=%neon_rshift_i4
+@shri_s         .... ..... 01 ..... ..... . rn:5 rd:5   \
+                &rri_e esz=2 imm=%neon_rshift_i5
 @shri_d         .... ..... 1 ...... ..... . rn:5 rd:5   \
                 &rri_e esz=3 imm=%neon_rshift_i6
 
@@ -1363,3 +1369,27 @@ SQSHLU_si       0111 11110 .... ... 01100 1 ..... .....     @shli_b
 SQSHLU_si       0111 11110 .... ... 01100 1 ..... .....     @shli_h
 SQSHLU_si       0111 11110 .... ... 01100 1 ..... .....     @shli_s
 SQSHLU_si       0111 11110 .... ... 01100 1 ..... .....     @shli_d
+
+SQSHRN_si       0101 11110 .... ... 10010 1 ..... .....     @shri_b
+SQSHRN_si       0101 11110 .... ... 10010 1 ..... .....     @shri_h
+SQSHRN_si       0101 11110 .... ... 10010 1 ..... .....     @shri_s
+
+UQSHRN_si       0111 11110 .... ... 10010 1 ..... .....     @shri_b
+UQSHRN_si       0111 11110 .... ... 10010 1 ..... .....     @shri_h
+UQSHRN_si       0111 11110 .... ... 10010 1 ..... .....     @shri_s
+
+SQSHRUN_si      0111 11110 .... ... 10000 1 ..... .....     @shri_b
+SQSHRUN_si      0111 11110 .... ... 10000 1 ..... .....     @shri_h
+SQSHRUN_si      0111 11110 .... ... 10000 1 ..... .....     @shri_s
+
+SQRSHRN_si      0101 11110 .... ... 10011 1 ..... .....     @shri_b
+SQRSHRN_si      0101 11110 .... ... 10011 1 ..... .....     @shri_h
+SQRSHRN_si      0101 11110 .... ... 10011 1 ..... .....     @shri_s
+
+UQRSHRN_si      0111 11110 .... ... 10011 1 ..... .....     @shri_b
+UQRSHRN_si      0111 11110 .... ... 10011 1 ..... .....     @shri_h
+UQRSHRN_si      0111 11110 .... ... 10011 1 ..... .....     @shri_s
+
+SQRSHRUN_si     0111 11110 .... ... 10001 1 ..... .....     @shri_b
+SQRSHRUN_si     0111 11110 .... ... 10001 1 ..... .....     @shri_h
+SQRSHRUN_si     0111 11110 .... ... 10001 1 ..... .....     @shri_s
-- 
2.43.0


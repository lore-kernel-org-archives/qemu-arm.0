Received: by 2002:a05:622a:6187:b0:4a7:49b6:ba6e with SMTP id hh7csp3708057qtb;
        Wed, 2 Jul 2025 05:41:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWTbOMiuJvO+1q5P0xWjnF2jJZphTQbgAp8cl7jzIKAJwJ+zv8bOhtM85QODxC+sE9Gg6CGpotcJJfZ8A==@linaro.org
X-Google-Smtp-Source: AGHT+IHMRAU79RSXM9C8Ss6zSvgv1x7nMSnLgJmbhHAO1h/5hq93qJOhqFfbr2Ye7Z7d6/VPy5Mz
X-Received: by 2002:a05:620a:7014:b0:7cb:de0d:ba59 with SMTP id af79cd13be357-7d5c5144552mr330712285a.17.1751460095087;
        Wed, 02 Jul 2025 05:41:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751460095; cv=none;
        d=google.com; s=arc-20240605;
        b=ejH9Rk9G3pbKErlq31w+2CLtR66aMwYtqcWIGJB+gHCrhGW1nmGDkPKToxyEpuge61
         sD1jlirComBO2CENS/3eAKtZptrP+P7TgWpVBl5z8hyFCU7VSPT6cze7FPQ4yzBwbA/j
         4ixqyq/j5QCD+TgAEjEzxYs+UfTwpvTk9ULqFBUk9RIUS+MAEPg5/qP+xWpFQFS2EMCB
         FrYCDqB26eZ/vUTd6Ezs9nGNMaIMXTY+r96m8GoD6NCI+WCahwvzHprRS2VBVa3IXvTk
         PDlDo735Ct5hwOKC3hpm6wyPpPN9cyMh7wgSi1bfLUGzw3wlmfdmNI3nMxFfo0u1NaZQ
         Q37w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=+o9WtWIZF7CJjfjA2GAPrFXLh1beSrq23YpovmlbJIg=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=HV2IhSEc+h/YUgaWOu12LRj6v2McQyp7W/M4WewejSpNn81hdCSkkYUPRfDP8DC1pc
         DplK1nCaw8U2EcqqbvdYatkWVLgWtwtfgmAUMx+Y+Je0+0EIbmioGGYoBgNxfhQEkp11
         MOdyy9qf99lI0sf7MpcxF+k1GSM8DZbhfiyGvT0h64F/H/hrp1wbgIre0RbdeVhyDI2D
         henfR5oWlPtqlieQNhMcgdPE7nHdrMl6zu72U7tvXdg0WV3srG7AVueyiTocUgheURB3
         UB/SPfb/uQ7drkdg9wniO+TcWBvvKksv0uG465uWqeOHcP/S9XNs5AimSyQKISb/qlI/
         WMJg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ix6OY9ZK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a7fc0fe5a0si117596191cf.61.2025.07.02.05.41.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Jul 2025 05:41:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ix6OY9ZK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uWwgj-0000TA-Pn; Wed, 02 Jul 2025 08:35:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWwgA-000817-6N
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 08:35:10 -0400
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWwfp-00015C-7o
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 08:35:07 -0400
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-2cc89c59cc0so4759135fac.0
 for <qemu-arm@nongnu.org>; Wed, 02 Jul 2025 05:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751459686; x=1752064486; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+o9WtWIZF7CJjfjA2GAPrFXLh1beSrq23YpovmlbJIg=;
 b=ix6OY9ZKFTCRTF2/3pvN8ApXyzA7G9bmv7r0IzLGXn+3SjGC2IjLd7FoD0N6zwTOoA
 VfHdkGGHd+ZV7QtC3rlqta8BXQgr9IykqsyahTuwxPs77+JKm0XJm3ZqEjEfmAfO51HH
 W64IgkmEoKmgBVE7n5ueLQYJgU0mVvzFK8mMawKS7d58IEj/37e7VWvBzES2fO9LFg1Z
 0Xln/6jrXLvewtBvmKPYDXauicQgdWIQJ2vtOmGOlxNfdiBWZLNxJ/9AtvrmEntgO0Tc
 vohXyu/hFXKH7KwoZ2ymYXH8lC4mSexMqnjjLBhX4OAUZz/3ma0dBMYLqK9rH7Aq5lWA
 X2vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751459686; x=1752064486;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+o9WtWIZF7CJjfjA2GAPrFXLh1beSrq23YpovmlbJIg=;
 b=EfTv7l3flEI6K+evrHXXM/QoIhCbaPblmOZCL5/QuL/Zaox4/CnoNNkt0OmcKwfpc6
 TpaWIQUVO/ydq0NXKXODEIzq8xdbz65XB1rowdkqv5LTWpT117bwtmCdqWr8rQCj80ie
 BLd2h9lyf7mu06ajHi4nttF/yyoQD+sZ6hBFXXgrfj14/diPbtv/EDBMnR9fHqvLCGZD
 RyA3oRSmcuAJyBYHlxYCKhzYMpY1yyGuUz4oIRYbuZwWbN+PMR8q/v/TGkEoWuYJioXy
 /cV4gOlz/5ImjR3QMbzeYfBqF/U5OFNi3Rl/PiaGMXnEOGrl28pEnjmf+v2/t8/veMHi
 b0RQ==
X-Gm-Message-State: AOJu0YzCxG1rtDnlocUkD8VxpAwJRdbySD+o1dfyu3Hli3Z9I03id7kb
 gkzN3dlFsbvlmpyyrvvtUcnlcQyLOTuItCihyAAUmVlX10R3w+S+pyeFWcAtZ6LeaeRzUVNIxRn
 IOvQCC3s=
X-Gm-Gg: ASbGncsUFM27qBI/klYZXofh3Q7FY6ySUjM2eF+S3AXTb+GrVPN5j/zRHaDRugIPLRd
 K4aRrKBifWhRIzBnS+5Z1znJEiiAp5uVKT/DmegCwoTetGPv3ByEEffHOuQpfYvkym4t+5sHU1t
 KVYwgzIU57FtqF/7oldQ4gjmf4843bpvz162vOzwo2SVrO3/fQ2N9OkkVRJ3SOrB9z3c0/9YsFS
 CEW8r70iFcPhkLXXbPKKMq3zcp7SNbZHNldudtH6B8gms0g+dBRRlYS+LIgl3GoA4KvOWGkOHZW
 zRhMwYyFPgEoqhvCA3CCHSJ042wHiHFdelY/4MnGgGQzlbt98Miy9ZZzZhpHqhiUSlPnbg==
X-Received: by 2002:a05:6871:4984:b0:2e4:c5c8:707b with SMTP id
 586e51a60fabf-2f6472a31e9mr1337827fac.6.1751459686433; 
 Wed, 02 Jul 2025 05:34:46 -0700 (PDT)
Received: from stoup.. ([187.210.107.185]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2efd50b1b2fsm3864281fac.32.2025.07.02.05.34.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 05:34:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v3 27/97] target/arm: Implement SME2 FDOT
Date: Wed,  2 Jul 2025 06:33:00 -0600
Message-ID: <20250702123410.761208-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702123410.761208-1-richard.henderson@linaro.org>
References: <20250702123410.761208-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2a;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2a.google.com
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
X-TUID: gV1cqjc2Z0Ui

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/helper-sme.h    |  5 ++++
 target/arm/tcg/sme_helper.c    | 44 ++++++++++++++++++++++++++++++++++
 target/arm/tcg/translate-sme.c | 18 ++++++++++++++
 target/arm/tcg/translate-sve.c |  5 ++++
 target/arm/tcg/sme.decode      | 14 +++++++++++
 target/arm/tcg/sve.decode      |  7 ++++--
 6 files changed, 91 insertions(+), 2 deletions(-)

diff --git a/target/arm/tcg/helper-sme.h b/target/arm/tcg/helper-sme.h
index cdd7058aed..ec93ff57ff 100644
--- a/target/arm/tcg/helper-sme.h
+++ b/target/arm/tcg/helper-sme.h
@@ -173,3 +173,8 @@ DEF_HELPER_FLAGS_5(gvec_fmaxnum_b16, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_5(gvec_fminnum_b16, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, fpst, i32)
+
+DEF_HELPER_FLAGS_6(sme2_fdot_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_FLAGS_6(sme2_fdot_idx_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, env, i32)
diff --git a/target/arm/tcg/sme_helper.c b/target/arm/tcg/sme_helper.c
index 8ce50653b4..60322be3d0 100644
--- a/target/arm/tcg/sme_helper.c
+++ b/target/arm/tcg/sme_helper.c
@@ -1152,6 +1152,50 @@ void HELPER(sme_fmopa_h)(void *vza, void *vzn, void *vzm, void *vpn,
     }
 }
 
+void HELPER(sme2_fdot_h)(void *vd, void *vn, void *vm, void *va,
+                         CPUARMState *env, uint32_t desc)
+{
+    intptr_t i, oprsz = simd_maxsz(desc);
+    bool za = extract32(desc, SIMD_DATA_SHIFT, 1);
+    float_status *fpst_std = &env->vfp.fp_status[za ? FPST_ZA : FPST_A64];
+    float_status *fpst_f16 = &env->vfp.fp_status[za ? FPST_ZA_F16 : FPST_A64_F16];
+    float_status fpst_odd = *fpst_std;
+    float32 *d = vd, *a = va;
+    uint32_t *n = vn, *m = vm;
+
+    set_float_rounding_mode(float_round_to_odd, &fpst_odd);
+
+    for (i = 0; i < oprsz / sizeof(float32); ++i) {
+        d[H4(i)] = f16_dotadd(a[H4(i)], n[H4(i)], m[H4(i)],
+                              fpst_f16, fpst_std, &fpst_odd);
+    }
+}
+
+void HELPER(sme2_fdot_idx_h)(void *vd, void *vn, void *vm, void *va,
+                             CPUARMState *env, uint32_t desc)
+{
+    intptr_t i, j, oprsz = simd_maxsz(desc);
+    intptr_t elements = oprsz / sizeof(float32);
+    intptr_t eltspersegment = MIN(4, elements);
+    int idx = extract32(desc, SIMD_DATA_SHIFT, 2);
+    bool za = extract32(desc, SIMD_DATA_SHIFT + 2, 1);
+    float_status *fpst_std = &env->vfp.fp_status[za ? FPST_ZA : FPST_A64];
+    float_status *fpst_f16 = &env->vfp.fp_status[za ? FPST_ZA_F16 : FPST_A64_F16];
+    float_status fpst_odd = *fpst_std;
+    float32 *d = vd, *a = va;
+    uint32_t *n = vn, *m = (uint32_t *)vm + H4(idx);
+
+    set_float_rounding_mode(float_round_to_odd, &fpst_odd);
+
+    for (i = 0; i < elements; i += eltspersegment) {
+        uint32_t mm = m[i];
+        for (j = 0; j < eltspersegment; ++j) {
+            d[H4(i + j)] = f16_dotadd(a[H4(i + j)], n[H4(i + j)], mm,
+                                      fpst_f16, fpst_std, &fpst_odd);
+        }
+    }
+}
+
 void HELPER(sme_bfmopa)(void *vza, void *vzn, void *vzm,
                         void *vpn, void *vpm, CPUARMState *env, uint32_t desc)
 {
diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index 9ec02d960d..761584c90b 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -903,3 +903,21 @@ static bool do_bfmlal_nx(DisasContext *s, arg_azx_n *a, bool sub)
 
 TRANS_FEAT(BFMLAL_nx, aa64_sme2, do_bfmlal_nx, a, false)
 TRANS_FEAT(BFMLSL_nx, aa64_sme2, do_bfmlal_nx, a, true)
+
+static bool do_fdot(DisasContext *s, arg_azz_n *a, bool multi)
+{
+    return do_azz_acc_fp(s, a->n, 1, a->rv, a->off, a->zn, a->zm, 1, 0,
+                         multi, FPST_ENV, gen_helper_sme2_fdot_h);
+}
+
+TRANS_FEAT(FDOT_n1, aa64_sme2, do_fdot, a, false)
+TRANS_FEAT(FDOT_nn, aa64_sme2, do_fdot, a, true)
+
+static bool do_fdot_nx(DisasContext *s, arg_azx_n *a)
+{
+    return do_azz_acc_fp(s, a->n, 1, a->rv, a->off, a->zn, a->zm,
+                         a->idx | (1 << 2), 0, false, FPST_ENV,
+                         gen_helper_sme2_fdot_idx_h);
+}
+
+TRANS_FEAT(FDOT_nx, aa64_sme2, do_fdot_nx, a)
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index b85bd885f9..4acd22f55e 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -7229,6 +7229,11 @@ TRANS_FEAT_NONSTREAMING(USMMLA, aa64_sve_i8mm, gen_gvec_ool_arg_zzzz,
 TRANS_FEAT_NONSTREAMING(UMMLA, aa64_sve_i8mm, gen_gvec_ool_arg_zzzz,
                         gen_helper_gvec_ummla_b, a, 0)
 
+TRANS_FEAT(FDOT_zzzz, aa64_sme2_or_sve2p1, gen_gvec_env_arg_zzzz,
+           gen_helper_sme2_fdot_h, a, 0)
+TRANS_FEAT(FDOT_zzxz, aa64_sme2_or_sve2p1, gen_gvec_env_arg_zzxz,
+           gen_helper_sme2_fdot_idx_h, a)
+
 TRANS_FEAT(BFDOT_zzzz, aa64_sve_bf16, gen_gvec_env_arg_zzzz,
            gen_helper_gvec_bfdot, a, 0)
 TRANS_FEAT(BFDOT_zzxz, aa64_sve_bf16, gen_gvec_env_arg_zzxz,
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index 9850c19d90..a2b93519c4 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -285,6 +285,9 @@ BFMLSL_n1       11000001 001 0 .... 0 .. 011 ..... 11 ...   @azz_nx1_o3x2 n=1
 BFMLSL_n1       11000001 001 0 .... 0 .. 010 ..... 110 ..   @azz_nx1_o2x2 n=2
 BFMLSL_n1       11000001 001 1 .... 0 .. 010 ..... 110 ..   @azz_nx1_o2x2 n=4
 
+FDOT_n1         11000001 001 0 .... 0 .. 100 ..... 00 ...   @azz_nx1_o3 n=2
+FDOT_n1         11000001 001 1 .... 0 .. 100 ..... 00 ...   @azz_nx1_o3 n=4
+
 ### SME2 Multi-vector Multiple Array Vectors
 
 %zn_ax2         6:4 !function=times_2
@@ -322,6 +325,9 @@ BFMLAL_nn       11000001 101 ...01 0 .. 010 ...00 100 ..    @azz_4x4_o2x2
 BFMLSL_nn       11000001 101 ....0 0 .. 010 ....0 110 ..    @azz_2x2_o2x2
 BFMLSL_nn       11000001 101 ...01 0 .. 010 ...00 110 ..    @azz_4x4_o2x2
 
+FDOT_nn         11000001 101 ....0 0 .. 100 ....0 00 ...    @azz_2x2_o3
+FDOT_nn         11000001 101 ...01 0 .. 100 ...00 00 ...    @azz_4x4_o3
+
 ### SME2 Multi-vector Indexed
 
 &azx_n          n off rv zn zm idx
@@ -351,3 +357,11 @@ BFMLAL_nx       11000001 1001 .... 1 .. 1 .. ...00 10 ...   @azx_4x1_o2x2
 BFMLSL_nx       11000001 1000 .... . .. 1 .. ..... 11 ...   @azx_1x1_o3x2
 BFMLSL_nx       11000001 1001 .... 0 .. 1 .. ....0 11 ...   @azx_2x1_o2x2
 BFMLSL_nx       11000001 1001 .... 1 .. 1 .. ...00 11 ...   @azx_4x1_o2x2
+
+@azx_2x1_i2_o3  ........ .... zm:4 . .. . idx:2 .... ... off:3 \
+                &azx_n n=2 rv=%mova_rv zn=%zn_ax2
+@azx_4x1_i2_o3  ........ .... zm:4 . .. . idx:2 .... ... off:3 \
+                &azx_n n=2 rv=%mova_rv zn=%zn_ax4
+
+FDOT_nx         11000001 0101 .... 0 .. 1 .. ....0 01 ...   @azx_2x1_i2_o3
+FDOT_nx         11000001 0101 .... 1 .. 1 .. ...00 01 ...   @azx_4x1_i2_o3
diff --git a/target/arm/tcg/sve.decode b/target/arm/tcg/sve.decode
index 3a99eb7299..5970ed9ac4 100644
--- a/target/arm/tcg/sve.decode
+++ b/target/arm/tcg/sve.decode
@@ -1662,7 +1662,8 @@ FMLSLT_zzzw     01100100 10 1 ..... 10 1 00 1 ..... .....  @rda_rn_rm_ex esz=2
 BFMLALB_zzzw    01100100 11 1 ..... 10 0 00 0 ..... .....  @rda_rn_rm_ex esz=2
 BFMLALT_zzzw    01100100 11 1 ..... 10 0 00 1 ..... .....  @rda_rn_rm_ex esz=2
 
-### SVE2 floating-point bfloat16 dot-product
+### SVE2 floating-point dot-product
+FDOT_zzzz       01100100 00 1 ..... 10 0 00 0 ..... .....  @rda_rn_rm_ex esz=2
 BFDOT_zzzz      01100100 01 1 ..... 10 0 00 0 ..... .....  @rda_rn_rm_ex esz=2
 
 ### SVE2 floating-point multiply-add long (indexed)
@@ -1673,7 +1674,9 @@ FMLSLT_zzxw     01100100 10 1 ..... 0110.1 ..... .....     @rrxr_3a esz=2
 BFMLALB_zzxw    01100100 11 1 ..... 0100.0 ..... .....     @rrxr_3a esz=2
 BFMLALT_zzxw    01100100 11 1 ..... 0100.1 ..... .....     @rrxr_3a esz=2
 
-### SVE2 floating-point bfloat16 dot-product (indexed)
+### SVE2 floating-point dot-product (indexed)
+
+FDOT_zzxz       01100100 00 1 ..... 010000 ..... .....     @rrxr_2 esz=2
 BFDOT_zzxz      01100100 01 1 ..... 010000 ..... .....     @rrxr_2 esz=2
 
 ### SVE broadcast predicate element
-- 
2.43.0


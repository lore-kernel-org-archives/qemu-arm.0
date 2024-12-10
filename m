Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp3443544njb;
        Tue, 10 Dec 2024 08:26:34 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW2J96Dv6eJi6OH0nbk5lq+HLDkJCpvJ5Uu0/lopw4tBDXw6+NSTD1UVCfpa/hN2+ntdilJdjPVqUrsLA==@linaro.org
X-Google-Smtp-Source: AGHT+IHqm0fAM0FXSZKkYYE/2bQKJOgJ9s5nUbbP9kYhi/UQ6+PrBz4WSRINOmu5+UR+swv4ERDO
X-Received: by 2002:a05:6122:794:b0:50d:5e21:ef39 with SMTP id 71dfb90a1353d-518882ee845mr5697942e0c.1.1733847994345;
        Tue, 10 Dec 2024 08:26:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733847994; cv=none;
        d=google.com; s=arc-20240605;
        b=Th6IjTgI137AERnKXd7D6zrKceFhZg3BeP+RCMdKudTrgbNHcU8MDBUSWJ0NqitTA+
         Qc956bM07ycCvCdfrXVw94rURYN6SzVQJQ2TkbyE3vDXDXtSwLNJlxMkmmQbE+a3QRHU
         /lmWreqDl1Xt+3SizXiKACvCCKDDVTP56OVRM7u9weSQHW97XGtXNoelJUwzZNbEy3Hm
         vlYdcal6v5FCK9bPQYfz4Ns3w18DA1Cdb04gNQrSwa9sGcXBlx79qjIO5wQ7p8wmKQ/N
         BQSt9JJym1FSqDasUPPnfUnLozCDaJ/k8eIrEfgA19pJQf/6NVPOsowRr1/FHPqxkBez
         kawA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=X2MkVYunVkKmUvj6RPjfdhN6vrB0UjSjV1F2stZxQnk=;
        fh=ZhBia3nL9o1nuf7SbgdYn/0pDmAeja6gisyWXi2cqYE=;
        b=BKL9PNoPWbkfY20FEFJkHCtSCiehTC4Mpwb/1IESVjVNXJED/iFQrtC7LiU3zVjy4d
         MqWLCo+nUDorM7yLdld8uV33o8Xn5q+9cu3MgkmRWA/vumPsXXdRoVRj/AKiFDb5jsJ/
         DVHBE3ZZtWO4uTFxLqPFqzc5g5KJqjwf8qno7igfXOCyN7zmDmSW4gUoPwTQuATxhnhg
         OtL1jneskWEMZmwZwWiziI4N6OiBPJxyKW2xcJpM04kz2yFsT0uUUXypsXtbysk4m3jI
         FVF0QXXnOLhfQq9nabwqFO/3Uo1cqWJWiUfF0oFrfF0K7fDueKAHs81OksAUnZk7LAo8
         sM0Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lzimNxu+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-5187f729372si1030243e0c.79.2024.12.10.08.26.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Dec 2024 08:26:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lzimNxu+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tL32o-0000n7-2p; Tue, 10 Dec 2024 11:25:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tL32N-0007tg-4f
 for qemu-arm@nongnu.org; Tue, 10 Dec 2024 11:24:41 -0500
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tL32F-0007Wt-LE
 for qemu-arm@nongnu.org; Tue, 10 Dec 2024 11:24:34 -0500
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-53e3a227b82so3266054e87.0
 for <qemu-arm@nongnu.org>; Tue, 10 Dec 2024 08:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733847866; x=1734452666; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X2MkVYunVkKmUvj6RPjfdhN6vrB0UjSjV1F2stZxQnk=;
 b=lzimNxu+wkyI4KJwFuMYWiVtg0YKRxDmX1nRBkJsGLLy8KnFq8WhJrAyXSu8zNz1to
 skQZ0prioMFVVLBoQsXiK6zVpEKIKOpV/XOruBXfdxVh0TRshoU+Ey+yhWH+1KV1be2d
 SI9dH/dKEfJmaIWp01uNoeT+BAoafBktMqOuC4+PczI/4gNQ+KMR81EtLG3fx+A95i/u
 AKHTMQK4BIe//dJE4RTlYtuZaSNVmVlDPoE9NxHUalTD88PaXrDWO0Djkmj5vnPitnUw
 JqTA1qapfKi1NdgEBE8Fh/UciinBUbx8FEGeaYy9vk62w6XTNavj7ZnDtynB8ZWZmz5D
 WpWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733847866; x=1734452666;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X2MkVYunVkKmUvj6RPjfdhN6vrB0UjSjV1F2stZxQnk=;
 b=LRYDn7vZx1Tfp/okgC1DYDvlamrTIkX3Ip7VV1+dJ8TKxqsskGzRwGXd+5jo/orezt
 5YdKkCZ22BUiNq4tnQw1LK0egMqSSQrC6fDYPI2/s2AUjiSdSfzAK4wCbCTfA64orSt2
 bwgUoHvZlARIZh4iKS+KImUugkHf3AFBdC0hN61rMvpUgWo5A3BEgqPQlmxOpxHkmB2h
 NJmwQD72XBMr9YGlfrVxaMbFtGqrFXr2Fy7VYcojQQZMCb4TjnnPg+leGGI+EgaqHwVR
 Qrqgl1le8wV93tVFs/jeRwkJZlYw9LfJQ25REKm3pThpzcddSTVlT1e/KmQ8kN6biKoV
 f8mA==
X-Gm-Message-State: AOJu0YzsF6tUE+lCE0UoZhAVZT5EaUJ/AFFCj020y8+/B0c3F0aPDC79
 nhMI13xllZyGlDiZVJOVK3DhPCZeVrO2zLyUqLh1PJjN2rmwWPxdEvdEPQmKE+w=
X-Gm-Gg: ASbGncvwbrM5NlPbcFyqCtfRjhhtXZS4Bt1V0ZJYgBfLjiF4BMAjsqLaREhlV11GNOO
 sT/nNWodSYXGQlJWMP1rcGlL+OuJFhgcc06PbyvP+L2E3Gd8BG7d8dR4wlo/VJCbayOdE2o6n9g
 rrYRzM+ntKv/CesLNz9qSei/vooM81iTrUCews/A5Dq+A05XUtacbEvU7EDwrPMzMiiGs2saHUX
 fyvC5X94lfE24GvYlt0aWdShoQ5TgxMBmkihsGoM6GMOxINqF+h73ukJog=
X-Received: by 2002:a05:6512:124f:b0:540:1dac:c032 with SMTP id
 2adb3069b0e04-5401dacc1bbmr3140318e87.6.1733847866249; 
 Tue, 10 Dec 2024 08:24:26 -0800 (PST)
Received: from stoup.. ([91.209.212.80]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5402960b0absm26024e87.102.2024.12.10.08.24.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2024 08:24:25 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 55/69] target/arm: Convert FSQRT (vector) to decodetree
Date: Tue, 10 Dec 2024 10:17:19 -0600
Message-ID: <20241210161733.1830573-56-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241210161733.1830573-1-richard.henderson@linaro.org>
References: <20241210161733.1830573-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::133;
 envelope-from=richard.henderson@linaro.org; helo=mail-lf1-x133.google.com
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
X-TUID: UpmwiAL4tjmb

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 67 +++++++++++++++++++++++++---------
 target/arm/tcg/a64.decode      |  3 ++
 2 files changed, 53 insertions(+), 17 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index f810e31ccc..287e9338a4 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -9164,6 +9164,51 @@ static bool do_fabs_fneg_v(DisasContext *s, arg_qrr_e *a, GVecGen2Fn *fn)
 TRANS(FABS_v, do_fabs_fneg_v, a, gen_gvec_fabs)
 TRANS(FNEG_v, do_fabs_fneg_v, a, gen_gvec_fneg)
 
+static bool do_fp1_vector(DisasContext *s, arg_qrr_e *a,
+                          const FPScalar1 *f, int rmode)
+{
+    TCGv_i32 tcg_rmode = NULL;
+    TCGv_ptr fpst;
+    int check = fp_access_check_vector_hsd(s, a->q, a->esz);
+
+    if (check <= 0) {
+        return check == 0;
+    }
+
+    fpst = fpstatus_ptr(a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR);
+    if (rmode >= 0) {
+        tcg_rmode = gen_set_rmode(rmode, fpst);
+    }
+
+    if (a->esz == MO_64) {
+        TCGv_i64 t64 = tcg_temp_new_i64();
+
+        for (int pass = 0; pass < 2; ++pass) {
+            read_vec_element(s, t64, a->rn, pass, MO_64);
+            f->gen_d(t64, t64, fpst);
+            write_vec_element(s, t64, a->rd, pass, MO_64);
+        }
+    } else {
+        TCGv_i32 t32 = tcg_temp_new_i32();
+        void (*gen)(TCGv_i32, TCGv_i32, TCGv_ptr)
+            = (a->esz == MO_16 ? f->gen_h : f->gen_s);
+
+        for (int pass = 0, n = (a->q ? 16 : 8) >> a->esz; pass < n; ++pass) {
+            read_vec_element_i32(s, t32, a->rn, pass, a->esz);
+            gen(t32, t32, fpst);
+            write_vec_element_i32(s, t32, a->rd, pass, a->esz);
+        }
+    }
+    clear_vec_high(s, a->q, a->rd);
+
+    if (rmode >= 0) {
+        gen_restore_rmode(tcg_rmode, fpst);
+    }
+    return true;
+}
+
+TRANS(FSQRT_v, do_fp1_vector, a, &f_scalar_fsqrt, -1)
+
 /* Common vector code for handling integer to FP conversion */
 static void handle_simd_intfp_conv(DisasContext *s, int rd, int rn,
                                    int elements, int is_signed,
@@ -9461,9 +9506,6 @@ static void handle_2misc_64(DisasContext *s, int opcode, bool u,
      * requires them.
      */
     switch (opcode) {
-    case 0x7f: /* FSQRT */
-        gen_helper_vfp_sqrtd(tcg_rd, tcg_rn, tcg_fpstatus);
-        break;
     case 0x1a: /* FCVTNS */
     case 0x1b: /* FCVTMS */
     case 0x1c: /* FCVTAS */
@@ -9507,6 +9549,7 @@ static void handle_2misc_64(DisasContext *s, int opcode, bool u,
     case 0xb: /* ABS, NEG */
     case 0x2f: /* FABS */
     case 0x6f: /* FNEG */
+    case 0x7f: /* FSQRT */
         g_assert_not_reached();
     }
 }
@@ -10004,13 +10047,6 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
             }
             handle_2misc_fcmp_zero(s, opcode, false, u, is_q, size, rn, rd);
             return;
-        case 0x7f: /* FSQRT */
-            need_fpstatus = true;
-            if (size == 3 && !is_q) {
-                unallocated_encoding(s);
-                return;
-            }
-            break;
         case 0x1a: /* FCVTNS */
         case 0x1b: /* FCVTMS */
         case 0x3a: /* FCVTPS */
@@ -10104,6 +10140,7 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
         case 0x56: /* FCVTXN, FCVTXN2 */
         case 0x2f: /* FABS */
         case 0x6f: /* FNEG */
+        case 0x7f: /* FSQRT */
             unallocated_encoding(s);
             return;
         }
@@ -10176,9 +10213,6 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
             {
                 /* Special cases for 32 bit elements */
                 switch (opcode) {
-                case 0x7f: /* FSQRT */
-                    gen_helper_vfp_sqrts(tcg_res, tcg_op, tcg_fpstatus);
-                    break;
                 case 0x1a: /* FCVTNS */
                 case 0x1b: /* FCVTMS */
                 case 0x1c: /* FCVTAS */
@@ -10221,6 +10255,7 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
                 case 0x7: /* SQABS, SQNEG */
                 case 0x2f: /* FABS */
                 case 0x6f: /* FNEG */
+                case 0x7f: /* FSQRT */
                     g_assert_not_reached();
                 }
             }
@@ -10364,11 +10399,11 @@ static void disas_simd_two_reg_misc_fp16(DisasContext *s, uint32_t insn)
         rmode = FPROUNDING_ZERO;
         break;
     case 0x7d: /* FRSQRTE */
-    case 0x7f: /* FSQRT (vector) */
         break;
     default:
     case 0x2f: /* FABS */
     case 0x6f: /* FNEG */
+    case 0x7f: /* FSQRT (vector) */
         unallocated_encoding(s);
         return;
     }
@@ -10473,12 +10508,10 @@ static void disas_simd_two_reg_misc_fp16(DisasContext *s, uint32_t insn)
             case 0x7d: /* FRSQRTE */
                 gen_helper_rsqrte_f16(tcg_res, tcg_op, tcg_fpstatus);
                 break;
-            case 0x7f: /* FSQRT */
-                gen_helper_vfp_sqrth(tcg_res, tcg_op, tcg_fpstatus);
-                break;
             default:
             case 0x2f: /* FABS */
             case 0x6f: /* FNEG */
+            case 0x7f: /* FSQRT */
                 g_assert_not_reached();
             }
 
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index f46bd1a715..1e0eb4a748 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -1694,3 +1694,6 @@ FABS_v          0.00 1110 1.1 00000 11111 0 ..... .....     @qrr_sd
 
 FNEG_v          0.10 1110 111 11000 11111 0 ..... .....     @qrr_h
 FNEG_v          0.10 1110 1.1 00000 11111 0 ..... .....     @qrr_sd
+
+FSQRT_v         0.10 1110 111 11001 11111 0 ..... .....     @qrr_h
+FSQRT_v         0.10 1110 1.1 00001 11111 0 ..... .....     @qrr_sd
-- 
2.43.0


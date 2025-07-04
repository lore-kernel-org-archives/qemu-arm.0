Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1257548dyc;
        Fri, 4 Jul 2025 07:34:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUo4kmKNGTDGfZFKaWmPPErRmU06qxHeGQdFc5HYW0lKVA2kb0Q4Eq68eKVES6SyV0WwFXZrp8gmnLPAw==@linaro.org
X-Google-Smtp-Source: AGHT+IGd8IxkMxDhQI3xh/GdLFuXUjPhZAUviOdEpt+JWM9rZKxmS9VOOEeN8Leu2vkQZodsoITd
X-Received: by 2002:ac8:5715:0:b0:4a4:2c4c:ccb3 with SMTP id d75a77b69052e-4a9987df177mr32159701cf.38.1751639688932;
        Fri, 04 Jul 2025 07:34:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751639688; cv=none;
        d=google.com; s=arc-20240605;
        b=EmzkCeWM20JA/q6drydr03cqi687ZXU0Ai1mKrPC9upLouno8ESMGxt5dUi6O/v41o
         cxqv8y6IuVlPlrpurJPLRV6xzN3XNzzn1UEsXNz6hES8Tg5QNAl44EeZf5LfC/qHqrjn
         BnsYuNp1BQTkAsxE6O1DHU47uP0Jf+ebNM/EBPYTCqMaV00+gyd5EcmDbw1TzL8F4uDz
         K5pTuUqt1mqkpxdQVoVS0+NOGgV8XbxHAQqwaebRrXL2IKtkLBwHovcN489zrH7vZXas
         Xfodl+MFiEd10dbkqpi0LMJBDzSyaVckKb9UHGluSjhZeDhQWSFynMJHMZbnQG+vvTYh
         fEDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ZfH+TBNr4UGCBawjnJleJmZyYrHxkG1+R38RVn3NA/g=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=C5f1Lz+Mbr0bRkdKCfhJkL+MtJgKzwP0LtAxyGi/aAVP6682x2OSRLU1MKMkL/XvBH
         B60VhV6PVYOgPzyJTJLvFy+yA84ZBsZO4oXyCM+pt0gOfjfM6svXJkXBgSouDRIxO8Gm
         Nx3nWiIlRcC0e4pMcHOTAe+JENoDc/dpK18E5BVnIlXS9nz0uFl5Q1n9gr8b0l/2z2mw
         lWoKjp2FJbRgo+ldZRXfEehjI/aU9dB7EYtqS8h4PiP1GtiPtv1Vwu16S/ek6QaRSIjN
         qKVUHr5jDntLeCNnjXGeRuRvrpa9Z9XS3rhoBHgQ/9KLCGPjORLyaAUawIIAOEo81hmX
         juPA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fSswHqjY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-702c4d605b9si20506126d6.412.2025.07.04.07.34.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jul 2025 07:34:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fSswHqjY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXhPd-0003I1-37; Fri, 04 Jul 2025 10:29:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhLo-0003xk-7S
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:25:19 -0400
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhLj-0007uC-LZ
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:25:15 -0400
Received: by mail-ot1-x32c.google.com with SMTP id
 46e09a7af769-73b0efea175so725537a34.0
 for <qemu-arm@nongnu.org>; Fri, 04 Jul 2025 07:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751639108; x=1752243908; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZfH+TBNr4UGCBawjnJleJmZyYrHxkG1+R38RVn3NA/g=;
 b=fSswHqjYvpljtFScCID9TfEhfG1fLeQGFulHYwlReVbYT0qsYdoCspkgJncCOatqrE
 fXl7vB6WsHU6ml+tyV3g+HtvpmsIt5JbWjz7to8p/uf9UHX3osrUUVBY9O2YUFym25cK
 c6j392MI7Q/opkSwmrsgP9yMYXpMtUt1yf5rMUgwu+CnPcM1DGghZ6Ptvp5wEDk6Iz4v
 QTYYFfOGels6lFr9S8nuA03Wh2etafo4OIcu6J1USaC6c4KvBQKWqK33b5DKYl6Nx2hW
 82pp//OgeJswhsL8nMbY8CJFDWYrhoKqxRBVjuB4OmWR2KE5G23AGuK57K2JUtIIAus7
 zWvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751639108; x=1752243908;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZfH+TBNr4UGCBawjnJleJmZyYrHxkG1+R38RVn3NA/g=;
 b=itIEvBLgxBa8ccVPmwE0jooZbrASFDlX8MkwmkujyVA9ro3/x/KSbumqSNrOEFlIeW
 AFwQywBue4Q9QpkR+bo3R3ewzqzyLPCVqwssUaYZjnYDalTCh9FRPHuQxhS5w0Ww7wGt
 4XmTDzZOCPkCKx5qDNYBS80ERliz1XAZsHDfUF8pmhtHOZvQQXWq095ypj57cLAzo8fw
 Yh6E0v2zay/vuP4DB8uyIjy0WzMl3M/0mjh9dOHUDMbbkMnWGBmvSV+GzdRc72zaoeMp
 vw4138eVjGKmFXbqQunv7DXgunG+JfXSGhprzpwA/X0Pk5UQ/DrGiVJbPHRiwSCDN3gx
 rM3g==
X-Gm-Message-State: AOJu0YzHQPfeqC5UxpED6x6C9pV6zszBxr1Sp5bBHmXALLLvjfqlUJZX
 162nukNJZkgtKvL5T+aMkXZihK4M0obszAuGmm40PzQo6add/ScaYu2+VUgTw5L9MkQ=
X-Gm-Gg: ASbGncsYLEBpp4yPyni21UcBbdEdCuqR1Ky5v4OonPMI4RmT/3AqcXYaw3NGSgXgjto
 k52iZ6hEiI+HRtzs460dAkCiY04PzyOdQjfdP6AzsUzvvNq4VWZ+hD6rPNHtlWsGm4ELzhK9rGf
 UbpuILIfeP/YLdbOJxpSbWLTD8vOIQ+L463wpBVoKllrWsybADjKMX92z/YA5JEHW4baAscqsM/
 QQaBFBIiQ28/BRk9ku/11Sl80LqmzVcylimhfvn0lXAe3V7EOLr7dTysvKJ/TX+J28pJDLDBKdD
 ePLHtapAQG9q8118UgmOzsO4/79FVmXhqWsFpVAWMWaRjWgPZJF1QVqwG6qTQT9SBUK3EtTHNIZ
 hU35LQ1fJvsd0gFX50fUzrVZ47bZZ4yv8pa6BVO5H/gIk4rKp
X-Received: by 2002:a05:6830:498f:b0:72b:a465:d955 with SMTP id
 46e09a7af769-73ca661fa7bmr1529963a34.12.1751639108457; 
 Fri, 04 Jul 2025 07:25:08 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-6138e5ac5eesm310233eaf.29.2025.07.04.07.25.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 07:25:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v4 050/108] target/arm: Implement SME2 FADD, FSUB, BFADD, BFSUB
Date: Fri,  4 Jul 2025 08:20:13 -0600
Message-ID: <20250704142112.1018902-51-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704142112.1018902-1-richard.henderson@linaro.org>
References: <20250704142112.1018902-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32c.google.com
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
X-TUID: KYUVmd6WkeJv

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/helper.h        |  2 ++
 target/arm/tcg/translate-sme.c | 44 ++++++++++++++++++++++++++++++++++
 target/arm/tcg/vec_helper.c    |  2 ++
 target/arm/tcg/sme.decode      | 25 +++++++++++++++++++
 4 files changed, 73 insertions(+)

diff --git a/target/arm/tcg/helper.h b/target/arm/tcg/helper.h
index 37dd384659..392bf7b9b5 100644
--- a/target/arm/tcg/helper.h
+++ b/target/arm/tcg/helper.h
@@ -731,10 +731,12 @@ DEF_HELPER_FLAGS_4(gvec_fclt0_d, TCG_CALL_NO_RWG, void, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_5(gvec_fadd_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_5(gvec_fadd_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_5(gvec_fadd_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_5(gvec_bfadd, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
 
 DEF_HELPER_FLAGS_5(gvec_fsub_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_5(gvec_fsub_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_5(gvec_fsub_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_5(gvec_bfsub, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
 
 DEF_HELPER_FLAGS_5(gvec_fmul_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_5(gvec_fmul_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index 3f9a80248a..664fdd86aa 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -1072,6 +1072,50 @@ TRANS_FEAT(BFMLA_nx, aa64_sme_b16b16, do_fmla_nx, a, FPST_ZA,
 TRANS_FEAT(BFMLS_nx, aa64_sme_b16b16, do_fmla_nx, a, FPST_ZA,
            s->fpcr_ah ? gen_helper_gvec_ah_bfmls_idx : gen_helper_gvec_bfmls_idx)
 
+static bool do_faddsub(DisasContext *s, arg_az_n *a, ARMFPStatusFlavour fpst,
+                       gen_helper_gvec_3_ptr *fn)
+{
+    if (sme_smza_enabled_check(s)) {
+        int svl = streaming_vec_reg_size(s);
+        int n = a->n;
+        int zm = a->zm;
+        int vstride = svl / n;
+        TCGv_ptr t_za = get_zarray(s, a->rv, a->off, n, 0);
+        TCGv_ptr ptr = fpstatus_ptr(fpst);
+        TCGv_ptr t = tcg_temp_new_ptr();
+
+        for (int r = 0; r < n; ++r) {
+            TCGv_ptr t_zm = vec_full_reg_ptr(s, zm + r);
+            int o_za = r * vstride * sizeof(ARMVectorReg);
+            int desc = simd_desc(svl, svl, 0);
+
+            tcg_gen_addi_ptr(t, t_za, o_za);
+            fn(t, t, t_zm, ptr, tcg_constant_i32(desc));
+        }
+    }
+    return true;
+}
+
+TRANS_FEAT(FADD_nn_h, aa64_sme_f16f16, do_faddsub, a,
+           FPST_ZA_F16, gen_helper_gvec_fadd_h)
+TRANS_FEAT(FSUB_nn_h, aa64_sme_f16f16, do_faddsub, a,
+           FPST_ZA_F16, gen_helper_gvec_fsub_h)
+
+TRANS_FEAT(FADD_nn_s, aa64_sme2, do_faddsub, a,
+           FPST_ZA, gen_helper_gvec_fadd_s)
+TRANS_FEAT(FSUB_nn_s, aa64_sme2, do_faddsub, a,
+           FPST_ZA, gen_helper_gvec_fsub_s)
+
+TRANS_FEAT(FADD_nn_d, aa64_sme2_f64f64, do_faddsub, a,
+           FPST_ZA, gen_helper_gvec_fadd_d)
+TRANS_FEAT(FSUB_nn_d, aa64_sme2_f64f64, do_faddsub, a,
+           FPST_ZA, gen_helper_gvec_fsub_d)
+
+TRANS_FEAT(BFADD_nn, aa64_sme_b16b16, do_faddsub, a,
+           FPST_ZA, gen_helper_gvec_bfadd)
+TRANS_FEAT(BFSUB_nn, aa64_sme_b16b16, do_faddsub, a,
+           FPST_ZA, gen_helper_gvec_bfsub)
+
 /*
  * Expand array multi-vector single (n1), array multi-vector (nn),
  * and array multi-vector indexed (nx), for integer accumulate.
diff --git a/target/arm/tcg/vec_helper.c b/target/arm/tcg/vec_helper.c
index 51bfd767a3..d4ee6f4d29 100644
--- a/target/arm/tcg/vec_helper.c
+++ b/target/arm/tcg/vec_helper.c
@@ -1470,10 +1470,12 @@ void HELPER(NAME)(void *vd, void *vn, void *vm,                            \
 DO_3OP(gvec_fadd_h, float16_add, float16)
 DO_3OP(gvec_fadd_s, float32_add, float32)
 DO_3OP(gvec_fadd_d, float64_add, float64)
+DO_3OP(gvec_bfadd, bfloat16_add, bfloat16)
 
 DO_3OP(gvec_fsub_h, float16_sub, float16)
 DO_3OP(gvec_fsub_s, float32_sub, float32)
 DO_3OP(gvec_fsub_d, float64_sub, float64)
+DO_3OP(gvec_bfsub, bfloat16_sub, bfloat16)
 
 DO_3OP(gvec_fmul_h, float16_mul, float16)
 DO_3OP(gvec_fmul_s, float32_mul, float32)
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index b3dd3bffc3..0badc8f9fa 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -510,6 +510,31 @@ FMLS_nn_h       11000001 101 ...01 0 .. 100 ...00 11 ...    @azz_4x4_o3
 FMLS_nn_s       11000001 101 ...01 0 .. 110 ...00 01 ...    @azz_4x4_o3
 FMLS_nn_d       11000001 111 ...01 0 .. 110 ...00 01 ...    @azz_4x4_o3
 
+&az_n           n off rv zm
+@az_2x2_o3      ........ ... ..... . .. ... ..... .. off:3  \
+                &az_n n=2 rv=%mova_rv zm=%zn_ax2
+@az_4x4_o3      ........ ... ..... . .. ... ..... .. off:3  \
+                &az_n n=4 rv=%mova_rv zm=%zn_ax4
+
+FADD_nn_h       11000001 101 00100 0 .. 111 ....0 00 ...    @az_2x2_o3
+FADD_nn_s       11000001 101 00000 0 .. 111 ....0 00 ...    @az_2x2_o3
+FADD_nn_d       11000001 111 00000 0 .. 111 ....0 00 ...    @az_2x2_o3
+FADD_nn_h       11000001 101 00101 0 .. 111 ...00 00 ...    @az_4x4_o3
+FADD_nn_s       11000001 101 00001 0 .. 111 ...00 00 ...    @az_4x4_o3
+FADD_nn_d       11000001 111 00001 0 .. 111 ...00 00 ...    @az_4x4_o3
+
+FSUB_nn_h       11000001 101 00100 0 .. 111 ....0 01 ...    @az_2x2_o3
+FSUB_nn_s       11000001 101 00000 0 .. 111 ....0 01 ...    @az_2x2_o3
+FSUB_nn_d       11000001 111 00000 0 .. 111 ....0 01 ...    @az_2x2_o3
+FSUB_nn_h       11000001 101 00101 0 .. 111 ...00 01 ...    @az_4x4_o3
+FSUB_nn_s       11000001 101 00001 0 .. 111 ...00 01 ...    @az_4x4_o3
+FSUB_nn_d       11000001 111 00001 0 .. 111 ...00 01 ...    @az_4x4_o3
+
+BFADD_nn        11000001 111 00100 0 .. 111 ....0 00 ...    @az_2x2_o3
+BFADD_nn        11000001 111 00101 0 .. 111 ...00 00 ...    @az_4x4_o3
+BFSUB_nn        11000001 111 00100 0 .. 111 ....0 01 ...    @az_2x2_o3
+BFSUB_nn        11000001 111 00101 0 .. 111 ...00 01 ...    @az_4x4_o3
+
 ### SME2 Multi-vector Indexed
 
 &azx_n          n off rv zn zm idx
-- 
2.43.0


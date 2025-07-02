Received: by 2002:a05:622a:6187:b0:4a7:49b6:ba6e with SMTP id hh7csp3709612qtb;
        Wed, 2 Jul 2025 05:44:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU3lEbN0kEE5gPEdKbAJgxtM4Rq3U6rBI+pWeHnJF1O9w23PRMp8VhSD2g4d7I3OBDsowppXsA95/8cHg==@linaro.org
X-Google-Smtp-Source: AGHT+IFSvShCDtpIu49RyytC9wIvPRnl/LhcwgZRKYLvmWsJwf/hdRNBJSGk7L6Ig1duGA6Klm+E
X-Received: by 2002:a05:622a:1922:b0:4a6:fa5b:5438 with SMTP id d75a77b69052e-4a9768d909bmr34350321cf.4.1751460289262;
        Wed, 02 Jul 2025 05:44:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751460289; cv=none;
        d=google.com; s=arc-20240605;
        b=UB5oBRWo14I+Nnu9NJ9k2fYssTZ9AEuFfEMqlrJFDyaFdNNGjd2wC2jGaTc3pO2VlD
         mxWUbahoerH0TegGqyoumaX2oN0Traho/9mFjVxavThgGiDFZjiQeFfXAF8wbTOZf7nE
         Uc/WNfkGGEPXT8CymMuyenTXR1tL1uDgMIzJGfivqE1On9Ryk//WD/TCj0r9t2DR8CaN
         V49U4usZNy2bwhPFvv5D7MAPadfBMw1xrTS9jlkxTwb3eC7RSgAFjART9DO1gg99DPoB
         TOvttgj0FlfadfNX14/TRcvwa877SB99RqSMyhiL4dMhOQu3kCswllR43zXoLJKuFFoz
         lIYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=UwJAdkJg2tdJ1nEkGJQK0TdWr3xuzbd42p8fZgBvzHc=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=ZHeEQd81kk0TFvGlcVvxqkQVC1r18T0mHYs0Yh5zfSYQqg2o3Lm8LSGuL6luyzqzVV
         29c78YUneSCf5fekBhB+/v46MSFvykXq/BssLYZQVRXEP0gtudOyjov8opqPD5Ubx4DC
         6KsUjYyEs9P5kEMXGBzitfi/E132ai8GIa+Gr95XLWBLcTMfYLp6mwDw+RLuuSboOn6I
         czHb2KLZNbnIb3L4SEcJscOx8TZNoq312D0wOaTHd/POA/o8qv4CqVRxSgwoQT7hH8Z/
         HkMrmmohqa9uHwjgrXOEoqTlBebEPCpfkgfLyFMZyiYWY1tpR7D0kj0gdAVhbG8Z2xX1
         gLaQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OuAiD5P4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a7fc576503si128932911cf.575.2025.07.02.05.44.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Jul 2025 05:44:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OuAiD5P4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uWwll-0005kg-Ar; Wed, 02 Jul 2025 08:40:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWwj3-00044t-Is
 for qemu-devel@nongnu.org; Wed, 02 Jul 2025 08:38:10 -0400
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWwiz-000213-I5
 for qemu-devel@nongnu.org; Wed, 02 Jul 2025 08:38:09 -0400
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-2c6ed7efb1dso3182926fac.2
 for <qemu-devel@nongnu.org>; Wed, 02 Jul 2025 05:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751459883; x=1752064683; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UwJAdkJg2tdJ1nEkGJQK0TdWr3xuzbd42p8fZgBvzHc=;
 b=OuAiD5P4KlDz8zTbgY9QS6PEmfx49qqmcGsu2+BFn9a/o4vEudOqfe4nT/nk8Wn/95
 hD9am8rvsE1U15sYnZRPQmV3dYrTQJsmA0g5zQFK6lRnsFDL2zkgX399uD4hqXgc+LOl
 XMOMj76L0iQdVl7TAi+DpdwdHdETDm8Ydm9KbPvtD3ptlTuCktIIaqV5oI9gOwoLk3TC
 qCuZJ5XMNI6Cj48u9HUU8Y1hGRZn7zvsNWgBXa9Wn1Bt44U2kjW1wrQ7IiWm6bxCkd5v
 zKnWyIUKFLFWuYqgN65Ja5ISaK6rIHWL4wjozohfeW3QQJGzGp0DL44LtFI20jYj8lmW
 NSWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751459883; x=1752064683;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UwJAdkJg2tdJ1nEkGJQK0TdWr3xuzbd42p8fZgBvzHc=;
 b=km0WQu2coRvrx3xeb4yqotQPN2n3u8KcQWK9mo4rYF57Xsor7xfITp9TUEV9pa3ho0
 NMD3yWRv8YHumAhVKTwrQH5rZ8nLHJF7fiaPp+gL0SB2Jtm5L98gCTl9FEVtsUil2RcH
 wPHegthA+wwIPHIlgvrHCNt76pVbey0/n7PFY4ENEMvnokbGxnn4yevhwAqoX4Cux5eP
 kSmhimqhH0ueMA7yPqaswSnfiPTuaes82y1YLbCPjyE9RMxChdv/fa5SHJjOHGNvMj6E
 DPF+9oDIgr+1+ecys1O906t6CIu0UhJwbpK6KqKrtSN8b2rcsfBKNT7ldzb/cew4ZiHT
 H9dA==
X-Gm-Message-State: AOJu0YyunA/jfdmId0jnYiYzgqcIOigT4ANYBYQ6/xA3+NUSu1yeISBW
 HB6e82w74ICunlF2Dej3zeEDk22NOKArGvtZD0u0t44O8+bbKSzAmp/wH64v0trTKlfMFSIcysu
 ktDAlHNI=
X-Gm-Gg: ASbGnct+GKCaqqa9Te66DwSL2AoOe9xlgV36Th9iQ680mgJix0qDjS44QH7D3EHZNtU
 GHlWpydMGJ0kv+ycVF9gWbwm6N29jub0/ejdpmfgqTB3GJkNzxgdLwLm70+gcgTQ2J+fXjPBeTV
 yP7D1iZT0JXa3H693IfWgLiigtuHdlXyrHX+CrV1vGrhoI2H0hOV8F2Yn5x875dW9BfvvNIqz9J
 Y+xenePy+7vPrDRTOMOnrZ9kIQhV6hqEJ1S+YjakBOiEJh5sEZexve5PR1hqUI8vZtwLKsVmvxc
 WaFclrMazG0emq1ShyLB5SEtsLPpw6+eB33a1EX/wbcOxmn8ShCg4drW8qWHEZ9t7V5ZjA==
X-Received: by 2002:a05:6870:ab8f:b0:2e4:4617:f6e1 with SMTP id
 586e51a60fabf-2f5a8d276b2mr1949965fac.2.1751459882558; 
 Wed, 02 Jul 2025 05:38:02 -0700 (PDT)
Received: from stoup.. ([187.210.107.185]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2efd4ea5d9fsm3843451fac.10.2025.07.02.05.38.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 05:38:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v3 40/97] target/arm: Implement SME2 FADD, FSUB, BFADD, BFSUB
Date: Wed,  2 Jul 2025 06:33:13 -0600
Message-ID: <20250702123410.761208-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702123410.761208-1-richard.henderson@linaro.org>
References: <20250702123410.761208-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::36;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x36.google.com
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
X-TUID: n9Z8nhqom8jc

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
index f4373dd4bf..e1ded43af7 100644
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


Received: by 2002:a17:906:32d0:b0:a63:3083:985b with SMTP id k16csp189435ejk;
        Tue, 28 May 2024 13:32:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU8hp6l9N+/dheoVgBF1N8HuRqdTi7Jb2302iqkmMwm63C87pMx8uShDDO2C1upFUVdA/BFK5S4FTGBi8Bn30uh6zeR7Mvr
X-Google-Smtp-Source: AGHT+IEC89SJXMNwo8Tni3gqOykY6oDpUxrWzko9IvKG9BRk/HgxWaHyupjBXaPUR77IV7Nk6Nwp
X-Received: by 2002:a05:6808:21a0:b0:3d1:d3bd:6bb5 with SMTP id 5614622812f47-3d1d3bd6bbamr1469421b6e.13.1716928326523;
        Tue, 28 May 2024 13:32:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716928326; cv=none;
        d=google.com; s=arc-20160816;
        b=yjhmgLRkPe22+FSwx7GttTL5Cn2MgqStL0WEVvFQnMpnXCHBpERhG+RckaKYMUs4xN
         1A9SGAcUvL6jXSFVsm4rG4gxd1nepBhaHWCIF/DZl+y+esZs2gl2bmcuSeiSRF6JWy4D
         alrkrTAyO9suGMyj9rByHPiDhvRxSsSeUbVxKbH9WbtAQy2EsmvewjD/a4k31/yAui71
         N7B3MqhvjUx3l0Mo4M0A1PYgEfBK2zQAyXlSIcPK7JnMHOtK8+7QAbjrX1V2G3iAAoI6
         QNrU+LJtY/qi1GtgO5NC1yfGDF1F6NesBD1r/2HEPX2W2tHSWlKD4H5NtWhrxe8E2sVL
         4cAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=FZPt4l3XVbDKhFseUMAVsphifUIVII/61XwPrGFOleE=;
        fh=ZhBia3nL9o1nuf7SbgdYn/0pDmAeja6gisyWXi2cqYE=;
        b=lfqDBSeQCdv8ZtNEZ/3YsSbXs/1qhVWzFGXn01aA5/f0JoxiV6Jo025SVOoyWQgBrj
         zTbThFL1LU9zoEw0FxTxHd2KqFcK6HWCRbYwN5gTJUoXWb2hiKlOoHuEtSFdy6MXObA1
         xIVYE3cEzjgN5sMjrH8hynXMWqRqeE5UuSw1zw2Kyt40y329HmUWtnFYaqrogsIQTM/u
         Y/aY763600b8qeudxYknEs4y+x78ZrdaDlc8O4bZabVc6euJmLWvE3jGVYgxsWPxHJvc
         kn4Ryve4KHmLSSWgUuQyHDGr1H7Hw0sTDA6WpacB0CIgurTQToeN6N0yKMom1SWJWLV8
         GTiA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="J/xU/xWp";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-43fb809f8c6si104164771cf.251.2024.05.28.13.32.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 May 2024 13:32:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="J/xU/xWp";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sC3Tk-00037I-1P; Tue, 28 May 2024 16:31:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sC3TW-0002vm-Pp
 for qemu-arm@nongnu.org; Tue, 28 May 2024 16:31:14 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sC3TH-0003cw-VP
 for qemu-arm@nongnu.org; Tue, 28 May 2024 16:31:13 -0400
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-6f8e98784b3so943244b3a.1
 for <qemu-arm@nongnu.org>; Tue, 28 May 2024 13:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716928259; x=1717533059; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FZPt4l3XVbDKhFseUMAVsphifUIVII/61XwPrGFOleE=;
 b=J/xU/xWprR9gKC+xV+X1Hztqw3CmeiJuM/KttwEx+S+f5eDOgqZDbv1oYz/SfpshCI
 HCamQGo8JaqsuWl7DRioVPzzI9c/1nHlZYnENSBhjUeH1nWAMq7xzyTCxehHyEcsevMd
 j+g0rJqY8TwYvHtTnE51/ke3p2PowI1VfO/86b1pKUp1G7ozojXd4KQeMzTr8dM9iczi
 Ec7dbdesgexeDcx+b/yI93P5K0xB7JH1bZ53AWue51RFFBWMb3NCw7jOv6thRGXZuU/U
 qcysmq5RS9+TE8TEq+izRcwzDnCJOF0Mn2IFg5uVL0mdWuBKs/706IKhJue24cy3peX3
 sfsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716928259; x=1717533059;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FZPt4l3XVbDKhFseUMAVsphifUIVII/61XwPrGFOleE=;
 b=ddnR95QFivqejpIFuZxp6qrMEE0l2Cn2Qi2u6FeIQNWhT8NhVr/xLGpl83Ny/Y4OY3
 vuiRvwE2cpMAH/85V92kn51sQj09QTjVLnVkVpoRmfjMvV783LqVgi9aYAGmebrju2Dk
 +JPohtasQ9P8Ab8L1kWkkEVVC3vgISLYkx9Q9/pTQZh736dOXuk1ooZxGxgRrV6+uDWW
 pbOgHlX7vX1nAqdGgQ+H+STBNUhcfQYghb+MqFKYUurJROgjy10AZRmuityhCZTntfg9
 YuEjHayuEF9yiGgsXfkDDouc7rWPcnaIcwRUdDcLMvB1ne64nTULf8LsmTx2R6EpruTM
 /f6Q==
X-Gm-Message-State: AOJu0YwYN/ylsaYG2+95Hngnu+HuWBmBA4omT8XfsGVzdUUXLshE7SIw
 qv+LPDjJOfEzKFdCLomet0RW7BmI3+ym8Vm/uG3bpzYWNK4ftVxm3x89jLMOow1GtESdRND5u18
 S
X-Received: by 2002:a05:6a00:4c82:b0:6f3:e6e0:d9f3 with SMTP id
 d2e1a72fcca58-6f8f4193539mr15244731b3a.31.1716928258325; 
 Tue, 28 May 2024 13:30:58 -0700 (PDT)
Received: from stoup.. (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f8fbd3dbe9sm7042036b3a.10.2024.05.28.13.30.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 May 2024 13:30:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 14/33] target/arm: Convert SQRSHL and UQRSHL (register) to
 gvec
Date: Tue, 28 May 2024 13:30:25 -0700
Message-Id: <20240528203044.612851-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240528203044.612851-1-richard.henderson@linaro.org>
References: <20240528203044.612851-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: VTwc990p92+E

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h             |  8 ++++++
 target/arm/tcg/translate.h      |  4 +++
 target/arm/tcg/neon-dp.decode   | 17 ++----------
 target/arm/tcg/gengvec.c        | 24 ++++++++++++++++
 target/arm/tcg/neon_helper.c    | 24 ++++++++++++++++
 target/arm/tcg/translate-a64.c  | 17 +++++-------
 target/arm/tcg/translate-neon.c | 49 ++-------------------------------
 7 files changed, 71 insertions(+), 72 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index f345087ddb..9a89c9cea7 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -334,6 +334,14 @@ DEF_HELPER_FLAGS_5(neon_uqshl_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(neon_uqshl_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(neon_uqshl_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(neon_uqshl_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(neon_sqrshl_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(neon_sqrshl_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(neon_sqrshl_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(neon_sqrshl_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(neon_uqrshl_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(neon_uqrshl_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(neon_uqrshl_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(neon_uqrshl_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 
 DEF_HELPER_FLAGS_4(gvec_srshl_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(gvec_srshl_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
diff --git a/target/arm/tcg/translate.h b/target/arm/tcg/translate.h
index 6c6d4d49e7..048cb45ebe 100644
--- a/target/arm/tcg/translate.h
+++ b/target/arm/tcg/translate.h
@@ -467,6 +467,10 @@ void gen_neon_sqshl(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
                     uint32_t rm_ofs, uint32_t opr_sz, uint32_t max_sz);
 void gen_neon_uqshl(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
                     uint32_t rm_ofs, uint32_t opr_sz, uint32_t max_sz);
+void gen_neon_sqrshl(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
+                     uint32_t rm_ofs, uint32_t opr_sz, uint32_t max_sz);
+void gen_neon_uqrshl(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
+                     uint32_t rm_ofs, uint32_t opr_sz, uint32_t max_sz);
 
 void gen_cmtst_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b);
 void gen_ushl_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b);
diff --git a/target/arm/tcg/neon-dp.decode b/target/arm/tcg/neon-dp.decode
index 6d4996b8d8..788578c8fa 100644
--- a/target/arm/tcg/neon-dp.decode
+++ b/target/arm/tcg/neon-dp.decode
@@ -102,25 +102,12 @@ VCGE_U_3s        1111 001 1 0 . .. .... .... 0011 . . . 1 .... @3same
 
 VSHL_S_3s        1111 001 0 0 . .. .... .... 0100 . . . 0 .... @3same_rev
 VSHL_U_3s        1111 001 1 0 . .. .... .... 0100 . . . 0 .... @3same_rev
-
-# Insns operating on 64-bit elements (size!=0b11 handled elsewhere)
-# The _rev suffix indicates that Vn and Vm are reversed (as explained
-# by the comment for the @3same_rev format).
-@3same_64_rev    .... ... . . . 11 .... .... .... . q:1 . . .... \
-                 &3same vm=%vn_dp vn=%vm_dp vd=%vd_dp size=3
-
 VQSHL_S_3s       1111 001 0 0 . .. .... .... 0100 . . . 1 .... @3same_rev
 VQSHL_U_3s       1111 001 1 0 . .. .... .... 0100 . . . 1 .... @3same_rev
 VRSHL_S_3s       1111 001 0 0 . .. .... .... 0101 . . . 0 .... @3same_rev
 VRSHL_U_3s       1111 001 1 0 . .. .... .... 0101 . . . 0 .... @3same_rev
-{
-  VQRSHL_S64_3s  1111 001 0 0 . .. .... .... 0101 . . . 1 .... @3same_64_rev
-  VQRSHL_S_3s    1111 001 0 0 . .. .... .... 0101 . . . 1 .... @3same_rev
-}
-{
-  VQRSHL_U64_3s  1111 001 1 0 . .. .... .... 0101 . . . 1 .... @3same_64_rev
-  VQRSHL_U_3s    1111 001 1 0 . .. .... .... 0101 . . . 1 .... @3same_rev
-}
+VQRSHL_S_3s      1111 001 0 0 . .. .... .... 0101 . . . 1 .... @3same_rev
+VQRSHL_U_3s      1111 001 1 0 . .. .... .... 0101 . . . 1 .... @3same_rev
 
 VMAX_S_3s        1111 001 0 0 . .. .... .... 0110 . . . 0 .... @3same
 VMAX_U_3s        1111 001 1 0 . .. .... .... 0110 . . . 0 .... @3same
diff --git a/target/arm/tcg/gengvec.c b/target/arm/tcg/gengvec.c
index 63c3ec2e73..6dc96269d5 100644
--- a/target/arm/tcg/gengvec.c
+++ b/target/arm/tcg/gengvec.c
@@ -1264,6 +1264,30 @@ void gen_neon_uqshl(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
                        opr_sz, max_sz, 0, fns[vece]);
 }
 
+void gen_neon_sqrshl(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
+                     uint32_t rm_ofs, uint32_t opr_sz, uint32_t max_sz)
+{
+    static gen_helper_gvec_3_ptr * const fns[] = {
+        gen_helper_neon_sqrshl_b, gen_helper_neon_sqrshl_h,
+        gen_helper_neon_sqrshl_s, gen_helper_neon_sqrshl_d,
+    };
+    tcg_debug_assert(vece <= MO_64);
+    tcg_gen_gvec_3_ptr(rd_ofs, rn_ofs, rm_ofs, tcg_env,
+                       opr_sz, max_sz, 0, fns[vece]);
+}
+
+void gen_neon_uqrshl(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
+                     uint32_t rm_ofs, uint32_t opr_sz, uint32_t max_sz)
+{
+    static gen_helper_gvec_3_ptr * const fns[] = {
+        gen_helper_neon_uqrshl_b, gen_helper_neon_uqrshl_h,
+        gen_helper_neon_uqrshl_s, gen_helper_neon_uqrshl_d,
+    };
+    tcg_debug_assert(vece <= MO_64);
+    tcg_gen_gvec_3_ptr(rd_ofs, rn_ofs, rm_ofs, tcg_env,
+                       opr_sz, max_sz, 0, fns[vece]);
+}
+
 void gen_uqadd_bhs(TCGv_i64 res, TCGv_i64 qc, TCGv_i64 a, TCGv_i64 b, MemOp esz)
 {
     uint64_t max = MAKE_64BIT_MASK(0, 8 << esz);
diff --git a/target/arm/tcg/neon_helper.c b/target/arm/tcg/neon_helper.c
index 88301f0dcb..b29a7c725f 100644
--- a/target/arm/tcg/neon_helper.c
+++ b/target/arm/tcg/neon_helper.c
@@ -435,11 +435,23 @@ uint64_t HELPER(neon_qshlu_s64)(CPUARMState *env, uint64_t val, uint64_t shift)
 #define NEON_FN(dest, src1, src2) \
     (dest = do_uqrshl_bhs(src1, (int8_t)src2, 8, true, env->vfp.qc))
 NEON_VOP_ENV(qrshl_u8, neon_u8, 4)
+NEON_GVEC_VOP2_ENV(neon_uqrshl_b, uint8_t)
 #undef NEON_FN
 
 #define NEON_FN(dest, src1, src2) \
     (dest = do_uqrshl_bhs(src1, (int8_t)src2, 16, true, env->vfp.qc))
 NEON_VOP_ENV(qrshl_u16, neon_u16, 2)
+NEON_GVEC_VOP2_ENV(neon_uqrshl_h, uint16_t)
+#undef NEON_FN
+
+#define NEON_FN(dest, src1, src2) \
+    (dest = do_uqrshl_bhs(src1, (int8_t)src2, 32, true, env->vfp.qc))
+NEON_GVEC_VOP2_ENV(neon_uqrshl_s, uint32_t)
+#undef NEON_FN
+
+#define NEON_FN(dest, src1, src2) \
+    (dest = do_uqrshl_d(src1, (int8_t)src2, true, env->vfp.qc))
+NEON_GVEC_VOP2_ENV(neon_uqrshl_d, uint64_t)
 #undef NEON_FN
 
 uint32_t HELPER(neon_qrshl_u32)(CPUARMState *env, uint32_t val, uint32_t shift)
@@ -455,11 +467,23 @@ uint64_t HELPER(neon_qrshl_u64)(CPUARMState *env, uint64_t val, uint64_t shift)
 #define NEON_FN(dest, src1, src2) \
     (dest = do_sqrshl_bhs(src1, (int8_t)src2, 8, true, env->vfp.qc))
 NEON_VOP_ENV(qrshl_s8, neon_s8, 4)
+NEON_GVEC_VOP2_ENV(neon_sqrshl_b, int8_t)
 #undef NEON_FN
 
 #define NEON_FN(dest, src1, src2) \
     (dest = do_sqrshl_bhs(src1, (int8_t)src2, 16, true, env->vfp.qc))
 NEON_VOP_ENV(qrshl_s16, neon_s16, 2)
+NEON_GVEC_VOP2_ENV(neon_sqrshl_h, int16_t)
+#undef NEON_FN
+
+#define NEON_FN(dest, src1, src2) \
+    (dest = do_sqrshl_bhs(src1, (int8_t)src2, 32, true, env->vfp.qc))
+NEON_GVEC_VOP2_ENV(neon_sqrshl_s, int32_t)
+#undef NEON_FN
+
+#define NEON_FN(dest, src1, src2) \
+    (dest = do_sqrshl_d(src1, (int8_t)src2, true, env->vfp.qc))
+NEON_GVEC_VOP2_ENV(neon_sqrshl_d, int64_t)
 #undef NEON_FN
 
 uint32_t HELPER(neon_qrshl_s32)(CPUARMState *env, uint32_t val, uint32_t shift)
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 97bd69eb3f..b9d577f620 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -10968,6 +10968,13 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
     }
 
     switch (opcode) {
+    case 0x0b: /* SQRSHL, UQRSHL */
+        if (u) {
+            gen_gvec_fn3(s, is_q, rd, rn, rm, gen_neon_uqrshl, size);
+        } else {
+            gen_gvec_fn3(s, is_q, rd, rn, rm, gen_neon_sqrshl, size);
+        }
+        return;
     case 0x0c: /* SMAX, UMAX */
         if (u) {
             gen_gvec_fn3(s, is_q, rd, rn, rm, tcg_gen_gvec_umax, size);
@@ -11103,16 +11110,6 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
                 genfn = fns[size][u];
                 break;
             }
-            case 0xb: /* SQRSHL, UQRSHL */
-            {
-                static NeonGenTwoOpEnvFn * const fns[3][2] = {
-                    { gen_helper_neon_qrshl_s8, gen_helper_neon_qrshl_u8 },
-                    { gen_helper_neon_qrshl_s16, gen_helper_neon_qrshl_u16 },
-                    { gen_helper_neon_qrshl_s32, gen_helper_neon_qrshl_u32 },
-                };
-                genenvfn = fns[size][u];
-                break;
-            }
             default:
                 g_assert_not_reached();
             }
diff --git a/target/arm/tcg/translate-neon.c b/target/arm/tcg/translate-neon.c
index a3eec47092..5f1576393e 100644
--- a/target/arm/tcg/translate-neon.c
+++ b/target/arm/tcg/translate-neon.c
@@ -798,6 +798,8 @@ DO_3SAME(VRSHL_S, gen_gvec_srshl)
 DO_3SAME(VRSHL_U, gen_gvec_urshl)
 DO_3SAME(VQSHL_S, gen_neon_sqshl)
 DO_3SAME(VQSHL_U, gen_neon_uqshl)
+DO_3SAME(VQRSHL_S, gen_neon_sqrshl)
+DO_3SAME(VQRSHL_U, gen_neon_uqrshl)
 
 /* These insns are all gvec_bitsel but with the inputs in various orders. */
 #define DO_3SAME_BITSEL(INSN, O1, O2, O3)                               \
@@ -916,26 +918,6 @@ DO_SHA2(SHA256H, gen_helper_crypto_sha256h)
 DO_SHA2(SHA256H2, gen_helper_crypto_sha256h2)
 DO_SHA2(SHA256SU1, gen_helper_crypto_sha256su1)
 
-#define DO_3SAME_64(INSN, FUNC)                                         \
-    static void gen_##INSN##_3s(unsigned vece, uint32_t rd_ofs,         \
-                                uint32_t rn_ofs, uint32_t rm_ofs,       \
-                                uint32_t oprsz, uint32_t maxsz)         \
-    {                                                                   \
-        static const GVecGen3 op = { .fni8 = FUNC };                    \
-        tcg_gen_gvec_3(rd_ofs, rn_ofs, rm_ofs, oprsz, maxsz, &op);      \
-    }                                                                   \
-    DO_3SAME(INSN, gen_##INSN##_3s)
-
-#define DO_3SAME_64_ENV(INSN, FUNC)                                     \
-    static void gen_##INSN##_elt(TCGv_i64 d, TCGv_i64 n, TCGv_i64 m)    \
-    {                                                                   \
-        FUNC(d, tcg_env, n, m);                                         \
-    }                                                                   \
-    DO_3SAME_64(INSN, gen_##INSN##_elt)
-
-DO_3SAME_64_ENV(VQRSHL_S64, gen_helper_neon_qrshl_s64)
-DO_3SAME_64_ENV(VQRSHL_U64, gen_helper_neon_qrshl_u64)
-
 #define DO_3SAME_32(INSN, FUNC)                                         \
     static void gen_##INSN##_3s(unsigned vece, uint32_t rd_ofs,         \
                                 uint32_t rn_ofs, uint32_t rm_ofs,       \
@@ -969,30 +951,6 @@ DO_3SAME_64_ENV(VQRSHL_U64, gen_helper_neon_qrshl_u64)
         FUNC(d, tcg_env, n, m);                                         \
     }
 
-#define DO_3SAME_32_ENV(INSN, FUNC)                                     \
-    WRAP_ENV_FN(gen_##INSN##_tramp8, gen_helper_neon_##FUNC##8);        \
-    WRAP_ENV_FN(gen_##INSN##_tramp16, gen_helper_neon_##FUNC##16);      \
-    WRAP_ENV_FN(gen_##INSN##_tramp32, gen_helper_neon_##FUNC##32);      \
-    static void gen_##INSN##_3s(unsigned vece, uint32_t rd_ofs,         \
-                                uint32_t rn_ofs, uint32_t rm_ofs,       \
-                                uint32_t oprsz, uint32_t maxsz)         \
-    {                                                                   \
-        static const GVecGen3 ops[4] = {                                \
-            { .fni4 = gen_##INSN##_tramp8 },                            \
-            { .fni4 = gen_##INSN##_tramp16 },                           \
-            { .fni4 = gen_##INSN##_tramp32 },                           \
-            { 0 },                                                      \
-        };                                                              \
-        tcg_gen_gvec_3(rd_ofs, rn_ofs, rm_ofs, oprsz, maxsz, &ops[vece]); \
-    }                                                                   \
-    static bool trans_##INSN##_3s(DisasContext *s, arg_3same *a)        \
-    {                                                                   \
-        if (a->size > 2) {                                              \
-            return false;                                               \
-        }                                                               \
-        return do_3same(s, a, gen_##INSN##_3s);                         \
-    }
-
 DO_3SAME_32(VHADD_S, hadd_s)
 DO_3SAME_32(VHADD_U, hadd_u)
 DO_3SAME_32(VHSUB_S, hsub_s)
@@ -1000,9 +958,6 @@ DO_3SAME_32(VHSUB_U, hsub_u)
 DO_3SAME_32(VRHADD_S, rhadd_s)
 DO_3SAME_32(VRHADD_U, rhadd_u)
 
-DO_3SAME_32_ENV(VQRSHL_S, qrshl_s)
-DO_3SAME_32_ENV(VQRSHL_U, qrshl_u)
-
 #define DO_3SAME_VQDMULH(INSN, FUNC)                                    \
     WRAP_ENV_FN(gen_##INSN##_tramp16, gen_helper_neon_##FUNC##_s16);    \
     WRAP_ENV_FN(gen_##INSN##_tramp32, gen_helper_neon_##FUNC##_s32);    \
-- 
2.34.1


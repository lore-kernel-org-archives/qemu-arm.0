Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1283342lfm;
        Wed, 17 Jun 2020 22:07:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwy69zlhsW7KbWG2QbZAysgQevyln7LHUaihbfznN+az7ivSrddfmOPgyd6m4NGW9YHPCk2
X-Received: by 2002:a25:ca8d:: with SMTP id a135mr3326187ybg.382.1592456824780;
        Wed, 17 Jun 2020 22:07:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592456824; cv=none;
        d=google.com; s=arc-20160816;
        b=ZgPuiEoFUf3acp/fyMJczj722+OwCwL0oRyRQVb05/kjC5lrig1TmPPinnEeb2IyHH
         ZmUU2bbf3BzAVqfaSHuBnbCZK4wponQjKFXxH8Facy88ICT3ibhc4R5ETxZDS6gSfJl2
         hRcBZS1GPTeWsl0NjZi7kX1lDV4ABYRitghA+jl2D2YD7i2UfD0f9fxUzUB83SWOmYVY
         kR3DbybL6xw3MDtTm2CHYEtBMkuQUzZSdLipdlT0+KaC+W3h+gbRPspcims2ovBkGr7A
         44aMd4b8JJ+gSeVr7pF7xg14649YwHookv6C++AeYdIUZeXQWjYat3QGIMR3nOuLp9ZF
         BO5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=o5UxMQlEbCp0bZrIl6jzJ8Pv5IyNahPBxr+L8zTN7XQ=;
        b=hDiH4LWEsAOUZR4K/J9P9L+SGfSQ50qZ3jKv9A0dpNIRyiAvBVi2jjwZzP5Sol45xQ
         Pw9rkXYOyIlsJMffMZt1wkfxbY8v8lvnyzAJeQ+qNk4xjrAjOpsL5LfU1jiVNkAa/eSn
         6ZdRdrP/y4HTtBCnN09R8RL/8KnI9/lgB8nt/0+PxOA+PSJ8YTieksk/FgC4pro7/Ff+
         yE7uFpIopNCQWj8LYpa2WzdJmIgJEFLCQyA4lk/tPJ5BmYEjHQVcKf8z1o8+fCVUL4lZ
         c2sBAXZhcF87TiJ7P5l/V5XgJtc/tuX8OPO70NhSbucAJT5nuCKjcQdi69DcHOjBvS7X
         qPnw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=a3DlFLHV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p13si1561873ybc.326.2020.06.17.22.07.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jun 2020 22:07:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=a3DlFLHV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlmlU-000365-3M
	for alex.bennee@linaro.org; Thu, 18 Jun 2020 01:07:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlmDp-00053V-R0
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:32:19 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:40716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlmDl-0003Ri-V8
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:32:17 -0400
Received: by mail-pg1-x542.google.com with SMTP id e18so2336723pgn.7
 for <qemu-arm@nongnu.org>; Wed, 17 Jun 2020 21:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o5UxMQlEbCp0bZrIl6jzJ8Pv5IyNahPBxr+L8zTN7XQ=;
 b=a3DlFLHVetq8LdLK+0lfBJw6sm/U1JgvT4y1Y+gmgNke/NE/vq3geyyzmoCpIL7rgH
 IAQYu9q4nkl4ss8hml5xLh8YneYGFLKJ6hbmMZt7dHlNAKRYhiYMW/awiGsvzzu0DHDo
 GoHP/DXu8h8MIXIxY1zoVIjwFznufFg0MD3VDLBby9fWXnzeBIuzQvD1XHorxtwFe/AA
 KOfIEooICsrpidYuKgyxqg/2oW4aRxsqBBMzOaWffQTItZNXrg5mwfdMUN5BKM1EdNbx
 TosK/fdnY+hcC3pQYI/wLymYqBPxPhrnFqZ+m4cWbOuXwlgwV3HS9kfVrV4bb3mlULWO
 vtEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o5UxMQlEbCp0bZrIl6jzJ8Pv5IyNahPBxr+L8zTN7XQ=;
 b=D2/N2aEivDoTx330D8+sxRkjKsDz8S7Kf11dkeNQ2e4VLrDGqEiAJwHL1/3nFqmUlJ
 gv2b9wi2k1PcBSNbKIA8NHrWK52DN/j/j6U80urW/7fTjGa43e81Ph8UgJZLAYkmyDoY
 wTV5jndeL76dS+w1ZpFUIePVJhOG0dkYjPUsIxElF+4apILyRiw1FMmFEngjl5V61B3J
 SblNz08LEAMOv0atXCKYvzN/GpcquuONJ+rHbqtpiEiIDYN64w9Q4pLjHLpRI1vvC7Bl
 V5/wrtrqPDjJqMO429FOPqOfogLAiUz1hsf2U33RIa4v5D/dWMyFZVWrxiiYXGSR6kaT
 Fu8Q==
X-Gm-Message-State: AOAM531UTyHUGubW5XdX1GqhoaSmSzqXCYmfhPq18x1aNq8Qfo/W5NKK
 Svdh7hUblcL4Lr24OpqnaMe0NA==
X-Received: by 2002:a62:2b0c:: with SMTP id r12mr1996638pfr.122.1592454727210; 
 Wed, 17 Jun 2020 21:32:07 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id s15sm1162840pgv.5.2020.06.17.21.32.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 21:32:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 079/100] target/arm: Implement SVE2 signed saturating
 doubling multiply high
Date: Wed, 17 Jun 2020 21:26:23 -0700
Message-Id: <20200618042644.1685561-80-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618042644.1685561-1-richard.henderson@linaro.org>
References: <20200618042644.1685561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::542;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x542.google.com
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
X-TUID: uPlB9cMQBWCm

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h        | 10 +++++
 target/arm/sve.decode      |  4 ++
 target/arm/translate-sve.c | 18 ++++++++
 target/arm/vec_helper.c    | 84 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 116 insertions(+)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 7964d299f6..ce6ff95672 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -807,6 +807,16 @@ DEF_HELPER_FLAGS_5(gvec_mls_idx_s, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_5(gvec_mls_idx_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(sve2_sqdmulh_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqdmulh_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqdmulh_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqdmulh_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_sqrdmulh_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqrdmulh_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqrdmulh_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqrdmulh_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
 #ifdef TARGET_AARCH64
 #include "helper-a64.h"
 #include "helper-sve.h"
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 400940a18d..6879870cc1 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1214,6 +1214,10 @@ SMULH_zzz       00000100 .. 1 ..... 0110 10 ..... .....  @rd_rn_rm
 UMULH_zzz       00000100 .. 1 ..... 0110 11 ..... .....  @rd_rn_rm
 PMUL_zzz        00000100 00 1 ..... 0110 01 ..... .....  @rd_rn_rm_e0
 
+# SVE2 signed saturating doubling multiply high (unpredicated)
+SQDMULH_zzz     00000100 .. 1 ..... 0111 00 ..... .....  @rd_rn_rm
+SQRDMULH_zzz    00000100 .. 1 ..... 0111 01 ..... .....  @rd_rn_rm
+
 ### SVE2 Integer - Predicated
 
 SADALP_zpzz     01000100 .. 000 100 101 ... ..... .....  @rdm_pg_rn
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 4246d721d9..a13d2f5711 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -5990,6 +5990,24 @@ static bool trans_PMUL_zzz(DisasContext *s, arg_rrr_esz *a)
     return do_sve2_zzz_ool(s, a, gen_helper_gvec_pmul_b);
 }
 
+static bool trans_SQDMULH_zzz(DisasContext *s, arg_rrr_esz *a)
+{
+    static gen_helper_gvec_3 * const fns[4] = {
+        gen_helper_sve2_sqdmulh_b, gen_helper_sve2_sqdmulh_h,
+        gen_helper_sve2_sqdmulh_s, gen_helper_sve2_sqdmulh_d,
+    };
+    return do_sve2_zzz_ool(s, a, fns[a->esz]);
+}
+
+static bool trans_SQRDMULH_zzz(DisasContext *s, arg_rrr_esz *a)
+{
+    static gen_helper_gvec_3 * const fns[4] = {
+        gen_helper_sve2_sqrdmulh_b, gen_helper_sve2_sqrdmulh_h,
+        gen_helper_sve2_sqrdmulh_s, gen_helper_sve2_sqrdmulh_d,
+    };
+    return do_sve2_zzz_ool(s, a, fns[a->esz]);
+}
+
 /*
  * SVE2 Integer - Predicated
  */
diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index fb8596c1fd..766555a5d6 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -81,6 +81,26 @@ void HELPER(sve2_sqrdmlsh_b)(void *vd, void *vn, void *vm,
     }
 }
 
+void HELPER(sve2_sqdmulh_b)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    int8_t *d = vd, *n = vn, *m = vm;
+
+    for (i = 0; i < opr_sz; ++i) {
+        d[i] = do_sqrdmlah_b(n[i], m[i], 0, false, false);
+    }
+}
+
+void HELPER(sve2_sqrdmulh_b)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    int8_t *d = vd, *n = vn, *m = vm;
+
+    for (i = 0; i < opr_sz; ++i) {
+        d[i] = do_sqrdmlah_b(n[i], m[i], 0, false, true);
+    }
+}
+
 /* Signed saturating rounding doubling multiply-accumulate high half, 16-bit */
 int16_t do_sqrdmlah_h(int16_t src1, int16_t src2, int16_t src3,
                       bool neg, bool round, uint32_t *sat)
@@ -174,6 +194,28 @@ void HELPER(sve2_sqrdmlsh_h)(void *vd, void *vn, void *vm,
     }
 }
 
+void HELPER(sve2_sqdmulh_h)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    int16_t *d = vd, *n = vn, *m = vm;
+    uint32_t discard;
+
+    for (i = 0; i < opr_sz / 2; ++i) {
+        d[i] = do_sqrdmlah_h(n[i], m[i], 0, false, false, &discard);
+    }
+}
+
+void HELPER(sve2_sqrdmulh_h)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    int16_t *d = vd, *n = vn, *m = vm;
+    uint32_t discard;
+
+    for (i = 0; i < opr_sz / 2; ++i) {
+        d[i] = do_sqrdmlah_h(n[i], m[i], 0, false, true, &discard);
+    }
+}
+
 /* Signed saturating rounding doubling multiply-accumulate high half, 32-bit */
 int32_t do_sqrdmlah_s(int32_t src1, int32_t src2, int32_t src3,
                       bool neg, bool round, uint32_t *sat)
@@ -261,6 +303,28 @@ void HELPER(sve2_sqrdmlsh_s)(void *vd, void *vn, void *vm,
     }
 }
 
+void HELPER(sve2_sqdmulh_s)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    int32_t *d = vd, *n = vn, *m = vm;
+    uint32_t discard;
+
+    for (i = 0; i < opr_sz / 4; ++i) {
+        d[i] = do_sqrdmlah_s(n[i], m[i], 0, false, false, &discard);
+    }
+}
+
+void HELPER(sve2_sqrdmulh_s)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    int32_t *d = vd, *n = vn, *m = vm;
+    uint32_t discard;
+
+    for (i = 0; i < opr_sz / 4; ++i) {
+        d[i] = do_sqrdmlah_s(n[i], m[i], 0, false, true, &discard);
+    }
+}
+
 /* Signed saturating rounding doubling multiply-accumulate high half, 64-bit */
 static int64_t do_sat128_d(Int128 r)
 {
@@ -320,6 +384,26 @@ void HELPER(sve2_sqrdmlsh_d)(void *vd, void *vn, void *vm,
     }
 }
 
+void HELPER(sve2_sqdmulh_d)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    int32_t *d = vd, *n = vn, *m = vm;
+
+    for (i = 0; i < opr_sz / 8; ++i) {
+        d[i] = do_sqrdmlah_d(n[i], m[i], 0, false, false);
+    }
+}
+
+void HELPER(sve2_sqrdmulh_d)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    int32_t *d = vd, *n = vn, *m = vm;
+
+    for (i = 0; i < opr_sz / 8; ++i) {
+        d[i] = do_sqrdmlah_d(n[i], m[i], 0, false, true);
+    }
+}
+
 /* Integer 8 and 16-bit dot-product.
  *
  * Note that for the loops herein, host endianness does not matter
-- 
2.25.1


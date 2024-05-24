Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp1994241ejb;
        Fri, 24 May 2024 16:26:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUnnfNCLSX0LygYQPSt9aX22TdwD9tQSl0GroQgBdSj3mp4yiXxcxwbUvzqONQhn7lcljZGcRwemq6J2S6he3VqEL2UyuFg
X-Google-Smtp-Source: AGHT+IGoTcT7Czx8RKWjemzjgy2frJkBmBqE+2VsKjGd1UG6/Ec9/P2FJPpjrY/wJu/cBqTQZz01
X-Received: by 2002:a05:622a:1a22:b0:43a:1d94:c573 with SMTP id d75a77b69052e-43fafb4e899mr74943311cf.22.1716593213143;
        Fri, 24 May 2024 16:26:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716593213; cv=none;
        d=google.com; s=arc-20160816;
        b=M7/QqiUcEsfq6dE6qlza9FjrS5N9flsZY2t6hy1pRISw3zPnEhyNJDC8Ewz3hSR5XD
         v3MRi+KVN5/Iv75x6hBd7jdK1gggyzyynpe3rdo2p7ITcoFRB/LN5h5CgrPPln+zt9CB
         szcZvTjf3pPwU7UQCNMoJGwCeadWnqP+QgkPL7JELaO5vPpfh+Fjkkwun0AS+dM4NLKQ
         OmNaf9fF7ptMNjIzgFcfYLfUvOodFQ5o9XpKbpelrzZoLMYiWdWBaMskrwxFOjhDmLu4
         D64izZ+k7Dh5+LJYNGHrxzrxMHdF/u55P9twG1W18YdgOmPGGjGAOYBLIPl8x5+gljHE
         JMYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=iiPNnnZVNjS8p5m66evevlQPVHteoJ1u5PCLuHV/bYg=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=DB8WreI5856UlfGMI0F0YrysLw7jveO8LSWpPKsTQ3W5V0agtKHbOw4abE64GPmbqG
         vSYo1f9vj6dUt4WhkYjGzfuG6f3HMkQj79DfUPwNNZ/T89wqDwHpzBHhR+SHUINmBP1C
         LpUbP47g7lTxRsP0/OB9ZUOYG2xZzt0TjXQ8tRB+6ck9+NbMifyjaG1oGWczao+q50mD
         isgPPxCfUgt0kNT+Um9XtMzB+lBJKfSEiYc1FvNVQkAtOaouka6M6cOw5ZSVIbo3aobP
         JDJpODtfk/IicFPQZyhPVtvW+RWRFZLljR4I1OpC2WDJnDLWkpkkQNTmiHgKcEF0KYAU
         0hsA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i4Zk7F4A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-43fb17ba725si35056871cf.157.2024.05.24.16.26.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 May 2024 16:26:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i4Zk7F4A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sAeId-0001gH-6x; Fri, 24 May 2024 19:26:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sAeHw-0007Ri-Rs
 for qemu-arm@nongnu.org; Fri, 24 May 2024 19:25:29 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sAeHj-0006ts-D7
 for qemu-arm@nongnu.org; Fri, 24 May 2024 19:25:28 -0400
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-6f4ed9dc7beso2815223b3a.1
 for <qemu-arm@nongnu.org>; Fri, 24 May 2024 16:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716593111; x=1717197911; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iiPNnnZVNjS8p5m66evevlQPVHteoJ1u5PCLuHV/bYg=;
 b=i4Zk7F4AR79Y8X36qqvPBMGA1Tvy19P4kPTNDZGpgmDap8c3vxmXOx63tXgFNw0Iuj
 nvls3LU2azVhW7pgFCKi+p6Y0tgKUafKI935uhpKrCI1EP4HsGRHuANS+IJFDUMzU24b
 eBup8gyv9ihZQhLwE2nGu1qxhnjApqj/X6WBMhHnnpOfiL8ckriI2b4bAXe/+RLwffFt
 rOO/QdjFBVgYu7YSR4iNkJ4ynHPDCVndSWH1F5wYx5MF5cb05dRzQF2WsNAbZYU8nchg
 nWlZBmxw2zJOPXyOYvdPc0BPX4HliC/DpqLazxV+g2Cc6pmFgAFGUX93qHlAEe8imhRw
 oQJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716593111; x=1717197911;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iiPNnnZVNjS8p5m66evevlQPVHteoJ1u5PCLuHV/bYg=;
 b=txXXgWgYWUmIJueCvpSp691TiFu/2Eq2gC0kyComMg7M6uWyedBr/bb0SIDU/laStH
 QzQmkyk2NIUd/MwK6yHy778umn/VnGvdimHGOX/RqxEieCWu6kcSk46t54wR3GJtW+Cg
 ldLlDLECJQGBN4+7vUoDvyM7/DchM6R4rn3X+2DHEevRy5tGNwODSLhFIaqBOBDxjHYc
 tmCEJzdfcum83QHmUT6kZfeHg7m3atWrV8wybUNt9hv3oEUDLh7OeHN+zzwFtcQJIVvi
 H0n2vj5WJDu7WWGfwIryEDc4UUtzOX6n7vaOEuvhZceHKtYbFigwFoFjbuw+AItXdMV0
 Ji5Q==
X-Gm-Message-State: AOJu0YxWhNs7NXNUCNrLREn4iyES71NpENlUHmkxlowSaSOhyI60+UN6
 6iDH+mY5qW991O89HRPwLPyuMaYbtrzY0Yg6xTN1J47BsJDmxM7xmkiik6E3SQcS4AUB5sfmeAk
 g
X-Received: by 2002:a05:6a00:730f:b0:6f8:b773:ca3e with SMTP id
 d2e1a72fcca58-6f8b773cd29mr5513611b3a.12.1716593110636; 
 Fri, 24 May 2024 16:25:10 -0700 (PDT)
Received: from stoup.. (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f8fbf2cfd1sm1591695b3a.3.2024.05.24.16.25.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 May 2024 16:25:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 54/67] target/arm: Convert SHADD, UHADD to gvec
Date: Fri, 24 May 2024 16:21:08 -0700
Message-Id: <20240524232121.284515-55-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240524232121.284515-1-richard.henderson@linaro.org>
References: <20240524232121.284515-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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
X-TUID: 8r9liGajtKAs

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h             |   6 --
 target/arm/tcg/translate.h      |   5 ++
 target/arm/tcg/gengvec.c        | 144 ++++++++++++++++++++++++++++++++
 target/arm/tcg/neon_helper.c    |  27 ------
 target/arm/tcg/translate-a64.c  |  17 ++--
 target/arm/tcg/translate-neon.c |   4 +-
 6 files changed, 158 insertions(+), 45 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 9a89c9cea7..b26bfcb079 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -268,12 +268,6 @@ DEF_HELPER_FLAGS_2(fjcvtzs, TCG_CALL_NO_RWG, i64, f64, ptr)
 DEF_HELPER_FLAGS_3(check_hcr_el2_trap, TCG_CALL_NO_WG, void, env, i32, i32)
 
 /* neon_helper.c */
-DEF_HELPER_2(neon_hadd_s8, i32, i32, i32)
-DEF_HELPER_2(neon_hadd_u8, i32, i32, i32)
-DEF_HELPER_2(neon_hadd_s16, i32, i32, i32)
-DEF_HELPER_2(neon_hadd_u16, i32, i32, i32)
-DEF_HELPER_2(neon_hadd_s32, s32, s32, s32)
-DEF_HELPER_2(neon_hadd_u32, i32, i32, i32)
 DEF_HELPER_2(neon_rhadd_s8, i32, i32, i32)
 DEF_HELPER_2(neon_rhadd_u8, i32, i32, i32)
 DEF_HELPER_2(neon_rhadd_s16, i32, i32, i32)
diff --git a/target/arm/tcg/translate.h b/target/arm/tcg/translate.h
index 048cb45ebe..dd99d76bf2 100644
--- a/target/arm/tcg/translate.h
+++ b/target/arm/tcg/translate.h
@@ -472,6 +472,11 @@ void gen_neon_sqrshl(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
 void gen_neon_uqrshl(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
                      uint32_t rm_ofs, uint32_t opr_sz, uint32_t max_sz);
 
+void gen_gvec_shadd(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
+                    uint32_t rm_ofs, uint32_t opr_sz, uint32_t max_sz);
+void gen_gvec_uhadd(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
+                    uint32_t rm_ofs, uint32_t opr_sz, uint32_t max_sz);
+
 void gen_cmtst_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b);
 void gen_ushl_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b);
 void gen_sshl_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b);
diff --git a/target/arm/tcg/gengvec.c b/target/arm/tcg/gengvec.c
index 1895c3b19f..0627cec6b2 100644
--- a/target/arm/tcg/gengvec.c
+++ b/target/arm/tcg/gengvec.c
@@ -1852,3 +1852,147 @@ void gen_gvec_uminp(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
     tcg_debug_assert(vece <= MO_32);
     tcg_gen_gvec_3_ool(rd_ofs, rn_ofs, rm_ofs, opr_sz, max_sz, 0, fns[vece]);
 }
+
+static void gen_shadd8_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b)
+{
+    TCGv_i64 t = tcg_temp_new_i64();
+
+    tcg_gen_and_i64(t, a, b);
+    tcg_gen_vec_sar8i_i64(a, a, 1);
+    tcg_gen_vec_sar8i_i64(b, b, 1);
+    tcg_gen_andi_i64(t, t, dup_const(MO_8, 1));
+    tcg_gen_vec_add8_i64(d, a, b);
+    tcg_gen_vec_add8_i64(d, d, t);
+}
+
+static void gen_shadd16_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b)
+{
+    TCGv_i64 t = tcg_temp_new_i64();
+
+    tcg_gen_and_i64(t, a, b);
+    tcg_gen_vec_sar16i_i64(a, a, 1);
+    tcg_gen_vec_sar16i_i64(b, b, 1);
+    tcg_gen_andi_i64(t, t, dup_const(MO_16, 1));
+    tcg_gen_vec_add16_i64(d, a, b);
+    tcg_gen_vec_add16_i64(d, d, t);
+}
+
+static void gen_shadd_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b)
+{
+    TCGv_i32 t = tcg_temp_new_i32();
+
+    tcg_gen_and_i32(t, a, b);
+    tcg_gen_sari_i32(a, a, 1);
+    tcg_gen_sari_i32(b, b, 1);
+    tcg_gen_andi_i32(t, t, 1);
+    tcg_gen_add_i32(d, a, b);
+    tcg_gen_add_i32(d, d, t);
+}
+
+static void gen_shadd_vec(unsigned vece, TCGv_vec d, TCGv_vec a, TCGv_vec b)
+{
+    TCGv_vec t = tcg_temp_new_vec_matching(d);
+
+    tcg_gen_and_vec(vece, t, a, b);
+    tcg_gen_sari_vec(vece, a, a, 1);
+    tcg_gen_sari_vec(vece, b, b, 1);
+    tcg_gen_and_vec(vece, t, t, tcg_constant_vec_matching(d, vece, 1));
+    tcg_gen_add_vec(vece, d, a, b);
+    tcg_gen_add_vec(vece, d, d, t);
+}
+
+void gen_gvec_shadd(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
+                    uint32_t rm_ofs, uint32_t opr_sz, uint32_t max_sz)
+{
+    static const TCGOpcode vecop_list[] = {
+        INDEX_op_sari_vec, INDEX_op_add_vec, 0
+    };
+    static const GVecGen3 g[] = {
+        { .fni8 = gen_shadd8_i64,
+          .fniv = gen_shadd_vec,
+          .opt_opc = vecop_list,
+          .vece = MO_8 },
+        { .fni8 = gen_shadd16_i64,
+          .fniv = gen_shadd_vec,
+          .opt_opc = vecop_list,
+          .vece = MO_16 },
+        { .fni4 = gen_shadd_i32,
+          .fniv = gen_shadd_vec,
+          .opt_opc = vecop_list,
+          .vece = MO_32 },
+    };
+    tcg_debug_assert(vece <= MO_32);
+    tcg_gen_gvec_3(rd_ofs, rn_ofs, rm_ofs, opr_sz, max_sz, &g[vece]);
+}
+
+static void gen_uhadd8_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b)
+{
+    TCGv_i64 t = tcg_temp_new_i64();
+
+    tcg_gen_and_i64(t, a, b);
+    tcg_gen_vec_shr8i_i64(a, a, 1);
+    tcg_gen_vec_shr8i_i64(b, b, 1);
+    tcg_gen_andi_i64(t, t, dup_const(MO_8, 1));
+    tcg_gen_vec_add8_i64(d, a, b);
+    tcg_gen_vec_add8_i64(d, d, t);
+}
+
+static void gen_uhadd16_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b)
+{
+    TCGv_i64 t = tcg_temp_new_i64();
+
+    tcg_gen_and_i64(t, a, b);
+    tcg_gen_vec_shr16i_i64(a, a, 1);
+    tcg_gen_vec_shr16i_i64(b, b, 1);
+    tcg_gen_andi_i64(t, t, dup_const(MO_16, 1));
+    tcg_gen_vec_add16_i64(d, a, b);
+    tcg_gen_vec_add16_i64(d, d, t);
+}
+
+static void gen_uhadd_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b)
+{
+    TCGv_i32 t = tcg_temp_new_i32();
+
+    tcg_gen_and_i32(t, a, b);
+    tcg_gen_shri_i32(a, a, 1);
+    tcg_gen_shri_i32(b, b, 1);
+    tcg_gen_andi_i32(t, t, 1);
+    tcg_gen_add_i32(d, a, b);
+    tcg_gen_add_i32(d, d, t);
+}
+
+static void gen_uhadd_vec(unsigned vece, TCGv_vec d, TCGv_vec a, TCGv_vec b)
+{
+    TCGv_vec t = tcg_temp_new_vec_matching(d);
+
+    tcg_gen_and_vec(vece, t, a, b);
+    tcg_gen_shri_vec(vece, a, a, 1);
+    tcg_gen_shri_vec(vece, b, b, 1);
+    tcg_gen_and_vec(vece, t, t, tcg_constant_vec_matching(d, vece, 1));
+    tcg_gen_add_vec(vece, d, a, b);
+    tcg_gen_add_vec(vece, d, d, t);
+}
+
+void gen_gvec_uhadd(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
+                    uint32_t rm_ofs, uint32_t opr_sz, uint32_t max_sz)
+{
+    static const TCGOpcode vecop_list[] = {
+        INDEX_op_shri_vec, INDEX_op_add_vec, 0
+    };
+    static const GVecGen3 g[] = {
+        { .fni8 = gen_uhadd8_i64,
+          .fniv = gen_uhadd_vec,
+          .opt_opc = vecop_list,
+          .vece = MO_8 },
+        { .fni8 = gen_uhadd16_i64,
+          .fniv = gen_uhadd_vec,
+          .opt_opc = vecop_list,
+          .vece = MO_16 },
+        { .fni4 = gen_uhadd_i32,
+          .fniv = gen_uhadd_vec,
+          .opt_opc = vecop_list,
+          .vece = MO_32 },
+    };
+    tcg_debug_assert(vece <= MO_32);
+    tcg_gen_gvec_3(rd_ofs, rn_ofs, rm_ofs, opr_sz, max_sz, &g[vece]);
+}
diff --git a/target/arm/tcg/neon_helper.c b/target/arm/tcg/neon_helper.c
index b29a7c725f..defd28a6f7 100644
--- a/target/arm/tcg/neon_helper.c
+++ b/target/arm/tcg/neon_helper.c
@@ -179,33 +179,6 @@ uint32_t HELPER(glue(neon_,name))(uint32_t arg) \
     return arg; \
 }
 
-#define NEON_FN(dest, src1, src2) dest = (src1 + src2) >> 1
-NEON_VOP(hadd_s8, neon_s8, 4)
-NEON_VOP(hadd_u8, neon_u8, 4)
-NEON_VOP(hadd_s16, neon_s16, 2)
-NEON_VOP(hadd_u16, neon_u16, 2)
-#undef NEON_FN
-
-int32_t HELPER(neon_hadd_s32)(int32_t src1, int32_t src2)
-{
-    int32_t dest;
-
-    dest = (src1 >> 1) + (src2 >> 1);
-    if (src1 & src2 & 1)
-        dest++;
-    return dest;
-}
-
-uint32_t HELPER(neon_hadd_u32)(uint32_t src1, uint32_t src2)
-{
-    uint32_t dest;
-
-    dest = (src1 >> 1) + (src2 >> 1);
-    if (src1 & src2 & 1)
-        dest++;
-    return dest;
-}
-
 #define NEON_FN(dest, src1, src2) dest = (src1 + src2 + 1) >> 1
 NEON_VOP(rhadd_s8, neon_s8, 4)
 NEON_VOP(rhadd_u8, neon_u8, 4)
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 3c6cfc2952..5f3423513d 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -10965,6 +10965,13 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
     }
 
     switch (opcode) {
+    case 0x00: /* SHADD, UHADD */
+        if (u) {
+            gen_gvec_fn3(s, is_q, rd, rn, rm, gen_gvec_uhadd, size);
+        } else {
+            gen_gvec_fn3(s, is_q, rd, rn, rm, gen_gvec_shadd, size);
+        }
+        return;
     case 0x0c: /* SMAX, UMAX */
         if (u) {
             gen_gvec_fn3(s, is_q, rd, rn, rm, tcg_gen_gvec_umax, size);
@@ -11032,16 +11039,6 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
             read_vec_element_i32(s, tcg_op2, rm, pass, MO_32);
 
             switch (opcode) {
-            case 0x0: /* SHADD, UHADD */
-            {
-                static NeonGenTwoOpFn * const fns[3][2] = {
-                    { gen_helper_neon_hadd_s8, gen_helper_neon_hadd_u8 },
-                    { gen_helper_neon_hadd_s16, gen_helper_neon_hadd_u16 },
-                    { gen_helper_neon_hadd_s32, gen_helper_neon_hadd_u32 },
-                };
-                genfn = fns[size][u];
-                break;
-            }
             case 0x2: /* SRHADD, URHADD */
             {
                 static NeonGenTwoOpFn * const fns[3][2] = {
diff --git a/target/arm/tcg/translate-neon.c b/target/arm/tcg/translate-neon.c
index 5f1576393e..29e5c4a0a3 100644
--- a/target/arm/tcg/translate-neon.c
+++ b/target/arm/tcg/translate-neon.c
@@ -841,6 +841,8 @@ DO_3SAME_NO_SZ_3(VPMAX_S, gen_gvec_smaxp)
 DO_3SAME_NO_SZ_3(VPMIN_S, gen_gvec_sminp)
 DO_3SAME_NO_SZ_3(VPMAX_U, gen_gvec_umaxp)
 DO_3SAME_NO_SZ_3(VPMIN_U, gen_gvec_uminp)
+DO_3SAME_NO_SZ_3(VHADD_S, gen_gvec_shadd)
+DO_3SAME_NO_SZ_3(VHADD_U, gen_gvec_uhadd)
 
 #define DO_3SAME_CMP(INSN, COND)                                        \
     static void gen_##INSN##_3s(unsigned vece, uint32_t rd_ofs,         \
@@ -951,8 +953,6 @@ DO_SHA2(SHA256SU1, gen_helper_crypto_sha256su1)
         FUNC(d, tcg_env, n, m);                                         \
     }
 
-DO_3SAME_32(VHADD_S, hadd_s)
-DO_3SAME_32(VHADD_U, hadd_u)
 DO_3SAME_32(VHSUB_S, hsub_s)
 DO_3SAME_32(VHSUB_U, hsub_u)
 DO_3SAME_32(VRHADD_S, rhadd_s)
-- 
2.34.1


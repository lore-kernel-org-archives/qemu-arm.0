Received: by 2002:a17:906:32d0:b0:a63:3083:985b with SMTP id k16csp189748ejk;
        Tue, 28 May 2024 13:32:50 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWqYAwTMdSolWzmAcjka1FHhjK65YgC2+gzpQrxWtEAEzekwi4iV69b4sEbK5YBsYXFfE6Su89zrgn0OSY84Ckqb0aE23qG
X-Google-Smtp-Source: AGHT+IGscFYtFCQHGqFBvm8D6106fPXrd4hNtScoITF/86L+QwGGqZWbaAusoogcx5IXaIVOTiFo
X-Received: by 2002:ac8:7f44:0:b0:43a:cc86:569e with SMTP id d75a77b69052e-43fb0e514d8mr160080991cf.9.1716928370132;
        Tue, 28 May 2024 13:32:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716928370; cv=none;
        d=google.com; s=arc-20160816;
        b=Sy4gebs91GZPd+ULLv0i1LypQFvGCXF8vKXotCcKsOei3x6W4t+JTRMIxH+yLACi79
         RUw8v8+eMNvWJMN7cunBQ7Fyjdef+G1Y2CdmnZhyi0wL4VYWAPvRRFtIK3kRYIA1lxZr
         tR4Q2FuZsWj27fjX2Mm01upKqoiLDRwJ7qCQefCHwgsIVbjZX6U+gFPJEIj8H/Q+9wbP
         78MJtJ5pleRrOASZABdlXzJ8d17nFsAONu8AX7CtfbSTYspFd7Aed/4qpntGLx8LnQfr
         L3XOeW+7nW3RY0eDiwPKCXfBzNde5vN4oLABiuPdOGPSrpCuhPglTt5HC/JD2tMbAC0d
         Yxbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=U1iC9o5z24OnIdrWSLu1LMgy2jkAKr2+Cx12yjmNl44=;
        fh=ZhBia3nL9o1nuf7SbgdYn/0pDmAeja6gisyWXi2cqYE=;
        b=Piz6VnGppOvH/Y3J/jwCXb/rEIbFplSTuw0llzUkygwr9iYKg0NlPqH6swqnYpXEpT
         IDZhDxpXv2l4chaB1hM4xwrXnHt3JO1ZvoMv4OfuhaQCN7EG+BCJ9c7fBlwVhDKlVvdO
         Hi7Yy3Ty5IyLZFj8M7QF03tHLjShCjqYIej6LL6krXIzCe351ojqXjySFoxl6cY1jszD
         4nCNDHQ9vZpkNUNubnd0P9qtIPdcWWZ61zjpwjn3AU+IzfW4A/VMLojQPQ95Z0ldTI+G
         GBp9HBJT7dvT5ZhrhdrrPrkEEB3UtBBuAdYXEkPZs31n6Dp1tNV8sk30uqGpP1t9LgcK
         OhWg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hu+P4+1Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-43fbebea945si88401561cf.138.2024.05.28.13.32.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 May 2024 13:32:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hu+P4+1Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sC3Tk-00039y-Q1; Tue, 28 May 2024 16:31:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sC3Tb-00031t-Lw
 for qemu-arm@nongnu.org; Tue, 28 May 2024 16:31:19 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sC3TM-0003hM-W4
 for qemu-arm@nongnu.org; Tue, 28 May 2024 16:31:19 -0400
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-6f6bddf57f6so1299515b3a.0
 for <qemu-arm@nongnu.org>; Tue, 28 May 2024 13:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716928264; x=1717533064; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U1iC9o5z24OnIdrWSLu1LMgy2jkAKr2+Cx12yjmNl44=;
 b=hu+P4+1ZDSdUzhyTO0viG48rwNhxvLy+Ya0j/stx8KzD/mJ8xuMo2gamiAk6Zdv+ci
 re18KfplgJZ6VCC6qDbWAIuWtKH+lXEyCYULb2oSyxv0rNhts0hUWSNbrcAyy0NTvh1Q
 NhZzyz59osqCnHgu94bNgh+kEkQ2ddL16cM4z/qwPOx9r3+ETUGUFpwta78U+dTey1he
 Nr4PFjL/lmJu/4oYIv2/XIfnaEKrSvqdJgIajnEr+dLJcy514m1Dd0XQ/0k2HE9J7gH6
 OfuEeIQ7gbDS+BuEjznLZS13BnXlUDfK2qaF/AWjjS/PKF3nc+LBEbotAaCX4o8haReN
 +bbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716928264; x=1717533064;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U1iC9o5z24OnIdrWSLu1LMgy2jkAKr2+Cx12yjmNl44=;
 b=o11CPjjPnhymXsdYlBMSvDg9ywDqvuy7/zNmGClB39dHAGxJWVV6KJpgQ1BREhX2Aa
 C/cOtM0/IvbagFVGx8EqJAuwiZKPlfehenw7k+MYRxc1KX1NUhktOw7/OboPc8sgqWLh
 VqxQfjb8OjyXCfK+Bprc5NpuHRF+3725/MlRpJYVGmbR9GfHk3dH8KmmznLO/uRkcAi9
 rkVT+jISIrMyEd7WlK+GaphexFCujdIj8M34cRBMlz8PgfAgIXu+f/YEzSQCDfkqcfk8
 8AuGXjqv427jpk3mHquXO6RTgsV/IpiuWuUsHZHYjNvQWj2nRlg5rQ220mXVGQW1BZAj
 Vy9w==
X-Gm-Message-State: AOJu0YwcPiqJt6LbhA49AUCP2Pad0aE2qkWv873YggS25rxXg0zfJ+om
 xU7e5Hv5vHCqOp+ct9w0c+yZE78X5YUmdpS2pZUxgAC9P8uJbjkqLimvF04dlrs=
X-Received: by 2002:a05:6a00:1c97:b0:6ea:bdbc:6a4 with SMTP id
 d2e1a72fcca58-6f8f34baae1mr13385754b3a.13.1716928263657; 
 Tue, 28 May 2024 13:31:03 -0700 (PDT)
Received: from stoup.. (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f8fbd3dbe9sm7042036b3a.10.2024.05.28.13.31.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 May 2024 13:31:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 20/33] target/arm: Convert SHADD, UHADD to gvec
Date: Tue, 28 May 2024 13:30:31 -0700
Message-Id: <20240528203044.612851-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240528203044.612851-1-richard.henderson@linaro.org>
References: <20240528203044.612851-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: UsoUZVRQPDqa

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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
index 2451d23823..c0627a787b 100644
--- a/target/arm/tcg/gengvec.c
+++ b/target/arm/tcg/gengvec.c
@@ -1861,3 +1861,147 @@ void gen_gvec_uminp(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
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


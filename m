Received: by 2002:a17:907:a09:b0:a52:4db9:938b with SMTP id bb9csp1271369ejc;
        Sun, 5 May 2024 18:10:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV63qbwidkp5lRVdQPD/UkiRaiItHibcC9I78UgdjsVH0hBqH38UD0HxbZOva/kRIIn9LHLl8EWpf/gy24eCcwesFs3XjVo
X-Google-Smtp-Source: AGHT+IERqr9UM6HeQtdKF4ixVNcbq/a3dFmbzbHk6Z8LaVIxRhe0RrPn2jgbRPR8cfFKhiDgY3e9
X-Received: by 2002:a05:6214:20ea:b0:6a0:c929:782f with SMTP id 10-20020a05621420ea00b006a0c929782fmr10546573qvk.35.1714957802643;
        Sun, 05 May 2024 18:10:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714957802; cv=none;
        d=google.com; s=arc-20160816;
        b=ef0+KvI8CWviIDztvyVpj/cBmoeCEkTNU34yxE2sq9YwCVYAm2dK4CqSJ0t7zJdWf1
         xWmlHL+oXXRygY5EH44lmFVK2HYMLaZsfS1pipJJHmCu95wXNTLiYMMiTqiBMdN+5yLZ
         rRgmxh8aV2zoGEtd2kuMlqWxYmxs/hN6SmLoyDnRD8g/w9Ye7kIyZwmNdkowdS7UwLAx
         vpsZYDo7lnO2zTe+ZXhrfhmJpQwN6t757CZq5fB4WrKLLoSfmGYBh0lRsAURGHm8FcLA
         bKhCVOMGtFgP6J7J78NtUD8PK8UnzAfnVijsXUbjeB/+C6PKA0WFA9BvYb92MzXgqVZv
         lwwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=8duwRoAlAnIcRPoTrkEhi8SUV6Xcf0e6kHlRJ9wzAIU=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=APByAtwb3t6wLTNfPhaFP3d6WxJoJxCe6vcxBPGVW5YIZ8g20m6xYriAOBAcGoovkq
         8ie9jcvS5v51sHP1v299pLupWrZ9RhbJ893yL+LeSt6/VxmZz6IFSRhRDbsJEhEokxd+
         hrUg7zOzo+oq1W/9A5kJqXjqTXbuUdfhKBoHcVGwJ3yOM1ACqc5KoXTV44hcsZLJ7KTf
         UXPbzRwOk8nwgRbqJq+m6khJb/AHyRWKUT3wnynZjhhknPoK4OMJQgV+22rTY14LqGDJ
         Ae/88kYu3SVXRIH67oHgfFafNRZKmqVKRF/S1qVVEX37nQ156GTFuTaRIzE25yXBpTl3
         cgCQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=u+6Rwg6X;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 14-20020a05621420ce00b0069936512817si8201285qve.157.2024.05.05.18.10.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 05 May 2024 18:10:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=u+6Rwg6X;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1s3mqw-0004DW-G4; Sun, 05 May 2024 21:09:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1s3mps-0008Br-Rb
 for qemu-devel@nongnu.org; Sun, 05 May 2024 21:08:12 -0400
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1s3mpY-0003NF-VL
 for qemu-devel@nongnu.org; Sun, 05 May 2024 21:07:57 -0400
Received: by mail-ot1-x329.google.com with SMTP id
 46e09a7af769-6f0442816e7so424668a34.2
 for <qemu-devel@nongnu.org>; Sun, 05 May 2024 18:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714957667; x=1715562467; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8duwRoAlAnIcRPoTrkEhi8SUV6Xcf0e6kHlRJ9wzAIU=;
 b=u+6Rwg6XMtD+6TaGN+1vzKbLMoJ42qQSenaAvM719xWRPTmP8RAimuNd/NDy8KVwsj
 zWogGBMqxEH3jD2lcor/Inlrruh4Lftn8CZyHr7rNgML0vD/YJBPcrz/u+UY9jJSHRKJ
 39A8csG+iZWGSLOpJzdwHvHGXDYEW3Uf7/HFxy197/Rle5tuIRpqYfe3SSH/V98jri/Y
 6sgMM8akd/ci2OcEO1Vw44qbdbAbS9jOZ1MhjvABjt4ICUF5skNLgbDybJuzhKw5c30J
 EXNQ+6e8sp3H52TfTqdUnJDh3Vm0h90BAKH4fGDMQBZapz8pHauoP5bCb7w1z1Eood/V
 LKfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714957667; x=1715562467;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8duwRoAlAnIcRPoTrkEhi8SUV6Xcf0e6kHlRJ9wzAIU=;
 b=HQk/8uh/deoH0WBvdHz8Yc7D5lRLPbiA5oX2djQ485zfhdVK+rdTdlBNoHAVfQg7SF
 vrPGYKWviFYeXNOrWd1hNutxBuP8JzS1UrarDzieyPqr0qe7YolB17VPCmwp2t9N43iR
 gHwR4CNSC5K8iWQLuD2MIv4k3H8FmuA1k+mbNDPy2H+cnSqRwSEdAkaPdt2ooSR7uwr3
 1vjEhKhd4hsnJBIYjMOhmfSbPBUvYqrSW28t49g+YI+QWTtkSxZ4W2Lj5tQdsRUefaML
 LXI45HsIjwQw1mrLXyooCFSChPZuwaSeCSpCKuIGDYZbIX1Pmqhl0QBcoK8FeEgMGS6n
 QzfQ==
X-Gm-Message-State: AOJu0YwoCyEnaU7UY+SsMm0eWOc364tGFB93RMVv0HJEoQJzj4PVG70L
 8S3ivimd8s6KwgzQ7UUr1KjJiKEhWnYJ9zsiFVdUs+YyIjQxO/T7xsi+HHe6Cy3D5BX3bQLz/XU
 Y
X-Received: by 2002:a9d:5f05:0:b0:6ea:1bba:9622 with SMTP id
 f5-20020a9d5f05000000b006ea1bba9622mr9036197oti.35.1714957667211; 
 Sun, 05 May 2024 18:07:47 -0700 (PDT)
Received: from stoup.. (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 kp4-20020a056a00464400b006e580678dfbsm6577287pfb.193.2024.05.05.18.07.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 May 2024 18:07:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 50/57] target/arm: Convert SRHADD, URHADD to gvec
Date: Sun,  5 May 2024 18:03:56 -0700
Message-Id: <20240506010403.6204-51-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240506010403.6204-1-richard.henderson@linaro.org>
References: <20240506010403.6204-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::329;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x329.google.com
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
X-TUID: Nsgl3cu6dNkN

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h             |   7 --
 target/arm/tcg/translate.h      |   4 +
 target/arm/tcg/gengvec.c        | 144 ++++++++++++++++++++++++++++++++
 target/arm/tcg/neon_helper.c    |  27 ------
 target/arm/tcg/translate-a64.c  |  48 ++---------
 target/arm/tcg/translate-neon.c |  26 +-----
 6 files changed, 158 insertions(+), 98 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index b95f24ed0a..85f9302563 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -268,13 +268,6 @@ DEF_HELPER_FLAGS_2(fjcvtzs, TCG_CALL_NO_RWG, i64, f64, ptr)
 DEF_HELPER_FLAGS_3(check_hcr_el2_trap, TCG_CALL_NO_WG, void, env, i32, i32)
 
 /* neon_helper.c */
-DEF_HELPER_2(neon_rhadd_s8, i32, i32, i32)
-DEF_HELPER_2(neon_rhadd_u8, i32, i32, i32)
-DEF_HELPER_2(neon_rhadd_s16, i32, i32, i32)
-DEF_HELPER_2(neon_rhadd_u16, i32, i32, i32)
-DEF_HELPER_2(neon_rhadd_s32, s32, s32, s32)
-DEF_HELPER_2(neon_rhadd_u32, i32, i32, i32)
-
 DEF_HELPER_2(neon_pmin_u8, i32, i32, i32)
 DEF_HELPER_2(neon_pmin_s8, i32, i32, i32)
 DEF_HELPER_2(neon_pmin_u16, i32, i32, i32)
diff --git a/target/arm/tcg/translate.h b/target/arm/tcg/translate.h
index 315e0afd04..3b1e68b779 100644
--- a/target/arm/tcg/translate.h
+++ b/target/arm/tcg/translate.h
@@ -480,6 +480,10 @@ void gen_gvec_shsub(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
                     uint32_t rm_ofs, uint32_t opr_sz, uint32_t max_sz);
 void gen_gvec_uhsub(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
                     uint32_t rm_ofs, uint32_t opr_sz, uint32_t max_sz);
+void gen_gvec_srhadd(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
+                     uint32_t rm_ofs, uint32_t opr_sz, uint32_t max_sz);
+void gen_gvec_urhadd(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
+                     uint32_t rm_ofs, uint32_t opr_sz, uint32_t max_sz);
 
 void gen_cmtst_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b);
 void gen_ushl_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b);
diff --git a/target/arm/tcg/gengvec.c b/target/arm/tcg/gengvec.c
index b82de576d2..a4133bf5f8 100644
--- a/target/arm/tcg/gengvec.c
+++ b/target/arm/tcg/gengvec.c
@@ -2142,3 +2142,147 @@ void gen_gvec_uhsub(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
     assert(vece <= MO_32);
     tcg_gen_gvec_3(rd_ofs, rn_ofs, rm_ofs, opr_sz, max_sz, &g[vece]);
 }
+
+static void gen_srhadd8_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b)
+{
+    TCGv_i64 t = tcg_temp_new_i64();
+
+    tcg_gen_or_i64(t, a, b);
+    tcg_gen_vec_sar8i_i64(a, a, 1);
+    tcg_gen_vec_sar8i_i64(b, b, 1);
+    tcg_gen_andi_i64(t, t, dup_const(MO_8, 1));
+    tcg_gen_vec_add8_i64(d, a, b);
+    tcg_gen_vec_add8_i64(d, d, t);
+}
+
+static void gen_srhadd16_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b)
+{
+    TCGv_i64 t = tcg_temp_new_i64();
+
+    tcg_gen_or_i64(t, a, b);
+    tcg_gen_vec_sar16i_i64(a, a, 1);
+    tcg_gen_vec_sar16i_i64(b, b, 1);
+    tcg_gen_andi_i64(t, t, dup_const(MO_16, 1));
+    tcg_gen_vec_add16_i64(d, a, b);
+    tcg_gen_vec_add16_i64(d, d, t);
+}
+
+static void gen_srhadd_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b)
+{
+    TCGv_i32 t = tcg_temp_new_i32();
+
+    tcg_gen_or_i32(t, a, b);
+    tcg_gen_sari_i32(a, a, 1);
+    tcg_gen_sari_i32(b, b, 1);
+    tcg_gen_andi_i32(t, t, 1);
+    tcg_gen_add_i32(d, a, b);
+    tcg_gen_add_i32(d, d, t);
+}
+
+static void gen_srhadd_vec(unsigned vece, TCGv_vec d, TCGv_vec a, TCGv_vec b)
+{
+    TCGv_vec t = tcg_temp_new_vec_matching(d);
+
+    tcg_gen_or_vec(vece, t, a, b);
+    tcg_gen_sari_vec(vece, a, a, 1);
+    tcg_gen_sari_vec(vece, b, b, 1);
+    tcg_gen_and_vec(vece, t, t, tcg_constant_vec_matching(d, vece, 1));
+    tcg_gen_add_vec(vece, d, a, b);
+    tcg_gen_add_vec(vece, d, d, t);
+}
+
+void gen_gvec_srhadd(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
+                     uint32_t rm_ofs, uint32_t opr_sz, uint32_t max_sz)
+{
+    static const TCGOpcode vecop_list[] = {
+        INDEX_op_sari_vec, INDEX_op_add_vec, 0
+    };
+    static const GVecGen3 g[] = {
+        { .fni8 = gen_srhadd8_i64,
+          .fniv = gen_srhadd_vec,
+          .opt_opc = vecop_list,
+          .vece = MO_8 },
+        { .fni8 = gen_srhadd16_i64,
+          .fniv = gen_srhadd_vec,
+          .opt_opc = vecop_list,
+          .vece = MO_16 },
+        { .fni4 = gen_srhadd_i32,
+          .fniv = gen_srhadd_vec,
+          .opt_opc = vecop_list,
+          .vece = MO_32 },
+    };
+    assert(vece <= MO_32);
+    tcg_gen_gvec_3(rd_ofs, rn_ofs, rm_ofs, opr_sz, max_sz, &g[vece]);
+}
+
+static void gen_urhadd8_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b)
+{
+    TCGv_i64 t = tcg_temp_new_i64();
+
+    tcg_gen_or_i64(t, a, b);
+    tcg_gen_vec_shr8i_i64(a, a, 1);
+    tcg_gen_vec_shr8i_i64(b, b, 1);
+    tcg_gen_andi_i64(t, t, dup_const(MO_8, 1));
+    tcg_gen_vec_add8_i64(d, a, b);
+    tcg_gen_vec_add8_i64(d, d, t);
+}
+
+static void gen_urhadd16_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b)
+{
+    TCGv_i64 t = tcg_temp_new_i64();
+
+    tcg_gen_or_i64(t, a, b);
+    tcg_gen_vec_shr16i_i64(a, a, 1);
+    tcg_gen_vec_shr16i_i64(b, b, 1);
+    tcg_gen_andi_i64(t, t, dup_const(MO_16, 1));
+    tcg_gen_vec_add16_i64(d, a, b);
+    tcg_gen_vec_add16_i64(d, d, t);
+}
+
+static void gen_urhadd_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b)
+{
+    TCGv_i32 t = tcg_temp_new_i32();
+
+    tcg_gen_or_i32(t, a, b);
+    tcg_gen_shri_i32(a, a, 1);
+    tcg_gen_shri_i32(b, b, 1);
+    tcg_gen_andi_i32(t, t, 1);
+    tcg_gen_add_i32(d, a, b);
+    tcg_gen_add_i32(d, d, t);
+}
+
+static void gen_urhadd_vec(unsigned vece, TCGv_vec d, TCGv_vec a, TCGv_vec b)
+{
+    TCGv_vec t = tcg_temp_new_vec_matching(d);
+
+    tcg_gen_or_vec(vece, t, a, b);
+    tcg_gen_shri_vec(vece, a, a, 1);
+    tcg_gen_shri_vec(vece, b, b, 1);
+    tcg_gen_and_vec(vece, t, t, tcg_constant_vec_matching(d, vece, 1));
+    tcg_gen_add_vec(vece, d, a, b);
+    tcg_gen_add_vec(vece, d, d, t);
+}
+
+void gen_gvec_urhadd(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
+                     uint32_t rm_ofs, uint32_t opr_sz, uint32_t max_sz)
+{
+    static const TCGOpcode vecop_list[] = {
+        INDEX_op_shri_vec, INDEX_op_add_vec, 0
+    };
+    static const GVecGen3 g[] = {
+        { .fni8 = gen_urhadd8_i64,
+          .fniv = gen_urhadd_vec,
+          .opt_opc = vecop_list,
+          .vece = MO_8 },
+        { .fni8 = gen_urhadd16_i64,
+          .fniv = gen_urhadd_vec,
+          .opt_opc = vecop_list,
+          .vece = MO_16 },
+        { .fni4 = gen_urhadd_i32,
+          .fniv = gen_urhadd_vec,
+          .opt_opc = vecop_list,
+          .vece = MO_32 },
+    };
+    assert(vece <= MO_32);
+    tcg_gen_gvec_3(rd_ofs, rn_ofs, rm_ofs, opr_sz, max_sz, &g[vece]);
+}
diff --git a/target/arm/tcg/neon_helper.c b/target/arm/tcg/neon_helper.c
index d1641a5252..082bfd88ad 100644
--- a/target/arm/tcg/neon_helper.c
+++ b/target/arm/tcg/neon_helper.c
@@ -179,33 +179,6 @@ uint32_t HELPER(glue(neon_,name))(uint32_t arg) \
     return arg; \
 }
 
-#define NEON_FN(dest, src1, src2) dest = (src1 + src2 + 1) >> 1
-NEON_VOP(rhadd_s8, neon_s8, 4)
-NEON_VOP(rhadd_u8, neon_u8, 4)
-NEON_VOP(rhadd_s16, neon_s16, 2)
-NEON_VOP(rhadd_u16, neon_u16, 2)
-#undef NEON_FN
-
-int32_t HELPER(neon_rhadd_s32)(int32_t src1, int32_t src2)
-{
-    int32_t dest;
-
-    dest = (src1 >> 1) + (src2 >> 1);
-    if ((src1 | src2) & 1)
-        dest++;
-    return dest;
-}
-
-uint32_t HELPER(neon_rhadd_u32)(uint32_t src1, uint32_t src2)
-{
-    uint32_t dest;
-
-    dest = (src1 >> 1) + (src2 >> 1);
-    if ((src1 | src2) & 1)
-        dest++;
-    return dest;
-}
-
 #define NEON_FN(dest, src1, src2) dest = (src1 < src2) ? src1 : src2
 NEON_POP(pmin_s8, neon_s8, 4)
 NEON_POP(pmin_u8, neon_u8, 4)
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 83e2c363e7..87b86b7c54 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -10909,7 +10909,6 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
     int rm = extract32(insn, 16, 5);
     int rn = extract32(insn, 5, 5);
     int rd = extract32(insn, 0, 5);
-    int pass;
 
     switch (opcode) {
     case 0x13: /* MUL, PMUL */
@@ -10963,6 +10962,13 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
     }
 
     switch (opcode) {
+    case 0x02: /* SRHADD, URHADD */
+        if (u) {
+            gen_gvec_fn3(s, is_q, rd, rn, rm, gen_gvec_urhadd, size);
+        } else {
+            gen_gvec_fn3(s, is_q, rd, rn, rm, gen_gvec_srhadd, size);
+        }
+        return;
     case 0x0c: /* SMAX, UMAX */
         if (u) {
             gen_gvec_fn3(s, is_q, rd, rn, rm, tcg_gen_gvec_umax, size);
@@ -11015,45 +11021,7 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
         }
         return;
     }
-
-    if (size == 3) {
-        g_assert_not_reached();
-    } else {
-        for (pass = 0; pass < (is_q ? 4 : 2); pass++) {
-            TCGv_i32 tcg_op1 = tcg_temp_new_i32();
-            TCGv_i32 tcg_op2 = tcg_temp_new_i32();
-            TCGv_i32 tcg_res = tcg_temp_new_i32();
-            NeonGenTwoOpFn *genfn = NULL;
-            NeonGenTwoOpEnvFn *genenvfn = NULL;
-
-            read_vec_element_i32(s, tcg_op1, rn, pass, MO_32);
-            read_vec_element_i32(s, tcg_op2, rm, pass, MO_32);
-
-            switch (opcode) {
-            case 0x2: /* SRHADD, URHADD */
-            {
-                static NeonGenTwoOpFn * const fns[3][2] = {
-                    { gen_helper_neon_rhadd_s8, gen_helper_neon_rhadd_u8 },
-                    { gen_helper_neon_rhadd_s16, gen_helper_neon_rhadd_u16 },
-                    { gen_helper_neon_rhadd_s32, gen_helper_neon_rhadd_u32 },
-                };
-                genfn = fns[size][u];
-                break;
-            }
-            default:
-                g_assert_not_reached();
-            }
-
-            if (genenvfn) {
-                genenvfn(tcg_res, tcg_env, tcg_op1, tcg_op2);
-            } else {
-                genfn(tcg_res, tcg_op1, tcg_op2);
-            }
-
-            write_vec_element_i32(s, tcg_res, rd, pass, MO_32);
-        }
-    }
-    clear_vec_high(s, is_q, rd);
+    g_assert_not_reached();
 }
 
 /* AdvSIMD three same
diff --git a/target/arm/tcg/translate-neon.c b/target/arm/tcg/translate-neon.c
index d59d5804c5..f9a8753906 100644
--- a/target/arm/tcg/translate-neon.c
+++ b/target/arm/tcg/translate-neon.c
@@ -845,6 +845,8 @@ DO_3SAME_NO_SZ_3(VHADD_S, gen_gvec_shadd)
 DO_3SAME_NO_SZ_3(VHADD_U, gen_gvec_uhadd)
 DO_3SAME_NO_SZ_3(VHSUB_S, gen_gvec_shsub)
 DO_3SAME_NO_SZ_3(VHSUB_U, gen_gvec_uhsub)
+DO_3SAME_NO_SZ_3(VRHADD_S, gen_gvec_srhadd)
+DO_3SAME_NO_SZ_3(VRHADD_U, gen_gvec_urhadd)
 
 #define DO_3SAME_CMP(INSN, COND)                                        \
     static void gen_##INSN##_3s(unsigned vece, uint32_t rd_ofs,         \
@@ -922,27 +924,6 @@ DO_SHA2(SHA256H, gen_helper_crypto_sha256h)
 DO_SHA2(SHA256H2, gen_helper_crypto_sha256h2)
 DO_SHA2(SHA256SU1, gen_helper_crypto_sha256su1)
 
-#define DO_3SAME_32(INSN, FUNC)                                         \
-    static void gen_##INSN##_3s(unsigned vece, uint32_t rd_ofs,         \
-                                uint32_t rn_ofs, uint32_t rm_ofs,       \
-                                uint32_t oprsz, uint32_t maxsz)         \
-    {                                                                   \
-        static const GVecGen3 ops[4] = {                                \
-            { .fni4 = gen_helper_neon_##FUNC##8 },                      \
-            { .fni4 = gen_helper_neon_##FUNC##16 },                     \
-            { .fni4 = gen_helper_neon_##FUNC##32 },                     \
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
 /*
  * Some helper functions need to be passed the tcg_env. In order
  * to use those with the gvec APIs like tcg_gen_gvec_3() we need
@@ -955,9 +936,6 @@ DO_SHA2(SHA256SU1, gen_helper_crypto_sha256su1)
         FUNC(d, tcg_env, n, m);                                         \
     }
 
-DO_3SAME_32(VRHADD_S, rhadd_s)
-DO_3SAME_32(VRHADD_U, rhadd_u)
-
 #define DO_3SAME_VQDMULH(INSN, FUNC)                                    \
     WRAP_ENV_FN(gen_##INSN##_tramp16, gen_helper_neon_##FUNC##_s16);    \
     WRAP_ENV_FN(gen_##INSN##_tramp32, gen_helper_neon_##FUNC##_s32);    \
-- 
2.34.1


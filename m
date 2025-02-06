Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1779901njb;
        Thu, 6 Feb 2025 12:02:13 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWQ0qGSbxQsTp64bfRbcC9DFJOA2pnMl4dzgJWfE4HaDGY/iO76FeEQyuSJFx6zS8nRXH7+C2GZjq+mJQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEfuJneeuQLqyMDl/CSldWFpKMepnE/8FjzSToDtPwHHhY52FBTgOU2kz7TGdai2mKGsEYR
X-Received: by 2002:a05:622a:518e:b0:467:72c1:7084 with SMTP id d75a77b69052e-4703341b737mr79522561cf.0.1738872133697;
        Thu, 06 Feb 2025 12:02:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738872133; cv=none;
        d=google.com; s=arc-20240605;
        b=KBtTnTBWMleth0Xkv14PzUXOYfuL52Dp2IwThNEiOFdkcXo4oHbWLnijif7wkVvCXF
         HoiaEdMi9X0oY2nkS+gIS3Nkk1UTRCEQ44Xazjdx444hvzoF2dwPP8QXIhYoYTcBVptI
         e1aHRipM6J9vfnV8D6AIxSrQfuOVjnAaeTGNKWXtZgGfB14xW9L4q+FHmLSCpzgtyjoN
         uKifzUIdCdhN8XInEXcFEnGpGZwwXJK9HixCyU6/AmgwqHkja2kSDVmTCDBw5q+3KyV3
         QHY7vdZ1Ps8Znon2n+3K5E+ROHSaHUulE2u5h0vqZYH/AvzGzZZuHJk5RJNjZzUJxBgU
         nK7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=nZnOov9Q8Xvb775TM41H1ruTNMzSk5UaJhoV8tS6Pdg=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=EfZXuqpbjWnUS4IDOGsgLjqjJq+70oMteOe7/5vFpG5l727Kacl9qgtEY4rlVwnQon
         eLv34ZlHzLugMlsSzMSew9m9Q9HF9uI902zBNzoyF649aFM8xKebtlwXfiu48dca6DhU
         U8q/WEGADJ0r/wuU/3FQeq9o4U288rMZnCxXm1FX5TgynRDsdTCpksWJk6RkSwiAM4tA
         6lRQ4y6HfT4MpjMlpX6opWE6TzCD52PIaEYDlUfkTzOMAIQDGcfvvSRQlkJbVORvtMNW
         gQvdj4bI/ElgUYRuFWUBxOrzcwUeHLlh5h0ocz8CB6fedtyKfdHARZO4BFJRTJY/crH0
         57QQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iMq8IPiL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47153b6fb4dsi17144191cf.235.2025.02.06.12.02.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2025 12:02:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iMq8IPiL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tg80d-0007YT-3w; Thu, 06 Feb 2025 14:57:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tg80J-0007GU-KL
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 14:57:41 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tg80G-0000Yq-BD
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 14:57:38 -0500
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-21f2339dcfdso21235195ad.1
 for <qemu-arm@nongnu.org>; Thu, 06 Feb 2025 11:57:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738871855; x=1739476655; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nZnOov9Q8Xvb775TM41H1ruTNMzSk5UaJhoV8tS6Pdg=;
 b=iMq8IPiLfUjIPXVSSFv9VKNW/QpzmRgLlPaGkDSQIxSpUu9K9M9XEm/a5pYh1w8LPe
 w6lOOkaTVrS9AAdDUbGJH8qAKVUccJMn1NWfF96lh54zarj1ZofRuhoIRzhJcvefNB9n
 Y79+YZNZEzqLUu2rj69LR0x76igEEjs2Vf5xwYnrn7zQsVsimyaxUCYBSHFBJhu1s7Sy
 o5rmls3TpMgOGacTV0+sUasiiSApOZ2AvC8D9iI5rnDO4feFldf0DLPuMhD4+i/S+OEL
 li9N1HPGZRTogfOzcOyeVjsELhHseJZGCj04dSi2Mtysur6q7fKfxRqJdZTfTgn4BuuC
 UG4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738871855; x=1739476655;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nZnOov9Q8Xvb775TM41H1ruTNMzSk5UaJhoV8tS6Pdg=;
 b=gUmNN968R4UbAHWyVER6qPwNyy3skTrQmcRKQmzl/Er0AVazD8Y7/yEYb22bfOCT5R
 SOhE6jDDPrnqxoirdtH6MPdktx7EJPMZjy/RQHMw3AV3NMTjEr793AbDFfi6luVJ6E6d
 GTSAEFlo1aPYu5kMNno8lSuDjtokrn5Kwdv+jz11f9RoC5DbBuNxensVw+dxtKih9Lca
 tiPKkWJn1N5bX/Gf7Tegm8QLz8tm9Xk0DNFll/Zr6bQJEctQrL3dsZg2X4VZHMgusiTP
 A5Ux0H3HSWwYIodi+0V/hGC/D7NQMxSGsTmE43KhtGSZFXhoBWfm5EXiZ1kN/hUaToDZ
 TyBA==
X-Gm-Message-State: AOJu0Yzq0YAYhz2gxubP6AGsJPL+HEc9vpp7Zec6IbcN21xExHET1+S1
 LOXaoyPCaAOpXgmxEZ8CbjXu8sfqHNJOEvF5ymecMbc9jkyyYGSLLM0ICY2wybg=
X-Gm-Gg: ASbGncv3+Lt6lXU6JqNhvca6dfE9IuinHBoBtWQYFfgH4HbZrNdu9JuQ7PJSK04pFgd
 zJ95Es1bx5AmoHPgQlvMao6mi/5gSxuAxB+cydc4RTC3xoAFueIlblv+JV6S5ZndlrUDb0pG+g7
 KPfrD473bbqTqktqW2mI+6kkv5w9fs2VUXOEPojGs6vNCeD3kJLOJdFPoDhdu4ON3vUqlbVSy17
 LmlpqhHcj9KW1TrJePQBiqbIsuSo9E4wA2n4hofbEMJfaIthpUqr6iAAio8SAEUGUIsPbz6hz2U
 Ilu6nqf+dbYfKLvPek9vl7T9H1TCPbb9UJQkmmY4thBleQA=
X-Received: by 2002:a05:6a20:c792:b0:1e1:ad7:3282 with SMTP id
 adf61e73a8af0-1ee05290951mr419986637.7.1738871855106; 
 Thu, 06 Feb 2025 11:57:35 -0800 (PST)
Received: from stoup.. (71-212-39-66.tukw.qwest.net. [71.212.39.66])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73048c16370sm1666993b3a.152.2025.02.06.11.57.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2025 11:57:34 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 25/61] target/arm: Introduce gen_gvec_sve2_sqdmulh
Date: Thu,  6 Feb 2025 11:56:39 -0800
Message-ID: <20250206195715.2150758-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250206195715.2150758-1-richard.henderson@linaro.org>
References: <20250206195715.2150758-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
X-TUID: BkJS0BMSN279

To be used by both SVE2 and SME2.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.h |  4 ++++
 target/arm/tcg/gengvec64.c     | 11 +++++++++++
 target/arm/tcg/translate-sve.c |  8 +-------
 3 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/target/arm/tcg/translate-a64.h b/target/arm/tcg/translate-a64.h
index 7d3b59ccd9..481dfeb965 100644
--- a/target/arm/tcg/translate-a64.h
+++ b/target/arm/tcg/translate-a64.h
@@ -225,6 +225,10 @@ void gen_gvec_usqadd_qc(unsigned vece, uint32_t rd_ofs,
                         uint32_t rn_ofs, uint32_t rm_ofs,
                         uint32_t opr_sz, uint32_t max_sz);
 
+void gen_gvec_sve2_sqdmulh(unsigned vece, uint32_t rd_ofs,
+                           uint32_t rn_ofs, uint32_t rm_ofs,
+                           uint32_t opr_sz, uint32_t max_sz);
+
 void gen_sve_ldr(DisasContext *s, TCGv_ptr, int vofs, int len, int rn, int imm);
 void gen_sve_str(DisasContext *s, TCGv_ptr, int vofs, int len, int rn, int imm);
 
diff --git a/target/arm/tcg/gengvec64.c b/target/arm/tcg/gengvec64.c
index 2617cde0a5..2429cab1b8 100644
--- a/target/arm/tcg/gengvec64.c
+++ b/target/arm/tcg/gengvec64.c
@@ -369,3 +369,14 @@ void gen_gvec_usqadd_qc(unsigned vece, uint32_t rd_ofs,
     tcg_gen_gvec_4(rd_ofs, offsetof(CPUARMState, vfp.qc),
                    rn_ofs, rm_ofs, opr_sz, max_sz, &ops[vece]);
 }
+
+void gen_gvec_sve2_sqdmulh(unsigned vece, uint32_t rd_ofs,
+                           uint32_t rn_ofs, uint32_t rm_ofs,
+                           uint32_t opr_sz, uint32_t max_sz)
+{
+    static gen_helper_gvec_3 * const fns[4] = {
+        gen_helper_sve2_sqdmulh_b, gen_helper_sve2_sqdmulh_h,
+        gen_helper_sve2_sqdmulh_s, gen_helper_sve2_sqdmulh_d,
+    };
+    tcg_gen_gvec_3_ool(rd_ofs, rn_ofs, rm_ofs, opr_sz, max_sz, 0, fns[vece]);
+}
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index d23be477b4..0907a4e9e9 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -5911,6 +5911,7 @@ TRANS_FEAT(MOVPRFX_z, aa64_sve, do_movz_zpz, a->rd, a->rn, a->pg, a->esz, false)
  */
 
 TRANS_FEAT(MUL_zzz, aa64_sve2, gen_gvec_fn_arg_zzz, tcg_gen_gvec_mul, a)
+TRANS_FEAT(SQDMULH_zzz, aa64_sve2, gen_gvec_fn_arg_zzz, gen_gvec_sve2_sqdmulh, a)
 
 static gen_helper_gvec_3 * const smulh_zzz_fns[4] = {
     gen_helper_gvec_smulh_b, gen_helper_gvec_smulh_h,
@@ -5929,13 +5930,6 @@ TRANS_FEAT(UMULH_zzz, aa64_sve2, gen_gvec_ool_arg_zzz,
 TRANS_FEAT(PMUL_zzz, aa64_sve2, gen_gvec_ool_arg_zzz,
            gen_helper_gvec_pmul_b, a, 0)
 
-static gen_helper_gvec_3 * const sqdmulh_zzz_fns[4] = {
-    gen_helper_sve2_sqdmulh_b, gen_helper_sve2_sqdmulh_h,
-    gen_helper_sve2_sqdmulh_s, gen_helper_sve2_sqdmulh_d,
-};
-TRANS_FEAT(SQDMULH_zzz, aa64_sve2, gen_gvec_ool_arg_zzz,
-           sqdmulh_zzz_fns[a->esz], a, 0)
-
 static gen_helper_gvec_3 * const sqrdmulh_zzz_fns[4] = {
     gen_helper_sve2_sqrdmulh_b, gen_helper_sve2_sqrdmulh_h,
     gen_helper_sve2_sqrdmulh_s, gen_helper_sve2_sqrdmulh_d,
-- 
2.43.0


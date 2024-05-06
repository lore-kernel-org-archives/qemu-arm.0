Received: by 2002:a17:907:a09:b0:a52:4db9:938b with SMTP id bb9csp1270755ejc;
        Sun, 5 May 2024 18:08:18 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXhXq68WuZrs9DpEdxgkLlRAjxWDDaVBRhLmwmouNkPkdBYVhgAojO68PuhlQs6XPanrsmuaZMg8iC7F7WJ6ahP02wIk0mG
X-Google-Smtp-Source: AGHT+IHEL1UapHr7uA0sGwJWw5dtMo1VgcuKWZXPdwh5ETN6NdNRdyp8ZI6gux2moagrM93upM/x
X-Received: by 2002:a05:622a:4018:b0:43a:3502:8446 with SMTP id cf24-20020a05622a401800b0043a35028446mr21210039qtb.28.1714957697733;
        Sun, 05 May 2024 18:08:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714957697; cv=none;
        d=google.com; s=arc-20160816;
        b=Jbm1f3LURe6oPxE9RjQtaTmQVChuyGnwpvbeKwRhNJCvfSCWvezpx4bFKjHh85Mx4/
         j8YOfHk21lX81+rdYJPngh88TwfE3WkZRlgSSg4gw7dymh4UR3x7dH8tJPPPsUODxqf9
         YF99wLiZfCsBnuyuQM1QYyuGC7ZDuw6JMWpj6/1DZerJAWApPPPAVz26LqUlR73iS7hu
         3TBuknEaknIEq1EreaKfoE5IMzHv8IAw4H82fa/t9xOKrI3KJdqDXi+Fno/z4WXDnG/U
         CjuC6ctAhVAi+Qo2SmN1CxGUR2IHsmPUSSajBQnr13nHE6qPKwdSrWcFygQBtJOdhjNc
         ZRLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=mEt+N8QVC6VNPpsOJPEnH14M/rsdrctDg74RO6PnuQM=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=GmbuNTtLyPd8wPW7BaXuIPQ/cuDREmTeIFYbd8cSKG0uNFKJ590gufEjtiQ6r4YCot
         A7thnytN+9XDghq/Qwfu/czrc1MGiVXGmvFf/5BcR7giJjSi6YR/uyqZLXuJC2k5nQnE
         W87lZ2pAdJcnvU9s2CIji7ytF0SihLSxxUSl9+TfSkPSFKvtqi86yI076wZlb1mcwDs8
         jQVP6w01c+8IQ/oppZxmFa2lW8ZDUT5sUsz5KbwMthLjyjdHELWWzl4i3izlwwdh2SEh
         ydmULp5wtYQDFbcPDApQA4X38D6wzSNEOa1jfOLNGC0N8FsBfB7LFyGA2UP/X9KpKNWs
         ws+w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ny/FblQx";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h16-20020ac87d50000000b0043af64f79f8si8170184qtb.357.2024.05.05.18.08.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 05 May 2024 18:08:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ny/FblQx";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1s3mnL-0000cc-1c; Sun, 05 May 2024 21:05:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1s3mmr-0008My-PT
 for qemu-devel@nongnu.org; Sun, 05 May 2024 21:05:02 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1s3mmK-0002Vf-BR
 for qemu-devel@nongnu.org; Sun, 05 May 2024 21:05:01 -0400
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-60585faa69fso815310a12.1
 for <qemu-devel@nongnu.org>; Sun, 05 May 2024 18:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714957466; x=1715562266; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mEt+N8QVC6VNPpsOJPEnH14M/rsdrctDg74RO6PnuQM=;
 b=ny/FblQxd+7lHDjUOmdN9yVgegou02yeSEIEXFzQf1r2Ka52Flylw+qmFOkWpuTi+B
 jM9nrMotsfNBKv20/ncDQnTzDZ1UV0eFdKRdqPCU07SH8i8f8saMBOqJZ2P4sfUBYA84
 L0H3RH2jNTboWwe7edGtl2zKrdqm7J6yDt+mBoNGppH1rfx2aZJMXD719hicu/uONBI/
 VJPHswCAd4R522B4cSnjjZg44uGL4PAXWk+hDaB25p8zpVVuX/usyZjhH/bab1ln01XS
 y/JOLAQ5oThFeTVw5Baufhvv1oY6JjppUU+4uGusH+YnVPKswzvMfEmi47O/0Z01msDr
 kCvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714957466; x=1715562266;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mEt+N8QVC6VNPpsOJPEnH14M/rsdrctDg74RO6PnuQM=;
 b=LpTrRgSPdv8sJMPWwqayGXzrnKxx7+5UYUKQ/ku2BOmU4U88jdvHkTiGayq2Jit7DA
 zSiBUbH1/w7RSi0v+I/R+JnzSl5o5700xQO703GDv1eO5Y7e+hKV03Bc+fKkhGQW7cDy
 xwlZnuMe9xRVDzLC5ZAVppRFb9aeHszumoBPNncPBiMyJ/beHWpky+Y2NFg37uUn4XE5
 erYKdOesHB1RQVx5aam4u06JMXUICWsmcDj7V07AGW9v6rWdmyBea46geZ0bM8SEzRzU
 Ubtt9Nj29NnMazOU0+rPjnM2Et4HJ1Q/9tskhF6vYQow2/IMfN0JOKdBfDU/vP8QE6eB
 1LVA==
X-Gm-Message-State: AOJu0YwsJQ8ERQWP4G1/biKNtkM5UHEcgIS4ZbJsG/rF7IqljG38Mcao
 UJH9F4794vwpitqwr8AZQTR0ashzojyDvPDnYOXwOVxH3q8bKjdHELENJCS/2/i/0C5lgkrgHgQ
 l
X-Received: by 2002:a17:90b:1481:b0:2b4:329e:eabd with SMTP id
 js1-20020a17090b148100b002b4329eeabdmr11839683pjb.2.1714957466175; 
 Sun, 05 May 2024 18:04:26 -0700 (PDT)
Received: from stoup.. (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 pv7-20020a17090b3c8700b002a5f44353d2sm8958232pjb.7.2024.05.05.18.04.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 May 2024 18:04:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 25/57] target/arm: Use gvec for neon padd
Date: Sun,  5 May 2024 18:03:31 -0700
Message-Id: <20240506010403.6204-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240506010403.6204-1-richard.henderson@linaro.org>
References: <20240506010403.6204-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: Svq8NjYnnZXM

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h             | 2 --
 target/arm/tcg/neon_helper.c    | 5 -----
 target/arm/tcg/translate-neon.c | 3 +--
 3 files changed, 1 insertion(+), 9 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index d3579a101f..51ed49aa50 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -354,8 +354,6 @@ DEF_HELPER_3(neon_qrshl_s64, i64, env, i64, i64)
 
 DEF_HELPER_2(neon_add_u8, i32, i32, i32)
 DEF_HELPER_2(neon_add_u16, i32, i32, i32)
-DEF_HELPER_2(neon_padd_u8, i32, i32, i32)
-DEF_HELPER_2(neon_padd_u16, i32, i32, i32)
 DEF_HELPER_2(neon_sub_u8, i32, i32, i32)
 DEF_HELPER_2(neon_sub_u16, i32, i32, i32)
 DEF_HELPER_2(neon_mul_u8, i32, i32, i32)
diff --git a/target/arm/tcg/neon_helper.c b/target/arm/tcg/neon_helper.c
index bc6c4a54e9..a0b51c8809 100644
--- a/target/arm/tcg/neon_helper.c
+++ b/target/arm/tcg/neon_helper.c
@@ -745,11 +745,6 @@ uint32_t HELPER(neon_add_u16)(uint32_t a, uint32_t b)
     return (a + b) ^ mask;
 }
 
-#define NEON_FN(dest, src1, src2) dest = src1 + src2
-NEON_POP(padd_u8, neon_u8, 4)
-NEON_POP(padd_u16, neon_u16, 2)
-#undef NEON_FN
-
 #define NEON_FN(dest, src1, src2) dest = src1 - src2
 NEON_VOP(sub_u8, neon_u8, 4)
 NEON_VOP(sub_u16, neon_u16, 2)
diff --git a/target/arm/tcg/translate-neon.c b/target/arm/tcg/translate-neon.c
index 2326a05a0a..6c5a7a98e1 100644
--- a/target/arm/tcg/translate-neon.c
+++ b/target/arm/tcg/translate-neon.c
@@ -830,6 +830,7 @@ DO_3SAME_NO_SZ_3(VABD_S, gen_gvec_sabd)
 DO_3SAME_NO_SZ_3(VABA_S, gen_gvec_saba)
 DO_3SAME_NO_SZ_3(VABD_U, gen_gvec_uabd)
 DO_3SAME_NO_SZ_3(VABA_U, gen_gvec_uaba)
+DO_3SAME_NO_SZ_3(VPADD, gen_gvec_addp)
 
 #define DO_3SAME_CMP(INSN, COND)                                        \
     static void gen_##INSN##_3s(unsigned vece, uint32_t rd_ofs,         \
@@ -1070,13 +1071,11 @@ static bool do_3same_pair(DisasContext *s, arg_3same *a, NeonGenTwoOpFn *fn)
 #define gen_helper_neon_pmax_u32  tcg_gen_umax_i32
 #define gen_helper_neon_pmin_s32  tcg_gen_smin_i32
 #define gen_helper_neon_pmin_u32  tcg_gen_umin_i32
-#define gen_helper_neon_padd_u32  tcg_gen_add_i32
 
 DO_3SAME_PAIR(VPMAX_S, pmax_s)
 DO_3SAME_PAIR(VPMIN_S, pmin_s)
 DO_3SAME_PAIR(VPMAX_U, pmax_u)
 DO_3SAME_PAIR(VPMIN_U, pmin_u)
-DO_3SAME_PAIR(VPADD, padd_u)
 
 #define DO_3SAME_VQDMULH(INSN, FUNC)                                    \
     WRAP_ENV_FN(gen_##INSN##_tramp16, gen_helper_neon_##FUNC##_s16);    \
-- 
2.34.1


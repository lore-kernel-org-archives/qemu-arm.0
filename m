Received: by 2002:a17:906:494e:b0:982:8c08:340e with SMTP id f14csp2878500ejt;
        Mon, 19 Jun 2023 08:44:48 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7tLObntbiCf55hJyCA+6Ct+HC7VuGUPnZ7UEiZCkAG66TzWPc73i1KDy0naNBUC/KTAG3n
X-Received: by 2002:a05:600c:3795:b0:3f7:3991:61e5 with SMTP id o21-20020a05600c379500b003f7399161e5mr10508111wmr.4.1687189488852;
        Mon, 19 Jun 2023 08:44:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687189488; cv=none;
        d=google.com; s=arc-20160816;
        b=ndbHMqQFRLyBBSBOQCaYKK4r285uJQQNV5ch+my3XjoNiTx/LHJ31PcXVCgO83tUNt
         yhl4OxHIwW6nwbFD6eomiHf/HG5IGh19dxIUjT97bS2yqMgfnxnCq68AfEYifGg5CTK/
         pXlcUm1FiH/eEhVpbDVwno0N2MYdxyAxIfzZtDkMfcQXfXQOKeWP2QGaRmaU+2QpRPN0
         E7x6Ah6qbGrlr8m48jaDQshDEU3MJjU5yAPvqDtHCELFAI4esBAe41XfwJvCFxJpIxbT
         5qNfhCPeuWIKYEFRe51IipTE3dhU39YZHU/CdS/39atklVDbEQnAPU76XzT8mTzxf84m
         G4Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=eEPIN2fkA0XgNRhE78YRhKSUuhDAdH/pZRKK62jA57s=;
        b=DKx2kYQIIeKJwZRL7+NmerkZ5HCNlsp6bFERtsRjFEQXOueP7/1AY1EZGJTJkCKA8E
         vJFIvHVmBBrs7iYEOIn363qRbtggThK8OM4yIP9peDQ8md9ppOODN14RlKH/P1kCoajI
         acUva9ZaFw1dMri8LxNCuL7M/ObHxKgFcswMeBn0nKxpWSaW1CwxTIVcJJp7XF/BQ8bR
         LQBcmXQ6j1zZVRpJKgRfQw9WQs4nh33JlG8cim+O7fFGa7DHxCgoOb8Eyln7xTDpBTxz
         HW6GqsbnmcZtezvBN2ASzq/81FBP1oSj18ZBnEcwF0G73WgknSM2EeITpGHaJ2u65q3S
         LnUw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="WHl/d8SI";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f13-20020a7bcc0d000000b003f81aab57e2si18407wmh.129.2023.06.19.08.44.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Jun 2023 08:44:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="WHl/d8SI";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qBH3d-0005e5-Nl; Mon, 19 Jun 2023 11:44:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qBH3Z-0005LE-AQ
 for qemu-arm@nongnu.org; Mon, 19 Jun 2023 11:44:44 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qBH3L-0001Dv-Pg
 for qemu-arm@nongnu.org; Mon, 19 Jun 2023 11:44:30 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3113dabc549so1834382f8f.1
 for <qemu-arm@nongnu.org>; Mon, 19 Jun 2023 08:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687189464; x=1689781464;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eEPIN2fkA0XgNRhE78YRhKSUuhDAdH/pZRKK62jA57s=;
 b=WHl/d8SIbkOaqmMh7WSfL+gQmdI/xKJeeVNTeAPTOOneoUjn2do0L2ULMyBppu2Ml3
 VaIHKkfjP1aCJIINOg3Kh9NbPjXPrwRrfolzJdxzh1ckAuLbwXUXN94eP0f6RZDTiX8U
 HREB+BKu9+lfSfNf0AtbJJjIfU7Mx/PSHqFZQqFvbnx5l7HYxtcTvm+BfbNGOASYEuJL
 LpdWWGrL1LO45WplS5CwHZNE0c8S7gxMNdR5LsmI+rcJRkPTlLI9UwT4hnvDZymtn+AY
 sggYC4X+KCjYC6j/VW4snNuu5BOvA9D7wZEbJKTz+yOPOuEvPixVa7tvmo/oI7CKlrvM
 WEYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687189464; x=1689781464;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eEPIN2fkA0XgNRhE78YRhKSUuhDAdH/pZRKK62jA57s=;
 b=MQyiEs4pxylt4QhJu4TCCxIgshxJxUCJvqn/rvhAFgvz3GIINE4crkVh8bEBBgQGFH
 byL7HNoQLU4vjsK+idipS0QSAR7X7XEbDh+BWRhP/re2zfbOu37YAdxqpRRWds98wkkx
 GUVUMi5R7reacCAAZcHB/HNd3JjjVZV99kXaUEIteH3CvQirDTygCXn9yeO63sBI7JD1
 I7GN428qtuRrlHPRR2EgTT5Vgvh+rn3yN+UaAuII7lLxaas/nTaK7AEl3+mMfA0/ieM6
 dDEP65Ayf04koiwtXr3vuHu/MFRZY0CvD7sTQ0wGJ+fwcv9h+cfOa1EuydhCesfeWegU
 2Q6A==
X-Gm-Message-State: AC+VfDwneKi+YoYuyEJYo94qhSzbbriK4L0tnHNED3Mwer+fRRs+75iX
 kflFIQgVaRhxuw4JNqKT3Vhf0A==
X-Received: by 2002:a5d:6987:0:b0:310:b979:d00f with SMTP id
 g7-20020a5d6987000000b00310b979d00fmr8864661wru.45.1687189464409; 
 Mon, 19 Jun 2023 08:44:24 -0700 (PDT)
Received: from m1x-phil.lan (sar95-h02-176-184-10-225.dsl.sta.abo.bbox.fr.
 [176.184.10.225]) by smtp.gmail.com with ESMTPSA id
 z4-20020a5d4d04000000b003112b38fe90sm7431715wrt.79.2023.06.19.08.44.23
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 19 Jun 2023 08:44:24 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 08/34] target/arm/tcg: Un-inline VFP translation helpers
Date: Mon, 19 Jun 2023 17:42:36 +0200
Message-Id: <20230619154302.80350-9-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230619154302.80350-1-philmd@linaro.org>
References: <20230619154302.80350-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
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
X-TUID: dAMma6l0pVOG

In order to restrict lookup_cp_reg() and set_rmode() helpers
to VFP translation, un-inline gen_lookup_cp_reg and gen_set /
gen_restore_rmode.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/tcg/translate.h     | 22 +++-------------------
 target/arm/tcg/translate-vfp.c | 21 +++++++++++++++++++++
 2 files changed, 24 insertions(+), 19 deletions(-)

diff --git a/target/arm/tcg/translate.h b/target/arm/tcg/translate.h
index 3d7c55d3b6..d2a98b9f3a 100644
--- a/target/arm/tcg/translate.h
+++ b/target/arm/tcg/translate.h
@@ -680,29 +680,13 @@ static inline void set_disas_label(DisasContext *s, DisasLabel l)
     s->pc_save = l.pc_save;
 }
 
-static inline TCGv_ptr gen_lookup_cp_reg(uint32_t key)
-{
-    TCGv_ptr ret = tcg_temp_new_ptr();
-    gen_helper_lookup_cp_reg(ret, cpu_env, tcg_constant_i32(key));
-    return ret;
-}
+TCGv_ptr gen_lookup_cp_reg(uint32_t key);
 
 /*
  * Set and reset rounding mode around another operation.
  */
-static inline TCGv_i32 gen_set_rmode(ARMFPRounding rmode, TCGv_ptr fpst)
-{
-    TCGv_i32 new = tcg_constant_i32(arm_rmode_to_sf(rmode));
-    TCGv_i32 old = tcg_temp_new_i32();
-
-    gen_helper_set_rmode(old, new, fpst);
-    return old;
-}
-
-static inline void gen_restore_rmode(TCGv_i32 old, TCGv_ptr fpst)
-{
-    gen_helper_set_rmode(old, old, fpst);
-}
+TCGv_i32 gen_set_rmode(ARMFPRounding rmode, TCGv_ptr fpst);
+void gen_restore_rmode(TCGv_i32 old, TCGv_ptr fpst);
 
 /*
  * Helpers for implementing sets of trans_* functions.
diff --git a/target/arm/tcg/translate-vfp.c b/target/arm/tcg/translate-vfp.c
index 359b1e3e96..4bfd857141 100644
--- a/target/arm/tcg/translate-vfp.c
+++ b/target/arm/tcg/translate-vfp.c
@@ -28,6 +28,27 @@
 #include "decode-vfp.c.inc"
 #include "decode-vfp-uncond.c.inc"
 
+TCGv_ptr gen_lookup_cp_reg(uint32_t key)
+{
+    TCGv_ptr ret = tcg_temp_new_ptr();
+    gen_helper_lookup_cp_reg(ret, cpu_env, tcg_constant_i32(key));
+    return ret;
+}
+
+TCGv_i32 gen_set_rmode(ARMFPRounding rmode, TCGv_ptr fpst)
+{
+    TCGv_i32 new = tcg_constant_i32(arm_rmode_to_sf(rmode));
+    TCGv_i32 old = tcg_temp_new_i32();
+
+    gen_helper_set_rmode(old, new, fpst);
+    return old;
+}
+
+void gen_restore_rmode(TCGv_i32 old, TCGv_ptr fpst)
+{
+    gen_helper_set_rmode(old, old, fpst);
+}
+
 static inline void vfp_load_reg64(TCGv_i64 var, int reg)
 {
     tcg_gen_ld_i64(var, cpu_env, vfp_reg_offset(true, reg));
-- 
2.38.1


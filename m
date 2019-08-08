Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp8338313wrv;
        Thu, 8 Aug 2019 13:28:49 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwosdV5o7zHzIp8qHLAdF06BDQ1WNKgiBIBkOTQAWjdsGI6aRH7mPhmBvE7nlCwHf6+ZW1K
X-Received: by 2002:a17:906:ce21:: with SMTP id sd1mr15445210ejb.189.1565296129558;
        Thu, 08 Aug 2019 13:28:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565296129; cv=none;
        d=google.com; s=arc-20160816;
        b=ixMvXtoljP/7fqY3fAhW3vjBe08PX45OkG6i9aveIb+T63BqkPpoTRtIdCwSACiQ9k
         Rhc9JDhN5nIwjneKQfn+jbasKBD7nBlM8GAKboIj4W5Y9aCPs0prPVrxZR5g1Tcpl+VO
         LN0M9mQ8lc3iguqo483gx9CO4kn+4VNFp5ZYQDU76zwBdNQ2h2g4g2epkrDb1yrkgQmb
         vDZ5WTqk8sqj83ay7q6rOxXfNRME/pii0LSLyDNdcb+BUlXSRN6GLUUEEoEdpd2nrhWO
         RQ08p0h8a1UA0E5p1npAEitfFOJ8NwVgZi6rbJKuIIzBGEg2iQDiV87n4HsLDFzpfTRE
         Emtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=Vnbne/W2wov3KpmwjXJZkwuhxAhaLlZZtxHbTHDmpe4=;
        b=T/TKYk8AtZSjks6+P9FXzfDlhK3EgPlu+FC5KYI/gk/nxci4izwA78MpPDLX5bMhxj
         gxJvRkIdKBB2MdJuEaMV16xz55w2MDeBBkgYxqxjTWahKyOiCDLAlb23D1LFKtsqKvvJ
         a5X6MMG7zZiaPymXv7fIZXLwZWtj/+nEc9MorFAQbnL/AEm56fmbBjowstNJcNsdv3lX
         JFdDXtHeoKxI+8ME82jBss593FsNU2Y+ECMYAmg5qxG27/gz+MRzGtDmeLXnF9UDp/98
         GyRsUp8iSWANUo+xnHCayoQTOL5o/+OhmJ63z25K7+UbPpaRVXUh7+AVN6rx8yxJAxs4
         175A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RIwwXksl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e5si1881890ede.185.2019.08.08.13.28.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Aug 2019 13:28:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RIwwXksl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hvp1k-0004dt-MG
	for alex.bennee@linaro.org; Thu, 08 Aug 2019 16:28:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59901)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hvozV-0007Fr-AE
 for qemu-arm@nongnu.org; Thu, 08 Aug 2019 16:26:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hvozT-0001Ke-Qk
 for qemu-arm@nongnu.org; Thu, 08 Aug 2019 16:26:29 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:37151)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hvozT-0001KF-Kl
 for qemu-arm@nongnu.org; Thu, 08 Aug 2019 16:26:27 -0400
Received: by mail-pg1-x541.google.com with SMTP id d1so11820244pgp.4
 for <qemu-arm@nongnu.org>; Thu, 08 Aug 2019 13:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Vnbne/W2wov3KpmwjXJZkwuhxAhaLlZZtxHbTHDmpe4=;
 b=RIwwXkslgVIYPkHoDmBsybWghAJcH0UDGklI/tuE4EYGEe5a5mATL1CjdAja0LuDGd
 RuWX3hOAs7y5acmb8fY2Er2k2rGGq28CRuLqiTXpGgV//3/O+hhoH1CeQRcm300yyKR6
 4bnxb2DSv+MbAaUs3yoeD4UTuuPpaJS9XvSy4cT7uQXLvago1N7nSZd5gyjR7TeaLg1i
 f8qyU1EAOXWx6JUHbDmkwYTQ5f1X/jO7zeMstI8s29JOEljzeex9V6uLfcRmzmuBTS+m
 +H3be5ziHW0Oip2CsTZnVU7ATkJEXl2T65LTxCe9fxs5Hf3UWWdbHaHPtaKojJa5qgpJ
 +pNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Vnbne/W2wov3KpmwjXJZkwuhxAhaLlZZtxHbTHDmpe4=;
 b=QOvGSm4eAd1A4CbTkhroeUaMbGEZ40pOhrnuQ/jbVVxVIfY7yM8ybrMX6AkG11CmtQ
 CDTPmYTEM0HEwckCQvqMRsTQUU9k8fiPtLCXrxxAAFr3xF5YCnnIEHSTXj6yt9sgzJ6H
 +WAm5Q6zFSbP4qXtpUABU/sVeQ88tfjJcm4B611DvlmM/ncvfgwPuRvgCoFo2x0Spffx
 fav9V3DVVSoTdrU+f21AlYEfen5lOTaY2iEfUNvDw4W7B1WZcKkW8eo3ZKjO41IvXlbE
 TNrEdXSIxxiwg84ncFX1OL86U9KnGhXE52Z9vYvtgYhkzPOZQE3GccsVtXkTI9spDpT3
 Wl+g==
X-Gm-Message-State: APjAAAWfwgRmx1nf+oGxlJWKHkupTXJuSzHCVv+70W50RnKU3G+q8opc
 yT5xB1FQ6s6H09NPX2Vr6oZhPw==
X-Received: by 2002:aa7:9118:: with SMTP id 24mr16838473pfh.56.1565295986728; 
 Thu, 08 Aug 2019 13:26:26 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id v12sm2850146pjk.13.2019.08.08.13.26.25
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 08 Aug 2019 13:26:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu,  8 Aug 2019 13:26:15 -0700
Message-Id: <20190808202616.13782-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190808202616.13782-1-richard.henderson@linaro.org>
References: <20190808202616.13782-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
Subject: [Qemu-arm] [PATCH 6/7] target/arm: Simplify SMMLA, SMMLAR, SMMLS,
 SMMLSR
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xm+TvhW6mLVk

All of the inputs to these instructions are 32-bits.  Rather than
extend each input to 64-bits and then extract the high 32-bits of
the output, use tcg_gen_muls2_i32 and other 32-bit generator functions.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 72 +++++++++++++++---------------------------
 1 file changed, 26 insertions(+), 46 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index ddc54e77e4..77154be743 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -391,34 +391,6 @@ static void gen_revsh(TCGv_i32 var)
     tcg_gen_ext16s_i32(var, var);
 }
 
-/* Return (b << 32) + a. Mark inputs as dead */
-static TCGv_i64 gen_addq_msw(TCGv_i64 a, TCGv_i32 b)
-{
-    TCGv_i64 tmp64 = tcg_temp_new_i64();
-
-    tcg_gen_extu_i32_i64(tmp64, b);
-    tcg_temp_free_i32(b);
-    tcg_gen_shli_i64(tmp64, tmp64, 32);
-    tcg_gen_add_i64(a, tmp64, a);
-
-    tcg_temp_free_i64(tmp64);
-    return a;
-}
-
-/* Return (b << 32) - a. Mark inputs as dead. */
-static TCGv_i64 gen_subq_msw(TCGv_i64 a, TCGv_i32 b)
-{
-    TCGv_i64 tmp64 = tcg_temp_new_i64();
-
-    tcg_gen_extu_i32_i64(tmp64, b);
-    tcg_temp_free_i32(b);
-    tcg_gen_shli_i64(tmp64, tmp64, 32);
-    tcg_gen_sub_i64(a, tmp64, a);
-
-    tcg_temp_free_i64(tmp64);
-    return a;
-}
-
 /* 32x32->64 multiply.  Marks inputs as dead.  */
 static TCGv_i64 gen_mulu_i64_i32(TCGv_i32 a, TCGv_i32 b)
 {
@@ -8872,23 +8844,27 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
                            (SMMUL, SMMLA, SMMLS) */
                         tmp = load_reg(s, rm);
                         tmp2 = load_reg(s, rs);
-                        tmp64 = gen_muls_i64_i32(tmp, tmp2);
+                        tcg_gen_muls2_i32(tmp2, tmp, tmp, tmp2);
 
                         if (rd != 15) {
-                            tmp = load_reg(s, rd);
+                            tmp3 = load_reg(s, rd);
                             if (insn & (1 << 6)) {
-                                tmp64 = gen_subq_msw(tmp64, tmp);
+                                tcg_gen_sub_i32(tmp, tmp, tmp3);
                             } else {
-                                tmp64 = gen_addq_msw(tmp64, tmp);
+                                tcg_gen_add_i32(tmp, tmp, tmp3);
                             }
+                            tcg_temp_free_i32(tmp3);
                         }
                         if (insn & (1 << 5)) {
-                            tcg_gen_addi_i64(tmp64, tmp64, 0x80000000u);
+                            /*
+                             * Adding 0x80000000 to the 64-bit quantity
+                             * means that we have carry in to the high
+                             * word when the low word has the high bit set.
+                             */
+                            tcg_gen_shri_i32(tmp2, tmp2, 31);
+                            tcg_gen_add_i32(tmp, tmp, tmp2);
                         }
-                        tcg_gen_shri_i64(tmp64, tmp64, 32);
-                        tmp = tcg_temp_new_i32();
-                        tcg_gen_extrl_i64_i32(tmp, tmp64);
-                        tcg_temp_free_i64(tmp64);
+                        tcg_temp_free_i32(tmp2);
                         store_reg(s, rn, tmp);
                         break;
                     case 0:
@@ -10114,22 +10090,26 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
                   }
                 break;
             case 5: case 6: /* 32 * 32 -> 32msb (SMMUL, SMMLA, SMMLS) */
-                tmp64 = gen_muls_i64_i32(tmp, tmp2);
+                tcg_gen_muls2_i32(tmp2, tmp, tmp, tmp2);
                 if (rs != 15) {
-                    tmp = load_reg(s, rs);
+                    tmp3 = load_reg(s, rs);
                     if (insn & (1 << 20)) {
-                        tmp64 = gen_addq_msw(tmp64, tmp);
+                        tcg_gen_add_i32(tmp, tmp, tmp3);
                     } else {
-                        tmp64 = gen_subq_msw(tmp64, tmp);
+                        tcg_gen_sub_i32(tmp, tmp, tmp3);
                     }
+                    tcg_temp_free_i32(tmp3);
                 }
                 if (insn & (1 << 4)) {
-                    tcg_gen_addi_i64(tmp64, tmp64, 0x80000000u);
+                    /*
+                     * Adding 0x80000000 to the 64-bit quantity
+                     * means that we have carry in to the high
+                     * word when the low word has the high bit set.
+                     */
+                    tcg_gen_shri_i32(tmp2, tmp2, 31);
+                    tcg_gen_add_i32(tmp, tmp, tmp2);
                 }
-                tcg_gen_shri_i64(tmp64, tmp64, 32);
-                tmp = tcg_temp_new_i32();
-                tcg_gen_extrl_i64_i32(tmp, tmp64);
-                tcg_temp_free_i64(tmp64);
+                tcg_temp_free_i32(tmp2);
                 break;
             case 7: /* Unsigned sum of absolute differences.  */
                 gen_helper_usad8(tmp, tmp, tmp2);
-- 
2.17.1


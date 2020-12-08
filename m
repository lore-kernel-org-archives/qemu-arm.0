Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp4242143lfb;
        Tue, 8 Dec 2020 10:14:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwvNlYTHNs5TSm7FYAhULL55WHYya9sgXHEZxPlJLJbl50zrRzqveD328mP8Y6K+4Gti7l2
X-Received: by 2002:a25:4258:: with SMTP id p85mr8310433yba.423.1607451244696;
        Tue, 08 Dec 2020 10:14:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607451244; cv=none;
        d=google.com; s=arc-20160816;
        b=LgmcGEtBwmxrpsS6Z+6Iv2AJvJ3+zEzLz/kP/+2tNpL33FmcOMXbBtzaAjojRfMW74
         etNMeVJz/t970qK3j5XOv6UFRNWaBhJ4HL7zJnphB2w/bhtUi6snXXdyuFTN4g1GwTMW
         IklrSHpm+TGJv9/NBpLLAhRnwrsSEPwxEX//J4m23Jj+lottzoC2Xba99FrYVvmNlJYD
         OhuxojIdpr3/S6BOl+YcQvDJgZmHrJh2/S8DFPnqZqiHQuzn5nZ7R8yeqPhba0T/tz+F
         GNKFjvHE2Ys5PjZ1pc2Spo6CNmwFzwcSC07b2MDJqcVNyKI6F3wvOmP1rQKOwsTywhLm
         A8pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=fercAGK8YQyiVry22f4HwuGxBL5M6y/uB9CpbtGGXJs=;
        b=RMJHGc6tTfaLo/9qKPGKswC3pkH5wV9wLlKMhfrqTmZg19i4s6r6GL0EWJWCnpQnUp
         JPXCx7WKAJRIEA69p88RGZaaQ3y9UhoL27cI/UH2KRGBJG0/e+iFVKqDjoc0StqwGG45
         hBL7IG6VaYug0CJ7Dl16JBRCFS6vHGv/I0KGQcstKeBp/GB6xGWFzufZEfLOFMgP5IYy
         9u+zaz0Zg0dLqgDVch+0FHpgDiVA1bTjePzpHK+SHIfL8ojCVO7bqj4b0VEynOXUUv6f
         fQDZw2OnWqio4U8ec7lNLPTfs4HnopddaWFM5746+FXNhRI8ujiLw119g+AcGiqCWOJI
         PD4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KD9zBPdo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r12si16509497ybb.448.2020.12.08.10.14.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Dec 2020 10:14:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KD9zBPdo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kmhUy-0002Vx-2U
	for alex.bennee@linaro.org; Tue, 08 Dec 2020 13:14:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmhJL-0008Da-7q
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 13:02:03 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:36431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmhJG-0006Q9-Oy
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 13:02:02 -0500
Received: by mail-ot1-x341.google.com with SMTP id y24so16645135otk.3
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 10:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fercAGK8YQyiVry22f4HwuGxBL5M6y/uB9CpbtGGXJs=;
 b=KD9zBPdoQoHt/DYMPtmuyY8Gp0D6FAeRXOPpYvg6cBh3EE2Rz0JomAI7k0LZPGexGZ
 Lw6lilmJXlx0Uklk9zUbeiLIvcCpN0hIQLfggb8fQh5FfxmE9zpozam0JG2O3kxPwMMr
 rJ1CVplBocDBYY79Oi1IQxZEIjZwW3adEgzHuqUJP/jJjLyh1r2pVTbFwxSGZwGBokVA
 o2iqyu3Peic7iTzZhutRhjVhtCtQoGYOXZ/Suvw6O5gXy7WAKesO6YiJG3oTeL3gGtWw
 a7fqNCW6E01Pf02NZwJD0MAh6Au5HlF9xeqvIMqFMPorzUQGausA/8usyAqoWo1HeOyc
 j5eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fercAGK8YQyiVry22f4HwuGxBL5M6y/uB9CpbtGGXJs=;
 b=jsG4/pVIOLWVTInw+thHmb+HCEVE1HbAAnzlkqlpW0M5OYpM56RTHELW4VuPQI8kpB
 RVs2NY4rNBSUcirKN11NidOomofjy7VuA/ZnaUiPjutZBBeixcgd1O86rZV0mhweSqe3
 szcS8V9rzzKQvWSE7DpzPNfAC+rRvnnBjyN2i2AgODOWNAjwlLg4OHekdOBwSQucMDOR
 FwOR9qbagy0d2/zuV+A2bQBYHfzRsEzz5Ya2fW7p495im4jui9UivS72PAUZmdfNfom7
 KA+jnDkYBuGSpcb5VrRUFu/YjKghHCs13fLkAeBwxYfEHS/7FxMfuJaUIrZgddPBXhzD
 1BOA==
X-Gm-Message-State: AOAM530SbxLGGCwpN7GcBD1G/fEGX7mgzK/pKPQjST8y13VIaVewD8j1
 xqku1UNR6AuH/ba+11+oN/HqqmeVx1eAmUi0
X-Received: by 2002:a9d:7c98:: with SMTP id q24mr17538772otn.147.1607450516518; 
 Tue, 08 Dec 2020 10:01:56 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id k20sm3886805oig.35.2020.12.08.10.01.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 10:01:55 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 19/24] target/arm: Enforce alignment for aa64
 load-acq/store-rel
Date: Tue,  8 Dec 2020 12:01:13 -0600
Message-Id: <20201208180118.157911-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201208180118.157911-1-richard.henderson@linaro.org>
References: <20201208180118.157911-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x341.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FKtXifoxIRBJ

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 152a0a37ab..67a9b3bb09 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -2669,7 +2669,8 @@ static void disas_ldst_excl(DisasContext *s, uint32_t insn)
         tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
         clean_addr = gen_mte_check1(s, cpu_reg_sp(s, rn),
                                     true, rn != 31, size);
-        do_gpr_st(s, cpu_reg(s, rt), clean_addr, size, true, rt,
+        /* TODO: ARMv8.4-LSE SCTLR.nAA */
+        do_gpr_st(s, cpu_reg(s, rt), clean_addr, size | MO_ALIGN, true, rt,
                   disas_ldst_compute_iss_sf(size, false, 0), is_lasr);
         return;
 
@@ -2686,8 +2687,9 @@ static void disas_ldst_excl(DisasContext *s, uint32_t insn)
         }
         clean_addr = gen_mte_check1(s, cpu_reg_sp(s, rn),
                                     false, rn != 31, size);
-        do_gpr_ld(s, cpu_reg(s, rt), clean_addr, size, false, true, rt,
-                  disas_ldst_compute_iss_sf(size, false, 0), is_lasr);
+        /* TODO: ARMv8.4-LSE SCTLR.nAA */
+        do_gpr_ld(s, cpu_reg(s, rt), clean_addr, size | MO_ALIGN, false, true,
+                  rt, disas_ldst_compute_iss_sf(size, false, 0), is_lasr);
         tcg_gen_mb(TCG_MO_ALL | TCG_BAR_LDAQ);
         return;
 
@@ -3476,15 +3478,18 @@ static void disas_ldst_ldapr_stlr(DisasContext *s, uint32_t insn)
     int size = extract32(insn, 30, 2);
     TCGv_i64 clean_addr, dirty_addr;
     bool is_store = false;
-    bool is_signed = false;
     bool extend = false;
     bool iss_sf;
+    MemOp mop;
 
     if (!dc_isar_feature(aa64_rcpc_8_4, s)) {
         unallocated_encoding(s);
         return;
     }
 
+    /* TODO: ARMv8.4-LSE SCTLR.nAA */
+    mop = size | MO_ALIGN;
+
     switch (opc) {
     case 0: /* STLURB */
         is_store = true;
@@ -3496,21 +3501,21 @@ static void disas_ldst_ldapr_stlr(DisasContext *s, uint32_t insn)
             unallocated_encoding(s);
             return;
         }
-        is_signed = true;
+        mop |= MO_SIGN;
         break;
     case 3: /* LDAPURS* 32-bit variant */
         if (size > 1) {
             unallocated_encoding(s);
             return;
         }
-        is_signed = true;
+        mop |= MO_SIGN;
         extend = true; /* zero-extend 32->64 after signed load */
         break;
     default:
         g_assert_not_reached();
     }
 
-    iss_sf = disas_ldst_compute_iss_sf(size, is_signed, opc);
+    iss_sf = disas_ldst_compute_iss_sf(size, (mop & MO_SIGN) != 0, opc);
 
     if (rn == 31) {
         gen_check_sp_alignment(s);
@@ -3523,13 +3528,13 @@ static void disas_ldst_ldapr_stlr(DisasContext *s, uint32_t insn)
     if (is_store) {
         /* Store-Release semantics */
         tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
-        do_gpr_st(s, cpu_reg(s, rt), clean_addr, size, true, rt, iss_sf, true);
+        do_gpr_st(s, cpu_reg(s, rt), clean_addr, mop, true, rt, iss_sf, true);
     } else {
         /*
          * Load-AcquirePC semantics; we implement as the slightly more
          * restrictive Load-Acquire.
          */
-        do_gpr_ld(s, cpu_reg(s, rt), clean_addr, size + is_signed * MO_SIGN,
+        do_gpr_ld(s, cpu_reg(s, rt), clean_addr, mop,
                   extend, true, rt, iss_sf, true);
         tcg_gen_mb(TCG_MO_ALL | TCG_BAR_LDAQ);
     }
-- 
2.25.1


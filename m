Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp1502776lfb;
        Mon, 19 Apr 2021 13:53:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzIQSLCBvfNZKhFFGqB5lBkr0xjSLlRHpSl0Bj67YzvdR7Bl+NW73tkxRUkFYVwUKaW72Qt
X-Received: by 2002:a05:6e02:5a2:: with SMTP id k2mr19679092ils.177.1618865636076;
        Mon, 19 Apr 2021 13:53:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618865636; cv=none;
        d=google.com; s=arc-20160816;
        b=dEuYNR4f+hdvZTWA6w/BC2NeWB5CT+h/4gTHM6NVhIecrK7idTrOi/BPhDDGON/g9J
         WynfZSvJbRJsL4F4j028KQZgjWKafGnaIsn5P2Gd6hPbFxqDZBitCnvX33yAeNbx/4PM
         I2zBcI+HjdoCzwgF2CrhQR/3XwLVLn9lEdBDqgJHwVkFS1Bb3bXqfMqt/gEBkvDLV+Rf
         EX5SQzaX5VzHg25XqheLYkQdtU+jFOyw+MJLEs0KsSq4qGgLiHvWVhS/GiXoHrEY99il
         r9El5P+xLwLsZygz7XUDgpicgNJryVI3IXMDZmFTAh6OD2Cy9J6aM3QfEgKefwSR1fx4
         E6tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=4YmyrCHsuRewu4q7IzToC9sV4YEHbKzZOaqHia3EHmw=;
        b=GWWHke48elKV0PLWjt6mMREZXiwfwBVWi4jtTfZ+jB07XqiAQwyQJMppCNUdt2W/85
         Ra6YT4pnbR74nXphMJNsI/ogQO/v+jx53dvhwm5IzwXLT60KchMatQtPY6VYYtOT5mgW
         qXRj+mGRakaulAEOSRcGuADg6vhnrVynE4O8MsxqOMSzlJpVOagdQrO8WQZxLZBDE9aU
         XvdalJTxTISeNjJTFfb5zd4IGrnkP6cqNmxmK1RiDumoApL1yrgnv6DnVIT1tfq0dcJA
         wcMKCAuOJVjqAHwW/qHAdCMJGqMGBMF0QsgV6IFdHfCTAnE0h8Quoop4wpVve+hrbx/h
         T0KQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gH7gMSWc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 10si19467553ilx.32.2021.04.19.13.53.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Apr 2021 13:53:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gH7gMSWc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lYau3-0007o4-EP
	for alex.bennee@linaro.org; Mon, 19 Apr 2021 16:53:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYaQy-000801-Pn
 for qemu-arm@nongnu.org; Mon, 19 Apr 2021 16:23:52 -0400
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732]:34728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYaQw-0002mj-9Y
 for qemu-arm@nongnu.org; Mon, 19 Apr 2021 16:23:52 -0400
Received: by mail-qk1-x732.google.com with SMTP id y136so5099072qkb.1
 for <qemu-arm@nongnu.org>; Mon, 19 Apr 2021 13:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4YmyrCHsuRewu4q7IzToC9sV4YEHbKzZOaqHia3EHmw=;
 b=gH7gMSWcTLqYagdDfJMzhug0tDUZlQBu7AnD6xTzrm/KG44pinnowAiSN5eMhlIiIE
 Ue6WHphsBOIP5MDHKTZISQXYe1JjFa3bsU+G5dUAxsBTC/ljSvI7gaOljH6sczzZh1Ra
 3/miUS1pcmqzsH2Lp08OQsSIBYnoj/NA92lBt8fVEqQzpwT216YqCIwimw+aoiIROtDZ
 xf+iJjSTZ7uGk45JjHZicB4pqUOCsPcP8ABqCjqdeto4Z15Z0MWZA2YnmdgoOAxp5Eu1
 QDah9jFeVHJ4/Epyu7qeFbF/Ffa+C7N6egFaC4bbp06/tcYru8fnH0wv11I/CVpzuC7U
 9OwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4YmyrCHsuRewu4q7IzToC9sV4YEHbKzZOaqHia3EHmw=;
 b=WF35P0AZFaVyIrrYq92dCB/kS8aJZ3qzqbhd4uQwsjV6g2YZlEjM9CB59SnIxAfsZG
 PIHk6NTE15ZD27eDJIJMqetpkLUrKN1Pj1JAMCBRleXSO7cSGMMpi57ub2Mao/p5zLmy
 RuJwOOtWGBMCR65KLRY46WIaa3qVHHccLllc8fBzGopwm/LGdVDEgY+u2+Tu9hjQJAu+
 w93asCPhs8yXz0wnNotpScZbmZpYRqIW3G60qxe+VPHUiuFTsrL1ElU2GjYDIopr0fml
 BXrSdv19iywOGRCUPyKLaD/+RF7e/BPhFWfMuTPIwykqzfCHzRzLnkhm/SjdbJKMEJzw
 hkiA==
X-Gm-Message-State: AOAM5337jA0HlXk5j3W32CgnYW8f0/1JtmJJFaLfof/Ng43U15NkxRWI
 VaJAFLFHLlHAoQqxNmTrU0LnZQ==
X-Received: by 2002:a05:620a:66a:: with SMTP id
 a10mr8864677qkh.272.1618863828931; 
 Mon, 19 Apr 2021 13:23:48 -0700 (PDT)
Received: from localhost.localdomain ([2607:fb90:80c7:aba4:3594:91a:8889:c77a])
 by smtp.gmail.com with ESMTPSA id c23sm10007835qtm.46.2021.04.19.13.23.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 13:23:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 27/31] target/arm: Enforce alignment for aa64
 load-acq/store-rel
Date: Mon, 19 Apr 2021 13:22:53 -0700
Message-Id: <20210419202257.161730-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210419202257.161730-1-richard.henderson@linaro.org>
References: <20210419202257.161730-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::732;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x732.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pf4MW4q9oi6Y

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index b90d6880e7..ac60dcf760 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -2699,7 +2699,8 @@ static void disas_ldst_excl(DisasContext *s, uint32_t insn)
         tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
         clean_addr = gen_mte_check1(s, cpu_reg_sp(s, rn),
                                     true, rn != 31, size);
-        do_gpr_st(s, cpu_reg(s, rt), clean_addr, size, true, rt,
+        /* TODO: ARMv8.4-LSE SCTLR.nAA */
+        do_gpr_st(s, cpu_reg(s, rt), clean_addr, size | MO_ALIGN, true, rt,
                   disas_ldst_compute_iss_sf(size, false, 0), is_lasr);
         return;
 
@@ -2716,8 +2717,9 @@ static void disas_ldst_excl(DisasContext *s, uint32_t insn)
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
 
@@ -3505,15 +3507,18 @@ static void disas_ldst_ldapr_stlr(DisasContext *s, uint32_t insn)
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
@@ -3525,21 +3530,21 @@ static void disas_ldst_ldapr_stlr(DisasContext *s, uint32_t insn)
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
@@ -3552,13 +3557,13 @@ static void disas_ldst_ldapr_stlr(DisasContext *s, uint32_t insn)
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


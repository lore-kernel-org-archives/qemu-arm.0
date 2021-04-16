Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp657758lfr;
        Fri, 16 Apr 2021 12:13:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy4w3RFpaE7kqAv3mNlbaGZo9qgXgkC6wTvPSogi0zw9CuFLwDX/fmt0+HMSlBUyWfM66Fl
X-Received: by 2002:a92:d02:: with SMTP id 2mr8217218iln.159.1618600387115;
        Fri, 16 Apr 2021 12:13:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618600387; cv=none;
        d=google.com; s=arc-20160816;
        b=KC9L7GQczM21nmSryPJVPrud5V5Jqxwi25hWrTvReCLXbJkP59Bag2tlO1Vz22zy8t
         55Hc8tAIWqoNyK1opN6YaD8Ie4pWbZK7UnhA/Oz41wbJD/NRFdRi57sF0aYGaX3R10PZ
         J2P03jb3mX08jKXdlCoVNLuh2Xi6m6oQuhJqwxjHsR3PkuMVXAY51jho72TOrV8ILSYz
         FjZ0UHiz7ZKZ8jChDpKKimcOX+bocYOQMHyw9YstCEjA5dDuiz1UY/7fnF+ZD82Z41DR
         0K/OrxLtBaCuilz3oH1RZHlfWfzR5PCfXb64R+SQgAELD+Y0uTc/3bgn8bZyyG/ov5lQ
         U8Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=4YmyrCHsuRewu4q7IzToC9sV4YEHbKzZOaqHia3EHmw=;
        b=IN3big9iJPhj/EZe/jiUtvrJ/dkIfVg2IS9KdU+EjLFKygJQvN6OOENIQLWCvz01wO
         35Ql6OrYi5DI3Ch1Eof6MFDvpEd+luba0mimRk5XDzt0tY7tFI5hwFTNGnw/awnerqru
         GJ7L+SzqyxpU8M1oOEa98Ix7j5s1+c9XK+w8bNpmKIUbVnMXb5h+wKKUyUwkr/6sIdLR
         VK5O81nf8zUk9LZHme2cttNwtlcIMLYgu1aJc3rNdBIYv6Up+Wj11zTt5FF4X6te9OWo
         HY5iU4KIjU7dS9XXSFZZAbRJvuLKZAL1yGKvILXG0xjjoH9FJ5kB009czs4vlCRg00hV
         wKAA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IwAjoN70;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u12si6461281jak.73.2021.04.16.12.13.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Apr 2021 12:13:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IwAjoN70;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lXTtq-0002ao-Fl
	for alex.bennee@linaro.org; Fri, 16 Apr 2021 15:13:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXTi3-00043N-No
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 15:00:58 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:54821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXThb-0004Ta-VB
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 15:00:55 -0400
Received: by mail-pj1-x1035.google.com with SMTP id cu16so12507374pjb.4
 for <qemu-arm@nongnu.org>; Fri, 16 Apr 2021 12:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4YmyrCHsuRewu4q7IzToC9sV4YEHbKzZOaqHia3EHmw=;
 b=IwAjoN70hRWeh3MYx/1PnYv+cGIuW9RRGf5UqDkUYjqI6Uwyh+naFo570QuneTnhvD
 KObAhv6AyqucCb7hiJ+MMf/dNAtf8azE1hUPKZvkzcXAUnoRJWOTbctpQIT38UHjhlgj
 T+1FwJJsrjv5kUW5BKOBOkRFHfXioLYgIya6RmKJ9jYTGBzHAa/JjdgHfm1X00qzoAsf
 865dAbSifzHBq0G9r+onnMDtP4zH2cerRJ6G3exNYedOq9e5AlzOOexp0MRl7KXrsQ0P
 R/KFMOsMA8nSO/YPDoscw9KujsA26lhTyKnStch7dm2j8PkK675swKJduuGfUH77jPdO
 8Ltw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4YmyrCHsuRewu4q7IzToC9sV4YEHbKzZOaqHia3EHmw=;
 b=fTLjwU63Gm3sFuiDdS78LigZ5fMb6+8az6mOZR4lwCmXVdRuBzBJYmBQ1RltQN2UsQ
 FpAdIuvgy1zl1EsrpG00i5Dq7u89YH/uJrUdugIc616bSDoC7QSLWEzFnQ8tNnEDhfAG
 2uTrPo2R332SUH3cjqRa75UVVGCVYcw+y7t6TtlJy25hUvwGRaKNnPxasG0U3noZcEWW
 WYaXvW3MNHDEi4UIZIhdwwSJiEeqQTM083bBr+IRtEKcgIqk4+mURrjUbo631/XW0opz
 Q5u2eToSd0F1OiswLKLu3P8iFM8bHKzu4XMSvu7Jmn0/JQzCnOp4vctjXvpfBH7ASJs2
 XMqA==
X-Gm-Message-State: AOAM533p/RxUDefWukkgZ6o40zvCaL9zWz4PA67PWqxA3EQKHlllo4dy
 pe4ZdvDU/oucM38keNX4JxRiVQ==
X-Received: by 2002:a17:90a:6396:: with SMTP id
 f22mr11221502pjj.91.1618599626461; 
 Fri, 16 Apr 2021 12:00:26 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id d7sm1988337pfv.197.2021.04.16.12.00.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 12:00:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 26/30] target/arm: Enforce alignment for aa64
 load-acq/store-rel
Date: Fri, 16 Apr 2021 11:59:55 -0700
Message-Id: <20210416185959.1520974-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416185959.1520974-1-richard.henderson@linaro.org>
References: <20210416185959.1520974-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
X-TUID: 8GeaOF0eDhkK

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


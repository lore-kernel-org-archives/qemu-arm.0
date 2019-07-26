Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp207041wrv;
        Fri, 26 Jul 2019 10:50:59 -0700 (PDT)
X-Received: by 2002:a63:6fcf:: with SMTP id k198mr91443087pgc.276.1564163459074;
        Fri, 26 Jul 2019 10:50:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564163459; cv=none;
        d=google.com; s=arc-20160816;
        b=eZSY6zEggJrDxct/ZBJCSR+8XnGAmp9aTNbn/O5gT93D7ClSKkRMnQMlSe95wRq6cE
         qJuXwMaG4IQZaLqtL8nSZ1gnjHv4vhQXmg83AGkbQyIEQecNdpOmXFCbDzHzVAPkWb0G
         7ABomQH3MHNOZ57sfuSJhOGclvij5OP7gpJ0bz9ZQPWXf+CR2KMDsKLQ9RbAXOimFdmC
         lhemn12mFGmOPfyUjXZ62G4DxOath3GRHmPWXPQWFOgZduXc8phOrZcyarPkqBW8a2tN
         QELj9boyttDlJuFapcRVJASBg8I6N86mXzXyDzmDGgnagtShEIaPAvWPmoewLtafTqKC
         71sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=ukXEAQeVlVRr0NDtltS3ky/umJGI1MT5scY2efu29x8=;
        b=GRiFNE6vbx1gZcAVOuXiEEctjD31d2atqmRLALYVbgVCKPGDzIRfJgwqBjNgL/SOR0
         SyYHxExpRw95Eyuz1einsEEVWVOS0SgGMnbfmL1YKkTjIHvt4lMwmAik0Us74dNjB5CA
         l5j2bVVKbcFWVmMKlTqP6u+RVA4mJjLziEvSkpyBq3OaLcFqgBSDMFKD1ew+iLziR62X
         ykDw9jG7O4sx6cJg8ELm2Vh2GIoabg7HZPWB98BqEZOG+/MyLgO7oI7X5+tjpzpBgOaF
         pyJEJzP5lSx8MdrzZuMPbrfPE5dWBse0nyviEZNT3M74lN0ca4qK3Htm+VppGnbAt0gL
         3ORg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rGfwYEjj;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id c27sor6545600pgl.52.2019.07.26.10.50.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 26 Jul 2019 10:50:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rGfwYEjj;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ukXEAQeVlVRr0NDtltS3ky/umJGI1MT5scY2efu29x8=;
        b=rGfwYEjjH1zbSGoLAJkn1Y0CKXSSsSU6We6F5QakfoswaOEfaMrNaZ/MOXtJlSCY83
         NXT7YNqwfoZ+o3ayyQJL/+X55FLA8xpHycQCUezKhoIe1BKw5qAiy6H6Y7ct6LRRSUQo
         vaT5TzUetA99hu5m0vG67feKLagNoji2lCMdpYjHmr2FfGJ7o6Yp4jmotB24+WyTvPMI
         kg6YjfWWY/pt0A4hnE8Xf+Tz/FdoCXkZ1kc2J7Nipq5FwbU6rnQAuBhzr6/rzKXMqQX7
         6mhYm3YdVIl2HyoBT1mhBNgSOuGStzODjPvdMP5r9ZHD+9a8V7bxYm5o0swrkltZHVe7
         RfEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ukXEAQeVlVRr0NDtltS3ky/umJGI1MT5scY2efu29x8=;
        b=Q0xqZHBTXseHlUfMCKno3UJZA4tLRsPY/5MWlW+rgl8odTcPg3/Qpu9PJ+cNFLp+CU
         sIrYa+WnFFpM1yAdchtuV6lGiZ2qNZFgXau86ajw5NQK0YIVzMJiwWHQLSuZD3SftB9r
         19XcaTd6KYHnIq4eUj0puDqJ4r5gSEJDu+p/diFH/X9nBkahLGuggUOR+X0JILoMz9rR
         MQxmYUZP2AMx8bgUTMy6lN7P26Q0r8a6BEouH5+SdmCSarvySpTzDJBV+lL7ub4WmVc+
         H3Pi+smOSDCpzpVlo93+nAYSUFx32SWLaQl5KlWwjyzp4muCe13PG/0v85kHGoiN29Ye
         QCSg==
X-Gm-Message-State: APjAAAWzW/FIUoOlKejUYBn0mZG4GYfx5suJ5uNLfgB1vDVnQ6HhivyT
	swXCQQADlem8rD4uUaHS0Oaj3ah7
X-Google-Smtp-Source: APXvYqzZa3m4zaryyY4hB6bznSS8dIpJKQmWqYNMePVD+wTXBqpr0bFAE6nn24eVeT3UAY41z3I7Jg==
X-Received: by 2002:a63:36cc:: with SMTP id d195mr51512589pga.157.1564163458590;
        Fri, 26 Jul 2019 10:50:58 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-117-207.tukw.qwest.net. [97.126.117.207])
        by smtp.gmail.com with ESMTPSA id o24sm104287919pfp.135.2019.07.26.10.50.57
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 26 Jul 2019 10:50:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH 21/67] target/arm: Convert T32 ADDW/SUBW
Date: Fri, 26 Jul 2019 10:49:46 -0700
Message-Id: <20190726175032.6769-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190726175032.6769-1-richard.henderson@linaro.org>
References: <20190726175032.6769-1-richard.henderson@linaro.org>
X-TUID: WB/hT9jY3uMe

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 24 +++++++++++++-----------
 target/arm/a32.decode  |  1 +
 target/arm/t32.decode  | 19 +++++++++++++++++++
 3 files changed, 33 insertions(+), 11 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 09310b1c3a..d19131d594 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -7683,6 +7683,11 @@ static void arm_skip_unless(DisasContext *s, uint32_t cond)
  * Constant expanders for the decoders.
  */
 
+static int negate(DisasContext *s, int x)
+{
+    return -x;
+}
+
 static int times_2(DisasContext *s, int x)
 {
     return x * 2;
@@ -8053,6 +8058,12 @@ static bool trans_ORN_rri(DisasContext *s, arg_s_rri_rot *a)
 #undef DO_ANY
 #undef DO_LOGIC
 
+static bool trans_ADR(DisasContext *s, arg_ri *a)
+{
+    store_reg_bx(s, a->rd, add_reg_for_lit(s, 15, a->imm));
+    return true;
+}
+
 /*
  * Multiply and multiply accumulate
  */
@@ -10758,17 +10769,8 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
                         }
                         store_reg(s, rd, tmp);
                     } else {
-                        /* Add/sub 12-bit immediate.  */
-                        if (insn & (1 << 23)) {
-                            imm = -imm;
-                        }
-                        tmp = add_reg_for_lit(s, rn, imm);
-                        if (rn == 13 && rd == 13) {
-                            /* ADD SP, SP, imm or SUB SP, SP, imm */
-                            store_sp_checked(s, tmp);
-                        } else {
-                            store_reg(s, rd, tmp);
-                        }
+                        /* Add/sub 12-bit immediate, in decodetree */
+                        goto illegal_op;
                     }
                 }
             } else {
diff --git a/target/arm/a32.decode b/target/arm/a32.decode
index 32d1833037..baae62dea9 100644
--- a/target/arm/a32.decode
+++ b/target/arm/a32.decode
@@ -30,6 +30,7 @@
 &rrrr            rd rn rm ra
 &rrr             rd rn rm
 &rr              rd rm
+&ri              rd imm
 &r               rm
 &i               imm
 &msr_reg         rn r mask
diff --git a/target/arm/t32.decode b/target/arm/t32.decode
index abd233180d..69e81ef71a 100644
--- a/target/arm/t32.decode
+++ b/target/arm/t32.decode
@@ -27,6 +27,7 @@
 &rrrr            !extern rd rn rm ra
 &rrr             !extern rd rn rm
 &rr              !extern rd rm
+&ri              !extern rd imm
 &r               !extern rm
 &i               !extern imm
 &msr_reg         !extern rn r mask
@@ -121,6 +122,24 @@ SBC_rri          1111 0.0 1011 . .... 0 ... .... ........     @s_rri_rot
 }
 RSB_rri          1111 0.0 1110 . .... 0 ... .... ........     @s_rri_rot
 
+# Data processing (plain binary immediate)
+
+%imm12_26_12_0   26:1 12:3 0:8
+%neg12_26_12_0   26:1 12:3 0:8 !function=negate
+@s0_rri_12       .... ... .... . rn:4 . ... rd:4 ........ \
+                 &s_rri_rot imm=%imm12_26_12_0 rot=0 s=0
+
+{
+  ADR            1111 0.1 0000 0 1111 0 ... rd:4 ........ \
+                 &ri imm=%imm12_26_12_0
+  ADD_rri        1111 0.1 0000 0 .... 0 ... .... ........     @s0_rri_12
+}
+{
+  ADR            1111 0.1 0101 0 1111 0 ... rd:4 ........ \
+                 &ri imm=%neg12_26_12_0
+  SUB_rri        1111 0.1 0101 0 .... 0 ... .... ........     @s0_rri_12
+}
+
 # Multiply and multiply accumulate
 
 @s0_rnadm        .... .... .... rn:4 ra:4 rd:4 .... rm:4      &s_rrrr s=0
-- 
2.17.1

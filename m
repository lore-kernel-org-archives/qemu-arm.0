Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp207446wrv;
        Fri, 26 Jul 2019 10:51:25 -0700 (PDT)
X-Received: by 2002:a63:2c8:: with SMTP id 191mr91128089pgc.139.1564163485381;
        Fri, 26 Jul 2019 10:51:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564163485; cv=none;
        d=google.com; s=arc-20160816;
        b=Ff3YZiIamSAjAVzCjkBfNff1Kabw6j34ZN/fzbk2D726nlkpRkwjJ80adYt7XOYu/r
         0670GcIntAvCk+7TuiZKdt6CEtm00ForiXQ4MOAiXa4RbA++D6ng+qj8KiPk4qgVzR0S
         T/HTN7AyZE3cb9JnEVyEq6tj+1VZtNsS4KcVmOI3hmit7hgc5xwebXCFNmTWxL563kM9
         s/Gp4GZfsy0BNlj+/d0V1FmhTMb36+1a6MCURDkP0WWC62CquuKSwXORa7ulsegFcS1d
         v/SvOMJHd8uckISDRt2q6gFqPZioesmZVeiZeRmwcJZdJnLaPnpCH8Mwz6LrtwEvo75u
         si0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=j/Y5KQrISdOhV+y6GL73HUL9WgurT5sljbcK6vWGUPQ=;
        b=kbSPbEggbWFP6Vil8ssKwF58IZy5oidx/VkjD+ONRGlf9L8hfJrv8i6cdeYZUfePbX
         n92zR3iviSoK1Iooe8RLMdYx2BEpSGBPoYkQVbj47HxUqJOZQgTfQZiwRW6+f9OAWYVY
         2rdzotP5dUudSiAr7xzFiJyJY3oGWBfONhH49IKZSTtk29UwkFy/BGcnm8hFGlK7wVTN
         qTld5uDywCnOctl5A2vp8L2Cy90kEqsR1Jks0SboStl73xcdV5xmKC5JtVt65HkwA97e
         BCxgTHzqstOZOmQO4vecK+aRWyGX7qkfqAAJeLIN4mfFyz/Hox6bp3eIHdi6+WJzeayf
         RB3w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DqavtkYf;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id x18sor33249184pgx.37.2019.07.26.10.51.25
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 26 Jul 2019 10:51:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DqavtkYf;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=j/Y5KQrISdOhV+y6GL73HUL9WgurT5sljbcK6vWGUPQ=;
        b=DqavtkYf6IoaO0cuL4mNyqfvDRLI7vMm1q5C6uakUbdR1LJVwBUK/A2/zSn7JYdFIb
         JmuV2mTZz/QPX5By/YKKcQKnFqY3PjyOTmI5seSXG6bqSEgDCc4o9W1A/plSu+LFK30X
         9Py9W/i1te/HU0WXoOWP4ld3bcytoz+Zki97kJvPSivIb7aYPZDSJYP7Jm3SqRjtEo5m
         KJM1qmBiC9XJG96QyNea+d98JS0jgGzaebqJA2gUR7Vxen9LlMfgULsw7Mmv+jT5pJff
         PF4SvbnedhlcXh2MXHiaZ53KbsHcggYXBb7XfPAFyiaG18nbmLisYo1Hymbw1mokXu4z
         ZZ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=j/Y5KQrISdOhV+y6GL73HUL9WgurT5sljbcK6vWGUPQ=;
        b=ZW2OnyG3jSrHu0019bTydWERvK5Df5qFEplnXTnCTcCVz5pqzXvWLtZLb+od347fzb
         AVHOuab5wEXN4NKxpn6FiRfdb6/QzZjyMs7uyq2GblT8yr4a9U1ZHAwuLGt853Rt9CsR
         vPmgHOpwnhdvpEa4qdBtFuPp4dInBEAxFZN2jjl8jcTD9PElGveOrJ8pUrt35hq/XsDd
         iAE9EJ4vfwpKIojbq7zKaLn+5KM6bV7ddQ4SDCNsOgqYPWhvio+/vHnOhkvvJj5vAh68
         dng5S5bMx8gcPvnOsgksWnMXbMhqLyFcrQ/ShCITZEE9SqeA1KEqYTCf4nnJLh51teOu
         o9xQ==
X-Gm-Message-State: APjAAAVAnokvLUS8TZO1QcUrgbKmTTHhtgxR8YX1jRrGObqnWoRPnJFm
	mrdK1D7tiG95V8EOo8oZ8sULoQlT
X-Google-Smtp-Source: APXvYqzGO6rhFYHOHjFAKRUdLnTPf6Y04Nw53cjQHF/gSr0NKVcgu9AL/WMtNTI3HuyP771840Dyxw==
X-Received: by 2002:a63:2c8:: with SMTP id 191mr91127952pgc.139.1564163482963;
        Fri, 26 Jul 2019 10:51:22 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-117-207.tukw.qwest.net. [97.126.117.207])
        by smtp.gmail.com with ESMTPSA id o24sm104287919pfp.135.2019.07.26.10.51.21
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 26 Jul 2019 10:51:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH 41/67] target/arm: Simplify disas_thumb2_insn
Date: Fri, 26 Jul 2019 10:50:06 -0700
Message-Id: <20190726175032.6769-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190726175032.6769-1-richard.henderson@linaro.org>
References: <20190726175032.6769-1-richard.henderson@linaro.org>
X-TUID: Z4oxqd1ngQ6z

Fold away all of the cases that now just goto illegal_op,
because all of their internal bits are now in decodetree.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 78 ++----------------------------------------
 1 file changed, 3 insertions(+), 75 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index a750a2c092..836b3752f7 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10442,9 +10442,6 @@ static bool thumb_insn_is_16bit(DisasContext *s, uint32_t insn)
 /* Translate a 32-bit thumb instruction. */
 static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
 {
-    uint32_t rn;
-    int op;
-
     /*
      * ARMv6-M supports a limited subset of Thumb2 instructions.
      * Other Thumb1 architectures allow only 32-bit
@@ -10485,34 +10482,10 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
     }
     /* fall back to legacy decoder */
 
-    rn = (insn >> 16) & 0xf;
     switch ((insn >> 25) & 0xf) {
     case 0: case 1: case 2: case 3:
         /* 16-bit instructions.  Should never happen.  */
         abort();
-    case 4:
-        /* All in decodetree */
-        goto illegal_op;
-    case 5:
-        /* All in decodetree */
-        goto illegal_op;
-    case 13: /* Misc data processing.  */
-        op = ((insn >> 22) & 6) | ((insn >> 7) & 1);
-        if (op < 4 && (insn & 0xf000) != 0xf000)
-            goto illegal_op;
-        switch (op) {
-        case 0: /* Register controlled shift, in decodetree */
-        case 1: /* Sign/zero extend, in decodetree */
-        case 2: /* SIMD add/subtract, in decodetree */
-        case 3: /* Other data processing, in decodetree */
-            goto illegal_op;
-        case 4: case 5:
-            /* 32-bit multiply.  Sum of absolute differences, in decodetree */
-            goto illegal_op;
-        case 6: case 7: /* 64-bit multiply, Divide, in decodetree */
-            goto illegal_op;
-        }
-        break;
     case 6: case 7: case 14: case 15:
         /* Coprocessor.  */
         if (arm_dc_feature(s, ARM_FEATURE_M)) {
@@ -10541,6 +10514,7 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
                 }
 
                 if (arm_dc_feature(s, ARM_FEATURE_VFP)) {
+                    uint32_t rn = (insn >> 16) & 0xf;
                     TCGv_i32 fptr = load_reg(s, rn);
 
                     if (extract32(insn, 20, 1)) {
@@ -10599,49 +10573,6 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
             }
         }
         break;
-    case 8: case 9: case 10: case 11:
-        if (insn & (1 << 15)) {
-            /* Branches, misc control.  */
-            if (insn & 0x5000) {
-                /* Unconditional branch, in decodetree */
-                goto illegal_op;
-            } else if (((insn >> 23) & 7) == 7) {
-                /* Misc control */
-                if (insn & (1 << 13))
-                    goto illegal_op;
-
-                if (insn & (1 << 26)) {
-                    /* hvc, smc, in decodetree */
-                    goto illegal_op;
-                } else {
-                    op = (insn >> 20) & 7;
-                    switch (op) {
-                    case 0: /* msr cpsr, in decodetree  */
-                    case 1: /* msr spsr, in decodetree  */
-                        goto illegal_op;
-                    case 2: /* cps, nop-hint, in decodetree */
-                        goto illegal_op;
-                    case 3: /* Special control operations, in decodetree */
-                    case 4: /* bxj, in decodetree */
-                    case 5: /* eret, in decodetree */
-                    case 6: /* MRS, in decodetree */
-                    case 7: /* MSR, in decodetree */
-                        goto illegal_op;
-                    }
-                }
-            } else {
-                /* Conditional branch, in decodetree */
-                goto illegal_op;
-            }
-        } else {
-            /*
-             * 0b1111_0xxx_xxxx_0xxx_xxxx_xxxx
-             *  - Data-processing (modified immediate, plain binary immediate)
-             * All in decodetree.
-             */
-            goto illegal_op;
-        }
-        break;
     case 12:
         if ((insn & 0x01100000) == 0x01000000) {
             if (disas_neon_ls_insn(s, insn)) {
@@ -10649,14 +10580,11 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
             }
             break;
         }
-        /* Load/store single data item, in decodetree */
         goto illegal_op;
     default:
-        goto illegal_op;
+    illegal_op:
+        gen_illegal_op(s);
     }
-    return;
-illegal_op:
-    gen_illegal_op(s);
 }
 
 static void disas_thumb_insn(DisasContext *s, uint32_t insn)
-- 
2.17.1

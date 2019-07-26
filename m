Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp207677wrv;
        Fri, 26 Jul 2019 10:51:37 -0700 (PDT)
X-Received: by 2002:a17:90a:8a15:: with SMTP id w21mr99816581pjn.134.1564163497648;
        Fri, 26 Jul 2019 10:51:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564163497; cv=none;
        d=google.com; s=arc-20160816;
        b=hRxgv5YdFG+jArh4NJLY4/Z7Uug05vOLo0QIdPr4UO+gDsjxECaFH1bpWm/l7IfkJS
         ZG4yjY5alQj4updzjNZkon59xZrt9cf1oS+9wN8eJmStuTg1NZp9PTSPHkDV2PgRlBUx
         9LV+VKzkBCPjPXbGp+Xfxr6ViuCQDGoMyFk1csL0aj705a6lsQr12xdCPjq9qt6AVs5M
         rNzKJv4ttTwEdSv/HF4U5KBbIUjQ+aZBi0/Rf8e4rckcYGGyz5PKM5pg7qP0FTr0Q8DB
         hewaUWqn/pfi2Rn9ESJ6MmlJhkGKzkZm8IK/t1xZvLO7olOgOfPmL5OXEgrzjc2JcWhR
         9Bdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=+4XfaDCTfyuI+ugQIIzBK6MHDxWWrmnHUnH0Hltgmbo=;
        b=DcJfqDDhTJVZpyabeSNQHYUeQbQ6Pg7SezMkmAv4pHAZ1TnCdnEqJjsJ5LnY8zN4Lg
         mnitbgM3wXl9BJLHVobl6mS+fhys/n+lSJRX0hlvU4RFeRwV+ZPXDZmZlAobR8WWc9gm
         ooTaWVOYtrSiogwvh3NO3Oc2/O410P03VSPPtdTgVTBRyBWruozGRKclSQ5iUw/GNaLY
         3tfZIya6bB32M22qnHsUQsRcZuiF+/DyJjYrwRH09TwqJWe2+9VSCBEK7vD5et4CrNsF
         DwSYIADC/XBrNHxQe9qLEVlKzIKIlRdS3IGC5K5S5nkqpOpHXN8dQB/q6eGsISLHq/wL
         5bNg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=socwDXsH;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id l10sor33099758pgm.23.2019.07.26.10.51.37
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 26 Jul 2019 10:51:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=socwDXsH;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=+4XfaDCTfyuI+ugQIIzBK6MHDxWWrmnHUnH0Hltgmbo=;
        b=socwDXsHqY7yZXUSpb45ST5QixBbzT62HHOJE0nIj3BKMkNL+Fd/ljjQXsGqYj0d9U
         2x0aGRFsn78hjoqjMD9kLH7I/VFO17xuInQU4fT1TSHxmh/Wju1VvLCemgIraxVDW5JU
         Ij3gYHaEOaFqN8EbOSNK8SRPCVf30pWyawBsqlfl5CPZjU3kN8eAMJCwC0b7aEeNCyYr
         g5XyGZj7jhh3Ygsfncq8K3iT0ZSH8Ptn3H4CFrlYvF+09H9O64rPysxgzDnF1N6kLcL5
         hfR5mt2E9+Fp7C0gw2oNsKzxRJCNsLl5BLuLipH8Y8TuU2vwD5VLPoRa49+TqV563Wa9
         Fs2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=+4XfaDCTfyuI+ugQIIzBK6MHDxWWrmnHUnH0Hltgmbo=;
        b=oqZhIJ5YgPze3K1CMvPRdxu6tn2l5OqwxHQNZWXGQ4JHsgs5xQ3X+kLusqpU4d6f9A
         xlBZddSjka9gZyXuYRpU5bX3UciWmhyQbcFEXAs803YPGIO2IUg8S+cMFDCbpBzCe+qd
         zeBBHgvoAGn6XzsHo7bMqbx5TNbNirP6ynDZSGESzfTUq76avnslh7sDmgnIJTAvuJ1M
         3euLn6/u6hdySPPnucpUxrczFtRysrEqO6uO5vjCyuLVHHeUZ48Sgeug4SU/Adl0xFgj
         Xdsnw+8IgOLPvccl7r06j3jjbI6s/aipiJwLpTA3vxAoFwoOblUZg7PJjiuO+U1wy7QS
         QBlg==
X-Gm-Message-State: APjAAAUylKieEiq1iWB2aFowDV9wIlZey7GMnJk4tB+TvLqtZgAb7K3g
	rIX/i6T0u0UkvGKplhPuYqmdva/i
X-Google-Smtp-Source: APXvYqzQ8CbhwVQxxqWQ0wuEul4ykQ/j3dw+J99hx8fyUXP9s3EivI1snWt2BfKwRzI18amUbalnmg==
X-Received: by 2002:a63:7b18:: with SMTP id w24mr91960531pgc.328.1564163497124;
        Fri, 26 Jul 2019 10:51:37 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-117-207.tukw.qwest.net. [97.126.117.207])
        by smtp.gmail.com with ESMTPSA id o24sm104287919pfp.135.2019.07.26.10.51.36
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 26 Jul 2019 10:51:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH 52/67] target/arm: Convert T16 add, compare, move (two high registers)
Date: Fri, 26 Jul 2019 10:50:17 -0700
Message-Id: <20190726175032.6769-53-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190726175032.6769-1-richard.henderson@linaro.org>
References: <20190726175032.6769-1-richard.henderson@linaro.org>
X-TUID: EHge8nD8hKLO

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 49 ++----------------------------------------
 target/arm/t16.decode  | 10 +++++++++
 2 files changed, 12 insertions(+), 47 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index e2183eb543..23f5f982f5 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10628,55 +10628,10 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
             store_reg(s, rd, tmp);
             break;
         }
-        if (insn & (1 << 10)) {
-            /* 0b0100_01xx_xxxx_xxxx
-             * - data processing extended, branch and exchange
-             */
-            rd = (insn & 7) | ((insn >> 4) & 8);
-            rm = (insn >> 3) & 0xf;
-            op = (insn >> 8) & 3;
-            switch (op) {
-            case 0: /* add */
-                tmp = load_reg(s, rd);
-                tmp2 = load_reg(s, rm);
-                tcg_gen_add_i32(tmp, tmp, tmp2);
-                tcg_temp_free_i32(tmp2);
-                if (rd == 13) {
-                    /* ADD SP, SP, reg */
-                    store_sp_checked(s, tmp);
-                } else {
-                    store_reg(s, rd, tmp);
-                }
-                break;
-            case 1: /* cmp */
-                tmp = load_reg(s, rd);
-                tmp2 = load_reg(s, rm);
-                gen_sub_CC(tmp, tmp, tmp2);
-                tcg_temp_free_i32(tmp2);
-                tcg_temp_free_i32(tmp);
-                break;
-            case 2: /* mov/cpy */
-                tmp = load_reg(s, rm);
-                if (rd == 13) {
-                    /* MOV SP, reg */
-                    store_sp_checked(s, tmp);
-                } else {
-                    store_reg(s, rd, tmp);
-                }
-                break;
-            case 3:
-                /* 0b0100_0111_xxxx_xxxx
-                 * - branch [and link] exchange thumb register
-                 * In decodetree
-                 */
-                goto illegal_op;
-            }
-            break;
-        }
 
         /*
-         * 0b0100_00xx_xxxx_xxxx
-         *  - Data-processing (two low registers), in decodetree
+         * - Data-processing (two low registers), in decodetree
+         * - data processing extended, branch and exchange, in decodetree
          */
         goto illegal_op;
 
diff --git a/target/arm/t16.decode b/target/arm/t16.decode
index 4701f72357..69d3894ba7 100644
--- a/target/arm/t16.decode
+++ b/target/arm/t16.decode
@@ -146,6 +146,16 @@ CMP_rri         00101 ... ........              @arith_1i s=1
 ADD_rri         00110 ... ........              @arith_1i %s
 SUB_rri         00111 ... ........              @arith_1i %s
 
+# Add, compare, move (two high registers)
+
+%reg_0_7        7:1 0:3
+@addsub_2h      .... .... . rm:4 ... \
+                &s_rrr_shi rd=%reg_0_7 rn=%reg_0_7 shim=0 shty=0
+
+ADD_rrri        0100 0100 . .... ...            @addsub_2h s=0
+CMP_rrri        0100 0101 . .... ...            @addsub_2h s=1
+MOV_rrri        0100 0110 . .... ...            @addsub_2h s=0
+
 # Branch and exchange
 
 @branchr        .... .... . rm:4 ...            &r
-- 
2.17.1

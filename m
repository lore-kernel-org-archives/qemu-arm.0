Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp207631wrv;
        Fri, 26 Jul 2019 10:51:35 -0700 (PDT)
X-Received: by 2002:a62:ae01:: with SMTP id q1mr22908892pff.219.1564163495405;
        Fri, 26 Jul 2019 10:51:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564163495; cv=none;
        d=google.com; s=arc-20160816;
        b=qhFDWngPC4VZa0Vs16nDwPFI+QhkKwt5UTOuBlH+nrQ4nFAqOqVGJOwLd9iulrBQJW
         jhz+B8ETJ9keFUpUxDqpspzTYMk6WJB1ZRdUmvdTpYnc5eVBbFvupN89HhZnN1BWE/O/
         0GQLFWTNIm8p2y+0LVvebczXa59xbYpSi1DdC4CUIPecJYxqlqtjxO8Hgg+EzxG/LQlN
         wviSbDzdvpJ2rDE29vtlASvNosuKrcQyrmEH+FupBE+lta1BVrIViQXEKcifEl5zolL3
         1qTAhQrgN5fhrEPX8s5A/e79ANLJbjJQOyKZ2h7/dlNrxPcy9fNnJ4SKE4hKW2ni6+S9
         QOhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=8uDpXmk2fu+tSj6HfWWHlssj2XKXCMWZi0tyb4tGXOc=;
        b=qQM0+TodDoAvc8s5b4cd6dkDqM/KR9KIH/IBKsK2TUgzEOrdO8AEMdq+KJWXiQ52df
         yyeTy2GpsMRv9RpVuL4KOQNaXlYedhFG6Kd0sWxPDmkGxYBLQ3OZrXWTmkhwKJEyQcwj
         g+0+4ZdBHudTcgw2FKSY6hpgXsHEOgvGm+09pxOTH8EZwjtxFTMyHH1ChPFGwWm+5Psr
         yPYqGmwf65D2nYUNiFlgVdaf5bvz56w7uPqSllaiH1bd9pb6nUbB9Pjh59C1hEW2nq+8
         EJs3bJWh43nWAs1Xo1EPyoBXcBjRdFY0emkpb1yWQ6r6Z74h6GkiWf+2WoR/kAslyTnB
         /oGA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=atpvhmyD;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 1sor64575780plw.7.2019.07.26.10.51.35
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 26 Jul 2019 10:51:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=atpvhmyD;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=8uDpXmk2fu+tSj6HfWWHlssj2XKXCMWZi0tyb4tGXOc=;
        b=atpvhmyDtUy1RYtrvBv8oBntVn6bXSSR/tqasJqEeDKCXAJtNA4QXtSDtVERLdpQic
         HlIgcmBOi3sFqG2kOMXxGD5lX0bd8ZOGOnYO38RRda5KT3rv/wxfKu0a139NyIYhb9NZ
         WNUPWW/H7XT2HRnJ3zv9oqSj1+eJVT9Z4byUzp6fomtXJWWG10wPgEq0OCugjjjUffgE
         uT460ehbKiJPf33AqhO4dpUVDx6v5MEkQmRCk9yWq33tbPJL45WvYCAalHYbgC0LCOZq
         qJ7XtBiG3epLuMHsX9v/1S5GDzLiUxSKViQqLaMwrdUgBP4YUOe01a5XTYzt+/e6goCJ
         ZQGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=8uDpXmk2fu+tSj6HfWWHlssj2XKXCMWZi0tyb4tGXOc=;
        b=pXUazETV8R4oDvAQm2LQteonNFONIjdRDaXjaQH/jY5CS7DBGUxaQ+tX1fAJIXy8Bb
         USr4oqii1zMsu6prPZXRsNQUO+frgCP7Og2kZ72QBHqreMvoiOu0lta+n5hH+gTAjdl9
         9XPcXE0gTt5qN9SDoVlos36CeX0epGcTPMQo4KvA6epmz74woAw+9CNu9EpXKLtOJKTE
         aq4uwufVH/dsmWGUKXUeZiAhfb2zPjQw9HgiyW7h1nuEokLFlQZSskc0bv3/ZsM2GnQo
         KrC/ckMJDuRM+RUXpken7RbfJv09elrEztZQ51d4QBB29xb1mkkoEOnWMhl5WzldJe+R
         Hbew==
X-Gm-Message-State: APjAAAVOtOgJMjnxmv5rxTDA47BJSkw56kvuuHj8dZ5h3HZtBhX5YkTS
	GyQzx6KNfSWNc8hHzmwHJXj6+oWI
X-Google-Smtp-Source: APXvYqxS5X6bOUz7Pj1WvHsVSILAQhsLX9Xe+SlELQBuv29a4cwHVw3pYoNgFWAMfqLNWq/kGoY2LA==
X-Received: by 2002:a17:902:d70a:: with SMTP id w10mr92328491ply.251.1564163495029;
        Fri, 26 Jul 2019 10:51:35 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-117-207.tukw.qwest.net. [97.126.117.207])
        by smtp.gmail.com with ESMTPSA id o24sm104287919pfp.135.2019.07.26.10.51.33
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 26 Jul 2019 10:51:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH 50/67] target/arm: Convert T16 one low register and immediate
Date: Fri, 26 Jul 2019 10:50:15 -0700
Message-Id: <20190726175032.6769-51-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190726175032.6769-1-richard.henderson@linaro.org>
References: <20190726175032.6769-1-richard.henderson@linaro.org>
X-TUID: 4+MIkaoZvgjs

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 44 ++----------------------------------------
 target/arm/t16.decode  | 11 +++++++++++
 2 files changed, 13 insertions(+), 42 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 692891dbe0..9bdcb91537 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10594,48 +10594,8 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
             store_reg(s, rd, tmp);
         }
         break;
-    case 2: case 3:
-        /*
-         * 0b001x_xxxx_xxxx_xxxx
-         *  - Add, subtract, compare, move (one low register and immediate)
-         */
-        op = (insn >> 11) & 3;
-        rd = (insn >> 8) & 0x7;
-        if (op == 0) { /* mov */
-            tmp = tcg_temp_new_i32();
-            tcg_gen_movi_i32(tmp, insn & 0xff);
-            if (!s->condexec_mask)
-                gen_logic_CC(tmp);
-            store_reg(s, rd, tmp);
-        } else {
-            tmp = load_reg(s, rd);
-            tmp2 = tcg_temp_new_i32();
-            tcg_gen_movi_i32(tmp2, insn & 0xff);
-            switch (op) {
-            case 1: /* cmp */
-                gen_sub_CC(tmp, tmp, tmp2);
-                tcg_temp_free_i32(tmp);
-                tcg_temp_free_i32(tmp2);
-                break;
-            case 2: /* add */
-                if (s->condexec_mask)
-                    tcg_gen_add_i32(tmp, tmp, tmp2);
-                else
-                    gen_add_CC(tmp, tmp, tmp2);
-                tcg_temp_free_i32(tmp2);
-                store_reg(s, rd, tmp);
-                break;
-            case 3: /* sub */
-                if (s->condexec_mask)
-                    tcg_gen_sub_i32(tmp, tmp, tmp2);
-                else
-                    gen_sub_CC(tmp, tmp, tmp2);
-                tcg_temp_free_i32(tmp2);
-                store_reg(s, rd, tmp);
-                break;
-            }
-        }
-        break;
+    case 2: case 3: /* add, sub, cmp, mov (reg, imm), in decodetree */
+        goto illegal_op;
     case 4:
         if (insn & (1 << 11)) {
             rd = (insn >> 8) & 7;
diff --git a/target/arm/t16.decode b/target/arm/t16.decode
index 965fb1bf6e..edb67a3896 100644
--- a/target/arm/t16.decode
+++ b/target/arm/t16.decode
@@ -133,3 +133,14 @@ SUB_rrri        0001101 ... ... ...             @addsub_3
 
 ADD_rri         0001 110 ... ... ...            @addsub_2i
 SUB_rri         0001 111 ... ... ...            @addsub_2i
+
+# Add, subtract, compare, move (one low register and immediate)
+
+%reg_8          8:3
+@arith_1i       ..... rd:3 imm:8 \
+                &s_rri_rot rot=0 rn=%reg_8
+
+MOV_rri         00100 ... ........              @arith_1i %s
+CMP_rri         00101 ... ........              @arith_1i s=1
+ADD_rri         00110 ... ........              @arith_1i %s
+SUB_rri         00111 ... ........              @arith_1i %s
-- 
2.17.1

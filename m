Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp207573wrv;
        Fri, 26 Jul 2019 10:51:32 -0700 (PDT)
X-Received: by 2002:a63:c44c:: with SMTP id m12mr53794785pgg.396.1564163491936;
        Fri, 26 Jul 2019 10:51:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564163491; cv=none;
        d=google.com; s=arc-20160816;
        b=wKN7ES72nqS9Y5wWh04pPxaRV7nv4sfttOpVqC14T40/GO3eggCuqbvfqMDO7kiFfu
         aiBM4pe1WvaY9f9X3446a26FCdamtvfjS3ic3Uc31jgt0tnKOqGDFSP0HJURBz+vAjin
         oqssA/VC8n/wpofrcLxARhKdFl5fC/jCM7UZ9Bg68kicdlBG94mPcKSNyFay/jVK/BIv
         Sj92p7OG1QxIDyiHFhUxPYXmwRwM2fBpb4bcPDwvVlPzmI6+9cCjKuF/RvtsOQKe86j/
         kBTx+j/iriNB5HmtlyxS4pNG+VU41v5o0j3+RXcuWZDf7ryE7Sz+xJmgHM/nqyyQ/43o
         tAiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=wDt/gxXOEruKJVqZkyq92uFSMEbVcSh409biqimT4es=;
        b=b/jYtVRzRJyNz7bul5VH0FZVqIl0A778BxzrEIvNowkkr2956V93MBI9ek0BygcUpx
         PxslYJQhNw/A2w7oSjxg247GLDBdj3rXLA6msu0ngqEY1q53YNlZEmk95kWG5IT70rgG
         0b40S7Cc5YH/Ih1TMNCCXeCxYPkzbtTdl8vQBRvxfr68NJ8Io+QDCH0tA0QQP40ul+uT
         X6UExUFBkAWSz7l8wh9nTI3fDTkiFcscI33XVjRL8CuN6N219DnTHHBynBpHahDdEzs7
         K1TqK+hOz2oGe9MBXhTrmyndqg35UOUMw3QB/mHtjAqYm834495KebNoAzCOkDtv61GY
         K8Og==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=l2uVYsyC;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id h71sor32830890pge.80.2019.07.26.10.51.31
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 26 Jul 2019 10:51:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=l2uVYsyC;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=wDt/gxXOEruKJVqZkyq92uFSMEbVcSh409biqimT4es=;
        b=l2uVYsyChcSlp0SE+aT5EmxpknN6lP8vdMTXyOHaOGtOP3IPv5s0hGhJ6fer3Yjtir
         CYMcjPuWSPL4/wiznTn2JlwZTedJHqywSb5VzPcfPzF80R23aoySf4wYC7L9xcfjZw4E
         C5xFPl7y+htqkPEKndGiu5Nr/gJNrm2HAuHM8ULNYzAlfmn7knmZhKFfs3t1YkEhXSzA
         t56/NTjFzKtl8/bel1g0TCPFZ145TchN6kJKVv9sJwq+FJoNv9/KrYJ3I1IQ5qU+2JnN
         n/vDamCocGRuScJGVsvYQ7EFh6d1YhRDR0v4AuOHGB7/foJhz+YwKJYgzhYcrMMTFGgW
         bDXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=wDt/gxXOEruKJVqZkyq92uFSMEbVcSh409biqimT4es=;
        b=hXooR4Fzzy1ikUjfzpQ0/eK8lmyiM5medSXB61u8L+5sgithDslYxInIqhj5LCn5we
         FLUgSc0hVetcnV5S0u9Uuacb5XqL+NuM/LKt378f5o89zo9MvqJZQmLoINhSkAW3fYkI
         tCf4I/z6ifKytT5zVk1xbNySRH1qP1ZkLpfXj/4an5tCb52DOQ7HrChyc8g5bC6JzOxw
         Q+hHMgB5JtuET6ZPXHilHYF13s0p/ZbIz7ZUpZlAlgK57swzNwstx6tPo2FY1k1T+YDp
         /QmdtZZdvjU62Q5sd4ZK12YQN7FD80IJJaTou6i1m4Zcu0D61yoAt1P5Xshmi1oeIbUM
         BMzQ==
X-Gm-Message-State: APjAAAWx2SjWzoDqpxAUYL+NwNTSlVbZh2JWXSsLdY5azqd6LmTNuaH8
	NFoi3ypG124fRbav/xVvE3LKak6q
X-Google-Smtp-Source: APXvYqyjh5D2v+wVrGKFmXKjS/apWCccoyAa5YCXvG2foKRxmp4v0bNuRxZ02+mvRVRJP0Cf+ZsGfg==
X-Received: by 2002:a63:b904:: with SMTP id z4mr90750276pge.388.1564163491483;
        Fri, 26 Jul 2019 10:51:31 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-117-207.tukw.qwest.net. [97.126.117.207])
        by smtp.gmail.com with ESMTPSA id o24sm104287919pfp.135.2019.07.26.10.51.30
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 26 Jul 2019 10:51:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH 47/67] target/arm: Convert T16 add pc/sp (immediate)
Date: Fri, 26 Jul 2019 10:50:12 -0700
Message-Id: <20190726175032.6769-48-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190726175032.6769-1-richard.henderson@linaro.org>
References: <20190726175032.6769-1-richard.henderson@linaro.org>
X-TUID: OpZhbZaG3FOZ

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 12 +-----------
 target/arm/t16.decode  |  7 +++++++
 2 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 28f274ca7c..525276ed13 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10758,19 +10758,9 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
     case 7: /* load/store byte immediate offset, in decodetree */
     case 8: /* load/store halfword immediate offset, in decodetree */
     case 9: /* load/store from stack, in decodetree */
+    case 10: /* add PC/SP (immediate), in decodetree */
         goto illegal_op;
 
-    case 10:
-        /*
-         * 0b1010_xxxx_xxxx_xxxx
-         *  - Add PC/SP (immediate)
-         */
-        rd = (insn >> 8) & 7;
-        val = (insn & 0xff) * 4;
-        tmp = add_reg_for_lit(s, insn & (1 << 11) ? 13 : 15, val);
-        store_reg(s, rd, tmp);
-        break;
-
     case 11:
         /* misc */
         op = (insn >> 8) & 0xf;
diff --git a/target/arm/t16.decode b/target/arm/t16.decode
index 797e4e7068..568656ecd6 100644
--- a/target/arm/t16.decode
+++ b/target/arm/t16.decode
@@ -23,6 +23,7 @@
 &s_rrr_shr       !extern s rn rd rm rs shty
 &s_rri_rot       !extern s rn rd imm rot
 &s_rrrr          !extern s rd rn rm ra
+&ri              !extern rd imm
 &ldst_rr         !extern p w u rn rt rm shimm shtype
 &ldst_ri         !extern p w u rn rt imm
 
@@ -102,3 +103,9 @@ LDRH_ri         10001 ..... ... ...             @ldst_ri_2
 
 STR_ri          10010 ... ........              @ldst_spec_i rn=13
 LDR_ri          10011 ... ........              @ldst_spec_i rn=13
+
+# Add PC/SP (immediate)
+
+ADR             10100 rd:3 ........             imm=%imm8_0x4
+ADD_rri         10101 rd:3 ........ \
+                &s_rri_rot rn=13 s=0 rot=0 imm=%imm8_0x4  # SP
-- 
2.17.1

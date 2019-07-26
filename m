Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp207313wrv;
        Fri, 26 Jul 2019 10:51:17 -0700 (PDT)
X-Received: by 2002:a17:902:26c:: with SMTP id 99mr100887143plc.215.1564163477446;
        Fri, 26 Jul 2019 10:51:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564163477; cv=none;
        d=google.com; s=arc-20160816;
        b=AMISvlqt0LAVToaM5SCCuO2fYkrYWStX5iWWEXcQ9uKLHmgAeWutYmOPFDCeSqs5S3
         cypcQOpVRqi67C8FTKNNCSEduf4koKeInfoPucqobIIPoV6EesvKlxFK/EWkFHO7uFqe
         lTJ79eFRPHEhkVB42sC5j2zEZn06yICzYI4/xPj1P4EYCB1TYOcGVRgcegRivOXd+saA
         vY6guCMdOvACqAolwCDrHi54+g3prj6Qrxm8LkaOz4U3MGVbSvAZwY/rauVZi2mbVoY5
         ymEo9rl24PoXsKuJA1/v2cZpJnghbNlD2uNkhZhSaeKUFELnmzCPdnY+x7CEQ2tGd7PQ
         b5eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=BzmSmsqkudBY73N0i3QRkWoRxzKdjm/eJVgoMLfj3Sc=;
        b=FjKRybLhLJ57LHhSEdG/eWpBvqiMmyyKMUEXeEdQy2yNQhP1DjjURl4jDOWXgAq7HY
         UgFlqRDOElAoX5PGFqVprE8TKnfc3u59/amIDBQ/7nQN78ERKyaNjkW6bPmYV/NdwzeD
         8kW53CPBYiqrDzcTkOe/resXZV+ZJwfd0QksArtHul6UH1SIEEtX1tcDRVNCld6xmhI+
         moLXTGpu2LoMqv3JLjDkiNtjxGBnS6TQ4RWUMjfGJGnOTyRCIyKqC8uieeNWZqpbGyGY
         bBmZs8tAUxecALUckcPsAw35cI78oyDTebjTiIuC+/ZO16QLK+yVtMhJoD2wxivPJwV1
         FwVw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=x8oCBcnW;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id e1sor35112823pff.23.2019.07.26.10.51.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 26 Jul 2019 10:51:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=x8oCBcnW;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=BzmSmsqkudBY73N0i3QRkWoRxzKdjm/eJVgoMLfj3Sc=;
        b=x8oCBcnWbkKY7zCfEztHeVfrYPzRfIa3WgR5nfpNI1fmX4DNoyWWLNSE6eleo3P68z
         cOmnQhdQREWFxj2tZfxMlK8dsssaACi19p+kdF2IGY8XZoErdV/4C6xYs1ZCeod9cSyE
         Z0wttuNKaRAyWDYv7n18vI5RJ1nKX1ml6tPtRk/FCx8wqC3DBeIw0x8bRznMTyZSn8Av
         Kbz9JKt1dma195s6P8MAY151vyhmAL2Vzf8vlVXzxNGZ9Nfxc5WiGUiT5rWe0Nqj9GNM
         tb9xo4GnQi/YQHz22xxCRwbzWNGMEFelk51hZEW1DmuLsN3mSAhzcdDzjjnSsexnJzJu
         F6Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=BzmSmsqkudBY73N0i3QRkWoRxzKdjm/eJVgoMLfj3Sc=;
        b=kstNYAAMhB0fq4HpU2cI9LsupcMKKNllKq9kGWcZngoLTyzBwTUZuY/zFk2tELxf7l
         az9wNIl3v8toeae7I9rT/KJO5xi9ItmtYbE6g0pSh0uCSXutV9dsno56Ai0Y62TMvazj
         yt0WW3xIaoxXyLirvr+3F1SYz54/2Dm0XVZPe0BYawyCMqX5XAJLhmQNDOJiBHRp10ok
         DeGEaXO28O59/XYSGorkVdFJz82rsfCdx6BomyM6asXux2XaPOfmUGAqTp9dicc1fp42
         fgrJLI0NOlcKMxzJQLRJXJ5MopNHLyGuuuEXBhykeWSRm/dKuGEKeubu44mmumO/owYv
         dIDQ==
X-Gm-Message-State: APjAAAX+ccyO0T2l+Yn14o2a/R4tp8I0BbB7/5LTIk5V80LkR658SeTt
	jG3oSkn4P66CnzdR1PKuGbF/h8Nsnncoqw==
X-Google-Smtp-Source: APXvYqwN+44aiQHbpiYeGpN+Ilm/kccpKUADqo6LMEP4BC0tuGOdxaAD3CTXLwwUeCgvXVoiCwILyw==
X-Received: by 2002:aa7:989a:: with SMTP id r26mr11675570pfl.232.1564163477012;
        Fri, 26 Jul 2019 10:51:17 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-117-207.tukw.qwest.net. [97.126.117.207])
        by smtp.gmail.com with ESMTPSA id o24sm104287919pfp.135.2019.07.26.10.51.15
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 26 Jul 2019 10:51:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH 36/67] target/arm: Convert PLI, PLD, PLDW
Date: Fri, 26 Jul 2019 10:50:01 -0700
Message-Id: <20190726175032.6769-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190726175032.6769-1-richard.henderson@linaro.org>
References: <20190726175032.6769-1-richard.henderson@linaro.org>
X-TUID: cgc6ofwJzwr7

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c       | 37 +++++++++++++++++++-----------------
 target/arm/a32-uncond.decode | 10 ++++++++++
 2 files changed, 30 insertions(+), 17 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 1d07caa62a..5366741d7b 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10147,6 +10147,26 @@ static bool trans_SETEND(DisasContext *s, arg_SETEND *a)
     return true;
 }
 
+/*
+ * Preload instructions
+ * All are nops, contingent on the appropriate arch level.
+ */
+
+static bool trans_PLD(DisasContext *s, arg_PLD *a)
+{
+    return ENABLE_ARCH_5TE;
+}
+
+static bool trans_PLDW(DisasContext *s, arg_PLD *a)
+{
+    return arm_dc_feature(s, ARM_FEATURE_V7MP);
+}
+
+static bool trans_PLI(DisasContext *s, arg_PLD *a)
+{
+    return ENABLE_ARCH_7;
+}
+
 /*
  * Legacy decoder.
  */
@@ -10207,23 +10227,6 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
             }
             return;
         }
-        if (((insn & 0x0f30f000) == 0x0510f000) ||
-            ((insn & 0x0f30f010) == 0x0710f000)) {
-            if ((insn & (1 << 22)) == 0) {
-                /* PLDW; v7MP */
-                if (!arm_dc_feature(s, ARM_FEATURE_V7MP)) {
-                    goto illegal_op;
-                }
-            }
-            /* Otherwise PLD; v5TE+ */
-            ARCH(5TE);
-            return;
-        }
-        if (((insn & 0x0f70f000) == 0x0450f000) ||
-            ((insn & 0x0f70f010) == 0x0650f000)) {
-            ARCH(7);
-            return; /* PLI; V7 */
-        }
         if (((insn & 0x0f700000) == 0x04100000) ||
             ((insn & 0x0f700010) == 0x06100000)) {
             if (!arm_dc_feature(s, ARM_FEATURE_V7MP)) {
diff --git a/target/arm/a32-uncond.decode b/target/arm/a32-uncond.decode
index d5ed48f0fd..aed381cb8e 100644
--- a/target/arm/a32-uncond.decode
+++ b/target/arm/a32-uncond.decode
@@ -54,3 +54,13 @@ SB               1111 0101 0111 1111 1111 0000 0111 0000
 
 # Set Endianness
 SETEND           1111 0001 0000 0001 0000 00 E:1 0 0000 0000  &setend
+
+# Preload instructions
+
+PLD              1111 0101 -101 ---- 1111 ---- ---- ----    # (imm, lit) 5te
+PLDW             1111 0101 -001 ---- 1111 ---- ---- ----    # (imm, lit) 7mp
+PLI              1111 0100 -101 ---- 1111 ---- ---- ----    # (imm, lit) 7
+
+PLD              1111 0111 -101 ---- 1111 ----- -- 0 ----   # (register) 5te
+PLDW             1111 0111 -001 ---- 1111 ----- -- 0 ----   # (register) 7mp
+PLI              1111 0110 -101 ---- 1111 ----- -- 0 ----   # (register) 7
-- 
2.17.1

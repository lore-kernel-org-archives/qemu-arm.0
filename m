Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp206857wrv;
        Fri, 26 Jul 2019 10:50:46 -0700 (PDT)
X-Received: by 2002:a17:90a:2343:: with SMTP id f61mr100555874pje.130.1564163446672;
        Fri, 26 Jul 2019 10:50:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564163446; cv=none;
        d=google.com; s=arc-20160816;
        b=L9B7jaOhtP6MTl4XSAvPOf+5qNzazncvWmkog4lVie7bZyuLjLqY4jn2bZPMtjXuyi
         OXQZQ0VCUiXbq8VTSHpgoKD4RX8prv171DY2MXW4taNYG30fJrnJ3PDsuyvH79InWKzU
         EvA57Ys/DUpbi06eDuKa8aTTKmTQhqVznhpgQU5X1X8CblQcmq27oy7CURzAirX7BEXb
         Zq8Q+A5Q+CDqC/kXxqz0bJBydqSnOUztuu4TWQ0kmeMSuCvvp19nALV1XgrGQyQF8BwJ
         xhXW7XsHGuSDg0UKJkG8NMnRcahYIPnnn4gFyDuRWaFW1Fephb6utU04AcHmuarfj/yL
         UVOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=6AlrLPoHEa++V99L7+ZXhJHR2MnP9U+NbGuctJWMxJE=;
        b=yPXrIw8viUyE2z6ISOWMXcHY0/pzskJHwVEk1QQY8EQ2RkdnIy84a1I1Fl9Yfx+/CY
         M6ltT+Cwm2SVEBBlMhqTd0gbCfXRkDt4hg23OjlQsUqGfsQwZ4s03XnQ4sYo5CkTBBDH
         rEfRntPfxjeb5J+3mXfOBVnnI2yK2HZTq5kacc2KXI2ysfL5dFfyhN6i2YDMAYwxoBXO
         tE/YVCskTS68OR+MrcvvNMDZ9/Zy59b7qaEKJwlFq+wee3ulEKHCBFQHW7rSPYo4byPk
         B4oqogMZ8pJOE1l15kIdGLXNAJNzV9WFibmC9ZZpSR+8CqLxH8YVRpmmXFikYFCnvbc7
         zz9g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mqb8bBC+;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id j13sor14449531pgb.72.2019.07.26.10.50.46
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 26 Jul 2019 10:50:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mqb8bBC+;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=6AlrLPoHEa++V99L7+ZXhJHR2MnP9U+NbGuctJWMxJE=;
        b=mqb8bBC+RsDkqdEMK9OWURwjjLzi83s/2TP/cn0X/bcMBMFQt9jPUJkzStfa+59HBK
         VPfzXXkPsdu6+vc1IGIME0HhVU4rjindrTnDcc2gsfOmvMEuxo/Wby2TgPPhaj74alAh
         3Rrn9UUznq3sT9Qb/hxM61DUtZgUPB8OYHG/B2WRCnebxf7M5KL4W6NMfCHg49MzTWiQ
         8J9jGvodc2fCCXPPFtZ5i6l3aYJMIESIxRBPzVrd+RMBx5JgcOOOhdL6a8h4FoVj98Uo
         A1pPHfz96ZQCZmXlpsD2V/JWP+5Zh45+415MhmiXeNhmOROQpD04BLmMV+u5K3AaquZB
         88wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=6AlrLPoHEa++V99L7+ZXhJHR2MnP9U+NbGuctJWMxJE=;
        b=PsZ4zsQVw9z9hh5C84EMKVs96DpO2p3xmzePnJMJCOghuUmdpgjakwajyYJsBcFsBw
         IID6vFPZSogqib6ZD2T7ztwKP73Yr2BV6MmGDJXrqjxt+U6KnlVBhM1QClxP/Gvd5kx9
         gK0cTCRpJSXcKtzhqDJG2Q//ttuAlV81rNIdX3JqNLeZ4NxHEatrAhrDxqVAUjTOGJr8
         M5bo88oU8rmZgE8oYIc6f4LTsS3Eu9y1YFoN/N5Jpr9fn5OPzCCNorqtPO6y7whSS6HM
         KpaXvODdfFhoagH3sKaeZPASo4ijJCzSQZ5pI3bmclGgbHN8ZqVrrWoV2JQu41b96rHr
         7WXQ==
X-Gm-Message-State: APjAAAXJavrF1raDCiT0DhGOv/dqwDH74++G3P2BrAJ1RznX10jS5kGY
	if9ibuP95krpvrrSNmdeThefQj4o
X-Google-Smtp-Source: APXvYqzi+sVHu8VG0O+VlkBK5lFI8X3/Vo1+1+1uShW6w4ASsOmFlmZxT/6ZdjwhL7XMnBAVU1eTwg==
X-Received: by 2002:a63:ec48:: with SMTP id r8mr16802349pgj.387.1564163446138;
        Fri, 26 Jul 2019 10:50:46 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-117-207.tukw.qwest.net. [97.126.117.207])
        by smtp.gmail.com with ESMTPSA id o24sm104287919pfp.135.2019.07.26.10.50.45
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 26 Jul 2019 10:50:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH 10/67] target/arm: Move test for AL into arm_skip_unless
Date: Fri, 26 Jul 2019 10:49:35 -0700
Message-Id: <20190726175032.6769-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190726175032.6769-1-richard.henderson@linaro.org>
References: <20190726175032.6769-1-richard.henderson@linaro.org>
X-TUID: ioRoDv+On1YR

We will shortly be calling this function much more often.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 28 ++++++++++++----------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 53c46fcdc4..36419025db 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -7705,8 +7705,14 @@ static void arm_gen_condlabel(DisasContext *s)
 /* Skip this instruction if the ARM condition is false */
 static void arm_skip_unless(DisasContext *s, uint32_t cond)
 {
-    arm_gen_condlabel(s);
-    arm_gen_test_cc(cond ^ 1, s->condlabel);
+    /*
+     * Conditionally skip the insn. Note that both 0xe and 0xf mean
+     * "always"; 0xf is not "never".
+     */
+    if (cond < 0xe) {
+        arm_gen_condlabel(s);
+        arm_gen_test_cc(cond ^ 1, s->condlabel);
+    }
 }
 
 static void disas_arm_insn(DisasContext *s, unsigned int insn)
@@ -7944,11 +7950,9 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
         }
         goto illegal_op;
     }
-    if (cond != 0xe) {
-        /* if not always execute, we generate a conditional jump to
-           next instruction */
-        arm_skip_unless(s, cond);
-    }
+
+    arm_skip_unless(s, cond);
+
     if ((insn & 0x0f900000) == 0x03000000) {
         if ((insn & (1 << 21)) == 0) {
             ARCH(6T2);
@@ -12095,15 +12099,7 @@ static void thumb_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
     dc->insn = insn;
 
     if (dc->condexec_mask && !thumb_insn_is_unconditional(dc, insn)) {
-        uint32_t cond = dc->condexec_cond;
-
-        /*
-         * Conditionally skip the insn. Note that both 0xe and 0xf mean
-         * "always"; 0xf is not "never".
-         */
-        if (cond < 0x0e) {
-            arm_skip_unless(dc, cond);
-        }
+        arm_skip_unless(dc, dc->condexec_cond);
     }
 
     if (is_16bit) {
-- 
2.17.1

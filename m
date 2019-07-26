Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp206741wrv;
        Fri, 26 Jul 2019 10:50:41 -0700 (PDT)
X-Received: by 2002:a62:82c2:: with SMTP id w185mr24383524pfd.202.1564163440922;
        Fri, 26 Jul 2019 10:50:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564163440; cv=none;
        d=google.com; s=arc-20160816;
        b=ocFrEN8QhOWZ2emBbXhREq6WjkjQRSZw1NCzECi3EkMGO94h1VHT08hzYGIg/u+9rF
         Mvx98SlGYXQwg6iyyd4EeDRmyGUs27chfrb9L0nXjWEEXQW+5yI9NJz+T37HVAlMcGC8
         ZHtj8g6LqOpKeugRwJiAugN2vXk8afr9YoJX/s2An4IovQU02Jg52eKXv/v7bItSUZ9W
         4WUck7D2DffC6m/mJbs9Tq1zwl5lozrOfER8JPSLrooGpoJfAmnuktW/RRB2V/Cr5zDd
         c2X27OW9tcsL5BIlFFyoEaai44kfbsMWkyLTVnes3RZE2OeW4qyzs1iH5kCKeiqX7oTc
         yg4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=7qMkBV6xIInqYLHQbsNGGIckvY18Pfy+zYd9EjT4q5E=;
        b=0CzEvI5naKLuAvol0ukS/3eVNeS6FH08+LZzBlExyPgciuk+PW0ezZKdqlJwxt/ebn
         /bxs++ZZy5VZUmjzvNaA1yDL/yULmxCSE+y5ReBMQ78lz0oxyP/7DuIwaI1JSQRrBEpX
         iKQuXPucYlSgF5ce+k2TZISqoFxQK2C3rorZ+g3YiigaTHhZ1TleAZjS7YwtDJAuj9pu
         GFmJQ+3mOatNpEsuz3DzTJsIggk/OraXMJ+VPtwWakmViUntgErgz7/MUoOZt1rzzcH9
         7J/fs4IiClXyEH0qB8ydLXxED0hMcw1lK4XPQ4XniEXE+1+DQDhhZba41JIsRBzPI5fz
         342w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HsnHg8Za;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id g95sor64525009plb.67.2019.07.26.10.50.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 26 Jul 2019 10:50:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HsnHg8Za;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=7qMkBV6xIInqYLHQbsNGGIckvY18Pfy+zYd9EjT4q5E=;
        b=HsnHg8ZaUxSGLCpbuDc4pmqUNrk330qSqmCO7NJTJx3m/vp85OhDyq2sIfoOQMvEbC
         zwJTp6aCdSb8Vzb5I3MzM/8NsArcdkXmTDaputpA722tHqznS9eORwuHooib+qqP6QPX
         i4jgNJnIHUVe00Xv060oFeiZXLFCKKhZWa5JReNbzYgaAUay+JlIWvlmRee4OYAushcY
         4plOVDzEuzXkEswad/+xa69p7Z7piLmNqV87qxYkjE+jbdyvH9bjbZxUdW5Y5JYhJ+3Y
         kEciIOkrHb7VL37Qaa59SQ0V+Er9+A7aybjUXqZYyK8jIcVNVueuEv6o3qiwkRkNOKkv
         wNmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=7qMkBV6xIInqYLHQbsNGGIckvY18Pfy+zYd9EjT4q5E=;
        b=WnQ8bcp0Fq/EZSOqWa7CRPROUP9nTrFed8dhlhFcRTkg91/ITzt9lv1Zu8TjUZflux
         q50px18zeroF5Nc1Ekqa7WE9nvkq2IL2cPWivQlOzZ5ZDDmFFVRlLOv+mP/J89hLH/tY
         eaa3FyVVNraK5eWg2jnH4ZXs7t4RjXFU9FTdk4zoLMmuIqkKlBMmrj4gkXZb6Hcbul9J
         VY/J260eciAlFD6tBD4ZjpRlt62tYHIa5wkliItSz3OTsNlXyDHJWKDeIvwipAaO1iF6
         csfMxIJW2OD72ZNbqQaQP8mXD3TUHGTg5GdAczJoVDUszjHz3+kO8ydqBp5pZwAuClrs
         c2CA==
X-Gm-Message-State: APjAAAU5+4BlDxObdxD9EJcSb9OpYslJctH77EJWcoNV0TLSgh6QffKi
	CpKWNlepcmbyIU22CWIWSX1R/IBv
X-Google-Smtp-Source: APXvYqw18BMzHqaWf3+n90CKJsgnhA1xy0JEpmQCJSX0Yq+s1T/pPXMgG7loi9NQgF0Gzd8kbGhBQg==
X-Received: by 2002:a17:902:4201:: with SMTP id g1mr97729634pld.300.1564163440520;
        Fri, 26 Jul 2019 10:50:40 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-117-207.tukw.qwest.net. [97.126.117.207])
        by smtp.gmail.com with ESMTPSA id o24sm104287919pfp.135.2019.07.26.10.50.39
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 26 Jul 2019 10:50:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH 05/67] target/arm: Use the saved value of the insn address
Date: Fri, 26 Jul 2019 10:49:30 -0700
Message-Id: <20190726175032.6769-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190726175032.6769-1-richard.henderson@linaro.org>
References: <20190726175032.6769-1-richard.henderson@linaro.org>
X-TUID: oNKfYrrvZjoZ

The address of the current insn is still available in s->base.pc_next,
and need not be recomputed from s->pc - 4.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 0848fb933a..595385e1b1 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1212,7 +1212,7 @@ static inline void gen_hvc(DisasContext *s, int imm16)
      * as an undefined insn by runtime configuration (ie before
      * the insn really executes).
      */
-    gen_set_pc_im(s, s->pc - 4);
+    gen_set_pc_im(s, s->base.pc_next);
     gen_helper_pre_hvc(cpu_env);
     /* Otherwise we will treat this as a real exception which
      * happens after execution of the insn. (The distinction matters
@@ -1231,7 +1231,7 @@ static inline void gen_smc(DisasContext *s)
      */
     TCGv_i32 tmp;
 
-    gen_set_pc_im(s, s->pc - 4);
+    gen_set_pc_im(s, s->base.pc_next);
     tmp = tcg_const_i32(syn_aa32_smc());
     gen_helper_pre_smc(cpu_env, tmp);
     tcg_temp_free_i32(tmp);
@@ -3190,7 +3190,7 @@ static void gen_msr_banked(DisasContext *s, int r, int sysm, int rn)
 
     /* Sync state because msr_banked() can raise exceptions */
     gen_set_condexec(s);
-    gen_set_pc_im(s, s->pc - 4);
+    gen_set_pc_im(s, s->base.pc_next);
     tcg_reg = load_reg(s, rn);
     tcg_tgtmode = tcg_const_i32(tgtmode);
     tcg_regno = tcg_const_i32(regno);
@@ -3212,7 +3212,7 @@ static void gen_mrs_banked(DisasContext *s, int r, int sysm, int rn)
 
     /* Sync state because mrs_banked() can raise exceptions */
     gen_set_condexec(s);
-    gen_set_pc_im(s, s->pc - 4);
+    gen_set_pc_im(s, s->base.pc_next);
     tcg_reg = tcg_temp_new_i32();
     tcg_tgtmode = tcg_const_i32(tgtmode);
     tcg_regno = tcg_const_i32(regno);
@@ -7219,7 +7219,7 @@ static int disas_coproc_insn(DisasContext *s, uint32_t insn)
             }
 
             gen_set_condexec(s);
-            gen_set_pc_im(s, s->pc - 4);
+            gen_set_pc_im(s, s->base.pc_next);
             tmpptr = tcg_const_ptr(ri);
             tcg_syn = tcg_const_i32(syndrome);
             tcg_isread = tcg_const_i32(isread);
@@ -7629,7 +7629,7 @@ static void gen_srs(DisasContext *s,
     tmp = tcg_const_i32(mode);
     /* get_r13_banked() will raise an exception if called from System mode */
     gen_set_condexec(s);
-    gen_set_pc_im(s, s->pc - 4);
+    gen_set_pc_im(s, s->base.pc_next);
     gen_helper_get_r13_banked(addr, cpu_env, tmp);
     tcg_temp_free_i32(tmp);
     switch (amode) {
-- 
2.17.1

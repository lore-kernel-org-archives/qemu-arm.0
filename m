Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp207906wrv;
        Fri, 26 Jul 2019 10:51:53 -0700 (PDT)
X-Received: by 2002:a17:902:8689:: with SMTP id g9mr90948065plo.252.1564163513093;
        Fri, 26 Jul 2019 10:51:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564163513; cv=none;
        d=google.com; s=arc-20160816;
        b=KzrX64iuZmicIn0vJ3nCOeed4SnMbUmJqyl0C4QJTjgWkp0Uto/ArESkfczucda2gI
         y+gjzUQ0hvtv1D8OEp90KfGYr+uxd8V6ucu4o7hW/554bGTAejtta5TSWDclPWxypwNz
         e+/0pkuyemVZo1zhccBseToLZ1vuEj1nc+UA8S+bbdA1Z86eIYpx4UCq0cEogDahxsrO
         23YSZXILUY1J/jjGzoIazylvoiJ4L4nMQkDDAMLYKoW4nPCTDaOP8I15EZqx59bAaqOo
         vcsY3F394V1BdI1GdT9cX9RzNM5DqpY5GYAIHxY0COsnOshB8sMeaFD4eKPLT9T7R208
         HTbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=CpCg1eLgsmeNBuXSBMKJnkt//MK4VjGPzn8vhxLPYT4=;
        b=e0GVuxmOpViIrnuLrmyjnZZmo126hsFHVerRtchu9ezOTYJLBwlYs9TYZ1Xh7ziNKx
         5IjXZhMCMsO2zXVmNdDHf1YZdkB1iQmwXhjCR4fmbCF7GAFmbRaogLD2c962yQBpMLDW
         9Vz0XuSOfsABLfBNCTgI/EpdOISO7RPtHheUqmDtGStcQmZWyAruiRVRnmJ70Y28yTBL
         HYeuNyBN2YjMLtEZw7rLZs40koNnsv0v9u5USEw31FTDF/xemgOHq2umuOCkM0YuEFqf
         gdMigzRC0vua9j/6E80jKVw2CJI/ROGlShVdLlp6GqCkH/vS0idcPjdnfNTwSYnu/gxm
         L7gQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QNMjh3w8;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id q62sor64077277pjb.10.2019.07.26.10.51.52
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 26 Jul 2019 10:51:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QNMjh3w8;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=CpCg1eLgsmeNBuXSBMKJnkt//MK4VjGPzn8vhxLPYT4=;
        b=QNMjh3w8HR3G0vPDqCVV1OMzSsqKpgoqDpwu/LU8YFxUHa4kQaBqG+uioKMmdFuWTW
         hUBr+I48dQ/YYVR456EjtWF2zNlNT8VLGcf9QrtuHWcBuF2EbEY4P0nQBeNAdkggrqQq
         wJWebg3i8Om8Dwz/kvHaNOxP0BTWKXZYrCmoE3yu048+k0r30HiBPgDAijS3cLbOsd3d
         k+V6qSRB/dw8ouyY2nlW2DWrY7gLnrtd/JcSNmovAib/syRZHuLk0e6/VFcH1vJxDMmX
         egcROH59F0gd6umRJZGVnBjb+ChYll7z8GlRFmNLM0TnSCVi12YhfPlr9SqizaMv+ZA1
         StGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=CpCg1eLgsmeNBuXSBMKJnkt//MK4VjGPzn8vhxLPYT4=;
        b=BNiLASgUzBtXd+vvcn8zI9hZzMHQOKCBDqxwo3vrTuPBOZgfeuuvk7oD0PFUM0uGx5
         m3r8rSSQjHc9FG4bFuvWmmdVmwu2cD0Lz303vYSc4KIzs4EnoFadJCGx3UJoSDCI6eF1
         hYbdedV/NmUjaOxRjhE2RMLANEKXXhOvi4t8ziTdwEsYAfIHFOFZwRSdKY/C26xM7Yu8
         KeR/wM+kPOr20osQ10xwtRGaZuWjn9CY6d67nQEbh7ZxGen1arW+j79ZAzvMY2zx0Aq6
         /6zxErjyZMAi7eO40lAK9xr+CNvRsr36I9Kb4bglttHxNCgNPJ47cSad1ykRfZgeAQcK
         fexQ==
X-Gm-Message-State: APjAAAWBLer/v3GOTgwxm1HT3ylSNSW/GSAGv3uJ6cGdLDTo9KmksUEp
	de9UVGPJMgfQ8TiWKmFwgvQX7HXU
X-Google-Smtp-Source: APXvYqzKCOAkEGfTHNztVAyyb3bE75Fpu8/PkllTbGLXMo9IesjJOtIdOukYO8/VmqXjJXRde5ioLg==
X-Received: by 2002:a17:90a:ac11:: with SMTP id o17mr100551920pjq.134.1564163512683;
        Fri, 26 Jul 2019 10:51:52 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-117-207.tukw.qwest.net. [97.126.117.207])
        by smtp.gmail.com with ESMTPSA id o24sm104287919pfp.135.2019.07.26.10.51.51
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 26 Jul 2019 10:51:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH 66/67] target/arm: Move singlestep check from gen_jmp to gen_goto_tb
Date: Fri, 26 Jul 2019 10:50:31 -0700
Message-Id: <20190726175032.6769-67-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190726175032.6769-1-richard.henderson@linaro.org>
References: <20190726175032.6769-1-richard.henderson@linaro.org>
X-TUID: RG7vtJej553w

We miss quite a number of single-step events by having
the check in the wrong place.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index c2b8b86fd2..9ae9b23823 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -2740,7 +2740,10 @@ static void gen_goto_ptr(void)
  */
 static void gen_goto_tb(DisasContext *s, int n, target_ulong dest)
 {
-    if (use_goto_tb(s, dest)) {
+    if (unlikely(is_singlestepping(s))) {
+        gen_set_pc_im(s, dest);
+        gen_singlestep_exception(s);
+    } else if (use_goto_tb(s, dest)) {
         tcg_gen_goto_tb(n);
         gen_set_pc_im(s, dest);
         tcg_gen_exit_tb(s->base.tb, n);
@@ -2751,16 +2754,9 @@ static void gen_goto_tb(DisasContext *s, int n, target_ulong dest)
     s->base.is_jmp = DISAS_NORETURN;
 }
 
-static inline void gen_jmp (DisasContext *s, uint32_t dest)
+static inline void gen_jmp(DisasContext *s, uint32_t dest)
 {
-    if (unlikely(is_singlestepping(s))) {
-        /* An indirect jump so that we still trigger the debug exception.  */
-        if (s->thumb)
-            dest |= 1;
-        gen_bx_im(s, dest);
-    } else {
-        gen_goto_tb(s, 0, dest);
-    }
+    gen_goto_tb(s, 0, dest);
 }
 
 static inline void gen_mulxy(TCGv_i32 t0, TCGv_i32 t1, int x, int y)
-- 
2.17.1

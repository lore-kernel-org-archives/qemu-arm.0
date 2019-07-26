Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp207922wrv;
        Fri, 26 Jul 2019 10:51:54 -0700 (PDT)
X-Received: by 2002:a17:902:44e:: with SMTP id 72mr97532050ple.326.1564163514238;
        Fri, 26 Jul 2019 10:51:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564163514; cv=none;
        d=google.com; s=arc-20160816;
        b=BNWG5sZFXx0/yijOrGwp0UxXXYV0zbZUpRL/H5BRaGGJjqLnGPZJTIAC8PgwYhRClj
         ptOI37bGSW6xR2Deri6lrQOBGGjZVVCRzUafBg+oCYtDawomiThTzxZz2ZxINHNwuc9O
         3HiJ1nIXWUfGlmWnVFfkJ6k7uIIiAtptF47tkQ0HN62IZH7qxNhXyNPYnXDZ30ViAjVm
         aEcF81CTSC7ObQb9kXvk9yw6RVFM7VGA3/BHhbOkBJDRbxHszTLNbygnprqmpBG8zXEZ
         h4VbRQmxQneUF4E1JxJ/Cs4QyWhtYClBPWflaW6oClRcdFs21EBVk0bn2WqzHH3+oAVP
         GAhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=ggteB4WINk5mb6nMpXwNHzA9GUmr46ovcnkhvcdKD8k=;
        b=eH+/eR6kPJflY2WgEd9E61T9FCnRTqK68+7fXVG9DKDhRRByu0xZG0R4cPAQdvkWop
         1lk9h92GLtnyxxRgjfGPldBB6yhmdCA9xDeJEO6zn/3/FjN1CIKK1Lb30kr688VWfjm+
         nW6Q93P7EPhXETHMLGeApivIkUJvRHWL+Gjuw0J6iRqCby1LEgLKiYl285L6wUWQ+UZl
         BlQd8qrVOfo7ejTK2vRCaiNMa2R1DMds+MfesPDe35cxpnbANxIHezZj3zpalcRuF7JB
         g2o/e3gjDTQxBIbmXyvZDbdRKHk1eVLAROv7Ui7P/V/l9Joy/+VfubFvgAIrfIudHRts
         5dng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Buc8ocpp;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id x15sor63894852pln.50.2019.07.26.10.51.54
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 26 Jul 2019 10:51:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Buc8ocpp;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ggteB4WINk5mb6nMpXwNHzA9GUmr46ovcnkhvcdKD8k=;
        b=Buc8ocppTVZ8/0vu8O9BFAEvpnSUEBT08+KVgqmbrllPtLH1/hU4ckz56I+Esxjxzg
         ZrY1cZ1dtZy+SNx4EIMeD9lCtj7pi6eEXSm9O+X2OdhOjDeuUhzON26nzdm9Rc6fc95t
         DzB2/sDs4SW116bRspRHF8ezfsdjhAckAJC222a692ZTS6IFWNGQPra2PNGMlA3oFfrE
         5RNSApyaWBqw0+1W4FdTGMB3cFgqvYt4K+E2C/l0Uyc3H8cSgo7tJ0eViMPMpnn02Ads
         E8jR2HBPTkhA9hF2NJKgf5tUeaIBNEWROJBIjaeVtcaEQblh7lnmyCmiIBbgrcwpUYLY
         /sow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ggteB4WINk5mb6nMpXwNHzA9GUmr46ovcnkhvcdKD8k=;
        b=gYUL/W17nbBtU452ehzqVqahlMbfAAE2aGLVxHZpA6NoAWjM2d92WAYm1wz0b8ZDkV
         o3mmrv1BNU0TNg8DdkmTq5rZqfuv0+OLt9RxrLCWlIR1MpmXBLDPJMfisFAyXAh3KwME
         hpYQsNv+v08rtSJgNX2nLpoKl6EHYNeqoUssn7kJF+EN3EQmR2SWF5TzWfYLpJyBZXkA
         fkJLLplewxID+fxdB1WlF5RYAo106XncU4ViA3UdZ7i3fT44wlbLbkTfPT6robNxQ0Xk
         S5urRRI57YqqNnmAXv2OI9g1PhRQDBsLLys5GQ+pT4qa45YCcaE64VktwscHb3h+Km04
         spdg==
X-Gm-Message-State: APjAAAXvpflt2vjkRfazW6dSJtyFQs4GSppR0M7gZAfgEHKoW/oHH7uj
	injNoq/ZMXSo8ya4cgTNxigCqazo
X-Google-Smtp-Source: APXvYqxuycKcD2FE60LO3agy4DSjcMsPKKJxoGOhSLIoE3Vn4TsB83lS1Pq1v6ttohtpFsLKbFcXeg==
X-Received: by 2002:a17:902:bd94:: with SMTP id q20mr87126516pls.307.1564163513826;
        Fri, 26 Jul 2019 10:51:53 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-117-207.tukw.qwest.net. [97.126.117.207])
        by smtp.gmail.com with ESMTPSA id o24sm104287919pfp.135.2019.07.26.10.51.52
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 26 Jul 2019 10:51:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH 67/67] target/arm: Merge gen_bx_im into trans_BLX_i
Date: Fri, 26 Jul 2019 10:50:32 -0700
Message-Id: <20190726175032.6769-68-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190726175032.6769-1-richard.henderson@linaro.org>
References: <20190726175032.6769-1-richard.henderson@linaro.org>
X-TUID: vGJABe2tbxjs

This is the only remaining use of gen_bx_im.  Simplify, since we know
the destination mode is changing.  Use gen_jmp for the actual branch.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 23 +++++++----------------
 1 file changed, 7 insertions(+), 16 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 9ae9b23823..dc51e1e622 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -813,21 +813,6 @@ static inline void gen_set_pc_im(DisasContext *s, target_ulong val)
     tcg_gen_movi_i32(cpu_R[15], val);
 }
 
-/* Set PC and Thumb state from an immediate address.  */
-static inline void gen_bx_im(DisasContext *s, uint32_t addr)
-{
-    TCGv_i32 tmp;
-
-    s->base.is_jmp = DISAS_JUMP;
-    if (s->thumb != (addr & 1)) {
-        tmp = tcg_temp_new_i32();
-        tcg_gen_movi_i32(tmp, addr & 1);
-        tcg_gen_st_i32(tmp, cpu_env, offsetof(CPUARMState, thumb));
-        tcg_temp_free_i32(tmp);
-    }
-    tcg_gen_movi_i32(cpu_R[15], addr & ~1);
-}
-
 /* Set PC and Thumb state from var.  var is marked as dead.  */
 static inline void gen_bx(DisasContext *s, TCGv_i32 var)
 {
@@ -10042,12 +10027,18 @@ static bool trans_BL(DisasContext *s, arg_i *a)
 
 static bool trans_BLX_i(DisasContext *s, arg_BLX_i *a)
 {
+    TCGv_i32 tmp;
+
     /* For A32, ARCH(5) is checked near the start of the uncond block. */
     if (s->thumb && (a->imm & 2)) {
         return false;
     }
     tcg_gen_movi_i32(cpu_R[14], s->pc | s->thumb);
-    gen_bx_im(s, (s->pc_read & ~3) + a->imm + !s->thumb);
+    tmp = tcg_temp_new_i32();
+    tcg_gen_movi_i32(tmp, !s->thumb);
+    tcg_gen_st_i32(tmp, cpu_env, offsetof(CPUARMState, thumb));
+    tcg_temp_free_i32(tmp);
+    gen_jmp(s, (s->pc_read & ~3) + a->imm);
     return true;
 }
 
-- 
2.17.1

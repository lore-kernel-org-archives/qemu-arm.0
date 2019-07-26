Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp206696wrv;
        Fri, 26 Jul 2019 10:50:38 -0700 (PDT)
X-Received: by 2002:a17:90a:ac14:: with SMTP id o20mr100457339pjq.114.1564163438343;
        Fri, 26 Jul 2019 10:50:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564163438; cv=none;
        d=google.com; s=arc-20160816;
        b=kWSG8P1/BopbVYb4QRC8AKcxMQqSzUzyYy/W7DPxt6NJFLvREakIc8rjrPbb5jm4ki
         nUIndQYUfTZZBZv9iO8x/MJdOTs7T8FdDKIVEpm3sEPxSf/U+2S3dQhq9D6oNDgx6oqZ
         2staEfj+VN+eKULNR5Rt5S9dsGht5xCy0Y1hBsHCtRUt4/+prchrOVkz/yvUQuU5hzKB
         hKrx+IptAma8ITGAD0gWS1C/kf3FRyWWe8Ey5sL2Nhy2F50ZH/n7Q05chOf4M72NaJvI
         xLaGru1Mx+4h7EZ0gsdTTFSuZN0/rIJZulKhC6XTJhNJshRYxr3+NjVNlGtmGOLanFYf
         Nwig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=0JuwQx0rsSZ8qsmRHdUvrfpwMYNiERG9Y6tvmeQiWIA=;
        b=GW3G81NH9lSXhiG57HGAWyo7dyqa4nBTTsvdk1fhBBF2ZIvoK1mV+3cjzr5MNv738i
         o7OrpUWvET1eqv4iQPlj/u4WJWhg2MsPaqRWnw75vyMbv9joYPzWVhjNAyf7nu/MLh5w
         /wzh/ephpBntaYHUSvGd5l9dabWiDzdW4c/PmwGVr3mC6OBtHQnWxANM4dhv9/XEBFXg
         sUXYmhITokFSwZTC2offpKLD4gHzydxH5av09VCvCUAUTDNCrQFoZku9ylLbZI4eaFPT
         Sn4OcsAqsCRcSHUotoYId1hdhkoGcEBjLytKIr5CA1o/3W71eHJLKLoZGymyU5tFD99/
         hl3w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mdDlubgV;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id m33sor63681914pjb.4.2019.07.26.10.50.38
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 26 Jul 2019 10:50:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mdDlubgV;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=0JuwQx0rsSZ8qsmRHdUvrfpwMYNiERG9Y6tvmeQiWIA=;
        b=mdDlubgVyDpI0gBB/9wS4I3ZOTQgv4PpfZOk+KWeOqCkAjg83eDxHSixsyqM/xsBH/
         BUVd6oQhdvo5O9aiW5mkGLz7dEIhy3r0ivcthlWlYuq4gGzBsfLKkHKBneIkiO919vcx
         t1WvOzaFxWjUepiRoMhwm5dfyd/rmBatVGkWj0EmEZAEC+syAvh0jVEbFIZmuA+YoA6t
         ysnYu1tw3IFx1kJynkc7h3HfJyre+u0vB8LD4He5RzXNQMnMiQlfcT2jvVgTb3AVFOfw
         y/ZcEUS0wdrLVSzBk/yeO36PMtHFp9rn7/FUPQRpmh53uzbZ+jZYm8uuGIhZtB1sk5lg
         sDDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=0JuwQx0rsSZ8qsmRHdUvrfpwMYNiERG9Y6tvmeQiWIA=;
        b=dNZ2U60AnAKCGYHElgdyY8MICZEn48IIo0dAee1Xs9bamBvvgDGcqbNFuzq8KN5YTm
         w4Rgz4hQAt55EpjjptT8+OBLhyiMdtabf3DtMelQCd1T+1Ub8Fm0+4VQVDeaHaypKYLX
         IHEHxz1HnIOsAq+7etrPEXjIlZn12fyG1ENjtxaYhbVTXq7FqszCIPOiFLOnWt7KhJyR
         9OgvGeRhqhHVK28uSZTeYpEUG2KgO1fSktbyMz1uTFAd1QKxxCaIKtISY+385wE3+V03
         u6WoK1FVSpN3U4YlsrvhPtusIQIdzdDhcgDl3GJM29GGD/kjhyixAacaPMm+EN8f0KRu
         N8QA==
X-Gm-Message-State: APjAAAWw6xv1Xx+NMLR9PokV9q1udpMx0LWo1aTC6SIwnEnPRvY88pIw
	D5DgaAHod3dkAgFBmVhOjVQlEGND
X-Google-Smtp-Source: APXvYqwvTy4iDYLI8dksQMq4dUVkoUFdrcz7PpaveHPuTEiudndRV441C6L2lXW/dW7b2EFVS2Wx7Q==
X-Received: by 2002:a17:90a:3463:: with SMTP id o90mr101503225pjb.15.1564163437889;
        Fri, 26 Jul 2019 10:50:37 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-117-207.tukw.qwest.net. [97.126.117.207])
        by smtp.gmail.com with ESMTPSA id o24sm104287919pfp.135.2019.07.26.10.50.36
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 26 Jul 2019 10:50:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH 03/67] target/arm: Remove offset argument to gen_exception_bkpt_insn
Date: Fri, 26 Jul 2019 10:49:28 -0700
Message-Id: <20190726175032.6769-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190726175032.6769-1-richard.henderson@linaro.org>
References: <20190726175032.6769-1-richard.henderson@linaro.org>
X-TUID: 4kaHNMuWZcgW

The address of the current insn is still available in s->base.pc_next.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 33f78296eb..19b126d4f3 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1256,12 +1256,12 @@ static void gen_exception_insn(DisasContext *s, int excp, int syn,
     s->base.is_jmp = DISAS_NORETURN;
 }
 
-static void gen_exception_bkpt_insn(DisasContext *s, int offset, uint32_t syn)
+static void gen_exception_bkpt_insn(DisasContext *s, uint32_t syn)
 {
     TCGv_i32 tcg_syn;
 
     gen_set_condexec(s);
-    gen_set_pc_im(s, s->pc - offset);
+    gen_set_pc_im(s, s->base.pc_next);
     tcg_syn = tcg_const_i32(syn);
     gen_helper_exception_bkpt_insn(cpu_env, tcg_syn);
     tcg_temp_free_i32(tcg_syn);
@@ -8139,7 +8139,7 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
             case 1:
                 /* bkpt */
                 ARCH(5);
-                gen_exception_bkpt_insn(s, 4, syn_aa32_bkpt(imm16, false));
+                gen_exception_bkpt_insn(s, syn_aa32_bkpt(imm16, false));
                 break;
             case 2:
                 /* Hypervisor call (v7) */
@@ -11611,7 +11611,7 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
         {
             int imm8 = extract32(insn, 0, 8);
             ARCH(5);
-            gen_exception_bkpt_insn(s, 2, syn_aa32_bkpt(imm8, true));
+            gen_exception_bkpt_insn(s, syn_aa32_bkpt(imm8, true));
             break;
         }
 
-- 
2.17.1

Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp206803wrv;
        Fri, 26 Jul 2019 10:50:44 -0700 (PDT)
X-Received: by 2002:a63:4041:: with SMTP id n62mr21364514pga.312.1564163444219;
        Fri, 26 Jul 2019 10:50:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564163444; cv=none;
        d=google.com; s=arc-20160816;
        b=gjP4iVQ0d+xAcGIVuUpuK0cXQ6KmHkHxjEfDa+pgWEsJmWYw+SKBCHhm6Uq3g2KP5V
         99kKRmuvxbtJ9ofvHpqo69+zmYOshLeY7VeKpkKYRgrzlbu93tAyuZxhjBMis0uhIz7X
         rKACSjd9V31BMeOQ9iC0Q6OC6M9Bdcf5qJol4gIWVCa5AuaxlExLWtm5p51F/bjoOEtK
         /HBfJEBffjkp4s+fyIBgkx+wSDGdGM0mTbL/1PEpmBBb8pkL+T+OYn2j5bzJhTUo2+HL
         MHeTOMuKALS+B7XDZIwJsHSk3AyHSa+rDgZhDWk50ObAkQnTmir3V/lKsfgdq5Vkckcb
         gw2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=aps50xe7CceEtOuNm5w6u+s65ojahSCeZEPTzeYb2Dc=;
        b=LRVZOeNibbUSGhMlCbC9oHkyKK9agU5EJA5yj4Ih3429Z+/v0uw6Eixkq4pvDDQrJe
         B+fGWJkmwnaAW37QwRmjBoloEQmeabXBXBaJiYQUk3ftsKmiMuAa0qXCmSX/pDrmbx2u
         RVIeUzjLTFEpbrG8DAHMkeWZMo/iJ80ecCQ4AHEbS9XTjak4ZdcqjShDD6m1CwkTwlYp
         R9TugRhY5PfqeTVCS5LyfzF49DKtaaKFyeIpNPwBpMqKtVXoLBnpNL96E5GpZBuEKfuS
         uR9Lm8RIaX9DHOQOPtjq8qXfLUl26fZlLXjMLyMSNri4MkT7u8BnMFZR+lh1OgFVMFW0
         CzHg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OUdEzYa8;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id r27sor34972237pfq.73.2019.07.26.10.50.44
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 26 Jul 2019 10:50:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OUdEzYa8;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=aps50xe7CceEtOuNm5w6u+s65ojahSCeZEPTzeYb2Dc=;
        b=OUdEzYa8SNfl74dE7aT6MwUI/pOTiIrNiw17RqWvxMcwtWmNvLDxWFx+wt16lCxiYs
         eNE78fLQL1V/WgNjmGRWl0Yp8dfq36CS61hQRz6hSf/LOCki2+ptyYwwGifOoK2k0H8K
         ErHfEigw0OEW+/7MQ/xwXez7wLEOyZmt5KGCzVnhhU/oDJsEwaUfq9rumsHSZW+sDGRA
         vGQGGJF4hiGk78/M1Z8FE6Tuu2o+JJa59UibkAo0O1le2UrbjndcO4i+DmMBvsjHNcwN
         d9wmRS6fvhQGFwcO6AAWQk6xv/ZF+OM1Am788PuAyk4KGdxFb9aDxgwUNtfy3BK0jSEP
         ZZCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=aps50xe7CceEtOuNm5w6u+s65ojahSCeZEPTzeYb2Dc=;
        b=SzJWexXD8hWb857UR8RmYLQxOOhTuOSNL0/NVniM0zrdBDPoIHL1QC4BO9w5pyZZ2D
         6xKH18S6qJrQ8j/+nyh7WsaylxHpjG6SWbMUach0mbWxdTZp5fwcuA3mhuLnP12Hoo1f
         VC/vWEPOcEMjc3NDkwZPXNZofZ93ryquvNaYrxGKDh7J/LAP+rVZ16XAVi/9ZgIthhC3
         rA5qFnOH+e0FpsMbJtyHAJIDsMM+SMwMnbHzA2JWfApBKXnMGcjEhJDtbH+Ow5R/gsWU
         sEpRY3FFaXAEUA/p0Az/BPDqnxiSj3UF2py1XZmdhWHP0iHB5LVAwUKrP43kiaFWEmR1
         bPbA==
X-Gm-Message-State: APjAAAUzXBGzE6XiGlbwbZds6YeXiAIW1k3InoqbFrI5uBlBwr1mo26c
	eZ7eUUOi1I7690dGi01dEBN3XRh1
X-Google-Smtp-Source: APXvYqyDeOxLqtrMhdkYEat+40Q1Xq6S1xdyeEris1C1nlv2eW5tEqThEo9kY4QQSozlK9kQUqd30Q==
X-Received: by 2002:a62:ae01:: with SMTP id q1mr22905447pff.219.1564163443819;
        Fri, 26 Jul 2019 10:50:43 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-117-207.tukw.qwest.net. [97.126.117.207])
        by smtp.gmail.com with ESMTPSA id o24sm104287919pfp.135.2019.07.26.10.50.42
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 26 Jul 2019 10:50:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH 08/67] target/arm: Use store_reg_from_load in thumb2 code
Date: Fri, 26 Jul 2019 10:49:33 -0700
Message-Id: <20190726175032.6769-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190726175032.6769-1-richard.henderson@linaro.org>
References: <20190726175032.6769-1-richard.henderson@linaro.org>
X-TUID: C05OHC6yQZoE

There is an extra always-true ARMv5 test, but this will
become more obvious once we start unifying the
implementation of A32+T32.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 5e2dd8bb16..e316eeb312 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9773,13 +9773,11 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
                         /* Load.  */
                         tmp = tcg_temp_new_i32();
                         gen_aa32_ld32u(s, tmp, addr, get_mem_index(s));
-                        if (i == 15) {
-                            gen_bx_excret(s, tmp);
-                        } else if (i == rn) {
+                        if (i == rn) {
                             loaded_var = tmp;
                             loaded_base = 1;
                         } else {
-                            store_reg(s, i, tmp);
+                            store_reg_from_load(s, i, tmp);
                         }
                     } else {
                         /* Store.  */
@@ -10914,11 +10912,7 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
                 tcg_temp_free_i32(addr);
                 goto illegal_op;
             }
-            if (rs == 15) {
-                gen_bx_excret(s, tmp);
-            } else {
-                store_reg(s, rs, tmp);
-            }
+            store_reg_from_load(s, rs, tmp);
         } else {
             /* Store.  */
             tmp = load_reg(s, rs);
-- 
2.17.1

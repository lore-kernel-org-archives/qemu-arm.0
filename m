Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp207614wrv;
        Fri, 26 Jul 2019 10:51:34 -0700 (PDT)
X-Received: by 2002:aa7:858b:: with SMTP id w11mr22512074pfn.68.1564163494086;
        Fri, 26 Jul 2019 10:51:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564163494; cv=none;
        d=google.com; s=arc-20160816;
        b=opqWr+g5bniFueXDDPHTXO/d0YTLj9YzDVU0izEyuIQM1qE/v4Tqyg3HCwXNOusTDZ
         SP8Z+WonuHSfh3Lsxn5uT0bI8Eo6YERv1Wl+n1Y+roexTJsrtVZaP8ftEdeXJ9od/BGv
         h0SUnqksWyUP93xdsRqT6VGfD6FSJ8Pvn86npent9BYIX0/5OcsOizepO0EEQzppgoIQ
         S6qslkZ5iqvUDUTvB9EWrEJIYtlpTjFVzvOS7KjUV4Tsp5Wgphmi7qg4c4dl5jXdMDBQ
         k8806Deo1d0NzbaFmuJaeGK3BMusqGLSFkqte5BSs2gmVwWpTu07H98HpSs9nQlBMhuP
         k5zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=7nWDfS+LdH5ciQPlK6I4CJ7o4VfuIN/4vlkt7Y4d8wE=;
        b=Z2MUDQWDB+7HGfAGELjQ9liwmqcpSWznGuyEjaOMKn5Q2ZtsQGRdEau0U/CozF/pzQ
         t3WtxaoD8at5XpRnEKF+bA2IBhlfkMoygtukjwhvhsulEU8ladixXZZD9SeBNvbb69fF
         82YOMcEgkJWSAP8doffKCusWeYhzyoUJJonv7UfkqvvMm5Vp1wHfHMcTzcd3X4fWGdiJ
         u+2NTwh3jVQRHZntnNTKoOSShKtWTjMkAopTRR75THnafSBN6HMQD70zZ9Z2ha4KWWTO
         qZGFfGqCMYIWWCCCw6YhshD15iZbdWczv1fOSGc66jcTv2zPuqObWqKEVt2xFQr6dc8I
         id7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KT+IyBJ0;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id h90sor64765538plb.26.2019.07.26.10.51.33
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 26 Jul 2019 10:51:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KT+IyBJ0;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=7nWDfS+LdH5ciQPlK6I4CJ7o4VfuIN/4vlkt7Y4d8wE=;
        b=KT+IyBJ0sQ4gxsqcoF8Y9qFThtAqsqt8oEfZeIROZyIyzZKUae7CJfu664N7GDnRJR
         VNus7Haphr8QjZ3VWoiWV3y2OeZc2h/t4Nd592i/embtWuZOMiQ0+BWEi/4Dbd8lXvzK
         yI9e/vposoNleYJFWqVHuJr97CXVfhIy6Yu0gVwJ0LPgLgqpq/9QBp51adkG0U3TdsH6
         oEqfZuZ1C7FDV1Xw86XCdgfp9WbzIORxENAtj7NoUvNdoDkmGunOrJI17d19HiDr7Fu9
         QBW4vaqZQoY4cN0L+YjKLuFlBhqfkhM84usqbV/wM4KqFazgP/E0RLv54W2vB5O9yQhI
         O3/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=7nWDfS+LdH5ciQPlK6I4CJ7o4VfuIN/4vlkt7Y4d8wE=;
        b=e4BMWUmr9BP2UEsrQaVe5gd6WqS8fkahR/zmB8UPPsHLkVRAk7v1+NPiGt6Y323n+0
         TPRBxa4oWKA04m5hYRSEmfXLuUJjsgFj04PqoLTQRkiqyosxxRfbg4Pvt+Xqt3Qzn33d
         SQAESDAZRx101Z8zTDgnVo7l1sf2XKwp6iFdcxhpveHwZL4HPmfLf5jt6deJGnUYL2B3
         XGjlmCRgBlQI37Gkv7MVFzv65UKBoFtlmA7FYsrAf1s7+ypJLha5W0qD+2Ng10x8x5UI
         LvOdpRf3HBo6I/MHaDiWFJQv8ocmMWjhPjdD+VM59d3oxqrVwiK3WkS2kN9Wi9PKZ+a5
         CBZg==
X-Gm-Message-State: APjAAAWqq5ECL4x/Ae72rcwmws439o6dkI0LwUOqvx1eiVEJ2w0vxBfN
	YtqjfDbtwJ4FAiuDygz2HmFn+YVw
X-Google-Smtp-Source: APXvYqz/XR//yyEDJrSUkQ83RzDap/BP21UiaCQV+jkOkjV3VKvhMvpt/mN4vdvfZb8sjOUOLQKDZA==
X-Received: by 2002:a17:902:b48f:: with SMTP id y15mr99334283plr.268.1564163493700;
        Fri, 26 Jul 2019 10:51:33 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-117-207.tukw.qwest.net. [97.126.117.207])
        by smtp.gmail.com with ESMTPSA id o24sm104287919pfp.135.2019.07.26.10.51.32
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 26 Jul 2019 10:51:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH 49/67] target/arm: Convert T16 add/sub (3 low, 2 low and imm)
Date: Fri, 26 Jul 2019 10:50:14 -0700
Message-Id: <20190726175032.6769-50-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190726175032.6769-1-richard.henderson@linaro.org>
References: <20190726175032.6769-1-richard.henderson@linaro.org>
X-TUID: ZcuQPe54404Z

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 26 ++------------------------
 target/arm/t16.decode  | 16 ++++++++++++++++
 2 files changed, 18 insertions(+), 24 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index f551fde3db..692891dbe0 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10580,31 +10580,9 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
              * 0b0001_1xxx_xxxx_xxxx
              *  - Add, subtract (three low registers)
              *  - Add, subtract (two low registers and immediate)
+             * In decodetree.
              */
-            rn = (insn >> 3) & 7;
-            tmp = load_reg(s, rn);
-            if (insn & (1 << 10)) {
-                /* immediate */
-                tmp2 = tcg_temp_new_i32();
-                tcg_gen_movi_i32(tmp2, (insn >> 6) & 7);
-            } else {
-                /* reg */
-                rm = (insn >> 6) & 7;
-                tmp2 = load_reg(s, rm);
-            }
-            if (insn & (1 << 9)) {
-                if (s->condexec_mask)
-                    tcg_gen_sub_i32(tmp, tmp, tmp2);
-                else
-                    gen_sub_CC(tmp, tmp, tmp2);
-            } else {
-                if (s->condexec_mask)
-                    tcg_gen_add_i32(tmp, tmp, tmp2);
-                else
-                    gen_add_CC(tmp, tmp, tmp2);
-            }
-            tcg_temp_free_i32(tmp2);
-            store_reg(s, rd, tmp);
+            goto illegal_op;
         } else {
             /* shift immediate */
             rm = (insn >> 3) & 7;
diff --git a/target/arm/t16.decode b/target/arm/t16.decode
index 67476b30dc..965fb1bf6e 100644
--- a/target/arm/t16.decode
+++ b/target/arm/t16.decode
@@ -117,3 +117,19 @@ ADD_rri         10101 rd:3 ........ \
 
 STM             11000 ... ........              @ldstm
 LDM_t16         11001 ... ........              @ldstm
+
+# Add/subtract (three low registers)
+
+@addsub_3       ....... rm:3 rn:3 rd:3 \
+                &s_rrr_shi %s shim=0 shty=0
+
+ADD_rrri        0001100 ... ... ...             @addsub_3
+SUB_rrri        0001101 ... ... ...             @addsub_3
+
+# Add/subtract (two low registers and immediate)
+
+@addsub_2i      ....... imm:3 rn:3 rd:3 \
+                &s_rri_rot %s rot=0
+
+ADD_rri         0001 110 ... ... ...            @addsub_2i
+SUB_rri         0001 111 ... ... ...            @addsub_2i
-- 
2.17.1

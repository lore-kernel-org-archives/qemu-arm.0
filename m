Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp207701wrv;
        Fri, 26 Jul 2019 10:51:38 -0700 (PDT)
X-Received: by 2002:a63:d941:: with SMTP id e1mr58891457pgj.75.1564163498697;
        Fri, 26 Jul 2019 10:51:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564163498; cv=none;
        d=google.com; s=arc-20160816;
        b=Mg8Tt4FASPpUywkvrAApUE5Ola43AYbvwkOpWiHRhj20yj8qMt9Wn6gA5UUA41F+YO
         fERWzHDRDwzSSkLRGxKiz0+yf/a70LD3NMyry0u808jMOw2/u/I6vzARJmqWpI7VIjOW
         ItIW28fEMM0miek84kNcSnEsknLXLlJYZSI4WjYPX25udk3/WpQY+rc+L5yAvhMMGuXc
         ZaTpTPaYND91L8+erWbxqGbY8ZUJqynavIetSLu6Yyg/euKps1VmyTr5BEU9VublUuxl
         TSol7R9BnFK5eeEw0iMl3P8OO2pOUVmAS69w4ZstZ1bK8zFAD+fzRaej6vtqTFibclgq
         G//Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=4oQFd4eolp/sR05iPY07hrdPVedFpqTSb74q9tevE6Q=;
        b=IKXoQwAAd7j+oHOUBoNvsVba8u7HsGb8qiHv6onwI/VvmeIqiMR38AoqZqvY5LYjvO
         6GwR57A7Vyaa+bwO5+PyshDq+sqDhbn45KTIxIMW3d0WKi1F0pLYkEFsQKP96M9Nu7pO
         DS4RB/4kb9RMTaEoj6P5eihufen9FCRPa1NCn/TX4xO2mqXYwwlvXGKp1MtKRBYtrMVj
         4Hh8NS3pjd7f/ikIk5km2Cn9VR3ES7OBH3x0DLQq394UPGIPWDzhK9FqGGv9DJkLyuTg
         x9S7MTq06vJF8ej7ss7+xKHMHBzdV+GBhaEL2kzsT9YlYNYlT4jxCoQ+S+8AuLoH5yOw
         9Gfw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sebaT5Ca;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id r11sor64471774pjb.8.2019.07.26.10.51.38
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 26 Jul 2019 10:51:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sebaT5Ca;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=4oQFd4eolp/sR05iPY07hrdPVedFpqTSb74q9tevE6Q=;
        b=sebaT5CasiTw2aM3248r1KuO5rtFcs1xBcJSCI0q1O9VXVe8TaJ5Jd4Xof3DPSkguy
         SdwPX+1iUc6OEXijV+TlXieOtSH9CiMnH1cGu8E6VElNAFU3DJEYnFwmcTj4gWP9mmUK
         /wPf2JdJDkvHEmeOaTfp+7hzDOgFzA/rI4rVIP6vSTsOnuaRjvABIpedUTv8GtfLknum
         oHRT/y2drBf5b/EDjQld8UII+U8bZ1Kbn/SQkkAPoe4cwsg5wFLzJpvvDBeONpw1ohv9
         85Klm4DDg8PXU7dbUnp8pnDjroZ3PAPrhHCZY9+1N0/7tnJA7b4VtDlNkYd9c+OuztrL
         Acag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=4oQFd4eolp/sR05iPY07hrdPVedFpqTSb74q9tevE6Q=;
        b=nMzzWynKjzMuf+Dc7nzUF8RafJVgdoJ7+7VT7MfhrjHVAd1NLcbrtgBGNJtCMCrWpp
         vJyP+n8+Rshm+1bBMK8P9A6AlTgAYvmxaoCqqQ9UueC0h9Jd1hZU2oXadgpzIRBeTeG3
         MH/FTCt1XDZAXFHTXL0usEVhGDovbwnZX31+R61i7vxOPROwl/8K+WhnvwGmxJCmnJ5I
         bN1HboAslCJewD3W+dq+hJK30Pau1ROon308D3bv7EddT1zfr2dchOCOjaQ5sNNZT2L2
         2U0ELwytO1Lb//dVD3BwRwOE5BOlpcmaTgxDrN8eJcjbv0wWHD6KD8RLIutPyVSwfhdr
         pdeg==
X-Gm-Message-State: APjAAAWEL0lJbtKGjWnEsHF/7HmZf5er9YH37xAdbBMDR6IkD/GlF3wV
	N/9h8oGi6LaxBr0KKRE6VocBIRIy
X-Google-Smtp-Source: APXvYqxOzZpWyPNKSuBcQ16lQYpVyvhlX4GBRaXlcBtUC/QODCksPzzXlJgICUhsFOUPFUk30vFpbg==
X-Received: by 2002:a17:90a:d996:: with SMTP id d22mr99375160pjv.86.1564163498255;
        Fri, 26 Jul 2019 10:51:38 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-117-207.tukw.qwest.net. [97.126.117.207])
        by smtp.gmail.com with ESMTPSA id o24sm104287919pfp.135.2019.07.26.10.51.37
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 26 Jul 2019 10:51:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH 53/67] target/arm: Convert T16 adjust sp (immediate)
Date: Fri, 26 Jul 2019 10:50:18 -0700
Message-Id: <20190726175032.6769-54-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190726175032.6769-1-richard.henderson@linaro.org>
References: <20190726175032.6769-1-richard.henderson@linaro.org>
X-TUID: KHvWChxDopCR

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 15 ++-------------
 target/arm/t16.decode  |  9 +++++++++
 2 files changed, 11 insertions(+), 13 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 23f5f982f5..8dd88419fe 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10648,19 +10648,8 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
         /* misc */
         op = (insn >> 8) & 0xf;
         switch (op) {
-        case 0:
-            /*
-             * 0b1011_0000_xxxx_xxxx
-             *  - ADD (SP plus immediate)
-             *  - SUB (SP minus immediate)
-             */
-            tmp = load_reg(s, 13);
-            val = (insn & 0x7f) * 4;
-            if (insn & (1 << 7))
-                val = -(int32_t)val;
-            tcg_gen_addi_i32(tmp, tmp, val);
-            store_sp_checked(s, tmp);
-            break;
+        case 0: /* add/sub (sp, immediate), in decodetree */
+            goto illegal_op;
 
         case 2: /* sign/zero extend.  */
             ARCH(6);
diff --git a/target/arm/t16.decode b/target/arm/t16.decode
index 69d3894ba7..ddf12ada11 100644
--- a/target/arm/t16.decode
+++ b/target/arm/t16.decode
@@ -156,6 +156,15 @@ ADD_rrri        0100 0100 . .... ...            @addsub_2h s=0
 CMP_rrri        0100 0101 . .... ...            @addsub_2h s=1
 MOV_rrri        0100 0110 . .... ...            @addsub_2h s=0
 
+# Adjust SP (immediate)
+
+%imm7_0x4       0:7 !function=times_4
+@addsub_sp_i    .... .... . ....... \
+                &s_rri_rot s=0 rd=13 rn=13 rot=0 imm=%imm7_0x4
+
+ADD_rri         1011 0000 0 .......             @addsub_sp_i
+SUB_rri         1011 0000 1 .......             @addsub_sp_i
+
 # Branch and exchange
 
 @branchr        .... .... . rm:4 ...            &r
-- 
2.17.1

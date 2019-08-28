Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp1189894wrs;
        Wed, 28 Aug 2019 12:44:20 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyxiqyF6qhPORUggbEuYv02Vb0wDnjJJVjmMZWUXqBb/vuJ1d1+RnLjSYLg9krSNw+MAPQe
X-Received: by 2002:a37:4d16:: with SMTP id a22mr5908382qkb.482.1567021460045;
        Wed, 28 Aug 2019 12:44:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567021460; cv=none;
        d=google.com; s=arc-20160816;
        b=Rm/XBVCzm394TEzv/iW7N4t6kN8PqpNWe2ToryPSgOGJS2g6o1zSYyvC8rYcJ+akkm
         LPUnqAzsSy2DqB9TuI1NgY/s7Tpxf69qWw09ZpDzvPrG5C743Wh65j/htgpE91rvcIMD
         +7X9Y/8VlGSMUpZ+jZeDOpmjZsRx7kvfGq+8hZZZhocoLegMdPMT30Jck0xx7pFmyDu4
         LYqG2YdSLGHHBeCnfUghkiRwCboD5hWKOyEF2oqxDwj7g87FzEmFubSIPdRFu/EPjP9N
         OBgOaRiFgfaygI/x3SDYmWMGoH2jXMzHHEmKmyJpGsT6eKwLz4jzEWNzlw+u1w/hq5oM
         lBlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=x7zkDeuRWBqPgbu0Uw/jBwIGlLUUfHJ8yMWyeY3L4GI=;
        b=cWUWdvCqPY9/TtjOglq55/xfmzoVeJzpIuHFOThTy0qpapdC0XjzPW6Gy8fBu7Bz+V
         dd5avut1k0ViSZcGANPHPOAURiJJtFC+B7yl68LZipADLXcoakf+AkZA6Q6Z/CRQlt72
         Cck0IPSnhMqUipxxZmn0T6l1xUtnlu9r5Y54s5FaM77he3k87J2QW99UmEIteTULAemZ
         0aYex0TKSNgBhPIcUMpw/FWQLpNq8Yxb6MboawOVfZMMHkCTSpJAi28NmmECgGRBcxki
         /JlykfeMncWSEjLTGdPUwDHqEpUyRUrnUV3ps7HPOau5kwyD2KB0rLyqcTxIjZSBZxHY
         /DBg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=axcs5CpE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 29si223200qvv.33.2019.08.28.12.44.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Aug 2019 12:44:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=axcs5CpE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i33rf-0007SP-3F
	for alex.bennee@linaro.org; Wed, 28 Aug 2019 15:44:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38710)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i33Gp-0003wL-01
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:06:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i33Gm-0000ef-J0
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:06:14 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:38384)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i33Gl-0000bQ-QF
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:06:12 -0400
Received: by mail-pl1-x643.google.com with SMTP id w11so400818plp.5
 for <qemu-arm@nongnu.org>; Wed, 28 Aug 2019 12:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=x7zkDeuRWBqPgbu0Uw/jBwIGlLUUfHJ8yMWyeY3L4GI=;
 b=axcs5CpEI8yuoqlwGkqd94L5BMP4ASAOkiNXDU6hWnvu0S83Cg1jOCz6Muv7zNLMMj
 MfacYvCjljRRbZ4FM9E3NxO5haSKLTn5TleGwN1JEoaBt4t2Q0ZtWTuPNbtH03rv3A8X
 Fdf8VOsZ8ZxUmeX4SI3MTmHiXVy9FWXqO17a5nNO0diqdwoDBsdqC4b/W0+DO2PA8aGO
 3hh3daIdiTPXjj1Voen45MBovK7++mwyjyNfQ+lIz54FyWH4mP3aYcexiW1ypfpWOKGW
 5D/JHNgLCFwixKEbKRR2WTKgRTYDSIgpKs9+iCQ/QbgwO3hcakFSnOX9npr4UUGI6Pg7
 AngQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=x7zkDeuRWBqPgbu0Uw/jBwIGlLUUfHJ8yMWyeY3L4GI=;
 b=bspYT1FhVyC7HmszgHESshGw7E3wjClQ8XeJfTnkQPkKDCa900O8FI4qatZQ24RGkT
 jEAk8DgdGkAUePhWCbl/rUgs9H/5hZbYD0hZar3wPPFNMYiC+iRgLK/bQeK8GwITeRhC
 qydWcFhaDzeoTC/FKwjiGPYDuMG6fKLam4jbJ8MSAkawdmLDOrf4fTsDpHNVSGBM0DSc
 wzyVnEU0UatPA/iUYJ6HjqoPaF5bqRJ7V/LWyNk4mey9Me+SGqPcXYR8jySUeHnvgEox
 jGT6WpGA0uVqbmQxksISqemYjxUbFda0G3NNWty8iR8YsXfwFnXCt63+9yZmO8g7RGuT
 hgYw==
X-Gm-Message-State: APjAAAX09p/KH+OVPYpnwcD2114aoIJuUfywqe4my0Gvc+Gayc0ThOvv
 p6POnIog6nXlLFapvZfQZ5yObQ==
X-Received: by 2002:a17:902:e489:: with SMTP id
 cj9mr5926759plb.327.1567019168623; 
 Wed, 28 Aug 2019 12:06:08 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f27sm2967944pgm.60.2019.08.28.12.06.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 12:06:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 28 Aug 2019 12:04:41 -0700
Message-Id: <20190828190456.30315-55-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190828190456.30315-1-richard.henderson@linaro.org>
References: <20190828190456.30315-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::643
Subject: [Qemu-arm] [PATCH v3 54/69] target/arm: Convert T16 add, compare,
 move (two high registers)
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wKMBbk2LkddY

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 49 ++----------------------------------------
 target/arm/t16.decode  | 10 +++++++++
 2 files changed, 12 insertions(+), 47 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index cd39329e5c..cf19f1f777 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10722,55 +10722,10 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
             store_reg(s, rd, tmp);
             break;
         }
-        if (insn & (1 << 10)) {
-            /* 0b0100_01xx_xxxx_xxxx
-             * - data processing extended, branch and exchange
-             */
-            rd = (insn & 7) | ((insn >> 4) & 8);
-            rm = (insn >> 3) & 0xf;
-            op = (insn >> 8) & 3;
-            switch (op) {
-            case 0: /* add */
-                tmp = load_reg(s, rd);
-                tmp2 = load_reg(s, rm);
-                tcg_gen_add_i32(tmp, tmp, tmp2);
-                tcg_temp_free_i32(tmp2);
-                if (rd == 13) {
-                    /* ADD SP, SP, reg */
-                    store_sp_checked(s, tmp);
-                } else {
-                    store_reg(s, rd, tmp);
-                }
-                break;
-            case 1: /* cmp */
-                tmp = load_reg(s, rd);
-                tmp2 = load_reg(s, rm);
-                gen_sub_CC(tmp, tmp, tmp2);
-                tcg_temp_free_i32(tmp2);
-                tcg_temp_free_i32(tmp);
-                break;
-            case 2: /* mov/cpy */
-                tmp = load_reg(s, rm);
-                if (rd == 13) {
-                    /* MOV SP, reg */
-                    store_sp_checked(s, tmp);
-                } else {
-                    store_reg(s, rd, tmp);
-                }
-                break;
-            case 3:
-                /* 0b0100_0111_xxxx_xxxx
-                 * - branch [and link] exchange thumb register
-                 * In decodetree
-                 */
-                goto illegal_op;
-            }
-            break;
-        }
 
         /*
-         * 0b0100_00xx_xxxx_xxxx
-         *  - Data-processing (two low registers), in decodetree
+         * - Data-processing (two low registers), in decodetree
+         * - data processing extended, branch and exchange, in decodetree
          */
         goto illegal_op;
 
diff --git a/target/arm/t16.decode b/target/arm/t16.decode
index edddbfb9b8..5a570484e3 100644
--- a/target/arm/t16.decode
+++ b/target/arm/t16.decode
@@ -146,6 +146,16 @@ CMP_xri         00101 ... ........              @arith_1i s=1
 ADD_rri         00110 ... ........              @arith_1i %s
 SUB_rri         00111 ... ........              @arith_1i %s
 
+# Add, compare, move (two high registers)
+
+%reg_0_7        7:1 0:3
+@addsub_2h      .... .... . rm:4 ... \
+                &s_rrr_shi rd=%reg_0_7 rn=%reg_0_7 shim=0 shty=0
+
+ADD_rrri        0100 0100 . .... ...            @addsub_2h s=0
+CMP_xrri        0100 0101 . .... ...            @addsub_2h s=1
+MOV_rxri        0100 0110 . .... ...            @addsub_2h s=0
+
 # Branch and exchange
 
 @branchr        .... .... . rm:4 ...            &r
-- 
2.17.1


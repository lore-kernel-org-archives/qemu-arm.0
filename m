Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp1202170wrs;
        Wed, 28 Aug 2019 12:57:28 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxotkIyJP4FRkdPbfey5toF/RvfcMm66DuPjDMfvMU2BgVUW8EX6S6NJxejyY14VQNcY8Fq
X-Received: by 2002:a50:b165:: with SMTP id l34mr6002923edd.179.1567022248285;
        Wed, 28 Aug 2019 12:57:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567022248; cv=none;
        d=google.com; s=arc-20160816;
        b=RWUte/NIsbYysXi1kBwNc4zFxP7bWDpN4J8RgAOLewslwEqYghIwDGCd3TzWsUttir
         ByFaBekEMqyVcZ+7snnM56y7bk1NAsyrE26TCHipcN51tzsS21xpk4N2c9SKeRUidHL0
         +LgKTB7w6bKwuuEV/ucoQQbVhFZniJ3QsA2YLgpw5jrihsF7mj1+/1YRUcjl3FXP8njA
         Nn3KUdDawb5IJU1jhBOTF0O++A+Q+osFsgE25xa3iIRlxKGgEdOL3BrmlmMY+MWDJTFg
         hK+zxzEhoq6XXoxCZdSVq/8SG69y4YZU2rJoMhYRlXi5G0+q8SgUAFwbcXjWIJbzZoVO
         VRHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=W7Njx5fsc6fJoAUaqNSP00kDYpcwXysWT9wttSWRibc=;
        b=xxWGzxrUAA2Pu3q3dqpHEDbJOS90TnU6BTcAXM01/jb5HKoVB9cX9lDysHgH83ojcy
         37E9+aKEbSQnGNkf70Pcj6Opx9nqwykwySddDB73xMyzwOnVFIOKtmSjIU136m6weyJb
         TiW4bDg45958zQ9zPDoIn6c0CViLPVMdsgcn3DF2IuBwSsElnqwHOC1PX2dno9OZsK1I
         rSbwukTBKUMnqmUv7NBYfbQsXPmMm4wjzTkBd2E9WRvPKv6qJA5V/PBzTm0SGZu/L1az
         dYzYUU6PTixjnYW0NQddWWjgXIpVTDQSlgHwFJeqR/Gz+yFisRQx7Cn49k1xh3B7p/KY
         Pdmw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="i86swx/F";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v36si1927104edm.281.2019.08.28.12.57.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Aug 2019 12:57:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="i86swx/F";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i344M-0005fH-O1
	for alex.bennee@linaro.org; Wed, 28 Aug 2019 15:57:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38728)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i33Gp-0003wQ-An
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:06:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i33Go-0000g8-3C
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:06:15 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:40506)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i33Gm-0000Yj-Vb
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:06:13 -0400
Received: by mail-pl1-x642.google.com with SMTP id h3so393881pls.7
 for <qemu-arm@nongnu.org>; Wed, 28 Aug 2019 12:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=W7Njx5fsc6fJoAUaqNSP00kDYpcwXysWT9wttSWRibc=;
 b=i86swx/FRswyTONOGwgCLPvgXcsrnuxF+v5duHhig19ZSjEUOoSVB9V1wmd9Gzp+Z0
 JVGHiLBiKYm4oKHQIRmacAQBangR9QOC5w3zE2CyRuZ0nl0763Gy2tXPvLE7HqwSfDTe
 UwljaqJXyFbiBd0Ci1Py9DsmjZ76uLF1xxt/YeOv4nzC9j23copESWdXEy7gBjyGiX3U
 iOeyLovCFgjmTJ36aqbNTvwBgrqu3h+Py8PYypvCiFKgXj8T3KR6bTBl1zxvVWGexVDB
 qXRKhFLDcEh9NR9ZA1YuMbAWUwMt3UezksUzckd5QSR5qKPRNndhcr0XPw2C8eSd3zdF
 l3uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=W7Njx5fsc6fJoAUaqNSP00kDYpcwXysWT9wttSWRibc=;
 b=ugkWOCwrJGqNwdHpijIAinW5/DuLIXFKKSPD5jf2wVFffvYk+8Tqx+0lsmcelnX3ia
 uzpnea0QC6icq9FNQsmV5Fk9l2Cp7/q0Yamlk2vwsU/Y5lm3QNugFxm7zgMgwa1C9u+0
 eDMzC2c856icG0RWUyMQl5NKjaxAq3MMCpOdHvrXYk42enxE3Sx/U5t/bDg9RySc0C6H
 D84qEXsN2TaJJ/WLRk1OQh3/TtjPEF0o8SdTYixLvm/HwCyX0AGzzPvx9HvwVc+2xyES
 JNc8oxQr8JqNtDkBrtHtEMj5KRcCcSZ47AyfeKYxM+AXFf0il2gj02DpJaovtd6KPdGh
 ukpw==
X-Gm-Message-State: APjAAAXdHO56S7iplU6tehVbbloJSHqXzvxuCO8tjxwIG6AyrGo7jjkk
 Gvmlm2fpj7LcHpW5I5XysgL+eg==
X-Received: by 2002:a17:902:b18b:: with SMTP id
 s11mr6003928plr.1.1567019166144; 
 Wed, 28 Aug 2019 12:06:06 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f27sm2967944pgm.60.2019.08.28.12.06.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 12:06:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 28 Aug 2019 12:04:39 -0700
Message-Id: <20190828190456.30315-53-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190828190456.30315-1-richard.henderson@linaro.org>
References: <20190828190456.30315-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::642
Subject: [Qemu-arm] [PATCH v3 52/69] target/arm: Convert T16 one low
 register and immediate
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
X-TUID: /CUuGDJqu6mY

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 44 ++----------------------------------------
 target/arm/t16.decode  | 11 +++++++++++
 2 files changed, 13 insertions(+), 42 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index fa6892d6af..d4d7d99da8 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10682,48 +10682,8 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
             store_reg(s, rd, tmp);
         }
         break;
-    case 2: case 3:
-        /*
-         * 0b001x_xxxx_xxxx_xxxx
-         *  - Add, subtract, compare, move (one low register and immediate)
-         */
-        op = (insn >> 11) & 3;
-        rd = (insn >> 8) & 0x7;
-        if (op == 0) { /* mov */
-            tmp = tcg_temp_new_i32();
-            tcg_gen_movi_i32(tmp, insn & 0xff);
-            if (!s->condexec_mask)
-                gen_logic_CC(tmp);
-            store_reg(s, rd, tmp);
-        } else {
-            tmp = load_reg(s, rd);
-            tmp2 = tcg_temp_new_i32();
-            tcg_gen_movi_i32(tmp2, insn & 0xff);
-            switch (op) {
-            case 1: /* cmp */
-                gen_sub_CC(tmp, tmp, tmp2);
-                tcg_temp_free_i32(tmp);
-                tcg_temp_free_i32(tmp2);
-                break;
-            case 2: /* add */
-                if (s->condexec_mask)
-                    tcg_gen_add_i32(tmp, tmp, tmp2);
-                else
-                    gen_add_CC(tmp, tmp, tmp2);
-                tcg_temp_free_i32(tmp2);
-                store_reg(s, rd, tmp);
-                break;
-            case 3: /* sub */
-                if (s->condexec_mask)
-                    tcg_gen_sub_i32(tmp, tmp, tmp2);
-                else
-                    gen_sub_CC(tmp, tmp, tmp2);
-                tcg_temp_free_i32(tmp2);
-                store_reg(s, rd, tmp);
-                break;
-            }
-        }
-        break;
+    case 2: case 3: /* add, sub, cmp, mov (reg, imm), in decodetree */
+        goto illegal_op;
     case 4:
         if (insn & (1 << 11)) {
             rd = (insn >> 8) & 7;
diff --git a/target/arm/t16.decode b/target/arm/t16.decode
index 2b5f368d31..0654275e68 100644
--- a/target/arm/t16.decode
+++ b/target/arm/t16.decode
@@ -133,3 +133,14 @@ SUB_rrri        0001101 ... ... ...             @addsub_3
 
 ADD_rri         0001 110 ... ... ...            @addsub_2i
 SUB_rri         0001 111 ... ... ...            @addsub_2i
+
+# Add, subtract, compare, move (one low register and immediate)
+
+%reg_8          8:3
+@arith_1i       ..... rd:3 imm:8 \
+                &s_rri_rot rot=0 rn=%reg_8
+
+MOV_rxi         00100 ... ........              @arith_1i %s
+CMP_xri         00101 ... ........              @arith_1i s=1
+ADD_rri         00110 ... ........              @arith_1i %s
+SUB_rri         00111 ... ........              @arith_1i %s
-- 
2.17.1


Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp1208252wrs;
        Wed, 28 Aug 2019 13:03:15 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxnPlz4mHRdLSCVQLHd7syLzLyqean05N9VfnKp+SM2RZIUevl26jWtaKvITPSjfzG584jA
X-Received: by 2002:a17:906:b283:: with SMTP id q3mr4843691ejz.153.1567022595380;
        Wed, 28 Aug 2019 13:03:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567022595; cv=none;
        d=google.com; s=arc-20160816;
        b=PZ9OTYx1C9MQZfLm+b9MwL2rYKJCTeCZZcIMiBgsxz9A4kRxKVeG4xzkPvqe69k3uy
         yLzrebJc9pW/GF3Typ74L/rEPe6/nl5pefvAIEjKzYLI8y3AGDdpTm5/aNe7XKYoh8E1
         1UxXu6E5DH8SEzEqdhXrTHbRaeegWmGT9Zin/Myp0FXZvVKWeva75Rn1pJWoRr+qi04e
         LLr/EkUim8fQtly3469yK81EWkA6mDf1zi/NTS1CVgJC4hvQMCFD41E+VW95WSQ1BABC
         VRE61OSaDsRJy7IENT+1NGR08xgEex95q5tRL93pNJTBOYCwld0TlyaZ2SOZhqpnuZ+v
         KqJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=o8JoQg7nIgQDPaTkLH+nSqJkD4bKhobBAH7LTYEZxrk=;
        b=y10A/tkYZ2t5a6zqY+8Jli/01Hnt1uzM2duFpISQ8QdCX8ySvBE/bPYASzbXADKEKA
         X0H8urpB+ZaXqUKZwk1AJXE0HmR0zuZbtfMPk7Fz9giUcgr3l4qLINDhSCCqkcO7SZ1F
         PutBhPfuUiQx+NEeoOg91Wo/D+hIdlpcGkLSB3Dfg2WXsCuFUdIRJf6Rcs07Z8SDoK/q
         wHMMC7qeV2ZISXMqUxOTQrCW1pwLfkTwbXplIFQKUHcdYpboab8BBqf9wjYDmnthldYr
         MnJkkZ7PvTyPosjqLZc2yODnUeupk/9bSt/dCty16gAuwwNScGJgjyKE8qJ835oa1s8J
         CUZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NHC7+M6m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g28si2007299eda.105.2019.08.28.13.03.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Aug 2019 13:03:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NHC7+M6m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i349x-0002NQ-Tu
	for alex.bennee@linaro.org; Wed, 28 Aug 2019 16:03:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39033)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i33H3-00044t-7N
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:06:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i33H0-0000oS-CS
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:06:28 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:40626)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i33Gz-0000n6-OM
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:06:26 -0400
Received: by mail-pl1-x62f.google.com with SMTP id h3so394228pls.7
 for <qemu-arm@nongnu.org>; Wed, 28 Aug 2019 12:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=o8JoQg7nIgQDPaTkLH+nSqJkD4bKhobBAH7LTYEZxrk=;
 b=NHC7+M6myA6feaow8W9JrU4sOasU5/M9Ry6++rHR3Qf2joDZZAjOlrwyHxNHmGOMhw
 WNpO5yEpH3/12OCcdFHNKTuPZdcvxM9TP52jsj+YUTYWVI951jWAPwUt1QJVT6wkUQBu
 DedXtsqLqvuNGjvvHsZBZPpa6vCIIwIoyHO+41fJb8UmcN3qq/2ePJHPD8l6q7Jvgb/s
 ATXL1mpcdzfVBtaP+HkIECCUhAEcAq2odX87EaYmUmEnrmjOpyt1JVycVpuZ/kprGvE0
 Ksl75NvWiOr4btIGizZ2zvtPQkuw5zn4GK2mBN1K+8wCD44/PyWVy9FUfzbrFoRXx4WV
 c74Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=o8JoQg7nIgQDPaTkLH+nSqJkD4bKhobBAH7LTYEZxrk=;
 b=sOcD3PwAODseyx+8pMM6U2XFJj1YrQohSPiP0AbzZgW+He1xmnhy+Ya+ZUJ0ZYyNTD
 7gPJ9AZl3HJHvoNov/evxZ/i3rF71sueVta6NxYqPA8mk5Gt8Weh9OjPuuQG8xF3XHtN
 Yw7dYL+yFCmet75rShkPFjxcQQunz2gKZWbt4XHbnqsK7HB9I1VvB2MQnPth3THHqgRH
 uFHOOwdr6emmT47k+BVWYAbbDVpLojJ27dGJx24Ks79wPoty3vYHcEw7Q5/NuE3O1chb
 Bb1YyUYBm8uBz5DYzHGx4MLsi6vR8+ikLaPy+8sf8JPNWPC9K04tDUi+v0n/gK9kqVG1
 B9bQ==
X-Gm-Message-State: APjAAAUyL7YrD/tjVqurHMPL4ZYqwkluqwpD7ahr2vdkIeCVlPYYDnxW
 3q9kBojzsAlmmLvyO9uta96a0A==
X-Received: by 2002:a17:902:eb:: with SMTP id a98mr5544096pla.75.1567019184572; 
 Wed, 28 Aug 2019 12:06:24 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f27sm2967944pgm.60.2019.08.28.12.06.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 12:06:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 28 Aug 2019 12:04:54 -0700
Message-Id: <20190828190456.30315-68-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190828190456.30315-1-richard.henderson@linaro.org>
References: <20190828190456.30315-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::62f
Subject: [Qemu-arm] [PATCH v3 67/69] target/arm: Convert T16, long branches
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
X-TUID: pBcHFhOpCocb

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 85 ++++++++++++++++++------------------------
 target/arm/t16.decode  |  7 ++++
 2 files changed, 43 insertions(+), 49 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 574a791461..424a8354c1 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10114,6 +10114,40 @@ static bool trans_BLX_i(DisasContext *s, arg_BLX_i *a)
     return true;
 }
 
+static bool trans_BL_BLX_prefix(DisasContext *s, arg_BL_BLX_prefix *a)
+{
+    assert(!arm_dc_feature(s, ARM_FEATURE_THUMB2));
+    tcg_gen_movi_i32(cpu_R[14], read_pc(s) + (a->imm << 12));
+    return true;
+}
+
+static bool trans_BL_suffix(DisasContext *s, arg_BL_suffix *a)
+{
+    TCGv_i32 tmp = tcg_temp_new_i32();
+
+    assert(!arm_dc_feature(s, ARM_FEATURE_THUMB2));
+    tcg_gen_addi_i32(tmp, cpu_R[14], (a->imm << 1) | 1);
+    tcg_gen_movi_i32(cpu_R[14], s->base.pc_next | 1);
+    gen_bx(s, tmp);
+    return true;
+}
+
+static bool trans_BLX_suffix(DisasContext *s, arg_BLX_suffix *a)
+{
+    TCGv_i32 tmp;
+
+    assert(!arm_dc_feature(s, ARM_FEATURE_THUMB2));
+    if (!ENABLE_ARCH_5) {
+        return false;
+    }
+    tmp = tcg_temp_new_i32();
+    tcg_gen_addi_i32(tmp, cpu_R[14], a->imm << 1);
+    tcg_gen_andi_i32(tmp, tmp, 0xfffffffc);
+    tcg_gen_movi_i32(cpu_R[14], s->base.pc_next | 1);
+    gen_bx(s, tmp);
+    return true;
+}
+
 static bool op_tbranch(DisasContext *s, arg_tbranch *a, bool half)
 {
     TCGv_i32 addr, tmp;
@@ -10713,10 +10747,6 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
 
 static void disas_thumb_insn(DisasContext *s, uint32_t insn)
 {
-    int32_t offset;
-    TCGv_i32 tmp;
-    TCGv_i32 tmp2;
-
     if (disas_t16(s, insn)) {
         return;
     }
@@ -10735,53 +10765,10 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
     case 11: /* misc, in decodetree */
     case 12: /* load/store multiple, in decodetree */
     case 13: /* conditional branch or swi, in decodetree */
-        goto illegal_op;
-
     case 14:
-        if (insn & (1 << 11)) {
-            /* thumb_insn_is_16bit() ensures we can't get here for
-             * a Thumb2 CPU, so this must be a thumb1 split BL/BLX:
-             * 0b1110_1xxx_xxxx_xxxx : BLX suffix (or UNDEF)
-             */
-            assert(!arm_dc_feature(s, ARM_FEATURE_THUMB2));
-            ARCH(5);
-            offset = ((insn & 0x7ff) << 1);
-            tmp = load_reg(s, 14);
-            tcg_gen_addi_i32(tmp, tmp, offset);
-            tcg_gen_andi_i32(tmp, tmp, 0xfffffffc);
-
-            tmp2 = tcg_temp_new_i32();
-            tcg_gen_movi_i32(tmp2, s->base.pc_next | 1);
-            store_reg(s, 14, tmp2);
-            gen_bx(s, tmp);
-            break;
-        }
-        /* unconditional branch, in decodetree */
-        goto illegal_op;
-
     case 15:
-        /* thumb_insn_is_16bit() ensures we can't get here for
-         * a Thumb2 CPU, so this must be a thumb1 split BL/BLX.
-         */
-        assert(!arm_dc_feature(s, ARM_FEATURE_THUMB2));
-
-        if (insn & (1 << 11)) {
-            /* 0b1111_1xxx_xxxx_xxxx : BL suffix */
-            offset = ((insn & 0x7ff) << 1) | 1;
-            tmp = load_reg(s, 14);
-            tcg_gen_addi_i32(tmp, tmp, offset);
-
-            tmp2 = tcg_temp_new_i32();
-            tcg_gen_movi_i32(tmp2, s->base.pc_next | 1);
-            store_reg(s, 14, tmp2);
-            gen_bx(s, tmp);
-        } else {
-            /* 0b1111_0xxx_xxxx_xxxx : BL/BLX prefix */
-            uint32_t uoffset = ((int32_t)insn << 21) >> 9;
-
-            tcg_gen_movi_i32(cpu_R[14], read_pc(s) + uoffset);
-        }
-        break;
+        /* branches, in decodetree */
+        goto illegal_op;
     }
     return;
 illegal_op:
diff --git a/target/arm/t16.decode b/target/arm/t16.decode
index a4c89dba61..43b9a267a1 100644
--- a/target/arm/t16.decode
+++ b/target/arm/t16.decode
@@ -272,3 +272,10 @@ LDM_t16         1011 110 ......... \
 %imm11_0x2      0:s11 !function=times_2
 
 B               11100 ...........               &i imm=%imm11_0x2
+
+# thumb_insn_is_16bit() ensures we won't be decoding these as
+# T16 instructions for a Thumb2 CPU, so these patterns must be
+# a Thumb1 split BL/BLX.
+BLX_suffix      11101 imm:11                    &i
+BL_BLX_prefix   11110 imm:s11                   &i
+BL_suffix       11111 imm:11                    &i
-- 
2.17.1


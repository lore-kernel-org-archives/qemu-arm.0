Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1163260wrp;
        Wed, 4 Sep 2019 13:27:50 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwNCMmEbMMayl7DDvFmCdZIgzigMmePDUDcNmzHy4wNbj7mPSTtFFtlh8GOG79/OBHS6PqX
X-Received: by 2002:a17:906:5393:: with SMTP id g19mr12374594ejo.256.1567628870613;
        Wed, 04 Sep 2019 13:27:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567628870; cv=none;
        d=google.com; s=arc-20160816;
        b=k399wrEy8tcJXSp7VgyPQDAY6vdAmzFo3DWVwsA8BB+A49p9+3Bw8TaF0T6wY+8E0n
         4jNkqixYOIVxvYEw9DLFD0cF0TXGbaEQ3vsSyploSL5omoEG3MWSnLWgvSfpqORnAVSp
         14fhWRAPIV97AC+jJxM10jp5kBdzG/xAjVBoT1W6MoPCndEehdnyKopFPt+L3Y9N8pHA
         whEMU1wZuJV38vzZA4UdL9cpzu1VIP0SryipU1bkY2MziuXxHoDB71AEdD7vXbc69iq/
         xj51oh25vw6WE+Bvg/AW+mlKm+kYajkGVcYCZybVhE1KgYYumNeAJg2GxEZtNbWGrXEp
         6z7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=HzFCgBINrkpo6Knja84cWCi2ubxaaPHPuYIHOK9s5JA=;
        b=MANPNKUscuvuxqc3t7sizphaG+wYErLlDuYKcyi77643h4wM7NGmvCkXEI6sL+qjCZ
         Qz9vyP5YnFJm4y0O0QtqbF7v4cN0bAL6F1AnztpruFyhc+Tl2BOPBGqJQXS2+wEN4wKp
         ZSDiFcSgoyO5XHwhzeKTNGaLGk4A8s8KNF91hfBOQjV/rLeO1eRmZ6rtYMi7k/Ma+rtd
         AqH4Kf8eobAJXa8Qx2lzhpH5T3pya5wpX9ZZ976LQgjqFi3zrtzDVybKKWjn8BsiF6QQ
         k/VckMDFgJqQWMiKckZ7oOPGw+G3D6wIc782/6XnefmNoKWauVuSxUuN41+wHNC3V7p9
         w7Ew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hUyxOfky;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e24si74323eje.205.2019.09.04.13.27.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2019 13:27:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hUyxOfky;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i5bsb-0005Ip-2V
	for alex.bennee@linaro.org; Wed, 04 Sep 2019 16:27:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41528)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i5b17-0005eN-8U
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:32:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i5b14-0003O6-F8
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:32:33 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:40185)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i5b11-0003JY-AI
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:32:29 -0400
Received: by mail-pf1-x432.google.com with SMTP id x127so1224132pfb.7
 for <qemu-arm@nongnu.org>; Wed, 04 Sep 2019 12:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=HzFCgBINrkpo6Knja84cWCi2ubxaaPHPuYIHOK9s5JA=;
 b=hUyxOfkyN8Z62KoAleLdJhBgHVDl4tlq7e0FQnUh83gjLqB0DXtswvQliWDEXlb+b/
 6tYgCmMquW0xHO4S1/TK7OXi0/vf2uEZY6WGM5It6sBad2uQm2m7YF5mwFOFp9Vw4ta0
 mHue6gVV2k4I37B8w4SHawvZ27fednISIO43vOoKfJ7kEBIM8xfO8iy/0e88pbu3W+yC
 CCxrK8XH4+IMDkWYGX1Q+l1JG7T0nuA3cJP63Mkzro4XMeyUkYQKYq/eJmnVsLHd6lvc
 vXyiXSGyurO3+jWuT4Xxogjc9QDf9f4DLNWlebiE78/o/sxjgwZieroOFhiadxH31gzB
 E3Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=HzFCgBINrkpo6Knja84cWCi2ubxaaPHPuYIHOK9s5JA=;
 b=RbKZeS9IVMnWmrjJC4p+skKXhOeOfPTCD0Nn6v6OCyAUM4NXUJyfIX7fV7YCn7hHfb
 Z7dbI0VZefsqX+9ITXbikB/Y2r6HRRgFShvO4TRgeByneGG/bEp4VOl7cVJXoZZIy/p1
 1Mwo5X4+t2j5a1XF2fL9jTO0ktyXSSXaADhwz40cuo4w9zzR412OFLPc4musQ4pmxHDy
 8x+NgRKDy/Q+Kzk+duXXq2K32mEHneiT3ec1eqFLjcLvb/ssyU1wZM45TrHAoNeK/DOG
 v//eDP9NGUYjupUSPApL7cJTIPP/qlEvXKAdxdfm4HaWwxI3owlwiqc4mugYQuHLBnf+
 jeFg==
X-Gm-Message-State: APjAAAUxlaWkjgXB1Qq+w0s2Z+rjpbkQ9c2CZLPwwqoBGC9VQvPsvYDb
 lle05iwmJGL3N60k/23fEaSiFg==
X-Received: by 2002:a62:d143:: with SMTP id t3mr44324988pfl.213.1567625545880; 
 Wed, 04 Sep 2019 12:32:25 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f6sm18999174pga.50.2019.09.04.12.32.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 12:32:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  4 Sep 2019 12:30:57 -0700
Message-Id: <20190904193059.26202-68-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190904193059.26202-1-richard.henderson@linaro.org>
References: <20190904193059.26202-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::432
Subject: [Qemu-arm] [PATCH v4 67/69] target/arm: Convert T16, long branches
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
X-TUID: RbmhBtRyrN7s

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 85 ++++++++++++++++++------------------------
 target/arm/t16.decode  |  7 ++++
 2 files changed, 43 insertions(+), 49 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 3238ccbf1e..a99a5c2eef 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10147,6 +10147,40 @@ static bool trans_BLX_i(DisasContext *s, arg_BLX_i *a)
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
@@ -10736,10 +10770,6 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
 
 static void disas_thumb_insn(DisasContext *s, uint32_t insn)
 {
-    int32_t offset;
-    TCGv_i32 tmp;
-    TCGv_i32 tmp2;
-
     if (disas_t16(s, insn)) {
         return;
     }
@@ -10758,53 +10788,10 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
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


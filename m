Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1182657wrp;
        Wed, 4 Sep 2019 13:50:38 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz/le6pan8253ZoGqE7ScLvUghDo/7rfF6JInrtG+vFum0j5HDkWYMAVYkZJcKPm6VgnOfA
X-Received: by 2002:a37:4b42:: with SMTP id y63mr42355590qka.450.1567630238078;
        Wed, 04 Sep 2019 13:50:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567630238; cv=none;
        d=google.com; s=arc-20160816;
        b=EuTTjzs5Omvm8IB+A3RbDmPk5unSUdv2hpSndag6ICq3XG1IzAkOqwi+LQf6/Y65b5
         tBa+MLbNm9p70m2IZu9RNb0cCQLliTJaQkZvP2CfgW+KB78AD1Nm0na7Sbthwyg1Gz44
         xcSaGlyIEhRp43V65N++0wFq0dBw+OdTf8u1cz3YkYJhP/PWbkqP7HJNlhZbWxWJlCtQ
         7kBshPV2T6qRyzSQwmc3ckQ/dcJ3fBkYNC4y4ovVorNp+byOrd6makv8sDbQealpARyO
         imybhFG2XtBgOhtF7PEmmOOvVO18bx/6hVHKYhLMz6nR41jslhWEBYyLz5WIfmgN4T9d
         VyZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=VYZV/zdp2JerFG4ZPo6G3uzAjb1Br+I2f89wbKWVC8A=;
        b=b7AFYYKbZIkgGlgDW1Cy/YUT67veyXbV2+W9nRgWtgOoS52HMNikcZRZ2G7Yp85BZ4
         lfU4Ol1PHxzxNo2gPBep7eKBJKs0D3bROHixNa8HiLvy2B9KBZ4zKG85IH96q90aap7Q
         uHy97G1pdQsSjf9+Lz66Ye+I70NNuLfGreK1nnJ1OopfES8UhU/aRvpm3X0+UIVJWmYt
         LPeSUYKEvwfW8VLl9YHxHfxTEYKsTUCcGWymnPQvDYsIHLRj+sXN4xSkLdwGa+rnhYUT
         raKQ5KqB0m+JIUeCqweH2KVgTSLvQHAR5lHLi7sU+oNDuK/JhF8gccmG/UfFCzYzd2TH
         xciw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="V/9uNM7q";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f127si93392qkb.381.2019.09.04.13.50.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2019 13:50:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="V/9uNM7q";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i5cEe-0002rZ-Sp
	for alex.bennee@linaro.org; Wed, 04 Sep 2019 16:50:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41424)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i5b11-0005bQ-EE
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:32:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i5b0z-0003Ih-A4
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:32:27 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:45743)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i5b0y-0003HI-Re
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:32:25 -0400
Received: by mail-pf1-x441.google.com with SMTP id y72so6330521pfb.12
 for <qemu-arm@nongnu.org>; Wed, 04 Sep 2019 12:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=VYZV/zdp2JerFG4ZPo6G3uzAjb1Br+I2f89wbKWVC8A=;
 b=V/9uNM7qgsoR3NIi+cKH/0++FBpIoU7LmUYFtCBnsCivHLFAoFyZvz8Xi9t13wXIOo
 zk5QT+QED/Gi12rPWf8pk1t+RDrb4Z5jdKeTDrbCxjKHAB5APwkudCtjk/7mbsbL+9TS
 hovgJo/08r60d46E2eQA53GE9ILADG1Ua8GlfkSbPlIxfj94g1olSsXbejOJKcCoGm50
 nOydBviW8XZCkhZnQUIIQ8cBHP8fyOQhe79qGfj/8KNek5mZqJTFezL7A6Othtp7Ci/2
 QeJEe2WV383jfgWUQQKvCaKvxqHxmGimlLfM3g2FmLrkyOdH/YUT+m77bwufpDuotqBu
 8pYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=VYZV/zdp2JerFG4ZPo6G3uzAjb1Br+I2f89wbKWVC8A=;
 b=sqpuoZrVfxZrgfDvH6oAm2a1nGbBUqNBcNvkdHpfq1gOZzW2x+mP26D8TipyqzLFcs
 MqsusyJxvUkemws1nWmyOLTuXvCya9NlO3w+8XiLwmdTruxEEDtvMg7MTs0dMK9ApXEZ
 48Psdjn/Nu1Mcv1b0QisWpehno10PgLOh68bjoXFyE7PLOBzVAVOkGyhQs+KXkX1qbjP
 UFK+/i1UWm2dmCob5gfD9Oys2WouIbkM4Zy96KyJSxOdqUfCvrvLiQ54NgRE6tQNfUF8
 NBEWUhxexK9/Z8MddM+seZXO1jlqqnoslYGxbmYXGP1CWf0O+czu2q0YgL6yvMgvDX6H
 1Rtw==
X-Gm-Message-State: APjAAAVrTcZXQxlrTvQMBafxXhMX9k0Ns3y2GQB6XSfiHHaFKe9ZN+uU
 NnW7O/YVtXlZHeGq5g0hlBmcJg==
X-Received: by 2002:a62:e802:: with SMTP id c2mr12575057pfi.212.1567625543381; 
 Wed, 04 Sep 2019 12:32:23 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f6sm18999174pga.50.2019.09.04.12.32.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 12:32:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  4 Sep 2019 12:30:55 -0700
Message-Id: <20190904193059.26202-66-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190904193059.26202-1-richard.henderson@linaro.org>
References: <20190904193059.26202-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: [Qemu-arm] [PATCH v4 65/69] target/arm: Convert T16, load (literal)
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
X-TUID: dEHWuXvVBClY

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 42 ++----------------------------------------
 target/arm/t16.decode  |  4 ++++
 2 files changed, 6 insertions(+), 40 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index d409afd55f..4f4c77fc89 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -982,14 +982,6 @@ static inline void gen_aa32_ld##SUFF(DisasContext *s, TCGv_i32 val,      \
                                      TCGv_i32 a32, int index)            \
 {                                                                        \
     gen_aa32_ld_i32(s, val, a32, index, OPC | s->be_data);               \
-}                                                                        \
-static inline void gen_aa32_ld##SUFF##_iss(DisasContext *s,              \
-                                           TCGv_i32 val,                 \
-                                           TCGv_i32 a32, int index,      \
-                                           ISSInfo issinfo)              \
-{                                                                        \
-    gen_aa32_ld##SUFF(s, val, a32, index);                               \
-    disas_set_da_iss(s, OPC, issinfo);                                   \
 }
 
 #define DO_GEN_ST(SUFF, OPC)                                             \
@@ -997,14 +989,6 @@ static inline void gen_aa32_st##SUFF(DisasContext *s, TCGv_i32 val,      \
                                      TCGv_i32 a32, int index)            \
 {                                                                        \
     gen_aa32_st_i32(s, val, a32, index, OPC | s->be_data);               \
-}                                                                        \
-static inline void gen_aa32_st##SUFF##_iss(DisasContext *s,              \
-                                           TCGv_i32 val,                 \
-                                           TCGv_i32 a32, int index,      \
-                                           ISSInfo issinfo)              \
-{                                                                        \
-    gen_aa32_st##SUFF(s, val, a32, index);                               \
-    disas_set_da_iss(s, OPC, issinfo | ISSIsWrite);                      \
 }
 
 static inline void gen_aa32_frob64(DisasContext *s, TCGv_i64 val)
@@ -1053,9 +1037,7 @@ static inline void gen_aa32_st64(DisasContext *s, TCGv_i64 val,
     gen_aa32_st_i64(s, val, a32, index, MO_Q | s->be_data);
 }
 
-DO_GEN_LD(8s, MO_SB)
 DO_GEN_LD(8u, MO_UB)
-DO_GEN_LD(16s, MO_SW)
 DO_GEN_LD(16u, MO_UW)
 DO_GEN_LD(32u, MO_UL)
 DO_GEN_ST(8, MO_UB)
@@ -10754,11 +10736,10 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
 
 static void disas_thumb_insn(DisasContext *s, uint32_t insn)
 {
-    uint32_t val, rd;
+    uint32_t val;
     int32_t offset;
     TCGv_i32 tmp;
     TCGv_i32 tmp2;
-    TCGv_i32 addr;
 
     if (disas_t16(s, insn)) {
         return;
@@ -10768,26 +10749,7 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
     switch (insn >> 12) {
     case 0: case 1: /* add/sub (3reg, 2reg imm), shift imm; in decodetree */
     case 2: case 3: /* add, sub, cmp, mov (reg, imm), in decodetree */
-        goto illegal_op;
-    case 4:
-        if (insn & (1 << 11)) {
-            rd = (insn >> 8) & 7;
-            /* load pc-relative.  Bit 1 of PC is ignored.  */
-            addr = add_reg_for_lit(s, 15, (insn & 0xff) * 4);
-            tmp = tcg_temp_new_i32();
-            gen_aa32_ld32u_iss(s, tmp, addr, get_mem_index(s),
-                               rd | ISSIs16Bit);
-            tcg_temp_free_i32(addr);
-            store_reg(s, rd, tmp);
-            break;
-        }
-
-        /*
-         * - Data-processing (two low registers), in decodetree
-         * - data processing extended, branch and exchange, in decodetree
-         */
-        goto illegal_op;
-
+    case 4: /* ldr lit, data proc (2reg), data proc ext, bx; in decodetree */
     case 5: /* load/store register offset, in decodetree */
     case 6: /* load/store word immediate offset, in decodetree */
     case 7: /* load/store byte immediate offset, in decodetree */
diff --git a/target/arm/t16.decode b/target/arm/t16.decode
index 79a1d66d6c..0b4da411e0 100644
--- a/target/arm/t16.decode
+++ b/target/arm/t16.decode
@@ -113,6 +113,10 @@ LDRH_ri         10001 ..... ... ...             @ldst_ri_2
 STR_ri          10010 ... ........              @ldst_spec_i rn=13
 LDR_ri          10011 ... ........              @ldst_spec_i rn=13
 
+# Load (PC-relative)
+
+LDR_ri          01001 ... ........              @ldst_spec_i rn=15
+
 # Add PC/SP (immediate)
 
 ADR             10100 rd:3 ........             imm=%imm8_0x4
-- 
2.17.1


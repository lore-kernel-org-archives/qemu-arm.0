Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp3202596wrs;
        Mon, 19 Aug 2019 15:20:13 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy7DkJovBfKr4KlTrI5eybBSf2F9UThAEztehdoHDiOYUkGA2e641VKw3X25viKb+NmrD4i
X-Received: by 2002:ac8:317a:: with SMTP id h55mr22992147qtb.105.1566253213008;
        Mon, 19 Aug 2019 15:20:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566253213; cv=none;
        d=google.com; s=arc-20160816;
        b=YK77NlKq274YVmJBQ5Ee3LAF79EPPly1uTjqR21IofFryJKXXnHseDe/rlF1Ko/xRE
         IK4XDJ3faF8RMcT0OoHOlGkcoWjyh5t1EGSZh1CzJmN+t1vDBPytdEjtVDlqQp1hi/mI
         lXI2nG9XqJuZGz3nvrQnMczrc2rkwjRAHeUqyDZ7jbvYlf/gk+L0jivDdGZkV6auLSkf
         xwClnMM4Mu5eGVkmj3AIfEwOV05UQnZYbDzupG9/6eolnxg2JnPgE0IGGvP9WNo5FFyH
         +BGABoQ4qEfpFcdZuLTH793kd0ku0O871LbSI4Llrj1JJYLuT8MB39VWo6H3QEGkGLDb
         NCOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=GQyk/IPAzG6M9shM4zauPndvY+PKuQRptTNum9FjIF4=;
        b=Q4niMSF+cqjYGsUlnb2etuFm46aR9T1zK/GZePHu2RP25Js7pMCkkuFA+ORDSRvh06
         xeE5R45iVHz+kETvpCKtxNkqC4u/TZYGDDV07rE/xT1QTkK+5p7bpCKkhaE3ccIKXC8m
         U+yvyTZ5ZOKGAeWE8jdrIy8C1FpDvDGrpyv67ykkbBHVkI/lY69il40B6JM1I1mW3jNf
         aeWddDU8wJ4iJhGawaJkM1hP0ikENpePxHmOgqbKwncZtLjbbh+4AhqgSt7kziJaxn8k
         OhFddRPqNvacEWg/MVIT81lxC6DYdZu2iGMdR2zzCHTqOOaPrz8Xh84a8SWRlTvZjRfy
         ggpA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=U1Wa2Jjk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o8si10001368qvh.112.2019.08.19.15.20.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Aug 2019 15:20:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=U1Wa2Jjk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hzq0Z-0007WL-O4
	for alex.bennee@linaro.org; Mon, 19 Aug 2019 18:20:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60144)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1hzpN1-00033x-3x
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 17:39:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hzpMz-0006xk-NE
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 17:39:18 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:35398)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hzpMz-0006xK-Hs
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 17:39:17 -0400
Received: by mail-pg1-x541.google.com with SMTP id n4so1937259pgv.2
 for <qemu-devel@nongnu.org>; Mon, 19 Aug 2019 14:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=GQyk/IPAzG6M9shM4zauPndvY+PKuQRptTNum9FjIF4=;
 b=U1Wa2JjkTtEr8I1MOovLSN8jz9r2NAb/+fR4a83qgEvzMQuaFsju0+ydUzL0JrnKM6
 v+JknZURt457WLs4EfvWFAZKCBTTgtK0mGa8bP7Rp54ZKB7iQaqW3SHvJkSUZlxwF/r9
 FmsrQGeiPUgb/MFOwXYN/Sr/Gwb3XhNmiJVPiccAApx6KIP2mYhzZtEX5Y2TMZCAllP9
 f8IqslOlr/xJxRwzhQTe8GTxCjJiQseyMDE8fiDR7n8z5IIB4BudpxxgFHGkedYnpb4e
 Aki75HoVSeR9vmPZtpS0yb8kD4Yb4eoO6viR47pqnO+P/6fjeceudHgkWobJUlNDNT2H
 e9+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=GQyk/IPAzG6M9shM4zauPndvY+PKuQRptTNum9FjIF4=;
 b=ONtY4pXv2h6RXOB1dlqCclxxwPU1vTNhNUGjubbjZcX1joSTpfZgGzrK7jt+u0b/zT
 bbDYP5NXz9QVWz9T2TaKLwn4hxzI1uXxElqMF/mx1n61Zo8R3jijJOVdcrMy6g10Of8s
 4oBQNLkvU0cI7i+1Z5j/JFcjbGM8V/KRvSk0clZpBXsHTD8hQmIT9Zw89SVqAuDscIcX
 guC5XptOquJYcxewFk+vAbZYeP+zmumBLxLBezVgNgn8M7UsJakBJb6AkNJCczc1jxC8
 C+nVVj7PYwxgZdeVRFN0XPM3/83lkeCFx2bwnnrzipOiOhgjb2IugJ18pE83g3ck9oRr
 VKhg==
X-Gm-Message-State: APjAAAVKj+duo1qAXfcuI2qm3BIsynJa6FOG2SynerbNOZ63kQKneWsa
 TILdIz+s+MQ5masm/OJamT60MPwJZfE=
X-Received: by 2002:a63:30c6:: with SMTP id
 w189mr21114425pgw.398.1566250756266; 
 Mon, 19 Aug 2019 14:39:16 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id d2sm13446951pjs.21.2019.08.19.14.39.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 14:39:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 19 Aug 2019 14:37:51 -0700
Message-Id: <20190819213755.26175-65-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819213755.26175-1-richard.henderson@linaro.org>
References: <20190819213755.26175-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
Subject: [Qemu-devel] [PATCH v2 64/68] target/arm: Convert T16,
 load (literal)
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pRxMcMhzSkgE

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 42 ++----------------------------------------
 target/arm/t16.decode  |  4 ++++
 2 files changed, 6 insertions(+), 40 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index dc3c9049cd..1882057402 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -963,14 +963,6 @@ static inline void gen_aa32_ld##SUFF(DisasContext *s, TCGv_i32 val,      \
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
@@ -978,14 +970,6 @@ static inline void gen_aa32_st##SUFF(DisasContext *s, TCGv_i32 val,      \
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
@@ -1034,9 +1018,7 @@ static inline void gen_aa32_st64(DisasContext *s, TCGv_i64 val,
     gen_aa32_st_i64(s, val, a32, index, MO_Q | s->be_data);
 }
 
-DO_GEN_LD(8s, MO_SB)
 DO_GEN_LD(8u, MO_UB)
-DO_GEN_LD(16s, MO_SW)
 DO_GEN_LD(16u, MO_UW)
 DO_GEN_LD(32u, MO_UL)
 DO_GEN_ST(8, MO_UB)
@@ -10630,11 +10612,10 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
 
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
@@ -10644,26 +10625,7 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
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
index 1adad20804..f87e6fde50 100644
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


Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp206757wrv;
        Fri, 26 Jul 2019 10:50:42 -0700 (PDT)
X-Received: by 2002:a62:f20b:: with SMTP id m11mr23657386pfh.125.1564163442106;
        Fri, 26 Jul 2019 10:50:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564163442; cv=none;
        d=google.com; s=arc-20160816;
        b=fTc6dX5053n3bf7B3GYFCmOAOnQVQh5jdMG4QpJbdACcXBiyvrfqbsCApnEanMqel8
         BVQPCOIr1vFtnvdyJ1W+MFpz+rDz+3u+OHQF5i2IKJ+7rNCvL1IuOH4okO4biJXofkm9
         eDiw6B9tk1odbBqcLAiv11JuGqlAyYYZ/2Myiv9/RXndAt93TFb5Ja2d/NZ8fF+pc1QG
         PKX2v3vXoeNvvBC5MdW3xtpQKpNR+clDXUFuV9wQZRP7na6X8c1kWpWXrK3/vffg5KNM
         ZIPL0pCK7cRYcFjZuvhM/ifY+h4t5a5TKzSqxIq7DZm7oEKC/5AYTqsF08nph3q7Oq8M
         0H7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=6LNL9cQ9yWdMRQZwn41TfZpx+HeuRN2JtOhgGfdhQks=;
        b=KejrjGS3ZPuW5kz7A2pL7Af5twkHso4ktqzN1yzEYuuOplX4QiBvQ2FADgKZPQ+y50
         OvI+mbaKlRpS9InaKKfG4V3whO05Fkwy1utRLdDa+gwpN+280hbsm4YJnOxYcjc+J85H
         G8kN4ISmdk+A39NR5WqdNNjQo1UDaUuLmQJZzk5GJ4NycI/qzqYv6yAvNVi3sxibpNCf
         TXeHEZCNISmi8Fd4L8LMoFE4WpeVc3D/w1M5pwk1h+4x4lU1/Jli6V9njVLm0Fjkz75U
         VHmo+nV2Zr4luDWmqei4HfH+AC2mCh9N07akKBAAyx1bsPOuFCckUQo5Q5iSpqysjbRu
         UGEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AEPIVRJL;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id d1sor64842395pju.23.2019.07.26.10.50.41
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 26 Jul 2019 10:50:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AEPIVRJL;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=6LNL9cQ9yWdMRQZwn41TfZpx+HeuRN2JtOhgGfdhQks=;
        b=AEPIVRJLeTkmpkjpMSvPSsr7TtKp5T8GAvionYrUfv63wLNamHKVC0JHNww/VFwegK
         2iz+YmbJ1Xhk5BHFySQCkFZoNeWTwvAevyfV2FmjiKi7xh/jnWrMpdTh1CMezdw9Lf8c
         C8R++Kwe3wfsdrjB8p2hGze3Kac2MS7ytX+sM9446ZmAObLxSg4pclC19AIm1cTTCHm9
         z7JpWshbvctFgUrhJuz55H8kaCAgC0YHwlolii2pXJlT4udtrYrU9QTbaSHghBAib7J9
         PvMT/0mGE2p0JmIll4Ge2riBl3XXvJDMLtfTugWD6cfid7uDJ9b0ydrudecJbo6pcUjl
         bOdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=6LNL9cQ9yWdMRQZwn41TfZpx+HeuRN2JtOhgGfdhQks=;
        b=H/4iIoOVa3s+FG0d8iJdelWY7QGo1QK0hI+ZsqIexx/Wkp5muO17pnXn6Hd9UsCEG2
         R00tZrwGjkXKLMS0QON5/qcXV/1Ttx4xWb3A5SUR/3fxBcZsnGXtjbLtYp9VTSal24L5
         qBcK12tambD8iWIi4xxk6qPeKt1fjo+M8hxB5qYXBsnkDm2YLpzkkVO1DlUytlrM4fns
         nimt/M1y7UqwIV5mNJvtHno7vNvvSw2KRYbqYmw3gXf3YWU53BBfueibauzO9fgnjXPc
         sQrI0I01nl4MH68wSAEPN5WZwxnZcoNn2xt7zL/TYJJQObwFAWE7jOvh4qZqVUZY9vu6
         ZUcg==
X-Gm-Message-State: APjAAAWdvvklJSmMbkovEZLiF1lTskgSjBvQI+6DcaP2jK8+Di1aftY5
	vqilThau+x40twDE/CjojYtdPDhX
X-Google-Smtp-Source: APXvYqyqlbEWF5aa08O0nDsVGe9gu2xvA9ZlwkZnxhsEXLn0bD4W1B0MfYCnvItUNGztuL1ohm19Bg==
X-Received: by 2002:a17:90a:4803:: with SMTP id a3mr101406097pjh.58.1564163441598;
        Fri, 26 Jul 2019 10:50:41 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-117-207.tukw.qwest.net. [97.126.117.207])
        by smtp.gmail.com with ESMTPSA id o24sm104287919pfp.135.2019.07.26.10.50.40
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 26 Jul 2019 10:50:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH 06/67] target/arm: Introduce pc_read
Date: Fri, 26 Jul 2019 10:49:31 -0700
Message-Id: <20190726175032.6769-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190726175032.6769-1-richard.henderson@linaro.org>
References: <20190726175032.6769-1-richard.henderson@linaro.org>
X-TUID: hD2lGiD93Oo+

We currently have 3 different ways of computing the architectural
value of "PC" as seen in the ARM ARM.

The value of s->pc has been incremented past the current insn,
but that is all.  Thus for a32, PC = s->pc + 4; for t32, PC = s->pc;
for t16, PC = s->pc + 2.  These differing computations make it
impossible at present to unify the various code paths.

Let s->pc_read hold the architectural value of PC for all cases.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.h | 10 ++++++++
 target/arm/translate.c | 53 ++++++++++++++++++------------------------
 2 files changed, 32 insertions(+), 31 deletions(-)

diff --git a/target/arm/translate.h b/target/arm/translate.h
index a20f6e2056..2dfdd8ca66 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -9,7 +9,17 @@ typedef struct DisasContext {
     DisasContextBase base;
     const ARMISARegisters *isar;
 
+    /*
+     * Summary of the various values for "PC":
+     * base.pc_next -- the start of the current insn
+     * pc           -- the start of the next insn
+     * pc_read      -- the value for "PC" in the ARM ARM;
+     *                 in arm mode, the current insn + 8;
+     *                 in thumb mode, the current insn + 4;
+     *                 in aa64 mode, unused.
+     */
     target_ulong pc;
+    target_ulong pc_read;
     target_ulong page_start;
     uint32_t insn;
     /* Nonzero if this instruction has been conditionally skipped.  */
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 595385e1b1..a48e9a90f8 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -200,13 +200,7 @@ static inline void store_cpu_offset(TCGv_i32 var, int offset)
 static void load_reg_var(DisasContext *s, TCGv_i32 var, int reg)
 {
     if (reg == 15) {
-        uint32_t addr;
-        /* normally, since we updated PC, we need only to add one insn */
-        if (s->thumb)
-            addr = (long)s->pc + 2;
-        else
-            addr = (long)s->pc + 4;
-        tcg_gen_movi_i32(var, addr);
+        tcg_gen_movi_i32(var, s->pc_read);
     } else {
         tcg_gen_mov_i32(var, cpu_R[reg]);
     }
@@ -7868,16 +7862,14 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
             /* branch link and change to thumb (blx <offset>) */
             int32_t offset;
 
-            val = (uint32_t)s->pc;
             tmp = tcg_temp_new_i32();
-            tcg_gen_movi_i32(tmp, val);
+            tcg_gen_movi_i32(tmp, s->pc);
             store_reg(s, 14, tmp);
             /* Sign-extend the 24-bit offset */
             offset = (((int32_t)insn) << 8) >> 8;
+            val = s->pc_read;
             /* offset * 4 + bit24 * 2 + (thumb bit) */
             val += (offset << 2) | ((insn >> 23) & 2) | 1;
-            /* pipeline offset */
-            val += 4;
             /* protected by ARCH(5); above, near the start of uncond block */
             gen_bx_im(s, val);
             return;
@@ -9154,9 +9146,8 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
                             /* store */
                             if (i == 15) {
                                 /* special case: r15 = PC + 8 */
-                                val = (long)s->pc + 4;
                                 tmp = tcg_temp_new_i32();
-                                tcg_gen_movi_i32(tmp, val);
+                                tcg_gen_movi_i32(tmp, s->pc_read);
                             } else if (user) {
                                 tmp = tcg_temp_new_i32();
                                 tmp2 = tcg_const_i32(i);
@@ -9222,14 +9213,13 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
                 int32_t offset;
 
                 /* branch (and link) */
-                val = (int32_t)s->pc;
                 if (insn & (1 << 24)) {
                     tmp = tcg_temp_new_i32();
-                    tcg_gen_movi_i32(tmp, val);
+                    tcg_gen_movi_i32(tmp, s->pc);
                     store_reg(s, 14, tmp);
                 }
                 offset = sextract32(insn << 2, 0, 26);
-                val += offset + 4;
+                val = s->pc_read + offset;
                 gen_jmp(s, val);
             }
             break;
@@ -9484,7 +9474,7 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
                         goto illegal_op;
                     }
                     addr = tcg_temp_new_i32();
-                    tcg_gen_movi_i32(addr, s->pc & ~3);
+                    tcg_gen_movi_i32(addr, s->pc_read & ~3);
                 } else {
                     addr = load_reg(s, rn);
                 }
@@ -9590,7 +9580,7 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
                 /* Table Branch.  */
                 if (rn == 15) {
                     addr = tcg_temp_new_i32();
-                    tcg_gen_movi_i32(addr, s->pc);
+                    tcg_gen_movi_i32(addr, s->pc_read);
                 } else {
                     addr = load_reg(s, rn);
                 }
@@ -9609,7 +9599,7 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
                 }
                 tcg_temp_free_i32(addr);
                 tcg_gen_shli_i32(tmp, tmp, 1);
-                tcg_gen_addi_i32(tmp, tmp, s->pc);
+                tcg_gen_addi_i32(tmp, tmp, s->pc_read);
                 store_reg(s, 15, tmp);
             } else {
                 bool is_lasr = false;
@@ -10342,7 +10332,7 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
                     tcg_gen_movi_i32(cpu_R[14], s->pc | 1);
                 }
 
-                offset += s->pc;
+                offset += s->pc_read;
                 if (insn & (1 << 12)) {
                     /* b/bl */
                     gen_jmp(s, offset);
@@ -10583,7 +10573,7 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
                 offset |= (insn & (1 << 11)) << 8;
 
                 /* jump to the offset */
-                gen_jmp(s, s->pc + offset);
+                gen_jmp(s, s->pc_read + offset);
             }
         } else {
             /*
@@ -10694,7 +10684,7 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
                     } else {
                         /* Add/sub 12-bit immediate.  */
                         if (rn == 15) {
-                            offset = s->pc & ~(uint32_t)3;
+                            offset = s->pc_read & ~(uint32_t)3;
                             if (insn & (1 << 23))
                                 offset -= imm;
                             else
@@ -10830,8 +10820,7 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
         if (rn == 15) {
             addr = tcg_temp_new_i32();
             /* PC relative.  */
-            /* s->pc has already been incremented by 4.  */
-            imm = s->pc & 0xfffffffc;
+            imm = s->pc_read & 0xfffffffc;
             if (insn & (1 << 23))
                 imm += insn & 0xfff;
             else
@@ -11077,7 +11066,7 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
         if (insn & (1 << 11)) {
             rd = (insn >> 8) & 7;
             /* load pc-relative.  Bit 1 of PC is ignored.  */
-            val = s->pc + 2 + ((insn & 0xff) * 4);
+            val = s->pc_read + ((insn & 0xff) * 4);
             val &= ~(uint32_t)2;
             addr = tcg_temp_new_i32();
             tcg_gen_movi_i32(addr, val);
@@ -11464,7 +11453,7 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
         } else {
             /* PC. bit 1 is ignored.  */
             tmp = tcg_temp_new_i32();
-            tcg_gen_movi_i32(tmp, (s->pc + 2) & ~(uint32_t)2);
+            tcg_gen_movi_i32(tmp, s->pc_read & ~(uint32_t)2);
         }
         val = (insn & 0xff) * 4;
         tcg_gen_addi_i32(tmp, tmp, val);
@@ -11584,7 +11573,7 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
                 tcg_gen_brcondi_i32(TCG_COND_NE, tmp, 0, s->condlabel);
             tcg_temp_free_i32(tmp);
             offset = ((insn & 0xf8) >> 2) | (insn & 0x200) >> 3;
-            val = (uint32_t)s->pc + 2;
+            val = s->pc_read;
             val += offset;
             gen_jmp(s, val);
             break;
@@ -11750,7 +11739,7 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
         arm_skip_unless(s, cond);
 
         /* jump to the offset */
-        val = (uint32_t)s->pc + 2;
+        val = s->pc_read;
         offset = ((int32_t)insn << 24) >> 24;
         val += offset << 1;
         gen_jmp(s, val);
@@ -11776,9 +11765,9 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
             break;
         }
         /* unconditional branch */
-        val = (uint32_t)s->pc;
+        val = s->pc_read;
         offset = ((int32_t)insn << 21) >> 21;
-        val += (offset << 1) + 2;
+        val += offset << 1;
         gen_jmp(s, val);
         break;
 
@@ -11802,7 +11791,7 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
             /* 0b1111_0xxx_xxxx_xxxx : BL/BLX prefix */
             uint32_t uoffset = ((int32_t)insn << 21) >> 9;
 
-            tcg_gen_movi_i32(cpu_R[14], s->pc + 2 + uoffset);
+            tcg_gen_movi_i32(cpu_R[14], s->pc_read + uoffset);
         }
         break;
     }
@@ -12055,6 +12044,7 @@ static void arm_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
 
     insn = arm_ldl_code(env, dc->pc, dc->sctlr_b);
     dc->insn = insn;
+    dc->pc_read = dc->pc + 8;
     dc->pc += 4;
     disas_arm_insn(dc, insn);
 
@@ -12123,6 +12113,7 @@ static void thumb_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
 
     insn = arm_lduw_code(env, dc->pc, dc->sctlr_b);
     is_16bit = thumb_insn_is_16bit(dc, insn);
+    dc->pc_read = dc->pc + 4;
     dc->pc += 2;
     if (!is_16bit) {
         uint32_t insn2 = arm_lduw_code(env, dc->pc, dc->sctlr_b);
-- 
2.17.1

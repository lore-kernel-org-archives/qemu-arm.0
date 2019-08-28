Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp1204410wrs;
        Wed, 28 Aug 2019 13:00:00 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzidNQYyWXcRZvQbIhAYLjFpsfBzl+yxDCSnWNtJAZk3ai/F5KLrKESUDd8lsF+fRDtMKxr
X-Received: by 2002:a17:906:3546:: with SMTP id s6mr4752446eja.197.1567022400790;
        Wed, 28 Aug 2019 13:00:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567022400; cv=none;
        d=google.com; s=arc-20160816;
        b=x+txOUeV5Z3h3pPhFmVd+0UFQNDisJzwbp6JYqs9A0nnSb73v9GYGWWzfvY7IaHIMy
         pEPoeMMa78gMAzKuLnyJyY5Tzu7ip8qHj/szv0TPNyT7sNLZF+jBzLq7JqR6M69TbjCx
         psuEL2gaGiccz45BQBAr6IALIL+fbmH+w0frMbdohTnTiOur8xI9xnwvyDi6/ysX/i2N
         G9KpmqoMyQMallFzOyWNV9+WVboUiIWydWXcjXzM9UH+IKw/JqHfsJa6V/sU7klrRi4M
         van2KjZfgyJAaoAoR/Xll2YvIyeIxkDeSVBLlJoCR/mgmqBfLXWm4zuJftYyW1NpB86v
         3D2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=t8j2uFjRrAOGYvd6SrvO/WjrxGa54I8yRPsCcXnl5DA=;
        b=UYS/PAmbgRqOeVzKkCvNKfel4AvKrwGqtIEV7uuuoGEVVrq5PWFz2e0gVAQGWTqvy+
         MhP4Yoni8zcMMu0a0fYiS/NHnhgikaIOrHUhZ5cIT3PYWJVtaAI8wifW9IwAsTFaW8UE
         X2voc7j+FZsdP5q7DIFUgoaAF+Tx98TNI/o6hptnVzxRmN+EqzBnPHWAjq4+E2jCrv0W
         vEacRIYzTgq+pOuTEC331eee4JIlieq8zMxRDp9vzNq73bb3QxexWdv5tSTf5wf6KTqY
         +Fu6XoeiPO225nzgmt3bPSyRFAy3ZpoLvLc0jpu+SWrQ1Ya1skL5R04mGaFCkCQ7+zGK
         Xn6A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QudNO0mv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k18si17832ejo.145.2019.08.28.13.00.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Aug 2019 13:00:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QudNO0mv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i346p-0008VN-5V
	for alex.bennee@linaro.org; Wed, 28 Aug 2019 15:59:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38501)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i33Gd-0003rU-T3
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:06:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i33Ga-0000Ux-1P
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:06:02 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:45361)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i33GZ-0000UP-Oi
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:05:59 -0400
Received: by mail-pl1-x642.google.com with SMTP id y8so379671plr.12
 for <qemu-arm@nongnu.org>; Wed, 28 Aug 2019 12:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=t8j2uFjRrAOGYvd6SrvO/WjrxGa54I8yRPsCcXnl5DA=;
 b=QudNO0mvTHe2PPngOWNMXRhR0gmyjjz62Hr2e6kKN3SFMahpK2bAoM8s2p1IfouNsL
 UzxvXZW+pVB+rqOgEiUvjBvHiN7wds47BQhnlRKwayJWFIzOjuaepYrR8Ppvw2kZrbAU
 YN+bZ5RP3EEW2JkHMBtbQrPUpCYcOZ5sryUU6HgevkPzlmfKuMMmGl0cm9Gnq+Md1WT8
 ES/MpTHovlyQqzPFdALEd5JZc1rBcX6C4P9pzjlWCF465rAb+9fhBzhly1k3TGToqTPC
 1CVmV0omWTyUy1EN/JZRY2xyqHZts/YMQb1iESh7N6duUCS1E9GmrMxg+VccPZd6H5Db
 0mGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=t8j2uFjRrAOGYvd6SrvO/WjrxGa54I8yRPsCcXnl5DA=;
 b=uHOzwgQT4tx6TSQZT+eiS5MyBo0OokmgJ+jA5vyR+IL/V9zIgXX7gjqXplU+w+zwW2
 NFYx8bacjd/QCIFjdxVjrgnRE9y1tv3a8gZHuaUIECErnxG4ubJUU2loT5LmGHTu1SIm
 a67iQhWqPYU6sbTLy16oMM+qqTfvYxVNDVIE5S29kXGojLO+kOp/WKT4QxESDSMlQbif
 KByrLL+kqaCe9SrEBfmL7aSkIy56DI9qAgYwSrC1s+Qukthw/LphLEa+LpflTTG3t3p/
 rwpJEm5HveKJJf/Amp3lag5fgwXfTqyJmSrD0eHoQFXT2rTi0FH+7RCp/C7x4npfH2Aq
 lQmA==
X-Gm-Message-State: APjAAAVE2X6/gXsR6S2lPkm4Sjcps/TqjPbWzlT6EQ/8gf2lSg8G3w+X
 Qy78tD1cn1knRnwqPlhdmNGK8r3kHFw=
X-Received: by 2002:a17:902:7592:: with SMTP id
 j18mr5785837pll.186.1567019158562; 
 Wed, 28 Aug 2019 12:05:58 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f27sm2967944pgm.60.2019.08.28.12.05.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 12:05:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 28 Aug 2019 12:04:33 -0700
Message-Id: <20190828190456.30315-47-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190828190456.30315-1-richard.henderson@linaro.org>
References: <20190828190456.30315-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::642
Subject: [Qemu-arm] [PATCH v3 46/69] target/arm: Convert T16 data-processing
 (two low regs)
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
X-TUID: uu7JXSS7KLy5

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 152 ++---------------------------------------
 target/arm/t16.decode  |  36 ++++++++++
 2 files changed, 43 insertions(+), 145 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 106ef08ada..6e841c346f 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -445,13 +445,6 @@ static inline void gen_logic_CC(TCGv_i32 var)
     tcg_gen_mov_i32(cpu_ZF, var);
 }
 
-/* T0 += T1 + CF.  */
-static void gen_adc(TCGv_i32 t0, TCGv_i32 t1)
-{
-    tcg_gen_add_i32(t0, t0, t1);
-    tcg_gen_add_i32(t0, t0, cpu_CF);
-}
-
 /* dest = T0 + T1 + CF. */
 static void gen_add_carry(TCGv_i32 dest, TCGv_i32 t0, TCGv_i32 t1)
 {
@@ -7527,6 +7520,11 @@ static int t32_branch24(DisasContext *s, int x)
     return x << 1;
 }
 
+static int t16_setflags(DisasContext *s)
+{
+    return s->condexec_mask == 0;
+}
+
 /*
  * Include the generated decoders.
  */
@@ -10838,145 +10836,9 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
 
         /*
          * 0b0100_00xx_xxxx_xxxx
-         *  - Data-processing (two low registers)
+         *  - Data-processing (two low registers), in decodetree
          */
-        rd = insn & 7;
-        rm = (insn >> 3) & 7;
-        op = (insn >> 6) & 0xf;
-        if (op == 2 || op == 3 || op == 4 || op == 7) {
-            /* the shift/rotate ops want the operands backwards */
-            val = rm;
-            rm = rd;
-            rd = val;
-            val = 1;
-        } else {
-            val = 0;
-        }
-
-        if (op == 9) { /* neg */
-            tmp = tcg_temp_new_i32();
-            tcg_gen_movi_i32(tmp, 0);
-        } else if (op != 0xf) { /* mvn doesn't read its first operand */
-            tmp = load_reg(s, rd);
-        } else {
-            tmp = NULL;
-        }
-
-        tmp2 = load_reg(s, rm);
-        switch (op) {
-        case 0x0: /* and */
-            tcg_gen_and_i32(tmp, tmp, tmp2);
-            if (!s->condexec_mask)
-                gen_logic_CC(tmp);
-            break;
-        case 0x1: /* eor */
-            tcg_gen_xor_i32(tmp, tmp, tmp2);
-            if (!s->condexec_mask)
-                gen_logic_CC(tmp);
-            break;
-        case 0x2: /* lsl */
-            if (s->condexec_mask) {
-                gen_shl(tmp2, tmp2, tmp);
-            } else {
-                gen_helper_shl_cc(tmp2, cpu_env, tmp2, tmp);
-                gen_logic_CC(tmp2);
-            }
-            break;
-        case 0x3: /* lsr */
-            if (s->condexec_mask) {
-                gen_shr(tmp2, tmp2, tmp);
-            } else {
-                gen_helper_shr_cc(tmp2, cpu_env, tmp2, tmp);
-                gen_logic_CC(tmp2);
-            }
-            break;
-        case 0x4: /* asr */
-            if (s->condexec_mask) {
-                gen_sar(tmp2, tmp2, tmp);
-            } else {
-                gen_helper_sar_cc(tmp2, cpu_env, tmp2, tmp);
-                gen_logic_CC(tmp2);
-            }
-            break;
-        case 0x5: /* adc */
-            if (s->condexec_mask) {
-                gen_adc(tmp, tmp2);
-            } else {
-                gen_adc_CC(tmp, tmp, tmp2);
-            }
-            break;
-        case 0x6: /* sbc */
-            if (s->condexec_mask) {
-                gen_sub_carry(tmp, tmp, tmp2);
-            } else {
-                gen_sbc_CC(tmp, tmp, tmp2);
-            }
-            break;
-        case 0x7: /* ror */
-            if (s->condexec_mask) {
-                tcg_gen_andi_i32(tmp, tmp, 0x1f);
-                tcg_gen_rotr_i32(tmp2, tmp2, tmp);
-            } else {
-                gen_helper_ror_cc(tmp2, cpu_env, tmp2, tmp);
-                gen_logic_CC(tmp2);
-            }
-            break;
-        case 0x8: /* tst */
-            tcg_gen_and_i32(tmp, tmp, tmp2);
-            gen_logic_CC(tmp);
-            rd = 16;
-            break;
-        case 0x9: /* neg */
-            if (s->condexec_mask)
-                tcg_gen_neg_i32(tmp, tmp2);
-            else
-                gen_sub_CC(tmp, tmp, tmp2);
-            break;
-        case 0xa: /* cmp */
-            gen_sub_CC(tmp, tmp, tmp2);
-            rd = 16;
-            break;
-        case 0xb: /* cmn */
-            gen_add_CC(tmp, tmp, tmp2);
-            rd = 16;
-            break;
-        case 0xc: /* orr */
-            tcg_gen_or_i32(tmp, tmp, tmp2);
-            if (!s->condexec_mask)
-                gen_logic_CC(tmp);
-            break;
-        case 0xd: /* mul */
-            tcg_gen_mul_i32(tmp, tmp, tmp2);
-            if (!s->condexec_mask)
-                gen_logic_CC(tmp);
-            break;
-        case 0xe: /* bic */
-            tcg_gen_andc_i32(tmp, tmp, tmp2);
-            if (!s->condexec_mask)
-                gen_logic_CC(tmp);
-            break;
-        case 0xf: /* mvn */
-            tcg_gen_not_i32(tmp2, tmp2);
-            if (!s->condexec_mask)
-                gen_logic_CC(tmp2);
-            val = 1;
-            rm = rd;
-            break;
-        }
-        if (rd != 16) {
-            if (val) {
-                store_reg(s, rm, tmp2);
-                if (op != 0xf)
-                    tcg_temp_free_i32(tmp);
-            } else {
-                store_reg(s, rd, tmp);
-                tcg_temp_free_i32(tmp2);
-            }
-        } else {
-            tcg_temp_free_i32(tmp);
-            tcg_temp_free_i32(tmp2);
-        }
-        break;
+        goto illegal_op;
 
     case 5:
         /* load/store register offset.  */
diff --git a/target/arm/t16.decode b/target/arm/t16.decode
index e954f61fe4..44e7250c55 100644
--- a/target/arm/t16.decode
+++ b/target/arm/t16.decode
@@ -18,3 +18,39 @@
 #
 # This file is processed by scripts/decodetree.py
 #
+
+&s_rrr_shi       !extern s rd rn rm shim shty
+&s_rrr_shr       !extern s rn rd rm rs shty
+&s_rri_rot       !extern s rn rd imm rot
+&s_rrrr          !extern s rd rn rm ra
+
+# Set S if the instruction is outside of an IT block.
+%s               !function=t16_setflags
+
+# Data-processing (two low registers)
+
+%reg_0           0:3
+
+@lll_noshr       ...... .... rm:3 rd:3 \
+                 &s_rrr_shi %s rn=%reg_0 shim=0 shty=0
+@xll_noshr       ...... .... rm:3 rn:3 \
+                 &s_rrr_shi s=1 rd=0 shim=0 shty=0
+@lxl_shr         ...... .... rs:3 rd:3 \
+                 &s_rrr_shr %s rm=%reg_0 rn=0
+
+AND_rrri         010000 0000 ... ...            @lll_noshr
+EOR_rrri         010000 0001 ... ...            @lll_noshr
+MOV_rxrr         010000 0010 ... ...            @lxl_shr shty=0  # LSL
+MOV_rxrr         010000 0011 ... ...            @lxl_shr shty=1  # LSR
+MOV_rxrr         010000 0100 ... ...            @lxl_shr shty=2  # ASR
+ADC_rrri         010000 0101 ... ...            @lll_noshr
+SBC_rrri         010000 0110 ... ...            @lll_noshr
+MOV_rxrr         010000 0111 ... ...            @lxl_shr shty=3  # ROR
+TST_xrri         010000 1000 ... ...            @xll_noshr
+RSB_rri          010000 1001 rn:3 rd:3          &s_rri_rot %s imm=0 rot=0
+CMP_xrri         010000 1010 ... ...            @xll_noshr
+CMN_xrri         010000 1011 ... ...            @xll_noshr
+ORR_rrri         010000 1100 ... ...            @lll_noshr
+MUL              010000 1101 rn:3 rd:3          &s_rrrr %s rm=%reg_0 ra=0
+BIC_rrri         010000 1110 ... ...            @lll_noshr
+MVN_rxri         010000 1111 ... ...            @lll_noshr
-- 
2.17.1


Received: by 10.25.150.194 with SMTP id y185csp320393lfd;
        Wed, 16 Nov 2016 12:23:32 -0800 (PST)
X-Received: by 10.55.17.68 with SMTP id b65mr5539417qkh.60.1479327812327;
        Wed, 16 Nov 2016 12:23:32 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j59si7312128qtd.337.2016.11.16.12.23.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 16 Nov 2016 12:23:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54646 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1c76jz-00024p-Jk
	for alex.bennee@linaro.org; Wed, 16 Nov 2016 15:23:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56181)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1c76RN-0002iN-Ch
	for qemu-arm@nongnu.org; Wed, 16 Nov 2016 15:04:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1c76RM-0002h5-Ai
	for qemu-arm@nongnu.org; Wed, 16 Nov 2016 15:04:17 -0500
Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244]:36056)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1c76RJ-0002g2-8f; Wed, 16 Nov 2016 15:04:13 -0500
Received: by mail-wm0-x244.google.com with SMTP id m203so14605193wma.3;
	Wed, 16 Nov 2016 12:04:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=VDiZEUmhSnvd50jwCX3nY1ihGmjhZvh05tbw41txB9c=;
	b=sUCytnd+nIWyIPOOjS6Yy5aVTAT6XpkxUftHiljRxCs+BRIxbCDC5JgRktObAmV1Eq
	w0zv7LWarqGPYEsLCPMFqdkyt+Hxf+BihGY+L5sjOoo7NlQEuu1nYqqX4YGeP375bIYN
	H7hJ9DdkVgGiVl5ciyjbUaRu1B9FoVOudQ6qFQ3Qc5hyG14nYkLPqriKq1tnQ2rmILj/
	LbwmR4XSUJatqUmWzRLvpXVLn9fy/yUZyIuFlSA9Yg6Voc+1nJWk3wgYQTCzMtX9g4Mb
	LPf7CLgOmdHje860qt2pGnnq8/ZE1GMe9D1PVlsIB98iiY+K6jN6tLtyQ1qy0hJqBE2C
	RsIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=VDiZEUmhSnvd50jwCX3nY1ihGmjhZvh05tbw41txB9c=;
	b=HPH+YqnFbH2vVQ9CVexOA/p6Vc4N5uMjW5riqBtmjQfGWJ+PGVt0kMwaZA83FG5ad+
	KUa4+hp3n4cVAT+/8Rf/4X6busOupMVFDQ46bhnyccRRqTuAMo1St/wTx7PUKqmeD+mg
	UpmUiX2M2s4X9wuzALamsXKoe5yVOlX25tb3CMs/uv8rOyNeaa9j6L4voTt0GV78GC/b
	DeFPNoWFqldmmU6fxyGvN8RwnDfVGCsAC+AdbWHzV9daCZQiwPfZhQ32pBCAL4/ncIOC
	6cM76sIMsrrim5YE11DnVlKTx/8X2vTkUe8Faj4qnWam//N99fvM74IcusLT+sTc1M4k
	qcIA==
X-Gm-Message-State: ABUngvc3ZpPVn1YuaCUNZe4dhN1ov0kGkuIj4xsh+JVdADT5XpBBF4S1lfFxKrNHRgpddA==
X-Received: by 10.28.139.12 with SMTP id n12mr11253619wmd.79.1479326651701;
	Wed, 16 Nov 2016 12:04:11 -0800 (PST)
Received: from bigtime.twiddle.net ([87.111.149.139])
	by smtp.gmail.com with ESMTPSA id x188sm3292wmx.4.2016.11.16.12.04.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Nov 2016 12:04:11 -0800 (PST)
From: Richard Henderson <rth@twiddle.net>
To: qemu-devel@nongnu.org
Date: Wed, 16 Nov 2016 21:03:41 +0100
Message-Id: <1479326625-10682-15-git-send-email-rth@twiddle.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1479326625-10682-1-git-send-email-rth@twiddle.net>
References: <1479326625-10682-1-git-send-email-rth@twiddle.net>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::244
Subject: [Qemu-arm] [patch v3 14/18] target-arm: Use new deposit and extract
 ops
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ipqP7aMEqup2

Use the new primitives for UBFX and SBFX.

Cc: qemu-arm@nongnu.org
Signed-off-by: Richard Henderson <rth@twiddle.net>
---
 target-arm/translate-a64.c | 79 +++++++++++++++-------------------------------
 target-arm/translate.c     | 37 +++++-----------------
 2 files changed, 34 insertions(+), 82 deletions(-)

diff --git a/target-arm/translate-a64.c b/target-arm/translate-a64.c
index de48747..e90487b 100644
--- a/target-arm/translate-a64.c
+++ b/target-arm/translate-a64.c
@@ -3219,67 +3219,40 @@ static void disas_bitfield(DisasContext *s, uint32_t insn)
        low 32-bits anyway.  */
     tcg_tmp = read_cpu_reg(s, rn, 1);
 
-    /* Recognize the common aliases.  */
-    if (opc == 0) { /* SBFM */
-        if (ri == 0) {
-            if (si == 7) { /* SXTB */
-                tcg_gen_ext8s_i64(tcg_rd, tcg_tmp);
-                goto done;
-            } else if (si == 15) { /* SXTH */
-                tcg_gen_ext16s_i64(tcg_rd, tcg_tmp);
-                goto done;
-            } else if (si == 31) { /* SXTW */
-                tcg_gen_ext32s_i64(tcg_rd, tcg_tmp);
-                goto done;
-            }
-        }
-        if (si == 63 || (si == 31 && ri <= si)) { /* ASR */
-            if (si == 31) {
-                tcg_gen_ext32s_i64(tcg_tmp, tcg_tmp);
-            }
-            tcg_gen_sari_i64(tcg_rd, tcg_tmp, ri);
+    /* Recognize simple(r) extractions.  */
+    if (ri <= si) {
+        int len = (si - ri) + 1;
+        if (opc == 0) { /* SBFM: ASR, SBFX, SXTB, SXTH, SXTW */
+            tcg_gen_sextract_i64(tcg_rd, tcg_tmp, ri, len);
             goto done;
-        }
-    } else if (opc == 2) { /* UBFM */
-        if (ri == 0) { /* UXTB, UXTH, plus non-canonical AND */
-            tcg_gen_andi_i64(tcg_rd, tcg_tmp, bitmask64(si + 1));
-            return;
-        }
-        if (si == 63 || (si == 31 && ri <= si)) { /* LSR */
-            if (si == 31) {
-                tcg_gen_ext32u_i64(tcg_tmp, tcg_tmp);
-            }
-            tcg_gen_shri_i64(tcg_rd, tcg_tmp, ri);
+        } else if (opc == 2) { /* UBFM: UBFX, LSR, UXTB, UXTH */
+            tcg_gen_extract_i64(tcg_rd, tcg_tmp, ri, len);
             return;
         }
-        if (si + 1 == ri && si != bitsize - 1) { /* LSL */
-            int shift = bitsize - 1 - si;
-            tcg_gen_shli_i64(tcg_rd, tcg_tmp, shift);
-            goto done;
-        }
     }
 
-    if (opc != 1) { /* SBFM or UBFM */
-        tcg_gen_movi_i64(tcg_rd, 0);
-    }
+    /* Do the bit move operation.  Note that above we handled ri <= si,
+       Wd<s-r:0> = Wn<s:r>, via tcg_gen_*extract_i64.  Now we handle
+       the ri > si case, Wd<32+s-r,32-r> = Wn<s:0>, via deposit.  */
+    pos = (bitsize - ri) & (bitsize - 1);
+    len = si + 1;
 
-    /* do the bit move operation */
-    if (si >= ri) {
-        /* Wd<s-r:0> = Wn<s:r> */
-        tcg_gen_shri_i64(tcg_tmp, tcg_tmp, ri);
-        pos = 0;
-        len = (si - ri) + 1;
-    } else {
-        /* Wd<32+s-r,32-r> = Wn<s:0> */
-        pos = bitsize - ri;
-        len = si + 1;
+    if (opc == 0 && len < ri) {
+        /* SBFM: sign extend the destination field from len to fill
+           the balance of the word.  Let the deposit below insert all
+           of those sign bits.  */
+        tcg_gen_sextract_i64(tcg_tmp, tcg_tmp, 0, len);
+        len = ri;
     }
 
-    tcg_gen_deposit_i64(tcg_rd, tcg_rd, tcg_tmp, pos, len);
-
-    if (opc == 0) { /* SBFM - sign extend the destination field */
-        tcg_gen_shli_i64(tcg_rd, tcg_rd, 64 - (pos + len));
-        tcg_gen_sari_i64(tcg_rd, tcg_rd, 64 - (pos + len));
+    if (opc == 1) { /* BFM */
+        tcg_gen_deposit_i64(tcg_rd, tcg_rd, tcg_tmp, pos, len);
+    } else {
+        /* SBFM or UBFM: We start with zero, and we haven't modified
+           any bits outside bitsize, therefore the zero-extension
+           below is unneeded.  */
+        tcg_gen_deposit_z_i64(tcg_rd, tcg_tmp, pos, len);
+        return;
     }
 
  done:
diff --git a/target-arm/translate.c b/target-arm/translate.c
index 0ad9070..08da9ac 100644
--- a/target-arm/translate.c
+++ b/target-arm/translate.c
@@ -288,29 +288,6 @@ static void gen_revsh(TCGv_i32 var)
     tcg_gen_ext16s_i32(var, var);
 }
 
-/* Unsigned bitfield extract.  */
-static void gen_ubfx(TCGv_i32 var, int shift, uint32_t mask)
-{
-    if (shift)
-        tcg_gen_shri_i32(var, var, shift);
-    tcg_gen_andi_i32(var, var, mask);
-}
-
-/* Signed bitfield extract.  */
-static void gen_sbfx(TCGv_i32 var, int shift, int width)
-{
-    uint32_t signbit;
-
-    if (shift)
-        tcg_gen_sari_i32(var, var, shift);
-    if (shift + width < 32) {
-        signbit = 1u << (width - 1);
-        tcg_gen_andi_i32(var, var, (1u << width) - 1);
-        tcg_gen_xori_i32(var, var, signbit);
-        tcg_gen_subi_i32(var, var, signbit);
-    }
-}
-
 /* Return (b << 32) + a. Mark inputs as dead */
 static TCGv_i64 gen_addq_msw(TCGv_i64 a, TCGv_i32 b)
 {
@@ -9178,9 +9155,9 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
                             goto illegal_op;
                         if (i < 32) {
                             if (op1 & 0x20) {
-                                gen_ubfx(tmp, shift, (1u << i) - 1);
+                                tcg_gen_extract_i32(tmp, tmp, shift, i);
                             } else {
-                                gen_sbfx(tmp, shift, i);
+                                tcg_gen_sextract_i32(tmp, tmp, shift, i);
                             }
                         }
                         store_reg(s, rd, tmp);
@@ -10497,15 +10474,17 @@ static int disas_thumb2_insn(CPUARMState *env, DisasContext *s, uint16_t insn_hw
                         imm++;
                         if (shift + imm > 32)
                             goto illegal_op;
-                        if (imm < 32)
-                            gen_sbfx(tmp, shift, imm);
+                        if (imm < 32) {
+                            tcg_gen_sextract_i32(tmp, tmp, shift, imm);
+                        }
                         break;
                     case 6: /* Unsigned bitfield extract.  */
                         imm++;
                         if (shift + imm > 32)
                             goto illegal_op;
-                        if (imm < 32)
-                            gen_ubfx(tmp, shift, (1u << imm) - 1);
+                        if (imm < 32) {
+                            tcg_gen_extract_i32(tmp, tmp, shift, imm);
+                        }
                         break;
                     case 3: /* Bitfield insert/clear.  */
                         if (imm < shift)
-- 
2.7.4


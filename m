Received: by 10.25.205.13 with SMTP id d13csp4537647lfg;
        Fri, 23 Dec 2016 20:10:33 -0800 (PST)
X-Received: by 10.200.39.178 with SMTP id w47mr18791434qtw.15.1482552633779;
        Fri, 23 Dec 2016 20:10:33 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i4si13018436qkf.212.2016.12.23.20.10.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Dec 2016 20:10:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41907 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cKdfF-0006Nk-5X
	for alex.bennee@linaro.org; Fri, 23 Dec 2016 23:10:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55342)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1cKdW1-0006cn-OG
	for qemu-arm@nongnu.org; Fri, 23 Dec 2016 23:01:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1cKdW0-0005bu-Ea
	for qemu-arm@nongnu.org; Fri, 23 Dec 2016 23:01:01 -0500
Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241]:34375)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1cKdVx-0005ZA-Fe; Fri, 23 Dec 2016 23:00:57 -0500
Received: by mail-pf0-x241.google.com with SMTP id y68so14578234pfb.1;
	Fri, 23 Dec 2016 20:00:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Ev2VcTBC9ILBSSAx4EzO6PtOt/1TKqh1tWSHNzsXY+4=;
	b=MC/giN4DRard4GgNP9aSuEGuWUPDUF86IE5li8jXlc+yAxaYK3K8bslX18Qk462DHL
	KcADEDwSOfRWnJ3rMmk+cNxbboWkiJt/+JWrcsZB4sW9fOFpUuI5phzuU0B6gxDkyz2b
	SMVcUMY6HeiaKFv6HDl9Xk4IH9b7u5JJRQfCRcqHyIJMVwbT7VG0VCvklKzb3Vh6bNPD
	iOsh/JjGA3zeUljOKX9lBmrWsQBUXGJK8VQmxMH2NJCCc+o7wyrrL5Em/Vj/h4636zBm
	fAyecesqEoLJXS1qB4XqnsoydM7XzFadHs1OiWEEaMrJB2Hly99786T5wud9PJGc0uou
	z0sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=Ev2VcTBC9ILBSSAx4EzO6PtOt/1TKqh1tWSHNzsXY+4=;
	b=E6+MrxEUgHacwjRSc88VmlvvQ3kqPuxmIoKKWCuyGjxjDU/c+8ZGMxaEsXha9MWj/R
	gcphZTVRwpz9Q6/FmvJsebEo2OQVJpw5pbmAnLDEOxbgZ2Ab4HddaWk9WBLaMikTjb4B
	5X9pgid1TGgKDbqsgOBGyNXNLNGllHZOQ8DNnKpmYkAG0aYPQccowmydGsaExh6tWCrY
	BRwcaiFOGrxfHEfJjn0vY+35KjnIEcPPgErE3qtuPNAkpKfWjhwoMtwthPyuoI3iUbVl
	+ETVWEexfsOjSSUy938QL6mXSVveGtmxd81h/i/nUYtePYf1wGbgHuVH7Ea4gI0pdrhg
	MIFw==
X-Gm-Message-State: AIkVDXI8iJ32SI9Y/Ime6FZrxsvLFkz+yV0vaJTfq4zphhUtq8FuU2HIRkDuvGaybFsYQA==
X-Received: by 10.98.106.9 with SMTP id f9mr10153436pfc.126.1482552056231;
	Fri, 23 Dec 2016 20:00:56 -0800 (PST)
Received: from bigtime.domain ([2602:47:d954:1500:5e51:4fff:fe40:9c64])
	by smtp.gmail.com with ESMTPSA id
	n25sm65339316pfi.33.2016.12.23.20.00.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 23 Dec 2016 20:00:55 -0800 (PST)
From: Richard Henderson <rth@twiddle.net>
To: qemu-devel@nongnu.org
Date: Fri, 23 Dec 2016 19:59:51 -0800
Message-Id: <20161224040042.12654-15-rth@twiddle.net>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20161224040042.12654-1-rth@twiddle.net>
References: <20161224040042.12654-1-rth@twiddle.net>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::241
Subject: [Qemu-arm] [PATCH 14/65] target-arm: Use new deposit and extract ops
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
X-TUID: AvvjFEvbvWyQ

Use the new primitives for UBFX and SBFX.

Cc: qemu-arm@nongnu.org
Signed-off-by: Richard Henderson <rth@twiddle.net>
---
 target/arm/translate-a64.c | 81 +++++++++++++++++-----------------------------
 target/arm/translate.c     | 37 +++++----------------
 2 files changed, 37 insertions(+), 81 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 6dc27a6..5ba5c3e 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -3215,67 +3215,44 @@ static void disas_bitfield(DisasContext *s, uint32_t insn)
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
+    if (si <= ri) {
+        /* Wd<s-r:0> = Wn<s:r> */
+        len = (si - ri) + 1;
+        if (opc == 0) { /* SBFM: ASR, SBFX, SXTB, SXTH, SXTW */
+            tcg_gen_sextract_i64(tcg_rd, tcg_tmp, ri, len);
             goto done;
-        }
-    } else if (opc == 2) { /* UBFM */
-        if (ri == 0) { /* UXTB, UXTH, plus non-canonical AND */
-            tcg_gen_andi_i64(tcg_rd, tcg_tmp, bitmask64(si + 1));
+        } else if (opc == 2) { /* UBFM: UBFX, LSR, UXTB, UXTH */
+            tcg_gen_extract_i64(tcg_rd, tcg_tmp, ri, len);
             return;
         }
-        if (si == 63 || (si == 31 && ri <= si)) { /* LSR */
-            if (si == 31) {
-                tcg_gen_ext32u_i64(tcg_tmp, tcg_tmp);
-            }
-            tcg_gen_shri_i64(tcg_rd, tcg_tmp, ri);
-            return;
-        }
-        if (si + 1 == ri && si != bitsize - 1) { /* LSL */
-            int shift = bitsize - 1 - si;
-            tcg_gen_shli_i64(tcg_rd, tcg_tmp, shift);
-            goto done;
-        }
-    }
-
-    if (opc != 1) { /* SBFM or UBFM */
-        tcg_gen_movi_i64(tcg_rd, 0);
-    }
-
-    /* do the bit move operation */
-    if (si >= ri) {
-        /* Wd<s-r:0> = Wn<s:r> */
-        tcg_gen_shri_i64(tcg_tmp, tcg_tmp, ri);
+        /* opc == 1, BXFIL fall through to deposit */
+        tcg_gen_extract_i64(tcg_tmp, tcg_tmp, ri, len);
         pos = 0;
-        len = (si - ri) + 1;
     } else {
-        /* Wd<32+s-r,32-r> = Wn<s:0> */
-        pos = bitsize - ri;
+        /* Handle the ri > si case with a deposit
+         * Wd<32+s-r,32-r> = Wn<s:0>
+         */
         len = si + 1;
+        pos = (bitsize - ri) & (bitsize - 1);
     }
 
-    tcg_gen_deposit_i64(tcg_rd, tcg_rd, tcg_tmp, pos, len);
+    if (opc == 0 && len < ri) {
+        /* SBFM: sign extend the destination field from len to fill
+           the balance of the word.  Let the deposit below insert all
+           of those sign bits.  */
+        tcg_gen_sextract_i64(tcg_tmp, tcg_tmp, 0, len);
+        len = ri;
+    }
 
-    if (opc == 0) { /* SBFM - sign extend the destination field */
-        tcg_gen_shli_i64(tcg_rd, tcg_rd, 64 - (pos + len));
-        tcg_gen_sari_i64(tcg_rd, tcg_rd, 64 - (pos + len));
+    if (opc == 1) { /* BFM, BXFIL */
+        tcg_gen_deposit_i64(tcg_rd, tcg_rd, tcg_tmp, pos, len);
+    } else {
+        /* SBFM or UBFM: We start with zero, and we haven't modified
+           any bits outside bitsize, therefore the zero-extension
+           below is unneeded.  */
+        tcg_gen_deposit_z_i64(tcg_rd, tcg_tmp, pos, len);
+        return;
     }
 
  done:
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 0ad9070..08da9ac 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
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
2.9.3


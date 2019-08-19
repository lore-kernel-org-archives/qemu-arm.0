Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp3187616wrs;
        Mon, 19 Aug 2019 15:02:17 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzDG+PdBSnPEsgyIDcqHAvZrxNDhuFTv6qvmuOGDRFEvHAKYPL8e/IecqkkoLSPo4V+Mbw5
X-Received: by 2002:a05:6214:13a1:: with SMTP id h1mr11869027qvz.190.1566252137700;
        Mon, 19 Aug 2019 15:02:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566252137; cv=none;
        d=google.com; s=arc-20160816;
        b=uS8F6P8mRn4cmVGCLCK7IbOfTMvb52q5k3GBuOjl2In7rQGN5CQlceeMaI/4j6d1z5
         V69eEaZ1SE5/qcSp1NjkszDGL7wwAKq3THicqfCEPY+KT5rjMJJBR0hhHBzurdrnz/w4
         4KGdhEgXAlFp5O3qhMXg3/a6oHkvzbgBcijplmeZCyOojrfy4FNjwbJ03twOgtcUTtaW
         BCx/BspZ3gXPwtMisQma1el3ELKVKMGzn+aEQeP+sX6mMa+8PLbshj2XcZt6R0ZTMeRs
         03SatOOUmigMuWCxoi3pgm+ZDe9VCr3Ic4vxjXCe9Wkm62mkfXFMbepTEcvasDKHa8x9
         kx9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=hd9oAYsJN/ILLc4tSsxONdbYI/SdPS1ZDtg8ggp1IIQ=;
        b=MGtpYY7rmB7TE63M9TxRc69gEqD8xP/Q0Hyx1xKmcHWyOLWzUF1KGrhBuuH4hl4o86
         HsHl+vCx3ToqZqB2auaCkzSMsJrRFKGwXHbE+N5ozJof+/OBd5D//H/G1KOo6sm3w9ID
         1iPuX6fi5PEb0+mKq/FJRAsntkaOenjHrQyZK3O3sfEQfvO28BlWHsFFCd8ynIxdGlDV
         ExvNuH8TPz97RowYBW32cHf7x/cya19qNmoGhHdTFRm7ER1aokqmWgh8rHrxcCwMQi9P
         fQ7YqfREv9otuzso9Mbi3LC9k16pgGg7zvdn/F9iF2mCzh7GXb8m6pp+wfniFUsdHV2c
         fa8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=rs+aVxya;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x6si9500523qtj.361.2019.08.19.15.02.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Aug 2019 15:02:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=rs+aVxya;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hzpjE-0007eT-Dz
	for alex.bennee@linaro.org; Mon, 19 Aug 2019 18:02:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59349)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1hzpMQ-0002HK-SI
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:38:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hzpMP-0006SD-G1
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:38:42 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:33450)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hzpMP-0006Re-9O
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:38:41 -0400
Received: by mail-pl1-x642.google.com with SMTP id go14so1586700plb.0
 for <qemu-arm@nongnu.org>; Mon, 19 Aug 2019 14:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=hd9oAYsJN/ILLc4tSsxONdbYI/SdPS1ZDtg8ggp1IIQ=;
 b=rs+aVxyaYjn4n4buKJ3z0ywGpFYSnZgAxFwRAeGetgTAPEHnQ5d+udqVtXclrIRPru
 NeOKcEWs+SFX6oaejTAs8KfnWuDNtq09fp7+ao2MXbMjmjJgILMW1H3MkwX+aBl8hyt6
 YC34YHTOpbO8OfD15JT6dxfbaCWHKzj+p5D9DNIPayibyrmHmAhmIbx6TxAYy0VWL2Ds
 FBd6VrdGWc3NA65LgF6umRlsnLzrEtqLV01Ezy4pnwlL1d8WajenZhorz5xHzrFgMIOQ
 iGGCh4UOOHAvIVPA1XDi2GKWruBa6WTBgrNXWS+S1yYK3Y0Oqdiru0GdCxn8sLx+8wWD
 lobw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=hd9oAYsJN/ILLc4tSsxONdbYI/SdPS1ZDtg8ggp1IIQ=;
 b=JoyMQgH9LBZfO9RMCydhJ39+629dSS3w6Efy2iZ9C2XlUJeRMIfGinpVzy2cPCJtRH
 eZgvjXB9nva0JOWiA+CIrHKameNVvzIay+WU8DKdP0U3JWVCAEk7wJpEmMvGm8lR6cYY
 ytHGnv92eyyEwMhxOJdEwSadkCBJl9MVfO2P/O/zqB0AmFy3XvWHRxPjaK9RWzlFZde8
 x2qFnfajLvAGa823zsbev8kAKId6b2gmqkmBbM9vVWCD8g2Jwv5CfC7pPiv+xNs3fN/v
 l0Up1c4FP8lH5J0VmxtHhcL0OoV5GU5HvCZc+pQupS7IGDmIoe/bFzuLW79w/VhBghqB
 TI3w==
X-Gm-Message-State: APjAAAV8M5xr1UddxzhlaWCDeMnHYRMRFNBjGKxvOQfajGvnEZrZxwBm
 tIDksLddPMHNxKsDkYzDRuhPvQ==
X-Received: by 2002:a17:902:2bcb:: with SMTP id
 l69mr22578442plb.282.1566250720368; 
 Mon, 19 Aug 2019 14:38:40 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id d2sm13446951pjs.21.2019.08.19.14.38.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 14:38:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 19 Aug 2019 14:37:22 -0700
Message-Id: <20190819213755.26175-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819213755.26175-1-richard.henderson@linaro.org>
References: <20190819213755.26175-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::642
Subject: [Qemu-arm] [PATCH v2 35/68] target/arm: Convert CPS (privileged)
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
X-TUID: qBZGbPJOoIOX

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c       | 87 +++++++++++++++---------------------
 target/arm/a32-uncond.decode |  3 ++
 target/arm/t32.decode        |  3 ++
 3 files changed, 42 insertions(+), 51 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 6489bbc09c..928205d993 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10038,6 +10038,40 @@ static bool trans_SRS(DisasContext *s, arg_SRS *a)
     return true;
 }
 
+static bool trans_CPS(DisasContext *s, arg_CPS *a)
+{
+    uint32_t mask, val;
+
+    if (IS_USER(s)) {
+        /* Implemented as NOP in user mode.  */
+        return true;
+    }
+
+    mask = val = 0;
+    if (a->imod & 2) {
+        if (a->A) {
+            mask |= CPSR_A;
+        }
+        if (a->I) {
+            mask |= CPSR_I;
+        }
+        if (a->F) {
+            mask |= CPSR_F;
+        }
+        if (a->imod & 1) {
+            val |= mask;
+        }
+    }
+    if (a->M) {
+        mask |= CPSR_M;
+        val |= a->mode;
+    }
+    if (mask) {
+        gen_set_psr_im(s, mask, 0, val);
+    }
+    return true;
+}
+
 /*
  * Clear-Exclusive, Barriers
  */
@@ -10209,31 +10243,6 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
             ARCH(5TE);
         } else if ((insn & 0x0f000010) == 0x0e000010) {
             /* Additional coprocessor register transfer.  */
-        } else if ((insn & 0x0ff10020) == 0x01000000) {
-            uint32_t mask;
-            uint32_t val;
-            /* cps (privileged) */
-            if (IS_USER(s))
-                return;
-            mask = val = 0;
-            if (insn & (1 << 19)) {
-                if (insn & (1 << 8))
-                    mask |= CPSR_A;
-                if (insn & (1 << 7))
-                    mask |= CPSR_I;
-                if (insn & (1 << 6))
-                    mask |= CPSR_F;
-                if (insn & (1 << 18))
-                    val |= mask;
-            }
-            if (insn & (1 << 17)) {
-                mask |= CPSR_M;
-                val |= (insn & 0x1f);
-            }
-            if (mask) {
-                gen_set_psr_im(s, mask, 0, val);
-            }
-            return;
         }
         goto illegal_op;
     }
@@ -10342,7 +10351,6 @@ static bool thumb_insn_is_16bit(DisasContext *s, uint32_t pc, uint32_t insn)
 /* Translate a 32-bit thumb instruction. */
 static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
 {
-    uint32_t imm, offset;
     uint32_t rd, rn, rm, rs;
     TCGv_i32 tmp;
     TCGv_i32 addr;
@@ -10618,31 +10626,8 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
                     case 0: /* msr cpsr, in decodetree  */
                     case 1: /* msr spsr, in decodetree  */
                         goto illegal_op;
-                    case 2: /* cps, nop-hint.  */
-                        /* nop hints in decodetree */
-                        /* Implemented as NOP in user mode.  */
-                        if (IS_USER(s))
-                            break;
-                        offset = 0;
-                        imm = 0;
-                        if (insn & (1 << 10)) {
-                            if (insn & (1 << 7))
-                                offset |= CPSR_A;
-                            if (insn & (1 << 6))
-                                offset |= CPSR_I;
-                            if (insn & (1 << 5))
-                                offset |= CPSR_F;
-                            if (insn & (1 << 9))
-                                imm = CPSR_A | CPSR_I | CPSR_F;
-                        }
-                        if (insn & (1 << 8)) {
-                            offset |= 0x1f;
-                            imm |= (insn & 0x1f);
-                        }
-                        if (offset) {
-                            gen_set_psr_im(s, offset, 0, imm);
-                        }
-                        break;
+                    case 2: /* cps, nop-hint, in decodetree */
+                        goto illegal_op;
                     case 3: /* Special control operations, in decodetree */
                     case 4: /* bxj, in decodetree */
                         goto illegal_op;
diff --git a/target/arm/a32-uncond.decode b/target/arm/a32-uncond.decode
index b077958cec..eb1c55b330 100644
--- a/target/arm/a32-uncond.decode
+++ b/target/arm/a32-uncond.decode
@@ -35,9 +35,12 @@ BLX_i            1111 101 . ........................          &i imm=%imm24h
 
 &rfe             rn w pu
 &srs             mode w pu
+&cps             mode imod M A I F
 
 RFE              1111 100 pu:2 0 w:1 1 rn:4 0000 1010 0000 0000   &rfe
 SRS              1111 110 pu:2 1 w:1 0 1101 0000 0101 000 mode:5  &srs
+CPS              1111 0001 0000 imod:2 M:1 0 0000 000 A:1 I:1 F:1 0 mode:5 \
+                 &cps
 
 # Clear-Exclusive, Barriers
 
diff --git a/target/arm/t32.decode b/target/arm/t32.decode
index 18c268e712..354ad77fe6 100644
--- a/target/arm/t32.decode
+++ b/target/arm/t32.decode
@@ -44,6 +44,7 @@
 &bfi             !extern rd rn lsb msb
 &sat             !extern rd rn satimm imm sh
 &pkh             !extern rd rn rm imm tb
+&cps             !extern mode imod M A I F
 
 # Data-processing (register)
 
@@ -340,6 +341,8 @@ CLZ              1111 1010 1011 ---- 1111 .... 1000 ....      @rdm
     SMC          1111 0111 1111 imm:4 1000 0000 0000 0000     &i
     HVC          1111 0111 1110 ....  1000 .... .... ....     \
                  &i imm=%imm16_16_0
+    CPS          1111 0011 1010 1111 1000 0 imod:2 M:1 A:1 I:1 F:1 mode:5 \
+                 &cps
     UDF          1111 0111 1111 ----  1010 ---- ---- ----
   }
   B_cond_thumb   1111 0. cond:4 ...... 10.0 ............      &ci imm=%imm21
-- 
2.17.1


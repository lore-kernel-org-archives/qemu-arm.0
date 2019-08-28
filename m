Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp1179176wrs;
        Wed, 28 Aug 2019 12:33:50 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyGJQ4i9slpxUflmE1v7fP8rBLQhVCzRovghYLpOPWEtATDVBYWEd93KMcrusZ3oqazueAN
X-Received: by 2002:a17:907:212f:: with SMTP id qo15mr4828742ejb.121.1567020830138;
        Wed, 28 Aug 2019 12:33:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567020830; cv=none;
        d=google.com; s=arc-20160816;
        b=xkfh3LRbiv/e6ep9nC5f3xveKBdAucJERYcYzd8G7Ublhr18TfFjYewglEr3V7Ju6w
         it61hkM8TA/QZIUDeUc/0FoG7/6fFyjb6FY3zPyTSbJaJ1YiYr3xAAh/K0ZJW6gfPvRZ
         /a4hgSAfc3hFEQPWk5emuB+VJJtknCJGxi/F+2xJ/cdVd7ldtol9UnE87jPyQcXg1LU/
         TVN8bb9MJnUFdnNTkgv+4hKP2OKMg5208KYX5Fb8LqTNbFpB3oVx3v4R6SjvP4QEJQ+r
         dXnu279YUVC5rw9zsMnh2x6gOo8MWu2oHvk5XmlLMsy/OxYnoUhb/sCmvCv41ROuYuGi
         YeBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=0UvFhmNUqeBm7S5PhfAWHzrVJNihnGpoWwY5zvTyQDs=;
        b=m64K5cOSrzpJ9sI+hUzBUPuqaJm/MWBVajuVNSFwG/K2wniYCIJ6UBOdTM98GhzCNc
         jwC63oIxDcibzZJhtIC8TXBvDrNFIw2r9fJgDjylturz+O74OjxhAvj0fDhpwNERgQji
         TcLiFLw3TQQANWXMWk+vlqT/cBjfUiKBaPyrTc3TFaTXFE9u6xGYuMMAiutHvKIZ94C3
         fvBfCcIRUDX91yTd1pOSfwLJt/G89azLDh4bAseVG7eJk1ctmhbthTtUODsGZWlBYlcM
         +iVeMoQ+uj2f6zSc+vZZtl3xpp8Kizp93wW7fH7SAFsFCFvtOW6DdiMjEct8NFAQcZQ9
         KOOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EuZDt+Ia;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t17si1918842eda.1.2019.08.28.12.33.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Aug 2019 12:33:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EuZDt+Ia;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i33hU-00051Q-BP
	for alex.bennee@linaro.org; Wed, 28 Aug 2019 15:33:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38261)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i33GU-0003oD-Vq
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 15:05:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i33GS-0000Ot-S9
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 15:05:54 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:41815)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i33GS-0000Lg-FX
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 15:05:52 -0400
Received: by mail-pf1-x442.google.com with SMTP id 196so383047pfz.8
 for <qemu-devel@nongnu.org>; Wed, 28 Aug 2019 12:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=0UvFhmNUqeBm7S5PhfAWHzrVJNihnGpoWwY5zvTyQDs=;
 b=EuZDt+IatzaWgfhJhmSkmKy0ATcSDm4jLpqyZEuVA3aDJrnwSPtsHRHq4FuMGhpYDk
 Y+IEWriZzphYgE8T30UOQt5hUQbyG8Bx5/1EEXSGcq3oI75Bg+gmcYxV4d/qa83A4o/G
 ZcMEzr3YwngwUYoRFDYv0oGhPTAUzz4DOCXtxXtivxg7fVgQJpp7d7Z3UeL/BhmhkliM
 hY0VTvoIVf+ZIU21alKPuPsthyP3JUxbIEOzeeI3nb/JOaRA/UENtjqrtYnJ8DwT/odq
 6TRvAc9Y3jIHE46XR5Aw9o1crMpUy1ADkHZVTZwqgZ8z+FssHm1pXJqgtXYa5DqFyrAI
 PmVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=0UvFhmNUqeBm7S5PhfAWHzrVJNihnGpoWwY5zvTyQDs=;
 b=g2oy7BmG1fT8PEHunm4UyxzvkD0KsqHWgGT+fH/+zoIRbtShO7vvtbgaHUTY3JKEIR
 d8CWqLQZeqPZD4chAnbVec49aEHq3tc3b+wnjOrtsQ7FBju9vtxGT+145GRsp4TL3qM8
 pBfoRiPBeyZPeWElvKXihmzhVTjzqlQDh6JshZY8hmKH/5kFj2EHSp9nycElQsx5EL4N
 750V6bXOLLXh6Ueh3Mb/8JVWy81DSdEusZQEKq7PbTZM+NRaMDsrwkhH3FVxPrc52tEC
 hPi/r6GETanDBYnaLYliAyp3+KLP9aqFY6UgFIaokEEAzA2yglBRsnrKvTFItX2q70Pl
 38/Q==
X-Gm-Message-State: APjAAAX12IDWf1VYCDp+glaC9hcUhSwrqvy6qkbjT5OcOcMqCslMovlZ
 xit7ubojShu72KpdHIkXGi42VuWQRDw=
X-Received: by 2002:a17:90a:feb:: with SMTP id 98mr5455811pjz.55.1567019146203; 
 Wed, 28 Aug 2019 12:05:46 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f27sm2967944pgm.60.2019.08.28.12.05.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 12:05:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 28 Aug 2019 12:04:23 -0700
Message-Id: <20190828190456.30315-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190828190456.30315-1-richard.henderson@linaro.org>
References: <20190828190456.30315-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::442
Subject: [Qemu-devel] [PATCH v3 36/69] target/arm: Convert CPS (privileged)
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
X-TUID: ktyRk3DtRjL2

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v3: Reject for m-profile; add TODO for unpredictable arguments.
    Sort the T32 decode adjacent to the hint space.
---
 target/arm/translate.c       | 91 ++++++++++++++++--------------------
 target/arm/a32-uncond.decode |  3 ++
 target/arm/t32.decode        |  5 ++
 3 files changed, 48 insertions(+), 51 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 003b8ac414..e8764a88ae 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10122,6 +10122,44 @@ static bool trans_SRS(DisasContext *s, arg_SRS *a)
     return true;
 }
 
+static bool trans_CPS(DisasContext *s, arg_CPS *a)
+{
+    uint32_t mask, val;
+
+    if (arm_dc_feature(s, ARM_FEATURE_M)) {
+        return false;
+    }
+    if (IS_USER(s)) {
+        /* Implemented as NOP in user mode.  */
+        return true;
+    }
+    /* TODO: There are quite a lot of UNPREDICTABLE argument combinations. */
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
@@ -10298,31 +10336,6 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
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
@@ -10431,7 +10444,6 @@ static bool thumb_insn_is_16bit(DisasContext *s, uint32_t pc, uint32_t insn)
 /* Translate a 32-bit thumb instruction. */
 static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
 {
-    uint32_t imm, offset;
     uint32_t rd, rn, rm, rs;
     TCGv_i32 tmp;
     TCGv_i32 addr;
@@ -10707,31 +10719,8 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
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
index c7e9df8030..de611e8aff 100644
--- a/target/arm/a32-uncond.decode
+++ b/target/arm/a32-uncond.decode
@@ -35,9 +35,12 @@ BLX_i            1111 101 . ........................          &i imm=%imm24h
 
 &rfe             rn w pu
 &srs             mode w pu
+&cps             mode imod M A I F
 
 RFE              1111 100 pu:2 0 w:1 1 rn:4 0000 1010 0000 0000   &rfe
 SRS              1111 100 pu:2 1 w:1 0 1101 0000 0101 000 mode:5  &srs
+CPS              1111 0001 0000 imod:2 M:1 0 0000 000 A:1 I:1 F:1 0 mode:5 \
+                 &cps
 
 # Clear-Exclusive, Barriers
 
diff --git a/target/arm/t32.decode b/target/arm/t32.decode
index 18c268e712..fc3e7db4b5 100644
--- a/target/arm/t32.decode
+++ b/target/arm/t32.decode
@@ -44,6 +44,7 @@
 &bfi             !extern rd rn lsb msb
 &sat             !extern rd rn satimm imm sh
 &pkh             !extern rd rn rm imm tb
+&cps             !extern mode imod M A I F
 
 # Data-processing (register)
 
@@ -306,6 +307,10 @@ CLZ              1111 1010 1011 ---- 1111 .... 1000 ....      @rdm
       NOP        1111 0011 1010 1111 1000 0000 ---- ----
     }
 
+    # If imod == '00' && M == '0' then SEE "Hint instructions", above.
+    CPS          1111 0011 1010 1111 1000 0 imod:2 M:1 A:1 I:1 F:1 mode:5 \
+                 &cps
+
     # Miscelaneous control
     {
       CLREX      1111 0011 1011 1111 1000 1111 0010 1111
-- 
2.17.1


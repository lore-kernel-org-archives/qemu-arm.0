Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp207297wrv;
        Fri, 26 Jul 2019 10:51:16 -0700 (PDT)
X-Received: by 2002:a63:cb4f:: with SMTP id m15mr16802820pgi.100.1564163476280;
        Fri, 26 Jul 2019 10:51:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564163476; cv=none;
        d=google.com; s=arc-20160816;
        b=yDam/Yw04joKFSpgQhsm1aNajvsKsR0x6FMSqq6hVMnwp003GaAdHrPyMya1LdvLQo
         +T90v13O1D8+ZJuhYvaO5f0sS1ov6+j96ICJJQQz4DTclYUsPG9c8REm14K0hcbiNw6F
         YNFtw6KqHV4ldRXNqJC4l/YjZ7g+B/qCiU6R+dTPZoP2ObV7StnqH5sLNpu60WQNhBPU
         tjtiVTjJkRzN4DG1/veLVnT9gZE/F3hDrL4jF13ihSDvgd0UFye0uz2fT3YAEzgANRTj
         i2N+lM5QzSWIrYzC8Pawk7llFVwXsGkqoSqLKZbKN8ZVfwff8ROdxevrpeMBhfHbP1lr
         cwkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=V+9sEjvD/MeB+TtFs8ZOx130uH8wMAavrP8D396SPq0=;
        b=g/jY3XWf9yAbhaUPr9Nyy/duCRamel2F8mXv5UuzPwd/VYAY9NBLI3K9TFewhEa9sf
         HCFUqKNhYgNghfCNnGCfiDByobuzputeuxKohc1lzU6YX88sH+0TlyLCgxUbMwlGjKxk
         2+0AM/EdOt+R5WcVV1vNRSYMpk7ru1DklJ5PfBkIJn53GuB263k6iUwMbtPEAi39LljE
         om9ywN0xwXdi4+p/qW6FHgqeDGbQXy5x6VQcBvoeY9o3lf9Vn3/mM0cw4oB87f+dmNp9
         cl34TRpANoRiAeKSHm4Dw+OhXL39rt28Wnzu/ViTBDAvSigdt/5Jy9XgX2CJunD+jFLx
         UDdw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="f/SL5nhg";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 37sor64450199pld.19.2019.07.26.10.51.16
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 26 Jul 2019 10:51:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="f/SL5nhg";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=V+9sEjvD/MeB+TtFs8ZOx130uH8wMAavrP8D396SPq0=;
        b=f/SL5nhg6EpaND6So2WRj2YgErez5hqgIJwID9peBtD1SXLkj/xgmGHbHMRBRWwtbw
         RXSDPacY9aDCUPgz+ZPoHHyB1WQ1nSpguwemwoaVm0YpppCWDB/uyCnvT16ivzwZAXrg
         0F+weck/PPdUkDvSwiYlEmDj+NOgeODZEF35YXUXjta9WU0/2h1RKhu63jWfcrr187oT
         UdKB3U7F/G0wuNIoqX5Gs0tORHs3Y0l9X1s0su4mUvM9/Ru6Lr2Lz0MEM64vTaS3d7TR
         ccL6ftirSUdGNfpvi3+cJAoLeMJIckHd4zyVB61VkqyAdLWIqcVvSp+9xyMAOYKmAJRK
         HgWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=V+9sEjvD/MeB+TtFs8ZOx130uH8wMAavrP8D396SPq0=;
        b=LBcXyvWnSRScKsWlCggUlwdI+J/swNiDWLwaCYEmc08ssX3shvIH2DCUQnx/i9JT3O
         ggGQnO+4H15KR6pHGf+Hepx2F74sE0jeBkLOyLWGbQf0d8bQgDGstZl5CkvQAO4tiqkR
         ZUCagXFc58E483MsjOM92qZ7ljYrC9nNJxZARLwVq+S5bOSLCye432VmeojmwJyiKzkW
         WLkpZfoERqpVoePZw5QoCf1CoapGQmIhwR3sArdZkolehOGRlM7Aac585KLhH65ISXRs
         Hf8TzqahV794dippXideF6iFlEoX7eAScBuMFWQpomJFuhkhPh1QkZ7Ajm/z/28iL/zV
         MpEg==
X-Gm-Message-State: APjAAAWhPzPf402KXS4UHcEW931zPmNemgMYLZv25B0ri1ckO6Jo4zuZ
	Yuy14Nqara0/3KWaYdhW0vbYy6Jl8F/5PA==
X-Google-Smtp-Source: APXvYqzKE9SgLj4rI1iePRQcTTspfaxyV03RZQkrCBTPopmYkLnl24HmiUcSUDt89rKWKXwLc6zMyg==
X-Received: by 2002:a17:902:7781:: with SMTP id o1mr97579752pll.205.1564163474983;
        Fri, 26 Jul 2019 10:51:14 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-117-207.tukw.qwest.net. [97.126.117.207])
        by smtp.gmail.com with ESMTPSA id o24sm104287919pfp.135.2019.07.26.10.51.13
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 26 Jul 2019 10:51:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH 34/67] target/arm: Convert CPS (privileged)
Date: Fri, 26 Jul 2019 10:49:59 -0700
Message-Id: <20190726175032.6769-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190726175032.6769-1-richard.henderson@linaro.org>
References: <20190726175032.6769-1-richard.henderson@linaro.org>
X-TUID: 3F8rJMjEywwq

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c       | 87 +++++++++++++++---------------------
 target/arm/a32-uncond.decode |  3 ++
 target/arm/t32.decode        |  3 ++
 3 files changed, 42 insertions(+), 51 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 797e8f7344..8dbe189df7 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10049,6 +10049,40 @@ static bool trans_SRS(DisasContext *s, arg_SRS *a)
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
@@ -10220,31 +10254,6 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
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
@@ -10350,7 +10359,6 @@ static bool thumb_insn_is_16bit(DisasContext *s, uint32_t insn)
 /* Translate a 32-bit thumb instruction. */
 static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
 {
-    uint32_t imm, offset;
     uint32_t rd, rn, rm, rs;
     TCGv_i32 tmp;
     TCGv_i32 addr;
@@ -10631,31 +10639,8 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
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
                     case 5: /* eret, in decodetree */
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
index 9fe1500fe0..f8d8660466 100644
--- a/target/arm/t32.decode
+++ b/target/arm/t32.decode
@@ -44,6 +44,7 @@
 &bfi             !extern rd rn lsb msb
 &sat             !extern rd rn satimm imm sh
 &pkh             !extern rd rn rm imm tb
+&cps             !extern mode imod M A I F
 
 # Data-processing (register-shifted register)
 
@@ -340,6 +341,8 @@ CLZ              1111 1010 1011 ---- 1111 .... 1000 ....      @rdm
     SMC          1111 0111 1111 imm:4 1000 0000 0000 0000     &i
     HVC          1111 0111 1110 .... 1000 .... .... ....      \
                  &i imm=%imm16_16_0
+    CPS          1111 0011 1010 1111 1000 0 imod:2 M:1 A:1 I:1 F:1 mode:5 \
+                 &cps
     UDF          1111 0111 1111 ----  1010 ---- ---- ----
   }
   B_cond_thumb   1111 0. cond:4 ...... 10.0 ............      &ci imm=%imm21
-- 
2.17.1

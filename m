Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp1157351wrs;
        Wed, 28 Aug 2019 12:14:02 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwj2pvr/drMhwFMIlsMh+SB5nc8uufhEYrrejgRHBNW+KN2S9IYlAVDr2QwoU5Qj0esq+WN
X-Received: by 2002:ac8:3043:: with SMTP id g3mr5941937qte.37.1567019642103;
        Wed, 28 Aug 2019 12:14:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567019642; cv=none;
        d=google.com; s=arc-20160816;
        b=PfcT5JlvqgtyGNTHKqCh2jlBKrczHiyAE4hJi1uzJjMsHKwoXknZQ4+qyym1kntXLr
         Vdd5877bxZN6n4rLAybFMxM5vDFNUsdehQSedvNdgKykehaGqBocR+uiHqfEYRPTS2ib
         CWfPu6QcLkEfPFGK0icydttWSW6PkYpdzsGu/HGkhPNOTtlCwISw1YY/6xFpaYMXD5Rw
         iGBuf4ZI+WOaCdttNMnniiU5LR4IP2zdUCEM2S3eqsc+a99t/vhd19nq9I7grPej+8vF
         7+Ixva6KgCP8CyKSaBZ+bJnZtWTFgSIf/3rXCMaEPtg72NTW6q3WZVuGvql0MJ3GsHLP
         KNEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=b8pLyu80ByK5bjQKITtTY/uW/k9pGohqmOEr3RJeigk=;
        b=UhLNt4Db0eRxnQGSbG/Z+ZBFZKAG9dI06ZYV3nwwIvyN+4TPuwz0s+AO44POaiC6Wd
         Mz3zXoNaJZLbyeeV+d27cMLSlGK+LJWJIATGCCZctD6OOxLtfCU9ocXHrEztHU6uSXjp
         /6jkLHM9ZEtcA7suuIChatdkyY7YjeOlaLGu4/wMlXrrAGA0YhW8TRGJkuUG4+bh+mre
         g+Kd1FbIi0XuI6n3+hUHOYRt7/hr7yd0LRl0Aqj8Zv8RH152PibsqWkVkJKLAN/ca7w5
         rCkRIXyeskJIjjxUnzfMjRo0c4ggmMrEpKX5Orjgqy7xyTqcQeXxV3iLhycx6lFN0P+J
         zdWg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FK+sZt64;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q127si149002qkf.238.2019.08.28.12.14.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Aug 2019 12:14:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FK+sZt64;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i33OK-0003Ae-V8
	for alex.bennee@linaro.org; Wed, 28 Aug 2019 15:14:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37626)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i33Fu-0003B7-IQ
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:05:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i33Fs-0008L4-9Q
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:05:18 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:33902)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i33Fr-0008KN-V4
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:05:16 -0400
Received: by mail-pg1-x541.google.com with SMTP id n9so233527pgc.1
 for <qemu-arm@nongnu.org>; Wed, 28 Aug 2019 12:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=b8pLyu80ByK5bjQKITtTY/uW/k9pGohqmOEr3RJeigk=;
 b=FK+sZt64dEgio/3pfoLpi9DL1F7YWE2P0LT0q7GfMrJcc65LpUG8DrZY6oaTE/fGzn
 aEmhpu5MdgiiioBXKwHWmqDPAIJCQK1gtGZkpLEb7kqWx7Spx/1GOpFOZIgDj3vLHrEB
 eXVJB3QihgfgB81V7RIHdHIHXDg4SNHkRCzzEpOM2JlguN0dlFspFc2T0XhUf3glOHKl
 iA6m43zFnFbIgPTgN0BUcNYHBqYbTrKR/CY7lJer0Mz7YE835Hy3UGCIqHhQZAr0qfHk
 oA43UyOHhXPCtDV1StI4126QAkquj8b4N/94L0DHrWhfhC5OuAI/OfXlqhSwYxdRkuEd
 wChw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=b8pLyu80ByK5bjQKITtTY/uW/k9pGohqmOEr3RJeigk=;
 b=WH0cNsLTeHxIMl26P5TncAN9D8d8qsMSJHeqb2rfiR8OnQNaD704e/WorYchGNdyMZ
 rXPeItfzD662rMGHDDYYxRKa0TUilTHnT8EsYJ7nXHWKjwK/yeTT+d41YR1waYxTc5Bd
 T4+M7fs3YGU3VAFz5Z4x5ebJS2VVu2nc0Gr8k0I9FoeOpd8fgsz2+Eq1cH1rHA+wDMBk
 1Q6ChDaOdmPEdDyuCoVq4hCgOOrYHVvYr1sjvH0Nh4mOAHYjGQJ0SdHzxeElwooU6+oq
 e6j/j+IyPeLmMcJQh4dlO6sUgLLzcuQ9SzDT5jHdoYfZFUjM4Io1VBLbRsjSWzKW97RH
 Ecdg==
X-Gm-Message-State: APjAAAX0SBkxKR5lmyBZcy4W7qiRG3/gtWDNz/I6snvCYEeJ+xBef1nn
 JKLL+KLP8ib41OoEWTt4mi7ZSw==
X-Received: by 2002:a63:5945:: with SMTP id j5mr4740469pgm.452.1567019114863; 
 Wed, 28 Aug 2019 12:05:14 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f27sm2967944pgm.60.2019.08.28.12.05.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 12:05:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 28 Aug 2019 12:03:59 -0700
Message-Id: <20190828190456.30315-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190828190456.30315-1-richard.henderson@linaro.org>
References: <20190828190456.30315-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
Subject: [Qemu-arm] [PATCH v3 12/69] target/arm: Convert MSR (immediate) and
 hints
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
X-TUID: r2JgWX7ZFXhh

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 60 +++++++++++++++++++++++++++++-------------
 target/arm/a32.decode  | 25 ++++++++++++++++++
 target/arm/t32.decode  | 17 ++++++++++++
 3 files changed, 84 insertions(+), 18 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index fad07499d2..d1599db2df 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8256,6 +8256,44 @@ DO_SMLAWX(SMLAWT, 1, 1)
 
 #undef DO_SMLAWX
 
+/*
+ * MSR (immediate) and hints
+ */
+
+static bool trans_YIELD(DisasContext *s, arg_YIELD *a)
+{
+    gen_nop_hint(s, 1);
+    return true;
+}
+
+static bool trans_WFE(DisasContext *s, arg_WFE *a)
+{
+    gen_nop_hint(s, 2);
+    return true;
+}
+
+static bool trans_WFI(DisasContext *s, arg_WFI *a)
+{
+    gen_nop_hint(s, 3);
+    return true;
+}
+
+static bool trans_NOP(DisasContext *s, arg_NOP *a)
+{
+    return true;
+}
+
+static bool trans_MSR_imm(DisasContext *s, arg_MSR_imm *a)
+{
+    uint32_t val = ror32(a->imm, a->rot * 2);
+    uint32_t mask = msr_mask(s, a->mask, a->r);
+
+    if (gen_set_psr_im(s, mask, a->r, val)) {
+        unallocated_encoding(s);
+    }
+    return true;
+}
+
 /*
  * Legacy decoder.
  */
@@ -8529,21 +8567,9 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
             }
             store_reg(s, rd, tmp);
         } else {
-            if (((insn >> 12) & 0xf) != 0xf)
-                goto illegal_op;
-            if (((insn >> 16) & 0xf) == 0) {
-                gen_nop_hint(s, insn & 0xff);
-            } else {
-                /* CPSR = immediate */
-                val = insn & 0xff;
-                shift = ((insn >> 8) & 0xf) * 2;
-                val = ror32(val, shift);
-                i = ((insn & (1 << 22)) != 0);
-                if (gen_set_psr_im(s, msr_mask(s, (insn >> 16) & 0xf, i),
-                                   i, val)) {
-                    goto illegal_op;
-                }
-            }
+            /* MSR (immediate) and hints */
+            /* All done in decodetree.  Illegal ops already signalled.  */
+            g_assert_not_reached();
         }
     } else if ((insn & 0x0f900000) == 0x01000000
                && (insn & 0x00000090) != 0x00000090) {
@@ -10480,9 +10506,7 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
                             goto illegal_op;
                         break;
                     case 2: /* cps, nop-hint.  */
-                        if (((insn >> 8) & 7) == 0) {
-                            gen_nop_hint(s, insn & 0xff);
-                        }
+                        /* nop hints in decodetree */
                         /* Implemented as NOP in user mode.  */
                         if (IS_USER(s))
                             break;
diff --git a/target/arm/a32.decode b/target/arm/a32.decode
index 19d12e726b..3d5c5408f9 100644
--- a/target/arm/a32.decode
+++ b/target/arm/a32.decode
@@ -22,6 +22,7 @@
 # All insns that have 0xf in insn[31:28] are in a32-uncond.decode.
 #
 
+&empty
 &s_rrr_shi       s rd rn rm shim shty
 &s_rrr_shr       s rn rd rm rs shty
 &s_rri_rot       s rn rd imm rot
@@ -152,3 +153,27 @@ SMULBB           .... 0001 0110 .... 0000 .... 1000 ....      @rd0mn
 SMULBT           .... 0001 0110 .... 0000 .... 1100 ....      @rd0mn
 SMULTB           .... 0001 0110 .... 0000 .... 1010 ....      @rd0mn
 SMULTT           .... 0001 0110 .... 0000 .... 1110 ....      @rd0mn
+
+# MSR (immediate) and hints
+
+&msr_i           r mask rot imm
+@msr_i           ---- .... .... mask:4 .... rot:4 imm:8       &msr_i
+
+{
+  {
+    YIELD        ---- 0011 0010 0000 1111 ---- 0000 0001
+    WFE          ---- 0011 0010 0000 1111 ---- 0000 0010
+    WFI          ---- 0011 0010 0000 1111 ---- 0000 0011
+
+    # TODO: Implement SEV, SEVL; may help SMP performance.
+    # SEV        ---- 0011 0010 0000 1111 ---- 0000 0100
+    # SEVL       ---- 0011 0010 0000 1111 ---- 0000 0101
+
+    # The canonical nop ends in 00000000, but the whole of the
+    # rest of the space executes as nop if otherwise unsupported.
+    NOP          ---- 0011 0010 0000 1111 ---- ---- ----
+  }
+  # Note mask = 0 is covered by NOP
+  MSR_imm        .... 0011 0010 .... 1111 .... .... ....      @msr_i r=0
+}
+MSR_imm          .... 0011 0110 .... 1111 .... .... ....      @msr_i r=1
diff --git a/target/arm/t32.decode b/target/arm/t32.decode
index 122a0537ed..ccb7cdd4ef 100644
--- a/target/arm/t32.decode
+++ b/target/arm/t32.decode
@@ -19,6 +19,7 @@
 # This file is processed by scripts/decodetree.py
 #
 
+&empty           !extern
 &s_rrr_shi       !extern s rd rn rm shim shty
 &s_rrr_shr       !extern s rn rd rm rs shty
 &s_rri_rot       !extern s rn rd imm rot
@@ -166,3 +167,19 @@ QADD             1111 1010 1000 .... 1111 .... 1000 ....      @rndm
 QSUB             1111 1010 1000 .... 1111 .... 1010 ....      @rndm
 QDADD            1111 1010 1000 .... 1111 .... 1001 ....      @rndm
 QDSUB            1111 1010 1000 .... 1111 .... 1011 ....      @rndm
+
+# Branches and miscellaneous control
+
+{
+  YIELD          1111 0011 1010 1111 1000 0000 0000 0001
+  WFE            1111 0011 1010 1111 1000 0000 0000 0010
+  WFI            1111 0011 1010 1111 1000 0000 0000 0011
+
+  # TODO: Implement SEV, SEVL; may help SMP performance.
+  # SEV          1111 0011 1010 1111 1000 0000 0000 0100
+  # SEVL         1111 0011 1010 1111 1000 0000 0000 0101
+
+  # The canonical nop ends in 0000 0000, but the whole rest
+  # of the space is "reserved hint, behaves as nop".
+  NOP            1111 0011 1010 1111 1000 0000 ---- ----
+}
-- 
2.17.1


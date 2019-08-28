Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp1210701wrs;
        Wed, 28 Aug 2019 13:05:18 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwmI7Mb0DaSBLQy0+VYVAePKNK0T5HsCHy5z0sYiAN9yiFKBzDku6pmle7SlUXLbbCe/XVX
X-Received: by 2002:aa7:d3d9:: with SMTP id o25mr5846887edr.141.1567022718553;
        Wed, 28 Aug 2019 13:05:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567022718; cv=none;
        d=google.com; s=arc-20160816;
        b=pmKcxrO9xP+SdQF9raN7NyEwipoFc+5CbbQhLjkaK2EHF8d7yYJR9un/28nKoMhHsv
         rsu8c+199EAl7wRfN93jJN1FI4FXR32nTjEdmOIWHausHC9AA+xf+wZx456aFE5vXcIM
         j1c1uKTavVMP98oOlsM59/Pj6nq460xgUJRGJnRZ93LzuYpwtiihtZHb3cLAqvFkBOeZ
         /U5D+ZRbH/LH08wopMwN0qphsFHF+BvlV9CP4nH8xmgV8+3NGntQDg/uFnutxzQ+mgfo
         RB8YUdjQgJGjLBrE8xnR0DB7Qb/UOJYJp+mCoKKD4ZHG2wMlrGLI+XDaMatBsGSJc9JP
         TLzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=0cedwX4DK0/sfFpeHztWA8eKQ1Bah4RqDcJrQgER7Gk=;
        b=ynri/0347FZT9Zc8e3gm1pJRjbpQoCK7sO78To/BxHw18Fdot4p154W9BksTq8lVLO
         hPJocevuSZKZOuuKampG3KfLRFuADHYSFdLmaU8Y2FrIeZ7t2BK/sgUvGEHNdnldjf2y
         U75KkuQDEVjrJQ/DZD8fTmS6djT+LYjQSy3KwHkW+ANEoyOFGMNUJy/c+lVq3pwZZ55n
         VV7J23HRMpjIw6RdaY/fcAFKHaW8PNqmk4vVqlXWEEYpX6AdkqCBvUNdGQTFUtzZzlIA
         jfdFoJorJpA2zpyR2sBEdbphpuDeN69QnkY1ySTU0WxdbUo9VAqLL3lVVaK+UB8RByu1
         +OWA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=werfGZE5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k57si1888831edd.28.2019.08.28.13.05.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Aug 2019 13:05:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=werfGZE5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i34Bw-0003fv-Q0
	for alex.bennee@linaro.org; Wed, 28 Aug 2019 16:05:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38923)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i33H0-00041Y-E4
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 15:06:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i33Gw-0000lh-EC
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 15:06:24 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:40936)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i33Gu-0000js-JN
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 15:06:20 -0400
Received: by mail-pg1-x541.google.com with SMTP id w10so218118pgj.7
 for <qemu-devel@nongnu.org>; Wed, 28 Aug 2019 12:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=0cedwX4DK0/sfFpeHztWA8eKQ1Bah4RqDcJrQgER7Gk=;
 b=werfGZE5VVd/hf8PnlMChhJrB29+q4Dg5aOW4EiOonfGluNy6bFFNS7oMN2twnNGGC
 /fhlUXOxoDdBVrUtXj1JCJ/ZVuIFsAFyqBU/mM6SkKyZnu624XBLqwwFb1fQPtKdgTOp
 jYNMHz5VWAfRtEfKxtrN4riKH9IyoOgbI4e/FXjlLJ4+07s0XRCD5K0C8F3j9u1Vb2st
 SVxpaEu44QU+BiQpBUYLOETZUGHUyRtlEEozAaqeatgz3/lqJibj4FRV5UsQ22bxxRy6
 gNligeP1d+8BQgWCCu+A0L7Vv2IIh9zq4ISsb+FGPruyL4JdS/oARqwhfX/IcrGJ1I24
 XJFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=0cedwX4DK0/sfFpeHztWA8eKQ1Bah4RqDcJrQgER7Gk=;
 b=ovqqDp7aUm2sNS6OcCal6mySQVY6YTMzkuftzwlTeAj74TaMpuNex1kA/dB+5bFZ0o
 8U7B57ly5/rcfUtZg112+Yn0a+a3Q/5r28ouy7WIEdYSrG6zbG7uEcAwNvj0FijoSEvl
 U4CoxnHRZlLfX0CwMBDYGNSQ/X6fAznc9NdEgWz7mQ3rXdxt6B1wMN8GyCa9WK/+YHC9
 qWXzz/pjBR/IY/1WCe0dQo2NDpZcyTnEKR0PHHEPPyg5pj5f95eQHboM8CVSDjfDOeWf
 nCc+MNs4RPzYFzq82OF32XbgagoyGHE1U47DQnBPANipaOlUY1Mc/QutqSV2SiFflQ1r
 7Meg==
X-Gm-Message-State: APjAAAUlZ/72WviwzWb+NCJhnZUzTqD5h4e8KIzy9uDdPs23h+KEnWVf
 h6qNLYGW9o4ZFAeeKCVuN3OaoX2fBQM=
X-Received: by 2002:a63:f401:: with SMTP id g1mr4988782pgi.314.1567019178379; 
 Wed, 28 Aug 2019 12:06:18 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f27sm2967944pgm.60.2019.08.28.12.06.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 12:06:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 28 Aug 2019 12:04:49 -0700
Message-Id: <20190828190456.30315-63-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190828190456.30315-1-richard.henderson@linaro.org>
References: <20190828190456.30315-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
Subject: [Qemu-devel] [PATCH v3 62/69] target/arm: Convert T16,
 Conditional branches, Supervisor call
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
X-TUID: w5jYVMyeRpdx

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 26 +++-----------------------
 target/arm/t16.decode  | 12 ++++++++++++
 2 files changed, 15 insertions(+), 23 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 5ee4dfe3a2..854c9fe10d 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10698,7 +10698,7 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
 
 static void disas_thumb_insn(DisasContext *s, uint32_t insn)
 {
-    uint32_t val, op, rm, rd, shift, cond;
+    uint32_t val, op, rm, rd, shift;
     int32_t offset;
     TCGv_i32 tmp;
     TCGv_i32 tmp2;
@@ -10837,28 +10837,8 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
         }
         break;
 
-    case 13:
-        /* conditional branch or swi */
-        cond = (insn >> 8) & 0xf;
-        if (cond == 0xe)
-            goto undef;
-
-        if (cond == 0xf) {
-            /* swi */
-            gen_set_pc_im(s, s->base.pc_next);
-            s->svc_imm = extract32(insn, 0, 8);
-            s->base.is_jmp = DISAS_SWI;
-            break;
-        }
-        /* generate a conditional jump to next instruction */
-        arm_skip_unless(s, cond);
-
-        /* jump to the offset */
-        val = read_pc(s);
-        offset = ((int32_t)insn << 24) >> 24;
-        val += offset << 1;
-        gen_jmp(s, val);
-        break;
+    case 13: /* conditional branch or swi, in decodetree */
+        goto illegal_op;
 
     case 14:
         if (insn & (1 << 11)) {
diff --git a/target/arm/t16.decode b/target/arm/t16.decode
index 55fadce223..cbc64f4e48 100644
--- a/target/arm/t16.decode
+++ b/target/arm/t16.decode
@@ -28,11 +28,13 @@
 &rr              !extern rd rm
 &ri              !extern rd imm
 &r               !extern rm
+&i               !extern imm
 &ldst_rr         !extern p w u rn rt rm shimm shtype
 &ldst_ri         !extern p w u rn rt imm
 &ldst_block      !extern rn i b u w list
 &setend          !extern E
 &cps             !extern mode imod M A I F
+&ci              !extern cond imm
 
 # Set S if the instruction is outside of an IT block.
 %s               !function=t16_setflags
@@ -231,3 +233,13 @@ STM             1011 010 ......... \
                 &ldst_block i=0 b=1 u=0 w=1 rn=13 list=%push_list
 LDM_t16         1011 110 ......... \
                 &ldst_block i=1 b=0 u=0 w=1 rn=13 list=%pop_list
+
+# Conditional branches, Supervisor call
+
+%imm8_0x2       0:s8 !function=times_2
+
+{
+  UDF           1101 1110 ---- ----
+  SVC           1101 1111 imm:8                 &i
+  B_cond_thumb  1101 cond:4 ........            &ci imm=%imm8_0x2
+}
-- 
2.17.1


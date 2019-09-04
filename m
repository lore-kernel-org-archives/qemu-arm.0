Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1158241wrp;
        Wed, 4 Sep 2019 13:21:42 -0700 (PDT)
X-Google-Smtp-Source: APXvYqziD3QuBsnxfeD33Tr+qTKaJgVuB/BCgSqF65574A3Bd66uX0RheuB+dX4YsZcKG3YAye8R
X-Received: by 2002:ac8:198b:: with SMTP id u11mr24456921qtj.108.1567628502342;
        Wed, 04 Sep 2019 13:21:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567628502; cv=none;
        d=google.com; s=arc-20160816;
        b=koDu70B8ykK0bikG2LLHudNdpBhwngeP1SVnKCFc4GB9vt8yRNjEWBOseDqkWLJBPo
         RaNAqAL1X0tae5wJu8nuA5iSkouqlnLntKB25g+JwBxVRi6lGoTZPwQgywURq1ASl7PN
         PgsAeZeM2Cd9Bw0HPMsWik52VqW/gp1F8PndA9SxKlXZPd7WcD5awuWBVUELrTBMlGtv
         AqfVxPSd8kosPcz/S7rqXIDSulQRUt+1JL6higyl58b0RH1KYmRDnLOMgM0+lsa8bPpo
         cx5SDNPfCyNU9uLwRKMvhG7H9A58fjMcRrT7OIYLRt1og4mtY4P42go5GYJkbyjJf5tL
         TsrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=fMRa2kGO1W6JycMdagL8+nOz15aN9a5pAkRiDJ3RJXk=;
        b=ZDiUkP2ntjjxJk0zSzBme6ZEK15JAROq4Q5LzZsJ9f/wwouN7NrnhCmSgsTa7n0+z2
         nPT1TYgxFheKSghTTqW181tiLwPEHElNtcTfgchzsjkx2gxXdk9JxOZPnV9k1TjFft2C
         uKCNObrgtPYXdfh2zlC3yuIbn2kEmhH9Z6yTnx+2KkNgcuyivWjj7SCeLdKotgaSG99l
         Ay5XsPgHJM8wR4dZbTMBMfNx6kRhRrPJoevngiF7sxuFPXTccIhhtC9wAKhueGNl1E0p
         yqPAXfxQhXOvJMJTtVInUF/CtV4QCwxIB1XUCsrPTfe6hB86/Swa/4PtNLh/5i1ZwAF7
         +igA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=t9LNCLqq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s18si44941qkj.236.2019.09.04.13.21.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2019 13:21:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=t9LNCLqq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i5bmf-0006M8-7k
	for alex.bennee@linaro.org; Wed, 04 Sep 2019 16:21:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41281)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i5b0w-0005XQ-5C
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 15:32:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i5b0s-00039o-4V
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 15:32:22 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:38492)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i5b0r-00035G-MG
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 15:32:17 -0400
Received: by mail-pg1-x541.google.com with SMTP id d10so7223689pgo.5
 for <qemu-devel@nongnu.org>; Wed, 04 Sep 2019 12:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=fMRa2kGO1W6JycMdagL8+nOz15aN9a5pAkRiDJ3RJXk=;
 b=t9LNCLqqeK9QG+WOaFCZF8UD/ZNxAlbiKE59zZVqeg29cGvwLhpNXZ9Mk2/VZaDhIL
 Yk4rKljlbV+t7T/mB04uEEBWJPUjYPyUYiZTJfaFDTpFZdIpNDZQeuuRA6kRb/SNCb0C
 ast6nklDU97wbUjwBw6OY/gxbN1geFzoYvIX5ijd18aYNlM6NeSBJ+PNxKPR5ucTsmnh
 VujDO4DhgUB/VuuHNb8C4QLHI+3tuzyFOR61UqJKTxBxsEtjN/4CjJODcdC5H6s+r7MN
 Br5hQJA9OxydauMkXJ+5pkk3Gd4ilpWk37mnMAt7fdW8yaOeP1qqPXSBh5iF+4CDYcnL
 2pUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=fMRa2kGO1W6JycMdagL8+nOz15aN9a5pAkRiDJ3RJXk=;
 b=RXbJAUnjGlvrzk/d6wmDl98HxgLF5vj07NBYkdBKz69MIMwFtpZGWg6Yog3ftLPgJD
 lZzyPorR2n0ek/6TIPG3NrjMKAlfnoEaVIYNHlu06OO2NXx9SENkRKlgk8n8wwzQ+R8W
 3CNeprxS++h2uY5O0a/VePLn+8jNe5eZnslw3/vG/t3De9aGcb0l+TgvsalrSjGGTyQN
 QK/WIh5AL6zAYplYieqTmSsqv2B0TgxGYtlRfm6kk/z7tATlXxcLQz6DzXiSI6we/NpO
 UoJuyMsQUWzRMlUv9iCoHUncqCAVrmrQRzWGOC66jugZayc1N4h00sFyI2PwvzAEvKiy
 e4+A==
X-Gm-Message-State: APjAAAW9567M18ieJvp2U0AIa9PVFaa8xnPP87s1ixay2KCHAZwRCm9A
 NJ8MCiOYzX++wo7K+agkG7d7fGg0434=
X-Received: by 2002:a65:6557:: with SMTP id a23mr36594161pgw.439.1567625533378; 
 Wed, 04 Sep 2019 12:32:13 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f6sm18999174pga.50.2019.09.04.12.32.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 12:32:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  4 Sep 2019 12:30:47 -0700
Message-Id: <20190904193059.26202-58-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190904193059.26202-1-richard.henderson@linaro.org>
References: <20190904193059.26202-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
Subject: [Qemu-devel] [PATCH v4 57/69] target/arm: Convert T16,
 Change processor state
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
X-TUID: 9HEIY5J42Bd5

Add a check for ARMv6 in trans_CPS.  We had this correct in
the T16 path, but had previously forgotten the check on the
A32 and T32 paths.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v3: Fix cps architecture checks.  Rename s/v6m/v7m/g
---
 target/arm/translate.c | 84 +++++++++++++++++++-----------------------
 target/arm/t16.decode  | 12 ++++++
 2 files changed, 50 insertions(+), 46 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 09c05de320..ce394ddb00 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -7496,6 +7496,11 @@ static int negate(DisasContext *s, int x)
     return -x;
 }
 
+static int plus_2(DisasContext *s, int x)
+{
+    return x + 2;
+}
+
 static int times_2(DisasContext *s, int x)
 {
     return x * 2;
@@ -10268,7 +10273,7 @@ static bool trans_CPS(DisasContext *s, arg_CPS *a)
 {
     uint32_t mask, val;
 
-    if (arm_dc_feature(s, ARM_FEATURE_M)) {
+    if (!ENABLE_ARCH_6 || arm_dc_feature(s, ARM_FEATURE_M)) {
         return false;
     }
     if (IS_USER(s)) {
@@ -10302,6 +10307,36 @@ static bool trans_CPS(DisasContext *s, arg_CPS *a)
     return true;
 }
 
+static bool trans_CPS_v7m(DisasContext *s, arg_CPS_v7m *a)
+{
+    TCGv_i32 tmp, addr;
+
+    if (!arm_dc_feature(s, ARM_FEATURE_M)) {
+        return false;
+    }
+    if (IS_USER(s)) {
+        /* Implemented as NOP in user mode.  */
+        return true;
+    }
+
+    tmp = tcg_const_i32(a->im);
+    /* FAULTMASK */
+    if (a->F) {
+        addr = tcg_const_i32(19);
+        gen_helper_v7m_msr(cpu_env, addr, tmp);
+        tcg_temp_free_i32(addr);
+    }
+    /* PRIMASK */
+    if (a->I) {
+        addr = tcg_const_i32(16);
+        gen_helper_v7m_msr(cpu_env, addr, tmp);
+        tcg_temp_free_i32(addr);
+    }
+    tcg_temp_free_i32(tmp);
+    gen_lookup_tb(s);
+    return true;
+}
+
 /*
  * Clear-Exclusive, Barriers
  */
@@ -10908,51 +10943,8 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
             break;
         }
 
-        case 6:
-            switch ((insn >> 5) & 7) {
-            case 2:
-                /* setend */
-                ARCH(6);
-                if (((insn >> 3) & 1) != !!(s->be_data == MO_BE)) {
-                    gen_helper_setend(cpu_env);
-                    s->base.is_jmp = DISAS_UPDATE;
-                }
-                break;
-            case 3:
-                /* cps */
-                ARCH(6);
-                if (IS_USER(s)) {
-                    break;
-                }
-                if (arm_dc_feature(s, ARM_FEATURE_M)) {
-                    tmp = tcg_const_i32((insn & (1 << 4)) != 0);
-                    /* FAULTMASK */
-                    if (insn & 1) {
-                        addr = tcg_const_i32(19);
-                        gen_helper_v7m_msr(cpu_env, addr, tmp);
-                        tcg_temp_free_i32(addr);
-                    }
-                    /* PRIMASK */
-                    if (insn & 2) {
-                        addr = tcg_const_i32(16);
-                        gen_helper_v7m_msr(cpu_env, addr, tmp);
-                        tcg_temp_free_i32(addr);
-                    }
-                    tcg_temp_free_i32(tmp);
-                    gen_lookup_tb(s);
-                } else {
-                    if (insn & (1 << 4)) {
-                        shift = CPSR_A | CPSR_I | CPSR_F;
-                    } else {
-                        shift = 0;
-                    }
-                    gen_set_psr_im(s, ((insn & 7) << 6), 0, shift);
-                }
-                break;
-            default:
-                goto undef;
-            }
-            break;
+        case 6: /* setend, cps; in decodetree */
+            goto illegal_op;
 
         default:
             goto undef;
diff --git a/target/arm/t16.decode b/target/arm/t16.decode
index b5b5086e8a..032902a1f4 100644
--- a/target/arm/t16.decode
+++ b/target/arm/t16.decode
@@ -29,6 +29,8 @@
 &ldst_rr         !extern p w u rn rt rm shimm shtype
 &ldst_ri         !extern p w u rn rt imm
 &ldst_block      !extern rn i b u w list
+&setend          !extern E
+&cps             !extern mode imod M A I F
 
 # Set S if the instruction is outside of an IT block.
 %s               !function=t16_setflags
@@ -183,3 +185,13 @@ SXTAH           1011 0010 00 ... ...            @extend
 SXTAB           1011 0010 01 ... ...            @extend
 UXTAH           1011 0010 10 ... ...            @extend
 UXTAB           1011 0010 11 ... ...            @extend
+
+# Change processor state
+
+%imod           4:1 !function=plus_2
+
+SETEND          1011 0110 010 1 E:1 000         &setend
+{
+  CPS           1011 0110 011 . 0 A:1 I:1 F:1   &cps mode=0 M=0 %imod
+  CPS_v7m       1011 0110 011 im:1 00 I:1 F:1
+}
-- 
2.17.1


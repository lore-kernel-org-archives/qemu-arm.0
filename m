Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp1215785wrs;
        Wed, 28 Aug 2019 13:09:42 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxkyoDSeUnGz0GiYSEWBlisokZt5JYC5e/lNPdc0J4ARRZ7RErM/l6MoaWkcnNE4/FsnIjK
X-Received: by 2002:a17:906:b7c9:: with SMTP id fy9mr4705585ejb.237.1567022982247;
        Wed, 28 Aug 2019 13:09:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567022982; cv=none;
        d=google.com; s=arc-20160816;
        b=jNtvRajwB+Z7tsPOq8hRAGbIyXMX2OUTgXf+idu8dUmzMcZMw3U4HpJGg/gfg+Q308
         GKh9dwsfcmkvUKFetQh93svaCBY0n4G65AUcquSRU9yKVqfF9xj5YIOj7fPWdrrztYOj
         fRrGMWKqAdx+UhaicAksa+URCCQ5LLlUQ669/llNxvc9psFqbWMNcHw15y+rur7Z25pL
         VYV/mHegPEmBRyWC6eW9YtaN9MDn6XMYKBJ3KsXTgh/pGeli0fAlFEpwKOg9kB0MKzzK
         +HcYJg7BQUaIzNXXJcMev3o1pQhtegj1tSGhZaWH4FbZSUNRbZuRYCW5nF2EOiVFgyjx
         cMig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=sXpbzk4XyeAvgkyELetXWo1a4Xmvrd+/ykw0k9l5t7I=;
        b=Tp31mGP1m5edk2ZPuV/gMR5X7qFbwsJ4YKAH2MS+/XLQNSOO/fTxk/eV33KUuKPKpH
         Dx9EWMtoSiDo91OSwWU7il6LbFVu0WGSIGiqRTpJsZGYq9K0ZuggCwAYZUSWxz9EJQ74
         eB0HIICWZYHjhZl6ayaqjF44t0vpkP4U/SE1XE03XidVnPLXlxQzjhGt9TUvdTASu95y
         NtmPGKpNt/jIwjL582jmVS1eTv9x0n7Cur4wFncwRf+Dmv9B77Sh+k2KrrdbsaS9qLy4
         7uLTTtUH0x2A6ApUEgwV6VvN6vCJh80xpyUP47QgeBxFT7q//MuOv4l0ueYxKyAmqaHP
         PeeQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CMTj6+GH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ks15si28454ejb.228.2019.08.28.13.09.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Aug 2019 13:09:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CMTj6+GH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i34GD-0000kF-2H
	for alex.bennee@linaro.org; Wed, 28 Aug 2019 16:09:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38790)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i33Gs-0003xX-AN
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 15:06:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i33Gq-0000i2-9X
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 15:06:18 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:37064)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i33Go-0000fC-Ub
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 15:06:15 -0400
Received: by mail-pg1-x544.google.com with SMTP id d1so226674pgp.4
 for <qemu-devel@nongnu.org>; Wed, 28 Aug 2019 12:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=sXpbzk4XyeAvgkyELetXWo1a4Xmvrd+/ykw0k9l5t7I=;
 b=CMTj6+GHWPzs68ULrhbI44cIyFv4/xbbuBXa7TRuQijsXp7rCrjEUgYvivg+Nw1/Ru
 LcnOoeIn1ImyL22J3LFJqcaX2Upr9xv48OyhbiP9KUkNxAETBeLnyjcLVugvA5UMzE9q
 6jBjHvwHztx4YiT+eIUzY+FB29AX5fZaaKtXtedfVguJDImXllG+NwSbMy/T3cmlVsM6
 TQbzupbQprSJ3gz8hcOPnYsNdnnhPBOIYCakqntSQSCRHJhi69ZPP+BHk/S4HEtoTvqV
 Wa5Qp70NdZoNCzb2RPTCwhSgFwoiDTPek3lSg3tt5kvSvxRkQMMwgstQ2Slvwb1Kcci2
 9MYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=sXpbzk4XyeAvgkyELetXWo1a4Xmvrd+/ykw0k9l5t7I=;
 b=JQrUVIF+qM8b+t7iCCvxPl8wiw1fRTqEZt8Xr/3qUZzjfNxLDHZa1zHA2TcqD1ngvu
 7p6FUpw1h/pLjcQJJyq2rd5NYJVOdQBw3ePDr/HWTYPH6C9kpdnTj1lDDHV4ASm7EObX
 nzPe/TIny0GteE3/W0rcVyqcRxSxbKQsgovefXxEC1EO9zmGCYGE1DyXvehxyYEifQSA
 Jp6z9+OJwvD7y6mTXLvjQLK1gn0K4dNfYtw5Pb2zLrUmHw+uLmFjVoG7oAFGR4RxXm3F
 zHLohmI+WNhyEkXPgCpfzVSqzAPZzkuT2mKZ/TXtOwgkUVktujGd89agbFHplmBx/PB8
 lqEA==
X-Gm-Message-State: APjAAAXdCOrQb9OQQAoy8JYhIj1unCqFaFXAYKeUdPyNhz2onG9YEh7P
 82Yy6ra43JSWPlVTmKYieMVFsa063Hg=
X-Received: by 2002:a63:a302:: with SMTP id s2mr4800116pge.125.1567019172264; 
 Wed, 28 Aug 2019 12:06:12 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f27sm2967944pgm.60.2019.08.28.12.06.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 12:06:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 28 Aug 2019 12:04:44 -0700
Message-Id: <20190828190456.30315-58-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190828190456.30315-1-richard.henderson@linaro.org>
References: <20190828190456.30315-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
Subject: [Qemu-devel] [PATCH v3 57/69] target/arm: Convert T16,
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
X-TUID: nintWIh4mpnt

Add a check for ARMv6 in trans_CPS.  We had this correct in
the T16 path, but had previously forgotten the check on the
A32 and T32 paths.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v3: Fix cps architecture checks.  Rename s/v6m/v7m/g
---
 target/arm/translate.c | 84 +++++++++++++++++++-----------------------
 target/arm/t16.decode  | 12 ++++++
 2 files changed, 50 insertions(+), 46 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index d06ec48ab9..1dacae1a5b 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -7470,6 +7470,11 @@ static int negate(DisasContext *s, int x)
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
@@ -10245,7 +10250,7 @@ static bool trans_CPS(DisasContext *s, arg_CPS *a)
 {
     uint32_t mask, val;
 
-    if (arm_dc_feature(s, ARM_FEATURE_M)) {
+    if (!ENABLE_ARCH_6 || arm_dc_feature(s, ARM_FEATURE_M)) {
         return false;
     }
     if (IS_USER(s)) {
@@ -10279,6 +10284,36 @@ static bool trans_CPS(DisasContext *s, arg_CPS *a)
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
@@ -10885,51 +10920,8 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
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


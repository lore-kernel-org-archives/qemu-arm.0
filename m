Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp207736wrv;
        Fri, 26 Jul 2019 10:51:40 -0700 (PDT)
X-Received: by 2002:a17:902:100a:: with SMTP id b10mr56847176pla.338.1564163500856;
        Fri, 26 Jul 2019 10:51:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564163500; cv=none;
        d=google.com; s=arc-20160816;
        b=izNE25HQRU1Ynst20YlCMG7lnHY15fzFE7vDR3oxyqbtWeGVJRTAQ2lIPyAOmT1pmA
         Ebwhb/FQ8uunw1ftTvQiRwwnJjfshLgi3P/G/59tXxa2G4u7z/YhTmxclbFpl05WxmVw
         rzhKYYloOfe057w+BgfklpNaaNJ+bW1JrcHxelXq19hQjZ5+0W4PgM7YHw3ZxueBBv2Y
         8kqhZJ3ReWp77/YLX/rI3SPE1GUwGUAhF4SSiMlcHJbHV6236zx5XxiPQpoWHuizQPe2
         wGetEtCCR6vgsj96q/2ndvvpHPy5/xhFuExHhW7epCBZbnUls0Z37E5QlpeJ72w8L2pZ
         9ALQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=qeYs/8P06sT88x1fm+VX2RboOfuM1870Y9rpmWOvTNY=;
        b=QU2mxxqWAX8JnQe85PsooV8P3gJbdCYLj2CXMK9Z3H6ncHMJrBPNiCt1EPDISXm5RW
         HbvafynAFNZBg0PHJuTgk2ot1i7mGCGaCg7u7hyFcsoNmWs4KUdt+fphW/k2/vqTXroj
         o2TtVbCZSP3djMaXXHDaY7zaMEPaiIMc68t6zU61TQkFjL6pQosK9gGc3jDyPQ4dqdL5
         DGHbLP1YxDj4aDfR6igBuAoxUdBaBHv439T3LJhQCI3PXqNfMZnrGCz5JMl/B4CnZTcu
         mresnZwezl6VslgrSlqylcyAVu2h/8Zh4E3S2CAqwCbnqCjzrouL85R7NnCPNoIo8ISY
         y6MQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yQ3jutNB;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id f89sor64903316plb.5.2019.07.26.10.51.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 26 Jul 2019 10:51:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yQ3jutNB;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=qeYs/8P06sT88x1fm+VX2RboOfuM1870Y9rpmWOvTNY=;
        b=yQ3jutNBhJLz4jBCk1TzF98u6da0i8ITj42pLZcF/8tNMCnmPEK/FGue1OrihmFZzA
         wRMe4XhlTsudTRVI05ErFLXxAz+QvaxTWFX1IXDFdhgYghGQNWS/k1DWBJ3SfGFWIdRj
         eGEZJuixaTHCGaelA6nYHa3q0VtOyBpgblzUNZ9F0B49DAcTlkOhfvs+cK85hPrrG0xm
         rDrg/ZlN+CVVN3vD38GbYwA5hxY8dvMb4/gJeEVWeMz79Ifhm/ZHaA1Sg+OjOYAJBluB
         odItBAJ8OqixFNdVmPKEczhf+HWQ7BcQlF5k9TRB3BWqHztzn6NT8mQglN/kOpVLtg1r
         H1+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=qeYs/8P06sT88x1fm+VX2RboOfuM1870Y9rpmWOvTNY=;
        b=IkINXAwAmpuNKmNJDD9wtPEBe32nN2ZfH5JkffGpTR4kZ5QyJlBXNZYlRueRXyZME1
         dNUYg3vb7t8ThfIervvyhhBHr+V+dgs+UIowzMF/RL70zzn08CHT3cv4SmcCFpOLOW5c
         dKP7N4dXTHHBsGIpaRbxbtwiNst7w63AD3hoqctICkUFyHGuCeic5eVTCvGSSDXWg7w5
         PYHLIaqK1PYnj4uGAF2YPaGF/97YV4kXg3shjydo2bHHv/lmQnzQnVYt+dVZau2eDEgR
         B92GFb/cXIAIG1/Km4drF3IJhxbduOpubEqED1PhG6Mo4k0L39UWjzLLqSIEJnRPSZn7
         feXg==
X-Gm-Message-State: APjAAAUG21bxjPwE4rbWVS2/XxwvCxKyYeWMnMZeD3ys+mp3Io6yhcOM
	+w9/Q0dAnjZy99bglN/11eC53wAg
X-Google-Smtp-Source: APXvYqxKJDbn7SwD0+5ZWTdy4GmoIFg0GR78Yzy0RBwVJPjYxL2TKRTeDtC6Q/pi8eEvRGgn55czUA==
X-Received: by 2002:a17:90a:30aa:: with SMTP id h39mr99848190pjb.32.1564163500297;
        Fri, 26 Jul 2019 10:51:40 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-117-207.tukw.qwest.net. [97.126.117.207])
        by smtp.gmail.com with ESMTPSA id o24sm104287919pfp.135.2019.07.26.10.51.39
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 26 Jul 2019 10:51:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH 55/67] target/arm: Convert T16, Change processor state
Date: Fri, 26 Jul 2019 10:50:20 -0700
Message-Id: <20190726175032.6769-56-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190726175032.6769-1-richard.henderson@linaro.org>
References: <20190726175032.6769-1-richard.henderson@linaro.org>
X-TUID: /a5q69JAXxeI

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 85 ++++++++++++++++++++----------------------
 target/arm/t16.decode  | 12 ++++++
 2 files changed, 52 insertions(+), 45 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 9c8e11bd3a..8f2adbbc7d 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -7531,6 +7531,11 @@ static int negate(DisasContext *s, int x)
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
@@ -10163,6 +10168,9 @@ static bool trans_CPS(DisasContext *s, arg_CPS *a)
 {
     uint32_t mask, val;
 
+    if (ENABLE_ARCH_6 && arm_dc_feature(s, ARM_FEATURE_M)) {
+        return false;
+    }
     if (IS_USER(s)) {
         /* Implemented as NOP in user mode.  */
         return true;
@@ -10193,6 +10201,36 @@ static bool trans_CPS(DisasContext *s, arg_CPS *a)
     return true;
 }
 
+static bool trans_CPS_v6m(DisasContext *s, arg_CPS_v6m *a)
+{
+    TCGv_i32 tmp, addr;
+
+    if (!(ENABLE_ARCH_6 && arm_dc_feature(s, ARM_FEATURE_M))) {
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
@@ -10793,51 +10831,8 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
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
index 1b47e804bf..f43ea6ce20 100644
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
+  CPS_v6m       1011 0110 011 im:1 00 I:1 F:1
+  CPS           1011 0110 011 . 0 A:1 I:1 F:1   &cps mode=0 M=0 %imod
+}
-- 
2.17.1

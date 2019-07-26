Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp207267wrv;
        Fri, 26 Jul 2019 10:51:14 -0700 (PDT)
X-Received: by 2002:a17:902:b68f:: with SMTP id c15mr98469008pls.104.1564163474136;
        Fri, 26 Jul 2019 10:51:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564163474; cv=none;
        d=google.com; s=arc-20160816;
        b=WLdOXB7DO9Uk3eqTw9Jw+1Zt9BEML8PsMOCrThv1B7DRTODJCqyo7bjlJbnMZY29bn
         gRW1TRnVRK1wcSEDzRL2BgzPZ/8SKV4v4BmJ8nluQe+AF3kkbcvtjaxPkBarpJki/KyV
         dpVqSD2ve9+TaWOP0gVDRgORulBsyToroz12yhH6N2i18EJAqVa+8Ek+FMuNWyXXXhAI
         SU46qNbSr2fyMmfMbmXFiniLpi5cuJqjkXawTasbfzF9x1tfJEISV4KX//T64YIl2ZKo
         UIWyZahGlcA2G0W9xTJXjQGaOKgp9Nquka6f24cIs/kBWVdfMkLdjYkA1+Pbvi+IoJhj
         +3lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=VzkvUsUZh9EVbOcurylb0EvE0t9ji9eIajoY1fu0OlU=;
        b=PtSzHAyVj/FINbiwNy1eFVnsQHdSBb6sJktii//Zzxe6bbinsJfb31pI9qKb/vBofX
         SPYEoUNg3rZXPCLIHHUWy0Le754V00Y82UtbKxT3q5GQ6et/tQGdA+vq4CnbW8ND7Msr
         qAroCJN7PYfNWX7094/QjnR8B+LozSaK3BMkXvEe/K9X2ji2D08wIO5zD144lwnBNQT0
         SRFzzzUcChwGx+jC01/5uF8pLMDTCyeQteacOHPiDYbAh7mnzOPJQqI7zU0v+ipfRAcl
         DuRtPHSjl5HbP00JeUNrwiUcxUK7r7OkStWsueDjVPpoy1P1qqe1QxgizA208SA4tFYd
         GvZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JTiaH8qg;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o21sor64981523pll.8.2019.07.26.10.51.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 26 Jul 2019 10:51:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JTiaH8qg;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=VzkvUsUZh9EVbOcurylb0EvE0t9ji9eIajoY1fu0OlU=;
        b=JTiaH8qg13W5L7ZBXSUJXBfgCem9ARL1uiQFgjSz3GSsuW+K63GFGoVMb1eXI/kHqS
         j5hIjUWGgN1EPPkz2rr1n64pKilRQCsxioGELbw3wawI+4wddJNXnP1nhoWD8pNmyV+C
         mNdpGdJaP81pZoxCI7PxFV7p6yVbbTITfQIw2go7rFoCe9x7xUaeBIACssl/3OzYWVCu
         ZY+9QXhV0w6pPtg4I9FY8QkZLOQp4g2sbKK8TBKlGAtn5myrOZEnDGIg/POrKhl92QWA
         8lj0WeCyZz+FbWjo0mJ9pL4EKimeh8qPjin+JDCX8JxUhY/7WK2QK+16mujg8FbpX1GH
         n4lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=VzkvUsUZh9EVbOcurylb0EvE0t9ji9eIajoY1fu0OlU=;
        b=DdP7jzJoS9VeXK2n0GkXIz6D9Q0B8zEw6JxPlN0+siCdn5V+o6z2vKeviB/iXnxPah
         hZVBrbPouvEqyAF23c1DIG709Hc7cMOF9gu89RK5Lq2o0r0ksnIqUMToeTJNOnNGzXIc
         lYBYD6CyHQRBPDfZINu9pgRKpfx2V0yNSYurvUSb/aaUVDte/rYwkERAKdVPuBDcggdW
         X/hQg3rN2RNJAgOa/0JVCbB8rNFC43PV1wwVlFmBemGrasDQCtjY+f45qeCh7S4taIcy
         QFQa1iKMy78fRz/iAWIoR6RRq6fcEtqPb7eLwilx7nCJp7+aOhQzDKnHXe6AQGRRi4OH
         DCrQ==
X-Gm-Message-State: APjAAAXVtyXITYU6Xg+z1dgqzNDwD4sddprZA4YslD6fhabHh7NMN77u
	pcU4wfFJ3tJebZ7Q3SJzzExE6KeKDuLYLA==
X-Google-Smtp-Source: APXvYqxWWCMF/SkQ5z4AGVssYKZpV0IvQ5lNu0WWehVYQr1IZCsGOhBghnGhwiVr2MoONTwazEpk0g==
X-Received: by 2002:a17:902:aa83:: with SMTP id d3mr94715985plr.74.1564163473666;
        Fri, 26 Jul 2019 10:51:13 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-117-207.tukw.qwest.net. [97.126.117.207])
        by smtp.gmail.com with ESMTPSA id o24sm104287919pfp.135.2019.07.26.10.51.12
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 26 Jul 2019 10:51:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH 33/67] target/arm: Convert Clear-Exclusive, Barriers
Date: Fri, 26 Jul 2019 10:49:58 -0700
Message-Id: <20190726175032.6769-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190726175032.6769-1-richard.henderson@linaro.org>
References: <20190726175032.6769-1-richard.henderson@linaro.org>
X-TUID: DvrA87nXAtFP

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c       | 122 +++++++++++++++--------------------
 target/arm/a32-uncond.decode |  10 +++
 target/arm/t32.decode        |  10 +++
 3 files changed, 73 insertions(+), 69 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index b43b344f96..797e8f7344 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10049,6 +10049,58 @@ static bool trans_SRS(DisasContext *s, arg_SRS *a)
     return true;
 }
 
+/*
+ * Clear-Exclusive, Barriers
+ */
+
+static bool trans_CLREX(DisasContext *s, arg_CLREX *a)
+{
+    if (!ENABLE_ARCH_6K) {
+        return false;
+    }
+    gen_clrex(s);
+    return true;
+}
+
+static bool trans_DSB(DisasContext *s, arg_DSB *a)
+{
+    if (!s->thumb && !ENABLE_ARCH_7) {
+        return false;
+    }
+    tcg_gen_mb(TCG_MO_ALL | TCG_BAR_SC);
+    return true;
+}
+
+static bool trans_DMB(DisasContext *s, arg_DMB *a)
+{
+    return trans_DSB(s, NULL);
+}
+
+static bool trans_ISB(DisasContext *s, arg_ISB *a)
+{
+    /*
+     * We need to break the TB after this insn to execute
+     * self-modifying code correctly and also to take
+     * any pending interrupts immediately.
+     */
+    gen_goto_tb(s, 0, s->pc & ~1);
+    return true;
+}
+
+static bool trans_SB(DisasContext *s, arg_SB *a)
+{
+    if (!dc_isar_feature(aa32_sb, s)) {
+        return false;
+    }
+    /*
+     * TODO: There is no speculation barrier opcode
+     * for TCG; MB and end the TB instead.
+     */
+    tcg_gen_mb(TCG_MO_ALL | TCG_BAR_SC);
+    gen_goto_tb(s, 0, s->pc & ~1);
+    return true;
+}
+
 /*
  * Legacy decoder.
  */
@@ -10142,38 +10194,6 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
                 s->base.is_jmp = DISAS_UPDATE;
             }
             return;
-        } else if ((insn & 0x0fffff00) == 0x057ff000) {
-            switch ((insn >> 4) & 0xf) {
-            case 1: /* clrex */
-                ARCH(6K);
-                gen_clrex(s);
-                return;
-            case 4: /* dsb */
-            case 5: /* dmb */
-                ARCH(7);
-                tcg_gen_mb(TCG_MO_ALL | TCG_BAR_SC);
-                return;
-            case 6: /* isb */
-                /* We need to break the TB after this insn to execute
-                 * self-modifying code correctly and also to take
-                 * any pending interrupts immediately.
-                 */
-                gen_goto_tb(s, 0, s->pc & ~1);
-                return;
-            case 7: /* sb */
-                if ((insn & 0xf) || !dc_isar_feature(aa32_sb, s)) {
-                    goto illegal_op;
-                }
-                /*
-                 * TODO: There is no speculation barrier opcode
-                 * for TCG; MB and end the TB instead.
-                 */
-                tcg_gen_mb(TCG_MO_ALL | TCG_BAR_SC);
-                gen_goto_tb(s, 0, s->pc & ~1);
-                return;
-            default:
-                goto illegal_op;
-            }
         } else if ((insn & 0x0e000f00) == 0x0c000100) {
             if (arm_dc_feature(s, ARM_FEATURE_IWMMXT)) {
                 /* iWMMXt register transfer.  */
@@ -10636,43 +10656,7 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
                             gen_set_psr_im(s, offset, 0, imm);
                         }
                         break;
-                    case 3: /* Special control operations.  */
-                        if (!arm_dc_feature(s, ARM_FEATURE_V7) &&
-                            !arm_dc_feature(s, ARM_FEATURE_M)) {
-                            goto illegal_op;
-                        }
-                        op = (insn >> 4) & 0xf;
-                        switch (op) {
-                        case 2: /* clrex */
-                            gen_clrex(s);
-                            break;
-                        case 4: /* dsb */
-                        case 5: /* dmb */
-                            tcg_gen_mb(TCG_MO_ALL | TCG_BAR_SC);
-                            break;
-                        case 6: /* isb */
-                            /* We need to break the TB after this insn
-                             * to execute self-modifying code correctly
-                             * and also to take any pending interrupts
-                             * immediately.
-                             */
-                            gen_goto_tb(s, 0, s->pc & ~1);
-                            break;
-                        case 7: /* sb */
-                            if ((insn & 0xf) || !dc_isar_feature(aa32_sb, s)) {
-                                goto illegal_op;
-                            }
-                            /*
-                             * TODO: There is no speculation barrier opcode
-                             * for TCG; MB and end the TB instead.
-                             */
-                            tcg_gen_mb(TCG_MO_ALL | TCG_BAR_SC);
-                            gen_goto_tb(s, 0, s->pc & ~1);
-                            break;
-                        default:
-                            goto illegal_op;
-                        }
-                        break;
+                    case 3: /* Special control operations, in decodetree */
                     case 4: /* bxj, in decodetree */
                     case 5: /* eret, in decodetree */
                     case 6: /* MRS, in decodetree */
diff --git a/target/arm/a32-uncond.decode b/target/arm/a32-uncond.decode
index 3b961233e5..b077958cec 100644
--- a/target/arm/a32-uncond.decode
+++ b/target/arm/a32-uncond.decode
@@ -22,6 +22,7 @@
 # All of those that have a COND field in insn[31:28] are in a32.decode
 #
 
+&empty           !extern
 &i               !extern imm
 
 # Branch with Link and Exchange
@@ -37,3 +38,12 @@ BLX_i            1111 101 . ........................          &i imm=%imm24h
 
 RFE              1111 100 pu:2 0 w:1 1 rn:4 0000 1010 0000 0000   &rfe
 SRS              1111 110 pu:2 1 w:1 0 1101 0000 0101 000 mode:5  &srs
+
+# Clear-Exclusive, Barriers
+
+# QEMU does not require the option field for the barriers.
+CLREX            1111 0101 0111 1111 1111 0000 0001 1111
+DSB              1111 0101 0111 1111 1111 0000 0100 ----
+DMB              1111 0101 0111 1111 1111 0000 0101 ----
+ISB              1111 0101 0111 1111 1111 0000 0110 ----
+SB               1111 0101 0111 1111 1111 0000 0111 0000
diff --git a/target/arm/t32.decode b/target/arm/t32.decode
index 26b51c3bb2..9fe1500fe0 100644
--- a/target/arm/t32.decode
+++ b/target/arm/t32.decode
@@ -306,6 +306,16 @@ CLZ              1111 1010 1011 ---- 1111 .... 1000 ....      @rdm
       # of the space is "reserved hint, behaves as nop".
       NOP        1111 0011 1010 1111 1000 0000 ---- ----
     }
+
+    # Miscelaneous control
+    {
+      CLREX      1111 0011 1011 1111 1000 1111 0010 1111
+      DSB        1111 0011 1011 1111 1000 1111 0100 ----
+      DMB        1111 0011 1011 1111 1000 1111 0101 ----
+      ISB        1111 0011 1011 1111 1000 1111 0110 ----
+      SB         1111 0011 1011 1111 1000 1111 0111 0000
+    }
+
     # Note that the v7m insn overlaps both the normal and banked insn.
     {
       MRS_bank   1111 0011 111 r:1 .... 1000 rd:4   001. 0000  \
-- 
2.17.1

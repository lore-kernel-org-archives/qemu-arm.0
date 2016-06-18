Received: by 10.25.21.96 with SMTP id l93csp539163lfi;
        Fri, 17 Jun 2016 21:05:32 -0700 (PDT)
X-Received: by 10.13.207.131 with SMTP id r125mr3081997ywd.246.1466222724861;
        Fri, 17 Jun 2016 21:05:24 -0700 (PDT)
Return-Path: <bobby.prani@gmail.com>
Received: from mail-yw0-x243.google.com (mail-yw0-x243.google.com. [2607:f8b0:4002:c05::243])
        by mx.google.com with ESMTPS id m64si14485161yba.245.2016.06.17.21.05.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 17 Jun 2016 21:05:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of bobby.prani@gmail.com designates 2607:f8b0:4002:c05::243 as permitted sender) client-ip=2607:f8b0:4002:c05::243;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of bobby.prani@gmail.com designates 2607:f8b0:4002:c05::243 as permitted sender) smtp.mailfrom=bobby.prani@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-yw0-x243.google.com with SMTP id d137so4907537ywe.0;
        Fri, 17 Jun 2016 21:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=pGBf5ilaOqbnU+GkG36mCjT8l5OD1mhtVmp+d4Se7J0=;
        b=wK9HLs1I7U5V64/iHwQhUK/Tzgqx3M8dub7aMhvKGMJbcTx6nJG9Z36sof2E3XbwEc
         Ck/R4ZdqGMUep50qPH8fiNAosoumMJ14kgME4KoCk8M3Tz1MewkGfgWbPX4wRrkh5tJb
         Tw9e/ycc6G352Vk4qL/AWlmyqg3qDpcPxyizeZ0bOEj1BKJKtM3u6koKtMom2R3Y+puj
         1cMcOPe7vyBfxGw4URnhRgcBaf8HyS3QjBUc1cYg1vVZSmLWGJC9mhuw1gXty97I9WAU
         IXKty2QjyA5IyQ477byoZROKpa88V1D4kcdvsvQdFRJW0KPkaZSQEA0Fpd/CxLlexazZ
         0wtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=pGBf5ilaOqbnU+GkG36mCjT8l5OD1mhtVmp+d4Se7J0=;
        b=l8e4yjPPJgNmUhNiprszbMlD+qytoOB4EHg0boWjtKHIxosTOiKsgY0bC5AnxBzEdo
         iSa/PJSjk8PHsFEnvvGZ9atyikOo2Jldph/Bvl8fS0x9V2QfnwPiYDjnPXhP6WtK4wun
         IE+JTQWTcAg2TZ7VPIi29goM0GrH+Tn2dVI1al/dCIy3U46OH22qqilsmi3W7RgeCmHM
         2JBtfS4Rv33x8Cyml5aPgfpvVoCy1FxslCcexCbRWKQugXp8boQD3JxnZ1OwobPf/+HQ
         pnIFoUKmCqRfBau+n1MoVZ+amdRPs2PiccYvrCdE131Az4/r6hE04q76df02ECHvMN5z
         ehIA==
X-Gm-Message-State: ALyK8tLgyHw9c4/T1ymRqsvJO9btNQugqnfUxBVqPDzIiQJbedEsSGvTD1HWfYDUEkl3tA==
X-Received: by 10.129.71.3 with SMTP id u3mr3350017ywa.143.1466222724580;
        Fri, 17 Jun 2016 21:05:24 -0700 (PDT)
Return-Path: <bobby.prani@gmail.com>
Received: from evgadesktop.attlocal.net (108-232-152-155.lightspeed.tukrga.sbcglobal.net. [108.232.152.155])
        by smtp.gmail.com with ESMTPSA id q7sm19517992ywg.16.2016.06.17.21.05.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 17 Jun 2016 21:05:24 -0700 (PDT)
From: Pranith Kumar <bobby.prani@gmail.com>
To: Andrzej Zaborowski <balrogg@gmail.com>,
	Richard Henderson <rth@twiddle.net>,
	qemu-arm@nongnu.org (open list:ARM target),
	qemu-devel@nongnu.org (open list:All patches CC here)
Cc: alex.bennee@linaro.org,
	serge.fdrv@gmail.com,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [RFC v3 PATCH 04/14] tcg/arm: Add support for fence
Date: Sat, 18 Jun 2016 00:03:33 -0400
Message-Id: <20160618040343.19517-5-bobby.prani@gmail.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160618040343.19517-1-bobby.prani@gmail.com>
References: <20160618040343.19517-1-bobby.prani@gmail.com>
X-TUID: K2yPPFMelQUf

Cc: Andrzej Zaborowski <balrogg@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Pranith Kumar <bobby.prani@gmail.com>
Signed-off-by: Richard Henderson <rth@twiddle.net>
---
 tcg/arm/tcg-target.inc.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/tcg/arm/tcg-target.inc.c b/tcg/arm/tcg-target.inc.c
index f9f54c6..1447aa8 100644
--- a/tcg/arm/tcg-target.inc.c
+++ b/tcg/arm/tcg-target.inc.c
@@ -313,6 +313,10 @@ typedef enum {
     INSN_LDRD_REG  = 0x000000d0,
     INSN_STRD_IMM  = 0x004000f0,
     INSN_STRD_REG  = 0x000000f0,
+
+    INSN_DMB_ISH   = 0x5bf07ff5,
+    INSN_DMB_MCR   = 0xba0f07ee,
+
 } ARMInsn;
 
 #define SHIFT_IMM_LSL(im)	(((im) << 7) | 0x00)
@@ -1066,6 +1070,15 @@ static inline void tcg_out_goto_label(TCGContext *s, int cond, TCGLabel *l)
     }
 }
 
+static inline void tcg_out_mb(TCGContext *s, TCGArg a0)
+{
+    if (use_armv7_instructions) {
+        tcg_out32(s, INSN_DMB_ISH);
+    } else if (use_armv6_instructions) {
+        tcg_out32(s, INSN_DMB_MCR);
+    }
+}
+
 #ifdef CONFIG_SOFTMMU
 /* helper signature: helper_ret_ld_mmu(CPUState *env, target_ulong addr,
  *                                     int mmu_idx, uintptr_t ra)
@@ -1923,6 +1936,10 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_udiv(s, COND_AL, args[0], args[1], args[2]);
         break;
 
+    case INDEX_op_mb:
+        tcg_out_mb(s, args[0]);
+        break;
+
     case INDEX_op_mov_i32:  /* Always emitted via tcg_out_mov.  */
     case INDEX_op_movi_i32: /* Always emitted via tcg_out_movi.  */
     case INDEX_op_call:     /* Always emitted via tcg_out_call.  */
@@ -1997,6 +2014,7 @@ static const TCGTargetOpDef arm_op_defs[] = {
     { INDEX_op_div_i32, { "r", "r", "r" } },
     { INDEX_op_divu_i32, { "r", "r", "r" } },
 
+    { INDEX_op_mb, { } },
     { -1 },
 };
 
-- 
2.9.0

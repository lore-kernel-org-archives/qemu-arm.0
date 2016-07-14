Received: by 10.25.21.156 with SMTP id 28csp272595lfv;
        Thu, 14 Jul 2016 13:20:58 -0700 (PDT)
X-Received: by 10.37.78.133 with SMTP id c127mr11278725ybb.102.1468527652325;
        Thu, 14 Jul 2016 13:20:52 -0700 (PDT)
Return-Path: <bobby.prani@gmail.com>
Received: from mail-yw0-x242.google.com (mail-yw0-x242.google.com. [2607:f8b0:4002:c05::242])
        by mx.google.com with ESMTPS id 20si1687641ybn.208.2016.07.14.13.20.52
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 14 Jul 2016 13:20:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of bobby.prani@gmail.com designates 2607:f8b0:4002:c05::242 as permitted sender) client-ip=2607:f8b0:4002:c05::242;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of bobby.prani@gmail.com designates 2607:f8b0:4002:c05::242 as permitted sender) smtp.mailfrom=bobby.prani@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-yw0-x242.google.com with SMTP id c13so5574034ywh.2;
        Thu, 14 Jul 2016 13:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=wmp9o4dxBoE+rb2qlhN/nF6Jyh3UF3FBLw4JrGAXL0w=;
        b=YSTYPF5kChaFq2RSWjPXLFJFdxVkfN5XpKqYzSbrhyvG3m8yPwHK2/kz4wLpiLJZYe
         /uXCwqkMRTyaSii7hcUS/QhbGcKNARiYMtgpqaT6IFJYhWXMoXlQe7P6ZpwlejH/jrDH
         zyX0CvnFNdbWb46x6kPdWfI2DOzYcwjJLwvuWnxlCIkBi8yLjjpWCz3iihcRLbzHiSHK
         qDBlV9uBDsY9pgDq+apDQzym0ntl7iVBmk/rpM4rFDz2LFX9eStOHDJ5jIjMmVjPr687
         jjXNasXnzHQgTh6YK9QXhTlDZOij/bwj80p6Ets3iPciZrUAFZkFOkYD88xwEtNi+iQp
         z1CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=wmp9o4dxBoE+rb2qlhN/nF6Jyh3UF3FBLw4JrGAXL0w=;
        b=YKk4IzdG12lFn16Um6soBBfL70VolAh5jWWRKjLVcXO4A6q/5ENoUEcW/z4C2+RfJe
         6La8ZImNwAl+G/JmqR87rfFaXdO+XJchp2uQD6wMWmm+lRPPl0NRsXlxGyusSP4fUk3j
         JTO8Pi7cwUJ4LAGt2LpohnoDg2hsz6c7iPF2Fertm65G7w++u1U0faOU2HZv+l0pvwSs
         RSF2Sg+PE8MRvR5YZcjvskKy7tDp9XQv+7Mc5X+Xm2VD/vPiXJbIWK8X8p0zOiRaLF04
         Ct44B7oR8/pzrGGBwTr2IJRq4QPpw6flQ9shgvYs73eSzJ5PCmpfAndU++Z6rDxar6En
         eHGQ==
X-Gm-Message-State: ALyK8tIeWyrVANEq4lMHkP9PL/i/st1EVhM1s6E8Zz2V9/Kwn5rZMSfnyiJlnjSKxU3Rfg==
X-Received: by 10.129.153.149 with SMTP id q143mr12311518ywg.229.1468527652020;
        Thu, 14 Jul 2016 13:20:52 -0700 (PDT)
Return-Path: <bobby.prani@gmail.com>
Received: from evgadesktop.attlocal.net (108-232-152-155.lightspeed.tukrga.sbcglobal.net. [108.232.152.155])
        by smtp.gmail.com with ESMTPSA id v68sm1634604ywg.31.2016.07.14.13.20.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 14 Jul 2016 13:20:51 -0700 (PDT)
From: Pranith Kumar <bobby.prani@gmail.com>
To: Andrzej Zaborowski <balrogg@gmail.com>,
	Richard Henderson <rth@twiddle.net>,
	qemu-arm@nongnu.org (open list:ARM target),
	qemu-devel@nongnu.org (open list:All patches CC here)
Cc: qemu-devel@nongnu.org,
	alex.bennee@linaro.org,
	serge.fdrv@gmail.com,
	pbonzini@redhat.com,
	peter.maydell@linaro.org
Subject: [PATCH v4 04/14] tcg/arm: Add support for fence
Date: Thu, 14 Jul 2016 16:20:16 -0400
Message-Id: <20160714202026.9727-5-bobby.prani@gmail.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160714202026.9727-1-bobby.prani@gmail.com>
References: <20160714202026.9727-1-bobby.prani@gmail.com>
X-TUID: 1rtGb02wxSWF

Cc: Andrzej Zaborowski <balrogg@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Pranith Kumar <bobby.prani@gmail.com>
Signed-off-by: Richard Henderson <rth@twiddle.net>
---
 tcg/arm/tcg-target.inc.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/tcg/arm/tcg-target.inc.c b/tcg/arm/tcg-target.inc.c
index 172feba..4e66bcd 100644
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

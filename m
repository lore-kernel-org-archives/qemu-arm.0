Received: by 10.25.159.19 with SMTP id i19csp857840lfe;
        Fri, 12 Feb 2016 06:36:50 -0800 (PST)
X-Received: by 10.98.87.90 with SMTP id l87mr2641680pfb.70.1455287810673;
        Fri, 12 Feb 2016 06:36:50 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-pa0-x244.google.com (mail-pa0-x244.google.com. [2607:f8b0:400e:c03::244])
        by mx.google.com with ESMTPS id e18si20405055pfj.30.2016.02.12.06.36.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 12 Feb 2016 06:36:50 -0800 (PST)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c03::244 as permitted sender) client-ip=2607:f8b0:400e:c03::244;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c03::244 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-pa0-x244.google.com with SMTP id gc2so140375pab.3;
        Fri, 12 Feb 2016 06:36:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=SmM2B3KV1b/pATlDE0gMmxecdlk99h3EFEl8iVnC0fY=;
        b=yXCZoY6J4Sq/myrN4imoIw5B6liUoUVJrN+RIDHnp93RAuKzQNhuCYvXCLYEGfvTFc
         j5/7pNAmZeaxsVYsgLxgW4SyyRRwgp13jTyA7FrkofBK2/0Sl/7jEyQ8Ew9e7XPfLOgS
         YGKV9aXiZdJMr8rKG6O8Hgovoc4azv0w4itnkXWulfreAR4tya3bCipSafpv+UTKG0sY
         0AZ5LVBNOu/WH/PVPlb53rVMmmIXyXW1x+YD2Fud+Kzkb/7KF4O9g2cRE8fs0am5TFWM
         nqzmVbGiyO8yICTP0Din/O42kJ4dCGIUZIIvxfe3IH6ttBK5q1pgI5iLkgPfPoWVjBGl
         nWag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=SmM2B3KV1b/pATlDE0gMmxecdlk99h3EFEl8iVnC0fY=;
        b=OyBp6skQx9f0FWpM5z3uGpPvoCkm2IMkFYVzyEMBVLXRAKQk26UL3HN2vycxpU2eRK
         10TisgkGl8am1wU90nKf6fSifpb97gJsmJImnSA99jKTonGZ/RMvbyrRthLIxsniu6N3
         rpmeiXO96KQv6CAq6j1xsHvr2n7YOUw25v0/SR/w4vsnTXGuGSik3Z2JNfeMLhJ1XK3P
         YjYQXseLlZCvoc7rsU5LWM22L/S58Q/y0jSJMUV9hDlj491eHNrhZb+JJev6Ob8yGtM2
         f+U5DjjIV98If+Q6p/+UzIUl2/+oW398yBihiqZGHBLNARTyHA56jWcRFrzdq5WaJ0Dp
         eZ0w==
X-Gm-Message-State: AG10YOTwVoW69O+dcgAGcxThnYspQONlFvzY19sUDlzhvr2RL9Lj65tvMEgU8bl+vHKwlw==
X-Received: by 10.66.218.225 with SMTP id pj1mr2460140pac.83.1455287810339;
        Fri, 12 Feb 2016 06:36:50 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from localhost (ec2-52-8-89-49.us-west-1.compute.amazonaws.com. [52.8.89.49])
        by smtp.gmail.com with ESMTPSA id o90sm20017195pfi.17.2016.02.12.06.36.48
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 12 Feb 2016 06:36:49 -0800 (PST)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alex.bennee@linaro.org,
	serge.fdrv@gmail.com,
	rth@twiddle.net,
	qemu-arm@nongnu.org,
	edgar.iglesias@xilinx.com
Subject: [PATCH v1 4/9] target-arm: Add more fields to the data abort syndrome generator
Date: Fri, 12 Feb 2016 15:33:57 +0100
Message-Id: <1455287642-28166-5-git-send-email-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1455287642-28166-1-git-send-email-edgar.iglesias@gmail.com>
References: <1455287642-28166-1-git-send-email-edgar.iglesias@gmail.com>
X-TUID: EZZHMhdYqMNH

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Add the following flags to the data abort syndrome generator:
* isv - Instruction syndrome valid
* sas - Syndrome access size
* sse - Syndrome sign extend
* srt - Syndrome register transfer
* sf  - Sixty-Four bit register width
* ar  - Acquire/Release

These flags are not yet used, so this patch has no functional change.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 target-arm/internals.h | 16 ++++++++++++++--
 target-arm/op_helper.c |  8 ++++++--
 2 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/target-arm/internals.h b/target-arm/internals.h
index b1c483b..0934709 100644
--- a/target-arm/internals.h
+++ b/target-arm/internals.h
@@ -359,13 +359,25 @@ static inline uint32_t syn_insn_abort(int same_el, int ea, int s1ptw, int fsc)
         | (ea << 9) | (s1ptw << 7) | fsc;
 }
 
-static inline uint32_t syn_data_abort(int same_el, int ea, int cm, int s1ptw,
+static inline uint32_t syn_data_abort(int same_el, int isv,
+                                      int sas, int sse, int srt,
+                                      int sf, int ar,
+                                      int ea, int cm, int s1ptw,
                                       int wnr, int fsc,
                                       bool is_thumb)
 {
-    return (EC_DATAABORT << ARM_EL_EC_SHIFT) | (same_el << ARM_EL_EC_SHIFT)
+    uint32_t v;
+
+    v = (EC_DATAABORT << ARM_EL_EC_SHIFT) | (same_el << ARM_EL_EC_SHIFT)
         | (is_thumb ? 0 : ARM_EL_IL)
         | (ea << 9) | (cm << 8) | (s1ptw << 7) | (wnr << 6) | fsc;
+
+    /* Insn Syndrome fields are RES0 if ISV is unset.  */
+    if (isv) {
+        v |= (isv << 24) | (sas << 22) | (sse << 21) | (srt << 16)
+             | (sf << 15) | (ar << 14);
+    }
+    return v;
 }
 
 static inline uint32_t syn_swstep(int same_el, int isv, int ex)
diff --git a/target-arm/op_helper.c b/target-arm/op_helper.c
index 4e629e1..9bf635f 100644
--- a/target-arm/op_helper.c
+++ b/target-arm/op_helper.c
@@ -115,7 +115,9 @@ void tlb_fill(CPUState *cs, target_ulong addr, int is_write, int mmu_idx,
             syn = syn_insn_abort(same_el, 0, fi.s1ptw, syn);
             exc = EXCP_PREFETCH_ABORT;
         } else {
-            syn = syn_data_abort(same_el, 0, 0, fi.s1ptw, is_write == 1, syn,
+            syn = syn_data_abort(same_el,
+                                 0, 0, 0, 0, 0, 0,
+                                 0, 0, fi.s1ptw, is_write == 1, syn,
                                  env->thumb);
             if (is_write == 1 && arm_feature(env, ARM_FEATURE_V6)) {
                 fsr |= (1 << 11);
@@ -162,7 +164,9 @@ void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr, int is_write,
     }
 
     raise_exception(env, EXCP_DATA_ABORT,
-                    syn_data_abort(same_el, 0, 0, 0, is_write == 1, 0x21,
+                    syn_data_abort(same_el,
+                                   0, 0, 0, 0, 0, 0,
+                                   0, 0, 0, is_write == 1, 0x21,
                                    env->thumb),
                     target_el);
 }
-- 
1.9.1

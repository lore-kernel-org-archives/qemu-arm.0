Received: by 10.25.208.137 with SMTP id h131csp819674lfg;
        Fri, 29 Apr 2016 05:08:19 -0700 (PDT)
X-Received: by 10.194.26.41 with SMTP id i9mr23868546wjg.114.1461931691278;
        Fri, 29 Apr 2016 05:08:11 -0700 (PDT)
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-wm0-x243.google.com (mail-wm0-x243.google.com. [2a00:1450:400c:c09::243])
        by mx.google.com with ESMTPS id gg1si16283373wjd.214.2016.04.29.05.08.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 29 Apr 2016 05:08:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 2a00:1450:400c:c09::243 as permitted sender) client-ip=2a00:1450:400c:c09::243;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 2a00:1450:400c:c09::243 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-wm0-x243.google.com with SMTP id r12so4569562wme.0;
        Fri, 29 Apr 2016 05:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=B8+M59l7BLs+E+0716H5mAerkTN5ZcjYG7wBkzZZRkg=;
        b=FcFNyX1XNEcg/TS0h0baZKjliDEJY+LIodFjy9CtXTmsAVnPm6bPAV1Pq/sa7JGRjI
         UN9VqkR9FKlZdKzjCfZbN1VsdQkUbMtXChgypLZ3FwUWYtLbfxBKlXLxwnvxSjDm33gB
         0yHlbGUWcelrzjSCy/+zhe9NCG/5H3bz11Xpk5TNIVx7ChkRuAUHKFHCekorrusNhyGi
         rxJgaDY/MH/bwApoIHOuQtOKh1bqTsYsoNmidTR7n+l2yJZ5WBRbEkczGzm816kqndF0
         XdAbcNxd3YCced/2OD0CLlccWbG20E02I4ctH4wf30sfqq8D5CHK7RD6SD+nWuAOtEGU
         LGqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=B8+M59l7BLs+E+0716H5mAerkTN5ZcjYG7wBkzZZRkg=;
        b=j9Jv6C+w2S2hjz6rRjKafN0Mhfyn6hb0R4TntBHe4p5PoZMEnnmLxlB59xbYGqs7zq
         yJEbH0yrkR1d+eBE3ganECvFiL71HahcyRpjnp9DXyvEP2VxsGT1c7tYqaUUCaJ3nnCO
         +2o8RiSXiTB9RRLViU0g3iSdjNZqX95JEr7m22/tWgJKlFR9eiUoRuIZj5GKib51fRr4
         5KazQ1vbgrG+5MW/4IvAYERuv+hBCaYLb6MYNqfgv8ASDQj1pSXdfwgmfJgJVqYJUlZn
         +MCxOtvdR77qTQhuEO77NGE8G81zB9w/leliifW8xTALef4aJfRWiwuchOESmL/yDT6a
         QtLw==
X-Gm-Message-State: AOPr4FXF2VOOVsx3ha9164Xpm9ojh8rjrObp79vURO5SLP5g4t+iCNGlA0+ahZYTu7bUMA==
X-Received: by 10.28.194.69 with SMTP id s66mr3787196wmf.88.1461931691037;
        Fri, 29 Apr 2016 05:08:11 -0700 (PDT)
Return-Path: <edgar.iglesias@gmail.com>
Received: from localhost (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
        by smtp.gmail.com with ESMTPSA id jo6sm14460498wjb.48.2016.04.29.05.08.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 29 Apr 2016 05:08:10 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alex.bennee@linaro.org,
	serge.fdrv@gmail.com,
	rth@twiddle.net,
	qemu-arm@nongnu.org,
	edgar.iglesias@xilinx.com
Subject: [PATCH v3 4/7] target-arm: Split data abort syndrome generator
Date: Fri, 29 Apr 2016 14:08:01 +0200
Message-Id: <1461931684-1867-5-git-send-email-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1461931684-1867-1-git-send-email-edgar.iglesias@gmail.com>
References: <1461931684-1867-1-git-send-email-edgar.iglesias@gmail.com>
X-TUID: IVa6jU8Tol45

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Split the data abort syndrome generator into two versions.
One with a valid Instruction Specific Syndrome (ISS) and another without.

The following new flags are supported by the syndrome generator
with ISS:
* isv - Instruction syndrome valid
* sas - Syndrome access size
* sse - Syndrome sign extend
* srt - Syndrome register transfer
* sf  - Sixty-Four bit register width
* ar  - Acquire/Release

These flags are not yet used, so this patch has no functional change.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 target-arm/internals.h | 26 +++++++++++++++++++++-----
 target-arm/op_helper.c |  8 ++++----
 2 files changed, 25 insertions(+), 9 deletions(-)

diff --git a/target-arm/internals.h b/target-arm/internals.h
index 34e2688..54a0fb1 100644
--- a/target-arm/internals.h
+++ b/target-arm/internals.h
@@ -263,7 +263,9 @@ enum arm_exception_class {
 
 #define ARM_EL_EC_SHIFT 26
 #define ARM_EL_IL_SHIFT 25
+#define ARM_EL_ISV_SHIFT 24
 #define ARM_EL_IL (1 << ARM_EL_IL_SHIFT)
+#define ARM_EL_ISV (1 << ARM_EL_ISV_SHIFT)
 
 /* Utility functions for constructing various kinds of syndrome value.
  * Note that in general we follow the AArch64 syndrome values; in a
@@ -383,13 +385,27 @@ static inline uint32_t syn_insn_abort(int same_el, int ea, int s1ptw, int fsc)
         | (ea << 9) | (s1ptw << 7) | fsc;
 }
 
-static inline uint32_t syn_data_abort(int same_el, int ea, int cm, int s1ptw,
-                                      int wnr, int fsc,
-                                      bool is_16bit)
+static inline uint32_t syn_data_abort_no_iss(int same_el,
+                                             int ea, int cm, int s1ptw,
+                                             int wnr, int fsc)
 {
     return (EC_DATAABORT << ARM_EL_EC_SHIFT) | (same_el << ARM_EL_EC_SHIFT)
-        | (is_16bit ? 0 : ARM_EL_IL)
-        | (ea << 9) | (cm << 8) | (s1ptw << 7) | (wnr << 6) | fsc;
+           | ARM_EL_IL
+           | (ea << 9) | (cm << 8) | (s1ptw << 7) | (wnr << 6) | fsc;
+}
+
+static inline uint32_t syn_data_abort_with_iss(int same_el,
+                                               int sas, int sse, int srt,
+                                               int sf, int ar,
+                                               int ea, int cm, int s1ptw,
+                                               int wnr, int fsc,
+                                               bool is_16bit)
+{
+    return (EC_DATAABORT << ARM_EL_EC_SHIFT) | (same_el << ARM_EL_EC_SHIFT)
+           | (is_16bit ? 0 : ARM_EL_IL)
+           | ARM_EL_ISV | (sas << 22) | (sse << 21) | (srt << 16)
+           | (sf << 15) | (ar << 14)
+           | (ea << 9) | (cm << 8) | (s1ptw << 7) | (wnr << 6) | fsc;
 }
 
 static inline uint32_t syn_swstep(int same_el, int isv, int ex)
diff --git a/target-arm/op_helper.c b/target-arm/op_helper.c
index e69c1de..c7fba85 100644
--- a/target-arm/op_helper.c
+++ b/target-arm/op_helper.c
@@ -115,8 +115,8 @@ void tlb_fill(CPUState *cs, target_ulong addr, int is_write, int mmu_idx,
             syn = syn_insn_abort(same_el, 0, fi.s1ptw, syn);
             exc = EXCP_PREFETCH_ABORT;
         } else {
-            syn = syn_data_abort(same_el, 0, 0, fi.s1ptw, is_write == 1, syn,
-                                 1);
+            syn = syn_data_abort_no_iss(same_el,
+                                        0, 0, fi.s1ptw, is_write == 1, syn);
             if (is_write == 1 && arm_feature(env, ARM_FEATURE_V6)) {
                 fsr |= (1 << 11);
             }
@@ -162,8 +162,8 @@ void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr, int is_write,
     }
 
     raise_exception(env, EXCP_DATA_ABORT,
-                    syn_data_abort(same_el, 0, 0, 0, is_write == 1, 0x21,
-                                   1),
+                    syn_data_abort_no_iss(same_el,
+                                          0, 0, 0, is_write == 1, 0x21),
                     target_el);
 }
 
-- 
2.5.0

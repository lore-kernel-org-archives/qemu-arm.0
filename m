Received: by 10.25.208.137 with SMTP id h131csp819630lfg;
        Fri, 29 Apr 2016 05:08:16 -0700 (PDT)
X-Received: by 10.28.141.18 with SMTP id p18mr3503005wmd.57.1461931689946;
        Fri, 29 Apr 2016 05:08:09 -0700 (PDT)
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-wm0-x242.google.com (mail-wm0-x242.google.com. [2a00:1450:400c:c09::242])
        by mx.google.com with ESMTPS id z2si3873491wmc.19.2016.04.29.05.08.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 29 Apr 2016 05:08:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 2a00:1450:400c:c09::242 as permitted sender) client-ip=2a00:1450:400c:c09::242;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 2a00:1450:400c:c09::242 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-wm0-x242.google.com with SMTP id r12so4569374wme.0;
        Fri, 29 Apr 2016 05:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=yKBdQ6YK6bA4BzaoxH73xPxvInIkC6vIoktYHHXrWMk=;
        b=Hu6wHWvflrH4dHyIPfwuXWJ4JZMJ114aMOefw8QmNmQQrSM0jvooL/uaFeH38qWerL
         6c/oAtNpVwE9Pnf3e8PfDy0fMRip3NmzGFTpNg6uEr/duWr6+tJ0xkCtXYxBl7FTZVta
         X3XKeZsH1PTvlPxqvngZO2N6n4rJyWcCU9ezgwsvjplzMjOesS+l2CTiM8gNscFB48n5
         AdLzymu8SDx+zvVKRW2tpMUYITT6jl4DSKDZtqdLpDX57Ze2PT9748WSUprmnthkw1RC
         kg3U6C+IXLS0EyKU5LA33nqPeG1AhACEziEGPcOIK31wvnis2YP91SX4s8sYkJvj2+3R
         3b+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=yKBdQ6YK6bA4BzaoxH73xPxvInIkC6vIoktYHHXrWMk=;
        b=WUuU2TqKxm4MntnozqXjH3Lsl1FuNv+oNubvZddIzZFoOQclNlkIMvyRD1TwjeCCeg
         OfE4vAxla7a05G7fGKPrJi4ykJJp4ibg2dYUnfFVejIOITs6AdeHiV02XbfAJHbLmaJ0
         NoP6SwYC43KfJ5Uhias61VRvjADl+AyO1xJlzJsDEHILm3VTuFp/af78b42pTkRTFYYE
         2jimeU+sUVM3TpigBS2r9eL1UmGE1CWgd7BCnIkT9YP+/k7cKhP1q0kiU215lMsGgzgk
         U6ARr9xuiZkuVCsNusgrVkTgxVF2aaechq9I8zngSVLk50Qo8vYza8dOT51Fw8slNxBg
         a0ug==
X-Gm-Message-State: AOPr4FUrUG2NOB+a7+b/MX65FWqYz5WPgu8fv6+Eq5Mdu36ZtCcbovM/8eMlH6NxKiOkxw==
X-Received: by 10.194.175.36 with SMTP id bx4mr21339246wjc.35.1461931689709;
        Fri, 29 Apr 2016 05:08:09 -0700 (PDT)
Return-Path: <edgar.iglesias@gmail.com>
Received: from localhost (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
        by smtp.gmail.com with ESMTPSA id c16sm3013601wme.16.2016.04.29.05.08.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 29 Apr 2016 05:08:09 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alex.bennee@linaro.org,
	serge.fdrv@gmail.com,
	rth@twiddle.net,
	qemu-arm@nongnu.org,
	edgar.iglesias@xilinx.com
Subject: [PATCH v3 3/7] target-arm: Add the IL flag to syn_data_abort
Date: Fri, 29 Apr 2016 14:08:00 +0200
Message-Id: <1461931684-1867-4-git-send-email-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1461931684-1867-1-git-send-email-edgar.iglesias@gmail.com>
References: <1461931684-1867-1-git-send-email-edgar.iglesias@gmail.com>
X-TUID: vtFlXQ80YVdy

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Add the IL flag to syn_data_abort(). Since we at the moment
never set ISV, the IL flag is always set to one.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 target-arm/internals.h | 4 +++-
 target-arm/op_helper.c | 6 ++++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/target-arm/internals.h b/target-arm/internals.h
index 2e70272..34e2688 100644
--- a/target-arm/internals.h
+++ b/target-arm/internals.h
@@ -384,9 +384,11 @@ static inline uint32_t syn_insn_abort(int same_el, int ea, int s1ptw, int fsc)
 }
 
 static inline uint32_t syn_data_abort(int same_el, int ea, int cm, int s1ptw,
-                                      int wnr, int fsc)
+                                      int wnr, int fsc,
+                                      bool is_16bit)
 {
     return (EC_DATAABORT << ARM_EL_EC_SHIFT) | (same_el << ARM_EL_EC_SHIFT)
+        | (is_16bit ? 0 : ARM_EL_IL)
         | (ea << 9) | (cm << 8) | (s1ptw << 7) | (wnr << 6) | fsc;
 }
 
diff --git a/target-arm/op_helper.c b/target-arm/op_helper.c
index d626ff1..e69c1de 100644
--- a/target-arm/op_helper.c
+++ b/target-arm/op_helper.c
@@ -115,7 +115,8 @@ void tlb_fill(CPUState *cs, target_ulong addr, int is_write, int mmu_idx,
             syn = syn_insn_abort(same_el, 0, fi.s1ptw, syn);
             exc = EXCP_PREFETCH_ABORT;
         } else {
-            syn = syn_data_abort(same_el, 0, 0, fi.s1ptw, is_write == 1, syn);
+            syn = syn_data_abort(same_el, 0, 0, fi.s1ptw, is_write == 1, syn,
+                                 1);
             if (is_write == 1 && arm_feature(env, ARM_FEATURE_V6)) {
                 fsr |= (1 << 11);
             }
@@ -161,7 +162,8 @@ void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr, int is_write,
     }
 
     raise_exception(env, EXCP_DATA_ABORT,
-                    syn_data_abort(same_el, 0, 0, 0, is_write == 1, 0x21),
+                    syn_data_abort(same_el, 0, 0, 0, is_write == 1, 0x21,
+                                   1),
                     target_el);
 }
 
-- 
2.5.0

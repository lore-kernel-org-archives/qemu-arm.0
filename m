Received: by 10.25.208.211 with SMTP id h202csp31201lfg;
        Fri, 19 Feb 2016 12:05:16 -0800 (PST)
X-Received: by 10.66.136.231 with SMTP id qd7mr20632447pab.51.1455912316727;
        Fri, 19 Feb 2016 12:05:16 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-pa0-x236.google.com (mail-pa0-x236.google.com. [2607:f8b0:400e:c03::236])
        by mx.google.com with ESMTPS id q21si18339192pfi.231.2016.02.19.12.05.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 19 Feb 2016 12:05:16 -0800 (PST)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c03::236 as permitted sender) client-ip=2607:f8b0:400e:c03::236;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c03::236 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-pa0-x236.google.com with SMTP id fl4so55568455pad.0;
        Fri, 19 Feb 2016 12:05:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Gx8QBvmgdGYIFu2QMQkyc2UA8Us+rbB9R5hggMahBLg=;
        b=bfWcChR24MJoJGBZ9aVFhppX23dUifIwbJ1oeMiGydZuILkgnhJts3ZFtqGWR3cUaH
         Uf9ASeXZLSANAx7CHo3X3ehZ1lH4z86dIdmPMpJFfLzHNb98Rd2OOcvamF9m2Bffe6ih
         YQOhWEqxTy1PoqSdXxPZcPfHIIhftgUpWVURb7pOC3yzLIXXXk9tsAd0wV9HufLCJ5+x
         Vdkf1ZOj8b5K5B/PGAiTBwVDCc+tphZXkyHruV+nPv73onqyOw+7nr/TsjAaq5tx5aZ5
         Z4d8xyjJrLbFPX0p9JPDiE8HPXtycEPouHznzgRVdEyIk3S+G5O2Ux3gnyFPIrXu0+K2
         +uCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Gx8QBvmgdGYIFu2QMQkyc2UA8Us+rbB9R5hggMahBLg=;
        b=BF0sf9PXLv62BxsKW40HH07JYX5DVpmzJETIpSkKS2m5ypSqsEr0Foi+oykAncuaPr
         yKbzboLAMRi0o2I/mfqQFTDSTlSdzzLKlul+gmEAYW0ocNankUI2YKWmln7MFq31kQVJ
         eK7btrW/n3O8zNLYY6oLU6vIFafcwRGwUppYLrjiS2AEH6pdZy/+NqIRzqJFXDzp9GVv
         vmnpZ9JwgDtMxpeRC73pWyBvpRk/CZRC98nDSl4wcruVk920IXxZfp2cG2eZdm1+ECXy
         HMvmlDVBBdOCg+UaBlLREQnSRt4ES+vucH8NwT0hgjlXIxXb1hL9kYDIYD/HtResogWP
         VAmw==
X-Gm-Message-State: AG10YOTnHq/hSg622b73CRNQ8AJ4rV2LMOrfRm9EyHT68SuhKb4thcAj8Npmu0E+YapJ0g==
X-Received: by 10.66.191.202 with SMTP id ha10mr20737562pac.8.1455912316407;
        Fri, 19 Feb 2016 12:05:16 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from localhost (ec2-52-8-89-49.us-west-1.compute.amazonaws.com. [52.8.89.49])
        by smtp.gmail.com with ESMTPSA id r5sm19840740pap.7.2016.02.19.12.05.15
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 19 Feb 2016 12:05:15 -0800 (PST)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alex.bennee@linaro.org,
	serge.fdrv@gmail.com,
	rth@twiddle.net,
	qemu-arm@nongnu.org,
	edgar.iglesias@xilinx.com
Subject: [PATCH v2 4/8] target-arm: Add more fields to the data abort syndrome generator
Date: Fri, 19 Feb 2016 21:04:48 +0100
Message-Id: <1455912292-23807-5-git-send-email-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1455912292-23807-1-git-send-email-edgar.iglesias@gmail.com>
References: <1455912292-23807-1-git-send-email-edgar.iglesias@gmail.com>
X-TUID: IT/b8lAoxFtM

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
 target-arm/internals.h | 20 ++++++++++++++++++--
 target-arm/op_helper.c |  8 ++++++--
 2 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/target-arm/internals.h b/target-arm/internals.h
index 34e2688..4e9d9f5 100644
--- a/target-arm/internals.h
+++ b/target-arm/internals.h
@@ -383,13 +383,29 @@ static inline uint32_t syn_insn_abort(int same_el, int ea, int s1ptw, int fsc)
         | (ea << 9) | (s1ptw << 7) | fsc;
 }
 
-static inline uint32_t syn_data_abort(int same_el, int ea, int cm, int s1ptw,
+static inline uint32_t syn_data_abort(int same_el, int isv,
+                                      int sas, int sse, int srt,
+                                      int sf, int ar,
+                                      int ea, int cm, int s1ptw,
                                       int wnr, int fsc,
                                       bool is_16bit)
 {
-    return (EC_DATAABORT << ARM_EL_EC_SHIFT) | (same_el << ARM_EL_EC_SHIFT)
+    uint32_t v;
+    v = (EC_DATAABORT << ARM_EL_EC_SHIFT) | (same_el << ARM_EL_EC_SHIFT)
         | (is_16bit ? 0 : ARM_EL_IL)
         | (ea << 9) | (cm << 8) | (s1ptw << 7) | (wnr << 6) | fsc;
+
+    /* Insn Syndrome fields are RES0 if ISV is unset.  */
+    if (isv) {
+        v |= (isv << 24) | (sas << 22) | (sse << 21) | (srt << 16)
+             | (sf << 15) | (ar << 14);
+    } else {
+        /* If ISV is zero, the IL field should be set to one.
+         * See ARM ARMv8 D7.2.27 for more details.
+         */
+        v |= ARM_EL_IL;
+    }
+    return v;
 }
 
 static inline uint32_t syn_swstep(int same_el, int isv, int ex)
diff --git a/target-arm/op_helper.c b/target-arm/op_helper.c
index 7e845d5..2522d3c 100644
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
                                  1);
             if (is_write == 1 && arm_feature(env, ARM_FEATURE_V6)) {
                 fsr |= (1 << 11);
@@ -162,7 +164,9 @@ void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr, int is_write,
     }
 
     raise_exception(env, EXCP_DATA_ABORT,
-                    syn_data_abort(same_el, 0, 0, 0, is_write == 1, 0x21,
+                    syn_data_abort(same_el,
+                                   0, 0, 0, 0, 0, 0,
+                                   0, 0, 0, is_write == 1, 0x21,
                                    1),
                     target_el);
 }
-- 
1.9.1

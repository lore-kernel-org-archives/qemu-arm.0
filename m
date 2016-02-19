Received: by 10.25.208.211 with SMTP id h202csp31162lfg;
        Fri, 19 Feb 2016 12:05:12 -0800 (PST)
X-Received: by 10.66.132.73 with SMTP id os9mr20263669pab.27.1455912312290;
        Fri, 19 Feb 2016 12:05:12 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-pa0-x235.google.com (mail-pa0-x235.google.com. [2607:f8b0:400e:c03::235])
        by mx.google.com with ESMTPS id hg4si18294516pac.180.2016.02.19.12.05.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 19 Feb 2016 12:05:12 -0800 (PST)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c03::235 as permitted sender) client-ip=2607:f8b0:400e:c03::235;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c03::235 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-pa0-x235.google.com with SMTP id yy13so55472050pab.3;
        Fri, 19 Feb 2016 12:05:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=j8EN+itHVDmckinsRuSpNHzacqg4WoRKQjg4yoaKFx4=;
        b=egPoaaaudHzFJzHibMkaNA/3+OpqeGdQSlE5pnzmE0jiaDYNnaMEbHl/XxpxCDvPMN
         o98rNv9TCqxc2wtSaJnRGFPCux9grxZunBGHiGFRaa4hofSDdJDGJpXZqliG/vUu3id5
         BTsh1tFpTkY0e8G7e7rn4fjrLJ+vwWUAn4BNdiH+YFIapcoKnDrgbCDD3DYzTXZJ2s9y
         kgimxGy81euud6llQjfDe5ZyWsMPGnGcRG5o/Mci5t6g/T5RCnQEA9QY0+8F2urPzcMI
         oylOCVsnutgaXpOUpana+A4VxbanmMwO3EtMjsOhishDNb00XzrN4D6bXQ2sOvFJkW/d
         9tOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=j8EN+itHVDmckinsRuSpNHzacqg4WoRKQjg4yoaKFx4=;
        b=EvUod2sEkzKZow4HS6c0hwQOpzcu45x8wCnX4a2+EyKAmqa0ix5gtzTi0UKamIbXYZ
         D0Pd+0BXPPNoO8lcg7X5AUPNvMPEmI/26wqfNx45XIb28dtdlrHJ9/q3dSGmkdImuMRC
         zQ1UszuBTmt5gda9O0pIleGNF1QD/fyTNWHlX5t8VhssbwKkomfSlcLXbQPJ8ibS6AQD
         BqUwiX3/u+oqaiKY8cmqOnCqX7O/LctFZU+3Nj7mHmkiEycrLJHEYiyrqcyTeG05qLrN
         dP4FVs8udW1siXSt8OY8ZzBssSlIvHuID/z+6P5Hy3rHK91xHLD/5qWss/FQXtcV+MlS
         BK2Q==
X-Gm-Message-State: AG10YOQHpZPoxyEwVB+jYNxgidXrCZDeuDsmb4CrSEhrG7OdolQgtzlEX3J0Bw5T0WLYNQ==
X-Received: by 10.66.62.161 with SMTP id z1mr20855948par.108.1455912311977;
        Fri, 19 Feb 2016 12:05:11 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from localhost (ec2-52-8-89-49.us-west-1.compute.amazonaws.com. [52.8.89.49])
        by smtp.gmail.com with ESMTPSA id 19sm19594164pfb.64.2016.02.19.12.05.10
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 19 Feb 2016 12:05:11 -0800 (PST)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alex.bennee@linaro.org,
	serge.fdrv@gmail.com,
	rth@twiddle.net,
	qemu-arm@nongnu.org,
	edgar.iglesias@xilinx.com
Subject: [PATCH v2 3/8] target-arm: Add the IL flag to syn_data_abort
Date: Fri, 19 Feb 2016 21:04:47 +0100
Message-Id: <1455912292-23807-4-git-send-email-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1455912292-23807-1-git-send-email-edgar.iglesias@gmail.com>
References: <1455912292-23807-1-git-send-email-edgar.iglesias@gmail.com>
X-TUID: rNVasOjKfZmp

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
index 538887c..7e845d5 100644
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
1.9.1

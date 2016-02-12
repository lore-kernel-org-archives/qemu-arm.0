Received: by 10.25.159.19 with SMTP id i19csp857800lfe;
        Fri, 12 Feb 2016 06:36:46 -0800 (PST)
X-Received: by 10.66.122.97 with SMTP id lr1mr2604685pab.80.1455287805968;
        Fri, 12 Feb 2016 06:36:45 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-pf0-x244.google.com (mail-pf0-x244.google.com. [2607:f8b0:400e:c00::244])
        by mx.google.com with ESMTPS id ki7si20393269pab.9.2016.02.12.06.36.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 12 Feb 2016 06:36:45 -0800 (PST)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c00::244 as permitted sender) client-ip=2607:f8b0:400e:c00::244;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c00::244 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-pf0-x244.google.com with SMTP id w128so3476117pfb.2;
        Fri, 12 Feb 2016 06:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=W3ytM1oaUpT6mnFZl4OL/XDOIEQKXu7uhdgoI4/sR3A=;
        b=kVVsp/K+vX82qzT8+FMznhveUujk57buhFMEGLh79N4Ay9Gcw2Xe0IDoX0DhxEZVP6
         2ggV1s3j6dcaZ45xzyOCuGPixj/fEWtXwBf0ozaJKRxw6352uIHigyMBqyC1LE+Hg3eN
         wwGlelfcP03HIRd0nEJCPitmZ6Xp5BTVaJJTjKVfXsT3VxjTGhXXVzHnTL2vgTGwPGYS
         OKJUs/PbvZOI6yid+ZPagsDVc6J0X1eJ38Zjy8ri4RM4C9bjGNQ94imP9tFpLo+ekYiv
         cLcPpD044hczCCsj/TX8uqnC1q5DrCpFNwFnQlF4RWOLWsVU+ROl80d3GeCshsXDcnT+
         Kt7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=W3ytM1oaUpT6mnFZl4OL/XDOIEQKXu7uhdgoI4/sR3A=;
        b=AHjZIRVvg7cA/aYg6FUfO3GN78+xE98UjJpMOuH3MwoOmPX6qgGvA5X4FRntMieAVJ
         qclybFjeU2l6Ltrh+JxrB/esGioJA+Ec3gnnh3d4CHvra0rxcgpCZG/CCgmxLCsHWDVv
         piZYelW7zC2zp5ST5JHMWSoh4Qro/NZbV3AokND83lgPqCSnx7YqPsL9ChiWNNihbQGQ
         hgeLrDlw4ZZ/YV05DSUus0RlhZgxk4wpWfqpTD8rOXHtipsbiC9EfqQRAMYZS6aqQt/G
         TFaYkXmW8nUxYq6gy/4/zxSDXkuem3kL9CuSRnVCujQgDGdGaw4LSjR0/+ZzgOVbbZyE
         d5Rg==
X-Gm-Message-State: AG10YOQHq4cn7TYV3atDCHtXjSiffW8YfzMu8V2whVhsrJCP0kpDi8Wf4/VFVZFUujNipQ==
X-Received: by 10.98.33.77 with SMTP id h74mr2522751pfh.157.1455287805625;
        Fri, 12 Feb 2016 06:36:45 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from localhost (ec2-52-8-89-49.us-west-1.compute.amazonaws.com. [52.8.89.49])
        by smtp.gmail.com with ESMTPSA id 19sm19976587pfb.64.2016.02.12.06.36.44
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 12 Feb 2016 06:36:45 -0800 (PST)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alex.bennee@linaro.org,
	serge.fdrv@gmail.com,
	rth@twiddle.net,
	qemu-arm@nongnu.org,
	edgar.iglesias@xilinx.com
Subject: [PATCH v1 3/9] target-arm: Add the thumb/IL flag to syn_data_abort
Date: Fri, 12 Feb 2016 15:33:56 +0100
Message-Id: <1455287642-28166-4-git-send-email-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1455287642-28166-1-git-send-email-edgar.iglesias@gmail.com>
References: <1455287642-28166-1-git-send-email-edgar.iglesias@gmail.com>
X-TUID: sS8Er6hmvs1H

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 target-arm/internals.h | 4 +++-
 target-arm/op_helper.c | 6 ++++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/target-arm/internals.h b/target-arm/internals.h
index 70bec4a..b1c483b 100644
--- a/target-arm/internals.h
+++ b/target-arm/internals.h
@@ -360,9 +360,11 @@ static inline uint32_t syn_insn_abort(int same_el, int ea, int s1ptw, int fsc)
 }
 
 static inline uint32_t syn_data_abort(int same_el, int ea, int cm, int s1ptw,
-                                      int wnr, int fsc)
+                                      int wnr, int fsc,
+                                      bool is_thumb)
 {
     return (EC_DATAABORT << ARM_EL_EC_SHIFT) | (same_el << ARM_EL_EC_SHIFT)
+        | (is_thumb ? 0 : ARM_EL_IL)
         | (ea << 9) | (cm << 8) | (s1ptw << 7) | (wnr << 6) | fsc;
 }
 
diff --git a/target-arm/op_helper.c b/target-arm/op_helper.c
index bd48549..4e629e1 100644
--- a/target-arm/op_helper.c
+++ b/target-arm/op_helper.c
@@ -115,7 +115,8 @@ void tlb_fill(CPUState *cs, target_ulong addr, int is_write, int mmu_idx,
             syn = syn_insn_abort(same_el, 0, fi.s1ptw, syn);
             exc = EXCP_PREFETCH_ABORT;
         } else {
-            syn = syn_data_abort(same_el, 0, 0, fi.s1ptw, is_write == 1, syn);
+            syn = syn_data_abort(same_el, 0, 0, fi.s1ptw, is_write == 1, syn,
+                                 env->thumb);
             if (is_write == 1 && arm_feature(env, ARM_FEATURE_V6)) {
                 fsr |= (1 << 11);
             }
@@ -161,7 +162,8 @@ void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr, int is_write,
     }
 
     raise_exception(env, EXCP_DATA_ABORT,
-                    syn_data_abort(same_el, 0, 0, 0, is_write == 1, 0x21),
+                    syn_data_abort(same_el, 0, 0, 0, is_write == 1, 0x21,
+                                   env->thumb),
                     target_el);
 }
 
-- 
1.9.1

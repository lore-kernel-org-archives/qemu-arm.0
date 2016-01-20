Received: by 10.25.159.19 with SMTP id i19csp3124354lfe;
        Wed, 20 Jan 2016 05:49:57 -0800 (PST)
X-Received: by 10.202.73.213 with SMTP id w204mr27692877oia.0.1453297797509;
        Wed, 20 Jan 2016 05:49:57 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-oi0-x243.google.com (mail-oi0-x243.google.com. [2607:f8b0:4003:c06::243])
        by mx.google.com with ESMTPS id j16si4774069oes.38.2016.01.20.05.49.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 20 Jan 2016 05:49:57 -0800 (PST)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:4003:c06::243 as permitted sender) client-ip=2607:f8b0:4003:c06::243;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:4003:c06::243 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-oi0-x243.google.com with SMTP id j3so478318oig.0;
        Wed, 20 Jan 2016 05:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=YRRLhrvotiVumx0tskr+is6WIBJ9G4ni1dG56gggJcE=;
        b=quNlqB3/yheuWhT/XV4S5NH+l+bqp30rYMJiVlx2ohRlrUxxdyqJn2qYPg3lOjHHiv
         GTxy5vKa7zt8P5uLaozRLJ3lM/FsMXMOqdmloXAvrC31MSi5wz3XCmLrImogjKtwaki8
         lcuM47LcyhxuLopm1cLzGm1TaBpIp0piMZ/KTwIcBf/vfFYlQhyw11PeuDwsE3Bk0BlE
         wDRHd3wGt53z0Z9A3rS+y76U6eQs1RBvJFo2Ybfk2MDbxIrE+Zh5oHkC46alm0KsP2om
         YV40na538nEd7Wbd/hpg20ZhtSbJlLNKpnwrd4s0Y+zan5rJfc0Pzb6yTADfgqZQlBnc
         oeNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=YRRLhrvotiVumx0tskr+is6WIBJ9G4ni1dG56gggJcE=;
        b=NhJ/jU704LD5r5Mw/6EIUx2hLQCS33ypGWE6ELkt1VHcMlhnHqoqrMXdzSji2DFe3I
         +Xyw9YUs6xAitg4imkNPlYxENomzDTSpJGYsoSIfXPxsiARbgEBqn+rFaqLoLCS7IKLB
         hUncCIs9eZMiQaKogMrMM1GQIFI+CA6EIJGzbqP5XRBndX6+EiSS+YeG+iLcuzJezlJ5
         ihdU7f1g1jk4HtHbautI4Fx72DjJuWBU/tul68ENMxXQLSSxN05m8mQT/bppKJTW/Xow
         i1DzCE+p9vV9K6iEI/6PNGLpwsidpxp6e98kBb73U1X5AIeTyog6bmqKd0Wx37DweEj2
         K/ZQ==
X-Gm-Message-State: ALoCoQnrVYIqmUTJ5jSDMHe/E2FgQEtcdkH4cQ81wLxoNJNnkVvtXAx0bOzfsn3ZXUZRGaHd+F/ZFZf53yAlW+y0gJZHqWX+8w==
X-Received: by 10.202.85.194 with SMTP id j185mr27083195oib.107.1453297797232;
        Wed, 20 Jan 2016 05:49:57 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from localhost (ec2-52-8-89-49.us-west-1.compute.amazonaws.com. [52.8.89.49])
        by smtp.gmail.com with ESMTPSA id f9sm18043590obw.13.2016.01.20.05.49.56
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 20 Jan 2016 05:49:56 -0800 (PST)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alex.bennee@linaro.org,
	qemu-arm@nongnu.org,
	edgar.iglesias@xilinx.com
Subject: [PATCH v1 3/3] target-arm: Implement the S2 MMU inputsize < pamax check
Date: Wed, 20 Jan 2016 14:49:40 +0100
Message-Id: <1453297780-12514-4-git-send-email-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453297780-12514-1-git-send-email-edgar.iglesias@gmail.com>
References: <1453297780-12514-1-git-send-email-edgar.iglesias@gmail.com>
X-TUID: DYfdZO7pTNOu

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Implement the inputsize < pamax check for Stage 2 translations.
We have multiple choices for how to respond to errors and
choose to fault.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 target-arm/helper.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/target-arm/helper.c b/target-arm/helper.c
index 4abeb4d..e1fa209 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -6808,7 +6808,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
          */
         int startlevel = extract32(tcr->raw_tcr, 6, 2);
         unsigned int pamax = arm_pamax(cpu);
-        bool ok;
+        bool ok = true;
 
         if (va_size == 32 || stride == 9) {
             /* AArch32 or 4KB pages */
@@ -6818,9 +6818,16 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
             level = 3 - startlevel;
         }
 
-        /* Check that the starting level is valid. */
-        ok = check_s2_startlevel(cpu, va_size == 64, level,
-                                 inputsize, stride, pamax);
+        if (inputsize > pamax &&
+            (arm_el_is_aa64(env, 1) || inputsize > 40)) {
+            /* We have multiple choices but choose to fault.  */
+            ok = false;
+        }
+        if (ok) {
+            /* Check that the starting level is valid. */
+            ok = check_s2_startlevel(cpu, va_size == 64, level,
+                                     inputsize, stride, pamax);
+        }
         if (!ok) {
             /* AArch64 reports these as level 0 faults.
              * AArch32 reports these as level 1 faults.
-- 
1.9.1

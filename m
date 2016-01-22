Received: by 10.25.159.19 with SMTP id i19csp62701lfe;
        Fri, 22 Jan 2016 01:51:16 -0800 (PST)
X-Received: by 10.182.128.34 with SMTP id nl2mr1544082obb.59.1453456276300;
        Fri, 22 Jan 2016 01:51:16 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-oi0-x242.google.com (mail-oi0-x242.google.com. [2607:f8b0:4003:c06::242])
        by mx.google.com with ESMTPS id v64si5071861oia.110.2016.01.22.01.51.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 22 Jan 2016 01:51:16 -0800 (PST)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:4003:c06::242 as permitted sender) client-ip=2607:f8b0:4003:c06::242;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:4003:c06::242 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-oi0-x242.google.com with SMTP id j3so3489624oig.0;
        Fri, 22 Jan 2016 01:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=j6/6igmrW7PHLltsRSNSoa3VUBGoxXAMWDaA60rfnpo=;
        b=Nr9CH3lbc93V7yHT/Lqbp/q4WmAo/QVY/0HMlaogU6kkAyLHM2InY09D9Pvv2CPnwT
         3D7Dsmc0cxNqOQa2pYGwSxGT1KvhtXwe5IWNicjL/ZtdnXVPTW/UQwXfKr/+WmLdEpyw
         jYUwZqPDIyBpZ4y/DXthCV0GET0MKdyiCaETuePohM2lYqISoD933O/W5umLB1Kc1Y8D
         3vOv5ahUgzmcReTUIDiPJ7o3+6sUkQl+vQpoX2x7KxL3oKvJRTjMH3zNDBD5Nzdry6iy
         U5daso/qfvAa/klfPm0nZPZs+42IMQH5WUPITobPs07nBHtsyPTJjd0DbDb86WT1ZYyL
         Yujg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=j6/6igmrW7PHLltsRSNSoa3VUBGoxXAMWDaA60rfnpo=;
        b=aln31uaCVNeK3FuBKa40IKtPlg0RKie2v0iRtb4IyVgfEBq+dJu69B1DqHJBAALFmG
         cIZjbhywLTfhsFk6ep4InWUqotUCrZAqXNFG1Cu811SLoauLy6OQXK3gxLrx//ENA3h2
         DxYIF7/JOPUCvhfRN0sHvzdGE6lXOC7uv8z1U67NLsj6mxzIeX5ZL0hR+rfDoiAHuyau
         HniyBN85s2X7jPJ1rMySSDNuYVzhjCQixLuuA8Mxochc9PVIsZLFcit0dDUVhDfZG/2o
         SucSyug3hiJHZEbxy+dACSyqrT3WI43ja7m7GWX2NERf0ivslkUHzddyMem5rsNBUOyu
         9WcA==
X-Gm-Message-State: AG10YOTx2XfYhk3x63VYPjS57uYKy9SvV9c0g0FJ5B1/cYuF2XEUIw9u7T/7Wccw68l8vA==
X-Received: by 10.202.83.74 with SMTP id h71mr1494531oib.115.1453456276000;
        Fri, 22 Jan 2016 01:51:16 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from localhost (ec2-52-8-89-49.us-west-1.compute.amazonaws.com. [52.8.89.49])
        by smtp.gmail.com with ESMTPSA id u8sm2702967obf.5.2016.01.22.01.51.14
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 22 Jan 2016 01:51:15 -0800 (PST)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alex.bennee@linaro.org,
	qemu-arm@nongnu.org,
	edgar.iglesias@xilinx.com
Subject: [PATCH v3 3/3] target-arm: Implement the S2 MMU inputsize > pamax check
Date: Fri, 22 Jan 2016 10:50:43 +0100
Message-Id: <1453456243-19879-4-git-send-email-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453456243-19879-1-git-send-email-edgar.iglesias@gmail.com>
References: <1453456243-19879-1-git-send-email-edgar.iglesias@gmail.com>
X-TUID: Bz0i5mChvWaq

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Implement the inputsize > pamax check for Stage 2 translations.
We have multiple choices for how to respond to errors and
choose to fault.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 target-arm/helper.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/target-arm/helper.c b/target-arm/helper.c
index 2a6fa94..8901762 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -6809,7 +6809,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
          */
         int startlevel = extract32(tcr->raw_tcr, 6, 2);
         unsigned int pamax = arm_pamax(cpu);
-        bool ok;
+        bool ok = true;
 
         if (va_size == 32 || stride == 9) {
             /* AArch32 or 4KB pages */
@@ -6819,9 +6819,17 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
             level = 3 - startlevel;
         }
 
-        /* Check that the starting level is valid. */
-        ok = check_s2_startlevel(cpu, va_size == 64, level,
-                                 inputsize, stride, pamax);
+        if (va_size == 64 &&
+            inputsize > pamax &&
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

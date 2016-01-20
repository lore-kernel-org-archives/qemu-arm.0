Received: by 10.25.159.19 with SMTP id i19csp3124308lfe;
        Wed, 20 Jan 2016 05:49:52 -0800 (PST)
X-Received: by 10.202.198.65 with SMTP id w62mr26165399oif.10.1453297792691;
        Wed, 20 Jan 2016 05:49:52 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-ob0-x242.google.com (mail-ob0-x242.google.com. [2607:f8b0:4003:c01::242])
        by mx.google.com with ESMTPS id np10si4774391oeb.30.2016.01.20.05.49.52
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 20 Jan 2016 05:49:52 -0800 (PST)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:4003:c01::242 as permitted sender) client-ip=2607:f8b0:4003:c01::242;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:4003:c01::242 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-ob0-x242.google.com with SMTP id x5so616238obg.1;
        Wed, 20 Jan 2016 05:49:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=akYwq4Hd9NYVc5b1BM9GUU2CnQbxQcmXyCX3hIWns0k=;
        b=LCdBM3ceUfD1T4/+RKyEnTJJ3NP9nvc2kKW9xzG8mvvVU4psrh/ZRXMrSaFvMX5ZvP
         O8LtxrZfC63BY6+cZmNDKLTC1LbuBTiXMdm9x7cu4HM2tgYryqIHg0dV3AVJ2uQairTJ
         MbqDmghGB6DXYPntraYdvwaCE4eCziBbeKNKiGbEpWTlhVQj9j7gUmqRPn0xgkRe14Cd
         q4NjP+NO9Ej5LMCC9TF8ov+jIbXCB/oqc6YK/cnvgurZa/YRKEvn0xmo6E7uOcDmmDY3
         DqCfcZvtQEDEA1FSbJQGP7l1vUBJ95LFSYK/L6uc6DXyW4+AHZ+hHhWuZvHExK4FPHSs
         92Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=akYwq4Hd9NYVc5b1BM9GUU2CnQbxQcmXyCX3hIWns0k=;
        b=MPrSO1aWrezVRtE1HCPeo+7kZXYb9vLcD/ZsO1Ci9zlph+77KrCMXnwtlxqSM/Xl7G
         XMGjVUskBmQ6Kgx6+HjACna1bYV4XnMRpDvH35K+jYCL3BjmS0V2ttS5GnNGep0qo5cG
         2zF0K0DksIkPpYjfJOVLsDV7Fl7LgDFJ/A+Ye31D1sDrGWxLYs9at6d/gu6CO3PJR2NE
         wL5LpOwsMi9c3bfpskdv34ZVbxBhmtd51sxi5Pl5FQJglTB5GW3K4X7Sm7pC7/Al6BTF
         0xsAzcX+ltjeF2rfauiutocxa71AlLbtxquL7ibS46xa+LPoOD1DZ0RL4pTH1aMcug+R
         KBww==
X-Gm-Message-State: ALoCoQkMN1msNr57LGgzsr1mmIalnoRxXSIcDQwoTjiQpX9uC4F3HGi7OKj5ktGANgsNOqPaFND8xAK5eU0HuAFAbqZNUWQgqA==
X-Received: by 10.60.232.42 with SMTP id tl10mr28796652oec.69.1453297792396;
        Wed, 20 Jan 2016 05:49:52 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from localhost (ec2-52-8-89-49.us-west-1.compute.amazonaws.com. [52.8.89.49])
        by smtp.gmail.com with ESMTPSA id o125sm18146207oif.0.2016.01.20.05.49.51
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 20 Jan 2016 05:49:51 -0800 (PST)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alex.bennee@linaro.org,
	qemu-arm@nongnu.org,
	edgar.iglesias@xilinx.com
Subject: [PATCH v1 2/3] target-arm: Make pamax an argument to check_s2_startlevel
Date: Wed, 20 Jan 2016 14:49:39 +0100
Message-Id: <1453297780-12514-3-git-send-email-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453297780-12514-1-git-send-email-edgar.iglesias@gmail.com>
References: <1453297780-12514-1-git-send-email-edgar.iglesias@gmail.com>
X-TUID: bxntUrVKnZrG

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Make pamax an argument to check_s2_startlevel in preparation
for future reuse.

No functional change.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 target-arm/helper.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target-arm/helper.c b/target-arm/helper.c
index 8aedce9..4abeb4d 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -6579,7 +6579,8 @@ typedef enum {
  * Returns true if the suggested starting level is OK and false otherwise.
  */
 static bool check_s2_startlevel(ARMCPU *cpu, bool is_aa64, int level,
-                                int inputsize, int stride)
+                                int inputsize, int stride,
+                                unsigned int pamax)
 {
     const int grainsize = stride + 3;
     int startsizecheck;
@@ -6595,8 +6596,6 @@ static bool check_s2_startlevel(ARMCPU *cpu, bool is_aa64, int level,
     }
 
     if (is_aa64) {
-        unsigned int pamax = arm_pamax(cpu);
-
         switch (stride) {
         case 13: /* 64KB Pages.  */
             if (level == 0 || (level == 1 && pamax <= 42)) {
@@ -6808,6 +6807,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
          * VTCR_EL2.SL0 field (whose interpretation depends on the page size)
          */
         int startlevel = extract32(tcr->raw_tcr, 6, 2);
+        unsigned int pamax = arm_pamax(cpu);
         bool ok;
 
         if (va_size == 32 || stride == 9) {
@@ -6820,7 +6820,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
 
         /* Check that the starting level is valid. */
         ok = check_s2_startlevel(cpu, va_size == 64, level,
-                                 inputsize, stride);
+                                 inputsize, stride, pamax);
         if (!ok) {
             /* AArch64 reports these as level 0 faults.
              * AArch32 reports these as level 1 faults.
-- 
1.9.1

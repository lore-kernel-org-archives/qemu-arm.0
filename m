Received: by 10.25.159.19 with SMTP id i19csp3654626lfe;
        Thu, 21 Jan 2016 03:19:12 -0800 (PST)
X-Received: by 10.182.39.193 with SMTP id r1mr2855120obk.21.1453375149659;
        Thu, 21 Jan 2016 03:19:09 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-ob0-x244.google.com (mail-ob0-x244.google.com. [2607:f8b0:4003:c01::244])
        by mx.google.com with ESMTPS id r5si715076obf.99.2016.01.21.03.19.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 21 Jan 2016 03:19:09 -0800 (PST)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:4003:c01::244 as permitted sender) client-ip=2607:f8b0:4003:c01::244;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:4003:c01::244 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-ob0-x244.google.com with SMTP id tr5so2467725obc.2;
        Thu, 21 Jan 2016 03:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=/v4pLAfq3x/2KuXhNjIQE/gZHDqf8ZCTGiBn6wAWgks=;
        b=sA4SqSJw3a/OtkaIo9HWDfm4qzH+y+yHPPW29Ktg7Qk81jV741TgJD8TRSVjQ/Ygh7
         II/rYPbBliVueVJF/0T5lpHoqeUY+qNXCRonYEe1Ee+OrfrGAEzj4/YdRyOXDYgiOSBL
         3O95WoB8mB/3zLIryuiskp42AYbmv2igxaJGZ8IoZLRry8/aasCyBjE21c0xkcnQHUSU
         1PGlcI2+gXjYQ6Lfyx0frSq1LiAS1a2+UIvI2NWgBUBjmi6GdU2yk3h5b6VMo6hFpJow
         HalBc+3SDxRG6YGy+iBKC4vRYjQ6U9poflfY9xi2oZedRbOkE99Eay3vCB9XDL2jctee
         oSGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=/v4pLAfq3x/2KuXhNjIQE/gZHDqf8ZCTGiBn6wAWgks=;
        b=DhDdQy5epd4G/1/qd6ht8XRXmZpsHYbRt1sbZfMH6T/cilSLbNP8Tn12kuNOdE6+e9
         bGyWmcgDW5p4Med9NeN6EYVgFhXJwYWi2nWad8oHCadUAG74OWs360Y0HfF6fn4Yn0zF
         n11fWkDjKHw5BVKZkiD/tYV8Umyv1m7KbSp8Ek/j+8Zaa/zYbXWHawknSC/aIFJl01Jx
         oynSMk5RuFPljCI1rc4HL/7NM5lzWYYnp5ny0/ZK6oNxA3O+eGWsnR0AoxH+tU9VSLQY
         1ElaFhp0MEwgbsBtAcvJN6CfjBnsOsHTbavt7SnuqfXUJehNj3/mQSXEudUQ/rYGqRO4
         dlXA==
X-Gm-Message-State: ALoCoQk2bH8KMbwI9PRvSkN7NUA/QScVEOOnYj3dJ71CnfgiNSs1iHh91UbnJkeC0GDr7XbcxaHIPqjILuyFNGqWD5MaB7Qmfw==
X-Received: by 10.182.142.105 with SMTP id rv9mr33848504obb.66.1453375149372;
        Thu, 21 Jan 2016 03:19:09 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from localhost (ec2-52-8-89-49.us-west-1.compute.amazonaws.com. [52.8.89.49])
        by smtp.gmail.com with ESMTPSA id a10sm311836obj.21.2016.01.21.03.19.08
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 21 Jan 2016 03:19:08 -0800 (PST)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alex.bennee@linaro.org,
	qemu-arm@nongnu.org,
	edgar.iglesias@xilinx.com
Subject: [PATCH v2 3/3] target-arm: Implement the S2 MMU inputsize > pamax check
Date: Thu, 21 Jan 2016 12:18:28 +0100
Message-Id: <1453375108-25229-4-git-send-email-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453375108-25229-1-git-send-email-edgar.iglesias@gmail.com>
References: <1453375108-25229-1-git-send-email-edgar.iglesias@gmail.com>
X-TUID: sHJaT35ql7WH

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Implement the inputsize > pamax check for Stage 2 translations.
We have multiple choices for how to respond to errors and
choose to fault.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 target-arm/helper.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/target-arm/helper.c b/target-arm/helper.c
index 4abeb4d..9a7ff5e 100644
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
@@ -6818,9 +6818,17 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
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

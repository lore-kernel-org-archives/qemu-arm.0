Received: by 10.25.159.19 with SMTP id i19csp3124266lfe;
        Wed, 20 Jan 2016 05:49:48 -0800 (PST)
X-Received: by 10.202.172.80 with SMTP id v77mr26677800oie.18.1453297788077;
        Wed, 20 Jan 2016 05:49:48 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-oi0-x244.google.com (mail-oi0-x244.google.com. [2607:f8b0:4003:c06::244])
        by mx.google.com with ESMTPS id a20si26679803oib.62.2016.01.20.05.49.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 20 Jan 2016 05:49:48 -0800 (PST)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:4003:c06::244 as permitted sender) client-ip=2607:f8b0:4003:c06::244;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:4003:c06::244 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-oi0-x244.google.com with SMTP id x140so476836oif.1;
        Wed, 20 Jan 2016 05:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=wVesq0lMo6+qXWdJ40ZYAFIPlluC2mP27xWsPdWcfqo=;
        b=0c164cgavx5kSQZLVitluVuXiMadbbQZCMdtStJLgsbG4xbf4n+mtgo3RhOO5zlorK
         LIZgNwIh3bwfYVjUU+Bzdqa4YeJrIlb7cjcFVr/jMNBvL/wtV4gpwy9r/+upFO+n8L+f
         G/c8FqGQClKg74KWEf+wJ1oJohIE2gnO10KXOAHPsnuhk7fjnL/z0dX9350OvlcFjfRz
         bZnwP+aMXWtM0wXTSc5vbryEYAnvsL5FYr/Q8+dAiL89HRyiZzDhTZrDQwf0S0+ZNqJn
         LX0AkDGYJHFfqBHC7hUv+h3dNXAnceLA3ycyERp1ICWVCWQhQoP8buVCCT1w4cbN+FXq
         mMCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=wVesq0lMo6+qXWdJ40ZYAFIPlluC2mP27xWsPdWcfqo=;
        b=Da/5pFD//lv0gqSXKENWrfhv5RnMTKWbgfVoEg8itQEKpgDWvSyjo0XiYCRRXy+Syc
         i9l4RJtzFnVZd1z/XlH23R+BR6oCM6xHteGwFxSSxtPSL4BFU2wUeQucY+cdU5pT8eb0
         DmAW1012P44SaffolAALhGueXNbAZekrMinr8EC1Kp/85atV9ohIPideaClSIXV3MJf6
         jrQTiZLLb7uEZSaKV49bVp3T9vC8Llz9CZjCJTPUyDKau6f3NypVT1nKVIQxCsjJSEBG
         gtZbe9DcklcMXkcXtwsdtSuxVKp7a5U8NLlGVcLxIV8cHEyh40Bpp5fv/iUFSL9CToCz
         1qAQ==
X-Gm-Message-State: ALoCoQl6xanPQp95vFc6HSUBfDL2QP4F1cUY3amU2+4DPRZx+Q1xMJy76rXAliHCf9tfsOJylOf1EvDeFloUJ/x4VqE6JgITUQ==
X-Received: by 10.202.204.136 with SMTP id c130mr27436153oig.93.1453297787786;
        Wed, 20 Jan 2016 05:49:47 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from localhost (ec2-52-8-89-49.us-west-1.compute.amazonaws.com. [52.8.89.49])
        by smtp.gmail.com with ESMTPSA id tt1sm18178485obb.8.2016.01.20.05.49.46
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 20 Jan 2016 05:49:47 -0800 (PST)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alex.bennee@linaro.org,
	qemu-arm@nongnu.org,
	edgar.iglesias@xilinx.com
Subject: [PATCH v1 1/3] target-arm: Apply S2 MMU startlevel table size check to AArch64
Date: Wed, 20 Jan 2016 14:49:38 +0100
Message-Id: <1453297780-12514-2-git-send-email-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453297780-12514-1-git-send-email-edgar.iglesias@gmail.com>
References: <1453297780-12514-1-git-send-email-edgar.iglesias@gmail.com>
X-TUID: Mj5pRCZtjlYs

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

The S2 starting level table size check applies to both AArch32
and AArch64. Move it to common code.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 target-arm/helper.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/target-arm/helper.c b/target-arm/helper.c
index f956b67..8aedce9 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -6581,11 +6581,19 @@ typedef enum {
 static bool check_s2_startlevel(ARMCPU *cpu, bool is_aa64, int level,
                                 int inputsize, int stride)
 {
+    const int grainsize = stride + 3;
+    int startsizecheck;
+
     /* Negative levels are never allowed.  */
     if (level < 0) {
         return false;
     }
 
+    startsizecheck = inputsize - ((3 - level) * stride + grainsize);
+    if (startsizecheck < 1 || startsizecheck > stride + 4) {
+        return false;
+    }
+
     if (is_aa64) {
         unsigned int pamax = arm_pamax(cpu);
 
@@ -6609,20 +6617,12 @@ static bool check_s2_startlevel(ARMCPU *cpu, bool is_aa64, int level,
             g_assert_not_reached();
         }
     } else {
-        const int grainsize = stride + 3;
-        int startsizecheck;
-
         /* AArch32 only supports 4KB pages. Assert on that.  */
         assert(stride == 9);
 
         if (level == 0) {
             return false;
         }
-
-        startsizecheck = inputsize - ((3 - level) * stride + grainsize);
-        if (startsizecheck < 1 || startsizecheck > stride + 4) {
-            return false;
-        }
     }
     return true;
 }
-- 
1.9.1

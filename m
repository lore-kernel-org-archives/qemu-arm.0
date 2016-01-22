Received: by 10.25.159.19 with SMTP id i19csp62634lfe;
        Fri, 22 Jan 2016 01:51:07 -0800 (PST)
X-Received: by 10.202.55.86 with SMTP id e83mr1491597oia.46.1453456267331;
        Fri, 22 Jan 2016 01:51:07 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-oi0-x242.google.com (mail-oi0-x242.google.com. [2607:f8b0:4003:c06::242])
        by mx.google.com with ESMTPS id bp5si5081746obb.49.2016.01.22.01.51.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 22 Jan 2016 01:51:07 -0800 (PST)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:4003:c06::242 as permitted sender) client-ip=2607:f8b0:4003:c06::242;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:4003:c06::242 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-oi0-x242.google.com with SMTP id a202so3514146oib.3;
        Fri, 22 Jan 2016 01:51:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-type:content-transfer-encoding;
        bh=1REl11RSjNFPLmCelV3StMMHfBl2ELyKWREuny76YIY=;
        b=IVyvM7d7Vfh7C9GlaI6lYH+cBA9ijtMU2DVAAAWa2MGguo2u30zcuvThXMbn8je0Ml
         mNAaSZA+yDggLDGOHnAas2+VzgmYRDZViydGhrhGnJfv0NlO/vI+UgtwiAzGg4/RgLql
         MUH46KclqcJ+VUuUpdJELWivc0WtIvpnS2+jFWGYcFAfeuCswBu2UfeBA59zIyKIzhOE
         ghyTD0lff4XUT7VVeYWjPyHszBvJPt7x3qkorBpGBwpl23AUMjycNJBuli+xCvrm6mg2
         XgP2Bdv71e7Zz0EdzNjL/y7bCiNWDCzYkytc7ssl7LeX5efx/+18zQiqilNHmuplhvkq
         qRLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-type:content-transfer-encoding;
        bh=1REl11RSjNFPLmCelV3StMMHfBl2ELyKWREuny76YIY=;
        b=i3zIo/0h8Q8H3a53aEioeAsz4idZqoty4qsCmR4qyiN4cyMY4OZjyAw88s1fzt3WZf
         S+HHNF9McjUHgp1z9+Y2sII955dudlwaAqf3mZJg9LXcSnkxo1R8wRTnloaOrvqMaXfd
         x4LFYE0NSFc9VZobOWUnm6TNAdNn99Xzgh9V/Sms0aSJdavV27WlJwqGGRYK4U3EZAgp
         NwbXSjodnlkyRTg8sPqlO9xvGH8Do7by8grm5kyScZI/M5Z/FEVB1WIOaBe0roRGAfmh
         9ewM/ZhxTwItjQ0GODLVelIias7p+fFsllRvd9OAn0TWTiYZML/sPeJ15m6YvJEkzFPc
         L8sQ==
X-Gm-Message-State: AG10YOTMs8RKTLoyVZIKG7DQ96hk+Jvk8wtO0uRNaQSP5a3zX//R7utRNhvKWVcwYudJhQ==
X-Received: by 10.202.211.80 with SMTP id k77mr1553671oig.98.1453456266919;
        Fri, 22 Jan 2016 01:51:06 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from localhost (ec2-52-8-89-49.us-west-1.compute.amazonaws.com. [52.8.89.49])
        by smtp.gmail.com with ESMTPSA id a128sm2747746oig.3.2016.01.22.01.51.05
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 22 Jan 2016 01:51:06 -0800 (PST)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alex.bennee@linaro.org,
	qemu-arm@nongnu.org,
	edgar.iglesias@xilinx.com
Subject: [PATCH v3 1/3] target-arm: Apply S2 MMU startlevel table size check to AArch64
Date: Fri, 22 Jan 2016 10:50:41 +0100
Message-Id: <1453456243-19879-2-git-send-email-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453456243-19879-1-git-send-email-edgar.iglesias@gmail.com>
References: <1453456243-19879-1-git-send-email-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 76TPB9vwDanh

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

The S2 starting level table size check applies to both AArch32
and AArch64. Move it to common code.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
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

Received: by 10.25.159.19 with SMTP id i19csp29827lfe;
        Wed, 27 Jan 2016 14:16:47 -0800 (PST)
X-Received: by 10.98.13.85 with SMTP id v82mr45665050pfi.158.1453933007761;
        Wed, 27 Jan 2016 14:16:47 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-pf0-x243.google.com (mail-pf0-x243.google.com. [2607:f8b0:400e:c00::243])
        by mx.google.com with ESMTPS id pv3si12040995pac.61.2016.01.27.14.16.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 Jan 2016 14:16:47 -0800 (PST)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c00::243 as permitted sender) client-ip=2607:f8b0:400e:c00::243;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c00::243 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-pf0-x243.google.com with SMTP id n128so1009420pfn.3;
        Wed, 27 Jan 2016 14:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-type:content-transfer-encoding;
        bh=5rGQzaC/OVFGVU6s0smwuqX5fwq3sU8NAIcMqVbAe5s=;
        b=X6pOdcHEfXd+dBHM0MgaZSVIk5uPnIXTX1seNCw1XYPx2Z1cyFdA9csNcF/pZR2sUf
         I3DXnw+SjcfvG3pSaTeGpZ2r9d5IEGIM9R9KRvqRBGsAU30S1YBAU8GmdPQh7jIDc3Qk
         7qMRV02Gr3INnxgWXH5cR90uKPrdwSqJrCtWsKfFccatzG5ZLScLnXzHAOLwmDUDeMGT
         KxG8dPXFKCwjm43brVEU6Y7hCqDzd/E9ALLtTBY1XhCLrcK9K5xEyvvUFzBHJRFfGceb
         eIzbBLBSwK7ExFM7bYT8so/HwyVlY/htTPflHJYjoSg2HZpvQi/qd9hQNzhYX3X6yMLV
         ObsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-type:content-transfer-encoding;
        bh=5rGQzaC/OVFGVU6s0smwuqX5fwq3sU8NAIcMqVbAe5s=;
        b=IQU5CB709Xlnr+IpAdULEMMj5bDZpLO7FbnA5Ds5MDFPBDQcInz6uvTv/7V10EyacF
         N6M0T0enbHnDQB8jKb49IDpiBgsERxYQWGvsN3VI19PfvXyGo+Yf89zM/JLoHj2tTJwo
         Flv6nbIvJkixnmTTlbHTGIe5G+xdnJMx0iLf8eHwCCZDmQjS5ZwRHE49/z5vZ8soh+cV
         Tzl630JMqONRaiz1p6T6ArC4eaQ3lBWDEVW+T5jURG/yh4GCgfpJWCpPgbRPoI0VsHck
         3kGDSA7rTgwWDVKEgZe4Kp4mzvhDbBj86Rq4aKPoJM1upYcZQtTLgqS0FeZULG6k42QU
         UFBA==
X-Gm-Message-State: AG10YOSeneq/wXMqJO+i2mH64+4ukaV512Y6axk9OwzODd1cxaDfBRKZMOM8vM4bhgR09A==
X-Received: by 10.98.73.29 with SMTP id w29mr45536236pfa.106.1453933007424;
        Wed, 27 Jan 2016 14:16:47 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from localhost (ec2-52-8-89-49.us-west-1.compute.amazonaws.com. [52.8.89.49])
        by smtp.gmail.com with ESMTPSA id yh5sm11291091pab.13.2016.01.27.14.16.45
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 27 Jan 2016 14:16:46 -0800 (PST)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alex.bennee@linaro.org,
	qemu-arm@nongnu.org,
	edgar.iglesias@xilinx.com
Subject: [PATCH v4 1/3] target-arm: Apply S2 MMU startlevel table size check to AArch64
Date: Wed, 27 Jan 2016 23:16:08 +0100
Message-Id: <1453932970-14576-2-git-send-email-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453932970-14576-1-git-send-email-edgar.iglesias@gmail.com>
References: <1453932970-14576-1-git-send-email-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: N4dxaVFR8jtZ

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

The S2 starting level table size check applies to both AArch32
and AArch64. Move it to common code.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 target-arm/helper.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/target-arm/helper.c b/target-arm/helper.c
index ae02486..5d6f297 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -6775,11 +6775,19 @@ typedef enum {
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
 
@@ -6803,20 +6811,12 @@ static bool check_s2_startlevel(ARMCPU *cpu, bool is_aa64, int level,
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

Received: by 10.25.208.211 with SMTP id h202csp31241lfg;
        Fri, 19 Feb 2016 12:05:21 -0800 (PST)
X-Received: by 10.66.235.9 with SMTP id ui9mr20731574pac.135.1455912321548;
        Fri, 19 Feb 2016 12:05:21 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-pf0-x22b.google.com (mail-pf0-x22b.google.com. [2607:f8b0:400e:c00::22b])
        by mx.google.com with ESMTPS id u10si18383814pfa.95.2016.02.19.12.05.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 19 Feb 2016 12:05:21 -0800 (PST)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c00::22b as permitted sender) client-ip=2607:f8b0:400e:c00::22b;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c00::22b as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-pf0-x22b.google.com with SMTP id x65so56430433pfb.1;
        Fri, 19 Feb 2016 12:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Br3SlS0i3NXuePs2VKkH69xF4dgOiNep8ieHL5AhvWs=;
        b=BrcfpF72VB+fjTgFTGZRRSPy+87HI8AwhZ/K5sS3mqUUI//xvGTqPNamlupS/35zAr
         qYD0WJAYZ3z+6AixJdn1NagvBwbh3oQRplw+JVKQdPH/Rj0OhAW2ohe4oHcGArXLcbAp
         B4T2Znlze0G5iysTsc5ZFGEirI/+UjWSPbJQgEfteD5KE3GIugXakTFQYkO2rxzEl7tc
         vUzYQQvBf01+zj1PtJMqlrQzYaRQ278DyWCE8t1wJpKCsIyhwgC19S8qOFMcStk9s2If
         9srmD0nXYrZo0cKuRXyMxSaSJtFbxpCZcPHBzyOu6UiMkzjoWwiP6mFZGa45DoW2+l22
         SkiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Br3SlS0i3NXuePs2VKkH69xF4dgOiNep8ieHL5AhvWs=;
        b=cwHuHQuxdaUSdToDGb2BcP/e8RupyM8biJKypsieUTkDrhHaaqMf5KAu+TAb5IqNYH
         THIWvCOueCeRuRNLZW3SIypN2QctYBD+pvHjaVij2pfJcCG9bMGy+tT0VX3leIiu6Eng
         na/k7wcxuJzs4d72bIXoPQyzUDX6hGrNNuq1Q2L3hyxrAGhTEUH6G5VoyhKrSTpvkl3F
         +Yrr4Zx0yxvDYe+Hw/LVK/lPJYIKaH5TSBkWWPOm8RSKgzAHAtncWXolqV503fF32KkR
         2J9lHtC1TBxHyCiPWFPIimw9mqwpLggFQNCPiNuDfNbHpdMoa6cHuuhFn/xvLQrXJPdw
         JlQQ==
X-Gm-Message-State: AG10YOQxhJfq300TUE76VOehRtvl89ePl7kvxAqdVmRVnoqBQux3HKYVzfANDg06xiG/Fw==
X-Received: by 10.98.16.150 with SMTP id 22mr20698221pfq.128.1455912321118;
        Fri, 19 Feb 2016 12:05:21 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from localhost (ec2-52-8-89-49.us-west-1.compute.amazonaws.com. [52.8.89.49])
        by smtp.gmail.com with ESMTPSA id x1sm19627396pfi.42.2016.02.19.12.05.19
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 19 Feb 2016 12:05:20 -0800 (PST)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alex.bennee@linaro.org,
	serge.fdrv@gmail.com,
	rth@twiddle.net,
	qemu-arm@nongnu.org,
	edgar.iglesias@xilinx.com
Subject: [PATCH v2 5/8] target-arm/translate-a64.c: Use extract32 in disas_ldst_reg_imm9
Date: Fri, 19 Feb 2016 21:04:49 +0100
Message-Id: <1455912292-23807-6-git-send-email-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1455912292-23807-1-git-send-email-edgar.iglesias@gmail.com>
References: <1455912292-23807-1-git-send-email-edgar.iglesias@gmail.com>
X-TUID: ccv7sQ1BhGTq

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Use extract32 instead of open coding the bit masking when decoding
is_signed and is_extended. This streamlines the decoding with some
of the other ldst variants.

No functional change.

Reviewed-by: Sergey Fedorov <serge.fdrv@gmail.com>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 target-arm/translate-a64.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target-arm/translate-a64.c b/target-arm/translate-a64.c
index 7f65aea..bf31f8a 100644
--- a/target-arm/translate-a64.c
+++ b/target-arm/translate-a64.c
@@ -2117,8 +2117,8 @@ static void disas_ldst_reg_imm9(DisasContext *s, uint32_t insn)
             return;
         }
         is_store = (opc == 0);
-        is_signed = opc & (1<<1);
-        is_extended = (size < 3) && (opc & 1);
+        is_signed = extract32(opc, 1, 1);
+        is_extended = (size < 3) && extract32(opc, 0, 1);
     }
 
     switch (idx) {
-- 
1.9.1

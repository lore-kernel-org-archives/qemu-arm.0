Received: by 10.25.159.19 with SMTP id i19csp29939lfe;
        Wed, 27 Jan 2016 14:17:05 -0800 (PST)
X-Received: by 10.98.71.211 with SMTP id p80mr45570230pfi.135.1453933024932;
        Wed, 27 Jan 2016 14:17:04 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-pf0-x244.google.com (mail-pf0-x244.google.com. [2607:f8b0:400e:c00::244])
        by mx.google.com with ESMTPS id q189si12037889pfq.206.2016.01.27.14.17.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 Jan 2016 14:17:04 -0800 (PST)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c00::244 as permitted sender) client-ip=2607:f8b0:400e:c00::244;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c00::244 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-pf0-x244.google.com with SMTP id x125so1032765pfb.0;
        Wed, 27 Jan 2016 14:17:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=t+AWYplYlJ3DeNLLsoPmdHwb8KxYNJAiqXDR7EyeNUw=;
        b=mcgZmP7iEi0/0yRVTVVlGQ1ykcvX+FftUCgcY1dysz2Z0RChjvr2IHGX1FHmevAMyF
         U8xZHFbi349Tay6UeoDG3u1oKvTXuAwk/S9SwKjR0YeD3x9SEKb4Scaqop6rnspjCHn5
         JsuaZQ0CRvruL5w+AmmfG3eufO15X4BAtAQQ6laSA0VNbbXhhGcp+Xn+ZmbgV9E77K4I
         WZ16JuudOJufIMlcznbZX4u+MVSzqpqeLws8KLzrahRmfEouG+J9JcTkKJMGPhqhQmrm
         UrX4/36a+rP73N/qZ1TUaioD97dZrkG5hzQlRJjBaQs/B4D0JcCd+6RkfnwQyUKpbH4K
         p6LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=t+AWYplYlJ3DeNLLsoPmdHwb8KxYNJAiqXDR7EyeNUw=;
        b=i4YkfOYZGPOawFpz5tr+J2uITRpKw71Byw/UDWNQCtvfikuYxdC3TWzR5AxSRzAmBw
         kSFXMtnNZB1rCb2VeZAZtusuHxiN44swZ2FAxWXdiwOxsVV3XKfUguHYPX2GVtmZh78O
         idl1Gwc3pSzggwW9hUy2GX3ctD8WsJwJfm+0g4b4LYrHqOv+hI2cbAuH2+y3onMsPWPc
         ZUOoR0tQS4SmGFdXNo2gNmQILMItcdMesULSWtb9ovGaKKLXMg0ka2WNli3XaRSYZbUn
         CF62gG0VWxJU1HLd1idStidzfccaD/entVJ6ETftYh85naP4vZqJO1bNGi1kH2Uo9OcU
         W4BA==
X-Gm-Message-State: AG10YORCutc9MDLVWYas2dEDMAIg1fSYsFA0HHuJS/XbZQUr3JJA25NVQKq6ZfHoMIXF+Q==
X-Received: by 10.98.68.220 with SMTP id m89mr5850165pfi.65.1453933024292;
        Wed, 27 Jan 2016 14:17:04 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from localhost (ec2-52-8-89-49.us-west-1.compute.amazonaws.com. [52.8.89.49])
        by smtp.gmail.com with ESMTPSA id k74sm11288719pfb.30.2016.01.27.14.17.02
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 27 Jan 2016 14:17:03 -0800 (PST)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alex.bennee@linaro.org,
	qemu-arm@nongnu.org,
	edgar.iglesias@xilinx.com
Subject: [PATCH v4 3/3] target-arm: Implement the S2 MMU inputsize > pamax check
Date: Wed, 27 Jan 2016 23:16:10 +0100
Message-Id: <1453932970-14576-4-git-send-email-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453932970-14576-1-git-send-email-edgar.iglesias@gmail.com>
References: <1453932970-14576-1-git-send-email-edgar.iglesias@gmail.com>
X-TUID: wCjlnQ0Who3I

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Implement the inputsize > pamax check for Stage 2 translations.
This is CONSTRAINED UNPREDICTABLE and we choose to fault.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 target-arm/helper.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/target-arm/helper.c b/target-arm/helper.c
index 13e9933..9f75840 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -6790,6 +6790,7 @@ static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, int level,
     }
 
     if (is_aa64) {
+        CPUARMState *env = &cpu->env;
         unsigned int pamax = arm_pamax(cpu);
 
         switch (stride) {
@@ -6811,6 +6812,13 @@ static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, int level,
         default:
             g_assert_not_reached();
         }
+
+        /* Inputsize checks.  */
+        if (inputsize > pamax &&
+            (arm_el_is_aa64(env, 1) || inputsize > 40)) {
+            /* This is CONSTRAINED UNPREDICTABLE and we choose to fault.  */
+            return false;
+        }
     } else {
         /* AArch32 only supports 4KB pages. Assert on that.  */
         assert(stride == 9);
-- 
1.9.1

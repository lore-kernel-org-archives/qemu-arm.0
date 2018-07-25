Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp314286wru;
        Tue, 24 Jul 2018 22:31:04 -0700 (PDT)
X-Received: by 2002:ac8:37c5:: with SMTP id e5-v6mr19878658qtc.339.1532496664470;
        Tue, 24 Jul 2018 22:31:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532496664; cv=none;
        d=google.com; s=arc-20160816;
        b=Bx+4OvO6ehyBI6HGnpZmf6yhlMmLgvMXnKi7Xk6ZhoS0MypjHu6L8G+b7bKz5zItRk
         3trNpzBf8GudPhMmJWelap13zEYSwWl3s0X0WoyoHOJ66g1lyB7D4vlbyJirG/oEWwT+
         eY/0QvzvIvi8QWMwmIW8wQ21otcH5Y1PMRFtdzvynrYvogk1tHktCLcvg8k6hpnbgZbX
         oaSSTRghChEDp3ADeINdAryHeY/4RAKyVE93nVgD6fuHrGaX8a2WjpzgzR1/u9xGS4WI
         hqg4LH7sN9RxOBu/rAWLz56qvb+XvhWhz+DtrKhg2AGyRGe4/vtyTxacClf70EWTBSGD
         KcoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=message-id:date:subject:cc:to:from:dkim-signature
         :arc-authentication-results;
        bh=NNN8mjnF2Vz3g5GOst/CbeIh72InaXfGbwD4IxSBb8c=;
        b=xK4djAl1WUxbwF8U7AqE8P8UbQmc1StMgoOpCCZUxQFReVIXOEmZrkPHR7nRxHIZ7J
         186gk8e/g7YOt4Ujxv0xUNG4zNMOg0fx2ZgJjH6ezBwX0Ygk8DVQgKq69sIuC7MNd4Lb
         Zkq3FBVOJ3K3T4fL/DrXOliByrXx2X8MX9lArV3XRJPrhaKJ0ypuWeSHuWz+nKs4SFHD
         akVKTowVU5vhu0VmjifaGPchVeEWQ+yyneSLR3KL1OeWDScUH1XPIfJK4/CgjzOnJMlz
         +lGFk/r2iszyetxpi4BHZlv055g0xNvY/qWOMMHNx6aGwK0+Ox+WbNbYi85iiMgvQRoJ
         YaeQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NnjQ4Evw;
       spf=pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=hongbo.zhang@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <hongbo.zhang@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id w6-v6sor7105828qka.101.2018.07.24.22.31.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 24 Jul 2018 22:31:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NnjQ4Evw;
       spf=pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=hongbo.zhang@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=NNN8mjnF2Vz3g5GOst/CbeIh72InaXfGbwD4IxSBb8c=;
        b=NnjQ4Evww3G4v0Cmoaas5Yuir56afZ9ackVe8ydvdzTH3BeXxR7sSPTYvwRLKy77AP
         nW+PnFSulOhna0E3FLK92xoRGwfmKpXSqR7Qr6+mIi7YUP1NXf2GXTD2XRnkuU/bPU1x
         pwh0sBbbUP1NVPTh630rUgupEwAGniVS/XMmQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=NNN8mjnF2Vz3g5GOst/CbeIh72InaXfGbwD4IxSBb8c=;
        b=bf2P7uxd5qLVnn/GUoZB6t0MP0h/ysBLMafewh0U6qlrpd2t/fxe7CZIaR68AZnF45
         ysxC6hRSayWfLv/a6ebtQGCIfTbrNduh0r4Q8UwbePnzKO43hoCvdnTzsTZGXkF+Gtp+
         ZA7JcOwuhC1g5VIBiuEDiM0c9ouLZ/RwdHBFGN6O9vdc87w6EWrydkpgO9YFgRpk9ygT
         mFf07CgboIe5rGjS9mK9grZ+MApKuxvf2Ygkn83xjg4oZjAjrpNWgIicVyjvCWVO8689
         GMn9lX7NCAPQYdqHH7aYt7+wXrYunn8qboCxfcULHBH8Pw5LCcRfOpVG/oVQweGOUxM1
         GEjw==
X-Gm-Message-State: AOUpUlHJ5cCZC5guHYL8Qyt0bh6jHTc4UvqKxNKlkpJRPPtJNgt1pq/b
	mjSYHtLD2FIG6SUgTFh45gpzebSJ
X-Google-Smtp-Source: AAOMgpcZX2JXJpv8+Zvd7lxsKC+O1amEBnZ6WDa2F4f+w4Y8ACPzld6quNP/+UZHJU3tKeAU3ok1CA==
X-Received: by 2002:a37:5142:: with SMTP id f63-v6mr18186304qkb.369.1532496664198;
        Tue, 24 Jul 2018 22:31:04 -0700 (PDT)
Return-Path: <hongbo.zhang@linaro.org>
Received: from localhost.localdomain ([104.237.86.219])
        by smtp.gmail.com with ESMTPSA id v129-v6sm8621380qkd.86.2018.07.24.22.31.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 24 Jul 2018 22:31:03 -0700 (PDT)
From: Hongbo Zhang <hongbo.zhang@linaro.org>
To: peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: radoslaw.biernacki@linaro.org,
	ard.biesheuvel@linaro.org,
	leif.lindholm@linaro.org,
	Hongbo Zhang <hongbo.zhang@linaro.org>
Subject: [PATCH v2 1/2] hw/arm: check fw_cfg return value before using it
Date: Wed, 25 Jul 2018 13:30:51 +0800
Message-Id: <1532496652-26364-1-git-send-email-hongbo.zhang@linaro.org>
X-Mailer: git-send-email 2.7.4
X-TUID: OkyNqp6otn6a

The fw_cfg value returned from fw_cfg_find() may be NULL, so check it
before using.

Signed-off-by: Hongbo Zhang <hongbo.zhang@linaro.org>
---
 hw/arm/boot.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index e09201c..43b217f 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -930,6 +930,7 @@ void arm_load_kernel(ARMCPU *cpu, struct arm_boot_info *info)
     hwaddr entry;
     static const ARMInsnFixup *primary_loader;
     AddressSpace *as = arm_boot_address_space(cpu, info);
+    FWCfgState *fw_cfg;
 
     /* CPU objects (unlike devices) are not automatically reset on system
      * reset, so we must always register a handler to do so. If we're
@@ -960,11 +961,10 @@ void arm_load_kernel(ARMCPU *cpu, struct arm_boot_info *info)
             info->dtb_start = info->loader_start;
         }
 
-        if (info->kernel_filename) {
-            FWCfgState *fw_cfg;
+        fw_cfg = fw_cfg_find();
+        if (info->kernel_filename && fw_cfg) {
             bool try_decompressing_kernel;
 
-            fw_cfg = fw_cfg_find();
             try_decompressing_kernel = arm_feature(&cpu->env,
                                                    ARM_FEATURE_AARCH64);
 
-- 
2.7.4

Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3418657lfq;
        Tue, 15 Dec 2020 03:51:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzh7HL88Hh+0XYJayHgHhdUKtdKF8ApkbVdGxXiDiQmfhiNyQsa8U4dykh/FCp4l0NZfyM4
X-Received: by 2002:a25:aa91:: with SMTP id t17mr39644387ybi.394.1608033072746;
        Tue, 15 Dec 2020 03:51:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1608033072; cv=none;
        d=google.com; s=arc-20160816;
        b=TZVVSlnh/hnHj0RVXBXlltYhvQl8tVOqFrpdN63Xd9pikfPwmrXJdkmM+uiSv5tIqS
         f5H7rRUENHJJUe1uIk5Z35CeYrzcbOchsJae2kDR7qsWvB22+tIjFCXjV/MuFHP3NcYq
         UaQqxu/5bOCt06j3CciF1bbU5+hVcOeSX19Ue3qwQ+1iDBy5YgiP4RKGOmgfVYsUycsm
         Q242LUUnJaBffvJCqDYnogbGL7s/0Bp3wcoCl5pro+zq9Z32dFMBCzdY2fOJxP5sww8+
         0VasGlulvTSk0HmUVDXh5e7cHi0ZZG7woiQduhKqpBvmjdvmcIfdJnPQAY02EYtW4Kjx
         aPAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=0sxPU5EI8W7XsZ/VHAyzmuv8bFGXnRJUWkpy9JEyuz0=;
        b=DWAJZbBQ6moXN5vbsPhmi+UqIOLgCjnyVpcMvZ9bQE7xuelJAX4PEWYBxiYP/K+wkl
         PcNGQs/OlhOLzvc4zz1KKU8ePtemH9sRGZFulXSjABKPDWLCLeSuiX8S3eVVurRkCzHk
         fJzM/Zbl6ZCS7fyg6tFOXGK4zzzaXIf7AkTDRVvnyUvz+67mF6dAOXreGhEYsSAaxn/f
         nR5jSsnb3LQCTJtmzlG3P+wstYTJ0zlDUevr7tvN8TGPuOC1xCjPQym80rcaNEXFgzLC
         0oppTw8/waErRUD38ZpzNj6uqQkfy2jMEzLCyhwkEzwFZfuVzugwX3SISPNDiCE/+XHx
         5HkA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=t5sVydw7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y6si13158007ybp.319.2020.12.15.03.51.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Dec 2020 03:51:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=t5sVydw7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kp8rI-00029i-12
	for alex.bennee@linaro.org; Tue, 15 Dec 2020 06:51:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1kp8ox-00078e-Ct
 for qemu-arm@nongnu.org; Tue, 15 Dec 2020 06:48:47 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:34941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1kp8op-00014b-41
 for qemu-arm@nongnu.org; Tue, 15 Dec 2020 06:48:47 -0500
Received: by mail-pl1-x62f.google.com with SMTP id g20so10064281plo.2
 for <qemu-arm@nongnu.org>; Tue, 15 Dec 2020 03:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0sxPU5EI8W7XsZ/VHAyzmuv8bFGXnRJUWkpy9JEyuz0=;
 b=t5sVydw7QqCe0juTzxuLAtJc5QXf4Li/SB+I3Ud4yk+7ec254le8fNLMzW+GEoNGLm
 pk1XcQpFl31+l4a2ny6PuqzLh8X6NZAIaYqEDF9jgGTDRFkQd1Lsd35Nb8/IKGcDvWdO
 YiRChku2Id2Pb7VJmRW7BYusS1FgoHp8l/g56LMwEPcG3WB8xkRBzFuN7br8UvLPHIEq
 /yiJDW3KZkwXMsKQRbh1snIpMP2DjFuwVAI79So4BiF9NZIlweSerKtSP33TloMOnfxy
 h+DfksKtsfpT7mB68PZeCwa5NRy/zNdi2pEYGQ7aib6nrUaSq9LwuXuhsJ30+rGK3Tn3
 uPwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0sxPU5EI8W7XsZ/VHAyzmuv8bFGXnRJUWkpy9JEyuz0=;
 b=C7dD4OgyHIWowOEGVVpjGWBuaqGFkHEtMDMAgyPXNgy2Aq/aZo+FhlXGRMlOKHyGJJ
 bVWGvTWcOIt/fWayFtf7lDDTlzVSyo0nna/K+Ka6vNEx3dsvB8zxzRxyl9OqB7cdzlkn
 go92IKHrSXV7k4VpfBhnL9HUBsWqrgyTnSc+5AS9mxHH1bzUEi87v2Wdm1cC7CFksjdA
 CblIS+toqyLQr9naInffvUGXjpFWyELol85RTrEleQ2lk5DPxmsKFB6WZJeyAhmRpo8N
 SWgQ0mc5sjVe2SghGo/TPQMlgImDipIzdTtvOgtbVI+h2EdMapeQfrvt3rWeDHt7TnLJ
 5arQ==
X-Gm-Message-State: AOAM533fcQwFsgZ3ryODkYDUC8IVWJ0BSADL/5WDc5wkWIfKe0TEvjDN
 PrVoWAJXVqHkdp7y7U6febfC10zllW2/ZeO9T2tbAKj5s2KqxAxCAAbB7amG7kFre60hoarLeKg
 49xqdJEM/X7Drt3EmfNCp6iZUisHY9pK+nDdj6quG94ktq3A5VEQoRaRj2f79kGUG
X-Received: by 2002:a17:90a:bf90:: with SMTP id
 d16mr29827645pjs.200.1608032916901; 
 Tue, 15 Dec 2020 03:48:36 -0800 (PST)
Received: from leonardo.ba.nuviainc.com
 (cpc1-cmbg19-2-0-cust915.5-4.cable.virginm.net. [82.27.183.148])
 by smtp.gmail.com with ESMTPSA id z23sm23340001pfn.202.2020.12.15.03.48.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 03:48:36 -0800 (PST)
From: Leif Lindholm <leif@nuviainc.com>
To: qemu-arm@nongnu.org
Subject: [PATCH v2 1/5] target/arm: fix typo in cpu.h ID_AA64PFR1 field name
Date: Tue, 15 Dec 2020 11:48:24 +0000
Message-Id: <20201215114828.18076-2-leif@nuviainc.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201215114828.18076-1-leif@nuviainc.com>
References: <20201215114828.18076-1-leif@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=leif@nuviainc.com; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: C/xXMxG2rCrc

SBSS -> SSBS

Signed-off-by: Leif Lindholm <leif@nuviainc.com>
---
 target/arm/cpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 7e6c881a7e..5e3cf77ec7 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1883,7 +1883,7 @@ FIELD(ID_AA64PFR0, RAS, 28, 4)
 FIELD(ID_AA64PFR0, SVE, 32, 4)
 
 FIELD(ID_AA64PFR1, BT, 0, 4)
-FIELD(ID_AA64PFR1, SBSS, 4, 4)
+FIELD(ID_AA64PFR1, SSBS, 4, 4)
 FIELD(ID_AA64PFR1, MTE, 8, 4)
 FIELD(ID_AA64PFR1, RAS_FRAC, 12, 4)
 
-- 
2.20.1


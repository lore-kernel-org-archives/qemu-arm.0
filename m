Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp9092955lfc;
        Fri, 19 Feb 2021 07:08:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzhcrXwZQPnHrMaQdo8kw/fujhn1qtUJghPTPVWCr6W2zHa+A401q6t1WmSgiC5fgImMQMf
X-Received: by 2002:a25:bf8b:: with SMTP id l11mr14122206ybk.358.1613747303373;
        Fri, 19 Feb 2021 07:08:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613747303; cv=none;
        d=google.com; s=arc-20160816;
        b=G1xgBD+7Qw/QBovgR4ELwA2P8QpBt5YecxFpirSTgIqY4xNAAaLu5ouzI0IA2D8TSg
         os4AfFLyFRsOXS7q6z3WKNCSNdZTo5TYRywiebY9qGR/esp2sjw5fPHiZ4lt7ww4t1bj
         EMH+RJJlrEGsxXWBE689Ii0rVGYrRXYXxz4vwYoyoiPVGQCVoptlFRAy4Hv7xeZyITVW
         RjOR+7eABPb22BVFHScHmVf2mxe3cJhKDNu+CN+0ykbntSzByDkhXbksIbH7/nw3QOjg
         WI1pwGyw9V90hxPIpX2U3rmYkzC9M/fRFFRQyxGaiz0RC2M+71Wa7ijrYLQJWzd09HYf
         2COg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=JMvousW6dbRJz+5fKLTeFi4X/6d1tXrTIZkdqfZYup8=;
        b=J/uttvKwLRzAERmuQmVvEQ8BGlK5Io096A1M+rlcfabagMtlU2XO29VXtDvuFOZRPQ
         FwnGgmwl+Lfgwi/JHMR9FsSLUX8ZRI0HAcdM78GpwvMb/IA8R1YB4V3KXJkDJXGO9Y1a
         3K0JvjcSo4ZWmCN0LkwgX1jsUqQW4A/1PWySfB5DEiGlRiNyvg9/soUZMk70Oy4/iWTl
         4tqbndAMiiaTeBeTBFhY2TKXYjqDQMaBk3n7IozoxYSP4TVv8AAlG9ijVRXKFzNLk7HL
         ju90B3cafb509dP6OrD/0zuF7JLSFS+0zeTz/eyVv09PwGrWVQ7XVAIkv7seuHM52691
         ZBeQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=d5RoKX1d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z65si9504294ybz.289.2021.02.19.07.08.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Feb 2021 07:08:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=d5RoKX1d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lD7OI-0003co-HY
	for alex.bennee@linaro.org; Fri, 19 Feb 2021 10:08:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD73m-0002Xl-Kx
 for qemu-arm@nongnu.org; Fri, 19 Feb 2021 09:47:10 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:38369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD73N-0003c5-2F
 for qemu-arm@nongnu.org; Fri, 19 Feb 2021 09:47:07 -0500
Received: by mail-wr1-x42b.google.com with SMTP id b3so8886756wrj.5
 for <qemu-arm@nongnu.org>; Fri, 19 Feb 2021 06:46:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=JMvousW6dbRJz+5fKLTeFi4X/6d1tXrTIZkdqfZYup8=;
 b=d5RoKX1duLD8Ut+LGi2k9f1iKuckZckCEppMpZNtf3nSsURo9y6kJEubimv7yL0W8g
 j+PyPZjJyfa4HrRbsa8EulEMadSrFIsCkI0xaYUwhnclgNW/ULQ3I9AvlXrIT8nr21Li
 Xilp9ezX6dCeBi3rbG7lSJrvAslah7l958GF3jkTIkHKsSFXaZNMo9gJO2B3+LuRIfuW
 zCK0IkV0fbhC0p7uu68Kpi3WWq4oDw7uLp9PsjJg2yM5xPxsQSH/Qdr+29i+M9hxsuC4
 l2cNuT8qlRlfLJ/M4SUFWf42geAqMV9zwq+t/fH5IgBX6aQzlF48Fe4wtTea3Bs7TKkM
 l3LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JMvousW6dbRJz+5fKLTeFi4X/6d1tXrTIZkdqfZYup8=;
 b=T81+cZ7LIBRPxAcrHkrIDP3obV4DL9Qv8QBpNBhxDklE+e8QMKSvL0QxGEz8x8Y+SM
 zDFUMDpBvfYtmXCBXi9CD/QMg6YfF2wFD/s1ZFHTbS/ueGuH70sLnSoqbvQlYDV44XX3
 iTvaVW9nw+o1jOYvVBtdn/pm0mh92DrX4EtC6+OEt/PaDWZuxdWdbG1A/fZMrfZwrJ8w
 8HXEYcMzk89nHsnSTjxwFfrm4t9zG+7VqMB4xxZ7HU4KgSJT32HYfOInXsJXxj5hyhA+
 6rw53sRWYnXabmfCAsCEiVvsah0RQpgB355H2GrWMXsdddJJvCLeyTVBa5qCJALab5mN
 e34g==
X-Gm-Message-State: AOAM533XV7tX8mQkKhAuNJEKDSKOFRFqbFnarBofCH12BGcyr4dj+EHw
 QizHx+EIM9XTOmpeDDby/57TNwLhs0hs0A==
X-Received: by 2002:adf:dfd1:: with SMTP id q17mr7519859wrn.273.1613746002694; 
 Fri, 19 Feb 2021 06:46:42 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q18sm2263628wrw.91.2021.02.19.06.46.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 06:46:42 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 30/44] hw/arm/armsse: Add missing SSE-200 SYS_PPU
Date: Fri, 19 Feb 2021 14:46:03 +0000
Message-Id: <20210219144617.4782-31-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210219144617.4782-1-peter.maydell@linaro.org>
References: <20210219144617.4782-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4+SsAdTXLRnf

We forgot to implement a TYPE_UNIMPLEMENTED_DEVICE stub
for the SYS_PPU in the SSE-200, which is at 0x50022000.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/armsse.h | 2 +-
 hw/arm/armsse.c         | 9 +++++++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/include/hw/arm/armsse.h b/include/hw/arm/armsse.h
index eb4e937173f..104ba8d26ec 100644
--- a/include/hw/arm/armsse.h
+++ b/include/hw/arm/armsse.h
@@ -135,7 +135,7 @@ OBJECT_DECLARE_TYPE(ARMSSE, ARMSSEClass,
 
 #define SSE_MAX_CPUS 2
 
-#define NUM_PPUS 7
+#define NUM_PPUS 8
 
 /* Number of CPU IRQs used by the SSE itself */
 #define NUM_SSE_IRQS 32
diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
index f72d1adafea..f43f0524e28 100644
--- a/hw/arm/armsse.c
+++ b/hw/arm/armsse.c
@@ -320,6 +320,15 @@ static const ARMSSEDeviceInfo sse200_devices[] = {
         .ppc = NO_PPC,
         .irq = NO_IRQ,
     },
+    {
+        .name = "SYS_PPU",
+        .type = TYPE_UNIMPLEMENTED_DEVICE,
+        .index = 7,
+        .addr = 0x50022000,
+        .size = 0x1000,
+        .ppc = NO_PPC,
+        .irq = NO_IRQ,
+    },
     {
         .name = NULL,
     }
-- 
2.20.1


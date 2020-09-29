Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp4414892lfq;
        Tue, 29 Sep 2020 02:44:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxGK5/neHg5Eq5xR2n2Z8ZbsP+yFSydGblrXLw7hpQDZfgoj/4Bi7NvVthRcuCbV2H/dUYj
X-Received: by 2002:a05:6902:601:: with SMTP id d1mr5500038ybt.172.1601372679191;
        Tue, 29 Sep 2020 02:44:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601372679; cv=none;
        d=google.com; s=arc-20160816;
        b=esvtVpyaR/Hrv9uZJRIeClJHDtlEIdVxqr1mcy4F74lnRZTjcJNQuHylcBOOKYTaE6
         N9VB+cJhpnYybdr7TFHmMrNE6I507lZQ9Z4y2HuaggH2/CDPDihmBlqXbZWzkHEJvwNM
         3DSMTT2zdgyglKu9YTL99ZUuRj98u2IXZxcgG/6FP3NcP59A93rErD0JIesCf+w5ictU
         IUM3DdYzr7hSKd6HBCC4+Z3INNWs8CZZV7XPIWhNLaLp8i43C3Wj00sbfhnXqLNvdPfr
         nHTZflyl5bIcA3Q6ArjFGq3U9dQjOdXbo70z/T8ETKD/e0QHVCuXhOadphxWXgPDISrm
         lVZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=OdqFefkl4maWCp9vvcc70mZR+cDjhhDDVOWkpRFdv+A=;
        b=JzgSJUSOIczCbhk5ZEvIeppnHJ0WHpZ7+fl2pI2B7/KeXjd0+5VxThEUiWyftz4mMV
         lsO7SvTRXeXhpK0N57jhCWBM29CQHH07iiagrle/XqD/RFD2AX0ivcGEuT1G0SqqQb8a
         x5Ros2yGNYoRoWld5dhX+2eVg0OxtiYjkdZxpkvYh9uDIiYOhxiIsz6fJBWjwYuhbV4/
         eIt+nlC6uKHcZCxk7cAKpEAatSlQPgHPUBrPNShSlCP2xG+O3BhPIlUIj0Cd4nZQQRQH
         MrZKjRMfEs0b06loWQIDJaMi2l1zkFsK/P/8wEEwD22QHS6ZXZlM5bGBMEKjR5hhZZCY
         nyiw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b="lg6y/3mW";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s199si4338019ybc.19.2020.09.29.02.44.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Sep 2020 02:44:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b="lg6y/3mW";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kNCBa-0000G1-Ia
	for alex.bennee@linaro.org; Tue, 29 Sep 2020 05:44:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <graeme@nuviainc.com>)
 id 1kNCA8-0006hQ-V1
 for qemu-arm@nongnu.org; Tue, 29 Sep 2020 05:43:08 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:35016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <graeme@nuviainc.com>)
 id 1kNCA7-0006pI-EG
 for qemu-arm@nongnu.org; Tue, 29 Sep 2020 05:43:08 -0400
Received: by mail-wm1-x343.google.com with SMTP id y15so4098152wmi.0
 for <qemu-arm@nongnu.org>; Tue, 29 Sep 2020 02:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OdqFefkl4maWCp9vvcc70mZR+cDjhhDDVOWkpRFdv+A=;
 b=lg6y/3mWBcMche6SvRrPGMI6wPdHN6q5WCNia8LqacOUHfXahU07EmM+AKWo7LmAey
 ETmqnBqMWz3/JnuY8SjrkKbsIzSug9OERSMwZ0NbsIwNwNbd2BJWllR6VaTh7AMtfoEL
 NW4xhnYkOSDa4xlWhVp4f0ghqfKKA5wJEHj92K+Q2M5zzJuOkf+Mu9s5Gl3ovdwDup3/
 pOjNBSy8NOjLXK04VDg8FnbHXaMEIgsVZWzmK/pXOooyX5XVKSvHzYmvigHmVVQdGIKc
 44+7D0QrOFBu918qtyN7n2yoNkRV39/X0T0RG7+WNnf2MQDXxlnyZeOEwSyEtD0+jGCA
 ld+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OdqFefkl4maWCp9vvcc70mZR+cDjhhDDVOWkpRFdv+A=;
 b=N26XDIM3w+GaYDEbNQVK4mkV51UV+5x0vlXbkuYpIA4Z+scJbOcRR0wpptimkJCdvM
 npd0+BSDujRK+QmpzbUYmV0MKqbi/wYaK5mVJwZLHhbHZMh3XDB0SR/Q+tEcGrxcNY1N
 rCiaA1GZpgfk51it7/TQOZAOWHsWRdxh7lpPKiA4zRK2QjX/i4ceXlfTydKtFDCgMbwv
 2Kilc2TdkIVPDpbmPs9B+cF9d8GshekDxqsBMxCPfYERmJMcoOe7pD+tauLXhPkOoTxY
 CYotuIFyvy04ahC/qMZBbabDyqP5RmFZBF/GOARm/ao1F8PkaAzs4fCKGk1bX8fk6BKb
 ha7w==
X-Gm-Message-State: AOAM531yt6o6vc2P9Guejl4ssj+cXQggPXkZIyBVhyD5UYTfG6pTJok7
 zbCZutL0YwdDdj2LxlUpiF6jeFJ6IfsXxQWHnNLZ8RbC5oXZULVCyPBdJ6zF8mwDr8hzLXoNEZx
 bL0RhWwjL0Pi734wbulKh7eHcOwut8HNsuxYuWw4aKMRTTLcNBrFroRQ2rcdO0K+vmeiMpQ==
X-Received: by 2002:a7b:c3c8:: with SMTP id t8mr3566696wmj.101.1601372586006; 
 Tue, 29 Sep 2020 02:43:06 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8010:64d6::1d89])
 by smtp.gmail.com with ESMTPSA id t6sm5887797wre.30.2020.09.29.02.43.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 02:43:05 -0700 (PDT)
From: Graeme Gregory <graeme@nuviainc.com>
To: qemu-arm@nongnu.org
Subject: [PATCH 1/2] hw/arm/sbsa-ref : Fix SMMUv3 Initialisation
Date: Tue, 29 Sep 2020 10:42:50 +0100
Message-Id: <20200929094251.151722-2-graeme@nuviainc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200929094251.151722-1-graeme@nuviainc.com>
References: <20200929094251.151722-1-graeme@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=graeme@nuviainc.com; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Graeme Gregory <graeme@nuviainc.com>, peter.maydell@linaro.org,
 jamie@nuviainc.com, rad@semihalf.com, qemu-stable@nongnu.org,
 qemu-devel@nongnu.org, leif@nuviainc.com, f4bug@amsat.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: P/Pa2iJX32HE

SMMUv3 has an error in previous patch where a i was transposed to a 1
meaning interrupts would not have been correctly assigned to the SMMUv3
instance.

Fixes: 48ba18e6d3f3 ("hw/arm/sbsa-ref: Simplify by moving the gic in the machine state")
Signed-off-by: Graeme Gregory <graeme@nuviainc.com>
---
 hw/arm/sbsa-ref.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 257ada9425..47e83252c1 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -530,7 +530,7 @@ static void create_smmu(const SBSAMachineState *sms, PCIBus *bus)
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
     for (i = 0; i < NUM_SMMU_IRQS; i++) {
         sysbus_connect_irq(SYS_BUS_DEVICE(dev), i,
-                           qdev_get_gpio_in(sms->gic, irq + 1));
+                           qdev_get_gpio_in(sms->gic, irq + i));
     }
 }
 
-- 
2.25.1


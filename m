Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1316198wrt;
        Wed, 16 Jan 2019 19:09:49 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7wp5weVr+sS241dHvwe322VwHs+QYOOkAAgJtUE1KyZbt529XRPaxBV46+s/FKfKy0WZxr
X-Received: by 2002:a1c:bdc5:: with SMTP id n188mr10361354wmf.69.1547694589700;
        Wed, 16 Jan 2019 19:09:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547694589; cv=none;
        d=google.com; s=arc-20160816;
        b=L0aVozKAkh4KOR9FHTtmszuMUfywHeivIUxNiILpG4l/VDHUndUGVcJXU8gRSGqLYH
         FSYh4t/GpW/xd8sUmAQF5R/RqSk4sTpA5NvbCaQZzt1jnk/F3ne05Pm6JNHu3muTdTxW
         rKpaexTagRYTaOQd9OeaRHfnUlQdRb92qDMa84FAR1Mppyam46P1w9Zt40UmkfoSZDwH
         iI2eYtYRxW9SF7777oUQKS+OByO2SN3fhLKI3mZHGd/rznS4jr/Rby4zVCfY5Cv/oRB5
         czt29MAGPFhs7K4NoSoEUOV6qWZ/eK9Nt0/s65GCOv2QQ5yt7naJ2F6RPSQVrZ47A6Cm
         qi2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature;
        bh=tAbRK/AWtCj5C/OoApgxH8zP11ek+7ilq7+GGiiBQQc=;
        b=blvcq14016VuhOL3tDhMan3IsRzNmxVUR0RYq4jTn+kOCK57sV7GZMdYRffEv/enQ+
         WBi6OOQfN+zMxL9GG1Vx0HkdlwlfK5H6UoLFfacZkXZ3zBauIbY0YSHVTWmzf7EvjKOI
         aoeJEMRfRvd5ban6gdoKR4Rv9h8roSgN0L/q9ZeIGy5OrhlZ7kWmIMA0pL1yFhrW+9YT
         2MRuHnwhH9siLUbSnuSBHc17SjFpbXf0Mak9Xq9sPdX6vrwxF0wUTSVg7urE66hQkwiw
         uBJFGLbsh1h2D4Adwd8IyWLxPGBQ+L9fDWtE1cbDymR9tuRcNWwHdm/KHNsjic4V7f9i
         wSXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=VpwPGNB0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 206si24163826wme.192.2019.01.16.19.09.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 16 Jan 2019 19:09:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=VpwPGNB0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:59616 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gjy3w-0004nZ-RG
	for alex.bennee@linaro.org; Wed, 16 Jan 2019 22:09:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44921)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhaosl@gmail.com>) id 1gjy3m-0004mu-KB
	for qemu-arm@nongnu.org; Wed, 16 Jan 2019 22:09:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shannon.zhaosl@gmail.com>) id 1gjy3m-0003vd-1L
	for qemu-arm@nongnu.org; Wed, 16 Jan 2019 22:09:38 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:41564)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <shannon.zhaosl@gmail.com>)
	id 1gjy3k-0003kN-0Y; Wed, 16 Jan 2019 22:09:36 -0500
Received: by mail-ot1-x342.google.com with SMTP id u16so9816466otk.8;
	Wed, 16 Jan 2019 19:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=tAbRK/AWtCj5C/OoApgxH8zP11ek+7ilq7+GGiiBQQc=;
	b=VpwPGNB0MovEyYHfrXAx17ASR6Q9yY0Dpd/gHLeS3s7Cgh/r3uLFtKIalNPbVPa1ZI
	d3CHYf01V1MhZPmNcFjNoN17Jrc2t8LIo+gRjjUPno+/9pDmAn2OtQQyAWUPNrjsnkAo
	YxeYSuGKrrnA6iZXqV+6O8N/J7rMhPcSY+OBkRQRvQkfElJLZhjCoRLiQggljVMcoe6X
	m9WV+ApQs9dUsNAsa7atbPEy2c0xGlACe1yhk0h8D2yWq4Ac7B4nByDI/Z0MG64gmY+e
	OHB6QVN6YsYadiDV3GPzL3JH0gi/25oEjc9Z1C39MxouDMDHWfqQ4tCvP3sG0qcMEwBZ
	LLpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=tAbRK/AWtCj5C/OoApgxH8zP11ek+7ilq7+GGiiBQQc=;
	b=ozkIn1/q7aX8c7f/DjBlzeo4rLwTc8nXY5nyIhHudzUqsbQ7hs+6yNHye+aPLjqJ14
	JHCOPue2q3mD4eaFab+2rivFDmIO2m2geIcP9LK+lUy0fSCwWd/qtt+n++rDZfsUUi8U
	iS7WC0cEhFMvF+4Oa7Twuvdb4EjFNHqJm6zODOgr96bvagh5hMj5CfLB8YbQkzdjr/s2
	WIvU5T3tDY9kQauC/m5SK8S03qZOqLMpKFULNy2JKgyxY0JkIBMWp1mzY+cUU54xw3uw
	a1hmwz18F2wkfZu5Qs1I9Yi1/k8tUYy19Iu3Dcn28GUB9zTMB6V4P4xwh/at9oWXD3FP
	1dkw==
X-Gm-Message-State: AJcUukcekPbUu4jaOK7BGU7o9p/gZcn1aKh18w14J8DsJk8p2zvasjG9
	4kFgIBbRejdd3P0KcbBKEBLYiyh0
X-Received: by 2002:a9d:664f:: with SMTP id q15mr8202644otm.282.1547694564708; 
	Wed, 16 Jan 2019 19:09:24 -0800 (PST)
Received: from MININT-0CAG7HA.hz.ali.com ([47.89.83.50])
	by smtp.gmail.com with ESMTPSA id j5sm136947otc.54.2019.01.16.19.09.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Jan 2019 19:09:23 -0800 (PST)
From: Shannon Zhao <shannon.zhaosl@gmail.com>
To: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Date: Thu, 17 Jan 2019 11:09:17 +0800
Message-Id: <20190117030917.18844-1-shannon.zhaosl@gmail.com>
X-Mailer: git-send-email 2.18.0.windows.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: [Qemu-arm] [PATCH] ARM: GIC: error out early when creating VGICv2
 failed
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 996cvmyYnM3Q

Currently if creating a gicv2 VM on the platform without
VGICv2 support, it failed in kvm_arm_pmu_set_irq while
trying to set the interrupt number for PMU with below
error message.
KVM_SET_DEVICE_ATTR failed: Invalid argument

This error log is a little confused. Also it should error
out in kvm_arm_gic_realize early.

Signed-off-by: Shannon Zhao <shannon.zhaosl@gmail.com>
---
 hw/intc/arm_gic_kvm.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/intc/arm_gic_kvm.c b/hw/intc/arm_gic_kvm.c
index a611e8e..b4f2133 100644
--- a/hw/intc/arm_gic_kvm.c
+++ b/hw/intc/arm_gic_kvm.c
@@ -554,8 +554,9 @@ static void kvm_arm_gic_realize(DeviceState *dev, Error **errp)
                               KVM_DEV_ARM_VGIC_CTRL_INIT, NULL, true,
                               &error_abort);
         }
-    } else if (ret != -ENODEV && ret != -ENOTSUP) {
-        error_setg_errno(errp, -ret, "error creating in-kernel VGIC");
+    } else if (ret != -ENOTSUP) {
+        error_setg_errno(errp, -ret, "error creating in-kernel VGIC, maybe "
+                                     "vGICv2 not support on this platform");
         return;
     }
 
-- 
1.8.3.1


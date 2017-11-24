Received: by 10.223.159.82 with SMTP id f18csp2104548wrg;
        Fri, 24 Nov 2017 05:33:35 -0800 (PST)
X-Google-Smtp-Source: AGs4zMb8PZhwcRPfV/YyDVL/tX2wstqt+T/uiCRNYCURC+yI8GBv3LMbPCZmHzfV+fd3Cs/NK7fX
X-Received: by 10.129.178.72 with SMTP id q69mr8169475ywh.294.1511530415283;
        Fri, 24 Nov 2017 05:33:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511530415; cv=none;
        d=google.com; s=arc-20160816;
        b=r1V4wsAAqsvWubUrHO9Z55034ycUzRLZHH6WT9PagZ3d++PaySLExz2vo+q5Xox5eW
         OJx3BkGLD+2OrTVIHrMw8LufUPoVxS9UmmNne/ezQ04mPGIfqjXG+CGOI5f0Voxn0uEr
         g76yRIsM1GHZtxB2yaQ8TDm8aOXx/XReX89vlh/uM/1TX119F8IaHHUPa5dn4Junkrlk
         +KDxRlbFk4QDNX2YAyFykKLLeH1x14FPp3HuvcE/9jXqpNcad9zu2akZJjFejxmqpilX
         IaejnxUh0dUcUsy9pqi5OhLFeulgjV3RR5xuoqW2YtpnsS3uPVstMGAV1mebM98XWkpW
         fRLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=vV8Xvyh//WgaW7UJMFPMJrBYQlHWF5D3TB91hSdJViM=;
        b=CAGxNIl/EYpGpO7G5o7ZVr658TGcUZqIuNcilnL5XcDpvFH+cbI6EgsgY0pN42kGhk
         6wqVzMnYXM+I5ubVvf7n+UbDufThz+Y+PlICoF00rqAaBSjlVc0YCrwE+gSLoklgS+6e
         TsaVoZyZs99sGxGoJQtSTavu5h2l2WbMlei/xHsvga1qBBb3ngvqw290gF/nhrVDJVto
         byRZKAGVGYxshY4XZhaL/DldMWGyTsVcOL6CLPa+SH4CiihVDkIr4JbcYJurELmLtc45
         eXSMU6KaD6sqkBIhTqBeIu7GNbYPhG82jSazGOGcLrQifmh03McV6bOfeyG+cGA10mwv
         2OhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d10si4640638ybm.831.2017.11.24.05.33.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 24 Nov 2017 05:33:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49288 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eIE6o-000364-MT
	for alex.bennee@linaro.org; Fri, 24 Nov 2017 08:33:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45057)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eIE4g-0001q2-Tw
	for qemu-devel@nongnu.org; Fri, 24 Nov 2017 08:31:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eIE4d-0001ul-Ld
	for qemu-devel@nongnu.org; Fri, 24 Nov 2017 08:31:22 -0500
Received: from mx1.redhat.com ([209.132.183.28]:45458)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1eIE4Y-0001tk-GE; Fri, 24 Nov 2017 08:31:14 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 94C4B47F6;
	Fri, 24 Nov 2017 13:31:13 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-117-138.ams2.redhat.com
	[10.36.117.138])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 081D25D6B2;
	Fri, 24 Nov 2017 13:31:01 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, wanghaibin.wang@huawei.com
Date: Fri, 24 Nov 2017 14:30:38 +0100
Message-Id: <1511530238-18318-5-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1511530238-18318-1-git-send-email-eric.auger@redhat.com>
References: <1511530238-18318-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Fri, 24 Nov 2017 13:31:13 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v4 4/4] hw/intc/arm_gicv3_its: Implement full
 reset
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: wei@redhat.com, drjones@redhat.com, vijay.kilari@gmail.com,
	quintela@redhat.com, dgilbert@redhat.com, wu.wubin@huawei.com,
	christoffer.dall@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IynlMZK4Rqgt

Voiding the ITS caches is not supposed to happen via
individual register writes. So we introduced a dedicated
ITS KVM device ioctl to perform a cold reset of the ITS:
KVM_DEV_ARM_VGIC_GRP_CTRL/KVM_DEV_ARM_ITS_CTRL_RESET. Let's
use this latter if the kernel supports it.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/intc/arm_gicv3_its_kvm.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/intc/arm_gicv3_its_kvm.c b/hw/intc/arm_gicv3_its_kvm.c
index 83e5268..bad593f 100644
--- a/hw/intc/arm_gicv3_its_kvm.c
+++ b/hw/intc/arm_gicv3_its_kvm.c
@@ -204,6 +204,13 @@ static void kvm_arm_its_reset(DeviceState *dev)
 
     c->parent_reset(dev);
 
+    if (kvm_device_check_attr(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_CTRL,
+                               KVM_DEV_ARM_ITS_CTRL_RESET)) {
+        kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_CTRL,
+                          KVM_DEV_ARM_ITS_CTRL_RESET, NULL, true, &error_abort);
+        return;
+    }
+
     error_report("ITS KVM: full reset is not supported by the host kernel");
 
     if (!kvm_device_check_attr(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_ITS_REGS,
-- 
2.5.5


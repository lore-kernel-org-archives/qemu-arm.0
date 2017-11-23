Received: by 10.223.159.82 with SMTP id f18csp838966wrg;
        Thu, 23 Nov 2017 06:59:00 -0800 (PST)
X-Google-Smtp-Source: AGs4zMbDjCbeqYVBlLILT9pfGfZcOZybKpWDshPVdaA1nmxND4Xn72yHR9hMpkJY/FxITDzj1D0j
X-Received: by 10.37.133.17 with SMTP id w17mr14964943ybk.451.1511449140716;
        Thu, 23 Nov 2017 06:59:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511449140; cv=none;
        d=google.com; s=arc-20160816;
        b=b3/MvdLx/hVCsnn1Nbum5sFaKWivXU1HtlSnqkZeR/kh97Zyg0BJJYhRMam148IeTq
         i0i7Ut4AGPq/9eOTk4qzd1HN2ThFbxkTyUuxnN8NTkZPhJUgIzSK1rhBHJzxw8WKLO8z
         3CQ0NpZ9ul7ttXDjNw8rIYjT8v+thhQoHkuQXZViYviBZ2Eg2eB0EfYMH8SP9fMBbBK7
         EZzL9dM54stAnePb13Zm9NoAypl2a4YK9Mc8rDdQC04hoQkSXc7v6ujdDTs4YUGvvqbV
         uPS3q8fyvYHOJhv2qX8wPIlyQcIigAvFi0fgKPyTzi0ICQb3CqJqjKta/x+m2C0MwRcX
         wYKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=vV8Xvyh//WgaW7UJMFPMJrBYQlHWF5D3TB91hSdJViM=;
        b=qA4z+QaL9eyvJmPpCGUPBC51Z7YHeRdkWUvuK2Y6a78ocEyluTAyM13Vq/c9s+H62i
         VZF4X6Otd7op9Sc9JfoSQWey8uMkrrni72TbOQn/EU6yPMxX9ilAY/G1kfFnG2sGnYs1
         x3sY0tKOp2UkZUzjNXJrD1AKiFHVYLAh1Uv63Kl+ATwMrx/rKq6tlMEMoly3HfcixLJH
         bnCEut+VLt4LOLJUUbNDyIvJL454zH6wWd2BE26oZQtLCWtG4HkzrTm7RDmlBw/6W7Q/
         ewMlOxIl1OshXucRJDDsSsWlPVGskbUoQ9N47yugQHYKUvsQCz6xuZXEXKM4K7eibOT2
         8oFA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y3si2019180ywf.324.2017.11.23.06.59.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Nov 2017 06:59:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44745 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eHsxw-0003FN-4t
	for alex.bennee@linaro.org; Thu, 23 Nov 2017 09:59:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40422)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eHsvx-0002AH-D6
	for qemu-devel@nongnu.org; Thu, 23 Nov 2017 09:56:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eHsvw-0007wH-Mp
	for qemu-devel@nongnu.org; Thu, 23 Nov 2017 09:56:57 -0500
Received: from mx1.redhat.com ([209.132.183.28]:53016)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1eHsvu-0007rv-OB; Thu, 23 Nov 2017 09:56:54 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 941A87EA9A;
	Thu, 23 Nov 2017 14:56:53 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-117-138.ams2.redhat.com
	[10.36.117.138])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 627E75D6A5;
	Thu, 23 Nov 2017 14:56:50 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, wanghaibin.wang@huawei.com
Date: Thu, 23 Nov 2017 15:56:15 +0100
Message-Id: <1511448975-28326-5-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1511448975-28326-1-git-send-email-eric.auger@redhat.com>
References: <1511448975-28326-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Thu, 23 Nov 2017 14:56:53 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [RFC v3 4/4] hw/intc/arm_gicv3_its: Implement full
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
X-TUID: dH/2FcovVqJ1

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


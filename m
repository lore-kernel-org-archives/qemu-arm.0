Received: by 10.223.159.82 with SMTP id f18csp2162575wrg;
        Fri, 24 Nov 2017 06:22:25 -0800 (PST)
X-Google-Smtp-Source: AGs4zMZ5PRYB5wKGaaJsBR9oi4FzzQDnpvoMtIfqo836pWVNbEhXg45YsNi2pzcZ0q3NsY4ZylBk
X-Received: by 10.129.193.5 with SMTP id f5mr19206265ywi.297.1511533345112;
        Fri, 24 Nov 2017 06:22:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511533345; cv=none;
        d=google.com; s=arc-20160816;
        b=scJf2vpOyDCXcZCD1mI7Zp12s9WhSySxK9Limi6UNXYjWlSMHkPbWtpmQXXJptIrIn
         jLraFav6pYEThdZ21as2ymIpy1z+SgrBvlpM8pWcrBla+VEaWN0c42mWeZSzpG8rsACX
         X1crGoiE6mZzQ0kqPebKAOMf43W1KPGHDA8DsbENCFCy8SPnrMLPvo+mxYgZ50YROFiv
         wQJXCGrkjRq2xPOo+rbZ/2JrnocqnHoWuuydeSIZhQiWIidEyDg4P6cIfaq/NUCYK94z
         2rQNNSyon49O2/PTKQI/xvjbUVddQpmn55ebdmh/x0TAiCOWf/id99ZJygvcX1JYZrpV
         /UdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=OW+gY7GvZgfWs5ZVp38eDCivn+679kVnEDSxPdqjmxE=;
        b=kMvNv+JGKJVSvfZNw3GIWz0OkC5p+mF4IUMr5ei2VPt5dudqpyOnOb9BMLq6493yAA
         bBs0Kok5uaiQzAZPvvVTABUF9yfNrBQnXz1SOM8jOAIARB5H0NvrZp3p9PSZ4o8xgbK0
         EGdlKk1q7fjXaklN4R6V+jbvhZ29Rw9cSKnrY8GdZurBFUVrZpiqAG7vIqxAgIXFexsp
         eKwbQqn4yD91OF6X1WUqtUz90APSJZ3VbAkoTnPW7f2H9N7mOWfz7tXebIgYw26zAns9
         D3cnz4sMfrIfWQGpwN3AiK/fhigr3aik9+bONBu/Qf8MHxXhH/WrD73W09ADbCdHc4Sl
         99Vg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w4si4799151ywe.314.2017.11.24.06.22.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 24 Nov 2017 06:22:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49527 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eIEs4-0008BF-I5
	for alex.bennee@linaro.org; Fri, 24 Nov 2017 09:22:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57025)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eIEop-0005Xf-Q2
	for qemu-arm@nongnu.org; Fri, 24 Nov 2017 09:19:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eIEok-0001Nq-Sp
	for qemu-arm@nongnu.org; Fri, 24 Nov 2017 09:19:03 -0500
Received: from mx1.redhat.com ([209.132.183.28]:50224)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1eIEok-0001Ne-Ml; Fri, 24 Nov 2017 09:18:58 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AB503A8AD;
	Fri, 24 Nov 2017 14:18:57 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-117-138.ams2.redhat.com
	[10.36.117.138])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 074FF600C0;
	Fri, 24 Nov 2017 14:18:52 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, wanghaibin.wang@huawei.com
Date: Fri, 24 Nov 2017 15:18:27 +0100
Message-Id: <1511533107-5315-5-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1511533107-5315-1-git-send-email-eric.auger@redhat.com>
References: <1511533107-5315-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Fri, 24 Nov 2017 14:18:57 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v5 4/4] hw/intc/arm_gicv3_its: Implement full
 reset
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
Cc: drjones@redhat.com, vijay.kilari@gmail.com, quintela@redhat.com,
	dgilbert@redhat.com, wu.wubin@huawei.com, christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bKy3rqu41hH6

Voiding the ITS caches is not supposed to happen via
individual register writes. So we introduced a dedicated
ITS KVM device ioctl to perform a cold reset of the ITS:
KVM_DEV_ARM_VGIC_GRP_CTRL/KVM_DEV_ARM_ITS_CTRL_RESET. Let's
use this latter if the kernel supports it.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/intc/arm_gicv3_its_kvm.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/hw/intc/arm_gicv3_its_kvm.c b/hw/intc/arm_gicv3_its_kvm.c
index 8e307c9..bad593f 100644
--- a/hw/intc/arm_gicv3_its_kvm.c
+++ b/hw/intc/arm_gicv3_its_kvm.c
@@ -204,7 +204,14 @@ static void kvm_arm_its_reset(DeviceState *dev)
 
     c->parent_reset(dev);
 
-    error_report("ITS KVM: full reset is not supported by QEMU");
+    if (kvm_device_check_attr(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_CTRL,
+                               KVM_DEV_ARM_ITS_CTRL_RESET)) {
+        kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_CTRL,
+                          KVM_DEV_ARM_ITS_CTRL_RESET, NULL, true, &error_abort);
+        return;
+    }
+
+    error_report("ITS KVM: full reset is not supported by the host kernel");
 
     if (!kvm_device_check_attr(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_ITS_REGS,
                                GITS_CTLR)) {
-- 
2.5.5


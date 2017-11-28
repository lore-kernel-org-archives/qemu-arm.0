Received: by 10.223.159.82 with SMTP id f18csp3043095wrg;
        Tue, 28 Nov 2017 07:44:54 -0800 (PST)
X-Google-Smtp-Source: AGs4zMYWwlQM+gCItACKLk+6ZZUN3jaLa460bgu2kF9r0JetRS4irkLTe1lc7sqwkUq1xDjDYAWd
X-Received: by 10.37.215.21 with SMTP id o21mr27618641ybg.484.1511883894895;
        Tue, 28 Nov 2017 07:44:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511883894; cv=none;
        d=google.com; s=arc-20160816;
        b=r3xNw9lRM96DncEo8tWZNzHw/7gIJQCAuqqVEQOPJ+s3BM5Ex5GfnDj5GAtdg2RdPC
         E8SCjhZkpP20GKZMrwXLWWe+q0k6XK7Bw8AXHF8ZBNh/CZ7dyD/3tYOOoQdAWMCSOObc
         8K2I9Zup6q4bHPyPkINQNNrOHwXn1BaNKInrxZ/L7pG3inoEPnnAYQUsDC4DZs5yYSJT
         +kvSDY3xX52WEEKRaBP1NANtnaE94ju30fWa5OFRwnkkJcqRRWcIE6zDIkI4UV2gjVuS
         i1c6eE2gMScthKZ7waWc8nyXQqbctSNG/6WcyyuWBEGWTUqV5QxNyBNJVvUDjFMBpwwm
         /aBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=K21myjNTYSOborzxd85BgyldwTEw+nvpWJDxi14tGyY=;
        b=VNfn6jcpBgKJGdGb6Fy6+bxMapxfPjnYWJgexCVWZbvM1ldjU2h7pAyMpJOPa4VWEl
         wMUNZ8N+8KNcSLnRMwdhct/iOoDD9vLYm67wHC81uOO3RNYFGK+bUF851k4FW0QUFcCt
         tTDuMIrGCdLAWyInOuGursh/QWM5kv9t5mqRuBhIlYQHWOSBC2xoA1YTz32U8q1lpoop
         pS0rpyCJcH8JEZrSzScPbhOHKpGxtAJ1lO2nRD7X//2YcJfO6nftIIrLMqHQPxEW3fl0
         FxxqQ4nryAHIq1+2UQuQVogZEVK6IIplv0hzr9sx7zuw923D+lyjyMB1SZEKek7O7AtQ
         rJYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u13si6553784ybj.416.2017.11.28.07.44.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 28 Nov 2017 07:44:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38519 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eJi46-0005Dp-7p
	for alex.bennee@linaro.org; Tue, 28 Nov 2017 10:44:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33068)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eJi1V-0001VR-Ey
	for qemu-arm@nongnu.org; Tue, 28 Nov 2017 10:42:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eJi1P-0004zn-Uh
	for qemu-arm@nongnu.org; Tue, 28 Nov 2017 10:42:13 -0500
Received: from mx1.redhat.com ([209.132.183.28]:49568)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1eJi1P-0004za-OI; Tue, 28 Nov 2017 10:42:07 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D308F4DD7C;
	Tue, 28 Nov 2017 15:42:06 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-117-138.ams2.redhat.com
	[10.36.117.138])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CFB235C1AB;
	Tue, 28 Nov 2017 15:41:57 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, wanghaibin.wang@huawei.com
Date: Tue, 28 Nov 2017 16:41:32 +0100
Message-Id: <1511883692-11511-5-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1511883692-11511-1-git-send-email-eric.auger@redhat.com>
References: <1511883692-11511-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Tue, 28 Nov 2017 15:42:06 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v6 4/4] hw/intc/arm_gicv3_its: Implement full
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
X-TUID: wa0DkzwScoIK

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
index 1c663ac..bf290b8 100644
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


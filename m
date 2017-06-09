Received: by 10.25.0.23 with SMTP id 23csp3115001lfa;
        Fri, 9 Jun 2017 08:53:38 -0700 (PDT)
X-Received: by 10.55.33.163 with SMTP id f35mr45985532qki.51.1497023617938;
        Fri, 09 Jun 2017 08:53:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1497023617; cv=none;
        d=google.com; s=arc-20160816;
        b=MzHmsWKPDpTRFlA25+nfN5PwOG9gpS1fsvVSZdi/zbbfAtsMIXSqLpj79BoY6BgBw2
         dFScjOA8SNUn80yBNiuTZBiXdEDjjKYSM/2ohkTlglUSHAYuiUNUTDGJjjic93ZohMeU
         yZ9Il7R0uokkb/Zp5b3PGvKyq/gxi5ZhnOHSqp9rE5aLx4qvFSRprGdwAhsCZiZbl0nx
         eKLw3EpZ8RCHMmZMO9icrA2hk3QB0sKh23okPrG6oA8EWMou5AP4lBBOW5LokB3Ui/C1
         I3zAUop3ejluuAF05Gkq70fLZBP5AHMxMEnuCnGZAPW7XZTNpj0FCieZRQyHqIeFmfHb
         FjCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=WPK3iVtt/UuoL8Qdy8Nqwp99qhX2N+mM+Sg6S6C4RFs=;
        b=N3SMR28V3Z84ltmNZJNLdqI1Od/4GP2jv9w88h5QUbO/UtNgPmM3/D0+kj5c7uh9xa
         JwF2W1fL4bbzE6zZfUpvBH2SZThqWk8KQ0vHrHewaGh1czh3dDkFnT3fTs/2Sdg0b8Mt
         Bz01uzc3tLJYBnXW3WmEV7v0cWeXYqgt7OdgE73kRUNj39Y39qEoeiSlGkZvlnFNX61a
         EqzDoE/34ZZ8oLVxVZaGPTxvEBaCMfVXmw2upivQJGSM0Wz4wtEvoe1/KSTMtlEAdFQL
         6ad429enoz6BO40Uznfe4aomJ+dFJc7ttr4fwlKCNXv4YPEBUZ/o8xrFwhs3cN+olto0
         15+g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p123si1312421qkd.290.2017.06.09.08.53.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Jun 2017 08:53:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55453 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dJMEB-0003Uu-7f
	for alex.bennee@linaro.org; Fri, 09 Jun 2017 11:53:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44955)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dJMDs-0003Hh-Gs
	for qemu-arm@nongnu.org; Fri, 09 Jun 2017 11:53:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dJMDr-0005DL-MC
	for qemu-arm@nongnu.org; Fri, 09 Jun 2017 11:53:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41946)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1dJMDr-0005Cn-FI; Fri, 09 Jun 2017 11:53:15 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 64791C04B92D;
	Fri,  9 Jun 2017 15:53:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 64791C04B92D
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eric.auger@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 64791C04B92D
Received: from localhost.localdomain.com (ovpn-116-222.ams2.redhat.com
	[10.36.116.222])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9832F955AC;
	Fri,  9 Jun 2017 15:53:10 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Fri,  9 Jun 2017 17:52:32 +0200
Message-Id: <1497023553-18411-4-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1497023553-18411-1-git-send-email-eric.auger@redhat.com>
References: <1497023553-18411-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Fri, 09 Jun 2017 15:53:14 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v6 3/4] hw/intc/arm_gicv3_kvm: Implement pending
 table save
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
	dgilbert@redhat.com, peterx@redhat.com, Vijaya.Kumar@cavium.com,
	zhaoshenglong@huawei.com, christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XVQtkoMWJQse

This patch adds the flush of the LPI pending bits into the
redistributor pending tables. This happens on VM stop.

There is no explicit restore as the tables are implicitly sync'ed
on ITS table restore and on LPI enable at redistributor level.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v5 -> v6:
- do not abort on -EFAULT
---
 hw/intc/arm_gicv3_kvm.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
index b70ee27..6051c77 100644
--- a/hw/intc/arm_gicv3_kvm.c
+++ b/hw/intc/arm_gicv3_kvm.c
@@ -25,6 +25,7 @@
 #include "hw/sysbus.h"
 #include "qemu/error-report.h"
 #include "sysemu/kvm.h"
+#include "sysemu/sysemu.h"
 #include "kvm_arm.h"
 #include "gicv3_internal.h"
 #include "vgic_common.h"
@@ -680,6 +681,35 @@ static const ARMCPRegInfo gicv3_cpuif_reginfo[] = {
     REGINFO_SENTINEL
 };
 
+/**
+ * vm_change_state_handler - VM change state callback aiming at flushing
+ * RDIST pending tables into guest RAM
+ *
+ * The tables get flushed to guest RAM whenever the VM gets stopped.
+ */
+static void vm_change_state_handler(void *opaque, int running,
+                                    RunState state)
+{
+    GICv3State *s = (GICv3State *)opaque;
+    Error *err = NULL;
+    int ret;
+
+    if (running) {
+        return;
+    }
+
+    ret = kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_CTRL,
+                           KVM_DEV_ARM_VGIC_SAVE_PENDING_TABLES,
+                           NULL, true, &err);
+    if (err) {
+        error_report_err(err);
+    }
+    if (ret < 0 && ret != -EFAULT) {
+        abort();
+    }
+}
+
+
 static void kvm_arm_gicv3_realize(DeviceState *dev, Error **errp)
 {
     GICv3State *s = KVM_ARM_GICV3(dev);
@@ -751,6 +781,10 @@ static void kvm_arm_gicv3_realize(DeviceState *dev, Error **errp)
             return;
         }
     }
+    if (kvm_device_check_attr(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_CTRL,
+                              KVM_DEV_ARM_VGIC_SAVE_PENDING_TABLES)) {
+        qemu_add_vm_change_state_handler(vm_change_state_handler, s);
+    }
 }
 
 static void kvm_arm_gicv3_class_init(ObjectClass *klass, void *data)
-- 
2.5.5


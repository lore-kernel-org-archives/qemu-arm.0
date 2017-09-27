Received: by 10.223.172.38 with SMTP id v35csp4798582wrc;
        Wed, 27 Sep 2017 07:57:25 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QBFPs3ML7bWn2QWfGa+WO0vA1smweOXWOr++pFnRCrt2j/wrLtfKlL2K6yhgdVF/6UrD7Jd
X-Received: by 10.55.79.71 with SMTP id d68mr2672456qkb.247.1506524245037;
        Wed, 27 Sep 2017 07:57:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506524245; cv=none;
        d=google.com; s=arc-20160816;
        b=kR/6Ib/KAiYII/fjLYCiEeuG5Gpfy5Tlq+NQGizLxmdFXkAoKQBNpgL6ZuKK6OXbh7
         15zNp9gQNbnLDqAEXfczlT5/+ulVojSgcjNECXC9A0ynvJuNsJU/jtScwtmlg8amyQ8k
         f/hviR8OJ0E4NskSgYyZGgrQDDoE1FCOgiKleB3ngbO0KfT/PeB+CNc2N5bA7zNLako0
         acdlqgA7R24AAFIWh5VPj8+MoQQ6MKZ8CTzH73tUrTKSt/rMq1PV37vWYzY9pQ3YJFVs
         5agWYxFpzbcxd8nkYAua9wQ0VD6Nwriqc95WleQFiIFyTfXvtkOav1igybB+udoCMQHS
         i3ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:arc-authentication-results;
        bh=vjEZ7IKcRLDe0X4Ww3SVkF89IFT9SwijgJwvKuqZvGM=;
        b=lNZA6ZOJz/bEpFllODkupTXzeXTSG85tkkjQNji6rb8mUfGxvwA5RHcA92Dxq5a35B
         /UIqUu0fbboJe2iC7JNrY62VhjPK9UfFdhJ7wKJgD9EDO3R3GzYuAk+25CxYgFTTwwPN
         qTb1F/8zQUmDTMu3eULWgoHS5dhjnXvC5ezMuqBvos+q5BPcoboo42yquT4a6Q5s0sCM
         46FXiwHf4Vhz7h38hEZi9V34APwHGpQzw36tYbh2dUIbvubj3k7bhpRWb5I8Cn2r7mRk
         mBRBrE1nlBKIhu+p+BK3SufSkkNf/5WY82e1AzNaMQ9FErWu5tpKpbzlgrA2nln0e3kQ
         P8KQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l12si2838003qti.483.2017.09.27.07.57.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 27 Sep 2017 07:57:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55147 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dxDm6-0000UL-Qb
	for alex.bennee@linaro.org; Wed, 27 Sep 2017 10:57:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56588)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dxDlq-0000SM-Q9
	for qemu-arm@nongnu.org; Wed, 27 Sep 2017 10:57:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dxDlp-0001Vb-Rg
	for qemu-arm@nongnu.org; Wed, 27 Sep 2017 10:57:06 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60459)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1dxDlp-0001VG-Im; Wed, 27 Sep 2017 10:57:05 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6B1DD12988B;
	Wed, 27 Sep 2017 14:57:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 6B1DD12988B
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eric.auger@redhat.com
Received: from localhost.localdomain.com (ovpn-116-163.ams2.redhat.com
	[10.36.116.163])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7EC8094C6D;
	Wed, 27 Sep 2017 14:57:00 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, wanghaibin.wang@huawei.com
Date: Wed, 27 Sep 2017 16:56:43 +0200
Message-Id: <1506524205-20763-2-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1506524205-20763-1-git-send-email-eric.auger@redhat.com>
References: <1506524205-20763-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Wed, 27 Sep 2017 14:57:04 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC 1/3] hw/intc/arm_gicv3_its: Don't abort on table
 save/restore
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
X-TUID: XALMzFPOnRnJ

The ITS is not properly reset at the moment. It is possible the
GITS_BASER<n>.valid is set and the in-kernel ITS caches are not
empty (list of devices, collections, LPIs) while data structures
in guest RAM are invalid/inconsistent.

For instance, this happens after a guest shutdown -r now or a
system reset, if we save the state before the guest re-writes
the ITS registers or map devices, the table save ioctl may
produce a QEMU abort.

Until there is a proper reset implemented, let's unplug the
consistency error checking.

The reset issue will be fixed in subsequent patches.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reported-by: wanghaibin <wanghaibin.wang@huawei.com>

---

this patch would deserve being cc'ed stable (2.10)
---
 hw/intc/arm_gicv3_its_kvm.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/hw/intc/arm_gicv3_its_kvm.c b/hw/intc/arm_gicv3_its_kvm.c
index 39903d5..120b86d 100644
--- a/hw/intc/arm_gicv3_its_kvm.c
+++ b/hw/intc/arm_gicv3_its_kvm.c
@@ -64,20 +64,16 @@ static void vm_change_state_handler(void *opaque, int running,
 {
     GICv3ITSState *s = (GICv3ITSState *)opaque;
     Error *err = NULL;
-    int ret;
 
     if (running) {
         return;
     }
 
-    ret = kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_CTRL,
-                            KVM_DEV_ARM_ITS_SAVE_TABLES, NULL, true, &err);
+    kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_CTRL,
+                      KVM_DEV_ARM_ITS_SAVE_TABLES, NULL, true, &err);
     if (err) {
         error_report_err(err);
     }
-    if (ret < 0 && ret != -EFAULT) {
-        abort();
-    }
 }
 
 static void kvm_arm_its_realize(DeviceState *dev, Error **errp)
@@ -157,6 +153,7 @@ static void kvm_arm_its_pre_save(GICv3ITSState *s)
  */
 static void kvm_arm_its_post_load(GICv3ITSState *s)
 {
+    Error *err = NULL;
     int i;
 
     if (!s->iidr) {
@@ -188,7 +185,11 @@ static void kvm_arm_its_post_load(GICv3ITSState *s)
 
     kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_CTRL,
                       KVM_DEV_ARM_ITS_RESTORE_TABLES, NULL, true,
-                      &error_abort);
+                      &err);
+
+    if (err) {
+        error_report_err(err);
+    }
 
     kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_ITS_REGS,
                       GITS_CTLR, &s->ctlr, true, &error_abort);
-- 
2.5.5


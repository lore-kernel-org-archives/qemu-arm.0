Received: by 10.223.172.38 with SMTP id v35csp4801073wrc;
        Wed, 27 Sep 2017 08:00:01 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QCZ0BtS13hQS6HmSYqT7LSU9VkF2ylTd18xzzcinjL0xeOuJ7zU0BDlyT4FoWv4gm5GmH7n
X-Received: by 10.200.3.111 with SMTP id w47mr2246925qtg.144.1506524401472;
        Wed, 27 Sep 2017 08:00:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506524401; cv=none;
        d=google.com; s=arc-20160816;
        b=LIXA2Gr5yvwlLcMpSLVu5z4AIknyDGkTK8sbBKN4kT3Qfy5lU+bRaShLajJJRFHPxo
         hVI+sbVXLtn7zmOg4r9PJDZ6qSwIA2uK7czosOGgoXTcB7siSFZaKuVKwy6Z6oUqVUGW
         lsVZNxi8r7x6d2QGxyjuKlNNKAhw0qt0UIkUY2VYXb39sLkyQNXjNUNVj/zoa5fFQrSB
         y7y+Civd8bVBaxvQJuyFLMHAqPDQS81T4rj1Sr50kLxxlR+SZ1Oc+GzcTjlnH0H+JQof
         TicAS2O/Q4qc59C1s1XHJAUFRfOFUMtD+kJH1KzqBpPweCnmWHSQ263ehmyROUYWBahq
         yCmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:arc-authentication-results;
        bh=qloYrR8V2UIdaHK90/2fF23Hu5qUKs0tqTd2c6guDg4=;
        b=dIepXShVfBV/DAZbEeK9Hiugxg3gfEeQOiEO0e4z2sxY/pN646ha5aQEAzoMKL/tta
         X48RNWLlE4rXfJJ1RSlUHPH1pLullqniKk16p4NjfdIYOMjW0/GYWsV/i16Y7eOqcX4b
         ruJAksJ93xI1Te6AveEW73DA7hzWXbJ+D9KavqlO3c8cxRSVld0K2rVq+YLVL+O6DEj3
         eltR6+S/eLKDL9SCUDa7b29UpCk06HPKDXUWS50AwD0VHfYKLbF4G6nVeP4MJL8TPRMe
         wO4Kw9aCbiI8wX7LmPy0+HXn9emvNNbmJzMVR9XckGHytgquCqQOhpZm+ZUlyJ66WvDv
         IIOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s32si967746qtg.164.2017.09.27.08.00.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 27 Sep 2017 08:00:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55159 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dxDod-0002hY-8m
	for alex.bennee@linaro.org; Wed, 27 Sep 2017 10:59:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56695)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dxDmJ-0000pE-KG
	for qemu-arm@nongnu.org; Wed, 27 Sep 2017 10:57:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dxDmG-0001gd-Da
	for qemu-arm@nongnu.org; Wed, 27 Sep 2017 10:57:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46924)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1dxDmG-0001gJ-4U; Wed, 27 Sep 2017 10:57:32 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EF34C883BF;
	Wed, 27 Sep 2017 14:57:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com EF34C883BF
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eric.auger@redhat.com
Received: from localhost.localdomain.com (ovpn-116-163.ams2.redhat.com
	[10.36.116.163])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 895B096558;
	Wed, 27 Sep 2017 14:57:17 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, wanghaibin.wang@huawei.com
Date: Wed, 27 Sep 2017 16:56:45 +0200
Message-Id: <1506524205-20763-4-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1506524205-20763-1-git-send-email-eric.auger@redhat.com>
References: <1506524205-20763-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Wed, 27 Sep 2017 14:57:31 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC 3/3] hw/intc/arm_gicv3_its: Implement reset
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
X-TUID: I16HvEsSx7WQ

Currently the ITS is not reset and this causes trouble
when state backup is initiated before the guest has initialized
the ITS registers and especially GITS_CBASER<n>.

We are likely to save register values set before the reset/
restart. The register values may not be consistent with the
data structures in RAM.

So let's use the ITS KVM device new combo,
KVM_DEV_ARM_VGIC_GRP_CTRL/KVM_DEV_ARM_ITS_CTRL_RESET
to explicitly force the in-kernel emulated reset.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/intc/arm_gicv3_its_common.c         |  5 ++---
 hw/intc/arm_gicv3_its_kvm.c            | 22 ++++++++++++++++++----
 include/hw/intc/arm_gicv3_its_common.h |  1 +
 3 files changed, 21 insertions(+), 7 deletions(-)

diff --git a/hw/intc/arm_gicv3_its_common.c b/hw/intc/arm_gicv3_its_common.c
index 68b20fc..a2fe561 100644
--- a/hw/intc/arm_gicv3_its_common.c
+++ b/hw/intc/arm_gicv3_its_common.c
@@ -129,15 +129,14 @@ static void gicv3_its_common_reset(DeviceState *dev)
     s->creadr = 0;
     s->iidr = 0;
     memset(&s->baser, 0, sizeof(s->baser));
-
-    gicv3_its_post_load(s, 0);
 }
 
 static void gicv3_its_common_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
+    GICv3ITSCommonClass *c = ARM_GICV3_ITS_COMMON_CLASS(klass);
 
-    dc->reset = gicv3_its_common_reset;
+    c->parent_reset = gicv3_its_common_reset;
     dc->vmsd = &vmstate_its;
 }
 
diff --git a/hw/intc/arm_gicv3_its_kvm.c b/hw/intc/arm_gicv3_its_kvm.c
index 120b86d..3c2e724 100644
--- a/hw/intc/arm_gicv3_its_kvm.c
+++ b/hw/intc/arm_gicv3_its_kvm.c
@@ -156,10 +156,6 @@ static void kvm_arm_its_post_load(GICv3ITSState *s)
     Error *err = NULL;
     int i;
 
-    if (!s->iidr) {
-        return;
-    }
-
     kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_ITS_REGS,
                       GITS_IIDR, &s->iidr, true, &error_abort);
 
@@ -195,6 +191,23 @@ static void kvm_arm_its_post_load(GICv3ITSState *s)
                       GITS_CTLR, &s->ctlr, true, &error_abort);
 }
 
+static void kvm_arm_its_reset(DeviceState *dev)
+{
+    GICv3ITSState *s = ARM_GICV3_ITS_COMMON(dev);
+    GICv3ITSCommonClass *c = ARM_GICV3_ITS_COMMON_GET_CLASS(s);
+
+    c->parent_reset(dev);
+
+    if (!kvm_device_check_attr(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_CTRL,
+                               KVM_DEV_ARM_ITS_CTRL_RESET)) {
+        error_report("ITS KVM: reset is not supported by the kernel");
+        return;
+    }
+
+    kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_CTRL,
+                      KVM_DEV_ARM_ITS_CTRL_RESET, NULL, true, &error_abort);
+}
+
 static Property kvm_arm_its_props[] = {
     DEFINE_PROP_LINK("parent-gicv3", GICv3ITSState, gicv3, "kvm-arm-gicv3",
                      GICv3State *),
@@ -211,6 +224,7 @@ static void kvm_arm_its_class_init(ObjectClass *klass, void *data)
     icc->send_msi = kvm_its_send_msi;
     icc->pre_save = kvm_arm_its_pre_save;
     icc->post_load = kvm_arm_its_post_load;
+    dc->reset = kvm_arm_its_reset;
 }
 
 static const TypeInfo kvm_arm_its_info = {
diff --git a/include/hw/intc/arm_gicv3_its_common.h b/include/hw/intc/arm_gicv3_its_common.h
index fd1fe64..c158e9f 100644
--- a/include/hw/intc/arm_gicv3_its_common.h
+++ b/include/hw/intc/arm_gicv3_its_common.h
@@ -79,6 +79,7 @@ struct GICv3ITSCommonClass {
     int (*send_msi)(GICv3ITSState *s, uint32_t data, uint16_t devid);
     void (*pre_save)(GICv3ITSState *s);
     void (*post_load)(GICv3ITSState *s);
+    void (*parent_reset)(DeviceState *dev);
 };
 
 typedef struct GICv3ITSCommonClass GICv3ITSCommonClass;
-- 
2.5.5


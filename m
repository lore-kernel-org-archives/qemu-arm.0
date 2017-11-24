Received: by 10.223.159.82 with SMTP id f18csp2161231wrg;
        Fri, 24 Nov 2017 06:21:17 -0800 (PST)
X-Google-Smtp-Source: AGs4zMZ3lcevELo+nBQgPq82pSujda1Lx3Q5FGGLT4QFV1iSVfNlSrXReRhmYV3RBA4AAJRWHZjV
X-Received: by 10.37.186.140 with SMTP id s12mr3952922ybg.111.1511533277272;
        Fri, 24 Nov 2017 06:21:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511533277; cv=none;
        d=google.com; s=arc-20160816;
        b=NUOD1QoWQJ+e9kSowt9grbb94/djoluZJRAcaX+MrRY+vOTJMgx9GvccUGnAM7MkLb
         Y/BeB1P/HKrDXTuq9nuNzk8c4chdY0e4CJ8nX4Fo+EzClxr4Zqwu7wpWRAm1g1xteX18
         XlSbm60Z2gLFoxp+j6FzdCE5SAeu70W3N/8Bmd3GhXIcM6bXAOQa/AD9L9Yz4tYnX/5c
         iI4cKmonV/5GyctJOMFkT4EtRKad4KluHNYG4BRHVdOyB/JHIfUaUBxzrDce9N9lDqoR
         R4w50aW+xQ34x6q2hn3otGoMGtleHIXyVQ2ShyKs4gqSonxbrA3fNC9MkRAgu5pxHIe3
         kzRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=iha8vmOLPCXn/z6G/g/8Ki7k2UEpjWkoeKcWAOiH130=;
        b=eHq7mF+FG51N23nM5r803rRnDvHg8/kRYHbHXluNFVRmXkHnYXErmrhH7Z+VtDzFTV
         mcYR7fML/XOzl2ym1btg7FZ5LiA6tqFqfrtdXSgl/fg33t+iBfTblhM9LinIGLb+zXdn
         tfOyEp5V6gu8nhkBFvToxS4L0Gj0vhd5ZXyOvdFMvOuX+XEWjVq9tOOqSt8o1IzbQbaB
         CSUcp3XvX9HSyYZi4uo2VodmubjbIkIce8iyEMUBG3BrTUP//jfUH1qgHPUU9grt//pw
         FA20DVZaCxBI/lLkRVpGuYiJ+0Id12LKDuMx75bsoxOIWwYLRPfB6ieyUDIA8EGXQLXF
         rOmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d19si5132690ywg.605.2017.11.24.06.21.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 24 Nov 2017 06:21:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49513 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eIEqy-0006pH-NJ
	for alex.bennee@linaro.org; Fri, 24 Nov 2017 09:21:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56998)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eIEog-0005Ox-1F
	for qemu-devel@nongnu.org; Fri, 24 Nov 2017 09:18:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eIEoe-0001MN-Ur
	for qemu-devel@nongnu.org; Fri, 24 Nov 2017 09:18:54 -0500
Received: from mx1.redhat.com ([209.132.183.28]:37278)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1eIEoY-0001KG-7D; Fri, 24 Nov 2017 09:18:46 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 628FD7AE92;
	Fri, 24 Nov 2017 14:18:45 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-117-138.ams2.redhat.com
	[10.36.117.138])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 40410620A2;
	Fri, 24 Nov 2017 14:18:42 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, wanghaibin.wang@huawei.com
Date: Fri, 24 Nov 2017 15:18:25 +0100
Message-Id: <1511533107-5315-3-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1511533107-5315-1-git-send-email-eric.auger@redhat.com>
References: <1511533107-5315-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Fri, 24 Nov 2017 14:18:45 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v5 2/4] hw/intc/arm_gicv3_its: Implement a
 minimalist reset
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
X-TUID: L5UC7PYuCG85

At the moment the ITS is not properly reset and this causes
various bugs on save/restore. We implement a minimalist reset
through individual register writes but for kernel versions
before v4.15 this fails voiding the vITS cache. We cannot
claim we have a comprehensive reset (hence the error message)
but that's better than nothing.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---
v4 -> v5:
- correct error message

v2 -> v3:
- individual register writes performed in kvm_arm_its_reset
- check KVM_DEV_ARM_VGIC_GRP_ITS_REGS support
---
 hw/intc/arm_gicv3_its_kvm.c | 41 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/hw/intc/arm_gicv3_its_kvm.c b/hw/intc/arm_gicv3_its_kvm.c
index b1b322b..8e307c9 100644
--- a/hw/intc/arm_gicv3_its_kvm.c
+++ b/hw/intc/arm_gicv3_its_kvm.c
@@ -28,6 +28,16 @@
 
 #define TYPE_KVM_ARM_ITS "arm-its-kvm"
 #define KVM_ARM_ITS(obj) OBJECT_CHECK(GICv3ITSState, (obj), TYPE_KVM_ARM_ITS)
+#define KVM_ARM_ITS_CLASS(klass) \
+     OBJECT_CLASS_CHECK(KVMARMITSClass, (klass), TYPE_KVM_ARM_ITS)
+#define KVM_ARM_ITS_GET_CLASS(obj) \
+     OBJECT_GET_CLASS(KVMARMITSClass, (obj), TYPE_KVM_ARM_ITS)
+
+typedef struct KVMARMITSClass {
+    GICv3ITSCommonClass parent_class;
+    void (*parent_reset)(DeviceState *dev);
+} KVMARMITSClass;
+
 
 static int kvm_its_send_msi(GICv3ITSState *s, uint32_t value, uint16_t devid)
 {
@@ -186,6 +196,34 @@ static void kvm_arm_its_post_load(GICv3ITSState *s)
                       GITS_CTLR, &s->ctlr, true, &error_abort);
 }
 
+static void kvm_arm_its_reset(DeviceState *dev)
+{
+    GICv3ITSState *s = ARM_GICV3_ITS_COMMON(dev);
+    KVMARMITSClass *c = KVM_ARM_ITS_GET_CLASS(s);
+    int i;
+
+    c->parent_reset(dev);
+
+    error_report("ITS KVM: full reset is not supported by QEMU");
+
+    if (!kvm_device_check_attr(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_ITS_REGS,
+                               GITS_CTLR)) {
+        return;
+    }
+
+    kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_ITS_REGS,
+                      GITS_CTLR, &s->ctlr, true, &error_abort);
+
+    kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_ITS_REGS,
+                      GITS_CBASER, &s->cbaser, true, &error_abort);
+
+    for (i = 0; i < 8; i++) {
+        kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_ITS_REGS,
+                          GITS_BASER + i * 8, &s->baser[i], true,
+                          &error_abort);
+    }
+}
+
 static Property kvm_arm_its_props[] = {
     DEFINE_PROP_LINK("parent-gicv3", GICv3ITSState, gicv3, "kvm-arm-gicv3",
                      GICv3State *),
@@ -196,12 +234,15 @@ static void kvm_arm_its_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     GICv3ITSCommonClass *icc = ARM_GICV3_ITS_COMMON_CLASS(klass);
+    KVMARMITSClass *ic = KVM_ARM_ITS_CLASS(klass);
 
     dc->realize = kvm_arm_its_realize;
     dc->props   = kvm_arm_its_props;
+    ic->parent_reset = dc->reset;
     icc->send_msi = kvm_its_send_msi;
     icc->pre_save = kvm_arm_its_pre_save;
     icc->post_load = kvm_arm_its_post_load;
+    dc->reset = kvm_arm_its_reset;
 }
 
 static const TypeInfo kvm_arm_its_info = {
-- 
2.5.5


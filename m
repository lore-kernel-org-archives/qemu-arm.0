Received: by 10.223.159.82 with SMTP id f18csp3040354wrg;
        Tue, 28 Nov 2017 07:42:16 -0800 (PST)
X-Google-Smtp-Source: AGs4zMZBAjTSg+Icea5Y6Oq9+V3n0akIv5AYP+PsTJdNUr+6p7qE4aWdhuAjTOjQrDveic2m7Gu9
X-Received: by 10.37.51.9 with SMTP id z9mr6003895ybz.351.1511883736180;
        Tue, 28 Nov 2017 07:42:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511883736; cv=none;
        d=google.com; s=arc-20160816;
        b=X3Bm0mWunGyda7LxyfYmIuO2Skl9aT2Inza3ftqgVUH2cUHcOxBk8nofOiar9oOk5c
         hNS9kpcxiU2F4SRJTMGw7nb3hAzmrNQ2Od6/MdVU1oZA9oAchmvIoxdoFzrn50dT7hzA
         EL/akBGNcQepXOun9KlK4nmplxWqEFVsHmYs8fT7m3M/8ylySIyA61Qo+zDpTKKZJ2KV
         C6ocniat2TJOCuDnnzESvJwoXDYXtm8Kgjw2Mkh5WvQVFV2BH4ZMWRFqHBk45x/ygFdK
         4VG9ywrEYgh4w4uFB98QHWW2YYD3vNBkG0GkPxmH/Etb7S2RP4lz3euJe2vDUkjejoIp
         z0Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=expMuk4fUgoG0EMEDXOtQimOkQ01nvF+XOeUyPQUdv4=;
        b=MFrd9UnXEn2e+6AWzvSNi0s7g+/xFO7rL0N2xESN9LYPKzxLvqDQvQ1G3L4aZnEFEI
         bt3fnZMZwf/Yg6sQ9o/yhxnTlU+Zu7aybpZcmzUvvrMIWxel1WK3hHovSReQH8OdE+7S
         rEqsD6sl49JOOENYxubVyRP6vbzevwtJTmiEzx0YWtEWHhvkhP6AZPXYlvlm2hTkGD0+
         2Qp9TbhlpUsWVnzCVOAEG/Lj3i40Z/h7EyxHwFmYmRK6mrJHKT7bg5IzbmdJnpoEoNys
         GyhYnPpgzFrCaXFcaXA6Gvbz6wdMsUoS1q1Sjtx7M7UiDaTrUSjOaCSFgp+lEJtZ0ODo
         y/Ag==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x206si5876033ywb.706.2017.11.28.07.42.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 28 Nov 2017 07:42:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38500 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eJi1X-00012k-JQ
	for alex.bennee@linaro.org; Tue, 28 Nov 2017 10:42:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32959)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eJi1G-0000xS-O6
	for qemu-arm@nongnu.org; Tue, 28 Nov 2017 10:42:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eJi1C-0004tZ-KB
	for qemu-arm@nongnu.org; Tue, 28 Nov 2017 10:41:58 -0500
Received: from mx1.redhat.com ([209.132.183.28]:45666)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1eJi1C-0004tI-BM; Tue, 28 Nov 2017 10:41:54 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5E3EBC04AC6A;
	Tue, 28 Nov 2017 15:41:53 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-117-138.ams2.redhat.com
	[10.36.117.138])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3668B5C1AB;
	Tue, 28 Nov 2017 15:41:50 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, wanghaibin.wang@huawei.com
Date: Tue, 28 Nov 2017 16:41:30 +0100
Message-Id: <1511883692-11511-3-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1511883692-11511-1-git-send-email-eric.auger@redhat.com>
References: <1511883692-11511-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Tue, 28 Nov 2017 15:41:53 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v6 2/4] hw/intc/arm_gicv3_its: Implement a
 minimalist reset
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
X-TUID: shoq/4Y68wDY

At the moment the ITS is not properly reset and this causes
various bugs on save/restore. We implement a minimalist reset
through individual register writes but for kernel versions
before v4.15 this fails voiding the vITS cache. We cannot
claim we have a comprehensive reset (hence the error message)
but that's better than nothing.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---
v5 -> v6:
- add class_size

v4 -> v5:
- correct error message

v2 -> v3:
- individual register writes performed in kvm_arm_its_reset
- check KVM_DEV_ARM_VGIC_GRP_ITS_REGS support
---
 hw/intc/arm_gicv3_its_kvm.c | 42 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/hw/intc/arm_gicv3_its_kvm.c b/hw/intc/arm_gicv3_its_kvm.c
index b1b322b..1c663ac 100644
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
@@ -209,6 +250,7 @@ static const TypeInfo kvm_arm_its_info = {
     .parent = TYPE_ARM_GICV3_ITS_COMMON,
     .instance_size = sizeof(GICv3ITSState),
     .class_init = kvm_arm_its_class_init,
+    .class_size = sizeof(KVMARMITSClass),
 };
 
 static void kvm_arm_its_register_types(void)
-- 
2.5.5


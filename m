Received: by 10.223.159.82 with SMTP id f18csp837315wrg;
        Thu, 23 Nov 2017 06:57:07 -0800 (PST)
X-Google-Smtp-Source: AGs4zMYkXkSYjjqSeQvLbAJ67HdH2ImKmejHUA5jFj5n5QzZA252ck9EwE/gc7KltLclsqO6qkOL
X-Received: by 10.37.180.69 with SMTP id c5mr16037501ybg.193.1511449027410;
        Thu, 23 Nov 2017 06:57:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511449027; cv=none;
        d=google.com; s=arc-20160816;
        b=oyRzldT0yxIrzD+lAN6KYTaCODCgpYCIafWHsoHwNo4NLGMMch+B0hGyz32oE2npSp
         8YdBOS6UftT05kCVcmWML9lyVJdVFKIe7GiBHjEGGsZ20Tj1ZJOxJ8dPsu1SW2Mklf/x
         P43D3sCOQGb+CBwVkVDkTfTN4Pobet+/w+Zz/xwOHe0evXdXEjaMaY518ZQdoVpTs0OS
         XTbLocN7HcadssfhS/RV2CaVjtk7c6TggCvqe65H55WuKV36ZZDINff3G8Ng1RcaXnnU
         ps8SckNRA6ez9ZUttlO7IAi6V3MTSzxUIAvsZZ3+wdtU1/s1m/5Ba5m5EjIB7e8ozM22
         8DYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=7F7UxgMMDopvl993kuzrqYXXHwp88UalH47gL+uzsVI=;
        b=gabaLl1InIcUMGIxRzcVEsvSnHDSLOeofJqxlxDyB/wkP8NFOBE6ao28EJ4HuzSyFz
         dYNC4VCzvVKAz6R3t5QB27qV7reudWdwKzQKsla7ICPd7U5CglkC03TLrLUZ1KlWzCx0
         1tNLLEIVsyZk1jR+cA5bF1lOkUQZIqPKlSVY0gYsfOz1cA1dafQ2Jb18K05+rnsUBMep
         rZCumUzUTLiN9MtRcDML44KloJuLvajju1uUW6iyA7yZKR6YV1Q4/3YxBswZcPBzmpL/
         V0L+9HGvsDGpuBuPQQJtBMo5nVVOSWg8/oL4eZJNM0QoZ2nhNHp0D6wQ2XX4OUfNs2jj
         l2Og==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 63si3907044ybi.143.2017.11.23.06.57.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Nov 2017 06:57:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44738 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eHsw6-00027T-QR
	for alex.bennee@linaro.org; Thu, 23 Nov 2017 09:57:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40171)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eHsvo-00024t-Fu
	for qemu-arm@nongnu.org; Thu, 23 Nov 2017 09:56:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eHsvn-0007js-Ee
	for qemu-arm@nongnu.org; Thu, 23 Nov 2017 09:56:48 -0500
Received: from mx1.redhat.com ([209.132.183.28]:50446)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1eHsvn-0007if-42; Thu, 23 Nov 2017 09:56:47 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BE5E76A7C9;
	Thu, 23 Nov 2017 14:56:45 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-117-138.ams2.redhat.com
	[10.36.117.138])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6A2265D6A5;
	Thu, 23 Nov 2017 14:56:35 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, wanghaibin.wang@huawei.com
Date: Thu, 23 Nov 2017 15:56:13 +0100
Message-Id: <1511448975-28326-3-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1511448975-28326-1-git-send-email-eric.auger@redhat.com>
References: <1511448975-28326-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Thu, 23 Nov 2017 14:56:45 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v3 2/4] hw/intc/arm_gicv3_its: Implement a
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
X-TUID: ObB5XBLoK+Ek

At the moment the ITS is not properly reset and this causes
various bugs on save/restore. We implement a minimalist reset
through individual register writes but for kernel versions
before v4.15 this fails voiding the vITS cache. We cannot
claim we have a comprehensive reset (hence the error message)
but that's better than nothing.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v2 -> v3:
- individual register writes performed in kvm_arm_its_reset
- check KVM_DEV_ARM_VGIC_GRP_ITS_REGS support
---
 hw/intc/arm_gicv3_its_kvm.c | 41 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/hw/intc/arm_gicv3_its_kvm.c b/hw/intc/arm_gicv3_its_kvm.c
index b1b322b..83e5268 100644
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
+    error_report("ITS KVM: full reset is not supported by the host kernel");
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


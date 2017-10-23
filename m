Received: by 10.223.161.27 with SMTP id o27csp892wro;
        Mon, 23 Oct 2017 08:38:12 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+Q0DuHRH6MR+LeDLL4JSC1EcRkaMPB7Qe6CqGNByi0PnqVRXqvUl+8US2HzXw3Vh0bJT6ZU
X-Received: by 10.55.50.71 with SMTP id y68mr19903909qky.136.1508773092543;
        Mon, 23 Oct 2017 08:38:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508773092; cv=none;
        d=google.com; s=arc-20160816;
        b=rvsDWOYpFTV4kwcrF6UFqbZqxxkX0F2JOUUSS/3kxf78dRXiPyXSO7IG2gqmyLV1K7
         14xotaF3j4SPpJcFDZEEAUFlSI/t7J6oPrc/BVXVsmmRcHySADJoLJjqMFkriElCxXTn
         tW4KMErBGDcLPtiGQAcn/SNRonNjiZWWb18u3mgAEy34bT7ZEZ0nkl4Keh4w7FyQS9Lu
         lbRXm+ev/llp1Rr83X7VJ8MU3uY1R6Gwrn7XxWC1H81GaIY2EfXBF0+6uBEgxHug5Nu/
         ohf1JbpdqgEBz+20UUYKYZEE8Slai7rmMRalk2RWLPnQcKxH5H5XvdRdFJj8mWzMFQ83
         Pgug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:arc-authentication-results;
        bh=mIg/baRVuBT9k3a8S+0M9CKUV5x7lixWlbhS6Gddfis=;
        b=FFWpuIV5Wwo7A7CndQPD+mLUIfSfFWKC5hKr5+s/AwNUYQVy295DLYEKJLywZ9Kvtx
         nQVtgECB+tg+h+Q6sgB0xRgfH+jwEJlXkhswkmdk9Hkdh5xtaphyqr/6nnh516JA/g+1
         Xn8N653+t12dWju7Sjgi3UkFW1w67XgI+qpqwPl6/juuD5yKMhOu0iSuS9mJhkGeT/rO
         cYH//lrVUExK7K87I1f7usApCu7HhcyrPU+hVG6f39G+I0rFd8Stl7SIm9uli9rpQKoF
         yvHCZ3cUvwS1mFYqbmOPOBUmHCIEvVwWG75eeYIiZB/jkjmbrYmbcIfAi0LLEDcXcX6h
         ZZgA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h35si4227780qtd.356.2017.10.23.08.38.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 23 Oct 2017 08:38:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39267 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e6enq-00048b-8o
	for alex.bennee@linaro.org; Mon, 23 Oct 2017 11:38:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57257)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1e6elt-0002iJ-8y
	for qemu-arm@nongnu.org; Mon, 23 Oct 2017 11:36:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1e6eln-0004iz-8L
	for qemu-arm@nongnu.org; Mon, 23 Oct 2017 11:36:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51394)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1e6elm-0004ic-Vz; Mon, 23 Oct 2017 11:36:03 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EABD35F7B8;
	Mon, 23 Oct 2017 15:36:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com EABD35F7B8
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eric.auger@redhat.com
Received: from localhost.localdomain.com (ovpn-117-27.ams2.redhat.com
	[10.36.117.27])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F0FA96031B;
	Mon, 23 Oct 2017 15:35:58 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, wanghaibin.wang@huawei.com
Date: Mon, 23 Oct 2017 17:35:35 +0200
Message-Id: <1508772937-21054-3-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1508772937-21054-1-git-send-email-eric.auger@redhat.com>
References: <1508772937-21054-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Mon, 23 Oct 2017 15:36:02 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v2 2/4] hw/intc/arm_gicv3_its: Implement a
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
X-TUID: 5hoUrt0UNFFl

At the moment the ITS is not properly reset and this causes
various bugs on save/restore. We implement a minimalist cold reset
through individual register writes. This does not void the ITS cache
though. This full reset will be addressed through a specific ioctl.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

this patch would deserve being cc'ed stable (2.10)
This goes along with patches 1-5 of
[PATCH v5 00/10] vITS Migration fixes and reset, candidate
for being cc'ed stable
---
 hw/intc/arm_gicv3_its_kvm.c | 35 ++++++++++++++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/hw/intc/arm_gicv3_its_kvm.c b/hw/intc/arm_gicv3_its_kvm.c
index 1ae205f..537cea1 100644
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
@@ -153,12 +163,25 @@ static void kvm_arm_its_pre_save(GICv3ITSState *s)
  */
 static void kvm_arm_its_post_load(GICv3ITSState *s)
 {
+    bool cold_reset = !s->iidr;
     int i;
 
-    if (!s->iidr) {
+    if (cold_reset) {
+        kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_ITS_REGS,
+                          GITS_CTLR, &s->ctlr, true, &error_abort);
+
+        kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_ITS_REGS,
+                          GITS_CBASER, &s->cbaser, true, &error_abort);
+
+        for (i = 0; i < 8; i++) {
+            kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_ITS_REGS,
+                              GITS_BASER + i * 8, &s->baser[i], true,
+                              &error_abort);
+        }
         return;
     }
 
+    /* restore */
     kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_ITS_REGS,
                       GITS_IIDR, &s->iidr, true, &error_abort);
 
@@ -190,6 +213,13 @@ static void kvm_arm_its_post_load(GICv3ITSState *s)
                       GITS_CTLR, &s->ctlr, true, &error_abort);
 }
 
+static void kvm_arm_its_reset(DeviceState *dev)
+{
+    KVMARMITSClass *c = KVM_ARM_ITS_GET_CLASS(s);
+
+    c->parent_reset(dev);
+}
+
 static Property kvm_arm_its_props[] = {
     DEFINE_PROP_LINK("parent-gicv3", GICv3ITSState, gicv3, "kvm-arm-gicv3",
                      GICv3State *),
@@ -200,12 +230,15 @@ static void kvm_arm_its_class_init(ObjectClass *klass, void *data)
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


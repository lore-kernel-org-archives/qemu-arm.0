Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp125472lfc;
        Tue, 25 Aug 2020 12:31:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw9FfT4j1XWD3YOWgIFbyeIvOSfi6ByR1sOrFr2kv/lBr0p9wvQkBlHQltrSO1Ps8a5BlmG
X-Received: by 2002:a67:2c11:: with SMTP id s17mr3178574vss.217.1598383882075;
        Tue, 25 Aug 2020 12:31:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598383882; cv=none;
        d=google.com; s=arc-20160816;
        b=Dj2PXNlLV3YK1+Xn/RAEc2kik/azri14XoRtdCh3H2KqMMTTxYhtywI5IOdKPbtuul
         xajCZYZNx5q8JMIZxGYUSwaZwkHAhbzVun1Se1359KnmqtAbW9N2z2TTaeHcQZPJrL2K
         K/v9kFb4zFn6kayF3HHNtyNmfvQgt+MxB1zhvtQRZRBcKbKkrW4WfmZ/45aUg67lp7Su
         7mwuANmgHPTR3PVdTt1xHqZCocanLz1VXr8+S1BxXBcHo0+zQLkDPOKq3FYZjKJGy+lp
         88Qd9K18QBYDYMkoXj2223cGuw2XzoO78p5Xor6EYv8/JUe/9UWacXna/FWeRIREhKn/
         uSng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=uDYaCIv3PMbMz+Te0SfdBfPyb3XNGS8nfGVdtofk4I4=;
        b=kUADj0wzhm5NmeTGuLkbYdsuPZNxx++99McjsZFkPhOymwGUwpqyj1LcUg47E/Jrle
         dGesHcQ0oJpOJaMfQi/VA99nimy/BJC+Yon9ogaruENz4dYhVMsnNEGW6yC6X4bdgbLL
         ZxMD/aqrB3yhd7W3pL/QS3qJQ5/yp6whjtT8XTIpK5JqktZ08bLce8SZPB1LiJAnTgrQ
         w4i6kKRH6+c43JM53krDgrkBf+Kb4pRbWGdI/9cQZuGa5uqr8UKm5tpkpN8I1Q9AGtwK
         VlGS0TkOqYDCxmx86p4oNBvH+hsXial2bu+BrJ4gyJuN7k2S58TUmTpPvDAjvvXnMfUX
         iByw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=SS6HCQWQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y26si1006481vso.332.2020.08.25.12.31.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Aug 2020 12:31:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=SS6HCQWQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kAefB-0001Wq-8K
	for alex.bennee@linaro.org; Tue, 25 Aug 2020 15:31:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kAeWP-0008Nh-An
 for qemu-arm@nongnu.org; Tue, 25 Aug 2020 15:22:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kAeWM-0006B5-Ef
 for qemu-arm@nongnu.org; Tue, 25 Aug 2020 15:22:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598383333;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uDYaCIv3PMbMz+Te0SfdBfPyb3XNGS8nfGVdtofk4I4=;
 b=SS6HCQWQvps5IkOmvA7BQuGoDi4HWyJNqgP0yK5tTx1a061kD5qkYvdGP5RZAu9emLXD+Q
 lgmEC9Pfp85AahZ0cp7Uc3HNTQcVD2CHxEw9JVMs848xQmfLDIwLo2C2IWvHY2fGA9zmbC
 Cau3gokbZLUAdnbf3+xHGPvSLjMFOrk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-410-2UeH-0U0Ofe3FBgstq_mvg-1; Tue, 25 Aug 2020 15:22:05 -0400
X-MC-Unique: 2UeH-0U0Ofe3FBgstq_mvg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 25F54186A560;
 Tue, 25 Aug 2020 19:22:04 +0000 (UTC)
Received: from localhost (unknown [10.10.67.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D9F0110013C2;
 Tue, 25 Aug 2020 19:22:03 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 25/74] armsse: Rename QOM macros to avoid conflicts
Date: Tue, 25 Aug 2020 15:20:21 -0400
Message-Id: <20200825192110.3528606-26-ehabkost@redhat.com>
In-Reply-To: <20200825192110.3528606-1-ehabkost@redhat.com>
References: <20200825192110.3528606-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/25 06:38:59
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.958,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: f9kLJ9HEIHxZ

Rename TYPE_ARMSSE to TYPE_ARM_SSE, and ARMSSE*() type checking
macros to ARM_SSE*().

This will avoid a future conflict between an ARM_SSE() type
checking macro and the ARMSSE typedef name.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Changes v2 -> v3: none

Changes series v1 -> v2: new patch in series v2

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org
---
 include/hw/arm/armsse.h | 12 ++++++------
 hw/arm/armsse.c         | 24 ++++++++++++------------
 2 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/include/hw/arm/armsse.h b/include/hw/arm/armsse.h
index 84080c2299..529816286d 100644
--- a/include/hw/arm/armsse.h
+++ b/include/hw/arm/armsse.h
@@ -106,8 +106,8 @@
 #include "hw/core/split-irq.h"
 #include "hw/cpu/cluster.h"
 
-#define TYPE_ARMSSE "arm-sse"
-#define ARMSSE(obj) OBJECT_CHECK(ARMSSE, (obj), TYPE_ARMSSE)
+#define TYPE_ARM_SSE "arm-sse"
+#define ARM_SSE(obj) OBJECT_CHECK(ARMSSE, (obj), TYPE_ARM_SSE)
 
 /*
  * These type names are for specific IoTKit subsystems; other than
@@ -224,9 +224,9 @@ typedef struct ARMSSEClass {
     const ARMSSEInfo *info;
 } ARMSSEClass;
 
-#define ARMSSE_CLASS(klass) \
-    OBJECT_CLASS_CHECK(ARMSSEClass, (klass), TYPE_ARMSSE)
-#define ARMSSE_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(ARMSSEClass, (obj), TYPE_ARMSSE)
+#define ARM_SSE_CLASS(klass) \
+    OBJECT_CLASS_CHECK(ARMSSEClass, (klass), TYPE_ARM_SSE)
+#define ARM_SSE_GET_CLASS(obj) \
+    OBJECT_GET_CLASS(ARMSSEClass, (obj), TYPE_ARM_SSE)
 
 #endif
diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
index dcbff9bd8f..6264eab16b 100644
--- a/hw/arm/armsse.c
+++ b/hw/arm/armsse.c
@@ -167,7 +167,7 @@ static void irq_status_forwarder(void *opaque, int n, int level)
 
 static void nsccfg_handler(void *opaque, int n, int level)
 {
-    ARMSSE *s = ARMSSE(opaque);
+    ARMSSE *s = ARM_SSE(opaque);
 
     s->nsccfg = level;
 }
@@ -233,8 +233,8 @@ static void armsse_forward_sec_resp_cfg(ARMSSE *s)
 
 static void armsse_init(Object *obj)
 {
-    ARMSSE *s = ARMSSE(obj);
-    ARMSSEClass *asc = ARMSSE_GET_CLASS(obj);
+    ARMSSE *s = ARM_SSE(obj);
+    ARMSSEClass *asc = ARM_SSE_GET_CLASS(obj);
     const ARMSSEInfo *info = asc->info;
     int i;
 
@@ -391,7 +391,7 @@ static void armsse_exp_irq(void *opaque, int n, int level)
 
 static void armsse_mpcexp_status(void *opaque, int n, int level)
 {
-    ARMSSE *s = ARMSSE(opaque);
+    ARMSSE *s = ARM_SSE(opaque);
     qemu_set_irq(s->mpcexp_status_in[n], level);
 }
 
@@ -401,7 +401,7 @@ static qemu_irq armsse_get_common_irq_in(ARMSSE *s, int irqno)
      * Return a qemu_irq which can be used to signal IRQ n to
      * all CPUs in the SSE.
      */
-    ARMSSEClass *asc = ARMSSE_GET_CLASS(s);
+    ARMSSEClass *asc = ARM_SSE_GET_CLASS(s);
     const ARMSSEInfo *info = asc->info;
 
     assert(irq_is_common[irqno]);
@@ -428,8 +428,8 @@ static void map_ppu(ARMSSE *s, int ppuidx, const char *name, hwaddr addr)
 
 static void armsse_realize(DeviceState *dev, Error **errp)
 {
-    ARMSSE *s = ARMSSE(dev);
-    ARMSSEClass *asc = ARMSSE_GET_CLASS(dev);
+    ARMSSE *s = ARM_SSE(dev);
+    ARMSSEClass *asc = ARM_SSE_GET_CLASS(dev);
     const ARMSSEInfo *info = asc->info;
     int i;
     MemoryRegion *mr;
@@ -1114,7 +1114,7 @@ static void armsse_idau_check(IDAUInterface *ii, uint32_t address,
      * of the address bits. The NSC attribute is guest-adjustable via the
      * NSCCFG register in the security controller.
      */
-    ARMSSE *s = ARMSSE(ii);
+    ARMSSE *s = ARM_SSE(ii);
     int region = extract32(address, 28, 4);
 
     *ns = !(region & 1);
@@ -1136,7 +1136,7 @@ static const VMStateDescription armsse_vmstate = {
 
 static void armsse_reset(DeviceState *dev)
 {
-    ARMSSE *s = ARMSSE(dev);
+    ARMSSE *s = ARM_SSE(dev);
 
     s->nsccfg = 0;
 }
@@ -1145,7 +1145,7 @@ static void armsse_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     IDAUInterfaceClass *iic = IDAU_INTERFACE_CLASS(klass);
-    ARMSSEClass *asc = ARMSSE_CLASS(klass);
+    ARMSSEClass *asc = ARM_SSE_CLASS(klass);
     const ARMSSEInfo *info = data;
 
     dc->realize = armsse_realize;
@@ -1157,7 +1157,7 @@ static void armsse_class_init(ObjectClass *klass, void *data)
 }
 
 static const TypeInfo armsse_info = {
-    .name = TYPE_ARMSSE,
+    .name = TYPE_ARM_SSE,
     .parent = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(ARMSSE),
     .instance_init = armsse_init,
@@ -1177,7 +1177,7 @@ static void armsse_register_types(void)
     for (i = 0; i < ARRAY_SIZE(armsse_variants); i++) {
         TypeInfo ti = {
             .name = armsse_variants[i].name,
-            .parent = TYPE_ARMSSE,
+            .parent = TYPE_ARM_SSE,
             .class_init = armsse_class_init,
             .class_data = (void *)&armsse_variants[i],
         };
-- 
2.26.2


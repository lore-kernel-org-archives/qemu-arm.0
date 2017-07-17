Received: by 10.25.44.15 with SMTP id s15csp4049117lfs;
        Sun, 16 Jul 2017 19:39:01 -0700 (PDT)
X-Received: by 10.200.50.249 with SMTP id a54mr23325672qtb.91.1500259141015;
        Sun, 16 Jul 2017 19:39:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500259141; cv=none;
        d=google.com; s=arc-20160816;
        b=inOgagJZzw9PzsNjO02EYBMNHeKpSf/Pb2W0JRTTXE6a1wDp45G0WkD66bgQI8B2lt
         YGIdKEp2I3A7Z52F4nYSpQEF4OkDQjLW5v8cLGngDiZ/gYHk4T/eFyvIgtcdxwgsPHoD
         qcnOULIZ7U1QsjzuNWeAjHsPxMb5p7icmWmcbDrIGaoQ7z8baqJZTXuOC19Lh/5l66XM
         /RyiQ7kggV5IziQbkg/ONqT+sbP37kgTFa+P0J56DUhxWyVVe97XmIFapvSZFLBIFSJe
         XQoB6u5FLLury7bsw9w1LiZpEQaCBZ9g+so4OXc3LvgQBVJz9glyO3VS9vSOfidqTRxP
         GsJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=BclAShsqSdBNX9u6PXDxSez+5nIAQnlOpLZjuOLAsPo=;
        b=ELUt7Kb8BLa1h0jvjPLna5IYVj7G7vvA9kYaYuAIPw7Qx5xmtFnuVlhge4R1GX2b+O
         TYqKn5NGxVq+WX7IX4gjlKztXhaZ7Dczl/+ohZjPU/ftIX/1z9rF/cJtFwmq7hi96cCZ
         zGsNUi1t8ncu5MjZdxzgn5a8zAl9c6nyYC3fwl01WVSx5wq5wNNbwHLRHCLnb1xDQcWe
         NLlwsz/Kcmgxdhwa8jVHKn5fa5CzZ59XK4Prgq685qsBtACK+WtzxD4/cV4KiswQVbO9
         GLS3nydzvGipQY/1w8/aooa7t/9CaYKlBLDfB2ynM1BO2+SIUydI0780i3+pxk6tGL+Y
         xnTw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s27si13950651qtg.103.2017.07.16.19.39.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 16 Jul 2017 19:39:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47574 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dWvw2-0000g1-97
	for alex.bennee@linaro.org; Sun, 16 Jul 2017 22:38:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33998)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1dWvvg-0000M9-AO
	for qemu-arm@nongnu.org; Sun, 16 Jul 2017 22:38:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1dWvvf-0001WK-FJ
	for qemu-arm@nongnu.org; Sun, 16 Jul 2017 22:38:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50822)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <famz@redhat.com>)
	id 1dWvvf-0001Us-9D; Sun, 16 Jul 2017 22:38:35 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 35E8CC0587CC;
	Mon, 17 Jul 2017 02:38:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 35E8CC0587CC
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=famz@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 35E8CC0587CC
Received: from lemon.redhat.com (ovpn-12-94.pek2.redhat.com [10.72.12.94])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9FD2A6031D;
	Mon, 17 Jul 2017 02:38:32 +0000 (UTC)
From: Fam Zheng <famz@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 17 Jul 2017 10:38:21 +0800
Message-Id: <20170717023824.18796-4-famz@redhat.com>
In-Reply-To: <20170717023824.18796-1-famz@redhat.com>
References: <20170717023824.18796-1-famz@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Mon, 17 Jul 2017 02:38:34 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v5 3/6] gicv3: Convert to DEFINE_PROP_LINK
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Jlkibp5jDfua

Signed-off-by: Fam Zheng <famz@redhat.com>
---
 hw/intc/arm_gicv3_its_kvm.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/hw/intc/arm_gicv3_its_kvm.c b/hw/intc/arm_gicv3_its_kvm.c
index 1f8991b..39903d5 100644
--- a/hw/intc/arm_gicv3_its_kvm.c
+++ b/hw/intc/arm_gicv3_its_kvm.c
@@ -120,17 +120,6 @@ static void kvm_arm_its_realize(DeviceState *dev, Error **errp)
     qemu_add_vm_change_state_handler(vm_change_state_handler, s);
 }
 
-static void kvm_arm_its_init(Object *obj)
-{
-    GICv3ITSState *s = KVM_ARM_ITS(obj);
-
-    object_property_add_link(obj, "parent-gicv3",
-                             "kvm-arm-gicv3", (Object **)&s->gicv3,
-                             object_property_allow_set_link,
-                             OBJ_PROP_LINK_UNREF_ON_RELEASE,
-                             &error_abort);
-}
-
 /**
  * kvm_arm_its_pre_save - handles the saving of ITS registers.
  * ITS tables are flushed into guest RAM separately and earlier,
@@ -205,12 +194,19 @@ static void kvm_arm_its_post_load(GICv3ITSState *s)
                       GITS_CTLR, &s->ctlr, true, &error_abort);
 }
 
+static Property kvm_arm_its_props[] = {
+    DEFINE_PROP_LINK("parent-gicv3", GICv3ITSState, gicv3, "kvm-arm-gicv3",
+                     GICv3State *),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static void kvm_arm_its_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     GICv3ITSCommonClass *icc = ARM_GICV3_ITS_COMMON_CLASS(klass);
 
     dc->realize = kvm_arm_its_realize;
+    dc->props   = kvm_arm_its_props;
     icc->send_msi = kvm_its_send_msi;
     icc->pre_save = kvm_arm_its_pre_save;
     icc->post_load = kvm_arm_its_post_load;
@@ -220,7 +216,6 @@ static const TypeInfo kvm_arm_its_info = {
     .name = TYPE_KVM_ARM_ITS,
     .parent = TYPE_ARM_GICV3_ITS_COMMON,
     .instance_size = sizeof(GICv3ITSState),
-    .instance_init = kvm_arm_its_init,
     .class_init = kvm_arm_its_class_init,
 };
 
-- 
2.9.4


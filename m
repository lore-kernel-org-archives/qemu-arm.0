Received: by 10.223.172.38 with SMTP id v35csp1406394wrc;
        Tue, 5 Sep 2017 06:12:33 -0700 (PDT)
X-Google-Smtp-Source: ADKCNb6zattbx9qck6iuuFH3cOW8wI6FuNSDlsKwx5xOrWN20uu+Zy//mP0PlPH7nKywVCX3lkZo
X-Received: by 10.237.63.100 with SMTP id q33mr5039873qtf.114.1504617153181;
        Tue, 05 Sep 2017 06:12:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504617153; cv=none;
        d=google.com; s=arc-20160816;
        b=xAorVwZgjffRCnkRm4JJwGJnKFdBXMsawv2XFLaEGazqtHs2fmr7bOWswCIQ9cDF/L
         OmQ3zZU7eCI/6fcvRRPgw3eJ8pXDJ+gFmWeL3XO4lx4McUAir3d816TDtJXeYjEox54B
         K0ArarGVLrpjXQmMqKbWa4eE5qY+ynl5qoy6T+RMKe+e86qU7ayVWZaR8PRS4mcXc+7z
         ebflCWVV0nCm+Z9G7Jr6hCmjzoO/WqHp3h1sD9RffA9buRUK1ignThmvm+yYiz18Q6WK
         xOHTYu+VtDFd4MuD3WJqrfhGkMqSf5zAqNXA3M6XcgqTjnhU5vASNzEYPdIrHmJLVQeL
         LHzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:arc-authentication-results;
        bh=h2e3Dzx+8cNNo/bmjvvBTPGliCPcRgh/MVGXbScHHH8=;
        b=OZxtZDbPqwQV+2jA0T3ZicIM1gX5sK9nix1Qvpsdhr0ZOkgOGzcCQTZeR8FQ6TUwHy
         ZSBWtiZhXvv5vbrHc7wcJSvaNVyWSNDE15UcY+sRXGoSKun5qyVRHu8HCGa5l4K5yAJJ
         ibET/JpRo7D680Pye2JXs2hFM5xRgSTrMFM5ow707F+d7iN3zJ4ENJOejCJl3V2ojNCG
         VfNXI1gKRQL9U7WJ4gDar4R4UKIsZr5ji9R3Q+6ggrknkD3t1uVBZt8jfYvN9HZMk92b
         j92liZsguyAk3rkX8LSq5KqOHHq0kXEc1uK5Nlh8yyG/7EIciftf8q+jBVZaQXwMX1rV
         akkg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i132si402998qke.166.2017.09.05.06.12.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Sep 2017 06:12:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58852 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dpDeY-0006nL-O9
	for alex.bennee@linaro.org; Tue, 05 Sep 2017 09:12:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42792)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1dpDe9-0006Sn-TG
	for qemu-arm@nongnu.org; Tue, 05 Sep 2017 09:12:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1dpDe5-0007pO-24
	for qemu-arm@nongnu.org; Tue, 05 Sep 2017 09:12:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33910)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <famz@redhat.com>)
	id 1dpDe4-0007oO-Sv; Tue, 05 Sep 2017 09:12:00 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0450672FF5;
	Tue,  5 Sep 2017 13:12:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 0450672FF5
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=famz@redhat.com
Received: from lemon.redhat.com (ovpn-12-97.pek2.redhat.com [10.72.12.97])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 229D77FB8F;
	Tue,  5 Sep 2017 13:11:57 +0000 (UTC)
From: Fam Zheng <famz@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue,  5 Sep 2017 21:11:46 +0800
Message-Id: <20170905131149.10669-4-famz@redhat.com>
In-Reply-To: <20170905131149.10669-1-famz@redhat.com>
References: <20170905131149.10669-1-famz@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Tue, 05 Sep 2017 13:12:00 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v6 3/6] gicv3: Convert to DEFINE_PROP_LINK
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: awaTzsixsLIe

Signed-off-by: Fam Zheng <famz@redhat.com>
---
 hw/intc/arm_gicv3_its_kvm.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/hw/intc/arm_gicv3_its_kvm.c b/hw/intc/arm_gicv3_its_kvm.c
index 1f8991b8a6..39903d5eab 100644
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
2.13.5


Received: by 10.25.221.202 with SMTP id w71csp2761998lfi;
        Mon, 7 Aug 2017 04:50:07 -0700 (PDT)
X-Received: by 10.200.39.130 with SMTP id w2mr282961qtw.244.1502106607136;
        Mon, 07 Aug 2017 04:50:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1502106607; cv=none;
        d=google.com; s=arc-20160816;
        b=SbReD+PUHedJC862i0HZIE+XO3SgEhB851XcZSrIiekVexKE9Fb8FFrsmFc6xOlLIL
         x6AHDhHHxyfrgCYp8FDAlo+MJv3ERYjGtmYWgX08SHL2zA4tuegojLuI9cBejvSUdqlF
         QBxCGcGs/Y0wUoGdUwmpxBnJ+d+FX+rFk8zysaPecJwX7HZZ1G9lmOicRH6q2lEm+h+g
         XneKf3T+q0HDPYj1xdorcb5CcUMXYNpPOyNDD5OJ5Asp/0mp8Bvwou27rhDX4Cn8Y2ns
         qfrFIMwT2GO9/ouzWdizzxCetp8dgP7CryNZrhXtUUOi7V13oVTdTW3Kb6o7Z7RLzCxf
         xKFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dmarc-filter:arc-authentication-results;
        bh=Oszs+YwnqFVuGL6+1g/IPeI/d5OqkYqyR17L1rRxewk=;
        b=mNOpzwaOlUS7JthkwViGVkMbhF0LPTOIv4jwD+Dk98Mch56vfQZq2j6Q2fFZ+I/udE
         XG0Wk2PhHBumMGxXMH5jYa1QixgB735hHz1BtRkHtbrHUN4EyzPwg7gGXQwERd6kyKBC
         gC025blmHkNROF1IlXdXQdJjgiYNGQHU54kk7K03xocG1C2scqjIxz2SwU1FRwJYK7+Z
         6SAWjIaiRKXy8buSBSBxnbOcb7WVytf7qeGwYRFaWVL5r5hzUhri/1y0g7NM+KPRTbUY
         ibsY8ViomE0aW+i9Bq6ufrIsz7L3DvRRXOcRJY+4U4Rnvcn+aBw4e6iaO3kXMdC0ClF6
         yiGw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l129si7106746qkf.25.2017.08.07.04.50.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 07 Aug 2017 04:50:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36643 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1degXs-00023x-KY
	for alex.bennee@linaro.org; Mon, 07 Aug 2017 07:50:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39965)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1degXk-0001yJ-Gt
	for qemu-arm@nongnu.org; Mon, 07 Aug 2017 07:50:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1degXf-0006gX-Ne
	for qemu-arm@nongnu.org; Mon, 07 Aug 2017 07:49:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55748)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1degXf-0006gN-Hk; Mon, 07 Aug 2017 07:49:51 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 76B2C80E6A;
	Mon,  7 Aug 2017 11:49:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 76B2C80E6A
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eric.auger@redhat.com
Received: from AMD.redhat.com (ovpn-117-173.ams2.redhat.com [10.36.117.173])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 707F67E69D;
	Mon,  7 Aug 2017 11:49:48 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger@redhat.com, eric.auger.pro@gmail.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Mon,  7 Aug 2017 11:49:41 +0000
Message-Id: <1502106581-11714-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Mon, 07 Aug 2017 11:49:50 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH for-2.10] hw/arm/virt: Add 2.10 machine type
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
Cc: drjones@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: akXhxuxf4TNV

Add virt-2.10 machine type.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---
---
 hw/arm/virt.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 31739d7..6b7a0fe 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1639,7 +1639,7 @@ static void machvirt_machine_init(void)
 }
 type_init(machvirt_machine_init);
 
-static void virt_2_9_instance_init(Object *obj)
+static void virt_2_10_instance_init(Object *obj)
 {
     VirtMachineState *vms = VIRT_MACHINE(obj);
     VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
@@ -1699,10 +1699,25 @@ static void virt_2_9_instance_init(Object *obj)
     vms->irqmap = a15irqmap;
 }
 
+static void virt_machine_2_10_options(MachineClass *mc)
+{
+}
+DEFINE_VIRT_MACHINE_AS_LATEST(2, 10)
+
+#define VIRT_COMPAT_2_9 \
+    HW_COMPAT_2_9
+
+static void virt_2_9_instance_init(Object *obj)
+{
+    virt_2_10_instance_init(obj);
+}
+
 static void virt_machine_2_9_options(MachineClass *mc)
 {
+    virt_machine_2_10_options(mc);
+    SET_MACHINE_COMPAT(mc, VIRT_COMPAT_2_9);
 }
-DEFINE_VIRT_MACHINE_AS_LATEST(2, 9)
+DEFINE_VIRT_MACHINE(2, 9)
 
 #define VIRT_COMPAT_2_8 \
     HW_COMPAT_2_8
-- 
1.9.1


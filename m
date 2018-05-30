Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp4649147wre;
        Wed, 30 May 2018 04:54:54 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKi3FZsDU6N/uY5WHapOQlmLw64lH0qNkfCrSKd67k0DAI0CMzL7sBR2C9GAK//e/+x/qLZ
X-Received: by 2002:a37:668c:: with SMTP id a134-v6mr1907391qkc.7.1527681293961;
        Wed, 30 May 2018 04:54:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527681293; cv=none;
        d=google.com; s=arc-20160816;
        b=B/rYwrc7sAFnPdM+UMG08aBdJn/NCyeGPHnuBrBsmZucS+GPngaTfHah0LUc1PZg/8
         gOWIPhF8i4EK8AtM9qfD+XeL74Myhiyp6yxJZguOdjZaskJM/XubyJNp2ZISiJjUuCn3
         y7YuxkHXGs+azcjvvEZI0rtxeX3vmCiUMIYaSsaM/3f9fV++NHm073NzNQdX432D0SBv
         C2+raeZ3UGNAzV6WJwim983PlNosvVBLwak+P2bIdaHYvrnJoOMOl24efsLHgT7AJlym
         qqF0Ech5AGcjGLFtOm37hJFtETVkPaK0k7UW9pLYiqoDrxMTGnvJJS9iEjsHuf4eE8jK
         NWzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=XTSgs80+JVzYfb2gEpt0NB+81HvI+zT263epWpI36yo=;
        b=ed6iqGztUdm03j8zkXFMHFKmPq0KNGgxsunovFqASZgeJIQmecp5+1zVvfOBc+dQ0U
         dsbtuwqhL4rG1lgY1bANatMtT0jgyFfT1pkSXkB8cce+K64jVqJ8NZz08k7vuyFstMvQ
         7e1+Xli4OtC33gJI52cRnrts3Z8iBgRgrQFeGiOPUhX6JDKAvBWaU2J7mRknWATjX+6E
         QBbnM2tcMbayVpyFA/2JQA5r+Q1vtRTn8XNSFOILcgFj5j8yWCmxc/FY2E3x3lp/DhEv
         WQCRp2S5rzFOi0bSwG86JAUNM3w0c3dzM2gnFnXoxBDSh9Z0AaVeX6GytNT8kJaBbBl4
         36Gw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c47-v6si3519857qvh.93.2018.05.30.04.54.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 30 May 2018 04:54:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37807 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNzgr-000384-G9
	for alex.bennee@linaro.org; Wed, 30 May 2018 07:54:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49441)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fNzYa-00053m-3s
	for qemu-devel@nongnu.org; Wed, 30 May 2018 07:46:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fNzYZ-0005Pe-5L
	for qemu-devel@nongnu.org; Wed, 30 May 2018 07:46:20 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:39830 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fNzYU-0005MY-Em; Wed, 30 May 2018 07:46:14 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EB0E8402242D;
	Wed, 30 May 2018 11:46:13 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-69.ams2.redhat.com
	[10.36.116.69])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EEA6A10EE6C1;
	Wed, 30 May 2018 11:46:11 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Wed, 30 May 2018 13:45:41 +0200
Message-Id: <1527680741-2725-9-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1527680741-2725-1-git-send-email-eric.auger@redhat.com>
References: <1527680741-2725-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Wed, 30 May 2018 11:46:14 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Wed, 30 May 2018 11:46:14 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-devel] [RFC v3 8/8] hw/arm/virt: Add virt-3.0 machine type
 supporting up to 512 vcpus
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
Cc: marc.zyngier@arm.com, wei@redhat.com, drjones@redhat.com,
	christoffer.dall@arm.com, zhaoshenglong@huawei.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iYXUp1Yfx2L2

Add virt-3.0 machine type.

This machine type allows up to 512 vcpus whereas for
earlier machine types, max_cpus was set to 255 and
any attempt to start the machine with vcpus > 255
was rejected at vl.c/main level.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/virt.c | 32 +++++++++++++++++++++++++-------
 1 file changed, 25 insertions(+), 7 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index c00f47d..a9fc24b 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1697,11 +1697,13 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     HotplugHandlerClass *hc = HOTPLUG_HANDLER_CLASS(oc);
 
     mc->init = machvirt_init;
-    /* Start max_cpus at the maximum QEMU supports. We'll further restrict
-     * it later in machvirt_init, where we have more information about the
-     * configuration of the particular instance.
+    /* Start with max_cpus set to 512. This value is chosen since achievable
+     * in accelerated mode with GICv3 and recent host supporting up to 512 vcpus
+     * and multiple redistributor region registration.
+     * This value will be refined later on once we collect more information
+     * about the configuration of the particular instance.
      */
-    mc->max_cpus = 255;
+    mc->max_cpus = 512;
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_CALXEDA_XGMAC);
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_AMD_XGBE);
     mc->block_default_type = IF_VIRTIO;
@@ -1737,7 +1739,7 @@ static void machvirt_machine_init(void)
 }
 type_init(machvirt_machine_init);
 
-static void virt_2_12_instance_init(Object *obj)
+static void virt_3_0_instance_init(Object *obj)
 {
     VirtMachineState *vms = VIRT_MACHINE(obj);
     VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
@@ -1805,10 +1807,26 @@ static void virt_2_12_instance_init(Object *obj)
     vms->irqmap = a15irqmap;
 }
 
-static void virt_machine_2_12_options(MachineClass *mc)
+static void virt_machine_3_0_options(MachineClass *mc)
 {
 }
-DEFINE_VIRT_MACHINE_AS_LATEST(2, 12)
+DEFINE_VIRT_MACHINE_AS_LATEST(3, 0)
+
+#define VIRT_COMPAT_2_12 \
+    HW_COMPAT_2_12
+
+static void virt_2_12_instance_init(Object *obj)
+{
+    virt_3_0_instance_init(obj);
+}
+
+static void virt_machine_2_12_options(MachineClass *mc)
+{
+    virt_machine_3_0_options(mc);
+    SET_MACHINE_COMPAT(mc, VIRT_COMPAT_2_12);
+    mc->max_cpus = 255;
+}
+DEFINE_VIRT_MACHINE(2, 12)
 
 #define VIRT_COMPAT_2_11 \
     HW_COMPAT_2_11
-- 
2.5.5


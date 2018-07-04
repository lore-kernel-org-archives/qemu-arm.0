Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp502048wrq;
        Wed, 4 Jul 2018 05:49:46 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdfVdmkS/NMEr83RHLpC3lEmfJDbyPU78whHQnEOME3Tt4rEAk3RaUDt/kSwrw3IAEmMXaC
X-Received: by 2002:ac8:2485:: with SMTP id s5-v6mr1490688qts.350.1530708586519;
        Wed, 04 Jul 2018 05:49:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530708586; cv=none;
        d=google.com; s=arc-20160816;
        b=SyvMeO8BFKU6ASN9IV0TOrmA8HVoI13c4prYBFXYkRViRgbAT3nAOh+2s4oagGvWkr
         rLB2qJ8u1i3c99Gm5f6xa/1RCQjzjkltcc6zjzAR03M3YXvSszkSA8ITbZqDoKAAhXtn
         O4nc3iJBlyl65MIVVDD5XD9PF6OJO+BnSmS7kLRDc8eC6AJL9qTKDhjYigSpJZqRyYUt
         uMIACL9DNbsuIY0x21ss/D0nFoOtzF1S1yLB0dZLh0KhD+TatJpP3Ua59AvpQq4TgU0p
         S7u/yCYQEjtbsM73iQAYxETkBfIG8HJc6LL42IVwBPjTqQ+QV+2PqG+CudMEeGzMsAlh
         DS1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=qsxp4/88aoioSLo3PEDegBqpmzqgTi1sjVMfm4r7OVM=;
        b=ddOo0F0V7PrhGuGuunuuQ59ET4njbyweq9JnCyS0+vG5qmgEbWIdNs4U3abZHpthSu
         lzIyF+gu0Mka1iBqy4bwlDIFcfUXU5pXTOxAeK1/MWaZvU98DQscx06nyjeLhILKUsvL
         yLvDBV/H/7iMKAy3H49G8luGWRDBE0gNfJYfx3LRi3V2DPmYKmiZVP+VgXnfcvedxKnI
         ohqcczhoHx0A39Eh/QHjm62CoKiVRb6JWtxzHuhr7QBQ5ZxxmwvITWhwHLw/FyG1mD6N
         wAg4M+oR5vEon5/YPHi7ss0lAC2P75meP1NEbPiycE2otAO5Udd7TnRSBAWrxRSa/aGc
         FVlA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n22-v6si3225503qtl.10.2018.07.04.05.49.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 04 Jul 2018 05:49:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46900 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fahE9-0007Sm-WD
	for alex.bennee@linaro.org; Wed, 04 Jul 2018 08:49:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46183)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1fahDu-0007R1-HU
	for qemu-arm@nongnu.org; Wed, 04 Jul 2018 08:49:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1fahDs-0000S9-3L
	for qemu-arm@nongnu.org; Wed, 04 Jul 2018 08:49:30 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:55422 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1fahDr-0000Rw-Ut; Wed, 04 Jul 2018 08:49:28 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6250581A4EA9;
	Wed,  4 Jul 2018 12:49:27 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 37D622156889;
	Wed,  4 Jul 2018 12:49:26 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Wed,  4 Jul 2018 14:49:18 +0200
Message-Id: <20180704124923.32483-2-drjones@redhat.com>
In-Reply-To: <20180704124923.32483-1-drjones@redhat.com>
References: <20180704124923.32483-1-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Wed, 04 Jul 2018 12:49:27 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Wed, 04 Jul 2018 12:49:27 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'drjones@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [RFC PATCH 1/6] hw/arm/virt: Add virt-3.1 machine type
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
Cc: peter.maydell@linaro.org, eric.auger@redhat.com, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: k9d8vUhleTqP

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 hw/arm/virt.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 281ddcdf6e26..880441275031 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1757,10 +1757,7 @@ static void machvirt_machine_init(void)
 }
 type_init(machvirt_machine_init);
 
-#define VIRT_COMPAT_2_12 \
-    HW_COMPAT_2_12
-
-static void virt_3_0_instance_init(Object *obj)
+static void virt_3_1_instance_init(Object *obj)
 {
     VirtMachineState *vms = VIRT_MACHINE(obj);
     VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
@@ -1830,10 +1827,24 @@ static void virt_3_0_instance_init(Object *obj)
     vms->irqmap = a15irqmap;
 }
 
+static void virt_machine_3_1_options(MachineClass *mc)
+{
+}
+DEFINE_VIRT_MACHINE_AS_LATEST(3, 1)
+
+static void virt_3_0_instance_init(Object *obj)
+{
+    virt_3_1_instance_init(obj);
+}
+
 static void virt_machine_3_0_options(MachineClass *mc)
 {
+    virt_machine_3_1_options(mc);
 }
-DEFINE_VIRT_MACHINE_AS_LATEST(3, 0)
+DEFINE_VIRT_MACHINE(3, 0)
+
+#define VIRT_COMPAT_2_12 \
+    HW_COMPAT_2_12
 
 static void virt_2_12_instance_init(Object *obj)
 {
-- 
2.17.1


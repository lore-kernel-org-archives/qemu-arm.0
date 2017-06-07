Received: by 10.25.0.23 with SMTP id 23csp2163049lfa;
        Wed, 7 Jun 2017 09:09:49 -0700 (PDT)
X-Received: by 10.200.35.177 with SMTP id q46mr40567683qtq.158.1496851789553;
        Wed, 07 Jun 2017 09:09:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496851789; cv=none;
        d=google.com; s=arc-20160816;
        b=GEGG2uA5GJZbm8c4XeeElGtSE2KowVZWiSWDln+rhcLEQ2tTAN5PUfCpD+d64BPWH9
         wBe8caa6+p/J/F95ATXa6JyhLfR176qOoV4hnkA49G5gtJJixPFJw9djmrHFiuodcNjG
         I7D2msy83tGm3AMhWjlZLZudOa0BValm+AVaAE6Nrq+jKnxsj1QBwsTO7aE17z8LoM/Z
         rZb3dTE384HLL6iqWVOW/Ht17WFFjOTKk455lE6kC40sCW7QhUN4yoAgfuh3FFYJ3MjU
         eyEKDvwCWvh1ifJs0CH7g7BqVVFmbkhKtYr2UckV5WIkcu7z9LjGgDcrGNbEOIq2fjeW
         qFqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=si7o2iq8dRV/ScbdQRTbOOHDYJaMYof7hT6ti+86JX0=;
        b=INdJMKUFlt6yCKuSkWaSmNmhBXqfm89l68NUFh4mUPl5//bQj1Ym1Q7WTHn6vTiFVh
         bzSMlFDtBvwHb1gT38UQGy+lXPob3HG54T5kl3Y/9gfnf8AV/3H7Ucllmlnk7jLQj3Rx
         DoInIGOhBcTbRMgh/f9RTc3fy0z8VZ8nkxcktM3QwI30PEaoqiwEzlNfNFHb+domfny+
         mvKax5RVok+Bs7at2ayrz1K4hRKm7PfKoyqJe44u7mQbKpfsP3jH9oHEIep3DSxDlsgz
         WT3hzNjfAMxtoHll5G+zQT7ZxtKvydGnHov3ShxdEMUFhd/fvJIQjMEHLxWHxlRP7hsi
         6CHg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a5si2372497qta.303.2017.06.07.09.09.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 07 Jun 2017 09:09:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44962 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dIdWk-0005wn-Q0
	for alex.bennee@linaro.org; Wed, 07 Jun 2017 12:09:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50781)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dIdPh-0006bz-IF
	for qemu-arm@nongnu.org; Wed, 07 Jun 2017 12:02:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dIdPd-00089d-K2
	for qemu-arm@nongnu.org; Wed, 07 Jun 2017 12:02:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56054)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1dIdPd-00089D-Ff; Wed, 07 Jun 2017 12:02:25 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 415DB3DBE6;
	Wed,  7 Jun 2017 16:02:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 415DB3DBE6
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eric.auger@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 415DB3DBE6
Received: from localhost.localdomain.com (ovpn-116-222.ams2.redhat.com
	[10.36.116.222])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 91E4E7D509;
	Wed,  7 Jun 2017 16:02:20 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	alex.williamson@redhat.com, mst@redhat.com, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, jean-philippe.brucker@arm.com
Date: Wed,  7 Jun 2017 18:01:26 +0200
Message-Id: <1496851287-9428-8-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1496851287-9428-1-git-send-email-eric.auger@redhat.com>
References: <1496851287-9428-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Wed, 07 Jun 2017 16:02:24 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v2 7/8] hw/arm/virt: Add 2.10 machine type
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
Cc: kevin.tian@intel.com, bharat.bhushan@nxp.com, marc.zyngier@arm.com,
	tn@semihalf.com, will.deacon@arm.com, drjones@redhat.com,
	robin.murphy@arm.com, christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: h5lRawH5Hw0I

The new machine type allows virtio-iommu instantiation.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

a Veuillez saisir le message de validation pour vos modifications. Les lignes
---
 hw/arm/virt.c         | 24 ++++++++++++++++++++++--
 include/hw/arm/virt.h |  1 +
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 010f724..6eb0d2a 100644
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
@@ -1699,10 +1699,30 @@ static void virt_2_9_instance_init(Object *obj)
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
+    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
+
+    virt_machine_2_10_options(mc);
+    SET_MACHINE_COMPAT(mc, VIRT_COMPAT_2_9);
+
+    vmc->no_iommu = true;
 }
-DEFINE_VIRT_MACHINE_AS_LATEST(2, 9)
+DEFINE_VIRT_MACHINE(2, 9)
+
 
 #define VIRT_COMPAT_2_8 \
     HW_COMPAT_2_8
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 33b0ff3..ff27551 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -84,6 +84,7 @@ typedef struct {
     bool disallow_affinity_adjustment;
     bool no_its;
     bool no_pmu;
+    bool no_iommu;
     bool claim_edge_triggered_timers;
 } VirtMachineClass;
 
-- 
2.5.5


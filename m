Received: by 10.25.44.15 with SMTP id s15csp4669478lfs;
        Tue, 1 Aug 2017 02:37:19 -0700 (PDT)
X-Received: by 10.55.73.74 with SMTP id w71mr26812192qka.268.1501580238995;
        Tue, 01 Aug 2017 02:37:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501580238; cv=none;
        d=google.com; s=arc-20160816;
        b=rMvupAj++M+Xi9ZYqhjtVX8kSqYcpf+nKOECDI/LhOS7mgChBX4EPdiyjObjz+ztIP
         cDlWxsWgAusm8Lrw+CirzlA2NZHEhm85bA9D2nyzuhd1mzHKsQcPFW0YfECwnn1p8rYq
         nDX2DFTKCuQh7E9DNByj6V6y8ieyT0LYWGyOXIajA0Wl35HEf7Qf6JMDTCVt4KIG6lqw
         heyKdcF1AxEzZnOeFTyPzXRpiarWooWCep4a2l1RI7rdfZEmCIBzDGA+MAq1uZDN2/Zl
         C1YnV4j6NNcqY0QmJIaFZRBCM4jBix0NRnwulI5uH9p38tncQypESTau5jRjP36xJv3S
         nLbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:arc-authentication-results;
        bh=fhDWWC5WtrBHuaZysE5opjxKPH/+DCnyiBmttgCcO5E=;
        b=e24bTtZZGmoqApojqr8rmCY4EOrYh+VkfRIGWHgjOVIwWIwt7WbHg4rxa9LFA2pA3n
         J30DWUiVfMM2vj+YFGK1tOkAr7BxFcyh0prwpX8BfWe5HDA6o0ZFanVQmvX0hWH2JRws
         nFES2TU33yCLnkNO3X4mSzr2DzIPQNTKpy6UBJNqEGACnmlrn0dPK0b2ULXhFF04Cc0P
         PS5CwdiTnJ2t6TL2FKnSven1l7IqxCP1sctpL4Pui7N09BGBucQeobvPteQX0Vqad9+P
         ZRnsfDbouX3f6gPznmmoHQqQKlAnZat1ap4Ke8HAMolcwtJ7QsKnsW9Rq0OuxxWoFHH0
         hcQA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o42si27570470qko.410.2017.08.01.02.37.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 01 Aug 2017 02:37:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41392 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dcTc4-0001Bl-Eq
	for alex.bennee@linaro.org; Tue, 01 Aug 2017 05:37:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38478)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dcTaD-00086B-6o
	for qemu-arm@nongnu.org; Tue, 01 Aug 2017 05:35:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dcTaC-0002XT-AE
	for qemu-arm@nongnu.org; Tue, 01 Aug 2017 05:35:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52312)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1dcTaC-0002Vz-3o; Tue, 01 Aug 2017 05:35:20 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 72CFC2861C8;
	Tue,  1 Aug 2017 09:35:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 72CFC2861C8
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eric.auger@redhat.com
Received: from localhost.localdomain.com (ovpn-116-181.ams2.redhat.com
	[10.36.116.181])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3F6C36017B;
	Tue,  1 Aug 2017 09:35:03 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	alex.williamson@redhat.com, mst@redhat.com, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, jean-philippe.brucker@arm.com
Date: Tue,  1 Aug 2017 11:33:13 +0200
Message-Id: <1501579994-3320-8-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1501579994-3320-1-git-send-email-eric.auger@redhat.com>
References: <1501579994-3320-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Tue, 01 Aug 2017 09:35:19 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v3 7/8] hw/arm/virt: Add 2.10 machine type
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
Cc: kevin.tian@intel.com, marc.zyngier@arm.com, tn@semihalf.com,
	will.deacon@arm.com, drjones@redhat.com, peterx@redhat.com,
	bharat.bhushan@nxp.com, christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SPZQpDmCfyCM

The new machine type allows virtio-iommu instantiation.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

a Veuillez saisir le message de validation pour vos modifications. Les lignes
---
 hw/arm/virt.c         | 24 ++++++++++++++++++++++--
 include/hw/arm/virt.h |  1 +
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 31739d7..93c4ab2 100644
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


Received: by 10.25.44.15 with SMTP id s15csp2623658lfs;
        Sun, 9 Jul 2017 13:54:47 -0700 (PDT)
X-Received: by 10.200.42.27 with SMTP id k27mr667995qtk.40.1499633687884;
        Sun, 09 Jul 2017 13:54:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499633687; cv=none;
        d=google.com; s=arc-20160816;
        b=cUi066oSq2/lQsKYx7rff0HmIery+r4tTedJQq/CrRtiY99r79pN3/NbpZyNQdl2Q+
         bWSybivyjzVD25O5OtDEDLeq9pKsTSbIUc299ROGyQZ+B3w5lNYoD6/FPP3lwl3LxMCF
         pxzsZqNHpSW4tgZObQbtLZOt4u8LCrzvHCNPQh7Yk1e56vy02PJXE1cg+Zfdxa8XVvsi
         O4sbbs56C21LDechHxOaUfN6cj5WWw93/qRPF/WCM+TKybgCyBtw4zKXp+Q9wAVS+hpJ
         UKyYjbkquJ8RYpaIj/8e+J3c8ImneZVIoBbgwutA9B5V+kItuOLhVSAdVZAHcq/E39JD
         mBzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=Fzum/JKBO7ke7VIxniMcoOmUuR1Yme27rN1BdPIQuhc=;
        b=FQxDIU0AN+pIjwYaMOv9WwZZgtTtJa3KIcU+edPBdMYz6hd8E+PPWUd6NmigQXlOiP
         JoBpH8cF0LpvwCMOpI36bBTE8DqYGFvfVUAEak35nRFFTsmrlJYs88VwNfUYPnIHS3vl
         tFHM4khXF4SV3A++INCAsiD4SALIUzuilhFhil59MCfAxwJ4uUhve2WviQABSv86Laij
         j7hc9cnBDADPUOAOCq6zb1F+gujVY5yiC6rpj+N83SbSzAyizk3RpciryLXbrMW3ggje
         qchtC5zfLJP34sXotYwOQRETtAb3kcAhyeZrPb4dOSQ2a3VjliCBJ0HKGVkkv7Kpk9tv
         8GkQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id m1si9394187qti.255.2017.07.09.13.54.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 09 Jul 2017 13:54:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37434 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dUJE4-0003tZ-SG
	for alex.bennee@linaro.org; Sun, 09 Jul 2017 16:54:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58732)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dUJBz-0001we-Ft
	for qemu-arm@nongnu.org; Sun, 09 Jul 2017 16:52:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dUJBy-0005w9-CS
	for qemu-arm@nongnu.org; Sun, 09 Jul 2017 16:52:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50740)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1dUJBy-0005vv-33; Sun, 09 Jul 2017 16:52:34 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DF85CC0467C1;
	Sun,  9 Jul 2017 20:52:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com DF85CC0467C1
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eric.auger@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com DF85CC0467C1
Received: from localhost.localdomain.com (ovpn-116-31.ams2.redhat.com
	[10.36.116.31])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C64D617DC6;
	Sun,  9 Jul 2017 20:52:19 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, alex.williamson@redhat.com,
	prem.mallappa@gmail.com
Date: Sun,  9 Jul 2017 22:51:29 +0200
Message-Id: <1499633493-19865-5-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1499633493-19865-1-git-send-email-eric.auger@redhat.com>
References: <1499633493-19865-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Sun, 09 Jul 2017 20:52:33 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v5 4/8] hw/arm/virt: Add 2.10 machine type
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
Cc: mohun106@gmail.com, drjones@redhat.com, tcain@qti.qualcomm.com,
	Radha.Chintakuntla@cavium.com, Sunil.Goutham@cavium.com,
	mst@redhat.com, jean-philippe.brucker@arm.com, tn@semihalf.com,
	will.deacon@arm.com, robin.murphy@arm.com, peterx@redhat.com,
	bharat.bhushan@nxp.com, christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TvyWFdvKrzIq

The new machine type allows smmuv3 instantiation. A new option
is introduced to turn the feature on/off (off by default).

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

Another alternative would be to use the -device option as
done on x86. As the smmu is a sysbus device, we would need to
use the platform bus framework. This would work fine
for the dt generation. However the feasibility needs to be
studied for ACPI table generation.

a Veuillez saisir le message de validation pour vos modifications. Les lignes
---
 hw/arm/virt.c         | 51 +++++++++++++++++++++++++++++++++++++++++++++++++--
 include/hw/arm/virt.h |  1 +
 2 files changed, 50 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index d3848ae..3651e41 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1543,6 +1543,20 @@ static void machvirt_init(MachineState *machine)
     create_platform_bus(vms, pic);
 }
 
+static bool virt_get_smmu(Object *obj, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+
+    return vms->smmu;
+}
+
+static void virt_set_smmu(Object *obj, bool value, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+
+    vms->smmu = value;
+}
+
 static bool virt_get_secure(Object *obj, Error **errp)
 {
     VirtMachineState *vms = VIRT_MACHINE(obj);
@@ -1698,7 +1712,7 @@ static void machvirt_machine_init(void)
 }
 type_init(machvirt_machine_init);
 
-static void virt_2_9_instance_init(Object *obj)
+static void virt_2_10_instance_init(Object *obj)
 {
     VirtMachineState *vms = VIRT_MACHINE(obj);
     VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
@@ -1754,14 +1768,47 @@ static void virt_2_9_instance_init(Object *obj)
                                         NULL);
     }
 
+    if (vmc->no_smmu) {
+        vms->smmu = false;
+    } else {
+        /* Default disallows smmu instantiation */
+        vms->smmu = false;
+        object_property_add_bool(obj, "smmu", virt_get_smmu,
+                                 virt_set_smmu, NULL);
+        object_property_set_description(obj, "smmu",
+                                        "Set on/off to enable/disable "
+                                        "smmu instantiation (default off)",
+                                        NULL);
+    }
+
     vms->memmap = a15memmap;
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
+    vmc->no_smmu = true;
 }
-DEFINE_VIRT_MACHINE_AS_LATEST(2, 9)
+DEFINE_VIRT_MACHINE(2, 9)
+
 
 #define VIRT_COMPAT_2_8 \
     HW_COMPAT_2_8
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 164a531..cd2c82e 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -86,6 +86,7 @@ typedef struct {
     bool disallow_affinity_adjustment;
     bool no_its;
     bool no_pmu;
+    bool no_smmu;
     bool claim_edge_triggered_timers;
 } VirtMachineClass;
 
-- 
2.5.5


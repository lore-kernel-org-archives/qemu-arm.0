Received: by 10.28.71.27 with SMTP id u27csp2115553wma;
        Sat, 17 Feb 2018 11:29:46 -0800 (PST)
X-Google-Smtp-Source: AH8x224X9c+Q7PyiverdWTj2yrN/PkkTH2yNJJ3RXqnqzf+Yxrq+2qaU6P2OdirYZWL1IrJKNQlp
X-Received: by 10.129.42.6 with SMTP id q6mr7524433ywq.155.1518895786091;
        Sat, 17 Feb 2018 11:29:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518895786; cv=none;
        d=google.com; s=arc-20160816;
        b=m9Ttu63rORLeIQCGcOwDgqf1spHXZfihVSP9MWsxi3LlaEfs76NbtDpVAuFbCYxtwB
         2l20xDKKAG8G4lGxMLZz95URtD4RUZCTjNA5IthaGsr4kyKNuk00wxEyqgWlJb2xbpz4
         CildT853rYGBRXdKD+6uv4QRqFiVpDpabM/Zvh5ycxoGApgeP4xFneIeouiWGLOrFn4x
         jO58jM2nWcwl7MiMZ8V7ocHFAimgzniWZ6gXKQMaZx6gdU5meQ+tmIHytJVTe1GFDM5o
         TxkkUng9WkE0GH/zf6qDKkxTxzjP8FLmqhlctqn9sbDoskGdjqI5UG3oWM7y7teswJWu
         wQKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=qrotWN+cXtWLAcrmdshH+J4ZuB1n6OjfFZahw/NIKBg=;
        b=lFgYcBh1/Rmt7zAAzRoiVQ8iLkhsR3+iFndgEsa2uJA6Qn1OzZiOMMCfsOEB2N1OUc
         kbgXG6Y4K8+dRTF8NDuV2uAM5GwVFcXP/HJscQoiE8owhxGgUyvWsbRXV5O+BBA0DDJY
         wakwuMn+PiH7DHduP6e4NLh+aOfQdjegdkFJPTG1tlCXEOzhS7YNfnogPyLJfA+rpFbS
         QuJVvr6m9PCuyczROZ2rp9Vjl8j/svZ6tjK/jhmw6Ys9BN/bGVNA7RtJAL8Jsk6vYGmy
         ejvQ614sV0gxtxYLdTxTTQIuXsZgKucVqK3qU2LmSWi1QcWbA5KobWYvAU2rrbAFNSLL
         FckQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q131si418281ybq.125.2018.02.17.11.29.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 17 Feb 2018 11:29:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50709 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1en8B7-0008VG-E8
	for alex.bennee@linaro.org; Sat, 17 Feb 2018 14:29:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45263)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1en7WW-0003iU-6d
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:47:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1en7WV-0003Ce-7m
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:47:48 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:43752 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1en7WV-0003BC-33; Sat, 17 Feb 2018 13:47:47 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 89E63857A1;
	Sat, 17 Feb 2018 18:47:46 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-21.ams2.redhat.com
	[10.36.116.21])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EAC942024CA2;
	Sat, 17 Feb 2018 18:47:43 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, prem.mallappa@gmail.com,
	alex.williamson@redhat.com
Date: Sat, 17 Feb 2018 19:46:56 +0100
Message-Id: <1518893216-9983-15-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1518893216-9983-1-git-send-email-eric.auger@redhat.com>
References: <1518893216-9983-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Sat, 17 Feb 2018 18:47:46 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Sat, 17 Feb 2018 18:47:46 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v9 14/14] hw/arm/virt: Handle iommu in 2.12
 machine type
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
Cc: mst@redhat.com, jean-philippe.brucker@arm.com, tn@semihalf.com,
	peterx@redhat.com, linuc.decode@gmail.com,
	bharat.bhushan@nxp.com, christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: G75fSH6CMaFX

The new machine type exposes a new "iommu" virt machine option.
The SMMUv3 IOMMU is instantiated using -machine virt,iommu=smmuv3.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---
v7 -> v8:
- Revert to machine option, now dubbed "iommu", preparing for virtio
  instantiation.

v5 -> v6: machine 2_11

Another alternative would be to use the -device option as
done on x86. As the smmu is a sysbus device, we would need to
use the platform bus framework.
---
 hw/arm/virt.c         | 45 +++++++++++++++++++++++++++++++++++++++++++++
 include/hw/arm/virt.h |  1 +
 2 files changed, 46 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index e9dca0d..607c7e1 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1547,6 +1547,34 @@ static void virt_set_gic_version(Object *obj, const char *value, Error **errp)
     }
 }
 
+static char *virt_get_iommu(Object *obj, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+
+    switch (vms->iommu) {
+    case VIRT_IOMMU_NONE:
+        return g_strdup("none");
+    case VIRT_IOMMU_SMMUV3:
+        return g_strdup("smmuv3");
+    default:
+        return g_strdup("none");
+    }
+}
+
+static void virt_set_iommu(Object *obj, const char *value, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+
+    if (!strcmp(value, "smmuv3")) {
+        vms->iommu = VIRT_IOMMU_SMMUV3;
+    } else if (!strcmp(value, "none")) {
+        vms->iommu = VIRT_IOMMU_NONE;
+    } else {
+        error_setg(errp, "Invalid iommu value");
+        error_append_hint(errp, "Valid value are none, smmuv3\n");
+    }
+}
+
 static CpuInstanceProperties
 virt_cpu_index_to_props(MachineState *ms, unsigned cpu_index)
 {
@@ -1679,6 +1707,19 @@ static void virt_2_12_instance_init(Object *obj)
                                         NULL);
     }
 
+    if (vmc->no_iommu) {
+        vms->iommu = VIRT_IOMMU_NONE;
+    } else {
+        /* Default disallows smmu instantiation */
+        vms->iommu = VIRT_IOMMU_NONE;
+        object_property_add_str(obj, "iommu", virt_get_iommu,
+                                 virt_set_iommu, NULL);
+        object_property_set_description(obj, "iommu",
+                                        "Set the IOMMU model among "
+                                        "none, smmuv3 (default none)",
+                                        NULL);
+    }
+
     vms->memmap = a15memmap;
     vms->irqmap = a15irqmap;
 }
@@ -1698,8 +1739,12 @@ static void virt_2_11_instance_init(Object *obj)
 
 static void virt_machine_2_11_options(MachineClass *mc)
 {
+    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
+
     virt_machine_2_12_options(mc);
     SET_MACHINE_COMPAT(mc, VIRT_COMPAT_2_11);
+
+    vmc->no_iommu = true;
 }
 DEFINE_VIRT_MACHINE(2, 11)
 
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 13d3724..3a92fc3 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -92,6 +92,7 @@ typedef struct {
     bool disallow_affinity_adjustment;
     bool no_its;
     bool no_pmu;
+    bool no_iommu;
     bool claim_edge_triggered_timers;
 } VirtMachineClass;
 
-- 
2.5.5


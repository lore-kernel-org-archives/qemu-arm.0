Received: by 10.28.71.27 with SMTP id u27csp2531149wma;
        Mon, 5 Feb 2018 06:02:12 -0800 (PST)
X-Google-Smtp-Source: AH8x224eHV5OAHyeAk1ZLUcBWBfEpoWw/FgdNOC5KtYBhTnD5yPp7tz4B6nb1vahzL98CgA2DoeD
X-Received: by 10.129.71.68 with SMTP id u65mr31515133ywa.192.1517839332347;
        Mon, 05 Feb 2018 06:02:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517839332; cv=none;
        d=google.com; s=arc-20160816;
        b=K8UxJlsTRYilldSxMXYtW7RIdNJK51e777QRGKWsbt7246yy/BQN+U/2Fb9hJodw2N
         RKOYIOi0vJ1vRPqYhXJ1Hs5qbUSdV97fRJjuDTT4HGy/X3FNdJ9C8yYuuOXInRvp35sR
         0EagZcbQ/DfSm/MUYvu7mNAdtU7mMPni38OP6BJRgTfTW8ZCP2+JEV7iqHaWqsibsJtm
         fijSk6hOgS+0pi4CDd6uWUqG4RUWLlF3IsCrr13fMcvISV3bHg916kl6X+HrRW0TqqWD
         +VrfOZSup4ew3/cpteHsnLmQ6ixJJwaorKujo+DC/VykdxMuDU9unToGdPxg01xQU6Ba
         boag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=bdxvyQw0XHt6c3BrA2gKBbsoBmbS5lzYQ7ullsBK5l8=;
        b=gdEX6ulFPju6D0DtGHP0hnDChr7/ubj/9wOLzuKAAFRnY6s+3aKeK541qI5jQ/ZGOR
         dzmrTDRXSmjRk6/7yRGXBt6iZf6tNZoTABjk4LyA8hxI8UdkxdZUnkLaiQT5X92qQlEF
         9Uxd3StENO528uqgAiTqSMKiYhnp56YQToHgQGpz4KtZO7HRwo8pQDOKXGUGeEvrar6w
         YxTmD1q50XvVzDRk5YvJvZkByazz+4MxMGod0kruO2oVCtPTqvSh/6Vf+6PBuWH2fIFf
         3KqezxIOAoI6Aiux/IqVk8d5yI36ZgLq6FcUPhj7uE6y/U6D8bUFEkVebRdtK3OqjNZQ
         vVEw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d190si880451ywf.418.2018.02.05.06.02.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 05 Feb 2018 06:02:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45725 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eihLX-00066o-Nr
	for alex.bennee@linaro.org; Mon, 05 Feb 2018 09:02:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51756)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eih3S-0007La-R7
	for qemu-arm@nongnu.org; Mon, 05 Feb 2018 08:43:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eih3O-0000CB-2U
	for qemu-arm@nongnu.org; Mon, 05 Feb 2018 08:43:30 -0500
Received: from mx1.redhat.com ([209.132.183.28]:53032)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1eih3N-0000Ah-RY; Mon, 05 Feb 2018 08:43:26 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F06F978222;
	Mon,  5 Feb 2018 13:43:24 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-112.ams2.redhat.com
	[10.36.116.112])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 84B1B177C3;
	Mon,  5 Feb 2018 13:43:11 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, prem.mallappa@gmail.com,
	alex.williamson@redhat.com
Date: Mon,  5 Feb 2018 14:39:32 +0100
Message-Id: <1517837972-1904-15-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1517837972-1904-1-git-send-email-eric.auger@redhat.com>
References: <1517837972-1904-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Mon, 05 Feb 2018 13:43:25 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v8 14/14] hw/arm/virt: Handle iommu in 2.12
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
X-TUID: b7vNQY9eIdD6

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
index a760a68..c88640f 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1608,6 +1608,34 @@ static void virt_set_gic_version(Object *obj, const char *value, Error **errp)
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
@@ -1740,6 +1768,19 @@ static void virt_2_12_instance_init(Object *obj)
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
@@ -1759,8 +1800,12 @@ static void virt_2_11_instance_init(Object *obj)
 
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


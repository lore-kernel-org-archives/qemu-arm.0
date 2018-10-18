Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp2396100wrt;
        Thu, 18 Oct 2018 07:47:02 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62s5mlYy7T5xJ5sCHepVWosnVRTrtvG+DgCdf4Y8HU6OHswg3N3/UTnfg3Z7TUyhufXiK8R
X-Received: by 2002:ac8:5314:: with SMTP id t20-v6mr28643948qtn.309.1539874022654;
        Thu, 18 Oct 2018 07:47:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539874022; cv=none;
        d=google.com; s=arc-20160816;
        b=lsqU0fqR/LEwBRNrqqANLbvnOi6TLPGHHVm0NWX65WuxiSBxjr+VIE8Ty43gB2sPQY
         jMjs01pAQfeZUKkOskabqJmCg3Ork2CuEBx+UToLxYaZpZZyER8KLAlvdyB3QMXH3bKx
         iQWOLl7SNyYYevuig9ebmhV49B1p9TO6qjibJAJ3Ggoesyqtd8E+BkGp4sCaY6bIgmta
         hB2xFpUHFaiT/SuS9wvxPzopPp0Ln2NkwZz/Qxj5AK6GYWntAAVUG/tPqBnPAQoM4FII
         hqUeDhRgQo2cHtrIro1G8zqgVTt8lY7QHjALjC+O8rWXHB2RzTutfEK3ofjmpI4pIYSt
         GAPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=MvyPhZNTIN2cDN1Pk7lhfX58Hp/oeOWFV27ayNnZd5c=;
        b=rtTrDAuIbNrV5sGSwrJJ6tX/y6Ucdwu/TCZMb/UxknmVz2u+qpwvGFZUJFB/xPXuyG
         oa63OhWMheB32Xt3EyEdRBiINPRiUbwAXAyU6bqy1gkpzgb5Z3FQol/O5/bJYKZR8GMI
         +3RWD1vcOeV/rmUqkrpMQ01xy1eRPRNiDQDV1hzae8BhizJHymEyNownKkVhFyxxfi+a
         8SGgZ2denYuMMPFGe0hfXGekSWanr5Z0w/Tph0KYj7N1vzme/LrT/uXW8Uf6cQ3Lws/t
         W0cxkw8MpiMb34YZ1KaP0cgjfsohJ7gEhAlK1JL2LcQPZzuWe7yankawk9ZNm9cHZ7Lq
         Rv7g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h1si3758161qvj.53.2018.10.18.07.47.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Oct 2018 07:47:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42771 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gD9Zm-00026j-4I
	for alex.bennee@linaro.org; Thu, 18 Oct 2018 10:47:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36579)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gD9Lh-0006US-Bh
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 10:32:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gD9Lf-0008Dp-FL
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 10:32:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39986)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gD9Lc-00089K-SP; Thu, 18 Oct 2018 10:32:26 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A6AC1308A95E;
	Thu, 18 Oct 2018 14:32:21 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-215.ams2.redhat.com [10.36.116.215])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4B81260150;
	Thu, 18 Oct 2018 14:32:19 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, kwangwoo.lee@sk.com,
	imammedo@redhat.com, david@redhat.com
Date: Thu, 18 Oct 2018 16:30:42 +0200
Message-Id: <20181018143042.29588-17-eric.auger@redhat.com>
In-Reply-To: <20181018143042.29588-1-eric.auger@redhat.com>
References: <20181018143042.29588-1-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Thu, 18 Oct 2018 14:32:21 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v4 16/16] hw/arm/virt: Add nvdimm and
 nvdimm-persistence options
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
Cc: drjones@redhat.com, dgilbert@redhat.com, Suzuki.Poulose@arm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Kbi6/IQecbId

Machine option nvdimm allows to turn NVDIMM support on.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/virt.c | 59 +++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 57 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index d84d5a5841..02fb62595e 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1748,6 +1748,47 @@ static void virt_set_iommu(Object *obj, const char *value, Error **errp)
     }
 }
 
+static bool virt_get_nvdimm(Object *obj, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+
+    return vms->acpi_nvdimm_state.is_enabled;
+}
+
+static void virt_set_nvdimm(Object *obj, bool value, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+
+    vms->acpi_nvdimm_state.is_enabled = value;
+}
+
+static char *virt_get_nvdimm_persistence(Object *obj, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+
+    return g_strdup(vms->acpi_nvdimm_state.persistence_string);
+}
+
+static void virt_set_nvdimm_persistence(Object *obj, const char *value,
+                                        Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+    AcpiNVDIMMState *nvdimm_state = &vms->acpi_nvdimm_state;
+
+    if (strcmp(value, "cpu") == 0)
+        nvdimm_state->persistence = 3;
+    else if (strcmp(value, "mem-ctrl") == 0)
+        nvdimm_state->persistence = 2;
+    else {
+        error_report("-machine nvdimm-persistence=%s: unsupported option",
+                     value);
+        exit(EXIT_FAILURE);
+    }
+
+    g_free(nvdimm_state->persistence_string);
+    nvdimm_state->persistence_string = g_strdup(value);
+}
+
 static CpuInstanceProperties
 virt_cpu_index_to_props(MachineState *ms, unsigned cpu_index)
 {
@@ -1790,13 +1831,14 @@ static void virt_memory_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
                                  Error **errp)
 {
     const bool is_nvdimm = object_dynamic_cast(OBJECT(dev), TYPE_NVDIMM);
+    VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
 
     if (dev->hotplugged) {
         error_setg(errp, "memory hotplug is not supported");
     }
 
-    if (is_nvdimm) {
-        error_setg(errp, "nvdimm is not yet supported");
+    if (is_nvdimm && !vms->acpi_nvdimm_state.is_enabled) {
+        error_setg(errp, "nvdimm is not enabled: missing 'nvdimm' in '-M'");
         return;
     }
 
@@ -2025,6 +2067,19 @@ static void virt_3_2_instance_init(Object *obj)
                                     "Valid values are none and smmuv3",
                                     NULL);
 
+    object_property_add_bool(obj, "nvdimm",
+                             virt_get_nvdimm, virt_set_nvdimm, NULL);
+    object_property_set_description(obj, "nvdimm",
+                                         "Set on/off to enable/disable NVDIMM "
+                                         "instantiation", NULL);
+
+    object_property_add_str(obj, "nvdimm-persistence",
+                            virt_get_nvdimm_persistence,
+                            virt_set_nvdimm_persistence, NULL);
+    object_property_set_description(obj, "nvdimm-persistence",
+                                    "Set NVDIMM persistence"
+                                    "Valid values are cpu and mem-ctrl", NULL);
+
     vms->memmap = a15memmap;
     vms->irqmap = a15irqmap;
 }
-- 
2.17.1


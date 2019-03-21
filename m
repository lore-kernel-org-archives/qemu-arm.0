Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp98551wrx;
        Thu, 21 Mar 2019 03:57:57 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxuAG93TJpwAf5meAkCZhKWjyuewDj28kav7i4BavFCY6IJCyGkCB4JVjBlUy1z9Garlvfq
X-Received: by 2002:a1c:3845:: with SMTP id f66mr2119818wma.41.1553165877207;
        Thu, 21 Mar 2019 03:57:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553165877; cv=none;
        d=google.com; s=arc-20160816;
        b=SJgGtLWQ6b7EEMl7BMZDpRpLbmJmfLD3rsgifUwpAxvSU6NA0k3cEq3QdiZJvC0wVP
         AbgzXhBTFIra1S4bpq8YuZ3MbuQZlUZL7mWh2goymZjFfxTDSvsoTbN4IRIZweS/VLmY
         +Y7rM4ycuepEDGQklk7CyQIyOlR3dOUpzbXH0l9JQdfJgRpW88kpGXV4mYQ1UzTHlsj7
         lpWQfHixm2eqwTFISfcHS5CCFaS6GTlob85cjNyOaJFC17X22gXYFjfNE9V0iWwE1O0M
         MgveCg8IkTaSgKFm2khkn20L9nYXnmdSSMSBVMk+pfxzsMmDNKtwQD1tPXexX6n5YpxC
         CXMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from;
        bh=qsFGORQU4mJrDD2jEpvrVXk44zuv5QGQVutbHG5usa8=;
        b=wjlNSD0gkAEdTQ1qo5NiARu3oTeEchikUa68rK4GgQc9Pd/znwVCnhfgIE8orfZDm9
         HhswXsmYSOPpohzArp8b8QNzV1F4MMR5sQY7ve5XbNSDl+ZaYDjtJypF5y1ucprepTxl
         SE9DUnQoe2X0eOlJGXah3XYuYeLoUKSorP7+EB0vWrl37dFCTxeGdyNaOSh0V3+uLeSt
         gky07+d5RI5ztP+i/vlWOB7/pw+gCn8KNyOZNOdH3zFukXhqJMdtKxqq/qU4Mn1aww2d
         JPSxk3BhQLtAm3NSVn1YXXeCa3c9vNDOhv4WJa0w9C6JRUb/iyaTWGrISI5vpqvJ9EWn
         /T5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h3si3106951wrs.77.2019.03.21.03.57.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 21 Mar 2019 03:57:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:34810 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h6vOW-0001c6-8a
	for alex.bennee@linaro.org; Thu, 21 Mar 2019 06:57:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46974)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h6vHc-0004Og-W9
	for qemu-arm@nongnu.org; Thu, 21 Mar 2019 06:50:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h6vG2-0002hn-NH
	for qemu-arm@nongnu.org; Thu, 21 Mar 2019 06:49:11 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:2252 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h6vG2-0002Tl-2J; Thu, 21 Mar 2019 06:49:10 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id BC46D422EBD4C3B27C3A;
	Thu, 21 Mar 2019 18:49:07 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.202.227.237) by
	DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server
	id 14.3.408.0; Thu, 21 Mar 2019 18:48:59 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
	<imammedo@redhat.com>, <peter.maydell@linaro.org>,
	<shannon.zhaosl@gmail.com>, <sameo@linux.intel.com>,
	<sebastien.boeuf@intel.com>
Date: Thu, 21 Mar 2019 10:47:42 +0000
Message-ID: <20190321104745.28068-8-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20190321104745.28068-1-shameerali.kolothum.thodi@huawei.com>
References: <20190321104745.28068-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.202.227.237]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.191
Subject: [Qemu-arm] [PATCH v3 07/10] hw/arm/virt: Introduce opt-in feature
 "fdt"
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
Cc: linuxarm@huawei.com, xuwei5@hisilicon.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bmKY632XZiwx

This is to disable/enable populating DT nodes in case
any conflict with acpi tables. The default is "off".

This will be used in subsequent patch where cold plug
device-memory support is added for DT boot.

If DT memory node support is added for cold-plugged device
memory, those memory will be visible to Guest kernel via
UEFI GetMemoryMap() and gets treated as early boot memory.
Hence memory becomes non hot-un-unpluggable even if Guest
is booted in ACPI mode.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
 hw/arm/virt.c         | 23 +++++++++++++++++++++++
 include/hw/arm/virt.h |  1 +
 2 files changed, 24 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 13db0e9..b602151 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1717,6 +1717,20 @@ static void virt_set_highmem(Object *obj, bool value, Error **errp)
     vms->highmem = value;
 }
 
+static bool virt_get_fdt(Object *obj, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+
+    return vms->use_fdt;
+}
+
+static void virt_set_fdt(Object *obj, bool value, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+
+    vms->use_fdt = value;
+}
+
 static bool virt_get_its(Object *obj, Error **errp)
 {
     VirtMachineState *vms = VIRT_MACHINE(obj);
@@ -2005,6 +2019,15 @@ static void virt_instance_init(Object *obj)
     object_property_set_description(obj, "gic-version",
                                     "Set GIC version. "
                                     "Valid values are 2, 3 and host", NULL);
+    /* fdt is disabled by default */
+    vms->use_fdt = false;
+    object_property_add_bool(obj, "fdt", virt_get_fdt,
+                             virt_set_fdt, NULL);
+    object_property_set_description(obj, "fdt",
+                                    "Set on/off to enable/disable device tree "
+                                    "nodes in case any conflict with ACPI"
+                                    "(eg: device memory node)",
+                                    NULL);
 
     vms->highmem_ecam = !vmc->no_highmem_ecam;
 
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index c5e4c96..14b2e0a 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -119,6 +119,7 @@ typedef struct {
     bool highmem_ecam;
     bool its;
     bool virt;
+    bool use_fdt;
     int32_t gic_version;
     VirtIOMMUType iommu;
     struct arm_boot_info bootinfo;
-- 
2.7.4



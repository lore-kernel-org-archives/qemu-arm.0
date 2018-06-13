Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp411415wrq;
        Wed, 13 Jun 2018 01:58:57 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIqFaYCfvVa4/OoG+dLv17HBU3/+eU+rzcY5WvPf7CAh1IAxv6ZRJpwoVs14JO2tW04guGo
X-Received: by 2002:a37:8a04:: with SMTP id m4-v6mr3591153qkd.17.1528880337233;
        Wed, 13 Jun 2018 01:58:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528880337; cv=none;
        d=google.com; s=arc-20160816;
        b=q2WB6uX+eaWpR76s7UDet0QmQgaxDdGF9udSrOlwqliKb5Ng3gDtFnchJQUXnprC1I
         zlxrOa2zdE5FYZbGl5Z0yrD2LiR/r9k2qw87PhQbP7bdCQp6KheRUywXf7/bLOKZjmQ/
         +cenN4zraTKtx5TzeNwcSQeu3RlWjvXRxjyTSM1uy10LU/g4oi4tCcFSR5iuzeIXQ1L1
         8U2tBlg1fwjzEDcSNxj2WDp/sNn8kRKmwIb6QyA+2n1Q0F12Kc64jWrvtzXa+4qHGj83
         kKSE8cAimqL1WhXf4qAfaARayuRw4f2IIblpKVqReEcpDFa9laD2ljkjZgckYF39+8aY
         QefQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=TMP4B+wubloBL9nEWySknlbPYuzDuep2GKPKmmN48+Q=;
        b=sa80pc07TLHmvYJxoK7a2q4GuyUBNkVbaL5or963IVqXnFspWJqXSo5CInECN4mg3I
         /b8UENvOxUDPLwl4/g3Ft7nt34PF0TOGtPndHdX8oLl/s43mN7pyn1v2c3KPMjR3MFnP
         qFS+raA+ogv6+3Ak0+eRYcYm9e7LHR7Uc+viPmdIm15MUOvQJVO0TW4sHjehkB9EAESE
         TmUSnv8mx0zDmO97GHxBGdzyESjjIKSybEkX4x7If4tdtvKWOOs0RxLhoPsZYKLnwQJ3
         KOmsi3lIlSJAskIg2TrXJxZv2abLlnO717G8uzTqwX23MGI1xLmy9eL8/sEXJjXWL9ji
         HEjg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w13-v6si1922951qvi.32.2018.06.13.01.58.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Jun 2018 01:58:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60832 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fT1cG-00029N-F3
	for alex.bennee@linaro.org; Wed, 13 Jun 2018 04:58:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56580)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fT1Sx-0002Pr-0d
	for qemu-arm@nongnu.org; Wed, 13 Jun 2018 04:49:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fT1Sv-0003xT-UN
	for qemu-arm@nongnu.org; Wed, 13 Jun 2018 04:49:19 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:38506 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fT1Sv-0003x9-Og; Wed, 13 Jun 2018 04:49:17 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2D53740201D9;
	Wed, 13 Jun 2018 08:49:17 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-69.ams2.redhat.com
	[10.36.116.69])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 58C4C1116703;
	Wed, 13 Jun 2018 08:49:15 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Wed, 13 Jun 2018 10:48:43 +0200
Message-Id: <1528879723-24675-10-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1528879723-24675-1-git-send-email-eric.auger@redhat.com>
References: <1528879723-24675-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Wed, 13 Jun 2018 08:49:17 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Wed, 13 Jun 2018 08:49:17 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH 9/9] hw/arm/virt: Add virt-3.0 machine type
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
Cc: drjones@redhat.com, ard.biesheuvel@linaro.org, marc.zyngier@arm.com,
	christoffer.dall@arm.com, zhaoshenglong@huawei.com, lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cUsbdfi7iA9V

This machine type supports two new features:
- highmem 256MB ECAM (default). This feature is disabled for
  earlier machine types and if highmem is off.
- max_cpus set to 512 vcpus (255 before)

The high 256MB ECAM region is chosen instead of the legacy
16MB one if the machine type allows it, if highmem is set
(LPAE supported by the guest) and (!firmware_loaded || aarch64).
Indeed aarch32 mode FW may not support this high ECAM region.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

PATCH: merge of ECAM and VCPU extension
- Laszlo reviewed the ECAM changes but I dropped his R-b
  due to the squash

RFC -> v1
- check firmware_loaded and aarch64 value
- do all the computation in machvirt_init
---
 hw/arm/virt.c         | 36 ++++++++++++++++++++++++++++++------
 include/hw/arm/virt.h |  1 +
 2 files changed, 31 insertions(+), 6 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 22b9bd1..5ed25b4 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1317,6 +1317,7 @@ static void machvirt_init(MachineState *machine)
     int n, virt_max_cpus;
     MemoryRegion *ram = g_new(MemoryRegion, 1);
     bool firmware_loaded = bios_name || drive_get(IF_PFLASH, 0, 0);
+    bool aarch64 = true;
 
     /* We can probe only here because during property set
      * KVM is not available yet
@@ -1432,6 +1433,8 @@ static void machvirt_init(MachineState *machine)
         numa_cpu_pre_plug(&possible_cpus->cpus[cs->cpu_index], DEVICE(cpuobj),
                           &error_fatal);
 
+        aarch64 &= object_property_get_bool(cpuobj, "aarch64", NULL);
+
         if (!vms->secure) {
             object_property_set_bool(cpuobj, false, "has_el3", NULL);
         }
@@ -1490,6 +1493,8 @@ static void machvirt_init(MachineState *machine)
         create_uart(vms, pic, VIRT_SECURE_UART, secure_sysmem, serial_hd(1));
     }
 
+    vms->highmem_ecam &= vms->highmem && (!firmware_loaded || aarch64);
+
     create_rtc(vms, pic);
 
     create_pcie(vms, pic);
@@ -1700,11 +1705,13 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
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
@@ -1743,7 +1750,7 @@ type_init(machvirt_machine_init);
 #define VIRT_COMPAT_2_12 \
     HW_COMPAT_2_12
 
-static void virt_2_12_instance_init(Object *obj)
+static void virt_3_0_instance_init(Object *obj)
 {
     VirtMachineState *vms = VIRT_MACHINE(obj);
     VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
@@ -1786,6 +1793,8 @@ static void virt_2_12_instance_init(Object *obj)
                                     "Set GIC version. "
                                     "Valid values are 2, 3 and host", NULL);
 
+    vms->highmem_ecam = !vmc->no_highmem_ecam;
+
     if (vmc->no_its) {
         vms->its = false;
     } else {
@@ -1811,11 +1820,26 @@ static void virt_2_12_instance_init(Object *obj)
     vms->irqmap = a15irqmap;
 }
 
+static void virt_machine_3_0_options(MachineClass *mc)
+{
+}
+DEFINE_VIRT_MACHINE_AS_LATEST(3, 0)
+
+static void virt_2_12_instance_init(Object *obj)
+{
+    virt_3_0_instance_init(obj);
+}
+
 static void virt_machine_2_12_options(MachineClass *mc)
 {
+    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
+
+    virt_machine_3_0_options(mc);
     SET_MACHINE_COMPAT(mc, VIRT_COMPAT_2_12);
+    vmc->no_highmem_ecam = true;
+    mc->max_cpus = 255;
 }
-DEFINE_VIRT_MACHINE_AS_LATEST(2, 12)
+DEFINE_VIRT_MACHINE(2, 12)
 
 #define VIRT_COMPAT_2_11 \
     HW_COMPAT_2_11
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 2c18a59..8c74d4c 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -98,6 +98,7 @@ typedef struct {
     bool no_pmu;
     bool claim_edge_triggered_timers;
     bool smbios_old_sys_ver;
+    bool no_highmem_ecam;
 } VirtMachineClass;
 
 typedef struct {
-- 
2.5.5


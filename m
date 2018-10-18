Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp2384800wrt;
        Thu, 18 Oct 2018 07:38:24 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63uy1yYqekU4uajm0ZVK/SV+K66eLmmOkxGnIEze30Q0Y1ngRb4oQjf99qWq14CxifBHAVA
X-Received: by 2002:a37:7282:: with SMTP id n124-v6mr29925702qkc.78.1539873503964;
        Thu, 18 Oct 2018 07:38:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539873503; cv=none;
        d=google.com; s=arc-20160816;
        b=J4MOGtqqEdnZbcOEKV5DLY47IrQ4Ps0obD4UZiY6+c1eszFew+tDydp5H1m3xgTQlA
         +n6XdDjuMY+mvoWtJLFxR5+0V6dDcYNdkx0KROAVW0NS1XmV/DmVk4cw4TkoT4lP52ZW
         sGGW9y4ogYL+TVQKyt3iA4Xs9ldZYfxn7zDhEp9a0FoYJp+D5rWFt1fUMx3uJbnmfiPQ
         b4osJHIz6Y+7duuLCwuJsBMoaWA4KQQKxpaaKpZESOTMUh4buRe8mLTyf9MmlUMlhRdK
         v+AyQrFF/qXbmP8nahmvSLXP65Ad7Do+hPhTHSC40gLk5Zt+lHwkOENu7Z+HKjjd3pOo
         de4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=QhxM4bsboNZKmiXLLuyiV2LUrLQUvJmHm6rcgqWNQgI=;
        b=gAr0OCSwOEsSXa1IhCIxPhTRaMVSxslBFVSnWtsXDsTETqgqD+KqLqN180KLW9Ifcw
         xCowcVOpdwiDz7W3ONKPZbGA1zenKpPCjrk9omy+iIejY/D28FZY+QaL9h2cwq5wfPTX
         vFWpjgK10VWFpAGJVlu0ll53vAAKeurN+i8Rfz05IV6MoSwOXCZ6KSbOnI505cSy1Zel
         YGnJGP8AVz/5ayF44uiZN1tKuCbw9VD83+3iRdrAhq+DUMOy9zbXaF0F+lZBMRD7dWOw
         SwWT03EMac38/5qr0P7KhILsX4XkxcWaoLAY0SHKuuv2HUk3PZj4vRkyu/0QM3Ufpff/
         Hzew==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t12si14287835qvk.221.2018.10.18.07.38.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Oct 2018 07:38:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42719 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gD9RP-0003NJ-DW
	for alex.bennee@linaro.org; Thu, 18 Oct 2018 10:38:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36143)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gD9Kv-0005rj-TX
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 10:31:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gD9Ku-0007Gm-To
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 10:31:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34442)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gD9Ku-0007EF-JK; Thu, 18 Oct 2018 10:31:40 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8325888314;
	Thu, 18 Oct 2018 14:31:39 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-215.ams2.redhat.com [10.36.116.215])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E0E64789A6;
	Thu, 18 Oct 2018 14:31:33 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, kwangwoo.lee@sk.com,
	imammedo@redhat.com, david@redhat.com
Date: Thu, 18 Oct 2018 16:30:33 +0200
Message-Id: <20181018143042.29588-8-eric.auger@redhat.com>
In-Reply-To: <20181018143042.29588-1-eric.auger@redhat.com>
References: <20181018143042.29588-1-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Thu, 18 Oct 2018 14:31:39 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v4 07/16] hw/arm/virt: Implement kvm_type function
 for 3.2 machine
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
X-TUID: 7Sx8KUZTwPKO

This patch computes the requested IPA bits according to
the requested maxram value.

The machine class kvm_type() callback is implemented and
fills the kvm_type[7-0] bits with the computed max IPA shift
(0 default value corresponds to 40b IPA). The kvm_type is
passed to the KVM_CREATE_VM ioctl.

The max IPA address shift is computed assuming the top of the
address space is occuped by device memory starting at 2TB and
of size maxram_size - ramsize.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

The approach to have an IPA range depending on the machine memory
attributes is preferred here against having an IPA range based
on the max capability of the host (which would be simpler). This
latter would sometimes lead to having additional useless translation
levels at stage2 as this may downgrade the guest performance.
---
 hw/arm/virt.c         | 48 ++++++++++++++++++++++++++++++++++++++++++-
 include/hw/arm/virt.h |  1 +
 2 files changed, 48 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index f920ef247b..21718c250e 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -108,8 +108,12 @@
  * of a terabyte of RAM will be doing it on a host with more than a
  * terabyte of physical address space.)
  */
+#define SZ_1G (1024ULL * 1024 * 1024)
 #define RAMLIMIT_GB 255
-#define RAMLIMIT_BYTES (RAMLIMIT_GB * 1024ULL * 1024 * 1024)
+#define RAMLIMIT_BYTES (RAMLIMIT_GB * SZ_1G)
+
+/* device memory starts at 2TB */
+#define DEVICE_MEM_BASE (2048 * SZ_1G)
 
 /* Addresses and sizes of our components.
  * 0..128MB is space for a flash device so we can run bootrom code such as UEFI.
@@ -1748,6 +1752,38 @@ static HotplugHandler *virt_machine_get_hotplug_handler(MachineState *machine,
     return NULL;
 }
 
+/*
+ * for arm64 kvm_type [7-0] encodes the IPA size shift
+ */
+static inline int virt_kvm_type(MachineState *ms, const char *type_str)
+{
+    int max_vm_phys_shift = kvm_arm_get_max_vm_phys_shift(ms);
+    ram_addr_t device_mem_size = ms->maxram_size - ms->ram_size;
+    uint8_t requested_vm_phys_shift;
+
+    if (!device_mem_size) {
+        return 0; /* default 40b IPA */
+    }
+
+    /* we need at least 42b IPA to fit device memory at 2TB*/
+    if (max_vm_phys_shift < 42) {
+        error_report("This host does not support 42b IPA: "
+                     "maxram/slots options not usable");
+        exit(1);
+    }
+
+    requested_vm_phys_shift = 64 - clz64(DEVICE_MEM_BASE + device_mem_size);
+
+    if (requested_vm_phys_shift > max_vm_phys_shift) {
+        error_report("maxmem option value too large. Max supported value "
+                     "for this host is 0x%"PRIx64,
+                     (ram_addr_t)((1ULL << max_vm_phys_shift) - DEVICE_MEM_BASE));
+       exit(1);
+    }
+
+    return requested_vm_phys_shift;
+}
+
 static void virt_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -1772,6 +1808,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     mc->cpu_index_to_instance_props = virt_cpu_index_to_props;
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a15");
     mc->get_default_cpu_node_id = virt_get_default_cpu_node_id;
+    mc->kvm_type = virt_kvm_type;
     assert(!mc->get_hotplug_handler);
     mc->get_hotplug_handler = virt_machine_get_hotplug_handler;
     hc->plug = virt_machine_device_plug_cb;
@@ -1878,7 +1915,16 @@ static void virt_3_1_instance_init(Object *obj)
 
 static void virt_machine_3_1_options(MachineClass *mc)
 {
+    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
+
     virt_machine_3_2_options(mc);
+
+    /*
+     * Device memory and capability to set the max IPA address shift
+     * are enabled from 3.2 onwards
+     */
+    vmc->no_device_memory = true;
+    mc->kvm_type = NULL;
 }
 DEFINE_VIRT_MACHINE(3, 1)
 
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 4cc57a7ef6..f57e4c1890 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -101,6 +101,7 @@ typedef struct {
     bool claim_edge_triggered_timers;
     bool smbios_old_sys_ver;
     bool no_highmem_ecam;
+    bool no_device_memory;
 } VirtMachineClass;
 
 typedef struct {
-- 
2.17.1


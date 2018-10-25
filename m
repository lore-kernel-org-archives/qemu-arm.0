Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp747828wro;
        Thu, 25 Oct 2018 07:05:37 -0700 (PDT)
X-Google-Smtp-Source: AJdET5emGgPB4rooLs2JJJyRqzk9WTAQlTH6g3dMC1WDWOLcsUppYXJXLBORDKKJIQQVvN0xSIR4
X-Received: by 2002:ac8:29d3:: with SMTP id 19-v6mr1617683qtt.174.1540476337561;
        Thu, 25 Oct 2018 07:05:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540476337; cv=none;
        d=google.com; s=arc-20160816;
        b=Uf5iYnj4kO8AA9HvEHKiK7QThp52F+kMIEvUh2umfJ0lE/VFQKbXDUxLOHfr6DM6Ln
         s0GG2gr8iKQ+GxSo6drro3EN/7xac0487EVAGv+RGnuAwOaRqiknnby+2rkC1q+xcukp
         4uq5WekvzeP+0QguE9xyhEqS2s5wfdXbWoHiOaOHj1fJSh8ZhVY4auOM3LM0XQT+owYo
         IiYvWEBemHrKnD1gQKb5wORvdv3z+gtvFenmhbOj4g0VANlSgLQTP4zjug2TLIt6HAjZ
         A/MKAHCgOmL0QLj77jpf0P4Zbc1ScwzmAy6/0Xi6k0RLOR1hIHuG0Dm1gmNhq1LDroF4
         hZwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=meQQPMmhuPGN3puA9i8OWwVZ2w63yFb0ydmy4qwDgEY=;
        b=bf+3IxDlUW7my6oRwYnLKxCLXykkRY8s/+DPWZIg/Se+TA+ypn+mFJBH4Fzzbq97i5
         CBca3ZsBqJDSL5j2dS7BO5LR6j5TI8zYpdCXXMPf117ds99TW3N6FgjyFEzMIuAqAsei
         K3kO9IzThEWlmb9hcsh6uqDKA8/a8FmlE+0sRYeSsH0K03PtGA6xp3W6SEb+D+/m4Oqq
         3qX57KHrguoQ6lHx6IdM3b9hlkZnleTUc2QrxaaXJBPx3Srj5J1/MP1q5HsQ3oXfs5Nm
         8P5F7mFzT/Mj61fkXZyzfYgqdVHRrYNHqeS23Ag95GK2oZDELpbFEAq3iZqwYfzw1L5L
         6byQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k14si2840879qvp.85.2018.10.25.07.05.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 25 Oct 2018 07:05:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54708 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gFgGX-0006WA-3o
	for alex.bennee@linaro.org; Thu, 25 Oct 2018 10:05:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58627)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gFfor-0003zr-Ek
	for qemu-arm@nongnu.org; Thu, 25 Oct 2018 09:37:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gFfoo-0000xj-7B
	for qemu-arm@nongnu.org; Thu, 25 Oct 2018 09:37:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48108)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gFfon-0000xD-QM; Thu, 25 Oct 2018 09:36:58 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2D9C93084044;
	Thu, 25 Oct 2018 13:36:56 +0000 (UTC)
Received: from localhost (unknown [10.33.36.149])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8462E4F7D;
	Thu, 25 Oct 2018 13:36:33 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Thu, 25 Oct 2018 10:32:43 -0300
Message-Id: <20181025133301.16578-26-ehabkost@redhat.com>
In-Reply-To: <20181025133301.16578-1-ehabkost@redhat.com>
References: <20181025133301.16578-1-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Thu, 25 Oct 2018 13:36:56 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL v2 25/43] memory-device: add and use
 memory_device_get_region_size()
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, libvir-list@redhat.com,
	Jason Wang <jasowang@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Markus Armbruster <armbru@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Eric Blake <eblake@redhat.com>, Rob Herring <robh@kernel.org>,
	David Hildenbrand <david@redhat.com>, Alexander Graf <agraf@suse.de>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Richard Henderson <rth@twiddle.net>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oydAlZ7XLkaS

From: David Hildenbrand <david@redhat.com>

We will factor out get_memory_region() from pc-dimm to memory device code
soon. Once that is done, get_region_size() can be implemented
generically and essentially be replaced by
memory_device_get_region_size (and work only on get_memory_region()).

We have some users of get_memory_region() (spapr and pc-dimm code) that are
only interested in the size. So let's rework them to use
memory_device_get_region_size() first, then we can factor out
get_memory_region() and eventually remove get_region_size() without
touching the same code multiple times.

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20181005092024.14344-10-david@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 include/hw/mem/memory-device.h |  2 ++
 hw/mem/memory-device.c         | 13 ++++++++++---
 hw/mem/pc-dimm.c               | 10 ++++------
 hw/ppc/spapr.c                 | 21 +++++++--------------
 4 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/include/hw/mem/memory-device.h b/include/hw/mem/memory-device.h
index 0474a3dd11..898df3057d 100644
--- a/include/hw/mem/memory-device.h
+++ b/include/hw/mem/memory-device.h
@@ -83,5 +83,7 @@ uint64_t memory_device_get_free_addr(MachineState *ms, const uint64_t *hint,
 void memory_device_plug_region(MachineState *ms, MemoryRegion *mr,
                                uint64_t addr);
 void memory_device_unplug_region(MachineState *ms, MemoryRegion *mr);
+uint64_t memory_device_get_region_size(const MemoryDeviceState *md,
+                                       Error **errp);
 
 #endif
diff --git a/hw/mem/memory-device.c b/hw/mem/memory-device.c
index c1e1b81cf2..425830c65c 100644
--- a/hw/mem/memory-device.c
+++ b/hw/mem/memory-device.c
@@ -57,10 +57,9 @@ static int memory_device_used_region_size(Object *obj, void *opaque)
     if (object_dynamic_cast(obj, TYPE_MEMORY_DEVICE)) {
         const DeviceState *dev = DEVICE(obj);
         const MemoryDeviceState *md = MEMORY_DEVICE(obj);
-        const MemoryDeviceClass *mdc = MEMORY_DEVICE_GET_CLASS(obj);
 
         if (dev->realized) {
-            *size += mdc->get_region_size(md, &error_abort);
+            *size += memory_device_get_region_size(md, &error_abort);
         }
     }
 
@@ -167,7 +166,7 @@ uint64_t memory_device_get_free_addr(MachineState *ms, const uint64_t *hint,
         uint64_t md_size, md_addr;
 
         md_addr = mdc->get_addr(md);
-        md_size = mdc->get_region_size(md, &error_abort);
+        md_size = memory_device_get_region_size(md, &error_abort);
 
         if (ranges_overlap(md_addr, md_size, new_addr, size)) {
             if (hint) {
@@ -266,6 +265,14 @@ void memory_device_unplug_region(MachineState *ms, MemoryRegion *mr)
     memory_region_del_subregion(&ms->device_memory->mr, mr);
 }
 
+uint64_t memory_device_get_region_size(const MemoryDeviceState *md,
+                                       Error **errp)
+{
+    MemoryDeviceClass *mdc = MEMORY_DEVICE_GET_CLASS(md);
+
+    return mdc->get_region_size(md, errp);
+}
+
 static const TypeInfo memory_device_info = {
     .name          = TYPE_MEMORY_DEVICE,
     .parent        = TYPE_INTERFACE,
diff --git a/hw/mem/pc-dimm.c b/hw/mem/pc-dimm.c
index 130f78d0de..3e43ec8742 100644
--- a/hw/mem/pc-dimm.c
+++ b/hw/mem/pc-dimm.c
@@ -161,16 +161,14 @@ static Property pc_dimm_properties[] = {
 static void pc_dimm_get_size(Object *obj, Visitor *v, const char *name,
                              void *opaque, Error **errp)
 {
+    Error *local_err = NULL;
     uint64_t value;
-    MemoryRegion *mr;
-    PCDIMMDevice *dimm = PC_DIMM(obj);
-    PCDIMMDeviceClass *ddc = PC_DIMM_GET_CLASS(obj);
 
-    mr = ddc->get_memory_region(dimm, errp);
-    if (!mr) {
+    value = memory_device_get_region_size(MEMORY_DEVICE(obj), &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
         return;
     }
-    value = memory_region_size(mr);
 
     visit_type_uint64(v, name, &value, errp);
 }
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index c078347b66..c08130facb 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -3128,12 +3128,10 @@ static void spapr_memory_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
     Error *local_err = NULL;
     sPAPRMachineState *ms = SPAPR_MACHINE(hotplug_dev);
     PCDIMMDevice *dimm = PC_DIMM(dev);
-    PCDIMMDeviceClass *ddc = PC_DIMM_GET_CLASS(dimm);
-    MemoryRegion *mr = ddc->get_memory_region(dimm, &error_abort);
     uint64_t size, addr;
     uint32_t node;
 
-    size = memory_region_size(mr);
+    size = memory_device_get_region_size(MEMORY_DEVICE(dev), &error_abort);
 
     pc_dimm_plug(dimm, MACHINE(ms), &local_err);
     if (local_err) {
@@ -3169,9 +3167,7 @@ static void spapr_memory_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
     const sPAPRMachineClass *smc = SPAPR_MACHINE_GET_CLASS(hotplug_dev);
     sPAPRMachineState *spapr = SPAPR_MACHINE(hotplug_dev);
     PCDIMMDevice *dimm = PC_DIMM(dev);
-    PCDIMMDeviceClass *ddc = PC_DIMM_GET_CLASS(dimm);
     Error *local_err = NULL;
-    MemoryRegion *mr;
     uint64_t size;
     Object *memdev;
     hwaddr pagesize;
@@ -3181,11 +3177,11 @@ static void spapr_memory_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
         return;
     }
 
-    mr = ddc->get_memory_region(dimm, errp);
-    if (!mr) {
+    size = memory_device_get_region_size(MEMORY_DEVICE(dimm), &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
         return;
     }
-    size = memory_region_size(mr);
 
     if (size % SPAPR_MEMORY_BLOCK_SIZE) {
         error_setg(errp, "Hotplugged memory size must be a multiple of "
@@ -3257,9 +3253,8 @@ static sPAPRDIMMState *spapr_recover_pending_dimm_state(sPAPRMachineState *ms,
                                                         PCDIMMDevice *dimm)
 {
     sPAPRDRConnector *drc;
-    PCDIMMDeviceClass *ddc = PC_DIMM_GET_CLASS(dimm);
-    MemoryRegion *mr = ddc->get_memory_region(dimm, &error_abort);
-    uint64_t size = memory_region_size(mr);
+    uint64_t size = memory_device_get_region_size(MEMORY_DEVICE(dimm),
+                                                  &error_abort);
     uint32_t nr_lmbs = size / SPAPR_MEMORY_BLOCK_SIZE;
     uint32_t avail_lmbs = 0;
     uint64_t addr_start, addr;
@@ -3325,14 +3320,12 @@ static void spapr_memory_unplug_request(HotplugHandler *hotplug_dev,
     sPAPRMachineState *spapr = SPAPR_MACHINE(hotplug_dev);
     Error *local_err = NULL;
     PCDIMMDevice *dimm = PC_DIMM(dev);
-    PCDIMMDeviceClass *ddc = PC_DIMM_GET_CLASS(dimm);
-    MemoryRegion *mr = ddc->get_memory_region(dimm, &error_abort);
     uint32_t nr_lmbs;
     uint64_t size, addr_start, addr;
     int i;
     sPAPRDRConnector *drc;
 
-    size = memory_region_size(mr);
+    size = memory_device_get_region_size(MEMORY_DEVICE(dimm), &error_abort);
     nr_lmbs = size / SPAPR_MEMORY_BLOCK_SIZE;
 
     addr_start = object_property_get_uint(OBJECT(dimm), PC_DIMM_ADDR_PROP,
-- 
2.18.0.rc1.1.g3f1ff2140


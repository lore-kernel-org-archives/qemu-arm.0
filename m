Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp723142wro;
        Thu, 25 Oct 2018 06:44:16 -0700 (PDT)
X-Google-Smtp-Source: AJdET5f0yfkBUArAmuNZEOFPGQqurjMChliWYO4s3rFp5YJUHtRn3kBPDATg6uEjEH9ID/MpiBe5
X-Received: by 2002:ac8:2bb9:: with SMTP id m54-v6mr1566488qtm.36.1540475056538;
        Thu, 25 Oct 2018 06:44:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540475056; cv=none;
        d=google.com; s=arc-20160816;
        b=bRcNBBqJZYVyzXJ43qPVVdvD+/zMd6LFSV0L+au2+BBugWnD0804zB7xPKIkTw/LFM
         CJsElI1b7Alk5sUwt9WvU/BF06DInDvSGTiTt6SFqid3SzsvrbIhLksd3qillp7Fti3y
         HOFr2UO8kyI7RqpmrMdN7PMuBlvMFjFrp8mCUjrh5pG4BgfrS/sAhsAYltwF4/OIjM58
         mHI3sPDmB3zQ1y5u1MLaWIgB+vXBYaa6QzO7TCz6EWLB3f25MWuDd8M1Qtase17eA2PL
         TMsAhrP8zWUAY3DUgbAcyWSimxC9n2PfY//MHyV0EdM7RY0OTEGiKFHFcI9AWe4oPap3
         KHsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=v72pDRrrrDOumq20mOs0QK/DW0Aojlxbb60/ZIstJsg=;
        b=aQw40BffmNz00XysfI9FWb5mClXT1kd1HVWccjdnUxvEn2ylUtUe4hov985E1KVoLm
         KDU6/QQNKa9hmCHJvUNC7g6td3TFAZ3bECD+IZtH89CbqzEpvJr8wVSfIE6N7j6FCV/J
         bbAcim88lpLKdmzsi7OJ6FSg4Q0vxH2CIQHgBzCyBEOBFpQwGUGCFOV2VpLTchRUwPhm
         RDkwqvnBafFUy3FnqeWN7rsbGwM9MxOOid0ICqLuBagUqV3/KEl03aCU7B6QxO4411C1
         kY7FTyUFZxODild4cN24cggd01ChYb7Q/Kkgwd6UOnP9/pv/MoBbtn5M1KkDnMYaQIr0
         3uDA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n2-v6si6575359qti.351.2018.10.25.06.44.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 25 Oct 2018 06:44:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54543 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gFfvr-0002Dy-Kt
	for alex.bennee@linaro.org; Thu, 25 Oct 2018 09:44:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57864)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gFfnc-0002wr-Jx
	for qemu-arm@nongnu.org; Thu, 25 Oct 2018 09:35:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gFfnZ-0008To-TI
	for qemu-arm@nongnu.org; Thu, 25 Oct 2018 09:35:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43924)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gFfnZ-0008Se-Kj; Thu, 25 Oct 2018 09:35:41 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 63CE540100;
	Thu, 25 Oct 2018 13:35:40 +0000 (UTC)
Received: from localhost (unknown [10.33.36.149])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5682866D21;
	Thu, 25 Oct 2018 13:35:31 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Thu, 25 Oct 2018 10:32:38 -0300
Message-Id: <20181025133301.16578-21-ehabkost@redhat.com>
In-Reply-To: <20181025133301.16578-1-ehabkost@redhat.com>
References: <20181025133301.16578-1-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Thu, 25 Oct 2018 13:35:40 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL v2 20/43] pc-dimm: pass PCDIMMDevice to
 pc_dimm_.*plug
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
X-TUID: N4qEnHripR0S

From: David Hildenbrand <david@redhat.com>

We're plugging/unplugging a PCDIMMDevice, so directly pass this type
instead of a more generic DeviceState.

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Acked-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20181005092024.14344-5-david@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 include/hw/mem/pc-dimm.h |  6 +++---
 hw/i386/pc.c             |  6 +++---
 hw/mem/pc-dimm.c         | 24 +++++++++++-------------
 hw/ppc/spapr.c           |  8 ++++----
 4 files changed, 21 insertions(+), 23 deletions(-)

diff --git a/include/hw/mem/pc-dimm.h b/include/hw/mem/pc-dimm.h
index b382eb4303..99cbd54de7 100644
--- a/include/hw/mem/pc-dimm.h
+++ b/include/hw/mem/pc-dimm.h
@@ -79,8 +79,8 @@ typedef struct PCDIMMDeviceClass {
                                                Error **errp);
 } PCDIMMDeviceClass;
 
-void pc_dimm_pre_plug(DeviceState *dev, MachineState *machine,
+void pc_dimm_pre_plug(PCDIMMDevice *dimm, MachineState *machine,
                       const uint64_t *legacy_align, Error **errp);
-void pc_dimm_plug(DeviceState *dev, MachineState *machine, Error **errp);
-void pc_dimm_unplug(DeviceState *dev, MachineState *machine);
+void pc_dimm_plug(PCDIMMDevice *dimm, MachineState *machine, Error **errp);
+void pc_dimm_unplug(PCDIMMDevice *dimm, MachineState *machine);
 #endif
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index eab8572f2a..f095725dba 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1704,7 +1704,7 @@ static void pc_memory_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
         return;
     }
 
-    pc_dimm_pre_plug(dev, MACHINE(hotplug_dev),
+    pc_dimm_pre_plug(PC_DIMM(dev), MACHINE(hotplug_dev),
                      pcmc->enforce_aligned_dimm ? NULL : &legacy_align, errp);
 }
 
@@ -1716,7 +1716,7 @@ static void pc_memory_plug(HotplugHandler *hotplug_dev,
     PCMachineState *pcms = PC_MACHINE(hotplug_dev);
     bool is_nvdimm = object_dynamic_cast(OBJECT(dev), TYPE_NVDIMM);
 
-    pc_dimm_plug(dev, MACHINE(pcms), &local_err);
+    pc_dimm_plug(PC_DIMM(dev), MACHINE(pcms), &local_err);
     if (local_err) {
         goto out;
     }
@@ -1776,7 +1776,7 @@ static void pc_memory_unplug(HotplugHandler *hotplug_dev,
         goto out;
     }
 
-    pc_dimm_unplug(dev, MACHINE(pcms));
+    pc_dimm_unplug(PC_DIMM(dev), MACHINE(pcms));
     object_unparent(OBJECT(dev));
 
  out:
diff --git a/hw/mem/pc-dimm.c b/hw/mem/pc-dimm.c
index fb6bcaedc4..f46fb7ada2 100644
--- a/hw/mem/pc-dimm.c
+++ b/hw/mem/pc-dimm.c
@@ -29,24 +29,24 @@
 
 static int pc_dimm_get_free_slot(const int *hint, int max_slots, Error **errp);
 
-void pc_dimm_pre_plug(DeviceState *dev, MachineState *machine,
+void pc_dimm_pre_plug(PCDIMMDevice *dimm, MachineState *machine,
                       const uint64_t *legacy_align, Error **errp)
 {
-    PCDIMMDevice *dimm = PC_DIMM(dev);
     PCDIMMDeviceClass *ddc = PC_DIMM_GET_CLASS(dimm);
     Error *local_err = NULL;
     MemoryRegion *mr;
     uint64_t addr, align;
     int slot;
 
-    slot = object_property_get_int(OBJECT(dev), PC_DIMM_SLOT_PROP,
+    slot = object_property_get_int(OBJECT(dimm), PC_DIMM_SLOT_PROP,
                                    &error_abort);
     slot = pc_dimm_get_free_slot(slot == PC_DIMM_UNASSIGNED_SLOT ? NULL : &slot,
                                  machine->ram_slots, &local_err);
     if (local_err) {
         goto out;
     }
-    object_property_set_int(OBJECT(dev), slot, PC_DIMM_SLOT_PROP, &error_abort);
+    object_property_set_int(OBJECT(dimm), slot, PC_DIMM_SLOT_PROP,
+                            &error_abort);
     trace_mhp_pc_dimm_assigned_slot(slot);
 
     mr = ddc->get_memory_region(dimm, &local_err);
@@ -55,7 +55,7 @@ void pc_dimm_pre_plug(DeviceState *dev, MachineState *machine,
     }
 
     align = legacy_align ? *legacy_align : memory_region_get_alignment(mr);
-    addr = object_property_get_uint(OBJECT(dev), PC_DIMM_ADDR_PROP,
+    addr = object_property_get_uint(OBJECT(dimm), PC_DIMM_ADDR_PROP,
                                     &error_abort);
     addr = memory_device_get_free_addr(machine, !addr ? NULL : &addr, align,
                                        memory_region_size(mr), &local_err);
@@ -63,38 +63,36 @@ void pc_dimm_pre_plug(DeviceState *dev, MachineState *machine,
         goto out;
     }
     trace_mhp_pc_dimm_assigned_address(addr);
-    object_property_set_uint(OBJECT(dev), addr, PC_DIMM_ADDR_PROP,
+    object_property_set_uint(OBJECT(dimm), addr, PC_DIMM_ADDR_PROP,
                              &error_abort);
 out:
     error_propagate(errp, local_err);
 }
 
-void pc_dimm_plug(DeviceState *dev, MachineState *machine, Error **errp)
+void pc_dimm_plug(PCDIMMDevice *dimm, MachineState *machine, Error **errp)
 {
-    PCDIMMDevice *dimm = PC_DIMM(dev);
     PCDIMMDeviceClass *ddc = PC_DIMM_GET_CLASS(dimm);
     MemoryRegion *vmstate_mr = ddc->get_vmstate_memory_region(dimm,
                                                               &error_abort);
     MemoryRegion *mr = ddc->get_memory_region(dimm, &error_abort);
     uint64_t addr;
 
-    addr = object_property_get_uint(OBJECT(dev), PC_DIMM_ADDR_PROP,
+    addr = object_property_get_uint(OBJECT(dimm), PC_DIMM_ADDR_PROP,
                                     &error_abort);
 
     memory_device_plug_region(machine, mr, addr);
-    vmstate_register_ram(vmstate_mr, dev);
+    vmstate_register_ram(vmstate_mr, DEVICE(dimm));
 }
 
-void pc_dimm_unplug(DeviceState *dev, MachineState *machine)
+void pc_dimm_unplug(PCDIMMDevice *dimm, MachineState *machine)
 {
-    PCDIMMDevice *dimm = PC_DIMM(dev);
     PCDIMMDeviceClass *ddc = PC_DIMM_GET_CLASS(dimm);
     MemoryRegion *vmstate_mr = ddc->get_vmstate_memory_region(dimm,
                                                               &error_abort);
     MemoryRegion *mr = ddc->get_memory_region(dimm, &error_abort);
 
     memory_device_unplug_region(machine, mr);
-    vmstate_unregister_ram(vmstate_mr, dev);
+    vmstate_unregister_ram(vmstate_mr, DEVICE(dimm));
 }
 
 static int pc_dimm_slot2bitmap(Object *obj, void *opaque)
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 98868d893a..c078347b66 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -3135,7 +3135,7 @@ static void spapr_memory_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
 
     size = memory_region_size(mr);
 
-    pc_dimm_plug(dev, MACHINE(ms), &local_err);
+    pc_dimm_plug(dimm, MACHINE(ms), &local_err);
     if (local_err) {
         goto out;
     }
@@ -3158,7 +3158,7 @@ static void spapr_memory_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
     return;
 
 out_unplug:
-    pc_dimm_unplug(dev, MACHINE(ms));
+    pc_dimm_unplug(dimm, MACHINE(ms));
 out:
     error_propagate(errp, local_err);
 }
@@ -3202,7 +3202,7 @@ static void spapr_memory_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
         return;
     }
 
-    pc_dimm_pre_plug(dev, MACHINE(hotplug_dev), NULL, errp);
+    pc_dimm_pre_plug(dimm, MACHINE(hotplug_dev), NULL, errp);
 }
 
 struct sPAPRDIMMState {
@@ -3314,7 +3314,7 @@ static void spapr_memory_unplug(HotplugHandler *hotplug_dev, DeviceState *dev)
     sPAPRMachineState *spapr = SPAPR_MACHINE(hotplug_dev);
     sPAPRDIMMState *ds = spapr_pending_dimm_unplugs_find(spapr, PC_DIMM(dev));
 
-    pc_dimm_unplug(dev, MACHINE(hotplug_dev));
+    pc_dimm_unplug(PC_DIMM(dev), MACHINE(hotplug_dev));
     object_unparent(OBJECT(dev));
     spapr_pending_dimm_unplugs_remove(spapr, ds);
 }
-- 
2.18.0.rc1.1.g3f1ff2140


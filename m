Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp2819091wrt;
        Thu, 18 Oct 2018 13:20:19 -0700 (PDT)
X-Google-Smtp-Source: ACcGV605Qzv8eSrizQMTOMytbfLN9uPHsxf/JaFXhdB9e2EVUWZrjKhioZMDGEUCJQRNx/Z91Thn
X-Received: by 2002:aed:223c:: with SMTP id n57-v6mr30369489qtc.302.1539894019560;
        Thu, 18 Oct 2018 13:20:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539894019; cv=none;
        d=google.com; s=arc-20160816;
        b=SEoUX4i5Gg4p2mI52Z/3gXlbwNJsE7snV1c4qC+DH3XdMDsKaCZRt5vCcRMQXCaiPP
         xbxtM7OSoZBLaJc6MlCi873T6JbfSuCHTnLlhAf00TTbpHZtH+idb0UlCSe7olN2jY1M
         uROaIBcY85da2xa96p97Mz95kBrSl2dIAs/47Dmw1bclDeSirfaLW9PfbCjZH9dPgRfg
         1bgVnJXkW0yu/Uxi2NXiYqdUTeJc902z32i9L5v5vnAd71Motuu+GAjv9rhW10W89WAw
         jL4ctKsjTgZuc+xAuc5nnR/4v6VEHHB4A94KcBBoZP7GmCCV49f16VkRycxyGKPXKMN8
         fGow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=rsoYF991XpF2UZreqvm0yR7T/JkE1AQPxj2c3Y+Ov9E=;
        b=kYkTTnPZCN4f7LZRhkeBADIW4QeGJu+7Wm7MkvMemfxxw1UvInE0ZFmEwsLMtREcyR
         7DWtrn5k+Rjxi4g33wB75k/cLVrtJA4UwXnnUBMg3KFho3NT+ViZGF9kw0NGCgoLbV5n
         WF8oEaP7uBkZBEtyfT3G9/cM8Lfqp9aG+m09Hr+5kx25HgdcG0vgCr5n9uJxlqVNTplJ
         QJFs7gchH8bQH0mV7XWrE0MoFMvwFhnuTX0WcdswXT29n/LRvGm+nR8jghPbN3jDqQjZ
         3MLXTn1/XyO1txVw3A/Fuo1Mxb71yRxFiiswCQWO+/a+diVBi0XXwGlNNvv5BGeJ/9md
         T0iw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l54-v6si587610qtc.78.2018.10.18.13.20.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Oct 2018 13:20:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44356 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gDEmI-00045y-ML
	for alex.bennee@linaro.org; Thu, 18 Oct 2018 16:20:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39630)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gDEZh-00014m-Io
	for qemu-devel@nongnu.org; Thu, 18 Oct 2018 16:07:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gDEZf-00027U-FX
	for qemu-devel@nongnu.org; Thu, 18 Oct 2018 16:07:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60364)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gDEZY-00025F-KQ; Thu, 18 Oct 2018 16:07:09 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A6A6530F5591;
	Thu, 18 Oct 2018 20:07:07 +0000 (UTC)
Received: from localhost (ovpn-117-52.phx2.redhat.com [10.3.117.52])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F20DD60C54;
	Thu, 18 Oct 2018 20:06:57 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Thu, 18 Oct 2018 17:03:58 -0300
Message-Id: <20181018200422.4358-22-ehabkost@redhat.com>
In-Reply-To: <20181018200422.4358-1-ehabkost@redhat.com>
References: <20181018200422.4358-1-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Thu, 18 Oct 2018 20:07:07 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 21/45] pc-dimm: pass PCDIMMDevice to
 pc_dimm_.*plug
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, libvir-list@redhat.com,
	Jason Wang <jasowang@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Markus Armbruster <armbru@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Rob Herring <robh@kernel.org>, David Hildenbrand <david@redhat.com>,
	Alexander Graf <agraf@suse.de>, Richard Henderson <rth@twiddle.net>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nQn2kOd1KE9U

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
index cd5029c149..19ace9dadd 100644
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


Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp746547wro;
        Thu, 25 Oct 2018 07:04:41 -0700 (PDT)
X-Google-Smtp-Source: AJdET5cjJYQjL1J1SLQ4XsBleR+SYnZLIa3Ja/uLRpasBj5/2GUxmzvGhw7PkbPJYtgdpEnJp12x
X-Received: by 2002:a37:6b83:: with SMTP id g125-v6mr1570989qkc.89.1540476281024;
        Thu, 25 Oct 2018 07:04:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540476281; cv=none;
        d=google.com; s=arc-20160816;
        b=nd2CwjaTSZOuqAGV5WHs3NJewvaXiKkqQUZvRQqyOuBVmDy28xfUVGQuiNB7xHMhrT
         GLVqFfCP0Qu6Z3KzA8jZhHYvj2t6kFUy2g2KzxaBX6CGB08wL92HAC7TNQBUVv4UVOvg
         zvYD8Bk7F2dmA1wJbjF7O/sn7VkdoBiVhhNO47l1Y03OD78GjkWDp7J/3nLR/3Rg6XpG
         INg296PvvRjWG2KPHZAqRDg4UwMhk6ZMxF2TKvDLciJ71iq90fa6VED6Ajm2UDc490gt
         oftA3tbeYAG1aCboun+ah1MA613DSgmi0G6ibnDM6BqM3F2wvpSNDdxpudoDcqV1pTwr
         vMzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=XxyO69vxBaiCoY6569Zm7J1W9O+h61moTj02lWNYNWo=;
        b=vRmaqtoUsekrLEXypuGdkz7AMBzgqa1y/Y8Fs6GRDbzZrT2VOGDB8elTRwO2Umf2LO
         QxIvOAmF0ibU7O/D+v99SSzFfOc4gF72npMv7ZGGmKV+n3t1fmw57cWlcNDnWbnaTnfb
         LH8gCDGw6d4eaS6IypBSO5AKP/WjqvGp0I6n1wsOl8gG67vku/pORvLB8EOZ6nwLoRNU
         MLEKAnxuXrB987uXPaSaQ8udKn+rSaF1YJq3QVzjKemWcNOb1prve+r7v2VVqRcgXb+M
         gagi8u/oIbMlR0KVAAdcAxIj1wbl/Re8tWAkXA2KR0AJlvKWrggwahxzE/nHgovtipE7
         6NLw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z40-v6si6611972qtb.1.2018.10.25.07.04.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 25 Oct 2018 07:04:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54690 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gFgFc-0005cg-EU
	for alex.bennee@linaro.org; Thu, 25 Oct 2018 10:04:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59250)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gFfqa-0006SR-CR
	for qemu-arm@nongnu.org; Thu, 25 Oct 2018 09:38:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gFfqZ-00023l-7f
	for qemu-arm@nongnu.org; Thu, 25 Oct 2018 09:38:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60198)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gFfqY-00020y-TM; Thu, 25 Oct 2018 09:38:47 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 02342307D96C;
	Thu, 25 Oct 2018 13:38:46 +0000 (UTC)
Received: from localhost (unknown [10.33.36.149])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1C8FD105705F;
	Thu, 25 Oct 2018 13:38:44 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Thu, 25 Oct 2018 10:32:47 -0300
Message-Id: <20181025133301.16578-30-ehabkost@redhat.com>
In-Reply-To: <20181025133301.16578-1-ehabkost@redhat.com>
References: <20181025133301.16578-1-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Thu, 25 Oct 2018 13:38:46 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL v2 29/43] memory-device: complete factoring out
 pre_plug handling
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
X-TUID: qAll2p7bGXFp

From: David Hildenbrand <david@redhat.com>

With all required memory device class functions in place, we can factor
out pre_plug handling of memory devices. Take proper care of errors. We
still have to carry along legacy_align required for pc compatibility
handling.

We will factor out tracing of the address separately in a follow-up
patch.

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20181005092024.14344-14-david@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 include/hw/mem/memory-device.h |  5 ++---
 hw/mem/memory-device.c         | 32 +++++++++++++++++++++++++++++---
 hw/mem/pc-dimm.c               | 15 +++------------
 3 files changed, 34 insertions(+), 18 deletions(-)

diff --git a/include/hw/mem/memory-device.h b/include/hw/mem/memory-device.h
index ed7cf5bf4b..d92acd2425 100644
--- a/include/hw/mem/memory-device.h
+++ b/include/hw/mem/memory-device.h
@@ -99,9 +99,8 @@ typedef struct MemoryDeviceClass {
 
 MemoryDeviceInfoList *qmp_memory_device_list(void);
 uint64_t get_plugged_memory_size(void);
-uint64_t memory_device_get_free_addr(MachineState *ms, const uint64_t *hint,
-                                     uint64_t align, uint64_t size,
-                                     Error **errp);
+void memory_device_pre_plug(MemoryDeviceState *md, MachineState *ms,
+                            const uint64_t *legacy_align, Error **errp);
 void memory_device_plug_region(MachineState *ms, MemoryRegion *mr,
                                uint64_t addr);
 void memory_device_unplug_region(MachineState *ms, MemoryRegion *mr);
diff --git a/hw/mem/memory-device.c b/hw/mem/memory-device.c
index 07749bab69..aa4ddd5918 100644
--- a/hw/mem/memory-device.c
+++ b/hw/mem/memory-device.c
@@ -93,9 +93,10 @@ static void memory_device_check_addable(MachineState *ms, uint64_t size,
 
 }
 
-uint64_t memory_device_get_free_addr(MachineState *ms, const uint64_t *hint,
-                                     uint64_t align, uint64_t size,
-                                     Error **errp)
+static uint64_t memory_device_get_free_addr(MachineState *ms,
+                                            const uint64_t *hint,
+                                            uint64_t align, uint64_t size,
+                                            Error **errp)
 {
     uint64_t address_space_start, address_space_end;
     GSList *list = NULL, *item;
@@ -247,6 +248,31 @@ uint64_t get_plugged_memory_size(void)
     return size;
 }
 
+void memory_device_pre_plug(MemoryDeviceState *md, MachineState *ms,
+                            const uint64_t *legacy_align, Error **errp)
+{
+    const MemoryDeviceClass *mdc = MEMORY_DEVICE_GET_CLASS(md);
+    Error *local_err = NULL;
+    uint64_t addr, align;
+    MemoryRegion *mr;
+
+    mr = mdc->get_memory_region(md, &local_err);
+    if (local_err) {
+        goto out;
+    }
+
+    align = legacy_align ? *legacy_align : memory_region_get_alignment(mr);
+    addr = mdc->get_addr(md);
+    addr = memory_device_get_free_addr(ms, !addr ? NULL : &addr, align,
+                                       memory_region_size(mr), &local_err);
+    if (local_err) {
+        goto out;
+    }
+    mdc->set_addr(md, addr, &local_err);
+out:
+    error_propagate(errp, local_err);
+}
+
 void memory_device_plug_region(MachineState *ms, MemoryRegion *mr,
                                uint64_t addr)
 {
diff --git a/hw/mem/pc-dimm.c b/hw/mem/pc-dimm.c
index 4a15091734..b2959bcf0e 100644
--- a/hw/mem/pc-dimm.c
+++ b/hw/mem/pc-dimm.c
@@ -32,10 +32,8 @@ static int pc_dimm_get_free_slot(const int *hint, int max_slots, Error **errp);
 void pc_dimm_pre_plug(PCDIMMDevice *dimm, MachineState *machine,
                       const uint64_t *legacy_align, Error **errp)
 {
-    MemoryDeviceClass *mdc = MEMORY_DEVICE_GET_CLASS(dimm);
     Error *local_err = NULL;
-    MemoryRegion *mr;
-    uint64_t addr, align;
+    uint64_t addr;
     int slot;
 
     slot = object_property_get_int(OBJECT(dimm), PC_DIMM_SLOT_PROP,
@@ -49,22 +47,15 @@ void pc_dimm_pre_plug(PCDIMMDevice *dimm, MachineState *machine,
                             &error_abort);
     trace_mhp_pc_dimm_assigned_slot(slot);
 
-    mr = mdc->get_memory_region(MEMORY_DEVICE(dimm), &local_err);
+    memory_device_pre_plug(MEMORY_DEVICE(dimm), machine, legacy_align,
+                           &local_err);
     if (local_err) {
         goto out;
     }
 
-    align = legacy_align ? *legacy_align : memory_region_get_alignment(mr);
     addr = object_property_get_uint(OBJECT(dimm), PC_DIMM_ADDR_PROP,
                                     &error_abort);
-    addr = memory_device_get_free_addr(machine, !addr ? NULL : &addr, align,
-                                       memory_region_size(mr), &local_err);
-    if (local_err) {
-        goto out;
-    }
     trace_mhp_pc_dimm_assigned_address(addr);
-    object_property_set_uint(OBJECT(dimm), addr, PC_DIMM_ADDR_PROP,
-                             &error_abort);
 out:
     error_propagate(errp, local_err);
 }
-- 
2.18.0.rc1.1.g3f1ff2140


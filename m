Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp2831088wrt;
        Thu, 18 Oct 2018 13:31:37 -0700 (PDT)
X-Google-Smtp-Source: ACcGV639NGmUMLUf98TPIRb3LlAJZfFxARTihHxF0PvohWpQlC0QBbNkljnVc3x1Khi0UGoE2ep2
X-Received: by 2002:ac8:38c6:: with SMTP id g6-v6mr29932559qtc.55.1539894697000;
        Thu, 18 Oct 2018 13:31:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539894696; cv=none;
        d=google.com; s=arc-20160816;
        b=ewhEGW70zuH3/vLPmReVIuAn48YCL4laLEglc8UbUaUVjYn7VhDj5A9SaqO8Z7HLjd
         xCnJ17SsXma5dxDdAEPaUgMyShpHhZBM5TN7eSxU9mBG2IvvlNqn+lEErajW48NttwGx
         fhRV4KhZCEhZs84Bok+DsY3OmmN4iEKhd5pcQO2aSv6vydME7QtWd9uJ3RRzw6PTG4Ar
         TZ5ZsqZAly+gXgzr4fJMjR938+DAza9KtT6bWVxp9H6PXc2EnmEDRY/gY5EEVKTrgbAD
         t8LdENvFfBb9Je3VqEIcXuDgcKqirBDrM5Rztt/F/XCkbpejMnt/nQVCP4IDdJ58Q//M
         n5xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=C2mKGmS3/Ilu560yPlua6goBJ/EgNmbkqeF0DKBe4SY=;
        b=uZ9CnJL4ZyjkhKTTyKzq93x92gZ+43rgDQzvC5tr+OZj71LskIzHZL+yR7cFGrZt01
         dbLZofg81EbBUWjIk9oWmBVNhGFIMeuabo5BxVRxqXThS8xxjAWb6CjRtzHSEOGsrOvj
         ULS7osiTpJLUVF5aBh/sgpWidZ8i0QsZ+8glV+/nU+CV75LtOMagxFjiaXNMKOohsO/T
         LPBLffvP0kQrqBplJmcv5CKdRrJA+VtfzimkP5TNaDJ/kgJGh1GCI9VW2rmEwmJDJo+C
         tk5cmh5WbvA3l+zc8Fcz7NZMw2j5Qj5kbO8q7Fd3XHEwhGnJ3sh0Hj26gvj7GO+Ukk2q
         Nw2A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u49-v6si2162839qth.262.2018.10.18.13.31.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Oct 2018 13:31:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44452 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gDExE-0005f1-E8
	for alex.bennee@linaro.org; Thu, 18 Oct 2018 16:31:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40551)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gDEbQ-0003Ay-1s
	for qemu-devel@nongnu.org; Thu, 18 Oct 2018 16:09:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gDEbP-0003QF-1g
	for qemu-devel@nongnu.org; Thu, 18 Oct 2018 16:09:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38890)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gDEbI-00036T-Ci; Thu, 18 Oct 2018 16:08:56 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A01CF3001A52;
	Thu, 18 Oct 2018 20:08:54 +0000 (UTC)
Received: from localhost (ovpn-117-52.phx2.redhat.com [10.3.117.52])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9E03A790A5;
	Thu, 18 Oct 2018 20:08:48 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Thu, 18 Oct 2018 17:04:10 -0300
Message-Id: <20181018200422.4358-34-ehabkost@redhat.com>
In-Reply-To: <20181018200422.4358-1-ehabkost@redhat.com>
References: <20181018200422.4358-1-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Thu, 18 Oct 2018 20:08:54 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 33/45] memory-device: trace when
 pre_plugging/plugging/unplugging
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
X-TUID: 4cuEmu1/9cn5

From: David Hildenbrand <david@redhat.com>

Let's trace the address and the id of a memory device when
pre_plugging/plugging/unplugging succeeded.

Trace it when pre_plugging as well as when plugging, so we really know
when a specific address is actually used.

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20181005092024.14344-17-david@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/mem/memory-device.c | 8 ++++++++
 hw/mem/pc-dimm.c       | 8 --------
 hw/mem/trace-events    | 5 ++++-
 3 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/hw/mem/memory-device.c b/hw/mem/memory-device.c
index 30585d6148..7de1ccd497 100644
--- a/hw/mem/memory-device.c
+++ b/hw/mem/memory-device.c
@@ -17,6 +17,7 @@
 #include "qemu/range.h"
 #include "hw/virtio/vhost.h"
 #include "sysemu/kvm.h"
+#include "trace.h"
 
 static gint memory_device_addr_sort(gconstpointer a, gconstpointer b)
 {
@@ -269,6 +270,10 @@ void memory_device_pre_plug(MemoryDeviceState *md, MachineState *ms,
         goto out;
     }
     mdc->set_addr(md, addr, &local_err);
+    if (!local_err) {
+        trace_memory_device_pre_plug(DEVICE(md)->id ? DEVICE(md)->id : "",
+                                     addr);
+    }
 out:
     error_propagate(errp, local_err);
 }
@@ -288,6 +293,7 @@ void memory_device_plug(MemoryDeviceState *md, MachineState *ms)
 
     memory_region_add_subregion(&ms->device_memory->mr,
                                 addr - ms->device_memory->base, mr);
+    trace_memory_device_plug(DEVICE(md)->id ? DEVICE(md)->id : "", addr);
 }
 
 void memory_device_unplug(MemoryDeviceState *md, MachineState *ms)
@@ -303,6 +309,8 @@ void memory_device_unplug(MemoryDeviceState *md, MachineState *ms)
     g_assert(ms->device_memory);
 
     memory_region_del_subregion(&ms->device_memory->mr, mr);
+    trace_memory_device_unplug(DEVICE(md)->id ? DEVICE(md)->id : "",
+                               mdc->get_addr(md));
 }
 
 uint64_t memory_device_get_region_size(const MemoryDeviceState *md,
diff --git a/hw/mem/pc-dimm.c b/hw/mem/pc-dimm.c
index 6c854139a7..0c9b9e8292 100644
--- a/hw/mem/pc-dimm.c
+++ b/hw/mem/pc-dimm.c
@@ -33,7 +33,6 @@ void pc_dimm_pre_plug(PCDIMMDevice *dimm, MachineState *machine,
                       const uint64_t *legacy_align, Error **errp)
 {
     Error *local_err = NULL;
-    uint64_t addr;
     int slot;
 
     slot = object_property_get_int(OBJECT(dimm), PC_DIMM_SLOT_PROP,
@@ -49,13 +48,6 @@ void pc_dimm_pre_plug(PCDIMMDevice *dimm, MachineState *machine,
 
     memory_device_pre_plug(MEMORY_DEVICE(dimm), machine, legacy_align,
                            &local_err);
-    if (local_err) {
-        goto out;
-    }
-
-    addr = object_property_get_uint(OBJECT(dimm), PC_DIMM_ADDR_PROP,
-                                    &error_abort);
-    trace_mhp_pc_dimm_assigned_address(addr);
 out:
     error_propagate(errp, local_err);
 }
diff --git a/hw/mem/trace-events b/hw/mem/trace-events
index e150dcc497..0f2f278ff2 100644
--- a/hw/mem/trace-events
+++ b/hw/mem/trace-events
@@ -2,4 +2,7 @@
 
 # hw/mem/pc-dimm.c
 mhp_pc_dimm_assigned_slot(int slot) "%d"
-mhp_pc_dimm_assigned_address(uint64_t addr) "0x%"PRIx64
+# hw/mem/memory-device.c
+memory_device_pre_plug(const char *id, uint64_t addr) "id=%s addr=0x%"PRIx64
+memory_device_plug(const char *id, uint64_t addr) "id=%s addr=0x%"PRIx64
+memory_device_unplug(const char *id, uint64_t addr) "id=%s addr=0x%"PRIx64
-- 
2.18.0.rc1.1.g3f1ff2140


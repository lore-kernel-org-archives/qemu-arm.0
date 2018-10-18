Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp2827598wrt;
        Thu, 18 Oct 2018 13:28:11 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60x49vAEgh7F3L+l0CHVXP6BT/u7VqqKkGyHARaAtOHR/odOE8Se1ip6bTH8hk7jCBaecM5
X-Received: by 2002:aed:33c6:: with SMTP id v64-v6mr11850649qtd.203.1539894491894;
        Thu, 18 Oct 2018 13:28:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539894491; cv=none;
        d=google.com; s=arc-20160816;
        b=aq4jb2lsvEK7QNxf3tn1o8vy0TZYIbPNuDpIMibqppqR+ratDxBsJNa3u5FEIWNG39
         VaRsY/zhrUtCf0nN/UBL4pPb+2oB1d6IsWGITGeF+rEATWEjLJmnMcHwZhbsHOiQaHXw
         1iXn5DSL0pwedFoioXhd1hVN3GI2Vdu5rfZLT9gCska5hdqpjFZnkhVZQrS+1Q40tZBJ
         yNwZs2ZUuTCfoB7JhFR7bjonxJYW02ZJ7ihrbKAGLWDih17KzPhL7AFmZlh2LwnIhvRd
         lRlLnq5metUw9p6x6lM801mGY90fZ11SH2OtVUlWCwNVzYmvG5HoTMBjoxFyMalonVXW
         ybNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=XxyO69vxBaiCoY6569Zm7J1W9O+h61moTj02lWNYNWo=;
        b=VQ7Y74LdJDfpobh7bMKvlrSYV9oWgDRRUCd0+0pjYBWgIMzFGRI4I9fEM6vArxWp1T
         Y7RXNBfXZMwXl8Ie1LBr4fjXUjfocvcGB2NAjPHZo/+wasOH/NJj2P/8cYDOqtAi0TKp
         8XZqM1BGUmf7yz/VPNdRCsAAcGZI2kyNNONnGsOJ3b6OAvvfErf0f2a19ipEXWhNiiMN
         n9Tt/o/ZYlbOLEr3PL6+ucsEIIwDy5NpImHIGCGJ5IJ9TBk2eYQ5ibgEPMXgJ9yVu6oc
         b1HIR0fdtXygShQz4mDkhB4VbjsVpgPRvL71TVHPQwDdquv9u9QiIJzvazvRcKt1Jo5D
         bAvA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u190-v6si1141748qkf.174.2018.10.18.13.28.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Oct 2018 13:28:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44431 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gDEtv-0003Ga-AY
	for alex.bennee@linaro.org; Thu, 18 Oct 2018 16:28:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40269)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gDEb7-0002iF-ID
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 16:08:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gDEb0-0002w1-Qr
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 16:08:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34940)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gDEb0-0002lK-GB; Thu, 18 Oct 2018 16:08:38 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9D1193001FCD;
	Thu, 18 Oct 2018 20:08:28 +0000 (UTC)
Received: from localhost (ovpn-117-52.phx2.redhat.com [10.3.117.52])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E31371974F;
	Thu, 18 Oct 2018 20:08:21 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Thu, 18 Oct 2018 17:04:07 -0300
Message-Id: <20181018200422.4358-31-ehabkost@redhat.com>
In-Reply-To: <20181018200422.4358-1-ehabkost@redhat.com>
References: <20181018200422.4358-1-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Thu, 18 Oct 2018 20:08:28 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL 30/45] memory-device: complete factoring out
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
X-TUID: O5lRsnrDOqCQ

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


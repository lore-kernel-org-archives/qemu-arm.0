Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp2824988wrt;
        Thu, 18 Oct 2018 13:25:42 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61tDvbT9FRSfdGRsoUDsaISE2fByrSkkInyZII2+yfuC6h6Mj40DlKOVQVSlgo7WJ61gTbl
X-Received: by 2002:a0c:f98b:: with SMTP id t11mr29024022qvn.146.1539894342232;
        Thu, 18 Oct 2018 13:25:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539894342; cv=none;
        d=google.com; s=arc-20160816;
        b=n2511sNkSMPABr2flglCTb8uo6ljSTT5Tbyky7Yvdq0MoTWw3kecGjodNw2lOn/L/I
         pkhysCEwOQcbHMi7KOQwfasf4+K0KxGB3tAzi7an4zOJm2keredrB3VNtIi/QmJg2cWg
         RJ2aPYyVlC5IKlPCHNnW2gQH1WxfF8JrdicQPRbnTh9cQo/bvRMcPzzl/W9IvHZezz66
         jVYxonxRkB9HQvtWS7pu8dMd6sUF8kx0Gipq7B14edtM/wWnLA+drFxsOqjYe/ehojZs
         CkPGI/rzEttwlW9nz8Mrfai3xwuy188wsIYyBDeq8mv2BEQugIiOOvOG/SvqnFP+2Il7
         TF3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=K64FIhhrRZit267lHrR/KK9/uAIABrzCsl34dvpSoDI=;
        b=yAkT46IK7KsfJBmHFgWog+IGWvg1FzYrCUaEBzcta3MJmx1mvHaACDN69fUxlpA09X
         VfE/V8vwNLRTWj8JJ7M6DBPCYrWqP4Y5Y0Rj+sPIsE0wfApCsWkIb5oR0E4t9gjt3c/c
         weYdfKsUMRXPgMmFXK79I6dnZLRWL578qhy5PArepv7PKDetHb6ov+xH02+9YuIA4RJ3
         QEbglfc8vwdqD6biwaYXK37mMVciWxDiNF9BUvswJs5zsUqe9Dz7i13fa4iWyg93BkOu
         N3tO+7rimPGMcGXUycW/zYN+1j9wAOClAjtjOlx3d/ypmxcmFAYGueIpG7bAO7E9WKKO
         uxNg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x69-v6si2643709qkx.12.2018.10.18.13.25.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Oct 2018 13:25:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44409 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gDErV-00012d-Jt
	for alex.bennee@linaro.org; Thu, 18 Oct 2018 16:25:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39832)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gDEa9-0001YS-Iw
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 16:07:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gDEa8-0002Iy-P2
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 16:07:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37716)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gDEa8-0002Il-G0; Thu, 18 Oct 2018 16:07:44 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 87F8330014D0;
	Thu, 18 Oct 2018 20:07:43 +0000 (UTC)
Received: from localhost (ovpn-117-52.phx2.redhat.com [10.3.117.52])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 548B519940;
	Thu, 18 Oct 2018 20:07:36 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Thu, 18 Oct 2018 17:04:01 -0300
Message-Id: <20181018200422.4358-25-ehabkost@redhat.com>
In-Reply-To: <20181018200422.4358-1-ehabkost@redhat.com>
References: <20181018200422.4358-1-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Thu, 18 Oct 2018 20:07:43 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL 24/45] memory-device: forward errors in
 get_region_size()/get_plugged_size()
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
X-TUID: FxJBfnBx1K1w

From: David Hildenbrand <david@redhat.com>

Let's properly forward the errors, so errors from get_region_size() /
get_plugged_size() can be handled.

Users right now call both functions after the device has been realized,
which is will never fail, so it is fine to continue using error_abort.

While at it, remove a leftover error check (suggested by Igor).

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20181005092024.14344-8-david@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 include/hw/mem/memory-device.h | 4 ++--
 hw/mem/memory-device.c         | 9 +++------
 hw/mem/pc-dimm.c               | 5 +++--
 3 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/include/hw/mem/memory-device.h b/include/hw/mem/memory-device.h
index 2853b084b5..f02b229837 100644
--- a/include/hw/mem/memory-device.h
+++ b/include/hw/mem/memory-device.h
@@ -33,8 +33,8 @@ typedef struct MemoryDeviceClass {
     InterfaceClass parent_class;
 
     uint64_t (*get_addr)(const MemoryDeviceState *md);
-    uint64_t (*get_plugged_size)(const MemoryDeviceState *md);
-    uint64_t (*get_region_size)(const MemoryDeviceState *md);
+    uint64_t (*get_plugged_size)(const MemoryDeviceState *md, Error **errp);
+    uint64_t (*get_region_size)(const MemoryDeviceState *md, Error **errp);
     void (*fill_device_info)(const MemoryDeviceState *md,
                              MemoryDeviceInfo *info);
 } MemoryDeviceClass;
diff --git a/hw/mem/memory-device.c b/hw/mem/memory-device.c
index 87369ef2e1..c1e1b81cf2 100644
--- a/hw/mem/memory-device.c
+++ b/hw/mem/memory-device.c
@@ -60,7 +60,7 @@ static int memory_device_used_region_size(Object *obj, void *opaque)
         const MemoryDeviceClass *mdc = MEMORY_DEVICE_GET_CLASS(obj);
 
         if (dev->realized) {
-            *size += mdc->get_region_size(md);
+            *size += mdc->get_region_size(md, &error_abort);
         }
     }
 
@@ -167,10 +167,7 @@ uint64_t memory_device_get_free_addr(MachineState *ms, const uint64_t *hint,
         uint64_t md_size, md_addr;
 
         md_addr = mdc->get_addr(md);
-        md_size = mdc->get_region_size(md);
-        if (*errp) {
-            goto out;
-        }
+        md_size = mdc->get_region_size(md, &error_abort);
 
         if (ranges_overlap(md_addr, md_size, new_addr, size)) {
             if (hint) {
@@ -234,7 +231,7 @@ static int memory_device_plugged_size(Object *obj, void *opaque)
         const MemoryDeviceClass *mdc = MEMORY_DEVICE_GET_CLASS(obj);
 
         if (dev->realized) {
-            *size += mdc->get_plugged_size(md);
+            *size += mdc->get_plugged_size(md, &error_abort);
         }
     }
 
diff --git a/hw/mem/pc-dimm.c b/hw/mem/pc-dimm.c
index f46fb7ada2..130f78d0de 100644
--- a/hw/mem/pc-dimm.c
+++ b/hw/mem/pc-dimm.c
@@ -234,14 +234,15 @@ static uint64_t pc_dimm_md_get_addr(const MemoryDeviceState *md)
     return dimm->addr;
 }
 
-static uint64_t pc_dimm_md_get_region_size(const MemoryDeviceState *md)
+static uint64_t pc_dimm_md_get_region_size(const MemoryDeviceState *md,
+                                           Error **errp)
 {
     /* dropping const here is fine as we don't touch the memory region */
     PCDIMMDevice *dimm = PC_DIMM(md);
     const PCDIMMDeviceClass *ddc = PC_DIMM_GET_CLASS(md);
     MemoryRegion *mr;
 
-    mr = ddc->get_memory_region(dimm, &error_abort);
+    mr = ddc->get_memory_region(dimm, errp);
     if (!mr) {
         return 0;
     }
-- 
2.18.0.rc1.1.g3f1ff2140


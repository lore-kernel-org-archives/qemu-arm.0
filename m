Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp2827321wrt;
        Thu, 18 Oct 2018 13:27:55 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61Q6Y1f2Ba4qzQE8H00mxfGKOIAF91Xzyqd9SpWfFUvkiEvVTmeOdZrjDVG9Ip+CI2+6Mh0
X-Received: by 2002:aed:3a29:: with SMTP id n38-v6mr29787054qte.111.1539894475828;
        Thu, 18 Oct 2018 13:27:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539894475; cv=none;
        d=google.com; s=arc-20160816;
        b=PvQSOo8mcjYhlNJbJpA09p7B/3LmqmNmrS+kkZic4aH5kXNGGsvFUtyAnPtTKPH0zo
         NotNOmOLWqgaXjHAKOx9rooBeRyKMPHGJkRAoXNdgt3Oi4cU4n6WxmBE6Pbu1+hRKZ3g
         UdFrBL3b7vDXve9lEuQjgPgLY4SlVxbj0crQhk8S5SRsrYAOV116PdFMGwD6wh3T4I6+
         BnGS6LUe8pFxtkYLJd0dLCbsJ0Icx/TucCaLIL64n9bB3Hq0w0ficu8px8TuuCoyAWcO
         TCmgB7Q8/wWL+hAjTnjtTNQtHikLfxrb7i9QihZ87K+1s1fkeGJsgks34Beb2kiRuUHK
         94EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=G86OesGV3L6VtGljcJ92RrSIeVbROBVD+rDLq0bBtvA=;
        b=xG+tYYDKWZ6M5WNjwcDMfeyfk2gadCHws32PoZgagaSFGcUHGS2nIs7oyj8Df0A25y
         Vcd+Qt0cROqdgWW6lzn4U5H8OGh36KYKit5r33wqsd5WhZSG4o+O47YcAFH3Hod0574a
         vJFiaTrxHElKT/kHVs8dhsiv8imDTC5pDRkPXFEzjur+j2SL+neA7ZseEUwuuq1Dp1Zz
         OXyrUum8ZffFVX1KvFbboXiOx5xBo3qvMiVtl4A9HVY6iNgJAcnRofpqvYK2SydENaYY
         g0Cmg9eNZTNy2IsSPkhI6eo2+HocB56JT0hNFOEb3fjC6jueX2WHPihaQF9hgqfR7D0z
         nAhg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t19-v6si4874820qtt.278.2018.10.18.13.27.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Oct 2018 13:27:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44429 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gDEtf-0002zb-9X
	for alex.bennee@linaro.org; Thu, 18 Oct 2018 16:27:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40268)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gDEb7-0002iE-IB
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 16:08:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gDEb0-0002w6-Qu
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 16:08:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58170)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gDEb0-0002ve-Gr; Thu, 18 Oct 2018 16:08:38 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1F7E8C057F9F;
	Thu, 18 Oct 2018 20:08:37 +0000 (UTC)
Received: from localhost (ovpn-117-52.phx2.redhat.com [10.3.117.52])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 68ED060BE1;
	Thu, 18 Oct 2018 20:08:30 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Thu, 18 Oct 2018 17:04:08 -0300
Message-Id: <20181018200422.4358-32-ehabkost@redhat.com>
In-Reply-To: <20181018200422.4358-1-ehabkost@redhat.com>
References: <20181018200422.4358-1-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Thu, 18 Oct 2018 20:08:37 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL 31/45] memory-device: complete factoring out plug
 handling
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
X-TUID: vWwfkok9xCIT

From: David Hildenbrand <david@redhat.com>

With the new memory device functions in place, we can factor out
plugging of memory devices completely.

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20181005092024.14344-15-david@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 include/hw/mem/memory-device.h |  3 +--
 hw/mem/memory-device.c         | 13 ++++++++++---
 hw/mem/pc-dimm.c               |  9 +--------
 3 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/include/hw/mem/memory-device.h b/include/hw/mem/memory-device.h
index d92acd2425..53d89dac89 100644
--- a/include/hw/mem/memory-device.h
+++ b/include/hw/mem/memory-device.h
@@ -101,8 +101,7 @@ MemoryDeviceInfoList *qmp_memory_device_list(void);
 uint64_t get_plugged_memory_size(void);
 void memory_device_pre_plug(MemoryDeviceState *md, MachineState *ms,
                             const uint64_t *legacy_align, Error **errp);
-void memory_device_plug_region(MachineState *ms, MemoryRegion *mr,
-                               uint64_t addr);
+void memory_device_plug(MemoryDeviceState *md, MachineState *ms);
 void memory_device_unplug_region(MachineState *ms, MemoryRegion *mr);
 uint64_t memory_device_get_region_size(const MemoryDeviceState *md,
                                        Error **errp);
diff --git a/hw/mem/memory-device.c b/hw/mem/memory-device.c
index aa4ddd5918..6569896b7e 100644
--- a/hw/mem/memory-device.c
+++ b/hw/mem/memory-device.c
@@ -273,10 +273,17 @@ out:
     error_propagate(errp, local_err);
 }
 
-void memory_device_plug_region(MachineState *ms, MemoryRegion *mr,
-                               uint64_t addr)
+void memory_device_plug(MemoryDeviceState *md, MachineState *ms)
 {
-    /* we expect a previous call to memory_device_get_free_addr() */
+    const MemoryDeviceClass *mdc = MEMORY_DEVICE_GET_CLASS(md);
+    const uint64_t addr = mdc->get_addr(md);
+    MemoryRegion *mr;
+
+    /*
+     * We expect that a previous call to memory_device_pre_plug() succeeded, so
+     * it can't fail at this point.
+     */
+    mr = mdc->get_memory_region(md, &error_abort);
     g_assert(ms->device_memory);
 
     memory_region_add_subregion(&ms->device_memory->mr,
diff --git a/hw/mem/pc-dimm.c b/hw/mem/pc-dimm.c
index b2959bcf0e..647841bcd4 100644
--- a/hw/mem/pc-dimm.c
+++ b/hw/mem/pc-dimm.c
@@ -63,17 +63,10 @@ out:
 void pc_dimm_plug(PCDIMMDevice *dimm, MachineState *machine, Error **errp)
 {
     PCDIMMDeviceClass *ddc = PC_DIMM_GET_CLASS(dimm);
-    MemoryDeviceClass *mdc = MEMORY_DEVICE_GET_CLASS(dimm);
     MemoryRegion *vmstate_mr = ddc->get_vmstate_memory_region(dimm,
                                                               &error_abort);
-    MemoryRegion *mr = mdc->get_memory_region(MEMORY_DEVICE(dimm),
-                                              &error_abort);
-    uint64_t addr;
-
-    addr = object_property_get_uint(OBJECT(dimm), PC_DIMM_ADDR_PROP,
-                                    &error_abort);
 
-    memory_device_plug_region(machine, mr, addr);
+    memory_device_plug(MEMORY_DEVICE(dimm), machine);
     vmstate_register_ram(vmstate_mr, DEVICE(dimm));
 }
 
-- 
2.18.0.rc1.1.g3f1ff2140


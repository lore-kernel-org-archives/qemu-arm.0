Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp2835705wrt;
        Thu, 18 Oct 2018 13:35:58 -0700 (PDT)
X-Google-Smtp-Source: AJdET5cPgo3a1wJPRf+iVHF4dGz1rGQyuADhtxbg+y8WEEYlYDkO5rZWAs9MkG4bm96ZDhg5H74s
X-Received: by 2002:a0c:eac5:: with SMTP id y5mr2457407qvp.241.1539894958795;
        Thu, 18 Oct 2018 13:35:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539894958; cv=none;
        d=google.com; s=arc-20160816;
        b=p6dM3DI0u9JK8TXRTV3ewGcCI9JDP6rPC9ZE/4WpsLGyg1OyBPmCfg2zIKkJK7Pjet
         4kMH/z1w6m2GwSVbCewN6db8iOwyPWQq4SHJlmUDpZ8zToopPKaBnXVqz599squ5qSyO
         DvGy5qpuUQon7Ov1kylOVnMg6+TQTarMYFRaEyC5H97Dx373sZH2xksezwJ/i8/TWQeZ
         sWES/WU7vWZ8uSpuXUveyJoaKaNOa7B7Yii5neZGjrvwgA6FZkWrIKRPn/Nbd5GV7j0i
         Y8g7ledLPeJyuE5XtGExu+6uwWLUOibqmBIINapqytS2J+elZLtJ5zoTnHbkIWt6FNX3
         9NGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=gaWBWt6JOwKv15gSZp7hXenCml5iypYO3jctCuqVBHM=;
        b=KItdjt6i99FQaCNI5afjFBMuIsksLO9A64nwNxFSEgfR+AHKGIV4IDTEEYUiFkduLp
         4hztupS2OLh2hFaNcEksQ2pqLoZnwgIkzf+XhHZm8BUQ3ESZZaMwrgQP0goQah8IrSQY
         onaa9CjIlW9aRtRuebQ++U0rG3K4dHayIQIbHNG7k2xN31729jDAPa+6EOjBbq16Kkm2
         k9ei8OmCFe2RM1jay5pLjFIRHdWY4AlU+Rx8dtYrLJ7Vw1nDYvtCNaRLUt/GVHWskX1m
         e8CIDh4wxNKLi/m67iDcxEiBweK7GKhcpwxhTOKopEZjeM2JKoObkOW5ZQe0WG2BpH1H
         +X+A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q4-v6si2232592qke.192.2018.10.18.13.35.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Oct 2018 13:35:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44488 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gDF1S-0001cW-7g
	for alex.bennee@linaro.org; Thu, 18 Oct 2018 16:35:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40173)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gDEb1-0002Yd-1p
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 16:08:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gDEat-0002qA-Uh
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 16:08:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36964)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gDEaj-0002fv-QC; Thu, 18 Oct 2018 16:08:24 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 02D903002A63;
	Thu, 18 Oct 2018 20:08:18 +0000 (UTC)
Received: from localhost (ovpn-117-52.phx2.redhat.com [10.3.117.52])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1A98C68B3E;
	Thu, 18 Oct 2018 20:08:09 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Thu, 18 Oct 2018 17:04:05 -0300
Message-Id: <20181018200422.4358-29-ehabkost@redhat.com>
In-Reply-To: <20181018200422.4358-1-ehabkost@redhat.com>
References: <20181018200422.4358-1-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Thu, 18 Oct 2018 20:08:18 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL 28/45] memory-device: drop get_region_size()
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
X-TUID: nGjIfFOZuxFW

From: David Hildenbrand <david@redhat.com>

There are no remaining users of get_region_size() except
memory_device_get_region_size() itself. We can make
memory_device_get_region_size() work directly on get_memory_region()
instead and drop get_region_size().

In addition, we can now use memory_device_get_region_size() in pc-dimm
code to implement get_plugged_size()"

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20181005092024.14344-12-david@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 include/hw/mem/memory-device.h |  1 -
 hw/mem/memory-device.c         | 11 +++++++++--
 hw/mem/pc-dimm.c               | 18 +-----------------
 3 files changed, 10 insertions(+), 20 deletions(-)

diff --git a/include/hw/mem/memory-device.h b/include/hw/mem/memory-device.h
index 659f38385c..9c3398bc4a 100644
--- a/include/hw/mem/memory-device.h
+++ b/include/hw/mem/memory-device.h
@@ -71,7 +71,6 @@ typedef struct MemoryDeviceClass {
      * most devices, this corresponds to the size of the memory region.
      */
     uint64_t (*get_plugged_size)(const MemoryDeviceState *md, Error **errp);
-    uint64_t (*get_region_size)(const MemoryDeviceState *md, Error **errp);
 
     /*
      * Return the memory region of the memory device.
diff --git a/hw/mem/memory-device.c b/hw/mem/memory-device.c
index 425830c65c..07749bab69 100644
--- a/hw/mem/memory-device.c
+++ b/hw/mem/memory-device.c
@@ -268,9 +268,16 @@ void memory_device_unplug_region(MachineState *ms, MemoryRegion *mr)
 uint64_t memory_device_get_region_size(const MemoryDeviceState *md,
                                        Error **errp)
 {
-    MemoryDeviceClass *mdc = MEMORY_DEVICE_GET_CLASS(md);
+    const MemoryDeviceClass *mdc = MEMORY_DEVICE_GET_CLASS(md);
+    MemoryRegion *mr;
 
-    return mdc->get_region_size(md, errp);
+    /* dropping const here is fine as we don't touch the memory region */
+    mr = mdc->get_memory_region((MemoryDeviceState *)md, errp);
+    if (!mr) {
+        return 0;
+    }
+
+    return memory_region_size(mr);
 }
 
 static const TypeInfo memory_device_info = {
diff --git a/hw/mem/pc-dimm.c b/hw/mem/pc-dimm.c
index c9f6ad589e..47b2e83389 100644
--- a/hw/mem/pc-dimm.c
+++ b/hw/mem/pc-dimm.c
@@ -236,21 +236,6 @@ static uint64_t pc_dimm_md_get_addr(const MemoryDeviceState *md)
     return dimm->addr;
 }
 
-static uint64_t pc_dimm_md_get_region_size(const MemoryDeviceState *md,
-                                           Error **errp)
-{
-    MemoryDeviceClass *mdc = MEMORY_DEVICE_GET_CLASS(md);
-    MemoryRegion *mr;
-
-    /* dropping const here is fine as we don't touch the memory region */
-    mr = mdc->get_memory_region((MemoryDeviceState *)md, errp);
-    if (!mr) {
-        return 0;
-    }
-
-    return memory_region_size(mr);
-}
-
 static MemoryRegion *pc_dimm_md_get_memory_region(MemoryDeviceState *md,
                                                   Error **errp)
 {
@@ -302,8 +287,7 @@ static void pc_dimm_class_init(ObjectClass *oc, void *data)
 
     mdc->get_addr = pc_dimm_md_get_addr;
     /* for a dimm plugged_size == region_size */
-    mdc->get_plugged_size = pc_dimm_md_get_region_size;
-    mdc->get_region_size = pc_dimm_md_get_region_size;
+    mdc->get_plugged_size = memory_device_get_region_size;
     mdc->get_memory_region = pc_dimm_md_get_memory_region;
     mdc->fill_device_info = pc_dimm_md_fill_device_info;
 }
-- 
2.18.0.rc1.1.g3f1ff2140


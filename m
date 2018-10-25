Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp732921wro;
        Thu, 25 Oct 2018 06:53:11 -0700 (PDT)
X-Google-Smtp-Source: AJdET5feD2LV5ZHZ2RrmFnKz42hc9EpBPZyQQJo6/6Hm8uIy241YYJ+gaGJZOg9ICRmfxHVn5fKd
X-Received: by 2002:a37:8006:: with SMTP id b6-v6mr1474096qkd.178.1540475591096;
        Thu, 25 Oct 2018 06:53:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540475591; cv=none;
        d=google.com; s=arc-20160816;
        b=ebtKOU8flyabM+p7PbbO7cb2j4p4lYayt2B3fLDq7pJusiX+zld9su7h0OSXXWFuXi
         vcVbqK0RGQq4a4ATcM9Vz3/EVIiR99g2/dpCo6DT3C2w6aWUkriBBfneVH94DxGJ4X+g
         GL++7WoeIOT7BDb+mJx03u/uCcKUddmzrRYu7g8FcXsPDD0zNivaUbZfTpBQnBPQXEsr
         +cvsAhLCGN1T2MikdTrOMzN1//W0hetxN6G6j9QWNxrVAEGg0OzL1XrQxXiJJDQzmaM+
         e7sJx38DBvOe30zY3cJhm5g/9M+o4NHd+l/kDm0rU62nS44qMn1wAs1fe5+99o8zI7gR
         Ubjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=gaWBWt6JOwKv15gSZp7hXenCml5iypYO3jctCuqVBHM=;
        b=ufIGtZ3IDwFVKy8QJOxwBsN/0zkzK6XS9pqS5jhqk3WXAyxlcF0ppOWcBK05z8DEYP
         ANG7NSWx03SFW1Wp7WiDiSQ4t3nu1Hfj0DsU3VXNPUZKYhPljqd+L/5AwbgE2Z2W47Fr
         YocQYQLcmlNazG77++jZzCQvJJIYdA2+cWkgmq/PSvJf8/J4xfPd/bz5GFU5CCG41FLa
         kDKk7Jk/WMPHnNgkkLZhcAsyaJJ44ckYgcaljfXYXKZRgtg9HLsrQl41f7WFsP7waH02
         XCnxlhs8Uo3wLpVO90lxsigMf8ebHVLjs+aEqYVDCkPpfqFPfo5xaXLnpsGk73v6W6jE
         0FCg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n42-v6si6823753qtn.383.2018.10.25.06.53.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 25 Oct 2018 06:53:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54597 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gFg4S-00023O-5c
	for alex.bennee@linaro.org; Thu, 25 Oct 2018 09:53:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59037)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gFfq5-000659-2B
	for qemu-devel@nongnu.org; Thu, 25 Oct 2018 09:38:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gFfpx-0001ZR-5Y
	for qemu-devel@nongnu.org; Thu, 25 Oct 2018 09:38:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40778)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gFfpg-0001HE-G5; Thu, 25 Oct 2018 09:37:52 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E82F930F8C05;
	Thu, 25 Oct 2018 13:37:39 +0000 (UTC)
Received: from localhost (unknown [10.33.36.149])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6835C1974A;
	Thu, 25 Oct 2018 13:37:27 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Thu, 25 Oct 2018 10:32:45 -0300
Message-Id: <20181025133301.16578-28-ehabkost@redhat.com>
In-Reply-To: <20181025133301.16578-1-ehabkost@redhat.com>
References: <20181025133301.16578-1-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Thu, 25 Oct 2018 13:37:40 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL v2 27/43] memory-device: drop get_region_size()
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
	Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
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
X-TUID: /fSO6D7zx5F3

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


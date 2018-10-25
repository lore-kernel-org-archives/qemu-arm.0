Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp742837wro;
        Thu, 25 Oct 2018 07:02:05 -0700 (PDT)
X-Google-Smtp-Source: AJdET5eGpiKTIh/GNQvykMYAyZP73GB3ycDT4X2LJczUkgadrE5Hg6yC1BvCEfFqiIfxEBe3zyeL
X-Received: by 2002:ac8:7693:: with SMTP id g19-v6mr1597785qtr.388.1540476125890;
        Thu, 25 Oct 2018 07:02:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540476125; cv=none;
        d=google.com; s=arc-20160816;
        b=gl5BioJdLpjnwab5tj8KFzbunbiL2gCzeyNe3fyqWmGcplHkS2SggQPOSR/pESe2Ua
         /z8ipGfzxkocQt5h+SwSnpJCzi3HcIvRGfPKT16tTO4GfehzvgMFcTOqJcCAxoQRz2wQ
         W0x7ftp3WHFv4L/ZYmLOBK++hNjUCOKoz+xbmp3GN/O6TE01xn3AeNQLftOHYL3hYFgo
         XGdnQVLFYObjBNyDsFNuR6z+ZZw7OudZu0KEVoDEdjdTuLVtLLkRJppYeLLyjm8/PDCa
         AVmVqc3kccuRRnp60NAYJ9lX+q3H55nqUX3kEzP5zw2nk5RfJBZi8frUEk1jhJv7EDJG
         XymA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=D7MP8INod2zGnFd/H8CqO+DMXti6Wx07HwcdzNFi3Jo=;
        b=XIeBby7Wl4LYGx2rtsHsIQyyin5KYyrNPH2Wkr4yCJQMX8VAIClph+FJlB/bkbR+68
         ehTRHeDHZlyWptU/gQHrdvYv21WBot4+bHp3MzNE1jHI3Y85VsNz38brE7kDsdAResDt
         xnhyTPpaYJwjANh0d+nlM7n+nWUH+6J1pyRMJoQWucUkpyUYZXcZ7H3wdQH673vZCrTT
         S6xcmd1eA0saT9VxDFfz0LdRUg7ceByPCUqys/ONu7j7gBw1v68y7f0Biu6Jee2ksqWs
         ksT0tZO/JxpqNUtMhy4YajVOxi9f7oXnqgjKPAWh61+tAe1qMneTz6Rg9zxK0KhuBvS/
         dXHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 81-v6si3277677qkc.248.2018.10.25.07.02.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 25 Oct 2018 07:02:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54672 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gFgD7-0002Tz-4F
	for alex.bennee@linaro.org; Thu, 25 Oct 2018 10:02:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59076)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gFfqE-0006CA-8r
	for qemu-devel@nongnu.org; Thu, 25 Oct 2018 09:38:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gFfq4-0001eF-Ve
	for qemu-devel@nongnu.org; Thu, 25 Oct 2018 09:38:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48784)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gFfpw-0001Wc-Cz; Thu, 25 Oct 2018 09:38:08 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E71BA308404B;
	Thu, 25 Oct 2018 13:38:04 +0000 (UTC)
Received: from localhost (unknown [10.33.36.149])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 478AB5E1B4;
	Thu, 25 Oct 2018 13:37:42 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Thu, 25 Oct 2018 10:32:46 -0300
Message-Id: <20181025133301.16578-29-ehabkost@redhat.com>
In-Reply-To: <20181025133301.16578-1-ehabkost@redhat.com>
References: <20181025133301.16578-1-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Thu, 25 Oct 2018 13:38:05 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL v2 28/43] memory-device: add device class
 function set_addr()
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
X-TUID: tnwlkWxErJJv

From: David Hildenbrand <david@redhat.com>

To be able to factor out address assignment of memory devices, we will
have to read (get_addr()) and write (set_addr()) the address.

We can't use properties for this purpose, as properties are device
specific. E.g. while the address property for a DIMM is called "addr", it
might be called differently (e.g. "memaddr") for other devices.

Especially virtio based memory devices cannot use "addr" as that is already
reserved and used for the address on the bus (for the proxy device).

Also, it might be possible to have memory devices without address
properties (e.g. internal DIMM-like thingies).

In contrast to get_addr(), we expect that set_addr() can fail.

Keep it simple for now for pc-dimm and simply set the static property, that
will fail once realized.

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20181005092024.14344-13-david@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 include/hw/mem/memory-device.h | 8 ++++++++
 hw/mem/pc-dimm.c               | 7 +++++++
 2 files changed, 15 insertions(+)

diff --git a/include/hw/mem/memory-device.h b/include/hw/mem/memory-device.h
index 9c3398bc4a..ed7cf5bf4b 100644
--- a/include/hw/mem/memory-device.h
+++ b/include/hw/mem/memory-device.h
@@ -59,6 +59,14 @@ typedef struct MemoryDeviceClass {
      */
     uint64_t (*get_addr)(const MemoryDeviceState *md);
 
+    /*
+     * Set the address of the memory device in guest physical memory.
+     *
+     * Called when plugging the memory device to configure the determined
+     * address in guest physical memory.
+     */
+    void (*set_addr)(MemoryDeviceState *md, uint64_t addr, Error **errp);
+
     /*
      * Return the amount of memory provided by the memory device currently
      * usable ("plugged") by the VM.
diff --git a/hw/mem/pc-dimm.c b/hw/mem/pc-dimm.c
index 47b2e83389..4a15091734 100644
--- a/hw/mem/pc-dimm.c
+++ b/hw/mem/pc-dimm.c
@@ -236,6 +236,12 @@ static uint64_t pc_dimm_md_get_addr(const MemoryDeviceState *md)
     return dimm->addr;
 }
 
+static void pc_dimm_md_set_addr(MemoryDeviceState *md, uint64_t addr,
+                                Error **errp)
+{
+    object_property_set_uint(OBJECT(md), addr, PC_DIMM_ADDR_PROP, errp);
+}
+
 static MemoryRegion *pc_dimm_md_get_memory_region(MemoryDeviceState *md,
                                                   Error **errp)
 {
@@ -286,6 +292,7 @@ static void pc_dimm_class_init(ObjectClass *oc, void *data)
     ddc->get_vmstate_memory_region = pc_dimm_get_memory_region;
 
     mdc->get_addr = pc_dimm_md_get_addr;
+    mdc->set_addr = pc_dimm_md_set_addr;
     /* for a dimm plugged_size == region_size */
     mdc->get_plugged_size = memory_device_get_region_size;
     mdc->get_memory_region = pc_dimm_md_get_memory_region;
-- 
2.18.0.rc1.1.g3f1ff2140


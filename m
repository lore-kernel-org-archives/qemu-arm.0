Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp2829253wrt;
        Thu, 18 Oct 2018 13:29:57 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63CRe6Y8+6sAxSG5J24U/EbPJaSalmbDyU3A2JjLf4o/fjUPUSeNwNnNBIOiC3yS7H61kW/
X-Received: by 2002:a0c:93af:: with SMTP id f44mr31592566qvf.1.1539894596953;
        Thu, 18 Oct 2018 13:29:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539894596; cv=none;
        d=google.com; s=arc-20160816;
        b=ZY4SfxyUJn11a05VAg+MLAG7tcjdHzUYbbyke6ijZR/dqCUUO8es9L+jcph57zyMHe
         Tm3L4sLePqDhi3Uz6n+5RtZf0Gei2vUEUypnsXklqJF5KzBA+HobwcUQ3q9+tWZX2wDk
         c6EbNU+TycmaVCkKKBs38o6ZzCF6GyAn7GyQXEP63siXGJ5DNTybghY4XbX+pTR+eRGY
         lrH/ANMa7Nss+PSkt4nVM3ozNrvb8lcl7/YC1DC0jUk/t5Pu2AAbO7nDi023c02Z8JM8
         DReUTmxK1kKwAt0GzqOk8+wHAO41FG7Ti2N01gpWGVl2U7Fdh9OD06Xrsl3WXDv1mKgi
         he8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=D7MP8INod2zGnFd/H8CqO+DMXti6Wx07HwcdzNFi3Jo=;
        b=a1PojWN0KBf0lFoqJxELxw0gzehOg+bawB7gFxO6siyAVzhrXVBx/IeCJNnzOs6l4X
         UW/mAodaKVaQIwOheL3a6+1DF8fe1ayugQkRGLK1L5TUDeWwGtcRcSvClHRBvmoGC+S2
         0m/kcGZSJJJh09djAFjwlf3E/w63y0bIRFfXrtRjE3wu+Q7P7oRFAA3I/DjMqnLyKtQG
         hRXU0VrB9S2RX8TxJfUoRY/Qc4pxBCQqtB/iHr4+TqcSB/TYMcx6hznnXsW06eUbMyUE
         qVFw6tvloKnEJbFMScNR4jRhHEAd0Uk7bh5n5QXAxXcjR6GGVl8+S8tC29UP+BFwCgL6
         Dmbw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u56-v6si2010845qta.385.2018.10.18.13.29.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Oct 2018 13:29:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44441 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gDEvc-0004xe-9s
	for alex.bennee@linaro.org; Thu, 18 Oct 2018 16:29:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40238)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gDEb3-0002dQ-7J
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 16:08:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gDEay-0002vV-Ce
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 16:08:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57442)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gDEaq-0002gV-EP; Thu, 18 Oct 2018 16:08:31 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3D20D74F12;
	Thu, 18 Oct 2018 20:08:20 +0000 (UTC)
Received: from localhost (ovpn-117-52.phx2.redhat.com [10.3.117.52])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A0BA668B2A;
	Thu, 18 Oct 2018 20:08:19 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Thu, 18 Oct 2018 17:04:06 -0300
Message-Id: <20181018200422.4358-30-ehabkost@redhat.com>
In-Reply-To: <20181018200422.4358-1-ehabkost@redhat.com>
References: <20181018200422.4358-1-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Thu, 18 Oct 2018 20:08:20 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL 29/45] memory-device: add device class function
 set_addr()
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
X-TUID: HQgwgjff0oVb

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


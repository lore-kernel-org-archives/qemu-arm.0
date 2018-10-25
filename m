Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp728844wro;
        Thu, 25 Oct 2018 06:49:10 -0700 (PDT)
X-Google-Smtp-Source: AJdET5d00udGbrqkNOq1oiBKzbeFz0F/1g++qA2DAzJv/R1MdZVDKfu0Ihi6U980XsGcLjrFDEA+
X-Received: by 2002:ac8:72c1:: with SMTP id o1-v6mr1449314qtp.134.1540475350177;
        Thu, 25 Oct 2018 06:49:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540475350; cv=none;
        d=google.com; s=arc-20160816;
        b=g+9fCsDxiFvbwloBuq5QSioLgRvXVVn27nWFc+h1iHN4MYf8dgEySVp0YZEuNpvEzn
         qGsHKKIo3QrAGBhUuS1L4usuIfpnBAKH8ATYmH3jmD3IUUgcNSTCoesGGE2JuSyolVJ5
         nSkGBGYKXrm0nlTruVKG528V2x0bzz3hqBZETSP8fIZLQ8VGejtN0rKezjDWi5e/XG+Y
         NwMqKGF4jRF4aib+qdxXM7Dcmi4poYfOHlckErJc4/X0VRZsBMHEtPSZETi0xVj2DmhC
         /usHQ99gBr+g/RpQxfFBA6YkwJsCgCxOQsJYEFIeI7Yjg9RQr2ooS7ol0iW1mYofz3Xz
         rM6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=WpOVeD4HObO/pPEB191IlF7PXtxxiLOjxHHBI82/Lv4=;
        b=bqcU6bwfVvLc379VIl6dIQceRxWobrS/lNbL3Y0bY+bW1mGMm4laQ4ds0Rw9rXrOz0
         lOJmoWzew8vP/dab+W38wR1SfXK1s4h0iai8RwnPxPUsiSp/YuoURE7AOy5Il8yVpdIo
         5nuKhlc9Wv0rky3zE1/Mb7pI0kjMJOy9Zctm+8jvl6MPfJ0v1hVIlvGAVGaNLmXtBe2O
         uUzmCbb2JKKWTTQvlSJrpW2lFv6bnS5Y6pPG3o7qPv9ILBlHalFW9wv7YyKcZCcEaWDv
         ySpbqHWosCIiLBQBxfoEh94E5t2PnIFBCyg84aFjXPH4SOQPj4QVs8m4lMwPG09vpe14
         ialw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r21-v6si5398225qta.244.2018.10.25.06.49.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 25 Oct 2018 06:49:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54576 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gFg0b-0007mq-Lr
	for alex.bennee@linaro.org; Thu, 25 Oct 2018 09:49:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58376)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gFfoQ-0003gW-TJ
	for qemu-arm@nongnu.org; Thu, 25 Oct 2018 09:36:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gFfoN-0000cU-Ie
	for qemu-arm@nongnu.org; Thu, 25 Oct 2018 09:36:34 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47728)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gFfoN-0000c5-A5; Thu, 25 Oct 2018 09:36:31 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 22EC23084022;
	Thu, 25 Oct 2018 13:36:30 +0000 (UTC)
Received: from localhost (unknown [10.33.36.149])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3FB4668D27;
	Thu, 25 Oct 2018 13:36:11 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Thu, 25 Oct 2018 10:32:42 -0300
Message-Id: <20181025133301.16578-25-ehabkost@redhat.com>
In-Reply-To: <20181025133301.16578-1-ehabkost@redhat.com>
References: <20181025133301.16578-1-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Thu, 25 Oct 2018 13:36:30 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL v2 24/43] memory-device: document MemoryDeviceClass
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
X-TUID: xizaavkztXtL

From: David Hildenbrand <david@redhat.com>

Document the functions. Don't document get_region_size(), as we will be
dropping/replacing that one soon.

Use same documentation style as in include/exec/memory.h, but don't
document the parameters, as they are self-explanatory.

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20181005092024.14344-9-david@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 include/hw/mem/memory-device.h | 36 ++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/include/hw/mem/memory-device.h b/include/hw/mem/memory-device.h
index f02b229837..0474a3dd11 100644
--- a/include/hw/mem/memory-device.h
+++ b/include/hw/mem/memory-device.h
@@ -29,12 +29,48 @@ typedef struct MemoryDeviceState {
     Object parent_obj;
 } MemoryDeviceState;
 
+/**
+ * MemoryDeviceClass:
+ *
+ * All memory devices need to implement TYPE_MEMORY_DEVICE as an interface.
+ *
+ * A memory device is a device that owns a memory region which is
+ * mapped into guest physical address space at a certain address. The
+ * address in guest physical memory can either be specified explicitly
+ * or get assigned automatically.
+ */
 typedef struct MemoryDeviceClass {
+    /* private */
     InterfaceClass parent_class;
 
+    /*
+     * Return the address of the memory device in guest physical memory.
+     *
+     * Called when (un)plugging a memory device or when iterating over
+     * all memory devices mapped into guest physical address space.
+     *
+     * If "0" is returned, no address has been specified by the user and
+     * no address has been assigned to this memory device yet.
+     */
     uint64_t (*get_addr)(const MemoryDeviceState *md);
+
+    /*
+     * Return the amount of memory provided by the memory device currently
+     * usable ("plugged") by the VM.
+     *
+     * Called when calculating the total amount of ram available to the
+     * VM (e.g. to report memory stats to the user).
+     *
+     * This is helpful for devices that dynamically manage the amount of
+     * memory accessible by the guest via the reserved memory region. For
+     * most devices, this corresponds to the size of the memory region.
+     */
     uint64_t (*get_plugged_size)(const MemoryDeviceState *md, Error **errp);
     uint64_t (*get_region_size)(const MemoryDeviceState *md, Error **errp);
+
+    /*
+     * Translate the memory device into #MemoryDeviceInfo.
+     */
     void (*fill_device_info)(const MemoryDeviceState *md,
                              MemoryDeviceInfo *info);
 } MemoryDeviceClass;
-- 
2.18.0.rc1.1.g3f1ff2140


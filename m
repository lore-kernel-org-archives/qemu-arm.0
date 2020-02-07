Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp428451lfp;
        Fri, 7 Feb 2020 02:52:28 -0800 (PST)
X-Google-Smtp-Source: APXvYqwtRMM1JmeV6AEY3kDSSS5SGtfsxO1PRycRKMyltQYHpZYELKuzytISoCDYv93MtJ7CrCjs
X-Received: by 2002:ac8:584:: with SMTP id a4mr6867669qth.240.1581072748355;
        Fri, 07 Feb 2020 02:52:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581072748; cv=none;
        d=google.com; s=arc-20160816;
        b=YdXwZEsqZuJOkBWzZ14UjjFU6zZyP3NH1+JWJb1j3tVux86H2nVyYnJMqJJluKJ4fn
         f9ug1r6UmtRQXC+knuJTupjJyZPQOOB8/eT1JMA+pNzyfBQwceHvriW6ak1I/Mr/e/ME
         AL7xxhXu8870l5K2fpnIuNJjcwIJdgxBHhXX6WKFNu2wfY/zgGWUYTnsS5SJLFAQb1M+
         F3CX2h6XOIWrqGZS85IsoJ5GR+SjpR/eXHUHSY4Gm1/CwprzkZMgl1cpZANw/07b8ayE
         OTSRwgY1ukS3aqdfRglB/udn3dhh0AuKl5YTfqCU/J+wpCaWco8OqIwjG2/diMtv+/fL
         eJAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Ex30tLwUd/BXWQ3hptk1iNZzU9TKX8GwAn4sFVV6FWk=;
        b=BmQfrF20LrEma1OjJOefAXyjQbR7l9RRLK2pQvYeLsIEmcU8Vu2UGfbKy6Sngwxoki
         p7wDMqxYDOEcXb6hmNHii2dpQLw8DlygA2HoF36AkqmbrDC441nrSdjncuhsr/jlpDSg
         2kuFCfFLphcImEj9ykxmEl40OUYssx1z96+lv0zpYemRd8XzyiGapftrINYziHQlv55T
         SNu6X6+vms8glO5q7Shq3F2spWVM05bE+7lZzG4VvEIUdpQzMbHmK0q7FJvnkpkz0PVg
         G1b3SriDlbXC62oNLIT3ZMH9ZhmRb2Y2vpbgJ1zWDgX6ObyziK5Abc9wpTzebYgc7i6z
         ToUA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=IKKsJWzW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c18si1054557qvn.81.2020.02.07.02.52.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Feb 2020 02:52:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=IKKsJWzW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j01FL-0006eJ-RS
	for alex.bennee@linaro.org; Fri, 07 Feb 2020 05:52:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54334)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1j01FF-0006eB-LW
 for qemu-arm@nongnu.org; Fri, 07 Feb 2020 05:52:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1j01FE-0004jP-Hl
 for qemu-arm@nongnu.org; Fri, 07 Feb 2020 05:52:21 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:54763
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1j01FE-0004jD-DT
 for qemu-arm@nongnu.org; Fri, 07 Feb 2020 05:52:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581072739;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ex30tLwUd/BXWQ3hptk1iNZzU9TKX8GwAn4sFVV6FWk=;
 b=IKKsJWzWh+CONQHttsCQJclYR9K30tIWbFfsNYpjSc9WUutmWS/WCSMqC6+Cxu4u1rH4YI
 jtBUr6fnjx149pFYMqm2HfwTNHFqHQjbiHFuTMW+gqCEDOhZCAxzILZEhNjZ5j7P4aYFe5
 /fVumeUq6LyB/35117FB5iGdOFNTJtE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-161-QXmGOrFJM8WFOYSOi-AGTw-1; Fri, 07 Feb 2020 05:52:18 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4AB4D800E21;
 Fri,  7 Feb 2020 10:52:16 +0000 (UTC)
Received: from [10.36.116.37] (ovpn-116-37.ams2.redhat.com [10.36.116.37])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AF3B160BF7;
 Fri,  7 Feb 2020 10:52:04 +0000 (UTC)
Subject: Re: [PATCH v14 08/11] virtio-iommu-pci: Introduce the x-dt-binding
 option
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20200207093203.3788-1-eric.auger@redhat.com>
 <20200207093203.3788-9-eric.auger@redhat.com>
 <20200207052214-mutt-send-email-mst@kernel.org>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <25d39300-46b9-571c-6fa6-44c5f8d0be99@redhat.com>
Date: Fri, 7 Feb 2020 11:51:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20200207052214-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: QXmGOrFJM8WFOYSOi-AGTw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, kevin.tian@intel.com, tnowicki@marvell.com,
 jean-philippe@linaro.org, quintela@redhat.com, qemu-devel@nongnu.org,
 peterx@redhat.com, dgilbert@redhat.com, bharatb.linux@gmail.com,
 qemu-arm@nongnu.org, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /5KWmBIcG7PI

Hi,

On 2/7/20 11:23 AM, Michael S. Tsirkin wrote:
> On Fri, Feb 07, 2020 at 10:32:00AM +0100, Eric Auger wrote:
>> At the moment, the kernel only supports device tree
>> integration of the virtio-iommu. DT bindings between the
>> PCI root complex and the IOMMU must be created by the machine
>> in conformance to:
>>
>> Documentation/devicetree/bindings/virtio/iommu.txt.
>>
>> To make sure the end-user is aware of this, force him to use the
>> temporary device option "x-dt-binding" and also double check the
>> machine has a hotplug handler for the virtio-iommu-pci device.
>> This hotplug handler is in charge of creating those DT bindings.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Suggested-by: Michael S. Tsirkin <mst@redhat.com>
> 
> how about setting it by default from machine class?
Do you mean in ARM virt machine class? But this wouldn't prevent a user
from launching an ACPI booted guest. I thought you wanted the end-user
to know what he does.

I don't figure out a way to know if the guest is booted in dt or acpi
mode. I can get access to those info:
- whether acpi is enabled
- whether a FW is loaded

But a FW can be loaded, acpi enabled and eventually the guest is DT
booted with acpi=off in kernel opts.

Maybe at this point I could only support the case where no FW is loaded.
In machvirt I would not register the virtio-iommu-pci hotplug handler in
case a FW is loaded. Then I could get rid of the new x-dt-binding prop.

Thoughts?

Eric
> See
> [PATCH 1/2] spapr: Disable legacy virtio devices for pseries-5.0 and later
> [PATCH 2/2] spapr: Enable virtio iommu_platform=on by default
> which does it for spapr.

> 
>> ---
>>
>> May be squashed with previous patch
>> ---
>>  hw/virtio/virtio-iommu-pci.c | 18 ++++++++++++++++++
>>  1 file changed, 18 insertions(+)
>>
>> diff --git a/hw/virtio/virtio-iommu-pci.c b/hw/virtio/virtio-iommu-pci.c
>> index d539fcce75..3d06e14000 100644
>> --- a/hw/virtio/virtio-iommu-pci.c
>> +++ b/hw/virtio/virtio-iommu-pci.c
>> @@ -14,6 +14,7 @@
>>  #include "virtio-pci.h"
>>  #include "hw/virtio/virtio-iommu.h"
>>  #include "hw/qdev-properties.h"
>> +#include "qapi/error.h"
>>  
>>  typedef struct VirtIOIOMMUPCI VirtIOIOMMUPCI;
>>  
>> @@ -27,10 +28,12 @@ typedef struct VirtIOIOMMUPCI VirtIOIOMMUPCI;
>>  struct VirtIOIOMMUPCI {
>>      VirtIOPCIProxy parent_obj;
>>      VirtIOIOMMU vdev;
>> +    bool dt_binding;
>>  };
>>  
>>  static Property virtio_iommu_pci_properties[] = {
>>      DEFINE_PROP_UINT32("class", VirtIOPCIProxy, class_code, 0),
>> +    DEFINE_PROP_BOOL("x-dt-binding", VirtIOIOMMUPCI, dt_binding, false),
>>      DEFINE_PROP_END_OF_LIST(),
>>  };
>>  
>> @@ -39,6 +42,21 @@ static void virtio_iommu_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
>>      VirtIOIOMMUPCI *dev = VIRTIO_IOMMU_PCI(vpci_dev);
>>      DeviceState *vdev = DEVICE(&dev->vdev);
>>  
>> +    if (!dev->dt_binding) {
>> +        error_setg(errp,
>> +                   "Instantiation currently only is possible if the machine "
>> +                   "creates device tree iommu-map bindings, ie. ACPI is not "
>> +                   "yet supported");
>> +        error_append_hint(errp, "use -virtio-iommu-pci,x-dt-binding\n");
>> +        return;
>> +    }
>> +
>> +    if (!qdev_get_machine_hotplug_handler(DEVICE(vpci_dev))) {
>> +        error_setg(errp,
>> +                   "The machine does not implement a virtio-iommu-pci hotplug "
>> +                   " handler that creates the device tree iommu-map bindings");
>> +       return;
>> +    }
>>      qdev_set_parent_bus(vdev, BUS(&vpci_dev->bus));
>>      object_property_set_link(OBJECT(dev),
>>                               OBJECT(pci_get_bus(&vpci_dev->pci_dev)),
>> -- 
>> 2.20.1
> 


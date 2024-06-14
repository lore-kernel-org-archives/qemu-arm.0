Received: by 2002:a17:907:681:b0:a6f:694d:5ff8 with SMTP id wn1csp95640ejb;
        Fri, 14 Jun 2024 00:35:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXKk/cFX3JwASNf/yih5qIgyUMeAw9ofLDIQUHCFd8k4oyWbPNXzav2TMoRv18hotK23UjuuLEfVLppDUUXuHEdCk/7h4tA
X-Google-Smtp-Source: AGHT+IFhli0q3PFYSTl73FWV/OBwCAVuA/FlA1Iqo7KkLA7lmcrLYO4hwIUgSfuNo4Lk6lWbodNb
X-Received: by 2002:ac8:5889:0:b0:440:2b02:f067 with SMTP id d75a77b69052e-44216b34e29mr18403511cf.67.1718350558630;
        Fri, 14 Jun 2024 00:35:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718350558; cv=none;
        d=google.com; s=arc-20160816;
        b=dpraKHpqS3S4qClr6P/20q14w0GBTElzcIK77nm0s48T4VDdNKkLiJ5CCkHd743qtN
         L15xTyzUifPNeKTJkDiJbxkoYQf+PssNo/5CjIqyHTKc+CYyA330tQ6x0wKxAGGy5sC/
         BTdCNaZZj5MzfaXt8ECthaOulg9j8zmVd/W4aOttwTU2yWcryB8XwWfEAEmuAGFr6MD/
         02CdL9iatQymfZAJbXy7a/p7KMa9brL5zFe/ek9kcQZAOFx15Qqo1wyVMl/Dm5CuS1F2
         AsqKWDFtXgYS2gZXbLStD42e8fsIc7Uq8hmb1YkNQLF85b60YgALq5vkpvwlmHMjTKSz
         tx9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=P3VVJYg9thO7PYh5VNJwS813kWPFeMrldMGd8Yzqgf4=;
        fh=ErvzMtOj7a8VjLB7ZE3xmIP8g1e9pQsgyXMOVoPnbtw=;
        b=Skhg9U5zAJ30v1fdTFvbPOmdRo4nQu99xjWcGLzwzu16fea9R1hRkWQggTj1gfhwH2
         knQotXzSIYxeqH95yUwBcHjgy51Ju5k5gvRrP+elj1B64DH+jKWup7uAuKwRSTXvuf4F
         5Pl279NmPz0UtPhlVYMyUX1OlOvKNyhqb3yZbPzuwzg6IsqBP+iHwI5lj4NeRfHRS6aw
         eZ3PRwx7ikrEF7aHrE0G+FX2eZYNWQcGRZfr4NyhjULBXyhgQM+PIkpPxLNvX2pZjcu8
         owLtE6J7pL0wcuXdmXPlDDHVJERzLTaEkAxsLNsnKAIH2/qnzsX75lbjvFkG53PWscex
         ht9w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AE0THWc6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-441f2fc4cdcsi31025521cf.497.2024.06.14.00.35.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Jun 2024 00:35:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AE0THWc6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sI1TN-0002lH-Rx; Fri, 14 Jun 2024 03:35:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sI1TM-0002kk-Px
 for qemu-arm@nongnu.org; Fri, 14 Jun 2024 03:35:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sI1TK-0002FS-Qi
 for qemu-arm@nongnu.org; Fri, 14 Jun 2024 03:35:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718350542;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P3VVJYg9thO7PYh5VNJwS813kWPFeMrldMGd8Yzqgf4=;
 b=AE0THWc6C9o9aXpLje0TsA2DkA7dWDz6MZOFg33Co40A4mtlUyV8wvcQCOEf5q7xjil+/J
 HYbfZ4WbYx95m6W+PDMDffVaKW5lQbcVF2cYsc6nxHh/1rSS4ARRsdeqkHF6atBc1au7AW
 l7e7OxH+8d/9mwiaPtxlqY5PgvUlc0o=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-658-zcwxYptdMxKdC0SKdQmt_Q-1; Fri, 14 Jun 2024 03:35:40 -0400
X-MC-Unique: zcwxYptdMxKdC0SKdQmt_Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-421791c4eadso10841195e9.3
 for <qemu-arm@nongnu.org>; Fri, 14 Jun 2024 00:35:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718350539; x=1718955339;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=P3VVJYg9thO7PYh5VNJwS813kWPFeMrldMGd8Yzqgf4=;
 b=vvokHzgJeGHm3bWJ7xVcYzzWTGawBdRDSCWq12PSrImpE1RKOKlC14dySFXspKl5sq
 BuCN6RG02tarVMuLWOatVnLeNwBP171pKilAMDVDKZTDRTa2xjQbwsH0nG0zujDNLIlQ
 d7GQoHL/gV93IcZ++HoHaJJWLc2I5gaL+1nW5hK2m2hpmyHI/zk88NHQoGtgyP0fEw4r
 UwoFg2IpZ6nDgleNWq6ovFbEw62SdTJqhblG45Wpx4FKWZaBwcp6yRrMJsiT8H2jRp3h
 cI7zQEnHrYkqieLtVucX9RZUce22ZUT5kYqVRvS8h1TC9ERP9COOKQkrUrFFPxgwGPqg
 ahVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEtkR946rEqdBFjxL2SCyn9YW3vaPrg+iZdbow1AhS+Svk1QMJu8LoM10DU487qdsPXQHzhbMA/HDP9XNgapFSoExj
X-Gm-Message-State: AOJu0YwbmAh5R1bPip1KtF93f4OZ4jGD8nH8QfUvG95QzIMozHWXDCzQ
 HbmadHy7Rs1sZrdUfEKk7KoYqHeYcbIzFhzVydW3yGLmthyK7UALMxfyjAADP6DIjhhs8L1yOy6
 oOnC/sUVlKjHUTLcSmK6JJfpYJjWwZcmFdH+XYaXDRKxs8e2poA==
X-Received: by 2002:a05:600c:470f:b0:421:81c1:65fa with SMTP id
 5b1f17b1804b1-423048240ddmr20416055e9.13.1718350538965; 
 Fri, 14 Jun 2024 00:35:38 -0700 (PDT)
X-Received: by 2002:a05:600c:470f:b0:421:81c1:65fa with SMTP id
 5b1f17b1804b1-423048240ddmr20415625e9.13.1718350538221; 
 Fri, 14 Jun 2024 00:35:38 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:280:24f0:576b:abc6:6396:ed4a?
 ([2a01:e0a:280:24f0:576b:abc6:6396:ed4a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-422f602feb0sm49175145e9.20.2024.06.14.00.35.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jun 2024 00:35:37 -0700 (PDT)
Message-ID: <26b88829-0e6d-4ff2-a1e6-34c49a6b07f1@redhat.com>
Date: Fri, 14 Jun 2024 09:35:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/7] virtio-iommu: Implement set|unset]_iommu_device()
 callbacks
To: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>,
 Eric Auger <eric.auger@redhat.com>,
 "eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "mst@redhat.com"
 <mst@redhat.com>, "jean-philippe@linaro.org" <jean-philippe@linaro.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "yanghliu@redhat.com" <yanghliu@redhat.com>
Cc: "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "berrange@redhat.com" <berrange@redhat.com>
References: <20240613092359.847145-1-eric.auger@redhat.com>
 <20240613092359.847145-3-eric.auger@redhat.com>
 <SJ0PR11MB674452B1D7B17383EFA73E6C92C12@SJ0PR11MB6744.namprd11.prod.outlook.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <SJ0PR11MB674452B1D7B17383EFA73E6C92C12@SJ0PR11MB6744.namprd11.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.145,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: izBrNuXFN99I

On 6/13/24 11:57 AM, Duan, Zhenzhong wrote:
> 
> 
>> -----Original Message-----
>> From: Eric Auger <eric.auger@redhat.com>
>> Subject: [PATCH v3 2/7] virtio-iommu: Implement
>> set|unset]_iommu_device() callbacks
>>
>> Implement PCIIOMMUOPs [set|unset]_iommu_device() callbacks.
>> In set(), a VirtioHostIOMMUDevice is allocated which holds
>> a reference to the HostIOMMUDevice. This object is stored in a hash
>> table indexed by PCI BDF. The handle to the Host IOMMU device
>> will allow to retrieve information related to the physical IOMMU.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>
>> ---
>>
>> v2 -> v3:
>> - include host_iommu_device.h in virtio-iommu.h header
>> - introduce hiod_destroy() and fix UAF in
>>   virtio_iommu_unset_iommu_device()	
>> ---
>> include/hw/virtio/virtio-iommu.h | 10 ++++
>> hw/virtio/virtio-iommu.c         | 90
>> ++++++++++++++++++++++++++++++++
>> 2 files changed, 100 insertions(+)
>>
>> diff --git a/include/hw/virtio/virtio-iommu.h b/include/hw/virtio/virtio-
>> iommu.h
>> index 83a52cc446..a5926de947 100644
>> --- a/include/hw/virtio/virtio-iommu.h
>> +++ b/include/hw/virtio/virtio-iommu.h
>> @@ -25,6 +25,7 @@
>> #include "hw/pci/pci.h"
>> #include "qom/object.h"
>> #include "qapi/qapi-types-virtio.h"
>> +#include "sysemu/host_iommu_device.h"
>>
>> #define TYPE_VIRTIO_IOMMU "virtio-iommu-device"
>> #define TYPE_VIRTIO_IOMMU_PCI "virtio-iommu-pci"
>> @@ -45,6 +46,14 @@ typedef struct IOMMUDevice {
>>      bool probe_done;
>> } IOMMUDevice;
>>
>> +typedef struct VirtioHostIOMMUDevice {
>> +    void *viommu;
>> +    PCIBus *bus;
>> +    uint8_t devfn;
>> +    HostIOMMUDevice *dev;
>> +    QLIST_ENTRY(VirtioHostIOMMUDevice) next;
>> +} VirtioHostIOMMUDevice;
> 
> Do you have plan to use the elements in VirtioHostIOMMUDevice?

Indeed.

It would be better to avoid the unused struct definition. If removed,
the new vtd and virtio un/set_iommu_device ops become very similar and
there could be a common shared framework. Some of it could be handled
in the PCI subsystem probably ?

Thanks,

C.


  
> 
>> +
>> typedef struct IOMMUPciBus {
>>      PCIBus       *bus;
>>      IOMMUDevice  *pbdev[]; /* Parent array is sparse, so dynamically alloc
>> */
>> @@ -57,6 +66,7 @@ struct VirtIOIOMMU {
>>      struct virtio_iommu_config config;
>>      uint64_t features;
>>      GHashTable *as_by_busptr;
>> +    GHashTable *host_iommu_devices;
>>      IOMMUPciBus *iommu_pcibus_by_bus_num[PCI_BUS_MAX];
>>      PCIBus *primary_bus;
>>      ReservedRegion *prop_resv_regions;
>> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
>> index 1326c6ec41..db842555c8 100644
>> --- a/hw/virtio/virtio-iommu.c
>> +++ b/hw/virtio/virtio-iommu.c
>> @@ -69,6 +69,11 @@ typedef struct VirtIOIOMMUMapping {
>>      uint32_t flags;
>> } VirtIOIOMMUMapping;
>>
>> +struct hiod_key {
>> +    PCIBus *bus;
>> +    uint8_t devfn;
>> +};
>> +
>> static inline uint16_t virtio_iommu_get_bdf(IOMMUDevice *dev)
>> {
>>      return PCI_BUILD_BDF(pci_bus_num(dev->bus), dev->devfn);
>> @@ -462,8 +467,90 @@ static AddressSpace
>> *virtio_iommu_find_add_as(PCIBus *bus, void *opaque,
>>      return &sdev->as;
>> }
>>
>> +static gboolean hiod_equal(gconstpointer v1, gconstpointer v2)
>> +{
>> +    const struct hiod_key *key1 = v1;
>> +    const struct hiod_key *key2 = v2;
>> +
>> +    return (key1->bus == key2->bus) && (key1->devfn == key2->devfn);
>> +}
>> +
>> +static guint hiod_hash(gconstpointer v)
>> +{
>> +    const struct hiod_key *key = v;
>> +    guint value = (guint)(uintptr_t)key->bus;
>> +
>> +    return (guint)(value << 8 | key->devfn);
>> +}
>> +
>> +static void hiod_destroy(gpointer v)
>> +{
>> +    object_unref(v);
> 
> This is a bit different from intel_iommu, here v represents VirtioHostIOMMUDevice *.
> 
> Thanks
> Zhenzhong
> 
>> +}
>> +
>> +static VirtioHostIOMMUDevice *
>> +get_host_iommu_device(VirtIOIOMMU *viommu, PCIBus *bus, int devfn) {
>> +    struct hiod_key key = {
>> +        .bus = bus,
>> +        .devfn = devfn,
>> +    };
>> +
>> +    return g_hash_table_lookup(viommu->host_iommu_devices, &key);
>> +}
>> +
>> +static bool virtio_iommu_set_iommu_device(PCIBus *bus, void *opaque,
>> int devfn,
>> +                                          HostIOMMUDevice *hiod, Error **errp)
>> +{
>> +    VirtIOIOMMU *viommu = opaque;
>> +    VirtioHostIOMMUDevice *vhiod;
>> +    struct hiod_key *new_key;
>> +
>> +    assert(hiod);
>> +
>> +    vhiod = get_host_iommu_device(viommu, bus, devfn);
>> +    if (vhiod) {
>> +        error_setg(errp, "VirtioHostIOMMUDevice already exists");
>> +        return false;
>> +    }
>> +
>> +    vhiod = g_malloc0(sizeof(VirtioHostIOMMUDevice));
>> +    vhiod->bus = bus;
>> +    vhiod->devfn = (uint8_t)devfn;
>> +    vhiod->viommu = viommu;
>> +    vhiod->dev = hiod;
>> +
>> +    new_key = g_malloc(sizeof(*new_key));
>> +    new_key->bus = bus;
>> +    new_key->devfn = devfn;
>> +
>> +    object_ref(hiod);
>> +    g_hash_table_insert(viommu->host_iommu_devices, new_key, vhiod);
>> +
>> +    return true;
>> +}
>> +
>> +static void
>> +virtio_iommu_unset_iommu_device(PCIBus *bus, void *opaque, int devfn)
>> +{
>> +    VirtIOIOMMU *viommu = opaque;
>> +    VirtioHostIOMMUDevice *vhiod;
>> +    struct hiod_key key = {
>> +        .bus = bus,
>> +        .devfn = devfn,
>> +    };
>> +
>> +    vhiod = g_hash_table_lookup(viommu->host_iommu_devices, &key);
>> +    if (!vhiod) {
>> +        return;
>> +    }
>> +
>> +    g_hash_table_remove(viommu->host_iommu_devices, &key);
>> +}
>> +
>> static const PCIIOMMUOps virtio_iommu_ops = {
>>      .get_address_space = virtio_iommu_find_add_as,
>> +    .set_iommu_device = virtio_iommu_set_iommu_device,
>> +    .unset_iommu_device = virtio_iommu_unset_iommu_device,
>> };
>>
>> static int virtio_iommu_attach(VirtIOIOMMU *s,
>> @@ -1357,6 +1444,9 @@ static void
>> virtio_iommu_device_realize(DeviceState *dev, Error **errp)
>>
>>      s->as_by_busptr = g_hash_table_new_full(NULL, NULL, NULL, g_free);
>>
>> +    s->host_iommu_devices = g_hash_table_new_full(hiod_hash,
>> hiod_equal,
>> +                                                  g_free, hiod_destroy);
>> +
>>      if (s->primary_bus) {
>>          pci_setup_iommu(s->primary_bus, &virtio_iommu_ops, s);
>>      } else {
>> --
>> 2.41.0
> 


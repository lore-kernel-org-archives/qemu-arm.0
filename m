Received: by 2002:a17:906:641:b0:a6f:1bf6:7fc1 with SMTP id t1csp162431ejb;
        Thu, 13 Jun 2024 01:13:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXYiEXsIc6OykuPiYo5D5WEugn60EFlJKgX6EOP56al4vZ/KuXq5YfUux1RY4/SNZPees3If7DJO2DPfIChGCYhwQ6qK4C4
X-Google-Smtp-Source: AGHT+IFVygvVAfqmgXrptiQDMIbnAdhhtEp8wwtFfrUYKfgctTcw3sAB5CpgZOYFMRwiPqilAdNr
X-Received: by 2002:a25:7dc6:0:b0:de5:5b9c:4452 with SMTP id 3f1490d57ef6-dfe66461a58mr3611375276.21.1718266412134;
        Thu, 13 Jun 2024 01:13:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718266412; cv=none;
        d=google.com; s=arc-20160816;
        b=hGauU5+IqHAK9JjN0MFzG+cx2K8a186TcyCRc9g3YhKt9+PVS6W/WbSpJzAqvgHfPW
         LVS8yi/GJLZkafsaOszzTK9Adk1deHyZkYQbqcpAOyxdtlsBz8y+/EnT5FFsuSTVXQgG
         VMVRETlctvl7leQvrfIDaeviPsGbuGvlt7i8kiqqRfhUay3A97WDSsIUuhgtIz2cbCkn
         hIOMRV6szUwd5Tlw72OLL6NDcOUhO5JLsM+2AWGReUKslnEfb3CKtKrGp5vtihThNCp7
         xAs/mshE0Rt1MBgyF1VA+gnKdMsOWZE6oz+cssgfpukyqG8maRtmOl3SoHjUvELNjaT8
         h6EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=waa3WhU5CDGh+4DeM+IwdGCxmWc26gMoUuETCM0A7/I=;
        fh=9NjGdR3wfIlxEKuE9Jt4H8EAwzKuRrVLl5ooIW8ZV/M=;
        b=sEjVqSd4cOYh+gSWINVjO5NsrxllkxFRZNWuDQcshjxhOWx/ItW+e1kX2EF2724YAI
         fMJ78KJAALb0RXMb8lW+c96gLzWSGeXtCy8P5LSyWxjG6w87xhsHIsF8rvONFoFqfh7S
         YzrN/0rVrU+CR2+QFuYhFD1XUY0adnLmJSAy+H6vBttSsCVrdIhWpi+G4N0KoAmIMmUP
         wDdozAVsUlRffl49r1itwaD+BR6DjiVXMpY53kC/rCZLydCRYTjxmIfNnRVfdFnhEekn
         2RgEwqo4Q/W4HK/zBgPaXP/99BNiWFmS2v+SesHiieit3iDh5f+dnXvQHqEcbeTRhRBa
         1ziw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KjYvkfMS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b2a5b5fadesi9451426d6.450.2024.06.13.01.13.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Jun 2024 01:13:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KjYvkfMS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sHfa7-0005pc-Du; Thu, 13 Jun 2024 04:13:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1sHfa6-0005pA-B7
 for qemu-arm@nongnu.org; Thu, 13 Jun 2024 04:13:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1sHfa3-0000zL-EC
 for qemu-arm@nongnu.org; Thu, 13 Jun 2024 04:13:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718266390;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=waa3WhU5CDGh+4DeM+IwdGCxmWc26gMoUuETCM0A7/I=;
 b=KjYvkfMSmbELNZQF8e1xRaOkhM1FoBKB2J2cjx7WfrVMCKnvDE/nj8qD2p18z+RI+t0tIq
 WPG+BCGiljpPZSEMWK6RpNxH+SbKGzE0X5J4MT1D9/sEdFHCYAmxmhrO6x+zUHHnzF/xyw
 aiXQeHy2IVheStWZh4FJbk2eeYkCxGs=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-355-AzmzGakUMPGCN73a539UXw-1; Thu, 13 Jun 2024 04:13:08 -0400
X-MC-Unique: AzmzGakUMPGCN73a539UXw-1
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-43fb05ef704so7754771cf.2
 for <qemu-arm@nongnu.org>; Thu, 13 Jun 2024 01:13:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718266388; x=1718871188;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=waa3WhU5CDGh+4DeM+IwdGCxmWc26gMoUuETCM0A7/I=;
 b=ZdOp5FtAeNbdn6d+XDb3U5N8hHdWXfreIThGcnUWW0vxVYlGy4R9JFafqbN4Pvn8Lj
 yXnrva/yKC90NuhORZskN8SUXh+7HaTPfoDFp5vdWA+EdTcjYJJB8DtOqcB3M00/j5h6
 pETVMW/HwZUx19UCt7vVKMwDfzKb003gcUcd2V44YacIGlWsfEDfwfvHkO5xtzUXsF25
 xva2z8av/jnbDUUoMm2EHB5+0tLNOxiyYkn6SHOkxvpprnXweOkKOiszlvlwMrYMCpDX
 iJfoNOwHH/6k3U39jnoU/ITs+kBU9kGSHlUVHhEdnNj/b3E70jLaKNF4yifTEsWqVUrB
 GFug==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpD9vuc4Bm/ekFtzQPYwbcbAx3i3UU2Oiv3it/Efg/JK0iPFF5wXUeQ6RMuxfDD+Vlw9Kbx2FjNffVYy5D9g0PWjAU
X-Gm-Message-State: AOJu0YzlCTR1LY+RlGc27I9yhrYTN60z5Vj2F6GiNDu8CGnqQsyljaEc
 Ro0aSzJo346Z8XXbQLePJGLLECbp70QeRkK5phmFC4cbGwJu/0xlWgd8A0QbKmhonvaLtJChDrH
 ftcbPsxHwZ2faYrbUxrxC4bXI8rvIVZ0zDXuNl583JBgD7uWLRw==
X-Received: by 2002:ac8:5dc9:0:b0:440:6c89:378f with SMTP id
 d75a77b69052e-4415abb0a33mr40285691cf.9.1718266388064; 
 Thu, 13 Jun 2024 01:13:08 -0700 (PDT)
X-Received: by 2002:ac8:5dc9:0:b0:440:6c89:378f with SMTP id
 d75a77b69052e-4415abb0a33mr40285501cf.9.1718266387731; 
 Thu, 13 Jun 2024 01:13:07 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-441f2ff9ef8sm4012831cf.89.2024.06.13.01.13.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jun 2024 01:13:07 -0700 (PDT)
Message-ID: <19e732e7-38c5-4164-b023-eb4bb534ddb8@redhat.com>
Date: Thu, 13 Jun 2024 10:13:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 2/7] virtio-iommu: Implement set|unset]_iommu_device()
 callbacks
To: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>,
 "eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "mst@redhat.com"
 <mst@redhat.com>, "jean-philippe@linaro.org" <jean-philippe@linaro.org>,
 "imammedo@redhat.com" <imammedo@redhat.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "clg@redhat.com" <clg@redhat.com>, "yanghliu@redhat.com"
 <yanghliu@redhat.com>
Cc: "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "berrange@redhat.com" <berrange@redhat.com>
References: <20240607143905.765133-1-eric.auger@redhat.com>
 <20240607143905.765133-3-eric.auger@redhat.com>
 <SJ0PR11MB6744E8907BBF000C73278B0A92C72@SJ0PR11MB6744.namprd11.prod.outlook.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <SJ0PR11MB6744E8907BBF000C73278B0A92C72@SJ0PR11MB6744.namprd11.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.143,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: bZrqJyb9Z99j

Hi Zhenzhong,

On 6/11/24 04:38, Duan, Zhenzhong wrote:
> Hi Eric,
>
>> -----Original Message-----
>> From: Eric Auger <eric.auger@redhat.com>
>> Subject: [RFC v2 2/7] virtio-iommu: Implement set|unset]_iommu_device()
>> callbacks
>>
>> Implement PCIIOMMUOPs [set|unset]_iommu_device() callbacks.
>> In set(), a VirtioHostIOMMUDevice is allocated which holds
>> a reference to the HostIOMMUDevice. This object is stored in a hash
>> table indexed by PCI BDF. The handle to the Host IOMMU device
>> will allow to retrieve information related to the physical IOMMU.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> ---
>> include/hw/virtio/virtio-iommu.h |  9 ++++
>> hw/virtio/virtio-iommu.c         | 87
>> ++++++++++++++++++++++++++++++++
>> 2 files changed, 96 insertions(+)
>>
>> diff --git a/include/hw/virtio/virtio-iommu.h b/include/hw/virtio/virtio-
>> iommu.h
>> index 83a52cc446..4f664ea0c4 100644
>> --- a/include/hw/virtio/virtio-iommu.h
>> +++ b/include/hw/virtio/virtio-iommu.h
>> @@ -45,6 +45,14 @@ typedef struct IOMMUDevice {
>>     bool probe_done;
>> } IOMMUDevice;
>>
>> +typedef struct VirtioHostIOMMUDevice {
>> +    void *viommu;
>> +    PCIBus *bus;
>> +    uint8_t devfn;
>> +    HostIOMMUDevice *dev;
>> +    QLIST_ENTRY(VirtioHostIOMMUDevice) next;
>> +} VirtioHostIOMMUDevice;
>> +
>> typedef struct IOMMUPciBus {
>>     PCIBus       *bus;
>>     IOMMUDevice  *pbdev[]; /* Parent array is sparse, so dynamically alloc
>> */
>> @@ -57,6 +65,7 @@ struct VirtIOIOMMU {
>>     struct virtio_iommu_config config;
>>     uint64_t features;
>>     GHashTable *as_by_busptr;
>> +    GHashTable *host_iommu_devices;
>>     IOMMUPciBus *iommu_pcibus_by_bus_num[PCI_BUS_MAX];
>>     PCIBus *primary_bus;
>>     ReservedRegion *prop_resv_regions;
>> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
>> index 1326c6ec41..0680a357f0 100644
>> --- a/hw/virtio/virtio-iommu.c
>> +++ b/hw/virtio/virtio-iommu.c
>> @@ -28,6 +28,7 @@
>> #include "sysemu/kvm.h"
>> #include "sysemu/reset.h"
>> #include "sysemu/sysemu.h"
>> +#include "sysemu/host_iommu_device.h"
> Not sure if better to move this to include/hw/virtio/virtio-iommu.h
> as HostIOMMUDevice is used there.
agreed!
>
>> #include "qemu/reserved-region.h"
>> #include "qemu/units.h"
>> #include "qapi/error.h"
>> @@ -69,6 +70,11 @@ typedef struct VirtIOIOMMUMapping {
>>     uint32_t flags;
>> } VirtIOIOMMUMapping;
>>
>> +struct hiod_key {
>> +    PCIBus *bus;
>> +    uint8_t devfn;
>> +};
>> +
>> static inline uint16_t virtio_iommu_get_bdf(IOMMUDevice *dev)
>> {
>>     return PCI_BUILD_BDF(pci_bus_num(dev->bus), dev->devfn);
>> @@ -462,8 +468,86 @@ static AddressSpace
>> *virtio_iommu_find_add_as(PCIBus *bus, void *opaque,
>>     return &sdev->as;
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
>> +    object_unref(vhiod->dev);
> This looks a use-after-free.
yes. Adopting the destroy function now in place in intel iommu

Thanks!

Eric
>
> Thanks
> Zhenzhong
>
>> +}
>> +
>> static const PCIIOMMUOps virtio_iommu_ops = {
>>     .get_address_space = virtio_iommu_find_add_as,
>> +    .set_iommu_device = virtio_iommu_set_iommu_device,
>> +    .unset_iommu_device = virtio_iommu_unset_iommu_device,
>> };
>>
>> static int virtio_iommu_attach(VirtIOIOMMU *s,
>> @@ -1357,6 +1441,9 @@ static void
>> virtio_iommu_device_realize(DeviceState *dev, Error **errp)
>>
>>     s->as_by_busptr = g_hash_table_new_full(NULL, NULL, NULL, g_free);
>>
>> +    s->host_iommu_devices = g_hash_table_new_full(hiod_hash,
>> hiod_equal,
>> +                                                  g_free, g_free);
>> +
>>     if (s->primary_bus) {
>>         pci_setup_iommu(s->primary_bus, &virtio_iommu_ops, s);
>>     } else {
>> --
>> 2.41.0


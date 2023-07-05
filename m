Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp3362681ejy;
        Tue, 4 Jul 2023 23:20:15 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7UhtBBNX/8IzdK8SrBJS9DeZkb3F7Si7NvMI6GzZ+Xo1YwOx8Nb9yS27tpxrlXIHw5jHg4
X-Received: by 2002:ac8:5c47:0:b0:400:aa47:a4a1 with SMTP id j7-20020ac85c47000000b00400aa47a4a1mr16490812qtj.25.1688538015505;
        Tue, 04 Jul 2023 23:20:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688538015; cv=none;
        d=google.com; s=arc-20160816;
        b=oTpmhHHlkFNPNp2cN/l2eUrGVumTiAsdzvX2e6NMB9jvKpe0IVtgWIIGCaAqX8j2w3
         9wNPowS+nt5ZHa4++X470YY0dX4Qx0ARTw4wg0uhQr0hmk6XMHlLgoBERCt5Xq1E487R
         zIVbJs9aIEgPIDWyxH5E+MFOd/sAcRA63D8CwJadtY1T6miX7fWRdM4/jWEmWT8QLDiE
         DFRJh+itSbJ7oCWE/RvVqCw3olzeF8Lf3rrwaebdq8OBUfmgo3rsmI+xnLcF6hfNGM3H
         4U35eqkdGhf8CJysrnsw93vA73zcQO02msBQhsBms5Q2jOMynE8tgs4yyLKqQu/Py817
         MClA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=r8vEg7OE9VQue0H2TzvWylaL6eXkHw5JVVQRlzZoQzk=;
        fh=sR1AIFvSn14E8TxWAck+T46o8zDXWYYner/U6As2epk=;
        b=eyuHwMdm7YgqWZdjG7F7BfaQJmgWaMuTWJYweQHeNAxq4YcWWSC6AcAPtpvPmvPbK7
         mt9W4QaaiScWw2OqYHoeRFCr0jpaVNX/OjC+1BhaDbVrcIdubkbJqa0gIwXFF6hyJx0D
         yUMUZog8b3+eZo4QbdRFRfk4Z4ETCySxNN0vqBK7HWgOqX2uhmagPEEMa3TJWWNIj14G
         FAHSV0eZCrhv3OYr0z6NGduW6qCDEsEthcQhV39PmsttmeIxYEMaOid847dLl4UibGsv
         5oCEovl3hkH4H1T8Jc7oF8RCKtTr+pHUwwPHBoXCIyeBTzX/cMopeUPO0/TlIi5COfsY
         eaNg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=X25zjN1U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c9-20020ac87dc9000000b00400a5c94e83si13686038qte.529.2023.07.04.23.20.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Jul 2023 23:20:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=X25zjN1U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qGvs1-0000tP-Up; Wed, 05 Jul 2023 02:20:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qGvs1-0000st-9x
 for qemu-arm@nongnu.org; Wed, 05 Jul 2023 02:20:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qGvrz-0006t9-3s
 for qemu-arm@nongnu.org; Wed, 05 Jul 2023 02:20:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688538006;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r8vEg7OE9VQue0H2TzvWylaL6eXkHw5JVVQRlzZoQzk=;
 b=X25zjN1UyGO/Dbg/sF193qaqDp6v5MxxhD3vFTVpYSsQrqJ4bV6zuB3fnz1d96FfklRufX
 BnZRdJU+IGAv36JFLlUr/U2SAwb64ylEtsD6nv9fOy19n1/4EN/xAS7IVMd44TaRwcexDO
 e7+UtSh9QTXAdrlj5glc0ypx5YgBfps=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-674-qtaoiJxeO72ftX7ceEYMfQ-1; Wed, 05 Jul 2023 02:20:05 -0400
X-MC-Unique: qtaoiJxeO72ftX7ceEYMfQ-1
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7656c94fc4eso770157885a.2
 for <qemu-arm@nongnu.org>; Tue, 04 Jul 2023 23:20:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688538004; x=1691130004;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=r8vEg7OE9VQue0H2TzvWylaL6eXkHw5JVVQRlzZoQzk=;
 b=bHb+gJGsL7hdJP8cvo8U+gtj0xHVNijBohCaGzLrZiw5pAXEXJr2Wkosytt7oh9+ea
 9qlCihtZkfytzMfxi7vYZZKseDFRRuWaT8IWn3BULNXjfaZ0Epao4+lltuoU/7ne7oYE
 /6kL5mNcv4j9FM6tJBbM7+wst1oPnkT9olM6U5iRcpvgV7CsXjlgfZ8sYHPqz/HmkPs7
 6HytOzBm/2wMnJER9si2TaD0pXFnOt38SO9ZLBEpYmqP/yqMM0fcj2ZpqtSis0gJE7BF
 TV4UH/5HPJRdDR4I+NZO2gLm/9ZtKnYfJZ56CqYgToWP6FjPWc44EfJoxtcdU8InzOaj
 ndEA==
X-Gm-Message-State: AC+VfDzS+3vg7RcaxXmrsuFB8qaTbzSo6LxTqc523r2mxFeNIaC2ast7
 pl/FE5CbOkyWmG6PrlUyINt0vjLONdIT9nWfqlW3fWE+j0ZMxV73xtigPExOqd8X9jDeGN7hI55
 GHmF5ev2qG0HI
X-Received: by 2002:a05:620a:40c9:b0:767:9f9:4a82 with SMTP id
 g9-20020a05620a40c900b0076709f94a82mr20574270qko.21.1688538004461; 
 Tue, 04 Jul 2023 23:20:04 -0700 (PDT)
X-Received: by 2002:a05:620a:40c9:b0:767:9f9:4a82 with SMTP id
 g9-20020a05620a40c900b0076709f94a82mr20574243qko.21.1688538004095; 
 Tue, 04 Jul 2023 23:20:04 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 g9-20020ae9e109000000b007678850233fsm965635qkm.66.2023.07.04.23.20.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jul 2023 23:20:02 -0700 (PDT)
Message-ID: <1e6ae4e2-cd7c-16c4-440f-119399d0f551@redhat.com>
Date: Wed, 5 Jul 2023 08:19:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 1/2] virtio-iommu: Fix 64kB host page size VFIO device
 assignment
To: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>,
 "eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "mst@redhat.com"
 <mst@redhat.com>, "jean-philippe@linaro.org" <jean-philippe@linaro.org>
Cc: "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "clg@redhap.com" <clg@redhap.com>,
 "bharat.bhushan@nxp.com" <bharat.bhushan@nxp.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>
References: <20230704111527.3424992-1-eric.auger@redhat.com>
 <20230704111527.3424992-2-eric.auger@redhat.com>
 <SJ0PR11MB674435F2BA42A8925ABA336F922FA@SJ0PR11MB6744.namprd11.prod.outlook.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <SJ0PR11MB674435F2BA42A8925ABA336F922FA@SJ0PR11MB6744.namprd11.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: l/Zv9P63kYks

Hi Zhenzhong,
On 7/5/23 06:52, Duan, Zhenzhong wrote:
> Hi Eric,
>
>> -----Original Message-----
>> From: Eric Auger <eric.auger@redhat.com>
>> Sent: Tuesday, July 4, 2023 7:15 PM
>> Subject: [PATCH 1/2] virtio-iommu: Fix 64kB host page size VFIO device
>> assignment
>>
>> When running on a 64kB page size host and protecting a VFIO device
>> with the virtio-iommu, qemu crashes with this kind of message:
>>
>> qemu-kvm: virtio-iommu page mask 0xfffffffffffff000 is incompatible
>> with mask 0x20010000
> Does 0x20010000 mean only  512MB and 64KB super page mapping is
> supported for host iommu hw? 4KB mapping not supported?
Yes that's correct. In that case the host has 64kB page and 4kB is not
supported.
>
> There is a check in guest kernel side hint only 4KB is supported, with
> this patch we force viommu->pgsize_bitmap to 0x20010000
> and fail below check? Does this device work in guest?
> Please correct me if I understand wrong.
my guest also has 64kB so the check hereafter succeeds. effectively in
case your host has a larger page size than your guest it fails with
[    2.147031] virtio-pci 0000:00:01.0: granule 0x10000 larger than
system page size 0x1000
[    7.231128] ixgbevf 0000:00:02.0: granule 0x10000 larger than system
page size 0x1000

>
> static int viommu_domain_finalise(struct viommu_endpoint *vdev,
>                                   struct iommu_domain *domain)
> {
> ...
>         viommu_page_size = 1UL << __ffs(viommu->pgsize_bitmap);
>         if (viommu_page_size > PAGE_SIZE) {
>                 dev_err(vdev->dev,
>                         "granule 0x%lx larger than system page size 0x%lx\n",
>                         viommu_page_size, PAGE_SIZE);
>                 return -ENODEV;
>         }
>
> Another question is: Presume 0x20010000 does mean only 512MB and 64KB
> is supported. Is host hva->hpa mapping ensured to be compatible with at least
> 64KB mapping? If host mmu only support 4KB mapping or other non-compatible
> with 0x20010000, will vfio_dma_map() fail?
the page size mask is retrieved with VFIO_IOMMU_GET_INFO uapi
which returns host vfio_iommu_type1 vfio_iommu->pgsize_bitmap. This
latter is initialized to host PAGE_MASK and later restricted on
vfio_iommu_type1_attach_group though the vfio_update_pgsize_bitmap() calls

so yes both IOMMU and CPU page size are garanteed to be compatible.

>
>> qemu: hardware error: vfio: DMA mapping failed, unable to continue
>>
>> This is due to the fact the IOMMU MR corresponding to the VFIO device
>> is enabled very late on domain attach, after the machine init.
>> The device reports a minimal 64kB page size but it is too late to be
>> applied. virtio_iommu_set_page_size_mask() fails and this causes
>> vfio_listener_region_add() to end up with hw_error();
>>
>> To work around this issue, we transiently enable the IOMMU MR on
>> machine init to collect the page size requirements and then restore
>> the bypass state.
>>
>> Fixes: 90519b9053 ("virtio-iommu: Add bypass mode support to assigned
>> device")
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> ---
>> include/hw/virtio/virtio-iommu.h |  2 ++
>> hw/virtio/virtio-iommu.c         | 30 ++++++++++++++++++++++++++++--
>> hw/virtio/trace-events           |  1 +
>> 3 files changed, 31 insertions(+), 2 deletions(-)
>>
>> diff --git a/include/hw/virtio/virtio-iommu.h b/include/hw/virtio/virtio-
>> iommu.h
>> index 2ad5ee320b..a93fc5383e 100644
>> --- a/include/hw/virtio/virtio-iommu.h
>> +++ b/include/hw/virtio/virtio-iommu.h
>> @@ -61,6 +61,8 @@ struct VirtIOIOMMU {
>>     QemuRecMutex mutex;
>>     GTree *endpoints;
>>     bool boot_bypass;
>> +    Notifier machine_done;
>> +    bool granule_frozen;
>> };
>>
>> #endif
>> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
>> index 1cd258135d..1eaf81bab5 100644
>> --- a/hw/virtio/virtio-iommu.c
>> +++ b/hw/virtio/virtio-iommu.c
>> @@ -24,6 +24,7 @@
>> #include "hw/virtio/virtio.h"
>> #include "sysemu/kvm.h"
>> #include "sysemu/reset.h"
>> +#include "sysemu/sysemu.h"
>> #include "qapi/error.h"
>> #include "qemu/error-report.h"
>> #include "trace.h"
>> @@ -1106,12 +1107,12 @@ static int
>> virtio_iommu_set_page_size_mask(IOMMUMemoryRegion *mr,
>>     }
>>
>>     /*
>> -     * After the machine is finalized, we can't change the mask anymore. If by
>> +     * Once the granule is frozen we can't change the mask anymore. If by
>>      * chance the hotplugged device supports the same granule, we can still
>>      * accept it. Having a different masks is possible but the guest will use
>>      * sub-optimal block sizes, so warn about it.
>>      */
>> -    if (phase_check(PHASE_MACHINE_READY)) {
>> +    if (s->granule_frozen) {
>>         int new_granule = ctz64(new_mask);
>>         int cur_granule = ctz64(cur_mask);
>>
>> @@ -1146,6 +1147,27 @@ static void virtio_iommu_system_reset(void
>> *opaque)
>>
>> }
>>
>> +static void virtio_iommu_freeze_granule(Notifier *notifier, void *data)
>> +{
>> +    VirtIOIOMMU *s = container_of(notifier, VirtIOIOMMU, machine_done);
>> +    bool boot_bypass = s->config.bypass;
>> +    int granule;
>> +
>> +    /*
>> +     * Transient IOMMU MR enable to collect page_size_mask requirement
>> +     * through memory_region_iommu_set_page_size_mask() called by
>> +     * VFIO region_add() callback
>> +     */
>> +    s->config.bypass = 0;
>> +    virtio_iommu_switch_address_space_all(s);
>> +    /* restore default */
>> +    s->config.bypass = boot_bypass;
>> +    virtio_iommu_switch_address_space_all(s);
>> +    s->granule_frozen = true;
>> +    granule = ctz64(s->config.page_size_mask);
>> +    trace_virtio_iommu_freeze_granule(BIT(granule));
>> +}
> It looks a bit heavy here just in order to get page_size_mask from host side.
> But maybe this is the only way with current interface.

the problem comes from the fact the regions are aliased due to the
bypass and vfio_listener_region_add() does not get a chance to be called
until the actual domain attach. So I do not see any other way to
transiently enable the region.

At least I could check if boot bypass is set before doing that dance. I
will respin with that.

Thanks

Eric
>
> Thanks
> Zhenzhong
>
>> +
>> static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
>> {
>>     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
>> @@ -1189,6 +1211,9 @@ static void virtio_iommu_device_realize(DeviceState
>> *dev, Error **errp)
>>         error_setg(errp, "VIRTIO-IOMMU is not attached to any PCI bus!");
>>     }
>>
>> +    s->machine_done.notify = virtio_iommu_freeze_granule;
>> +    qemu_add_machine_init_done_notifier(&s->machine_done);
>> +
>>     qemu_register_reset(virtio_iommu_system_reset, s);
>> }
>>
>> @@ -1198,6 +1223,7 @@ static void
>> virtio_iommu_device_unrealize(DeviceState *dev)
>>     VirtIOIOMMU *s = VIRTIO_IOMMU(dev);
>>
>>     qemu_unregister_reset(virtio_iommu_system_reset, s);
>> +    qemu_remove_machine_init_done_notifier(&s->machine_done);
>>
>>     g_hash_table_destroy(s->as_by_busptr);
>>     if (s->domains) {
>> diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
>> index 8f8d05cf9b..68b752e304 100644
>> --- a/hw/virtio/trace-events
>> +++ b/hw/virtio/trace-events
>> @@ -131,6 +131,7 @@ virtio_iommu_set_page_size_mask(const char *name,
>> uint64_t old, uint64_t new) "m
>> virtio_iommu_notify_flag_add(const char *name) "add notifier to mr %s"
>> virtio_iommu_notify_flag_del(const char *name) "del notifier from mr %s"
>> virtio_iommu_switch_address_space(uint8_t bus, uint8_t slot, uint8_t fn,
>> bool on) "Device %02x:%02x.%x switching address space (iommu
>> enabled=%d)"
>> +virtio_iommu_freeze_granule(uint64_t page_size_mask) "granule set to
>> 0x%"PRIx64
>>
>> # virtio-mem.c
>> virtio_mem_send_response(uint16_t type) "type=%" PRIu16
>> --
>> 2.38.1


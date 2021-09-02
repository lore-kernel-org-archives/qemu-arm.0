Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp12192lfb;
        Thu, 2 Sep 2021 00:46:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy1Zhf0qPR79EmN2Dc2cLdI5gTwj9g5ftVhUvGXAtpmgZbv+1wfxzP+D2Jc0d4BJzT7LUT3
X-Received: by 2002:a37:591:: with SMTP id 139mr1900083qkf.41.1630568801890;
        Thu, 02 Sep 2021 00:46:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630568801; cv=none;
        d=google.com; s=arc-20160816;
        b=lZiC/NwIG6Ict1Vdbyqly6aFR86tIM0gg9Z0vdmYwpHDkfyV5D5A3wQw0gX1h0q6WO
         ulXlPHF/zIE+/iJQT/FdD2JMbGuPkIrsMMgAPahyoI7j9sicKmcnYTk7knRqkVWwCztc
         ALEPYb/JJbdE8vzKTUC5lElbtWnU9ByLrCw1hF4gCcacnA4/Pd/P3WE1eS5nHw2VRMOW
         9c3kbhVztbxXAXoLdjcM+jr6wxuNnAEdkcjpa+JjZAtmsliPVn5PwxCuieyOZIeHiLg5
         xiztlsJaimIUsNd2uSs4PZ0ML/GMj0KAX6iI9DD2ILfDoEOI5ozu38zjMRdVdFGHrtss
         533w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=6xNRBD/MHXSOeBILMbKU6gbrDejkcEORuSaWQpjVy3E=;
        b=l4hGL9sfEzHI8YRoH3XKrZ3W0eQsPU6g+gvXSdh++U2zU1UG02z69zuDOrZVlP9BXL
         Z2HA4i4xbtmVhj1C2V7FV1ReLhLC2qEBCBjQjvW+XKAWuDwNc86PWUXXlKTogLRohoYv
         PrUyMXB/2gYv8iZnm+mgLgMDf3YAKthFzq2gLWeUNELiKHdjRolUN8rANbLU2HTyvsc3
         wkvnb1W3jYYqm8KkJvuc+GYpyVBcSjznKppoJVJ1orLB/2XdNcoGx7QK7WrMGzW2E7P1
         YV6L6tTSn4CKuSdJ6HUfrsU10CGa+wOUlDPY4y8vbSH9mE92TUtky4LoegEO21/Ygs75
         LuyA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=dsVU0qUe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l9si746529qkg.75.2021.09.02.00.46.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Sep 2021 00:46:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=dsVU0qUe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:32966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mLhQn-00049V-14
	for alex.bennee@linaro.org; Thu, 02 Sep 2021 03:46:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mLhQ6-000300-7e
 for qemu-arm@nongnu.org; Thu, 02 Sep 2021 03:45:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mLhQ2-0003jY-18
 for qemu-arm@nongnu.org; Thu, 02 Sep 2021 03:45:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630568752;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6xNRBD/MHXSOeBILMbKU6gbrDejkcEORuSaWQpjVy3E=;
 b=dsVU0qUedrNgdT8RDd/0HEcaLTsUKFjLS1kaLZvZoUe9/gD7cQf7fjsLQvE70/rymoEncc
 Ko9DGK7AHKqisRaGLBzgTA0Ug/3ozHhiKfOyFfCI0KWRJZ4KkXyGo6Nwm3PAl2nJxpZP/d
 Pe818otE6Ee6OjJ/X3AQybyoLBO0r00=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-414-JgvQqfYrNzGdugALJtOwdQ-1; Thu, 02 Sep 2021 03:45:51 -0400
X-MC-Unique: JgvQqfYrNzGdugALJtOwdQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 r126-20020a1c4484000000b002e8858850abso386545wma.0
 for <qemu-arm@nongnu.org>; Thu, 02 Sep 2021 00:45:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=6xNRBD/MHXSOeBILMbKU6gbrDejkcEORuSaWQpjVy3E=;
 b=QrYvipFieO6UHeaDItE7BY8VdVciw2PeL5D2/2Gkuk2OKsHJGSJ5AB8spHeBPBuylp
 MypREIG6Usvjz40al1IGSVbk7a5L9VA26l24LzTEN83A6aGazJ+g8ODC0w1p7fz3rKVO
 lyTNAd+bIaXz1+F3RDtVTJL1ALfmazKzHwK1/2dM9m5ziD9HJNbbtVdX/XX9mVDOe/62
 tRKAfsZwVdPx9W3oZiB/biM+GojinRk/L3u3UXcjeirFUkypAXxLnryosyZUIt4hYUA2
 bm5STeGGA29JbCvmpG/AvZdULAPcNH5HdxcRqzr5iKR+H5AkpAabPFoocOeyvCk6bNuV
 Rnqg==
X-Gm-Message-State: AOAM531ZZc1WNrfUxWBBCKAp4WqexhYFukQLbsjQAfOmAEdjROD/+tcw
 5r6bHr/I6oJrhLGSxwX1AiHwK1lFaDfCcapwD10QKoxMi81+XaQ4jR0xG2JU4+K+9vk4kKlA6t6
 J1c5UfPQ6rRhI
X-Received: by 2002:adf:e0cc:: with SMTP id m12mr2180352wri.62.1630568750206; 
 Thu, 02 Sep 2021 00:45:50 -0700 (PDT)
X-Received: by 2002:adf:e0cc:: with SMTP id m12mr2180338wri.62.1630568749993; 
 Thu, 02 Sep 2021 00:45:49 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id m11sm1036601wrz.28.2021.09.02.00.45.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Sep 2021 00:45:49 -0700 (PDT)
Subject: Re: [PATCH v5 4/4] hw/arm/virt: Add PL330 DMA controller and connect
 with SMMU v3
To: "Li, Chunming" <Chunming.Li@verisilicon.com>,
 chunming <chunming_li1234@163.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>
References: <1629878922-173270-1-git-send-email-chunming_li1234@163.com>
 <1629878922-173270-5-git-send-email-chunming_li1234@163.com>
 <756203c3-76ec-62ea-beca-91a245059536@redhat.com>
 <49C79B700B5D8F45B8EF0861B4EF3B3B0114302BA7@SHASXM03.verisilicon.com>
 <4ba6223c-f239-ccd2-e4a8-eb912dd4fb58@redhat.com>
 <49C79B700B5D8F45B8EF0861B4EF3B3B011430A69F@SHASXM03.verisilicon.com>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <19a5f05e-1984-095f-67de-a10f0acca947@redhat.com>
Date: Thu, 2 Sep 2021 09:45:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <49C79B700B5D8F45B8EF0861B4EF3B3B011430A69F@SHASXM03.verisilicon.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.029, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Reply-To: eric.auger@redhat.com
Cc: "Liu, Renwei" <Renwei.Liu@verisilicon.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "Wen,
 Jianxian" <Jianxian.Wen@verisilicon.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: p+N4wZBA7TCU

Hi,

On 9/2/21 8:46 AM, Li, Chunming wrote:
> Hi,
>
>> -----Original Message-----
>> From: Eric Auger [mailto:eric.auger@redhat.com]
>> Sent: Wednesday, September 01, 2021 6:23 PM
>> To: Li, Chunming; chunming; peter.maydell@linaro.org
>> Cc: qemu-arm@nongnu.org; qemu-devel@nongnu.org; Wen, Jianxian; Liu,
>> Renwei
>> Subject: Re: [PATCH v5 4/4] hw/arm/virt: Add PL330 DMA controller and
>> connect with SMMU v3
>>
>> Hi,
>>
>> On 9/1/21 8:53 AM, Li, Chunming wrote:
>>>> -----Original Message-----
>>>> From: Eric Auger [mailto:eric.auger@redhat.com]
>>>> Sent: Tuesday, August 31, 2021 10:37 PM
>>>> To: chunming; peter.maydell@linaro.org
>>>> Cc: qemu-arm@nongnu.org; qemu-devel@nongnu.org; Wen, Jianxian; Liu,
>>>> Renwei; Li, Chunming
>>>> Subject: Re: [PATCH v5 4/4] hw/arm/virt: Add PL330 DMA controller
>> and
>>>> connect with SMMU v3
>>>>
>>>> Hi Chunming,
>>>>
>>>> On 8/25/21 10:08 AM, chunming wrote:
>>>>> From: chunming <chunming.li@verisilicon.com>
>>>>>
>>>>> Add PL330 DMA controller to test SMMU v3 connection and function.
>>>>> The default SID for PL330 is 1 but we test other values, it works
>>>> well.
>>>> Is it just a patch for testing or would you want this to be applied
>>>> upstream too?
>>> I want this to be applied upstream.
>> Then I think you need to bring a proper motivation behind adding the
>> PL330 in machvirt besides a testing purpose.
>>>> This static SID allocation may not work in general as it may collide
>>>> with PCIe RID space?
>>> I think SMMU support different devices connected with 1 SMMU and
>> share same
>>> SID, even one is PCIe device and another one is peripheral platform
>> device.
>>> They can share 1 SMMU page table and get right data translation.
>> Indeed I cannot find any statement that a streamid couldn't be used by
>> more than 1 device behing the same smmu. However the 2 devices would be
>> associated to the same context.
>> I think this kind of mapping would be really platform specific and in
>> general it does not make sense to me. what the point using the same
>> context for the PL330 and a virtio-net-pci device for instance
>>>> My feeling is if we want to enable platform device support in the
>>>> SMMUv3
>>>> this should work for all platform devices doing DMA accesses and not
>>>> only for this PL330.
>>> Yes, these patches could support other platform devices connected
>> with SMMUv3.
>>> They only should follow PL330 example to connect their memory region
>> with SMMUv3
>>> peripheral IOMMU memory region.
>>>
>>>> I guess this should work with virtio platform devices and VFIO
>> platform
>>>> devices. How would you extend that work to those devices?
>>> I didn't get your point.
>>> I think virtio platform device should be Linux kernel SW part.
>>> These patches fixed the HW platform devices connection with SMMUv3.
>>> Could you help to list one virtio platform device then I can check?
>> After this series you would get a single platform device connected to
>> the SMMU, the PL330. What is the actual use case?
> The actual use case is this:
> 1. We will have a SoC which has SMMUv3 connected with our owned platform 
>    Video Encoder/Decoder and other IPs
> 2. We plan to use SMMUv3 stage 1 for continuous memory allocation
>    and stage 2 for memory protection
> 3. We are developing our own IP QEMU models now
> 4. These models will be connected with SMMUv3 in QEMU
> 5. We will use the QEMU board to development IP driver and ensure the driver 
>    can work well with Linux SMMU and IOMMU framework
I see and I understand your use case for system modeling purpose.

This raises few questions/comments though.
- supporting platform device protection from the vIOMMU/ARM makes sense
to me globally. But above use case does not justify (to me) the
introduction of PL330 in machvirt because it would be just for testing
purpose. Peter may validate/invalidate though. Instead I think you
should try to illustrate this feature with DMA capable platform devices
such virtio-net and virtio-block sysbus devices as a counterpart of
their PCIe flavour.
>
>> By the way what about the virtio-iommu which is also supported in DT
>> mode at the moment?
>>
>> Besides I meant virtio-net-pci and virtio-block-pci are protected by
>> the
>> SMMU. What does happen with their virtio-net-device and
>> virtio-block-device sysbus device counterparts? Then possibly you can
>> assign a VFIO platform device. You may want this latter to protected by
>> the SMMU. How would you handle that case (SMMU is not yet integrated
>> with VFIO but the virtio-iommu is).
> I get your point but I cannot give you a clear answer now. I didn't consider
> virtio-iommu before because our current use case doesn't need virtio-iommu.

I think you need to have consistency in the machvirt topology: with
current series the PL330 would be protected with vSMMUv3 and not with
virtio-iommu which does not seem acceptable to me. Either we need to
devise a way to individually specify which sysbus device is protected
and potentially also specify its streamid or all/none of them are.

Thanks

Eric
>
>> Thanks
>>
>> Eric
>>>> Thanks
>>>>
>>>> Eric
>>>>> Signed-off-by: chunming <chunming.li@verisilicon.com>
>>>>> ---
>>>>>  hw/arm/virt.c         | 92
>>>> ++++++++++++++++++++++++++++++++++++++++++-
>>>>>  include/hw/arm/virt.h |  1 +
>>>>>  2 files changed, 92 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>>>>> index c3fd30e071..8180e4a331 100644
>>>>> --- a/hw/arm/virt.c
>>>>> +++ b/hw/arm/virt.c
>>>>> @@ -143,6 +143,7 @@ static const MemMapEntry base_memmap[] = {
>>>>>      [VIRT_GIC_REDIST] =         { 0x080A0000, 0x00F60000 },
>>>>>      [VIRT_UART] =               { 0x09000000, 0x00001000 },
>>>>>      [VIRT_RTC] =                { 0x09010000, 0x00001000 },
>>>>> +    [VIRT_DMA] =                { 0x09011000, 0x00001000 },
>>>>>      [VIRT_FW_CFG] =             { 0x09020000, 0x00000018 },
>>>>>      [VIRT_GPIO] =               { 0x09030000, 0x00001000 },
>>>>>      [VIRT_SECURE_UART] =        { 0x09040000, 0x00001000 },
>>>>> @@ -188,6 +189,7 @@ static const int a15irqmap[] = {
>>>>>      [VIRT_GPIO] = 7,
>>>>>      [VIRT_SECURE_UART] = 8,
>>>>>      [VIRT_ACPI_GED] = 9,
>>>>> +    [VIRT_DMA] = 10,
>>>>>      [VIRT_MMIO] = 16, /* ...to 16 + NUM_VIRTIO_TRANSPORTS - 1 */
>>>>>      [VIRT_GIC_V2M] = 48, /* ...to 48 + NUM_GICV2M_SPIS - 1 */
>>>>>      [VIRT_SMMU] = 74,    /* ...to 74 + NUM_SMMU_IRQS - 1 */
>>>>> @@ -205,7 +207,7 @@ static const char *valid_cpus[] = {
>>>>>  };
>>>>>
>>>>>  static const uint16_t smmuv3_sidmap[] = {
>>>>> -
>>>>> +    [VIRT_DMA] = 1,
>>>>>  };
>>>>>
>>>>>  static bool cpu_type_valid(const char *cpu)
>>>>> @@ -793,6 +795,92 @@ static void create_uart(const VirtMachineState
>>>> *vms, int uart,
>>>>>      g_free(nodename);
>>>>>  }
>>>>>
>>>>> +static void create_dma(const VirtMachineState *vms)
>>>>> +{
>>>>> +    int i;
>>>>> +    char *nodename;
>>>>> +    hwaddr base = vms->memmap[VIRT_DMA].base;
>>>>> +    hwaddr size = vms->memmap[VIRT_DMA].size;
>>>>> +    int irq = vms->irqmap[VIRT_DMA];
>>>>> +    int sid = vms->sidmap[VIRT_DMA];
>>>>> +    const char compat[] = "arm,pl330\0arm,primecell";
>>>>> +    const char irq_names[] =
>>>> "abort\0dma0\0dma1\0dma2\0dma3\0dma4\0dma5\0dma6\0dma7";
>>>>> +    DeviceState *dev;
>>>>> +    MachineState *ms = MACHINE(vms);
>>>>> +    SysBusDevice *busdev;
>>>>> +    DeviceState *smmuv3_dev;
>>>>> +    SMMUState *smmuv3_sys;
>>>>> +    Object *smmuv3_memory;
>>>>> +
>>>>> +    dev = qdev_new("pl330");
>>>>> +
>>>>> +    if (vms->iommu == VIRT_IOMMU_SMMUV3 && vms->iommu_phandle) {
>>>>> +        smmuv3_dev = vms->smmuv3;
>>>>> +        smmuv3_sys = ARM_SMMU(smmuv3_dev);
>>>>> +        g_autofree char *memname = g_strdup_printf("%s-peri-
>> %d[0]",
>>>>> +                                                   smmuv3_sys-
>>>>> mrtypename,
>>>>> +                                                   sid);
>>>>> +
>>>>> +        smmuv3_memory =
>> object_property_get_link(OBJECT(smmuv3_dev),
>>>>> +                                memname, &error_abort);
>>>>> +
>>>>> +        object_property_set_link(OBJECT(dev), "memory",
>>>>> +                                 OBJECT(smmuv3_memory),
>>>>> +                                 &error_fatal);
>>>>> +    } else {
>>>>> +        object_property_set_link(OBJECT(dev), "memory",
>>>>> +                                 OBJECT(get_system_memory()),
>>>>> +                                 &error_fatal);
>>>>> +    }
>>>>> +
>>>>> +    qdev_prop_set_uint8(dev, "num_chnls",  8);
>>>>> +    qdev_prop_set_uint8(dev, "num_periph_req",  4);
>>>>> +    qdev_prop_set_uint8(dev, "num_events",  16);
>>>>> +    qdev_prop_set_uint8(dev, "data_width",  64);
>>>>> +    qdev_prop_set_uint8(dev, "wr_cap",  8);
>>>>> +    qdev_prop_set_uint8(dev, "wr_q_dep",  16);
>>>>> +    qdev_prop_set_uint8(dev, "rd_cap",  8);
>>>>> +    qdev_prop_set_uint8(dev, "rd_q_dep",  16);
>>>>> +    qdev_prop_set_uint16(dev, "data_buffer_dep",  256);
>>>>> +
>>>>> +    busdev = SYS_BUS_DEVICE(dev);
>>>>> +    sysbus_realize_and_unref(busdev, &error_fatal);
>>>>> +    sysbus_mmio_map(busdev, 0, base);
>>>>> +
>>>>> +    for (i = 0; i < 9; ++i) {
>>>>> +        sysbus_connect_irq(busdev, i, qdev_get_gpio_in(vms->gic,
>> irq
>>>> + i));
>>>>> +    }
>>>>> +
>>>>> +    nodename = g_strdup_printf("/pl330@%" PRIx64, base);
>>>>> +    qemu_fdt_add_subnode(ms->fdt, nodename);
>>>>> +    qemu_fdt_setprop(ms->fdt, nodename, "compatible", compat,
>>>> sizeof(compat));
>>>>> +    qemu_fdt_setprop_sized_cells(ms->fdt, nodename, "reg",
>>>>> +                                 2, base, 2, size);
>>>>> +    qemu_fdt_setprop_cells(ms->fdt, nodename, "interrupts",
>>>>> +                    GIC_FDT_IRQ_TYPE_SPI, irq,
>>>> GIC_FDT_IRQ_FLAGS_LEVEL_HI,
>>>>> +                    GIC_FDT_IRQ_TYPE_SPI, irq + 1,
>>>> GIC_FDT_IRQ_FLAGS_LEVEL_HI,
>>>>> +                    GIC_FDT_IRQ_TYPE_SPI, irq + 2,
>>>> GIC_FDT_IRQ_FLAGS_LEVEL_HI,
>>>>> +                    GIC_FDT_IRQ_TYPE_SPI, irq + 3,
>>>> GIC_FDT_IRQ_FLAGS_LEVEL_HI,
>>>>> +                    GIC_FDT_IRQ_TYPE_SPI, irq + 4,
>>>> GIC_FDT_IRQ_FLAGS_LEVEL_HI,
>>>>> +                    GIC_FDT_IRQ_TYPE_SPI, irq + 5,
>>>> GIC_FDT_IRQ_FLAGS_LEVEL_HI,
>>>>> +                    GIC_FDT_IRQ_TYPE_SPI, irq + 6,
>>>> GIC_FDT_IRQ_FLAGS_LEVEL_HI,
>>>>> +                    GIC_FDT_IRQ_TYPE_SPI, irq + 7,
>>>> GIC_FDT_IRQ_FLAGS_LEVEL_HI,
>>>>> +                    GIC_FDT_IRQ_TYPE_SPI, irq + 8,
>>>> GIC_FDT_IRQ_FLAGS_LEVEL_HI);
>>>>> +
>>>>> +    qemu_fdt_setprop(ms->fdt, nodename, "interrupt-names",
>>>> irq_names,
>>>>> +                     sizeof(irq_names));
>>>>> +
>>>>> +    qemu_fdt_setprop_cell(ms->fdt, nodename, "clocks", vms-
>>>>> clock_phandle);
>>>>> +    qemu_fdt_setprop_string(ms->fdt, nodename, "clock-names",
>>>> "apb_pclk");
>>>>> +
>>>>> +    if (vms->iommu == VIRT_IOMMU_SMMUV3 && vms->iommu_phandle) {
>>>>> +        qemu_fdt_setprop_cells(ms->fdt, nodename, "iommus",
>>>>> +                               vms->iommu_phandle, sid);
>>>>> +        qemu_fdt_setprop(ms->fdt, nodename, "dma-coherent", NULL,
>>>> 0);
>>>>> +    }
>>>>> +
>>>>> +    g_free(nodename);
>>>>> +}
>>>>>  static void create_rtc(const VirtMachineState *vms)
>>>>>  {
>>>>>      char *nodename;
>>>>> @@ -2081,6 +2169,8 @@ static void machvirt_init(MachineState
>>>> *machine)
>>>>>      create_pcie(vms);
>>>>>
>>>>> +    create_dma(vms);
>>>>> +
>>>>>      if (has_ged && aarch64 && firmware_loaded &&
>>>> virt_is_acpi_enabled(vms)) {
>>>>>          vms->acpi_dev = create_acpi_ged(vms);
>>>>>      } else {
>>>>> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
>>>>> index d3402a43dd..f307b26587 100644
>>>>> --- a/include/hw/arm/virt.h
>>>>> +++ b/include/hw/arm/virt.h
>>>>> @@ -72,6 +72,7 @@ enum {
>>>>>      VIRT_UART,
>>>>>      VIRT_MMIO,
>>>>>      VIRT_RTC,
>>>>> +    VIRT_DMA,
>>>>>      VIRT_FW_CFG,
>>>>>      VIRT_PCIE,
>>>>>      VIRT_PCIE_MMIO,


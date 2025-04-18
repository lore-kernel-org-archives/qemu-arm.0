Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp447489njd;
        Fri, 18 Apr 2025 13:35:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXhxCBSvL29r/qeUteVSDiylNOpsHE5ln0F3iskFcmbVzOndFBXST9mKC06Esh3Tm9gUau5YqZCXqYnMA==@linaro.org
X-Google-Smtp-Source: AGHT+IEdgaL86jBts/O2oESwe9k76JFavM4a4tD9U60y2MwGWPgzJkO/O5kwtf5z6GaZzQdrHwGu
X-Received: by 2002:a05:6214:20ee:b0:6f0:e2e1:50b4 with SMTP id 6a1803df08f44-6f2c4665552mr57610456d6.35.1745008530865;
        Fri, 18 Apr 2025 13:35:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745008530; cv=none;
        d=google.com; s=arc-20240605;
        b=Av7/nSsv2JmxGtdJsw5oSQd+gOapzRRa4qMDkHBPytCiQq7XcIwh71RQ/RBWttN1SZ
         R2Fg8BCNnusNXNVZ6GkfSn2r9C48og/vqCpyuljWoWJLFAND9Gjz5teRUzxyyqbR/7E7
         Ee26njA6aZN8XE+bYMBDpFPBKlm/h0pCwkik87SwwGZbnHVCUWG2tc5BhiOE50F7po2N
         8N5UCjvvVod9zyGyWphPmqd3pmK/U2RR9wkaN7TD++ycQrHI/IdG/zWc59hhfoifKlTe
         ibyvlQmvmpk3u1wvYBCkmmauAaUwlsK4ZexTYZB21RXpise/NHT8iZUTgQPWI8vZJJt9
         1grA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=RJnY3gqdMxXaWcJ+S7r4EWTj/9mQDOVVIQ05PmRBz0U=;
        fh=qxofbV/I4xUaBHh9eyv4hSzr1fjW/Cbonx3mspDzX4U=;
        b=a7g/67PakHhfpKXRYd4j2SMyIOqAEpXbJmIjE+7LuPGQruQchnpb3ozvk7cUfCoW8Q
         QzT8ps4re/xKNI3DdbZznFmcAbC6+zzXH5zYV0f+ARp4c0XaEdVezwXJOtWmaqyQSTbO
         dKcbh/h7HCZMuVu1yhLFLrQXodogvCL9XVzDLDumzTNzhlE3CmoL2hkLMVnxwr46k1Ax
         UHmizOPcFjM7ZwfbCAbn1Lxqg7aQfEyAQvulg/PF0hZE9Ly1S0ZYpGmpZvzHjHDwYXtc
         Zdvz5V9dgZoisxZ/AQ6a7DpUovJCpSqeCnzNuiNLqI4y3qr79QSm29qaZrWlZaZDJ4qS
         rElw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YB1jACgd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f2c2c2d4b6si27754186d6.461.2025.04.18.13.35.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Apr 2025 13:35:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YB1jACgd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u5sQY-0006NH-IE; Fri, 18 Apr 2025 16:35:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ddutile@redhat.com>)
 id 1u5sQX-0006Mb-9i
 for qemu-arm@nongnu.org; Fri, 18 Apr 2025 16:35:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ddutile@redhat.com>)
 id 1u5sQU-0006s8-6C
 for qemu-arm@nongnu.org; Fri, 18 Apr 2025 16:35:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1745008505;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RJnY3gqdMxXaWcJ+S7r4EWTj/9mQDOVVIQ05PmRBz0U=;
 b=YB1jACgdkKf07UGx0HhEQMIiV8WHw0iIQNaQCOnBUlnkAYGPM+bUKUGoBC2qZ8A/lu+BFS
 hGazqt7cVhTYz82WK8y6RcCrXn380cSbYjsAtC4ekW1k60li5eQjZ6d+TTQFpv8FB8oH6S
 ydG98NAv2LB/WOtRAOAAFLTx3sAiEHA=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-216-7vXuQ44WMOS0K0M5tmz2bw-1; Fri, 18 Apr 2025 16:35:04 -0400
X-MC-Unique: 7vXuQ44WMOS0K0M5tmz2bw-1
X-Mimecast-MFC-AGG-ID: 7vXuQ44WMOS0K0M5tmz2bw_1745008503
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-476a44cec4cso34383331cf.2
 for <qemu-arm@nongnu.org>; Fri, 18 Apr 2025 13:35:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745008503; x=1745613303;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RJnY3gqdMxXaWcJ+S7r4EWTj/9mQDOVVIQ05PmRBz0U=;
 b=qAtlIRrSF//RZOmsdItC62KaK/R10F3NoV5fVwQhtrGgCqFzPVqQFBgHC/HZBOKIea
 ssB9C7MB0rjab9AFZQIZpF9B2XPUFvlyT25gHCE9OsAJufv/QabJx0e368NF95lSOSVb
 /kdDzcQ/441piHUK74jYOEAC4aJliNbKLr5KML81fpn7ceoSNrhPn9mo4LnL66SSKGwC
 +cNiBAQqS5NYlmBOh3Y865q08q9ZgFQg9ibM9U+ItGrkxZRllB/hnn2i7Sbs6R0Vnu3A
 0vAbvj8vvCYboua/Ju82SK/MjDhewwCFqIeqNj612JoQdDWMAfKiMu5BFNmC7//fzIt6
 zh1A==
X-Gm-Message-State: AOJu0YzDZ7bPIRrrZuwLsk/XO08Nbd4i3cFQDIxdMUDV5+1Din2uxSyf
 m1NaKOFKQaoYqlB0l9WuS95gQMw8FxpSD6zqb/5Lv2YfuSpaqsc3wtm6ahSlfYQRoDpJlEaYNEv
 ZgUUFuKh9DONTAME9dhJXWxnxxOnSegLUJOhXYMughi4YI569Lw==
X-Gm-Gg: ASbGncs+ml3oYwq4qeuDasnszZHlwbaLY4Zr66BJYCE1et6+Scrnmu2ZGYdBJwdB4x2
 hJYSiUZusMylpJ6Sptai7QoBV/WstYYylPhUi/GzQCUJP1OM94b2lKU4ZX2ej5Uur/RMnJZ/XYH
 TVFwkhjpcO7YQbePydZaTy4r+M+juCyffQKHXYx3AKO3pnDAev0EDf6KaSB+PuG38jVphTGvfBK
 jXcJz6eVMQMiu3qPCveH1PsXen/FqkBHq/wqLAXt+h97vpvVPpn++/iFAnUBGGT9I276AdW9LYF
 v0SSaVdKfh2W
X-Received: by 2002:a05:622a:13d0:b0:47a:e803:d7f with SMTP id
 d75a77b69052e-47aec35b765mr70018201cf.4.1745008503676; 
 Fri, 18 Apr 2025 13:35:03 -0700 (PDT)
X-Received: by 2002:a05:622a:13d0:b0:47a:e803:d7f with SMTP id
 d75a77b69052e-47aec35b765mr70017841cf.4.1745008503352; 
 Fri, 18 Apr 2025 13:35:03 -0700 (PDT)
Received: from [192.168.40.164] ([70.105.235.240])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-47ae9c188a8sm14007101cf.8.2025.04.18.13.35.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Apr 2025 13:35:02 -0700 (PDT)
Message-ID: <317515f1-6cc2-4768-9a5e-8dd5dece9079@redhat.com>
Date: Fri, 18 Apr 2025 16:34:26 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] hw/arm/virt-acpi-build: Update IORT for multiple
 smmuv3 devices
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Nicolin Chen <nicolinc@nvidia.com>
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "jgg@nvidia.com" <jgg@nvidia.com>, "berrange@redhat.com"
 <berrange@redhat.com>, "nathanc@nvidia.com" <nathanc@nvidia.com>,
 "mochs@nvidia.com" <mochs@nvidia.com>,
 "smostafa@google.com" <smostafa@google.com>, Linuxarm <linuxarm@huawei.com>,
 "Wangzhou (B)" <wangzhou1@hisilicon.com>,
 jiangkunkun <jiangkunkun@huawei.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>
References: <20250415081104.71708-1-shameerali.kolothum.thodi@huawei.com>
 <20250415081104.71708-3-shameerali.kolothum.thodi@huawei.com>
 <Z/8vzf/q24sZOdBG@Asurada-Nvidia>
 <8a76f317aa3048bfb7262b670629f43b@huawei.com>
From: Donald Dutile <ddutile@redhat.com>
In-Reply-To: <8a76f317aa3048bfb7262b670629f43b@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PefoMKEYq3hToJR-mws2TwE_oXhn1_rfXvAONH8evjA_1745008503
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ddutile@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 52Y3cY4SSqm7



On 4/16/25 1:38 AM, Shameerali Kolothum Thodi wrote:
> 
> 
>> -----Original Message-----
>> From: Nicolin Chen <nicolinc@nvidia.com>
>> Sent: Wednesday, April 16, 2025 5:19 AM
>> To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
>> Cc: qemu-arm@nongnu.org; qemu-devel@nongnu.org;
>> eric.auger@redhat.com; peter.maydell@linaro.org; jgg@nvidia.com;
>> ddutile@redhat.com; berrange@redhat.com; nathanc@nvidia.com;
>> mochs@nvidia.com; smostafa@google.com; Linuxarm
>> <linuxarm@huawei.com>; Wangzhou (B) <wangzhou1@hisilicon.com>;
>> jiangkunkun <jiangkunkun@huawei.com>; Jonathan Cameron
>> <jonathan.cameron@huawei.com>; zhangfei.gao@linaro.org
>> Subject: Re: [PATCH 2/5] hw/arm/virt-acpi-build: Update IORT for multiple
>> smmuv3 devices
>>
>> On Tue, Apr 15, 2025 at 09:11:01AM +0100, Shameer Kolothum wrote:
>>> +static int get_smmuv3_device(Object *obj, void *opaque)
>>> +{
>>> +    GArray *sdev_blob = opaque;
>>> +    int min_bus, max_bus;
>>> +    VirtMachineState *vms;
>>> +    PlatformBusDevice *pbus;
>>> +    SysBusDevice *sbdev;
>>> +    SMMUv3Device sdev;
>>> +    hwaddr base;
>>> +    int irq;
>>> +    PCIBus *bus;
>>
>> In a reverse christmas tree order? Or we could at least group
>> those similar types together.
> 
> Yeah. Reverse will look better I guess.
>>
>>> +    vms = VIRT_MACHINE(qdev_get_machine());
>>> +    pbus = PLATFORM_BUS_DEVICE(vms->platform_bus_dev);
>>> +    sbdev = SYS_BUS_DEVICE(obj);
>>> +    base = platform_bus_get_mmio_addr(pbus, sbdev, 0);
>>> +    irq = platform_bus_get_irqn(pbus, sbdev, 0);
>>> +
>>> +    base += vms->memmap[VIRT_PLATFORM_BUS].base;
>>> +    irq += vms->irqmap[VIRT_PLATFORM_BUS];
>>> +
>>> +    pci_bus_range(bus, &min_bus, &max_bus);
>>> +    sdev.smmu_idmap.input_base = min_bus << 8;
>>> +    sdev.smmu_idmap.id_count = (max_bus - min_bus + 1) << 8;
>>> +    sdev.base = base;
>>> +    sdev.irq = irq + ARM_SPI_BASE;
>>
>> Hmm, these base/irq local variables don't look necessary.
>>
>>> +    g_array_append_val(sdev_blob, sdev);
>>> +    return 0;
>>> +}
>>> +
>>>   /*
>>>    * Input Output Remapping Table (IORT)
>>>    * Conforms to "IO Remapping Table System Software on ARM
>> Platforms",
>>> @@ -275,25 +330,42 @@ static void
>>>   build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState
>> *vms)
>>>   {
>>>       int i, nb_nodes, rc_mapping_count;
>>> -    size_t node_size, smmu_offset = 0;
>>> +    size_t node_size, *smmu_offset = NULL;
>>>       AcpiIortIdMapping *idmap;
>>> +    int num_smmus = 0;
>>>       uint32_t id = 0;
>>>       GArray *smmu_idmaps = g_array_new(false, true,
>> sizeof(AcpiIortIdMapping));
>>>       GArray *its_idmaps = g_array_new(false, true,
>> sizeof(AcpiIortIdMapping));
>>> +    GArray *smmuv3_devices = g_array_new(false, true,
>> sizeof(SMMUv3Device));
>>>
>>>       AcpiTable table = { .sig = "IORT", .rev = 3, .oem_id = vms->oem_id,
>>>                           .oem_table_id = vms->oem_table_id };
>>>       /* Table 2 The IORT */
>>>       acpi_table_begin(&table, table_data);
>>>
>>> -    if (vms->iommu == VIRT_IOMMU_SMMUV3) {
>>> -        AcpiIortIdMapping next_range = {0};
>>> -
>>> +    nb_nodes = 2; /* RC, ITS */
>>> +    if (vms->iommu == VIRT_IOMMU_SMMUV3_DEV) {
>>> +        object_child_foreach_recursive(object_get_root(),
>>> +                                       get_smmuv3_device, smmuv3_devices);
>>> +         /* Sort the smmuv3-devices by smmu idmap input_base */
>>> +        g_array_sort(smmuv3_devices, smmuv3_dev_idmap_compare);
>>> +        /*  Fill smmu idmap from sorted smmuv3 devices array */
>>> +        for (i = 0; i < smmuv3_devices->len; i++) {
>>> +            SMMUv3Device *s = &g_array_index(smmuv3_devices,
>> SMMUv3Device, i);
>>> +            g_array_append_val(smmu_idmaps, s->smmu_idmap);
>>> +        }
>>> +        num_smmus = smmuv3_devices->len;
>>> +    } else if (vms->iommu == VIRT_IOMMU_SMMUV3) {
>>>           object_child_foreach_recursive(object_get_root(),
>>>                                          iort_host_bridges, smmu_idmaps);
>>>
>>>           /* Sort the smmu idmap by input_base */
>>>           g_array_sort(smmu_idmaps, iort_idmap_compare);
>>
>> VIRT_IOMMU_SMMUV3 seems to fit the struct SMMUv3Device very well,
>> given that it has base, irq, and smmu_idmaps too?
> 
> One difference though is the legacy VIRT_IOMMU_SMMUV3 one is a global
> Machine wide one nad can be associated with multiple PCIe root complexes
> which will result in smmu_idmaps array. See the iort_host_bridges() fn.
> 
Didn't quite follow this logic; shouldn't the iort be built for devices
tagged for a virt-iommu or dependent on a pcie rp (bus num/bus-num range of an RP)?
Thus, it's just an IORT with one or more IORT nodes?
I could see how the current iort_host_bridge() may need a revision to work with -device arm-smmu configs.

Which would bring me back to my earlier question, and it's likely tied to this IORT construction:
  -- can you have both types defined in a machine model?


>>
>> Maybe we could generalize the struct SMMUv3Device to store both
>> cases. Perhaps just SMMUv3AcpiInfo? And then ..
> 
I didn't follow 'SMMUv3AcpiInfo' since I don't see that in current qemu tree;
or is the statement trying to say its a 'mere matter of the proper acpi info generation'?

> Could do. But then you have to have  a smmu_idmaps array and then check
> the length of it to cover legacy SMMUv3 case I guess.
> 
Aren't they going to be different idmaps for different IORT nodes?

>   > > @@ -341,10 +413,20 @@ build_iort(GArray *table_data, BIOSLinker
>> *linker, VirtMachineState *vms)
>>>       /* GIC ITS Identifier Array */
>>>       build_append_int_noprefix(table_data, 0 /* MADT translation_id */,
>> 4);
>>>
>>> -    if (vms->iommu == VIRT_IOMMU_SMMUV3) {
>>> -        int irq =  vms->irqmap[VIRT_SMMU] + ARM_SPI_BASE;
>>> +    for (i = 0; i < num_smmus; i++) {
>>> +        hwaddr base;
>>> +        int irq;
>>> +
>>> +        if (vms->iommu == VIRT_IOMMU_SMMUV3_DEV) {
>>> +            SMMUv3Device *s = &g_array_index(smmuv3_devices,
>> SMMUv3Device, i);
>>> +            base = s->base;
>>> +            irq = s->irq;
>>> +        } else {
>>> +            base = vms->memmap[VIRT_SMMU].base;
>>> +            irq = vms->irqmap[VIRT_SMMU] + ARM_SPI_BASE;
>>> +        }
>>
>> .. we wouldn't need two paths here.
>>
>>> @@ -404,15 +486,26 @@ build_iort(GArray *table_data, BIOSLinker
>> *linker, VirtMachineState *vms)
>>>       build_append_int_noprefix(table_data, 0, 3); /* Reserved */
>>>
>>>       /* Output Reference */
>>> -    if (vms->iommu == VIRT_IOMMU_SMMUV3) {
>>> +    if (num_smmus) {
>>>           AcpiIortIdMapping *range;
>>>
>>>           /* translated RIDs connect to SMMUv3 node: RC -> SMMUv3 -> ITS
>> */
>>>           for (i = 0; i < smmu_idmaps->len; i++) {
>>> +            size_t offset;
>>> +            if (vms->iommu == VIRT_IOMMU_SMMUV3_DEV) {
>>> +                offset = smmu_offset[i];
>>> +            } else {
>>> +                /*
>>> +                 * For legacy VIRT_IOMMU_SMMUV3 case, one machine wide
>>> +                 * smmuv3 may have multiple smmu_idmaps.
>>> +                 */
>>> +                offset = smmu_offset[0];
>>> +            }
>>
>> And I think we can eliminate this too if we stuff an smmu_offset
>> in struct AcpiIortIdMapping ..
>>
>>>               range = &g_array_index(smmu_idmaps, AcpiIortIdMapping, i);
>>>               /* output IORT node is the smmuv3 node */
>>>               build_iort_id_mapping(table_data, range->input_base,
>>> -                                  range->id_count, smmu_offset);
>>> +                                  range->id_count, offset);
>>
>> ... and here it would be range->offset.
> 
> I will give it a try and if that simplifies things will include it in next respin.
> 
> Thanks,
> Shameer
> 


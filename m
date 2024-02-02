Received: by 2002:a17:907:7006:b0:a35:eedd:80b0 with SMTP id wr6csp774696ejb;
        Fri, 2 Feb 2024 00:50:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFjmzIEJGvln0YesI9vNmcTy2gqBY8tLR1jIYspeudsLwv2CErrUtQ0kP0dmUOXDEEwS1bv
X-Received: by 2002:a81:77d6:0:b0:5d3:9f2d:658c with SMTP id s205-20020a8177d6000000b005d39f2d658cmr6890353ywc.24.1706863799986;
        Fri, 02 Feb 2024 00:49:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706863799; cv=none;
        d=google.com; s=arc-20160816;
        b=CY+DNGeJrC9I5a8MiAJRKFNKKmii9Cs85EICSs47yRltktWfXPyG6Mivjd0ag5x+Bx
         84POCWk7A9Ed89JV/Plyn53BRVmPeikj6l+TwHiRlk5FaMjSLecp+N4l86YGbMzn8vsL
         EpC0aZ8gqW5NqqDo27CQmWKpUdIyGJmMBRY+9GTj4GJzG9qUVjvKv+FS7HT+RpRbPmCO
         VgWJdKb8//I570fyrEwzR6ygjCFkAjsMQltyFvUvqNYDHhFZvRNcDQ8Umq/TnSUlLFI3
         UFRQvTAY65/tZa5MPL649N8o5CCkqfb4ZFIbTxyTSGayh0CipzYFH9/Di4lKnaTvvJPG
         OB+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=lomaNRfIeKNH8mTcILDlIKpT2UG2+kWf+qWtwQ53gAk=;
        fh=IbPVxdBQZy9bocRLDUxlRY9zTxiXdIcBMVGlkdB6fDc=;
        b=CylQF+YF/PERJy9Hg4v2yd2LtrLqnfqXkJPXMzBis6pDq5xGBYAwYeixavdkqUtfRi
         l6If/srvIh1ZT7yxdNYM7EF4QcEIlc48n8QCfTJaBU7LuSeWbHxVqqeCJ/27mIUVGZCr
         yc/Klc7fQsmoJFzFPB1ZDCFauEPhQNcCoC43nNeP9AZgw67emNSrTU1Yx8Ndp2F6eOP7
         tPjxKqOCuKkCGTMsTjALHiau4beLki4DgEWxyDTBTpc30ahh4TyciY/f71NvodIW3kSB
         Loqb/i5bXLoNYLKRcVpAkeJN02Wg3UDeRfkPjFCEsTc0XHZXoTQGsgIV3n7LodhftZu2
         PehA==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YyXoPAF3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Forwarded-Encrypted: i=0; AJvYcCWu/2bxats6AZFHyCwzZqJT0mCtg8FNhbHu73X3H2Xfq0tpkEoKA3VWoVIB6zpfeOuVfVQdjp+6+7wQTUKUj2r0CJmT0h09
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t6-20020ac85886000000b0042bed440242si1488746qta.660.2024.02.02.00.49.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Feb 2024 00:49:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YyXoPAF3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rVpEz-00015s-CR; Fri, 02 Feb 2024 03:49:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rVpEx-000155-G6
 for qemu-arm@nongnu.org; Fri, 02 Feb 2024 03:49:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rVpEo-00034b-JH
 for qemu-arm@nongnu.org; Fri, 02 Feb 2024 03:49:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706863769;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lomaNRfIeKNH8mTcILDlIKpT2UG2+kWf+qWtwQ53gAk=;
 b=YyXoPAF3K3+JwYX+WR1OrntMZAS60gRjtPh/R4z+1OW7XHeEmFtwLYo8i40GZIiwKZNmTD
 meupRqWs6hIfAEgAkGMlgfthbh9ZydiI0/dab0tEw47M8XXltlWP892YUoZH5XoxeOhWIJ
 SvfCJwqN8oN4asbfRsOrHv/LkofTFDk=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-203-UvH2_uNMPeSfXb71d6ddMQ-1; Fri, 02 Feb 2024 03:49:27 -0500
X-MC-Unique: UvH2_uNMPeSfXb71d6ddMQ-1
Received: by mail-lf1-f69.google.com with SMTP id
 2adb3069b0e04-511393ca9efso156287e87.3
 for <qemu-arm@nongnu.org>; Fri, 02 Feb 2024 00:49:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706863766; x=1707468566;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lomaNRfIeKNH8mTcILDlIKpT2UG2+kWf+qWtwQ53gAk=;
 b=AN9F7Sq4/1wSPvFWX3OLpvSudhJwpx9WCRhwu4XYPuNPq7x/VNWzbA2ngk6FPiXQwJ
 sTVXxPt/Au86Bqjg7fkc5KC0vw/kS4hEvKaaLxxMZ/HLQOqCDIlhSSMbxq66UZfEK6/C
 qVmaK3K/tcAyCv/Sg2K31JxTlvvL7aUbkzDJSqIN9XyYo8d4eF+gyVF3MSaYg84RNP2T
 UkXYU6Stj0NoS71WkSZqdCnjwUuxNCEdLqZNvcz8ibPtLrW7/xrQahmJr+EMhs47PbGC
 aWnENfyfW+asdXqxoNGBq9bPDI17hgPjxyqUw8DHHxlaGzc7wG5FMrcLmIwpEyk3jVnu
 lqaQ==
X-Gm-Message-State: AOJu0YwtmA2sdqVZdQ2JQdbZ4A7baILFHDZ2tL8OWjRe/LlFfa1yHOaz
 YFJB4+v+JtBFHX8TBtWyySZYXf/vsgbGzRMGGhBuzw3ZQaUpeJpXn3PnaH7HJhdBvB00XCwWFc/
 ac+BVs/YCexGUvEcrJdPxIO4BjWzlQoJzqsXI3CKhnniYvKoY3Q==
X-Received: by 2002:a19:6912:0:b0:510:f55:fbf8 with SMTP id
 e18-20020a196912000000b005100f55fbf8mr839678lfc.68.1706863766430; 
 Fri, 02 Feb 2024 00:49:26 -0800 (PST)
X-Received: by 2002:a19:6912:0:b0:510:f55:fbf8 with SMTP id
 e18-20020a196912000000b005100f55fbf8mr839664lfc.68.1706863765991; 
 Fri, 02 Feb 2024 00:49:25 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCXLjZiBG2E4wF/5dqDnlrgYu0lAQhR35MNKPK6JXtabl3vhVxyIFxhoLooNCO2vwhJBSrII6nMxgt2VOdJPGi0RL4TLKhEHYvPfSbPK9r08oMwnx+GayXQWUG/Awu/XQvtFxpYV1HrH4YbSwA50hq2JZQaTtwYkAMOyfaljCqlYZfU75wYkqHUz5wx9ch0m2uUiIMa1lKdcLdszk4p//yzX3gkJlbh/W2kqtYUTysVfVzHaQpjjDWGK+a/sL4TIaP/ffDed76Twke9uOlaWW8g74uYtt8Nwmc8h3Cy/Z5zt+yOKmGsv9NYSsPM5CJVBU/apP6+bQpmNVRsXnmAV1w==
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 a29-20020a056512021d00b005100ec1e3d2sm241586lfo.215.2024.02.02.00.49.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Feb 2024 00:49:25 -0800 (PST)
Message-ID: <7ecef9bc-e263-447a-9883-49e17a7f3115@redhat.com>
Date: Fri, 2 Feb 2024 09:49:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] hw: Set virtio-iommu aw-bits default value on
 pc_q35_9.0 and arm virt
To: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>,
 "eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "jean-philippe@linaro.org" <jean-philippe@linaro.org>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "yanghliu@redhat.com" <yanghliu@redhat.com>
Cc: "mst@redhat.com" <mst@redhat.com>, "clg@redhat.com" <clg@redhat.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>
References: <20240201163324.564525-1-eric.auger@redhat.com>
 <20240201163324.564525-4-eric.auger@redhat.com>
 <SJ0PR11MB67443F341958AD061E9A144D92422@SJ0PR11MB6744.namprd11.prod.outlook.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <SJ0PR11MB67443F341958AD061E9A144D92422@SJ0PR11MB6744.namprd11.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.292,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: U8n9MHvQT2Xa

Hi Zhenzhong,

On 2/2/24 07:51, Duan, Zhenzhong wrote:
> Hi Eric,
>
>> -----Original Message-----
>> From: Eric Auger <eric.auger@redhat.com>
>> pc_q35_9.0 and arm virt
>>
>> Currently the default input range can extend to 64 bits. On x86,
>> when the virtio-iommu protects vfio devices, the physical iommu
>> may support only 39 bits. Let's set the default to 39, as done
>> for the intel-iommu. On ARM we set 48b as a default (matching
>> SMMUv3 SMMU_IDR5.VAX == 0).
>>
>> We use hw_compat_8_2 to handle the compatibility for machines
>> before 9.0 which used to have a virtio-iommu default input range
>> of 64 bits.
>>
>> Of course if aw-bits is set from the command line, the default
>> is overriden.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>
>> ---
>>
>> v1 -> v2:
>> - set aw-bits to 48b on ARM
>> - use hw_compat_8_2 to handle the compat for older machines
>>  which used 64b as a default
>> ---
>> hw/arm/virt.c            | 6 ++++++
>> hw/core/machine.c        | 5 ++++-
>> hw/i386/pc.c             | 6 ++++++
>> hw/virtio/virtio-iommu.c | 2 +-
>> 4 files changed, 17 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index e6ead2c5c8..56539f2fc5 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -2718,10 +2718,16 @@ static void
>> virt_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
>>     } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MD_PCI)) {
>>         virtio_md_pci_pre_plug(VIRTIO_MD_PCI(dev), MACHINE(hotplug_dev),
>> errp);
>>     } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
>> +        uint8_t aw_bits = object_property_get_uint(OBJECT(dev),
>> +                                                   "aw-bits", NULL);
>>         hwaddr db_start = 0, db_end = 0;
>>         QList *reserved_regions;
>>         char *resv_prop_str;
>>
>> +        if (!aw_bits) {
>> +            qdev_prop_set_uint8(dev, "aw-bits", 48);
>> +        }
>> +
>>         if (vms->iommu != VIRT_IOMMU_NONE) {
>>             error_setg(errp, "virt machine does not support multiple IOMMUs");
>>             return;
>> diff --git a/hw/core/machine.c b/hw/core/machine.c
>> index fb5afdcae4..70ac96954c 100644
>> --- a/hw/core/machine.c
>> +++ b/hw/core/machine.c
>> @@ -30,9 +30,12 @@
>> #include "exec/confidential-guest-support.h"
>> #include "hw/virtio/virtio-pci.h"
>> #include "hw/virtio/virtio-net.h"
>> +#include "hw/virtio/virtio-iommu.h"
>> #include "audio/audio.h"
>>
>> -GlobalProperty hw_compat_8_2[] = {};
>> +GlobalProperty hw_compat_8_2[] = {
>> +    { TYPE_VIRTIO_IOMMU_PCI, "aw-bits", "64" },
>> +};
>> const size_t hw_compat_8_2_len = G_N_ELEMENTS(hw_compat_8_2);
>>
>> GlobalProperty hw_compat_8_1[] = {
>> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
>> index 803244e5cc..0e2bcb4840 100644
>> --- a/hw/i386/pc.c
>> +++ b/hw/i386/pc.c
>> @@ -1458,6 +1458,8 @@ static void
>> pc_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
>>     } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MD_PCI)) {
>>         virtio_md_pci_pre_plug(VIRTIO_MD_PCI(dev), MACHINE(hotplug_dev),
>> errp);
>>     } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
>> +        uint8_t aw_bits = object_property_get_uint(OBJECT(dev),
>> +                                                   "aw-bits", NULL);
>>         /* Declare the APIC range as the reserved MSI region */
>>         char *resv_prop_str = g_strdup_printf("0xfee00000:0xfeefffff:%d",
>>                                               VIRTIO_IOMMU_RESV_MEM_T_MSI);
>> @@ -1466,6 +1468,10 @@ static void
>> pc_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
>>         qlist_append_str(reserved_regions, resv_prop_str);
>>         qdev_prop_set_array(dev, "reserved-regions", reserved_regions);
>>
>> +        if (!aw_bits) {
>> +            qdev_prop_set_uint8(dev, "aw-bits", 39);
>> +        }
>> +
>>         g_free(resv_prop_str);
>>     }
>>
>> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
>> index 7870bdbeee..c468e9b13b 100644
>> --- a/hw/virtio/virtio-iommu.c
>> +++ b/hw/virtio/virtio-iommu.c
>> @@ -1529,7 +1529,7 @@ static Property virtio_iommu_properties[] = {
>>     DEFINE_PROP_LINK("primary-bus", VirtIOIOMMU, primary_bus,
>>                      TYPE_PCI_BUS, PCIBus *),
>>     DEFINE_PROP_BOOL("boot-bypass", VirtIOIOMMU, boot_bypass, true),
>> -    DEFINE_PROP_UINT8("aw-bits", VirtIOIOMMU, aw_bits, 64),
>> +    DEFINE_PROP_UINT8("aw-bits", VirtIOIOMMU, aw_bits, 0),
> Not clear if virtio-iommu support other archs besides x86 and arm.
> It looks on those archs, aw_bits is default 0 on machine 9.0 above
> and will fails the check in realize?

At the moment the virtio-iommu only is supported along with q35 and
arm-virt.
Only those machines set the reserved-regions prop and the aw-bits, which
are both requested for a correct behavior.

Thank you for the review!

Eric

>
> Thanks
> Zhenzhong
>
>>     DEFINE_PROP_END_OF_LIST(),
>> };
>>
>> --
>> 2.41.0


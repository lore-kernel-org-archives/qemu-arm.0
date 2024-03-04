Received: by 2002:a17:906:489:b0:a44:3ba0:e9d1 with SMTP id f9csp2737690eja;
        Mon, 4 Mar 2024 09:37:48 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWoubBC1S80L3dUaHqmrqFbGlUVCJqZ8hJn8JQqqp91EsytvLiCYHTTs9z3yPRuyKeeN+V61zCisD6J6It2zMDTgs+rimnK
X-Google-Smtp-Source: AGHT+IHfQpX0VKNZUUBEtGrs0kuQe2KCYQi0Uw8vQtx+k7sWinoUrMWwHSexJlNuYxc8INgG5K7V
X-Received: by 2002:a5d:6b05:0:b0:33d:6984:3f87 with SMTP id v5-20020a5d6b05000000b0033d69843f87mr9437862wrw.8.1709573868092;
        Mon, 04 Mar 2024 09:37:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709573868; cv=none;
        d=google.com; s=arc-20160816;
        b=iSssld6EWKWXuAsOGJKp9ODo9w6qPtDN+GoA9hHhp6OzkpfihtpgxSokANKCgRO9sZ
         s2YiUy2+Z7KrvsYbdqfMtnhxZxNjbHYjDnowCOE8yxv2tJkKPr+7GOFpgDOhSXEydw5Z
         I+/trrPOWGhdOIPpFh94w3Z2R/cihCvXmzkMhWZZqXL1prki5nn/wMHz0eygy44OKyS1
         GQRs/RTxRtsRjdwwwp/VQmKggNwACjhzboOcK1Qxjo5zzgJyRzjUkBiMTe3iUNrR7EB/
         JZqyTV7+THIqCyb3ZLxyfjvdJt2BOciBOnNWYtyh0JCkv/d89iTGnxmcDSeAPzywxqmN
         O1yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Wyjz8u7HbCmwkkAMVB4v7e6D2/ijI/Pv8npHV6wSSOY=;
        fh=V8vQwWQjJhwYYJeh87aIKn2XvnOHDhBm7sd7itbx0TY=;
        b=ROY0ayOf5JYj1gntVWwvp+p2JSBoGV96ttH0sHnM2phlRzI7GsoscSXpVARNJSia+3
         uvBOFGxkNjYlbja2wvQvBxGEsph3SAHib8Txdj3MSQn9dUT08Hv/CPKW2AfLaz5r5EYP
         EnUp30p3y9Gl+FrxFkAihnsIlEaiEuWWffUkJfOZzI96NXOL3GNzNwvA7/URGWQXBDR8
         AzKjnuZ4GIxFSJueYLZbamzXs0eHzVWZNoGRp5qo7o72H+nXdfBwWuCyVCCdL6tPJNb0
         CuHBkYWBCdrrzSLGtIxCum48JP3xsITw10YoePfzym++1Ezeju31zXO6lAyA/ReNqDy1
         +JHw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UfCYht8x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i11-20020a5d55cb000000b0033da1c46913si5412167wrw.991.2024.03.04.09.37.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Mar 2024 09:37:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UfCYht8x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rhCFe-00063F-M3; Mon, 04 Mar 2024 12:37:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rhCFb-00060w-84
 for qemu-arm@nongnu.org; Mon, 04 Mar 2024 12:37:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rhCFZ-0001nm-Em
 for qemu-arm@nongnu.org; Mon, 04 Mar 2024 12:37:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709573836;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wyjz8u7HbCmwkkAMVB4v7e6D2/ijI/Pv8npHV6wSSOY=;
 b=UfCYht8xXZhRfaQ9rrBNUUr7bYr5EgAaYaJuY//VqGCi56w6E758VOQXCEbRfowHPKTQbL
 7HBRpK9gsjql3UWEqdbLkRa3OwThmvsrp0SNyhC8H130kcf5IdD15PLs8tjq113dDYHmlb
 P8X3JixNUaXOcP+SbR0rxj5okpfraao=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-500-koJYrKjOMxm7JwNvqP0DtQ-1; Mon, 04 Mar 2024 12:37:13 -0500
X-MC-Unique: koJYrKjOMxm7JwNvqP0DtQ-1
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-68fd31a5cafso38358896d6.0
 for <qemu-arm@nongnu.org>; Mon, 04 Mar 2024 09:37:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709573833; x=1710178633;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Wyjz8u7HbCmwkkAMVB4v7e6D2/ijI/Pv8npHV6wSSOY=;
 b=qtO9/4rBU7NcyxaKOnWvxwpXvhfXnlKlsOGvlV1N24M4ca04XchsvUZ2tLVPz21A65
 9yXJKMef8+UD99O0VESP5AjVq+Ep0DtvKyFJCOVjq2FdQpzWZoywYdkfJ2f9hAASbVCH
 NY89xSemSpkp2fwrnKlnnOuivH4jvc3gLr3Jc+lSfqGkUN8rg5Xmddbr+wenkUgEHQgK
 su6DYvmbkmCBL07y8wihqElzlBObeU5vn1I+jJMc6MyNuscylSxNdN0K+ZoHDxlxn09Y
 wHjPtXCJoxiuiU1MiOEArhueuZvXVpeDqgcT3VXB8LaEI5pH/uq9voqypt/5gDL63Zw0
 X+tw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWp8XLJBUOkhYs/IMdX+J9lvzrFHzDySObgBqFf8WIcQgyTcIuLVFHacMrlei8BoaW9y5XhDibu9g8EvI+tfn0804Zi
X-Gm-Message-State: AOJu0YypPLUhJkHbGgik4+KKtW8ouyFHWzJfJ+XXdeRT3rnXKgTbSXrS
 U4HftnYKidnYG7K8EjYoja3GizwYMACsweslvTr7McN3Jw4Ynboyz2890t30DHmKW0bP72OljRP
 /WkvhqTrmlRjq66sfwRp3MEUhwS89q3NprdJFc3gKD5Rf5mDLpg==
X-Received: by 2002:ad4:4f14:0:b0:690:57bc:643b with SMTP id
 fb20-20020ad44f14000000b0069057bc643bmr8940224qvb.13.1709573833130; 
 Mon, 04 Mar 2024 09:37:13 -0800 (PST)
X-Received: by 2002:ad4:4f14:0:b0:690:57bc:643b with SMTP id
 fb20-20020ad44f14000000b0069057bc643bmr8940193qvb.13.1709573832751; 
 Mon, 04 Mar 2024 09:37:12 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ld8-20020a056214418800b0068fef1264f6sm5253965qvb.101.2024.03.04.09.37.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Mar 2024 09:37:12 -0800 (PST)
Message-ID: <d7883713-0695-4346-b7d1-8beac6525def@redhat.com>
Date: Mon, 4 Mar 2024 18:37:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] hw: Set virtio-iommu aw-bits default value on
 pc_q35 and arm virt
To: Igor Mammedov <imammedo@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 jean-philippe@linaro.org, mst@redhat.com, peter.maydell@linaro.org,
 clg@redhat.com, zhenzhong.duan@intel.com, yanghliu@redhat.com,
 alex.williamson@redhat.com, jasowang@redhat.com
References: <20240215084315.863897-1-eric.auger@redhat.com>
 <20240215084315.863897-4-eric.auger@redhat.com>
 <20240229102014.6c5e9f74@imammedo.users.ipa.redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20240229102014.6c5e9f74@imammedo.users.ipa.redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.571,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: Zuf4zQbdNgJq

Hi Igor,

On 2/29/24 10:20, Igor Mammedov wrote:
> On Thu, 15 Feb 2024 09:42:13 +0100
> Eric Auger <eric.auger@redhat.com> wrote:
>
>> Currently the default input range can extend to 64 bits. On x86,
>> when the virtio-iommu protects vfio devices, the physical iommu
>> may support only 39 bits. Let's set the default to 39, as done
>> for the intel-iommu. On ARM we set 48b as a default (matching
>> SMMUv3 SMMU_IDR5.VAX == 0).
>>
>> We use hw_compat_8_2 to handle the compatibility for machines
>> before 9.0 which used to have a virtio-iommu default input range
>> of 64 bits.
> so we have different defaults per target/machine
> while open codding fixup in _pre_plug_ works it's
> a bit unexpected place to manage defaults and
> avoid adding 0 magic.
>
> How about using compat machinery instead to set
> machine dependent defaults:
> For example:
>
> pc_i440fx_machine_options(MachineClass *m)
> {
> ...
> +    compat_props_add(m->compat_props, pc_compat_defaults,pc_compat_defaults_len);
>  }
Yes I can go this way.
>
>> Of course if aw-bits is set from the command line, the default
>> is overriden.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Reviewed-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
>> Tested-by: Yanghang Liu<yanghliu@redhat.com>
>>
>> ---
>>
>> v3 -> v4:
>> - update the qos test to relax the check on the max input IOVA
>>
>> v2 -> v3:
>> - collected Zhenzhong's R-b
>> - use &error_abort instead of NULL error handle
>>   on object_property_get_uint() call (Cédric)
>> - use VTD_HOST_AW_39BIT (Cédric)
>>
>> v1 -> v2:
>> - set aw-bits to 48b on ARM
>> - use hw_compat_8_2 to handle the compat for older machines
>>   which used 64b as a default
>> ---
>>  hw/arm/virt.c                   | 6 ++++++
>>  hw/core/machine.c               | 5 ++++-
>>  hw/i386/pc.c                    | 6 ++++++
>>  hw/virtio/virtio-iommu.c        | 2 +-
>>  tests/qtest/virtio-iommu-test.c | 2 +-
>>  5 files changed, 18 insertions(+), 3 deletions(-)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index 368c2a415a..0994f2a560 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -2716,10 +2716,16 @@ static void virt_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
>>      } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MD_PCI)) {
>>          virtio_md_pci_pre_plug(VIRTIO_MD_PCI(dev), MACHINE(hotplug_dev), errp);
>>      } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
>> +        uint8_t aw_bits = object_property_get_uint(OBJECT(dev),
>> +                                                   "aw-bits", &error_abort);
>>          hwaddr db_start = 0, db_end = 0;
>>          QList *reserved_regions;
>>          char *resv_prop_str;
>>  
>> +        if (!aw_bits) {
>> +            qdev_prop_set_uint8(dev, "aw-bits", 48);
> s/48/macro name/?
with compats it becomes a string.  So I cannot directly reuse X86_64 VTD
or ARM SMMU macros. I would introduce a dummy VIRTIO_IOMMU string which
does not sound really helpful.
>
>> +        }
>>
>>
>>          if (vms->iommu != VIRT_IOMMU_NONE) {
>>              error_setg(errp, "virt machine does not support multiple IOMMUs");
>>              return;
>> diff --git a/hw/core/machine.c b/hw/core/machine.c
>> index fb5afdcae4..70ac96954c 100644
>> --- a/hw/core/machine.c
>> +++ b/hw/core/machine.c
>> @@ -30,9 +30,12 @@
>>  #include "exec/confidential-guest-support.h"
>>  #include "hw/virtio/virtio-pci.h"
>>  #include "hw/virtio/virtio-net.h"
>> +#include "hw/virtio/virtio-iommu.h"
>>  #include "audio/audio.h"
>>  
>> -GlobalProperty hw_compat_8_2[] = {};
>> +GlobalProperty hw_compat_8_2[] = {
>> +    { TYPE_VIRTIO_IOMMU_PCI, "aw-bits", "64" },
>> +};
>>  const size_t hw_compat_8_2_len = G_N_ELEMENTS(hw_compat_8_2);
>>  
>>  GlobalProperty hw_compat_8_1[] = {
>> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
>> index 196827531a..ee2d379c90 100644
>> --- a/hw/i386/pc.c
>> +++ b/hw/i386/pc.c
>> @@ -1456,6 +1456,8 @@ static void pc_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
>>      } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MD_PCI)) {
>>          virtio_md_pci_pre_plug(VIRTIO_MD_PCI(dev), MACHINE(hotplug_dev), errp);
>>      } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
>> +        uint8_t aw_bits = object_property_get_uint(OBJECT(dev),
>> +                                                   "aw-bits", &error_abort);
>>          /* Declare the APIC range as the reserved MSI region */
>>          char *resv_prop_str = g_strdup_printf("0xfee00000:0xfeefffff:%d",
>>                                                VIRTIO_IOMMU_RESV_MEM_T_MSI);
>> @@ -1464,6 +1466,10 @@ static void pc_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
>>          qlist_append_str(reserved_regions, resv_prop_str);
>>          qdev_prop_set_array(dev, "reserved-regions", reserved_regions);
>>  
>> +        if (!aw_bits) {
>> +            qdev_prop_set_uint8(dev, "aw-bits", VTD_HOST_AW_39BIT);
>> +        }
>> +
>>          g_free(resv_prop_str);
>>      }
>>  
>> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
>> index 8b541de850..2ec5ef3cd1 100644
>> --- a/hw/virtio/virtio-iommu.c
>> +++ b/hw/virtio/virtio-iommu.c
>> @@ -1526,7 +1526,7 @@ static Property virtio_iommu_properties[] = {
>>      DEFINE_PROP_LINK("primary-bus", VirtIOIOMMU, primary_bus,
>>                       TYPE_PCI_BUS, PCIBus *),
>>      DEFINE_PROP_BOOL("boot-bypass", VirtIOIOMMU, boot_bypass, true),
>> -    DEFINE_PROP_UINT8("aw-bits", VirtIOIOMMU, aw_bits, 64),
>> +    DEFINE_PROP_UINT8("aw-bits", VirtIOIOMMU, aw_bits, 0),
> I'd set some valid value here (obviously not universal) and skip
> default property setting for that machine/target
> For example pick x86 one.
Yes the purpose is to have a non null aw_bits value which makes the
virtio-iommu unusable without proper machine integration and puts the
mess on the libqos tests. 
>
>>      DEFINE_PROP_END_OF_LIST(),
>>  };
>>  
>> diff --git a/tests/qtest/virtio-iommu-test.c b/tests/qtest/virtio-iommu-test.c
>> index 068e7a9e6c..0f36381acb 100644
>> --- a/tests/qtest/virtio-iommu-test.c
>> +++ b/tests/qtest/virtio-iommu-test.c
>> @@ -34,7 +34,7 @@ static void pci_config(void *obj, void *data, QGuestAllocator *t_alloc)
>>      uint8_t bypass = qvirtio_config_readb(dev, 36);
>>  
>>      g_assert_cmpint(input_range_start, ==, 0);
>> -    g_assert_cmphex(input_range_end, ==, UINT64_MAX);
>> +    g_assert_cmphex(input_range_end, >=, 32);
>>      g_assert_cmpint(domain_range_start, ==, 0);
>>      g_assert_cmpint(domain_range_end, ==, UINT32_MAX);
>>      g_assert_cmpint(bypass, ==, 1);
Thank you for the suggestions

Eric


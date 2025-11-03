Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B6EACCF9FE
	for <qemu-arm@archiver.kernel.org>; Mon,  3 Nov 2025 15:03:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vFw5Y-0002a5-A2; Mon, 03 Nov 2025 10:03:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vFw5X-0002Zc-3k
 for qemu-arm@nongnu.org; Mon, 03 Nov 2025 10:03:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vFw5S-00009b-7I
 for qemu-arm@nongnu.org; Mon, 03 Nov 2025 10:03:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1762182192;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cwZZLAszsfKxB4H2dic/Da+s4mspn2nuegpRXjtxmqo=;
 b=cn2uTDgkcvwlCL1oatmUouVXlMgCXfxGkQumEMSq+y8QhrSI2GIKEWQcp9murZmLt903up
 0b/n+ByBj9E1m7LWyJKOrVCI7esWkwfMKoqINVeYxBay9P3oE57Ks6OXg9rI5WbNwELdT4
 8wDTE6vDAzsDZm//DZeXIOGDZH7a1U4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-139-qeIeNYQyOIuJ22WXeX_CZg-1; Mon, 03 Nov 2025 10:03:09 -0500
X-MC-Unique: qeIeNYQyOIuJ22WXeX_CZg-1
X-Mimecast-MFC-AGG-ID: qeIeNYQyOIuJ22WXeX_CZg_1762182189
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-429c71c5892so1604983f8f.1
 for <qemu-arm@nongnu.org>; Mon, 03 Nov 2025 07:03:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762182189; x=1762786989;
 h=content-transfer-encoding:in-reply-to:references:reply-to:cc:to
 :from:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cwZZLAszsfKxB4H2dic/Da+s4mspn2nuegpRXjtxmqo=;
 b=WWiLW+i70woOpL1t13wL6yRAEaF6hmzCDnY9SP+fOzrWUqJkuNKFiIfHEikt+pDLCj
 mbiDkQlUqbpj8+jFym+n12yxs5k0uCdyBzZN+fShFEsKNIf7P3aYii4mMsOccNKTPjfW
 nqgppj/2eJu3Kix9+vFyyCcjZBxSS6zScecnBRyGfyc3ixEE2gYwNSyNduUSSvgDJwqA
 wyVWW69VQSyCF5yDF+lPMAgSnbPh7kGtYfRHRTEA6Y6d545Fyy+CQmVM5jpHOjzt7Z2w
 cjrqHeQgt0U+B0FO8bp+FVWxNoljBWjZGPGL7rWot4YiUL6xDEwk+aZ8NTh8CJWJ2Fgp
 DFLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8wiiED3yxHHBlQMJP2IwQMyRkd6/AV9/JVYrqymStCBGXHXwId2MgjpuLtqWIXsmkxwFXYyAoBA==@nongnu.org
X-Gm-Message-State: AOJu0Yyy/2TI8Gbg9ZgWr3y1zSYFHyjyyD49Tu1/y+kgnLIPTJYR5IM7
 7pIhW/d8ZF8fzVLtNL/Q19hGT7RId74oB8AjiPjQsR+ONbxtLlgIDqBn+bgn5bWmnDXbJHqONuh
 Uy2/poL7MZKXDwl+Di6jxrgOq9GM+/4nE52OeoP51pIk6612aOfnXLg==
X-Gm-Gg: ASbGncseyeU4NvOwxMAPh8cNi/dqdOdGD2x8a+41E/ECVfoUuA/jpSOaN+ibnGqu/At
 tmUTtJZ0YTSMWVycqBRsvxwFmwgCDUHD24HB4Y9nmtH90vbnlEE6Upwhusds1u79P5zMYtJjTDj
 9/FxjVTysqKPPr678fZ08oKvfJfWpO9tTtAVnS/nUXYeRRZWmepfqaDn1DXlwSE1IpSr9SPGQyR
 pG+9rzsqr5a0t/zkKJmaXQphHkWqjV75DC5gJvQVHa15Ngm3zNt6QrUkmjwf1gDypgQd7JHjVhV
 r7Wa8URyRE5L3p2YikwBPL+TUQ90HyknHXmAIhhPMu6picDbCSOpdVb/S/Gy54EYbGZ9S11aVWG
 nDwZSRE/hNlPLBeLBl7MtGMFDSAfpn4lLaZegSdOBJPteRg==
X-Received: by 2002:a05:6000:2387:b0:3e8:9e32:38f8 with SMTP id
 ffacd0b85a97d-429bd683416mr12286817f8f.14.1762182188614; 
 Mon, 03 Nov 2025 07:03:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHWtHHmX9+9KWoqdZKO0U9XDLjstnSogpl55hZwJUk9ozXzcafrUvUrYVjOUq9vFYwZWTrsOQ==
X-Received: by 2002:a05:6000:2387:b0:3e8:9e32:38f8 with SMTP id
 ffacd0b85a97d-429bd683416mr12286767f8f.14.1762182188099; 
 Mon, 03 Nov 2025 07:03:08 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429d12e1173sm8929705f8f.42.2025.11.03.07.03.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Nov 2025 07:03:07 -0800 (PST)
Message-ID: <4e0ed196-b156-4de5-9a2c-e241a853ce57@redhat.com>
Date: Mon, 3 Nov 2025 16:03:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 21/32] hw/arm/virt: Set PCI preserve_config for accel
 SMMUv3
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, jgg@nvidia.com, nicolinc@nvidia.com,
 ddutile@redhat.com, berrange@redhat.com, nathanc@nvidia.com,
 mochs@nvidia.com, smostafa@google.com, wangzhou1@hisilicon.com,
 jiangkunkun@huawei.com, jonathan.cameron@huawei.com,
 zhangfei.gao@linaro.org, zhenzhong.duan@intel.com, yi.l.liu@intel.com,
 kjaju@nvidia.com
References: <20251031105005.24618-1-skolothumtho@nvidia.com>
 <20251031105005.24618-22-skolothumtho@nvidia.com>
 <28dd6856-71ce-445c-9b9c-d4b6502a92bb@redhat.com>
In-Reply-To: <28dd6856-71ce-445c-9b9c-d4b6502a92bb@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: p4AyJ_GOURKCXi0-wYHi2mPw5jJDtursGprbi-x76hI_1762182189
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  eric.auger@redhat.com
X-ACL-Warn: ,  Eric Auger <eric.auger@redhat.com>
From:  Eric Auger via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org



On 11/3/25 3:58 PM, Eric Auger wrote:
> 
> 
> On 10/31/25 11:49 AM, Shameer Kolothum wrote:
>> Introduce a new pci_preserve_config field in virt machine state which
>> allows  the generation of DSM #5. This field is only set if accel SMMU
>> is instantiated.
>>
>> In a subsequent patch, SMMUv3 accel mode will make use of IORT RMR nodes
>> to enable nested translation of MSI doorbell addresses. IORT RMR requires
>> _DSM #5 to be set for the PCI host bridge so that the Guest kernel
>> preserves the PCI boot configuration.
>>
>> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
>> Tested-by: Zhangfei Gao <zhangfei.gao@linaro.org>
>> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
>> ---
>>  hw/arm/virt-acpi-build.c | 8 ++++++++
>>  hw/arm/virt.c            | 4 ++++
>>  include/hw/arm/virt.h    | 1 +
>>  3 files changed, 13 insertions(+)
>>
>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>> index 8bb6b60515..d51da6e27d 100644
>> --- a/hw/arm/virt-acpi-build.c
>> +++ b/hw/arm/virt-acpi-build.c
>> @@ -163,6 +163,14 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
>>          .pci_native_hotplug = !acpi_pcihp,
>>      };
>>  
>> +    /*
>> +     * Accel SMMU requires RMRs for MSI 1-1 mapping, which require _DSM for
>> +     * preserving PCI Boot Configurations
> as suggested in v4 you can be more precise and explictly state
> 
> _DSM function 5 (Ignore PCI Boot Configuration)
> 
>> +     */
>> +    if (vms->pci_preserve_config) {
>> +        cfg.preserve_config = true;
>> +    }
>> +
>>      if (vms->highmem_mmio) {
>>          cfg.mmio64 = memmap[VIRT_HIGH_PCIE_MMIO];
>>      }
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index 175023897a..8a347a6e39 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -3091,6 +3091,10 @@ static void virt_machine_device_plug_cb(HotplugHandler *hotplug_dev,
>>              }
>>  
>>              create_smmuv3_dev_dtb(vms, dev, bus);
>> +            if (object_property_find(OBJECT(dev), "accel") &&
> why do you need to test
> 
> object_property_find(OBJECT(dev), "accel")?

Hum, because at that moment it does not exist yet. So you can remove it
in 25/32 I think

Eric
> 
>> +                object_property_get_bool(OBJECT(dev), "accel", &error_abort)) {
>> +                vms->pci_preserve_config = true;
>> +            }
>>          }
>>      }
>>  
>> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
>> index 04a09af354..60db5d40b2 100644
>> --- a/include/hw/arm/virt.h
>> +++ b/include/hw/arm/virt.h
>> @@ -182,6 +182,7 @@ struct VirtMachineState {
>>      bool ns_el2_virt_timer_irq;
>>      CXLState cxl_devices_state;
>>      bool legacy_smmuv3_present;
>> +    bool pci_preserve_config;
>>  };
>>  
>>  #define VIRT_ECAM_ID(high) (high ? VIRT_HIGH_PCIE_ECAM : VIRT_PCIE_ECAM)
> With those changes takin into account
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> 
> Eric
> 



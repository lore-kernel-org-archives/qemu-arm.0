Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A2FBCCD199
	for <qemu-arm@archiver.kernel.org>; Mon, 20 Oct 2025 16:14:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vAsX0-0000pu-UR; Mon, 20 Oct 2025 12:14:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vAsWz-0000oH-EE
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 12:14:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vAsWx-0000Dz-7J
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 12:14:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1760976880;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zlASHT4nSdfSAEAwYMZrrN6ZSMgiz2XvepN8CyW/p44=;
 b=XkMS2HJaqI53gEjtmQsl11BZrkzAL+nUxVXMDdkg1LyeSkKIszH+IfvF6cwGQa2l3+mIbz
 xhZSkLf3Q9wigMyJ5WS/gvOkzjCkPmNkoEoseQbXsOuTU+vhsnTWuKuGY0K18zaD6ZqLmo
 Ett3Ywl4xwhl91OfPUwZUWJg5H5XP1c=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-604-A-hRXEgFOlOZHLpeVeRjZA-1; Mon, 20 Oct 2025 12:14:37 -0400
X-MC-Unique: A-hRXEgFOlOZHLpeVeRjZA-1
X-Mimecast-MFC-AGG-ID: A-hRXEgFOlOZHLpeVeRjZA_1760976876
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3ef9218daf5so5644216f8f.1
 for <qemu-arm@nongnu.org>; Mon, 20 Oct 2025 09:14:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760976876; x=1761581676;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zlASHT4nSdfSAEAwYMZrrN6ZSMgiz2XvepN8CyW/p44=;
 b=e7OSm9LHCgJoyYjdjifDngXnEhwsgJ9JRqHHmzOulaZYo+CRPGTlGf6yGUFxFFD6dJ
 ueVt+OPEvTKIbCG3/cSFkPOFI72EsUhuc7lh/VOReP/7L6zXHasv4eXu5dQl0LKdliGm
 3l9ynENjUD0RS/YVT9MLKTyUCD26MmKV0cyxmDLs0qZuO6DALZQpQXMB7IEvU2b/w2zt
 teoH2f1nFbrdScm/5UmQlQh2TjZtzDkfFZ4G+00Ebd6LVMNRQP+SQU282pCJc5ziNv+8
 LmNt19P/9tHJJ6d8PC7D8m4cXQYOUvhAocyFcEuETwrQyqnla/hXA7QCw//kSxXfb6+v
 Aqmw==
X-Gm-Message-State: AOJu0YxWMNRZb3IKkRVhHz4nTkVAjjbalSc+ua8F4mFpcnjrmKhRqAe7
 kuFAIdXmyEYGOWP//9bOsblDtyVfO/Uf4au32rAhKAQITChNGX/w/dQFZA4tziJVUsYXFASRn22
 AX4hBusdnz17TqIfJIprGrnYY6xCP0kS0muB/31BNP//KKjtirDZYfw==
X-Gm-Gg: ASbGnctBbDeXl1ux4H1u2UHPwJLCfFZ6grL+Xj7JHMx3GDeL7pwwVw73sT8jYXrRf6Q
 pjieWY5tUOddgvuX30z3rxKa4wioFF7zQXlEwwq6bpNcMas3yEfSRz+eH1ICW5XYKg0TRul8avJ
 PkkIR4JfxV91xPUrSnPZjSN1XuXy5GvYC3qeOyGcxWrKOsnjgkAdGyXxkmAefwcnCB7pJLaeBBY
 wPook87cNvBaTJqjlx2dFSTEef/7ttguP5C7RNkgXk3o7E5rIx73zzZXdl+w4K42azTorkmaXht
 MkMQ74vC1oWOM0FvUcqLCqtrnWPWiELridsD+bjsU/PPSEQvykIFtrotis7ZYlmaxtcF9NBFrGy
 1dM5+
X-Received: by 2002:a05:6000:258a:b0:428:4082:c8e9 with SMTP id
 ffacd0b85a97d-4284082cadamr4943047f8f.62.1760976876219; 
 Mon, 20 Oct 2025 09:14:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmqb8TlE8fpgh12Fjzby7oqjgUptW2DxpK2mLKwUMsGCcloIZlmxmt3EJsFSAJpRbF8QRTMQ==
X-Received: by 2002:a05:6000:258a:b0:428:4082:c8e9 with SMTP id
 ffacd0b85a97d-4284082cadamr4943028f8f.62.1760976875815; 
 Mon, 20 Oct 2025 09:14:35 -0700 (PDT)
Received: from [192.168.43.95] ([37.166.134.90])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4283e7804f4sm13938556f8f.10.2025.10.20.09.14.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Oct 2025 09:14:35 -0700 (PDT)
Message-ID: <291fe8be-405e-4ea3-acfb-d090f6a7cd15@redhat.com>
Date: Mon, 20 Oct 2025 18:14:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/27] hw/pci/pci: Introduce optional
 get_msi_address_space() callback
To: Nicolin Chen <nicolinc@nvidia.com>,
 Shameer Kolothum <skolothumtho@nvidia.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, peter.maydell@linaro.org,
 jgg@nvidia.com, ddutile@redhat.com, berrange@redhat.com, nathanc@nvidia.com,
 mochs@nvidia.com, smostafa@google.com, wangzhou1@hisilicon.com,
 jiangkunkun@huawei.com, jonathan.cameron@huawei.com,
 zhangfei.gao@linaro.org, zhenzhong.duan@intel.com, yi.l.liu@intel.com,
 shameerkolothum@gmail.com
References: <20250929133643.38961-1-skolothumtho@nvidia.com>
 <20250929133643.38961-12-skolothumtho@nvidia.com>
 <aPFx7Egdny+JCO9U@Asurada-Nvidia>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <aPFx7Egdny+JCO9U@Asurada-Nvidia>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: CuSnZ_tDBavfq6ct3CItI7blF6inI9-CqypHykbX1IQ_1760976876
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi Nicolin, Shameer,

On 10/17/25 12:30 AM, Nicolin Chen wrote:
> On Mon, Sep 29, 2025 at 02:36:27PM +0100, Shameer Kolothum wrote:
>> On ARM, when a device is behind an IOMMU, its MSI doorbell address is
>> subject to translation by the IOMMU. This behavior affects vfio-pci
>> passthrough devices assigned to guests using an accelerated SMMUv3.
>>
>> In this setup, we configure the host SMMUv3 in nested mode, where
>> VFIO sets up the Stage-2 (S2) mappings for guest RAM, while the guest
>> controls Stage-1 (S1). To allow VFIO to correctly configure S2 mappings,
>> we currently return the system address space via the get_address_space()
>> callback for vfio-pci devices.
>>
>> However, QEMU/KVM also uses this same callback path when resolving the
>> address space for MSI doorbells:
>>
>> kvm_irqchip_add_msi_route()
>>   kvm_arch_fixup_msi_route()
>>     pci_device_iommu_address_space()
>>      get_address_space()
>>
>> This will cause the device to be configured with wrong MSI doorbell
>> address if it return the system address space.
> I think it'd be nicer to elaborate why a wrong address will be returned:
>
> --------------------------------------------------------------------------
> On ARM, a device behind an IOMMU requires translation for its MSI doorbell
> address. When HW nested translation is enabled, the translation will also
> happen in two stages: gIOVA => gPA => ITS page.
>
> In the accelerated SMMUv3 mode, both stages are translated by the HW. So,
> get_address_space() returns the system address space for stage-2 mappings,
> as the smmuv3-accel model doesn't involve in either stage.
I don't understand "doesn't involve in either stage". This is still not
obious to me that for an HW accelerated nested IOMMU get_address_space()
shall return the system address space. I think this deserves to be
explained and maybe documented along with the callback.
>
> On the other hand, this callback is also invoked by QEMU/KVM:
>
>  kvm_irqchip_add_msi_route()
>    kvm_arch_fixup_msi_route()
>      pci_device_iommu_address_space()
>       get_address_space()
>
> What KVM wants is to translate an MSI doorbell gIOVA to a vITS page (gPA),
> so as to inject IRQs to the guest VM. And it expected get_address_space()
> to return the address space for stage-1 mappings instead. Apparently, this
> is broken.
"Apparently this is broken". Please clarify what is broken. Definitively if

pci_device_iommu_address_space(dev) retruns @adress_system_memory no
translation is attempted.

kvm_arch_fixup_msi_route() was introduced by 
https://lore.kernel.org/all/1523518688-26674-12-git-send-email-eric.auger@redhat.com/

This relies on the vIOMMU translate callback which is supposed to be bypassed in general with VFIO devices. Isn't needed only for emulated devices?

May you and shameer discussed that in a previous thread. Might be worth to add the link to this discussion.

Thanks

Eric


>
> Introduce an optional get_msi_address_space() callback and use that in the
> above path.
> --------------------------------------------------------------------------
>
>> @@ -652,6 +652,21 @@ typedef struct PCIIOMMUOps {
>>                              uint32_t pasid, bool priv_req, bool exec_req,
>>                              hwaddr addr, bool lpig, uint16_t prgi, bool is_read,
>>                              bool is_write);
>> +    /**
>> +     * @get_msi_address_space: get the address space for MSI doorbell address
>> +     * for devices
> +     * @get_msi_address_space: get the address space to translate MSI doorbell
> +     * address for a device
>
>> +     *
>> +     * Optional callback which returns a pointer to an #AddressSpace. This
>> +     * is required if MSI doorbell also gets translated through IOMMU(eg: ARM)
> through vIOMMU (e.g. ARM).
>
> With these,
>
> Reviewed-by Nicolin Chen <nicolinc@nvidia.com>
>



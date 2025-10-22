Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1888ACCD1AB
	for <qemu-arm@archiver.kernel.org>; Wed, 22 Oct 2025 16:25:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vBbei-0001r5-SP; Wed, 22 Oct 2025 12:25:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vBbee-0001ph-6y
 for qemu-arm@nongnu.org; Wed, 22 Oct 2025 12:25:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vBbea-0002FS-17
 for qemu-arm@nongnu.org; Wed, 22 Oct 2025 12:25:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761150334;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AnDE91W32rKttyLPr8fSquof9/QUzpzk6DLr6cfgTcc=;
 b=R6bu+LDCjRyfatLU/XxuZQC4gfy6UoMomoebW/YCLvCm8pyugPSjWZOmAk7EZZ9QbOLwh2
 uPhp6aof3dXLL5H2HYc6eIDB0rbqgcGosysQ1fp5pNVFqCdlZnuFuEg9y/Nkc/e9H0jUwb
 YwdsI8sWnAZRd89O7quXo1PGDUIVkMw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-80-uyGpz4ByOMKVj75B5390Wg-1; Wed, 22 Oct 2025 12:25:33 -0400
X-MC-Unique: uyGpz4ByOMKVj75B5390Wg-1
X-Mimecast-MFC-AGG-ID: uyGpz4ByOMKVj75B5390Wg_1761150332
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-47107fcb257so95451795e9.0
 for <qemu-arm@nongnu.org>; Wed, 22 Oct 2025 09:25:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761150332; x=1761755132;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AnDE91W32rKttyLPr8fSquof9/QUzpzk6DLr6cfgTcc=;
 b=Rx846a+9e8BZIVmCib7Of8vTCuxf0FEBIdx687Spc8wFRYl5QeG5Ne54pu628BfrFd
 78LRML1HWnt9Fm0FX6s5shAIHY7/Wq1FPB11p7nN4MkLfwJwBbqeudHaUuksTyQMjgj4
 o86sk+Vj4IREQkPKR57Ggpn1tLfOsDPCRbgGtOaDuFgCNDnKlXQT2y9nGwkqMLleDYnK
 oFHuWpHCjdZY9nTiztZ/7VlY/+BsLBjv/0I9zamgY/TDphQgYcN+fuql/9kisbDEVVpx
 P9smgE3BLDQBGWDrYGchsPOgfN1h6zvhuZpiUvcO2lMUsanTW1p8xC0wp3sS2Z28il9n
 J4Ag==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfdIwTkBpUx5KdqV4D0n8Ti65FpWnHaLQ2x79Wn1zHBzEA+e70rM3nRQ3YpaWWFT+kppThcQUNKA==@nongnu.org
X-Gm-Message-State: AOJu0YyaXmotIAP9Z/scGjGkVWRqejhxSvxXqdf/C6q0XXVew3WsF6lB
 0vwmW1e806tYHB51nbn1G29LLUJIesY0DRF42bsUQauz/VmOWMipfbQeoVcVQx4EEI8SexwcEZT
 hDLjD+JosqNYpLP6JXnvNFrRxrByQ35BNXVSBxAg0mUY1ezOpWun7Pg==
X-Gm-Gg: ASbGncuFCng75r9cPcLqh79wt9I3uCYDsDoQCevL9o6ATidbRL62l9aHuhmBxsygCdy
 90hSpOcS1AL1AgRNNy3hfGik6JzT9F+PmQGW4hrbnfu1TJzyD2WDlOT1UGHzV3Y6xA9zAI+p4L1
 t76atheqF8Nm03xAfWuj626BAKAMNbCCtyE6Cd1Q94aifG4oZ4reA72AZfiAwoI5p1Xtd0Y/UUt
 M6zW231rlcOV4cvskBuz5PlkEslX3rXEoN083kL0TEpSaBsehuS4NW5Bd1hRkohwZ0tVhyX/yLJ
 ow4FT3tIt6hDAJmvTMJeTJzhcsOdJKEiztPJ+qUwjvClJoR1PpUaxN8l5LDakvxxcDSVgGtyrzC
 Z6aaMNA==
X-Received: by 2002:a05:600c:4ec9:b0:471:15c1:45b9 with SMTP id
 5b1f17b1804b1-471179133b2mr178133825e9.29.1761150331718; 
 Wed, 22 Oct 2025 09:25:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFYD31g6pl5bjIpIJESMrBp/svbacJPks7X6kOgdJVNmCwf8LvJ706l8Tr6wKuXOGGygVnUNg==
X-Received: by 2002:a05:600c:4ec9:b0:471:15c1:45b9 with SMTP id
 5b1f17b1804b1-471179133b2mr178133665e9.29.1761150331294; 
 Wed, 22 Oct 2025 09:25:31 -0700 (PDT)
Received: from [192.168.43.95] ([37.166.198.186])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475c428a5bcsm51799725e9.7.2025.10.22.09.25.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Oct 2025 09:25:30 -0700 (PDT)
Message-ID: <8cb2101e-6699-44c9-bb51-d092e0024cd9@redhat.com>
Date: Wed, 22 Oct 2025 18:25:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/27] hw/pci/pci: Introduce optional
 get_msi_address_space() callback
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, peter.maydell@linaro.org, jgg@nvidia.com,
 ddutile@redhat.com, berrange@redhat.com, nathanc@nvidia.com,
 mochs@nvidia.com, smostafa@google.com, wangzhou1@hisilicon.com,
 jiangkunkun@huawei.com, jonathan.cameron@huawei.com,
 zhangfei.gao@linaro.org, zhenzhong.duan@intel.com, yi.l.liu@intel.com,
 shameerkolothum@gmail.com
References: <20250929133643.38961-1-skolothumtho@nvidia.com>
 <20250929133643.38961-12-skolothumtho@nvidia.com>
 <aPFx7Egdny+JCO9U@Asurada-Nvidia>
 <291fe8be-405e-4ea3-acfb-d090f6a7cd15@redhat.com>
 <aPZ4tcsMfN+2puGL@Asurada-Nvidia>
 <add07edd-3652-430d-b52c-cb2bdbc7f587@redhat.com>
 <aPfXWKE70OuumOQD@Asurada-Nvidia>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <aPfXWKE70OuumOQD@Asurada-Nvidia>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: W9Cj0WH6Wv4Rf5LOC9VTt3vIHISLPtaBAqHQfcbuFyE_1761150332
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Hi Nicolin,

On 10/21/25 8:56 PM, Nicolin Chen wrote:
> On Tue, Oct 21, 2025 at 06:26:39PM +0200, Eric Auger wrote:
>> Hi Nicolin,
>>
>> On 10/20/25 8:00 PM, Nicolin Chen wrote:
>>> On Mon, Oct 20, 2025 at 06:14:33PM +0200, Eric Auger wrote:
>>>>>> This will cause the device to be configured with wrong MSI doorbell
>>>>>> address if it return the system address space.
>>>>> I think it'd be nicer to elaborate why a wrong address will be returned:
>>>>>
>>>>> --------------------------------------------------------------------------
>>>>> On ARM, a device behind an IOMMU requires translation for its MSI doorbell
>>>>> address. When HW nested translation is enabled, the translation will also
>>>>> happen in two stages: gIOVA => gPA => ITS page.
>>>>>
>>>>> In the accelerated SMMUv3 mode, both stages are translated by the HW. So,
>>>>> get_address_space() returns the system address space for stage-2 mappings,
>>>>> as the smmuv3-accel model doesn't involve in either stage.
>>>> I don't understand "doesn't involve in either stage". This is still not
>>>> obious to me that for an HW accelerated nested IOMMU get_address_space()
>>>> shall return the system address space. I think this deserves to be
>>>> explained and maybe documented along with the callback.
>>> get_address_space() is used by pci_device_iommu_address_space(),
>>> which is for attach or translation.
>>>
>>> In QEMU, we have an "iommu" type of memory region, to represent
>>> the address space providing the stage-1 translation.
>>>
>>> In accel case excluding MSI, there is no need of "emulated iommu
>>> translation" since HW/host SMMU takes care of both stages. Thus,
>>> the system address is returned for get_address_space(), to avoid
>>> stage-1 translation and to also allow VFIO devices to attach to
>>> the system address space that the VFIO core will monitor to take
>>> care of stage-2 mappings.
>> but in general if you set as output 'as' the system_address_memory it
>> rather means you have no translation in place. This is what I am not
>> convinced about.
> You mean you are not convinced about "no translation"?
I am not convinced about the choice of using address_space_memory.
>
>> you say it aims at
>> - avoiding stage-1 translation - allow VFIO devices to attach to the
>> system address space that the VFIO core will monitor to take care of
>> stage-2 mappings. Can you achieve the same goals with a proper address
>> space?
> Would you please define "proper"?
an address space different from address_space_memory
>
> The disagreement is seemingly about using system address space or
> even address_space_memory, IIUIC.
Yes my doubt is about:

smmuv3_accel_find_add_as()
     * We are using the global &address_space_memory here, as this will
ensure
     * same system address space pointer for all devices behind the
accelerated
     * SMMUv3s in a VM. That way VFIO/iommufd can reuse a single IOAS ID in
     * iommufd_cdev_attach(), allowing the Stage-2 page tables to be shared
     * within the VM instead of duplicating them for every SMMUv3 instance.
     */
    if (vfio_pci) {
        return &address_space_memory;

I think it would be cleaner to a have an AddressSpace allocated on
purpose to support the VFIO accel use case, if possible.
To me returning address_space_memory pretends we are not doing any
translation. I understand it is "easy" to reuse that one but I wonder it
is the spirit of the get_address_space callback.

I would rather allocate a dedicated (shared) AddressSpace to support the
VFIO accel case. That's my suggestion.

>
> To our purpose here, so long as the vfio core can setup a proper
> listener to monitor the guest physical address space, we are fine
> with any alternative.
>
> The system address space just seems to be the simplest one. FWIW,
> kvm_arch_fixup_msi_route() also checks in the beginning:
>     if (as == &address_space_memory)
>
> So, returning @address_space_memory seems to be straightforward?
>
> I think I also need some education to understand why do we need
> an indirect address space that eventually will be routed back to
> address_space_memory?

Well I am not an expert of AddressSpaces either. Reading hw/pci/pci.h
and get_address_space() callback API doc comment, I understand this is
the output address space for the PCI device. If you return

address_space_memory, to me this means there is no translation in place. By the way, this was the interpretation of kvm_arch_fixup_msi_route() on ARM

    AddressSpace *as = pci_device_iommu_address_space(dev)

    if (as == &address_space_memory) {
        return 0;
    }

    /* MSI doorbell address is translated by an IOMMU */

Note: I am currently out of the office so I am not able to reply as fast as you may wish.

Thanks

Eric

>
> Thanks
> Nicolin
>



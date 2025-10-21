Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22473CCD1A7
	for <qemu-arm@archiver.kernel.org>; Tue, 21 Oct 2025 16:27:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vBFCG-00077Z-EB; Tue, 21 Oct 2025 12:26:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vBFCE-00077J-JH
 for qemu-arm@nongnu.org; Tue, 21 Oct 2025 12:26:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vBFCB-0003Iv-4c
 for qemu-arm@nongnu.org; Tue, 21 Oct 2025 12:26:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761064004;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8nz2T+ucKGO3tyJaMQbYSd5TJ9aiRMGsqjnWOx6b7Tc=;
 b=V5YF6UK54ZrjJkqGB6ddWWpd2x/VO6i85WmH2feyjoKN3BrlY5urbmZfTfM5Yb8jjMajmN
 IOgyF/dJkI45qG2QtsRZhgT1qODTJJXtRO1R1HC3t9suCq8IgLUpjGR8opPHQ/d+qICDzY
 5gsb+CCYvOzdvR3kiksF7T8KEs6O444=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-126-ScYk85GZNLOhOxIhu-DlEA-1; Tue, 21 Oct 2025 12:26:43 -0400
X-MC-Unique: ScYk85GZNLOhOxIhu-DlEA-1
X-Mimecast-MFC-AGG-ID: ScYk85GZNLOhOxIhu-DlEA_1761064002
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-426ff59a320so7343513f8f.3
 for <qemu-arm@nongnu.org>; Tue, 21 Oct 2025 09:26:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761064002; x=1761668802;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8nz2T+ucKGO3tyJaMQbYSd5TJ9aiRMGsqjnWOx6b7Tc=;
 b=Ss+s0Q+Eq4B7VlzliaewnLdsFGQ6mzrt9vI5qIgx8DHCQM8BZfCs0PRB9GVMYE0Y0W
 430VyfppSd13kNYYF1pfHRZiDqVuOu8an4gdPRXfa8r1mojxB4KU5pN0u5tGZU8LS+Sh
 KSJ3xDUTMEP9dlkrxIi/AbxpmxA8Noqflken+noF9a2vtb1M+rZiW6jtjvh5Pvy4haGM
 pSboxEkSvhWZM6DiJFoB36VPSvXFT6iTbDQn87PT4w7yVjc5hRgcP6sMXm36L9WBTKqi
 x3n+ubJInDiDr0aquV/VjXB+/HqRLzydTV9FTFiMSr7A9BGaL0lvB6TY0GoHtfNduoS+
 RPlQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWlptn2UYWYArHCwVBLO6cuHavHNYz6AWjD5p1854RMhUCNXLvU32H/dfV1/eZuaBgArzAAQa7G3w==@nongnu.org
X-Gm-Message-State: AOJu0YxrAgLZNmAkdgntckPp5/Ll1LObLiEegpssoc1bN3+oqNcVse6o
 GUlebh966b+2hQNORUKrfbMKSlBHw1HZfKsCgr+E7y3hrzLRHGVNrV+wstSjYiDDML11ndn1O5M
 E3Cj95K27BVha/x6BzW9Ft86jqxqVpltJL1LNhQJwMgUBn/Z+hFRS+Q==
X-Gm-Gg: ASbGncv+Mg42P4w5b1cUqzrEh0Qe8Yvm+PL9cpNsDqbc4xkStZULMYhYFEtzQI+vhAV
 RujmUs2lIXAG01zHPGE6exWJKeOxOANPBB1YLrUPN8RT6dxpoPRGiXhoKE7Y0aC1+fcG7t0GRUH
 7GP6y6uwFqy2Emftzi4KhnZJNO0vZz3tV5mRqkPs+/NIRewp9lWjSWGdyUxOU+okWRyWhzFuF7j
 +mfGsK0hv7UjOt5eCcT7CpPjD+9VtUSdd6Ij4xM7P1d/6FBcbo0kVVneOQ3SK2DfVBpbOGtSEut
 ht6b+p9H/GNJVUhxseeM3BcwbSJKjO5hO96CXJ8TXeaJ/oS4E4lBgUiMFmFMbASh58mzL899L5G
 sc074
X-Received: by 2002:a05:6000:4010:b0:3e8:b4cb:c3a0 with SMTP id
 ffacd0b85a97d-42704d7e96bmr10907160f8f.8.1761064001951; 
 Tue, 21 Oct 2025 09:26:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJ6pyFK4gOkyrVwPX55uK+9c8+xhGXXtZQE5UFveyY+68PU/qjKr57Cq3oMRVGXTybS8aZ+g==
X-Received: by 2002:a05:6000:4010:b0:3e8:b4cb:c3a0 with SMTP id
 ffacd0b85a97d-42704d7e96bmr10907140f8f.8.1761064001461; 
 Tue, 21 Oct 2025 09:26:41 -0700 (PDT)
Received: from [192.168.43.95] ([78.245.103.33])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475c428a16bsm617775e9.5.2025.10.21.09.26.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Oct 2025 09:26:41 -0700 (PDT)
Message-ID: <add07edd-3652-430d-b52c-cb2bdbc7f587@redhat.com>
Date: Tue, 21 Oct 2025 18:26:39 +0200
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
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <aPZ4tcsMfN+2puGL@Asurada-Nvidia>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 17djI1_o95G24tU-YCPck00vEKoKDVpXuhY3eBt9fcQ_1761064002
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
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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

Hi Nicolin,

On 10/20/25 8:00 PM, Nicolin Chen wrote:
> On Mon, Oct 20, 2025 at 06:14:33PM +0200, Eric Auger wrote:
>>>> This will cause the device to be configured with wrong MSI doorbell
>>>> address if it return the system address space.
>>> I think it'd be nicer to elaborate why a wrong address will be returned:
>>>
>>> --------------------------------------------------------------------------
>>> On ARM, a device behind an IOMMU requires translation for its MSI doorbell
>>> address. When HW nested translation is enabled, the translation will also
>>> happen in two stages: gIOVA => gPA => ITS page.
>>>
>>> In the accelerated SMMUv3 mode, both stages are translated by the HW. So,
>>> get_address_space() returns the system address space for stage-2 mappings,
>>> as the smmuv3-accel model doesn't involve in either stage.
>> I don't understand "doesn't involve in either stage". This is still not
>> obious to me that for an HW accelerated nested IOMMU get_address_space()
>> shall return the system address space. I think this deserves to be
>> explained and maybe documented along with the callback.
> get_address_space() is used by pci_device_iommu_address_space(),
> which is for attach or translation.
>
> In QEMU, we have an "iommu" type of memory region, to represent
> the address space providing the stage-1 translation.
>
> In accel case excluding MSI, there is no need of "emulated iommu
> translation" since HW/host SMMU takes care of both stages. Thus,
> the system address is returned for get_address_space(), to avoid
> stage-1 translation and to also allow VFIO devices to attach to
> the system address space that the VFIO core will monitor to take
> care of stage-2 mappings.
but in general if you set as output 'as' the system_address_memory it
rather means you have no translation in place. This is what I am not
convinced about.

you say it aims at
- avoiding stage-1 translation - allow VFIO devices to attach to the
system address space that the VFIO core will monitor to take care of
stage-2 mappings. Can you achieve the same goals with a proper address
space?
>
>>> On the other hand, this callback is also invoked by QEMU/KVM:
>>>
>>>  kvm_irqchip_add_msi_route()
>>>    kvm_arch_fixup_msi_route()
>>>      pci_device_iommu_address_space()
>>>       get_address_space()
>>>
>>> What KVM wants is to translate an MSI doorbell gIOVA to a vITS page (gPA),
>>> so as to inject IRQs to the guest VM. And it expected get_address_space()
>>> to return the address space for stage-1 mappings instead. Apparently, this
>>> is broken.
>> "Apparently this is broken". Please clarify what is broken. Definitively if
>>
>> pci_device_iommu_address_space(dev) retruns @adress_system_memory no
>> translation is attempted.
> Hmm, I thought my writing was clear:
>  - pci_device_iommu_address_space() returns the system address
>    space that can't do a stage-1 translation.
>  - KVM/MSI pathway requires an adress space that can do a stage-1
>    translation.
understood. although I am not sure using system address space is the
best choice. But I may not be the best person to decide about this.
>
>> kvm_arch_fixup_msi_route() was introduced by 
>> https://lore.kernel.org/all/1523518688-26674-12-git-send-email-eric.auger@redhat.com/
>>
>> This relies on the vIOMMU translate callback which is supposed to be bypassed in general with VFIO devices. Isn't needed only for emulated devices?
> Not only for emulated devices.
>
> This KVM function needs the translation for the IRQ injection for
> VFIO devices as well.
understood.
>
> Although we use RMR for underlying HW to bypass the stage-1, the
> translation for gIOVA=>vITS page (VIRT_GIC_ITS) still exists in
> the guest level. FWIW, it's just doesn't have the stage-2 mapping
> because HW never uses the "gIOVA" but a hard-coded SW_MSI address.
>
> In the meantime, a VFIO device in the guest is programmed with a
> gIOVA for MSI doorbell. This gIOVA can't be used for KVM code to
> inject IRQs. It needs the gPA (i.e. VIRT_GIC_ITS). So, it needs a
> translation address space to do that.
>
> Hope this is clear now.
OK. I understand the needs but I am unsure using system address space is
the good choice.

Eric
>
> Thanks
> Nicolin
>



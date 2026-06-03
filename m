Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56182CD6E55
	for <qemu-arm@archiver.kernel.org>; Wed,  3 Jun 2026 12:41:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wUktn-0000eK-Ic; Wed, 03 Jun 2026 08:40:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1wUktk-0000dx-J4
 for qemu-arm@nongnu.org; Wed, 03 Jun 2026 08:40:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1wUkti-0005UF-RZ
 for qemu-arm@nongnu.org; Wed, 03 Jun 2026 08:40:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1780490436;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6CTQsTfB/y5Z0JExycOEDqIy/qa7iPzuMopFTHJSM1U=;
 b=IpG9pn7VZJk3N17JchAamdPk4EpVJ/D8WavYL4nITEIM8l7eyUT0LbyMFYyo//pZLjzsoD
 iW/eICQ7YjTrb5mjJbYFfCjPuYFCTKwYDkDlqeysG25CHoyQT/7P5fDymyO5I+GVHwt9qR
 jK/CzJknGdCJ0WMzIy1SBHM3Uk6pCFM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-569-3Xb6d0DiNUGtAnB3P0vX-g-1; Wed, 03 Jun 2026 08:40:35 -0400
X-MC-Unique: 3Xb6d0DiNUGtAnB3P0vX-g-1
X-Mimecast-MFC-AGG-ID: 3Xb6d0DiNUGtAnB3P0vX-g_1780490432
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-490b7959b9fso7200895e9.2
 for <qemu-arm@nongnu.org>; Wed, 03 Jun 2026 05:40:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780490432; x=1781095232;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6CTQsTfB/y5Z0JExycOEDqIy/qa7iPzuMopFTHJSM1U=;
 b=Sg4W7k/BQtelaDss7ensAci7VikEL2Jjzo/At8fJ+JYJ4xZFE/fJoSKjOEQZieNm/O
 5n3iKcXxLRlouJxvnDJBGGwa/Y5IrDqGh35FsGvHYCNvOk3Aq2O5D4Y/G3V+MHWWPtA+
 py95YS2biSd6ergKBr3fABz4gpG+NHpNt7XK/do2nul7AQ4fpTaJlBo21dlvlbKu66Xo
 oToFKz4Ag7zbX2BhhvBQ6QjeQ+3f3e0+ljPpGuMkZgFK1TGe8LTISaSPl80ipY4KEwk/
 juz3QZs6B8Fzx0okNXixlyuOzQHDfonlmXO+nWPCwLTjYikhhpY2HnU4WH6ru6psj5Zf
 mN1w==
X-Forwarded-Encrypted: i=1;
 AFNElJ9oBZ/iHV9XB5oYMVSSSutzXQcAtJMH0UZF/IdJuFl/f/FyBBy+VkYfYvkXW5J+cfDXL7UArBgbew==@nongnu.org
X-Gm-Message-State: AOJu0YwrP5e6/Yf9088welQ5bzmOnCUCDw9Ti5IH74oNnIH2XcWrwVp6
 H7uKjNbj/r50rfIccmf9BRWv6HZ7lhbbp0YxMuBbXaXmP7Xo59F6S4aQGkjcF6oDwWh6AuHhUeJ
 h4bPWur6Z64BsHQXAirUYYyPb7ueSwcljd6a/5aU6so6i7dIZQX+AUg==
X-Gm-Gg: Acq92OHrpGKpJ+upLUsUi4jtbpIuGlk/04jaT5WMQRTqjl6KcixwIrESpnFE4zo04vh
 XSum+PLqX6cqv3IDakbVRBtMyzd2FyKwQ3PySp5ASlewd0H1aLOgvpi31A3UkUmWVn4unLncSdD
 CsVTCRmndNWAorGja3ZOVj1cipML72w/woRYwyoOkR34PXqb3FaUnkwTTsgXixGygBeWaJRU2ai
 IYvo72vVl3UssDMz6T3Vtbo8hGF9qhf+WvoPzuaGkKwXQ/hScSHnP0Ki93kuJdv4D1ewZiUa1gr
 8zarZE8tVlmgW5eiCnrBueASCKhI3OJrTyddf/NTY1uWmOJs1cwfdpPswQZkjjh7KbLq+dFb1wK
 eEnR/5BXBQ4YKjkx49jUjJo+uK8CtXKyOcXzYWd5dnCXrat1SULSXyZudD1wEW0TzYgoQx1g1rR
 A=
X-Received: by 2002:a05:600c:859b:b0:490:acb8:1490 with SMTP id
 5b1f17b1804b1-490b5e94e91mr46296475e9.4.1780490431843; 
 Wed, 03 Jun 2026 05:40:31 -0700 (PDT)
X-Received: by 2002:a05:600c:859b:b0:490:acb8:1490 with SMTP id
 5b1f17b1804b1-490b5e94e91mr46296005e9.4.1780490431488; 
 Wed, 03 Jun 2026 05:40:31 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f345209sm7136048f8f.17.2026.06.03.05.40.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jun 2026 05:40:30 -0700 (PDT)
Message-ID: <a745b87b-85c3-43c5-8059-36797588c190@redhat.com>
Date: Wed, 3 Jun 2026 14:40:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/pci/pci: Enforce pci_setup_iommu_per_bus() is called
 only once per bus
To: eric.auger@redhat.com, Nicolin Chen <nicolinc@nvidia.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, mst@redhat.com, skolothumtho@nvidia.com,
 nathanc@nvidia.com
References: <20260323183024.4069032-1-eric.auger@redhat.com>
 <aco9ECUbZ1+QvbOR@nvidia.com>
 <5ccbdd38-e63f-4a4a-8d28-9621bf8883fe@redhat.com>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <5ccbdd38-e63f-4a4a-8d28-9621bf8883fe@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: UK8xZExWJAGwEfGwime7b4pIvZ9Tfa8RI8Vm68BntuQ_1780490432
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi Nicolin,

On 3/31/26 5:06 PM, Eric Auger wrote:
> 
> 
> On 3/30/26 11:06 AM, Nicolin Chen wrote:
>> On Mon, Mar 23, 2026 at 07:30:20PM +0100, Eric Auger wrote:
>>> @@ -3307,11 +3307,16 @@ void pci_setup_iommu(PCIBus *bus, const PCIIOMMUOps *ops, void *opaque)
>>>   * IOMMU ops are returned, avoiding the use of the parent’s IOMMU when
>>>   * it's not appropriate.
>>>   */
>>> -void pci_setup_iommu_per_bus(PCIBus *bus, const PCIIOMMUOps *ops,
>>> -                             void *opaque)
>>> +bool pci_setup_iommu_per_bus(PCIBus *bus, const PCIIOMMUOps *ops,
>>> +                             void *opaque, Error **errp)
>>>  {
>>> +    if (bus->iommu_per_bus) {
>>> +        error_setg(errp, "An iommu is already attached to this bus");
>>> +        return false;
>>> +    }
>>>      pci_setup_iommu(bus, ops, opaque);
>>>      bus->iommu_per_bus = true;
>>> +    return true;
>> Do we need the same check in pci_setup_iommu()?
I further looked at it. pci_setup_iommu registers a machine wide iommu.
Only ARM uses pci_setup_iommu_per_bus for now and usage of both
pci_setup_iommu and pci_setup_iommu_per_bus are exclusive and check is
done at machine level.

So I think it is reasonable for now to keep that change limited to
pci_setup_iommu_per_bus.

Needs a rebase though, including Philippe's suggestion.

Thanks

Eric


> 
> For machine wide IOMMU the check is handled in machine code (at least in
> arm virt).
> 
> Nevertheless a more generic solution could be to check in
> pci_setup_iommu() that bus->iommu_ops is not already set. If set, return
> an error, cascaded up through pci_setup_iommu() and
> pci_setup_iommu_per_bus().
> However the change is much more invasive and impacts several archs. What
> do you think?
> 
> I don't think this can be a valid use case to call pci_setup_iommu()
> several times on the same bus?
>>
>> Apart from this question,
>>
>> Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
> 
> Thanks
> 
> Eric
>>
> 



Received: by 2002:a17:906:acd:b0:a66:557b:2f6e with SMTP id z13csp573854ejf;
        Thu, 6 Jun 2024 14:18:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUJ/gtJuiq6cy2uyYC3KiZNbB953IM10MNR/CXtHuDWGOgXa9HgcEUBIdpKXPIsBqceZeakzFeDLkozdTgVpRsqZ33rfaO/
X-Google-Smtp-Source: AGHT+IHngFCOnOlL3aCjJVzlVDmkg2AHmxA+SwwpHO7+diJFBBKC6gf4BZhL28MG2MJ56YeAYl9I
X-Received: by 2002:a05:6871:20b:b0:24f:d9de:3bf9 with SMTP id 586e51a60fabf-2546488b63bmr716978fac.47.1717708724783;
        Thu, 06 Jun 2024 14:18:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717708724; cv=none;
        d=google.com; s=arc-20160816;
        b=ro7R7NszdGr72ml5g3aVWTOM3Huwfjsj8ZnE160+lF8JgEhP5ZjymNV9Tq9fTjGClg
         1kVnwVgmxPBp1Ct7bpH5ileJgn8AgQoHIvVgXQlTjszaExS1mOKHxubko/TUhzlLE4tL
         m8iIf9w0rjceHroHyrJeW2xKpTqMv1Gg05e+Kb58Whi3KU/hK6SP90DY7HfoITJR7JTc
         AMzEhIZFhg6MYfjpyc7eV1xD+GxkFDFqcwRXWZODilPx7bAMkiZlHvngYhH+z+46fFFJ
         97W/6GstHEzfPFIICx7uZAj1xJaxImNvLBpTr55hbhOou/Xm2SWiPdGy2xJ+DHPc7UO3
         LG/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:content-language:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=BGRKZEv6UOwQTp+oLKNdmAbeyKWNYWiZ/Lt4SNhIFJk=;
        fh=88hOMR5gbLnZiOppMWEFSAw11WqkgEU5gXoj354YuiI=;
        b=d0/dj2gfOIM4QieprNdyIchxYsw+MQXw34lEMrS0IbHdhrVWIqYis5pSh8F+X7Vu2i
         mfTcf8dRieLkiZYus6EPRqDMqvNsP66UL7sqzqNXO6meOXGRu63R0xrg5/p/6OWeXhXr
         ZVFNSceE0KED1xjub+bIx4oNZPX6oV4DsxmZlPSNKrQxg4SpmciduWSlozeLIzQ+aYfb
         46KIeHOCE3gpgXYm9Od3hsve7s2K1249kemwoJp+7cuqPJ9s5tzUVCQT6De4xSkt88HJ
         uFiz1RUayZ6MbOjVYCflo+IUEBJg2KeveE0wxNzOIz/26MHNmu+1jjJpjg1yML9pqkjp
         PEjw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=arm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7953284d9e4si224769485a.74.2024.06.06.14.18.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Jun 2024 14:18:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=arm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sFKVA-00085w-4d; Thu, 06 Jun 2024 17:18:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robin.murphy@arm.com>)
 id 1sFKV8-00085g-QG; Thu, 06 Jun 2024 17:18:26 -0400
Received: from foss.arm.com ([217.140.110.172])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <robin.murphy@arm.com>)
 id 1sFKV5-0001wM-Cu; Thu, 06 Jun 2024 17:18:26 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CBB5F2F4;
 Thu,  6 Jun 2024 14:18:43 -0700 (PDT)
Received: from [10.57.70.245] (unknown [10.57.70.245])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8631F3F792;
 Thu,  6 Jun 2024 14:18:17 -0700 (PDT)
Message-ID: <6e67a59a-7ed6-46c1-b9ba-884800005c81@arm.com>
Date: Thu, 6 Jun 2024 22:18:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] hw/arm/virt: Avoid unexpected warning from Linux
 guest on host with Fujitsu CPUs
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Zhenyu Zhang <zhenyzha@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, gshan@redhat.com, eauger@redhat.com,
 sebott@redhat.com, cohuck@redhat.com, ddutile@redhat.com, shahuang@redhat.com
References: <20240606104745.291330-1-zhenyzha@redhat.com>
 <CAFEAcA_ovHZWFi8Xn1YdPNkFjNWQ+BGQTA0Oc9oXTNuPD+bmmA@mail.gmail.com>
 <20240606181338.00003336@Huawei.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20240606181338.00003336@Huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=217.140.110.172;
 envelope-from=robin.murphy@arm.com; helo=foss.arm.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 0nkUZ7w7rvpr

On 2024-06-06 6:13 pm, Jonathan Cameron wrote:
> On Thu, 6 Jun 2024 12:56:59 +0100
> Peter Maydell <peter.maydell@linaro.org> wrote:
> 
>> On Thu, 6 Jun 2024 at 11:48, Zhenyu Zhang <zhenyzha@redhat.com> wrote:
>>>
>>> Multiple warning messages and corresponding backtraces are observed when Linux
>>> guest is booted on the host with Fujitsu CPUs. One of them is shown as below.
>>>
>>> [    0.032443] ------------[ cut here ]------------
>>> [    0.032446] uart-pl011 9000000.pl011: ARCH_DMA_MINALIGN smaller than CTR_EL0.CWG (128 < 256)
>>> [    0.032454] WARNING: CPU: 0 PID: 1 at arch/arm64/mm/dma-mapping.c:54 arch_setup_dma_ops+0xbc/0xcc
>>> [    0.032470] Modules linked in:
>>> [    0.032475] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.14.0-452.el9.aarch64 #1
>>> [    0.032481] Hardware name: linux,dummy-virt (DT)
>>> [    0.032484] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>>> [    0.032490] pc : arch_setup_dma_ops+0xbc/0xcc
>>> [    0.032496] lr : arch_setup_dma_ops+0xbc/0xcc
>>> [    0.032501] sp : ffff80008003b860
>>> [    0.032503] x29: ffff80008003b860 x28: 0000000000000000 x27: ffffaae4b949049c
>>> [    0.032510] x26: 0000000000000000 x25: 0000000000000000 x24: 0000000000000000
>>> [    0.032517] x23: 0000000000000100 x22: 0000000000000000 x21: 0000000000000000
>>> [    0.032523] x20: 0000000100000000 x19: ffff2f06c02ea400 x18: ffffffffffffffff
>>> [    0.032529] x17: 00000000208a5f76 x16: 000000006589dbcb x15: ffffaae4ba071c89
>>> [    0.032535] x14: 0000000000000000 x13: ffffaae4ba071c84 x12: 455f525443206e61
>>> [    0.032541] x11: 68742072656c6c61 x10: 0000000000000029 x9 : ffffaae4b7d21da4
>>> [    0.032547] x8 : 0000000000000029 x7 : 4c414e494d5f414d x6 : 0000000000000029
>>> [    0.032553] x5 : 000000000000000f x4 : ffffaae4b9617a00 x3 : 0000000000000001
>>> [    0.032558] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff2f06c029be40
>>> [    0.032564] Call trace:
>>> [    0.032566]  arch_setup_dma_ops+0xbc/0xcc
>>> [    0.032572]  of_dma_configure_id+0x138/0x300
>>> [    0.032591]  amba_dma_configure+0x34/0xc0
>>> [    0.032600]  really_probe+0x78/0x3dc
>>> [    0.032614]  __driver_probe_device+0x108/0x160
>>> [    0.032619]  driver_probe_device+0x44/0x114
>>> [    0.032624]  __device_attach_driver+0xb8/0x14c
>>> [    0.032629]  bus_for_each_drv+0x88/0xe4
>>> [    0.032634]  __device_attach+0xb0/0x1e0
>>> [    0.032638]  device_initial_probe+0x18/0x20
>>> [    0.032643]  bus_probe_device+0xa8/0xb0
>>> [    0.032648]  device_add+0x4b4/0x6c0
>>> [    0.032652]  amba_device_try_add.part.0+0x48/0x360
>>> [    0.032657]  amba_device_add+0x104/0x144
>>> [    0.032662]  of_amba_device_create.isra.0+0x100/0x1c4
>>> [    0.032666]  of_platform_bus_create+0x294/0x35c
>>> [    0.032669]  of_platform_populate+0x5c/0x150
>>> [    0.032672]  of_platform_default_populate_init+0xd0/0xec
>>> [    0.032697]  do_one_initcall+0x4c/0x2e0
>>> [    0.032701]  do_initcalls+0x100/0x13c
>>> [    0.032707]  kernel_init_freeable+0x1c8/0x21c
>>> [    0.032712]  kernel_init+0x28/0x140
>>> [    0.032731]  ret_from_fork+0x10/0x20
>>> [    0.032735] ---[ end trace 0000000000000000 ]---
>>>
>>> In Linux, a check is applied to every device which is exposed through device-tree
>>> node. The warning message is raised when the device isn't DMA coherent and the
>>> cache line size is larger than ARCH_DMA_MINALIGN (128 bytes). The cache line is
>>> sorted from CTR_EL0[CWG], which corresponds to 256 bytes on the guest CPUs.
>>> The DMA coherent capability is claimed through 'dma-coherent' in their
>>> device-tree nodes.
>>
>> For QEMU emulated all our DMA is always coherent, so where we
>> have DMA-capable devices we should definitely tell the kernel
>> that that DMA is coherent.

The trick for that is to put the "dma-coherent" property right in the 
root of the DT so it plausibly communicates "the whole platform is 
coherent", and is then inherited by all devices, even those which 
shouldn't technically need it.

>> Our pl011 does not do DMA, though (we do not set the dmas property), so
>> it's kind of bogus for the kernel to complain about that.

The issue there is, per the history Jonathan dug up, DT on Arm got the 
assumption baked into it from day one that "dma-ranges" was implied for 
simple-bus and similar, and thus there is no easy generic way to 
indicate that any MMIO device *can't* do DMA. For Linux this means we 
end up having to assume that everything *might* be DMA-capable, since 
the only thing which knows for sure is a driver, but we have further 
legacy in the driver model which means we have to do perform the basic 
DMA setup for any device *before* its driver probes. Yes, it's a bit 
rubbish; feel free to shake your fist at the past.

(At least we learned and got it right in ACPI for arm64 by making the 
_CCA method mandatory for DMA-capable devices...)

>> So I think we should take these changes where they refer to DMA
>> capable devices and ask the kernel folks to fix the warnings
>> where they refer to devices that aren't doing DMA. Looking through
>> the patch, though, my initial impression is that all these are
>> in the latter category...
> 
> I was curious and have a very slow test running, so took a look.
> of_dma_configure() is being passed force_dma = true.
> https://elixir.bootlin.com/linux/v6.10-rc2/source/drivers/amba/bus.c#L361
> 
> The is a comment in of_dma_configure()
> 		/*
> 		 * For legacy reasons, we have to assume some devices need
> 		 * DMA configuration regardless of whether "dma-ranges" is
> 		 * correctly specified or not.
> 		 */
> So this I think this is being triggered by a workaround for broken DT.
> 
> This was introduced by Robin Murphy +CC though you may need to ask on
> kernel list because ARM / QEMU fun.
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=723288836628b
> 
> Relevant comment from that patch description:
> 
> "Certain bus types have a general expectation of
> DMA capability and carry a well-established precedent that an absent
> "dma-ranges" implies the same as the empty property, so we automatically
> opt those in to DMA configuration regardless, to avoid regressing most
> existing platforms."
> 
> The patch implies that AMBA is one of those.
> 
> So not sure this is solveable without a hack such as eliding the warning
> message if dma_force was set as the situation probably isn't relevant then..

Except it absolutely is, because the whole reason for setting force_dma 
on those buses is that they *do* commonly have DMA-capable devices, and 
they are also commonly non-coherent such that this condition would be 
serious. Especially AMBA, given that the things old enough to still be 
using that abstraction rather than plain platform (PL080, PL111, 
PL330,...) all predate ACE-Lite so don't even have the *possibility* of 
being coherent without external trickery in the interconnect.

Thanks,
Robin.

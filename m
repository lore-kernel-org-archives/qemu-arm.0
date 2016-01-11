Received: by 10.25.134.130 with SMTP id i124csp1951402lfd;
        Mon, 11 Jan 2016 05:04:50 -0800 (PST)
X-Received: by 10.31.180.145 with SMTP id d139mr78876460vkf.83.1452517489269;
        Mon, 11 Jan 2016 05:04:49 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-vk0-x22f.google.com (mail-vk0-x22f.google.com. [2607:f8b0:400c:c05::22f])
        by mx.google.com with ESMTPS id l18si63332189vke.96.2016.01.11.05.04.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 Jan 2016 05:04:49 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::22f as permitted sender) client-ip=2607:f8b0:400c:c05::22f;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::22f as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dkim=pass header.i=@linaro.org
Received: by mail-vk0-x22f.google.com with SMTP id k1so223520606vkb.2
        for <alex.bennee@linaro.org>; Mon, 11 Jan 2016 05:04:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=Z9mnttMTcjfpN9D1nI7rq5purjLGzDht8Wzy+zyrVzQ=;
        b=jcjowbnktAjURl7OV2EgKdV9MArwHaOQVvpH2J+NhA4SDGHHgL8sgt2eVY4Z2+/jKx
         pSocguq760JLkMFP7b/h0Kzb14aG9YseSHiDWn+Z1n83PTm0Px4uJwAdzcqry2MzqCLs
         7xt9ndhwSG0A3V12/DfO5AOQGO5CPCjo7ATkc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type;
        bh=Z9mnttMTcjfpN9D1nI7rq5purjLGzDht8Wzy+zyrVzQ=;
        b=Tnqh5By4SsSG06UD9oNlpPTTs0tWXmCF14a+q0HwRhz7BW+SoF4mmPdxjcIVa4hqJq
         tC2/sI0Tsm2vfEeJIN2XNQZ8YN3n2sksvjhtxRuIDdV8yM6N66w/sqmGoXR7MxqR7JYj
         x67saa9DmxkCkRDD3JJ0kDjjFMnVwXzwinCVd170f5ubGz4SWOxuMv6R2yvcLmCMcRQ3
         dzBC6rbpd/l68hvDfl4GAipwY/qmA1B8grZnrbqcrnMBHKiVm71sO/1AkyJgnr+SiSGE
         fGb+2zk7IoXbe0lBiGSW1T8oTjeylXXhwsgrl0iIN5izqDEt3MdlUj9MU7OJrhq+xpt4
         4KWg==
X-Gm-Message-State: ALoCoQn0m4jCC04gFxIOSg2qKuR3axS6aI2cSyZ3e+4yxS2iu6niRVAHef1Mz7p2sNCGyNviTCMX669ftMLl7N4NVludxDcEyjS4CTGAGruZEkZPUQh8YZU=
X-Received: by 10.31.52.147 with SMTP id b141mr80978013vka.82.1452517488871;
 Mon, 11 Jan 2016 05:04:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Mon, 11 Jan 2016 05:04:29 -0800 (PST)
In-Reply-To: <CAFEAcA_gObmE=dpG-sbB4xDUXWN2Gy5hkruMvhPGFAyueZ034Q@mail.gmail.com>
References: <1447682723-3977-1-git-send-email-peter.maydell@linaro.org> <CAFEAcA_gObmE=dpG-sbB4xDUXWN2Gy5hkruMvhPGFAyueZ034Q@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Jan 2016 13:04:29 +0000
Message-ID: <CAFEAcA8=gJRZ_NiYi7db3BJ17AxKH+AUGPqsYL9JGWSP2zAL=g@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v2 00/19] Add support for multiple address
 spaces per CPU and use it for ARM TrustZone
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: Patch Tracking <patches@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Content-Type: text/plain; charset=UTF-8
X-TUID: W6fcenob2s0q

Ping again (though I know Paolo said on IRC he'd put this on
his list to look at). I have a rebased branch at
  https://git.linaro.org/people/peter.maydell/qemu-arm.git multi-ases-2
but the only differences are some minor fixes to conflicts in
the virt board patches following the GPIO device going into master,
so I'm not going to resend the patchset unless somebody specifically
wants me to -- I think the patches on list should be ok for review
purposes.

thanks
-- PMM

On 15 December 2015 at 16:26, Peter Maydell <peter.maydell@linaro.org> wrote:
> Ping for a review request now we're pretty nearly done with 2.5 ?
>
> thanks
> -- PMM
>
>
> On 16 November 2015 at 14:05, Peter Maydell <peter.maydell@linaro.org> wrote:
>> This patch series adds support to QEMU's core exec/memory code for
>> CPUs which have more than one address space, and uses it for
>> ARM TrustZone. In particular, a TZ CPU will have two physical
>> address spaces (Secure and Non-secure), and the patchset allows a
>> board model to create these both separately and connect them to
>> the CPU, so that we can have devices or memory which are visible
>> only in the Secure address space. (We already have support for
>> TZ in the CPU emulation itself, and support for devices like the
>> GIC which respond differently to Secure and Non-secure accesses,
>> so this is the last part of the puzzle for 32-bit.)
>>
>> The general approach is that we allow a target-* cpu to define
>> more than one address space at initialization, allocating each
>> one a small integer "address space index" (asidx). The target CPU
>> also defines the mapping from memory transaction attributes to
>> the asidx via a new QOM CPU method asidx_from_attrs. The memory
>> and cputlb core code then use the asidx to look up memory regions
>> in the correct AddressSpace (both at TLB fill time and in the
>> io_read/write stage at runtime).
>>
>> Changes since v1:
>>  * the biggest change is that rather than having the target-cpu
>>    code pass us an asidx and storing asidxes in the IOTLB, we
>>    now determine the address space index from the memory transaction
>>    attributes. This has had effects all through the patchstack.
>>  * some reshuffling of patch order (among other things, all the
>>    core patches are now at the front, with the target-arm patches
>>    next and the virt board last).
>>  * added missing object_ref(OBJECT(cpu->memory)) when setting the
>>    default value of cpu->memory
>>  * don't allow sharing of ASes that weren't created via
>>    address_space_init_shareable
>>  * now only allocate cpu_ases array once (target has to set
>>    cpu->num_ases before first call to cpu_address_space_init())
>>  * new patch documenting tlb_set_page_with_attrs -- I no longer need
>>    to add a new argument to this function, but didn't want to throw
>>    away the doc comment I'd written...
>>
>> The 'add secure memory region to virt board' patch is still RFC
>> because the device tree binding to say "device is secure-only" is
>> still under discussion on the kernel mailing list; patch 19
>> is a pure hack, and is here for testing purposes only.
>>
>> You can run OP-TEE on QEMU with these patches:
>> see https://github.com/OP-TEE/optee_os for details of how to
>> get, build and run it. The 'make run' will use the custom QEMU
>> version that comes with OP-TEE (do that first to make sure your
>> OP-TEE has built and works ok). To get it to use a locally built QEMU
>> with these patches do:
>>
>> make run-only QEMU_PATH=/path/to/your/qemu/build/directory QEMU_EXTRA_ARGS='-machine secure=on'
>>
>> Notes on a couple of things the patchset doesn't address:
>>  (1) image/romfile/kernel loading etc will load only into the nonsecure
>> address space. This would be conceptually simple to implement (you just
>> need to pass an AS into lots of functions) but since OP-TEE doesn't need
>> it I felt it could safely be left for later rather than making this
>> patchset bigger.
>>
>>  (2) Using multiple address spaces in one CPU won't work with KVM
>> (and we assert if you try; nothing at the moment will attempt it).
>> Using different address spaces in different CPUs in an SMP setup
>> will also not work with KVM, but we don't assert on that because
>> I wasn't sure where best to put the assert. (Also, it would be
>> nice if we could do that, because the modelling for ARM SMP
>> setups would really be cleaner if we could put the per-CPU
>> devices and so on in a set of per-CPU ASes.)
>>
>> You can find a git branch with this patchset in here:
>>  https://git.linaro.org/people/peter.maydell/qemu-arm.git multi-ases
>>
>> thanks
>> -- PMM
>>
>>
>> Peter Crosthwaite (2):
>>   memory: Add address_space_init_shareable()
>>   qom/cpu: Add MemoryRegion property
>>
>> Peter Maydell (17):
>>   exec.c: Don't set cpu->as until cpu_address_space_init
>>   exec.c: Allow target CPUs to define multiple AddressSpaces
>>   exec-all.h: Document tlb_set_page_with_attrs, tlb_set_page
>>   include/qom/cpu.h: Add new get_phys_page_attrs_debug method
>>   include/qom/cpu.h: Add new asidx_from_attrs method
>>   cputlb.c: Use correct address space when looking up
>>     MemoryRegionSection
>>   exec.c: Pass MemTxAttrs to iotlb_to_region so it uses the right AS
>>   exec.c: Add cpu_get_address_space()
>>   exec.c: Use cpu_get_phys_page_attrs_debug
>>   exec.c: Use correct AddressSpace in watch_mem_read and watch_mem_write
>>   target-arm: Add QOM property for Secure memory region
>>   target-arm: Implement asidx_from_attrs
>>   target-arm: Implement cpu_get_phys_page_attrs_debug
>>   target-arm: Support multiple address spaces in page table walks
>>   hw/arm/virt: Wire up memory region to CPUs explicitly
>>   [RFC] hw/arm/virt: add secure memory region and UART
>>   HACK: rearrange the virt memory map to suit OP-TEE
>>
>>  cpus.c                  |  13 +++++-
>>  cputlb.c                |   9 +++--
>>  exec.c                  | 103 +++++++++++++++++++++++++++++++++++-------------
>>  hw/arm/virt.c           |  66 +++++++++++++++++++++++++------
>>  include/exec/exec-all.h |  69 ++++++++++++++++++++++++++++----
>>  include/exec/memory.h   |  18 +++++++++
>>  include/hw/arm/virt.h   |   1 +
>>  include/qom/cpu.h       |  57 ++++++++++++++++++++++++++-
>>  memory.c                |  27 +++++++++++++
>>  softmmu_template.h      |   4 +-
>>  target-arm/cpu-qom.h    |   6 ++-
>>  target-arm/cpu.c        |  35 +++++++++++++++-
>>  target-arm/cpu.h        |  23 +++++++++++
>>  target-arm/helper.c     |  15 ++++---
>>  target-i386/cpu.c       |   7 +++-
>>  15 files changed, 389 insertions(+), 64 deletions(-)
>>
>> --
>> 1.9.1

Received: by 10.25.159.19 with SMTP id i19csp522278lfe;
        Tue, 12 Jan 2016 05:56:21 -0800 (PST)
X-Received: by 10.66.254.99 with SMTP id ah3mr52769484pad.71.1452606981025;
        Tue, 12 Jan 2016 05:56:21 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-pf0-x241.google.com (mail-pf0-x241.google.com. [2607:f8b0:400e:c00::241])
        by mx.google.com with ESMTPS id 73si36421605pfl.31.2016.01.12.05.56.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 12 Jan 2016 05:56:21 -0800 (PST)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c00::241 as permitted sender) client-ip=2607:f8b0:400e:c00::241;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c00::241 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-pf0-x241.google.com with SMTP id n128so4875461pfn.3;
        Tue, 12 Jan 2016 05:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-type:content-disposition:in-reply-to:user-agent;
        bh=9gS3iJJ0Nc08Z+kXLZOSuDok7IjKhz3EcWRcIjAOkQY=;
        b=0+saJdNhBgcc6JJtujffA6Hd44yvLkACwFFO9vd1rQPL1uaMPmbahNQYqj+wtWaUka
         2mBd+2YYbFl+h7Jtu1HuL9mcqILFKzlX0nbNi5MbjaTDGhkFpqMmhcnddjgWjeUHD7d9
         9HOyznQFEIn8lWadfqEA4ysCBor727Yl1BlnQuEzEhfJTnq8Uy46LbOKQeMjUznjwrB3
         UHI7/N2gzfiXTVdTcczjAFSQr7XF3hqR5L15REw+icIIhN9h1/I2XA1Au/tLi/BknV4f
         GS/2qitImTkVqDE+7yA3yWEJvU46379ogTvzu0BnmTyj8uYUhoj2r8ymaoqwZ/WPprHi
         28+Q==
X-Received: by 10.98.14.209 with SMTP id 78mr5108753pfo.157.1452606980681;
        Tue, 12 Jan 2016 05:56:20 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from localhost (ec2-52-8-89-49.us-west-1.compute.amazonaws.com. [52.8.89.49])
        by smtp.gmail.com with ESMTPSA id u21sm30765907pfi.15.2016.01.12.05.56.18
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 12 Jan 2016 05:56:20 -0800 (PST)
Date: Tue, 12 Jan 2016 14:56:16 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Subject: Re: [Qemu-devel] [PATCH v2 00/19] Add support for multiple address
 spaces per CPU and use it for ARM TrustZone
Message-ID: <20160112135615.GD29396@toto>
References: <1447682723-3977-1-git-send-email-peter.maydell@linaro.org>
 <CAFEAcA_gObmE=dpG-sbB4xDUXWN2Gy5hkruMvhPGFAyueZ034Q@mail.gmail.com>
 <CAFEAcA8=gJRZ_NiYi7db3BJ17AxKH+AUGPqsYL9JGWSP2zAL=g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA8=gJRZ_NiYi7db3BJ17AxKH+AUGPqsYL9JGWSP2zAL=g@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TUID: SM28LFmpH1bL

On Mon, Jan 11, 2016 at 01:04:29PM +0000, Peter Maydell wrote:
> Ping again (though I know Paolo said on IRC he'd put this on
> his list to look at). I have a rebased branch at
>   https://git.linaro.org/people/peter.maydell/qemu-arm.git multi-ases-2
> but the only differences are some minor fixes to conflicts in
> the virt board patches following the GPIO device going into master,
> so I'm not going to resend the patchset unless somebody specifically
> wants me to -- I think the patches on list should be ok for review
> purposes.

I haven't done a full review again but overall it looks good to me.

Acked-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Cheers,
Edgar


> 
> thanks
> -- PMM
> 
> On 15 December 2015 at 16:26, Peter Maydell <peter.maydell@linaro.org> wrote:
> > Ping for a review request now we're pretty nearly done with 2.5 ?
> >
> > thanks
> > -- PMM
> >
> >
> > On 16 November 2015 at 14:05, Peter Maydell <peter.maydell@linaro.org> wrote:
> >> This patch series adds support to QEMU's core exec/memory code for
> >> CPUs which have more than one address space, and uses it for
> >> ARM TrustZone. In particular, a TZ CPU will have two physical
> >> address spaces (Secure and Non-secure), and the patchset allows a
> >> board model to create these both separately and connect them to
> >> the CPU, so that we can have devices or memory which are visible
> >> only in the Secure address space. (We already have support for
> >> TZ in the CPU emulation itself, and support for devices like the
> >> GIC which respond differently to Secure and Non-secure accesses,
> >> so this is the last part of the puzzle for 32-bit.)
> >>
> >> The general approach is that we allow a target-* cpu to define
> >> more than one address space at initialization, allocating each
> >> one a small integer "address space index" (asidx). The target CPU
> >> also defines the mapping from memory transaction attributes to
> >> the asidx via a new QOM CPU method asidx_from_attrs. The memory
> >> and cputlb core code then use the asidx to look up memory regions
> >> in the correct AddressSpace (both at TLB fill time and in the
> >> io_read/write stage at runtime).
> >>
> >> Changes since v1:
> >>  * the biggest change is that rather than having the target-cpu
> >>    code pass us an asidx and storing asidxes in the IOTLB, we
> >>    now determine the address space index from the memory transaction
> >>    attributes. This has had effects all through the patchstack.
> >>  * some reshuffling of patch order (among other things, all the
> >>    core patches are now at the front, with the target-arm patches
> >>    next and the virt board last).
> >>  * added missing object_ref(OBJECT(cpu->memory)) when setting the
> >>    default value of cpu->memory
> >>  * don't allow sharing of ASes that weren't created via
> >>    address_space_init_shareable
> >>  * now only allocate cpu_ases array once (target has to set
> >>    cpu->num_ases before first call to cpu_address_space_init())
> >>  * new patch documenting tlb_set_page_with_attrs -- I no longer need
> >>    to add a new argument to this function, but didn't want to throw
> >>    away the doc comment I'd written...
> >>
> >> The 'add secure memory region to virt board' patch is still RFC
> >> because the device tree binding to say "device is secure-only" is
> >> still under discussion on the kernel mailing list; patch 19
> >> is a pure hack, and is here for testing purposes only.
> >>
> >> You can run OP-TEE on QEMU with these patches:
> >> see https://github.com/OP-TEE/optee_os for details of how to
> >> get, build and run it. The 'make run' will use the custom QEMU
> >> version that comes with OP-TEE (do that first to make sure your
> >> OP-TEE has built and works ok). To get it to use a locally built QEMU
> >> with these patches do:
> >>
> >> make run-only QEMU_PATH=/path/to/your/qemu/build/directory QEMU_EXTRA_ARGS='-machine secure=on'
> >>
> >> Notes on a couple of things the patchset doesn't address:
> >>  (1) image/romfile/kernel loading etc will load only into the nonsecure
> >> address space. This would be conceptually simple to implement (you just
> >> need to pass an AS into lots of functions) but since OP-TEE doesn't need
> >> it I felt it could safely be left for later rather than making this
> >> patchset bigger.
> >>
> >>  (2) Using multiple address spaces in one CPU won't work with KVM
> >> (and we assert if you try; nothing at the moment will attempt it).
> >> Using different address spaces in different CPUs in an SMP setup
> >> will also not work with KVM, but we don't assert on that because
> >> I wasn't sure where best to put the assert. (Also, it would be
> >> nice if we could do that, because the modelling for ARM SMP
> >> setups would really be cleaner if we could put the per-CPU
> >> devices and so on in a set of per-CPU ASes.)
> >>
> >> You can find a git branch with this patchset in here:
> >>  https://git.linaro.org/people/peter.maydell/qemu-arm.git multi-ases
> >>
> >> thanks
> >> -- PMM
> >>
> >>
> >> Peter Crosthwaite (2):
> >>   memory: Add address_space_init_shareable()
> >>   qom/cpu: Add MemoryRegion property
> >>
> >> Peter Maydell (17):
> >>   exec.c: Don't set cpu->as until cpu_address_space_init
> >>   exec.c: Allow target CPUs to define multiple AddressSpaces
> >>   exec-all.h: Document tlb_set_page_with_attrs, tlb_set_page
> >>   include/qom/cpu.h: Add new get_phys_page_attrs_debug method
> >>   include/qom/cpu.h: Add new asidx_from_attrs method
> >>   cputlb.c: Use correct address space when looking up
> >>     MemoryRegionSection
> >>   exec.c: Pass MemTxAttrs to iotlb_to_region so it uses the right AS
> >>   exec.c: Add cpu_get_address_space()
> >>   exec.c: Use cpu_get_phys_page_attrs_debug
> >>   exec.c: Use correct AddressSpace in watch_mem_read and watch_mem_write
> >>   target-arm: Add QOM property for Secure memory region
> >>   target-arm: Implement asidx_from_attrs
> >>   target-arm: Implement cpu_get_phys_page_attrs_debug
> >>   target-arm: Support multiple address spaces in page table walks
> >>   hw/arm/virt: Wire up memory region to CPUs explicitly
> >>   [RFC] hw/arm/virt: add secure memory region and UART
> >>   HACK: rearrange the virt memory map to suit OP-TEE
> >>
> >>  cpus.c                  |  13 +++++-
> >>  cputlb.c                |   9 +++--
> >>  exec.c                  | 103 +++++++++++++++++++++++++++++++++++-------------
> >>  hw/arm/virt.c           |  66 +++++++++++++++++++++++++------
> >>  include/exec/exec-all.h |  69 ++++++++++++++++++++++++++++----
> >>  include/exec/memory.h   |  18 +++++++++
> >>  include/hw/arm/virt.h   |   1 +
> >>  include/qom/cpu.h       |  57 ++++++++++++++++++++++++++-
> >>  memory.c                |  27 +++++++++++++
> >>  softmmu_template.h      |   4 +-
> >>  target-arm/cpu-qom.h    |   6 ++-
> >>  target-arm/cpu.c        |  35 +++++++++++++++-
> >>  target-arm/cpu.h        |  23 +++++++++++
> >>  target-arm/helper.c     |  15 ++++---
> >>  target-i386/cpu.c       |   7 +++-
> >>  15 files changed, 389 insertions(+), 64 deletions(-)
> >>
> >> --
> >> 1.9.1

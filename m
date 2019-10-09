Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp804321wrm;
        Wed, 9 Oct 2019 04:40:18 -0700 (PDT)
X-Received: by 2002:a92:460e:: with SMTP id t14mr2792931ila.139.1570621218125;
        Wed, 09 Oct 2019 04:40:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570621218; cv=none;
        d=google.com; s=arc-20160816;
        b=XaX+1IlHm8DnfpOpx6pET+OpAFIBts3UEZ6cc/GqZPAipYY3M2Lm9sn2Zshtr/WcdQ
         lXoKZwDfuZ0oeX/jCt9gSP83n1dk3EGp2a+srn06ab17QG/0pPGuUw0ntHCrT339yFbh
         q4YDE5SN8WHD9M/cxdhPYny20UCPmnuCalgQoz8rx1bfsSCbCVa42NplBew3foJMmxN3
         IdlD6kxdjGvy5S//CEj+h0nVzE7uaCq/DOtO9sC5IPK4aP1kAivxrRSWtgmCCuG+my86
         9SwiR0tiA1kIgcg2mnT0f6i4QsCDGLHJfixHMqDPx6DDM8bM1sZbGYp/ej/e1CwttIWr
         dZ7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MUHVWGhyuBC1n9S6rYV/LsvWZgGMjW4/odo7lrtct3I=;
        b=J3Hh5sdA5DD6y5HevvXOSndrLKjd5VT+vfYrXm/6RQKGZNLt6BspjAE7lm6ppzEs9U
         QOT5cMEayZUUZft4YV7JBYBBQlSvRAmvUS50sNt9epOhvZsbaRl6sdu3sUuJVo7cRAmC
         kpwsf6cT3089oX3mbJfkAjNYwgvovPkQsVP+GAMyTkbx6eh/Cc+sZJExYFdLbCTiPHeb
         rKJKj6Bplnnog6IKluaV9527tUkmBnyys5kXRZQNlYePanE3315aIkBI4jAi7eLSpNxs
         jFqwOaClzqikl5MOt5O3p181/hrBTfaiep79MCD5Gw5tC+s09Vgr210dejJvxK0BtFWr
         q6qQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ltYr2wXe;
       spf=pass (google.com: domain of beata.michalska@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=beata.michalska@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <beata.michalska@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id p124sor1012409iod.98.2019.10.09.04.40.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 09 Oct 2019 04:40:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of beata.michalska@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ltYr2wXe;
       spf=pass (google.com: domain of beata.michalska@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=beata.michalska@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=MUHVWGhyuBC1n9S6rYV/LsvWZgGMjW4/odo7lrtct3I=;
        b=ltYr2wXee+wxFHEsvwGrG1DR7/kIQZCUR1LswHa24EqdmPAhLeR0FNJsWs93bJUFla
         +F1zSs4aO4VIfJ6iYqRJZEgfohWN8t91z1xpZPW8MGdhsYZcQWSxpv2Qf26pRNUGWtB1
         JkS0UWMBa0ZGIsVhF2eCoIRCbpF/aWSFOPIM2lzcTy0CpAzMYvY3N37TqAvUvXzjWlbt
         pp7gKi8J0LUyZ0dSDGe1y6jNDH/ooyzVZ6tYgOrlkwOozgSAfVWhatFW6OaMhac0i+1a
         2LttcdJzmWN1YAqwnq5B/BO8szqUV9YXQPgBhzgZlNBgQpaXVJSK/UwpP2SIDDNRcI+8
         SBWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=MUHVWGhyuBC1n9S6rYV/LsvWZgGMjW4/odo7lrtct3I=;
        b=Hse730SkfxVl3zr5ALPY8PoeG2x1AVToasZGT/rf1XPvClboORMmOo3l3baOzfXcam
         s1bfGH5CxiHGzRgXP0PvnLC0lQs9U4Bei47QzXdB1/WKpDB0Y2+7aClmH/8LzoarzrC5
         9B31W4OUnmSZ9fBh/RbunS/VD7BKPI/cS56Zhcqr33604rWD+wq/itJ0OVoC7PGWwZPb
         ZBhDFj/a65YeO2nRUXXlEKMCjs0l+mrYx36vyUb5kBmdn+MARQf2jb21hB0wrPjnicfB
         N1kMGxN2p0c4BuVHCXX8aepBsVmJLxVVwusD/eFX3aNvqbESh4RMQxWE+fZE/8M/w3TX
         xFCw==
X-Gm-Message-State: APjAAAUdkklHTsdds5GVZKCRJMhHFJo0xOI+nXi6L7EfRcumugoUrkf4
	Q609iQP0+aHGOE2GHtafvZWHXsq0l1Daq6tgUKqzPhbbe7U=
X-Google-Smtp-Source: APXvYqw4vHVfDkqilXHeokUulIw6APhojnO1E2BUHPuvfHr30pYcOI1LyuuMR3pAFvR5mF6V983LST9Q2WByuPc98sU=
X-Received: by 2002:a6b:2c02:: with SMTP id s2mr2682557ios.307.1570621217442;
 Wed, 09 Oct 2019 04:40:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190910095610.4546-1-beata.michalska@linaro.org>
 <20190910095610.4546-3-beata.michalska@linaro.org> <87d0fqbm19.fsf@linaro.org>
In-Reply-To: <87d0fqbm19.fsf@linaro.org>
From: Beata Michalska <beata.michalska@linaro.org>
Date: Wed, 9 Oct 2019 12:40:06 +0100
Message-ID: <CADSWDzum=6OZh5dTCCfSonpemFZQ_RV+dg7HYp3yN8TvpLB2Wg@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH 2/4] Memory: Enable writeback for given
 memory region
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, quintela@redhat.com, 
	Richard Henderson <richard.henderson@linaro.org>, 
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>, shameerali.kolothum.thodi@huawei.com, 
	eric.auger@redhat.com, qemu-arm@nongnu.org, pbonzini@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 8U9gdGE0z7uB

On Tue, 24 Sep 2019 at 01:00, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
>
> Beata Michalska <beata.michalska@linaro.org> writes:
>
> > Add an option to trigger memory writeback to sync given memory region
> > with the corresponding backing store, case one is available.
> > This extends the support for persistent memory, allowing syncing on-dem=
and.
> >
> > Also, adding verification for msync support on host.
> >
> > Signed-off-by: Beata Michalska <beata.michalska@linaro.org>
> > ---
> >  configure               | 24 ++++++++++++++++++++++++
> >  exec.c                  | 38 ++++++++++++++++++++++++++++++++++++++
> >  include/exec/memory.h   |  6 ++++++
> >  include/exec/ram_addr.h |  6 ++++++
> >  memory.c                | 12 ++++++++++++
> >  5 files changed, 86 insertions(+)
> >
> > diff --git a/configure b/configure
> > index 95134c0180..bdb7dc47e9 100755
> > --- a/configure
> > +++ b/configure
> > @@ -5081,6 +5081,26 @@ if compile_prog "" "" ; then
> >      fdatasync=3Dyes
> >  fi
> >
> > +##########################################
> > +# verify support for msyc
> > +
> > +msync=3Dno
> > +cat > $TMPC << EOF
> > +#include <unistd.h>
> > +#include <sys/mman.h>
> > +int main(void) {
> > +#if defined(_POSIX_MAPPED_FILES) && _POSIX_MAPPED_FILES > 0 \
> > +&& defined(_POSIX_SYNCHRONIZED_IO) && _POSIX_SYNCHRONIZED_IO > 0
> > +return msync(NULL,0, MS_SYNC);
> > +#else
> > +#error Not supported
> > +#endif
> > +}
> > +EOF
> > +if compile_prog "" "" ; then
> > +    msync=3Dyes
> > +fi
> > +
> >  ##########################################
> >  # check if we have madvise
> >
> > @@ -6413,6 +6433,7 @@ echo "fdt support       $fdt"
> >  echo "membarrier        $membarrier"
> >  echo "preadv support    $preadv"
> >  echo "fdatasync         $fdatasync"
> > +echo "msync             $msync"
> >  echo "madvise           $madvise"
> >  echo "posix_madvise     $posix_madvise"
> >  echo "posix_memalign    $posix_memalign"
> > @@ -6952,6 +6973,9 @@ fi
> >  if test "$fdatasync" =3D "yes" ; then
> >    echo "CONFIG_FDATASYNC=3Dy" >> $config_host_mak
> >  fi
> > +if test "$msync" =3D "yes" ; then
> > +    echo "CONFIG_MSYNC=3Dy" >> $config_host_mak
> > +fi
>
> I think it's best to split this configure check into a new prequel patch =
and...

I might just drop it in favour of CONFIG_POSIX switch ......
>
> >  if test "$madvise" =3D "yes" ; then
> >    echo "CONFIG_MADVISE=3Dy" >> $config_host_mak
> >  fi
> > diff --git a/exec.c b/exec.c
> > index 235d6bc883..5ed6908368 100644
> > --- a/exec.c
> > +++ b/exec.c
> > @@ -65,6 +65,8 @@
> >  #include "exec/ram_addr.h"
> >  #include "exec/log.h"
> >
> > +#include "qemu/pmem.h"
> > +
> >  #include "migration/vmstate.h"
> >
> >  #include "qemu/range.h"
> > @@ -2182,6 +2184,42 @@ int qemu_ram_resize(RAMBlock *block, ram_addr_t =
newsize, Error **errp)
> >      return 0;
> >  }
> >
> > +/*
> > + * Trigger sync on the given ram block for range [start, start + lengt=
h]
> > + * with the backing store if available.
> > + * @Note: this is supposed to be a SYNC op.
> > + */
> > +void qemu_ram_writeback(RAMBlock *block, ram_addr_t start, ram_addr_t =
length)
> > +{
> > +    void *addr =3D ramblock_ptr(block, start);
> > +
> > +    /*
> > +     * The requested range might spread up to the very end of the bloc=
k
> > +     */
> > +    if ((start + length) > block->used_length) {
> > +        error_report("%s: sync range outside the block boundires: "
> > +                     "start: " RAM_ADDR_FMT " length: " RAM_ADDR_FMT
> > +                     " block length: " RAM_ADDR_FMT " Narrowing down .=
.." ,
> > +                     __func__, start, length, block->used_length);
>
> Is this an error or just logging? error_report should be used for stuff
> that the user needs to know about so it will appear on the HMP console
> (or via stderr). If so what is the user expected to do? Have they
> misconfigured their system?
>

This should be logging  rather than 'error reporting as such. My bad.
Will address that in the next version.

> > +        length =3D block->used_length - start;
> > +    }
> > +
> > +#ifdef CONFIG_LIBPMEM
> > +    /* The lack of support for pmem should not block the sync */
> > +    if (ramblock_is_pmem(block)) {
> > +        pmem_persist(addr, length);
> > +    } else
> > +#endif
> > +    if (block->fd >=3D 0) {
> > +#ifdef CONFIG_MSYNC
> > +        msync((void *)((uintptr_t)addr & qemu_host_page_mask),
> > +               HOST_PAGE_ALIGN(length), MS_SYNC);
> > +#else
> > +        qemu_fdatasync(block->fd);
> > +#endif
>
> ... hide the implementation details in util/cutils.c, maybe as
> qemu_msync()?
>
> > +    }
> > +}
> > +
> >  /* Called with ram_list.mutex held */
> >  static void dirty_memory_extend(ram_addr_t old_ram_size,
> >                                  ram_addr_t new_ram_size)
> > diff --git a/include/exec/memory.h b/include/exec/memory.h
> > index 2dd810259d..ff0d7937cf 100644
> > --- a/include/exec/memory.h
> > +++ b/include/exec/memory.h
> > @@ -1242,6 +1242,12 @@ void *memory_region_get_ram_ptr(MemoryRegion *mr=
);
> >   */
> >  void memory_region_ram_resize(MemoryRegion *mr, ram_addr_t newsize,
> >                                Error **errp);
> > +/**
> > + * memory_region_do_writeback: Trigger writeback for selected address =
range
> > + * [addr, addr + size]
> > + *
> > + */
> > +void memory_region_do_writeback(MemoryRegion *mr, hwaddr addr, hwaddr =
size);
> >
> >  /**
> >   * memory_region_set_log: Turn dirty logging on or off for a region.
> > diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
> > index a327a80cfe..d4bce81a03 100644
> > --- a/include/exec/ram_addr.h
> > +++ b/include/exec/ram_addr.h
> > @@ -180,6 +180,12 @@ void qemu_ram_free(RAMBlock *block);
> >
> >  int qemu_ram_resize(RAMBlock *block, ram_addr_t newsize, Error **errp)=
;
> >
> > +void qemu_ram_writeback(RAMBlock *block, ram_addr_t start, ram_addr_t =
length);
> > +
> > +/* Clear whole block of mem */
> > +#define qemu_ram_block_writeback(rb)    \
> > +    qemu_ram_writeback(rb, 0, rb->used_length)
> > +
> >  #define DIRTY_CLIENTS_ALL     ((1 << DIRTY_MEMORY_NUM) - 1)
> >  #define DIRTY_CLIENTS_NOCODE  (DIRTY_CLIENTS_ALL & ~(1 << DIRTY_MEMORY=
_CODE))
> >
> > diff --git a/memory.c b/memory.c
> > index 61a254c3f9..436eb64737 100644
> > --- a/memory.c
> > +++ b/memory.c
> > @@ -2228,6 +2228,18 @@ void memory_region_ram_resize(MemoryRegion *mr, =
ram_addr_t newsize, Error **errp
> >      qemu_ram_resize(mr->ram_block, newsize, errp);
> >  }
> >
> > +
> > +void memory_region_do_writeback(MemoryRegion *mr, hwaddr addr, hwaddr =
size)
> > +{
> > +    /*
> > +     * Might be extended case needed to cover
> > +     * different types of memory regions
> > +     */
> > +    if (mr->ram_block && mr->dirty_log_mask) {
> > +        qemu_ram_writeback(mr->ram_block, addr, size);
> > +    }
> > +}
> > +
> >  /*
> >   * Call proper memory listeners about the change on the newly
> >   * added/removed CoalescedMemoryRange.
>
>
> --
> Alex Benn=C3=A9e

Thank you.

BR
Beata

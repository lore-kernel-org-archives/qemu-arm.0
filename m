Received: by 2002:adf:db01:0:0:0:0:0 with SMTP id s1csp1058337wri;
        Thu, 7 Nov 2019 06:41:41 -0800 (PST)
X-Received: by 2002:a6b:ef0d:: with SMTP id k13mr3812839ioh.220.1573137701654;
        Thu, 07 Nov 2019 06:41:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573137701; cv=none;
        d=google.com; s=arc-20160816;
        b=nGt7d8yw3PfNJThftTe3kVal8RW534HHE6z7Rx4rwjFrrwivaNkrmk4vikprbk4Ota
         4QgbTpZS5IJ2Y2+y2uGog3e7HZxIgeN45hO78yr4guROR+0Jip5aepPGFi3NbiTRW05u
         uKs+1K62O8H6+4PnHhnGvcy8+tS9ltv3rQuIIjvOQCCKtmBDCBPy+82Nef9CCzOjkXsq
         QQzG9kus3MM8/RKO/9RS0eGkVWumMUxBlgOElY6hNImDm+1cyI5bh/n5LiSvbv+lcz5C
         khKt4NLLQwP/mhmM1Vb6eIo13YhgoeYBVX7G9VgLfn/NHdpGAEsjjmcEJGFGJXCDbBSY
         IyVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=beurS30dVz2/YuV7ui9xnfzvdQ87X84xaIMxSAmPcls=;
        b=s5iQ1Dw8iDZ3IbMX22rX6BvAvsLPg8e4eDA6+taIBRNXApfQNVJv2nQziILs5x4nlj
         33cF37/NvZaNuAhdK1kdfzr9seeZp6YWhD9qiVWo9j3v0In+X1mdA9UTg7UDwlEQSmQx
         8MmuXkhy9Kp4dFlKu0ALGcRSHlLiwL5zQl16H6q2aHqlAYfEQZ2BSk9tOeaYifxW5Udw
         v4pKynf4esADNlwEBxnft8ypwwhK9K2zY3odfQE3+u6EU8OFEQ5LSHTg9gNi74ANtsZD
         /JzH6E6tFTaCxBZ75geGpC1zuKEtMqKAm2MsD8FjlDLtLy8fN8TPTCqwdz2DQyP2LUJl
         ODGw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=O8qXDfuK;
       spf=pass (google.com: domain of beata.michalska@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=beata.michalska@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <beata.michalska@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 27sor2499688ilx.105.2019.11.07.06.41.41
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 07 Nov 2019 06:41:41 -0800 (PST)
Received-SPF: pass (google.com: domain of beata.michalska@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=O8qXDfuK;
       spf=pass (google.com: domain of beata.michalska@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=beata.michalska@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=beurS30dVz2/YuV7ui9xnfzvdQ87X84xaIMxSAmPcls=;
        b=O8qXDfuKMgswevczNlpe51sEmIimUjl7BTsjfkRsxNNIujN4GCigmcBfF/Zln7XhWs
         IaYhPCk310t7WAjYEXq8E6Jy1z+HzDHowzJIHV/T1BKL/cLzfvV8Pfz+Iib8PaduxdkD
         on6eDttUwYXejGL7z6H0YkWsW6Vgh0gcVzxrq09+fFhMcGqj0sxsoKWinLJpBL5i4fMG
         aedz7P0qSZpmtAyGBFVY1MFycViFf5nGWSwyJdDiurzto0bJ/hRp3cAvQWsO3YYZFtdq
         qaxlV7H7oYakMUMCWrUeWnndbjB18GeZUVPsjlV89IFAfBkJPP5qKIOGIetlayWueLzB
         +oug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=beurS30dVz2/YuV7ui9xnfzvdQ87X84xaIMxSAmPcls=;
        b=I5BAeY43/d3EDRLUC9/zt2UAUOONWhPVQs3OZQwl5oCZaQRuVtkfUci/hJunbn1oq1
         SbgdX+XUON5GmcuILB4XA6YFaDWk6eZBnhoPYqjY83zNX4nvDumx52nExTIbp7Had1/b
         5UsJqWMov9Yo5qP4PYEmleevM0oxKmEcGWZd0k9CpSRmM68rR4jYP/x/gGNnrJJW/chX
         a7bqM2oW1xL6hMyteeU39t/gDFSPiJH/bmARUEE1NbJ44KkdDnhn8xptsA3UY+u/PVB8
         DH2dfh/KCvmISTCTl8WTcBKgzI97GjmUxOX7TCEBZyMMYHz44shkKCFFZGOrYMbtdOow
         8H7g==
X-Gm-Message-State: APjAAAW1f//kRtdjG+oYoXq2MM0In+UD8F7ZZHx1zw7QL6spLQVkiIvr
	n7iJzpbpLHNPkWszMKCRQvO4N24e9p8aHuFPCqJGFTgS
X-Google-Smtp-Source: APXvYqzK3KJBelcRjH/eBhtaIbfS9XsunYhYvVDHKr84kv7NYPNjEPj49Mp2C7wf/YnNe3dEV485cFDsT6E5JmMeCFQ=
X-Received: by 2002:a92:60b:: with SMTP id x11mr3091170ilg.69.1573137701158;
 Thu, 07 Nov 2019 06:41:41 -0800 (PST)
MIME-Version: 1.0
References: <20191105234100.22052-1-beata.michalska@linaro.org>
 <20191105234100.22052-3-beata.michalska@linaro.org> <5c75bd31-213f-88a4-2eee-0046f99f65fe@linaro.org>
In-Reply-To: <5c75bd31-213f-88a4-2eee-0046f99f65fe@linaro.org>
From: Beata Michalska <beata.michalska@linaro.org>
Date: Thu, 7 Nov 2019 14:41:29 +0000
Message-ID: <CADSWDztHetgmbUOp4WyRAkR0daAG6kkwhUTcyKWiCTWHQ1XB=w@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] Memory: Enable writeback for given memory region
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
	Peter Maydell <peter.maydell@linaro.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	pbonzini@redhat.com, quintela@redhat.com, 
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>, eric.auger@redhat.com, 
	shameerali.kolothum.thodi@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-TUID: lRtgiuxMYQYq

On Wed, 6 Nov 2019 at 12:20, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 11/6/19 12:40 AM, Beata Michalska wrote:
> > +void qemu_ram_writeback(RAMBlock *block, ram_addr_t start, ram_addr_t length)
> > +{
> > +    void *addr = ramblock_ptr(block, start);
> > +
> > +    /*
> > +     * The requested range might spread up to the very end of the block
> > +     */
> > +    if ((start + length) > block->used_length) {
> > +        qemu_log("%s: sync range outside the block boundaries: "
> > +                     "start: " RAM_ADDR_FMT " length: " RAM_ADDR_FMT
> > +                     " block length: " RAM_ADDR_FMT " Narrowing down ..." ,
> > +                     __func__, start, length, block->used_length);
> > +        length = block->used_length - start;
> > +    }
>
> qemu_log_mask w/ GUEST_ERROR?  How do we expect the length to overflow?

In theory it shouldn't, at least with current usage.
I guess the probe_access will make sure of that.
This was more of a precaution to enable catching potential/future misuses
aka debugging purpose. I can get rid of that it that's playing too safe.

>
> > +#ifdef CONFIG_LIBPMEM
> > +    /* The lack of support for pmem should not block the sync */
> > +    if (ramblock_is_pmem(block)) {
> > +        pmem_persist(addr, length);
> > +    } else
> > +#endif
>
> Perhaps better to return out of that if block than have the dangling else.

Good idea
>
> > +/**
> > + * Sync changes made to the memory mapped file back to the backing
> > + * storage. For POSIX compliant systems this will simply fallback
> > + * to regular msync call (thus the required alignment). Otherwise
> > + * it will trigger whole file sync (including the metadata case
> > + * there is no support to skip that otherwise)
> > + *
> > + * @addr   - start of the memory area to be synced
> > + * @length - length of the are to be synced
> > + * @align  - alignment (expected to be PAGE_SIZE)
> > + * @fd     - file descriptor for the file to be synced
> > + *           (mandatory only for POSIX non-compliant systems)
> > + */
> > +int qemu_msync(void *addr, size_t length, size_t align, int fd)
> > +{
> > +#ifdef CONFIG_POSIX
> > +    size_t align_mask;
> > +
> > +    /* Bare minimum of sanity checks on the alignment */
> > +    /* The start address needs to be a multiple of PAGE_SIZE */
> > +    align = MAX(align, qemu_real_host_page_size);
> > +    align_mask = ~(qemu_real_host_page_size - 1);
> > +    align = (align + ~align_mask) & align_mask;
> > +
> > +    align_mask = ~(align - 1);
>
> I don't understand what you're trying to do with align.
>
> You pass in qemu_host_page_size from the one caller, and then adjust it for
> qemu_real_host_page_size?
>
> Why pass in anything at all, and just use qemu_real_host_page_mask?

The qemu_msync was supposed to be generic and not tied to current use case
without any assumptions on the alignment and whether that would  be an actual
host page size. So that was just to make sure it will be a multiple of that.
I can get rid of that with assumption all will be using the same alignment.

BR
Beata
>
> > +    /**
> > +     * There are no strict reqs as per the length of mapping
> > +     * to be synced. Still the length needs to follow the address
> > +     * alignment changes. Additionally - round the size to the multiple
> > +     * of requested alignment (expected as PAGE_SIZE)
> > +     */
> > +    length += ((uintptr_t)addr & (align - 1));
> > +    length = (length + ~align_mask) & align_mask;
> > +
> > +    addr = (void *)((uintptr_t)addr & align_mask);
> > +
> > +    return msync(addr, length, MS_SYNC);
> > +#else /* CONFIG_POSIX */
> > +    /**
> > +     * Perform the sync based on the file descriptor
> > +     * The sync range will most probably be wider than the one
> > +     * requested - but it will still get the job done
> > +     */
> > +    return qemu_fdatasync(fd);
> > +#endif /* CONFIG_POSIX */
> > +}
>
>
> r~
>

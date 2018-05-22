Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id z17-v6sm71017wrm.8.2018.05.22.04.00.46
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 May 2018 04:00:46 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id CED983E01DB;
	Tue, 22 May 2018 12:00:44 +0100 (BST)
References: <20180521140402.23318-1-peter.maydell@linaro.org> <20180521140402.23318-14-peter.maydell@linaro.org>
User-agent: mu4e 1.1.0; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org, Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Subject: Re: [PATCH 13/27] Make address_space_translate_iommu take a MemTxAttrs argument
In-reply-to: <20180521140402.23318-14-peter.maydell@linaro.org>
Date: Tue, 22 May 2018 12:00:44 +0100
Message-ID: <877enwuf8j.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: UuKZKKUFPpp4


Peter Maydell <peter.maydell@linaro.org> writes:

> As part of plumbing MemTxAttrs down to the IOMMU translate method,
> add MemTxAttrs as an argument to address_space_translate_iommu().
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  exec.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/exec.c b/exec.c
> index af2b82d154..c3baadc349 100644
> --- a/exec.c
> +++ b/exec.c
> @@ -478,6 +478,7 @@ address_space_translate_internal(AddressSpaceDispatch=
 *d, hwaddr addr, hwaddr *x
>   * @is_write: whether the translation operation is for write
>   * @is_mmio: whether this can be MMIO, set true if it can
>   * @target_as: the address space targeted by the IOMMU
> + * @attrs: transaction attributes
>   *
>   * This function is called from RCU critical section.  It is the common
>   * part of flatview_do_translate and address_space_translate_cached.
> @@ -488,7 +489,8 @@ static MemoryRegionSection address_space_translate_io=
mmu(IOMMUMemoryRegion *iomm
>                                                           hwaddr *page_ma=
sk_out,
>                                                           bool is_write,
>                                                           bool is_mmio,
> -                                                         AddressSpace **=
target_as)
> +                                                         AddressSpace **=
target_as,
> +                                                         MemTxAttrs attr=
s)
>  {
>      MemoryRegionSection *section;
>      hwaddr page_mask =3D (hwaddr)-1;
> @@ -572,7 +574,7 @@ static MemoryRegionSection flatview_do_translate(Flat=
View *fv,
>          return address_space_translate_iommu(iommu_mr, xlat,
>                                               plen_out, page_mask_out,
>                                               is_write, is_mmio,
> -                                             target_as);
> +                                             target_as, attrs);
>      }
>      if (page_mask_out) {
>          /* Not behind an IOMMU, use default page size. */
> @@ -3735,7 +3737,7 @@ static inline MemoryRegion *address_space_translate=
_cached(
>
>      section =3D address_space_translate_iommu(iommu_mr, xlat, plen,
>                                              NULL, is_write, true,
> -                                            &target_as);
> +                                            &target_as, attrs);
>      return section.mr;
>  }


--
Alex Benn=C3=A9e

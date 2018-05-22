Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id y45-v6sm14938121wrd.97.2018.05.22.03.49.52
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 May 2018 03:49:52 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id DD6B23E01DB;
	Tue, 22 May 2018 11:49:51 +0100 (BST)
References: <20180521140402.23318-1-peter.maydell@linaro.org> <20180521140402.23318-5-peter.maydell@linaro.org>
User-agent: mu4e 1.1.0; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org, Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Subject: Re: [PATCH 04/27] Make address_space_map() take a MemTxAttrs argument
In-reply-to: <20180521140402.23318-5-peter.maydell@linaro.org>
Date: Tue, 22 May 2018 11:49:51 +0100
Message-ID: <87k1rwufqo.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 1x3ipWXSCyJT


Peter Maydell <peter.maydell@linaro.org> writes:

> As part of plumbing MemTxAttrs down to the IOMMU translate method,
> add MemTxAttrs as an argument to address_space_map().
> Its callers either have an attrs value to hand, or don't care
> and can use MEMTXATTRS_UNSPECIFIED.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  include/exec/memory.h   | 3 ++-
>  include/sysemu/dma.h    | 3 ++-
>  exec.c                  | 6 ++++--
>  target/ppc/mmu-hash64.c | 3 ++-
>  4 files changed, 10 insertions(+), 5 deletions(-)
>
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index 9a30a1bb9e..b1bdb376d4 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -1952,9 +1952,10 @@ bool address_space_access_valid(AddressSpace *as, =
hwaddr addr, int len, bool is_
>   * @addr: address within that address space
>   * @plen: pointer to length of buffer; updated on return
>   * @is_write: indicates the transfer direction
> + * @attrs: memory attributes
>   */
>  void *address_space_map(AddressSpace *as, hwaddr addr,
> -                        hwaddr *plen, bool is_write);
> +                        hwaddr *plen, bool is_write, MemTxAttrs attrs);
>
>  /* address_space_unmap: Unmaps a memory region previously mapped by addr=
ess_space_map()
>   *
> diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
> index c228c66513..0d73902634 100644
> --- a/include/sysemu/dma.h
> +++ b/include/sysemu/dma.h
> @@ -132,7 +132,8 @@ static inline void *dma_memory_map(AddressSpace *as,
>      hwaddr xlen =3D *len;
>      void *p;
>
> -    p =3D address_space_map(as, addr, &xlen, dir =3D=3D DMA_DIRECTION_FR=
OM_DEVICE);
> +    p =3D address_space_map(as, addr, &xlen, dir =3D=3D DMA_DIRECTION_FR=
OM_DEVICE,
> +                          MEMTXATTRS_UNSPECIFIED);
>      *len =3D xlen;
>      return p;
>  }
> diff --git a/exec.c b/exec.c
> index d314c7cc39..1dc81cfe4a 100644
> --- a/exec.c
> +++ b/exec.c
> @@ -3529,7 +3529,8 @@ flatview_extend_translation(FlatView *fv, hwaddr ad=
dr,
>  void *address_space_map(AddressSpace *as,
>                          hwaddr addr,
>                          hwaddr *plen,
> -                        bool is_write)
> +                        bool is_write,
> +                        MemTxAttrs attrs)
>  {
>      hwaddr len =3D *plen;
>      hwaddr l, xlat;
> @@ -3616,7 +3617,8 @@ void *cpu_physical_memory_map(hwaddr addr,
>                                hwaddr *plen,
>                                int is_write)
>  {
> -    return address_space_map(&address_space_memory, addr, plen, is_write=
);
> +    return address_space_map(&address_space_memory, addr, plen, is_write,
> +                             MEMTXATTRS_UNSPECIFIED);
>  }
>
>  void cpu_physical_memory_unmap(void *buffer, hwaddr len,
> diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
> index a1db20e3a8..aa200cba4c 100644
> --- a/target/ppc/mmu-hash64.c
> +++ b/target/ppc/mmu-hash64.c
> @@ -431,7 +431,8 @@ const ppc_hash_pte64_t *ppc_hash64_map_hptes(PowerPCC=
PU *cpu,
>          return NULL;
>      }
>
> -    hptes =3D address_space_map(CPU(cpu)->as, base + pte_offset, &plen, =
false);
> +    hptes =3D address_space_map(CPU(cpu)->as, base + pte_offset, &plen, =
false,
> +                              MEMTXATTRS_UNSPECIFIED);
>      if (plen < (n * HASH_PTE_SIZE_64)) {
>          hw_error("%s: Unable to map all requested HPTEs\n", __func__);
>      }


--
Alex Benn=C3=A9e

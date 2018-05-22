Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id c11-v6sm5679847wrb.57.2018.05.22.03.58.54
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 May 2018 03:58:54 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 645533E01DB;
	Tue, 22 May 2018 11:58:53 +0100 (BST)
References: <20180521140402.23318-1-peter.maydell@linaro.org> <20180521140402.23318-11-peter.maydell@linaro.org>
User-agent: mu4e 1.1.0; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org, Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Subject: Re: [PATCH 10/27] Make flatview_translate() take a MemTxAttrs argument
In-reply-to: <20180521140402.23318-11-peter.maydell@linaro.org>
Date: Tue, 22 May 2018 11:58:53 +0100
Message-ID: <87bmd8ufbm.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: VfNKqO03Ks3l


Peter Maydell <peter.maydell@linaro.org> writes:

> As part of plumbing MemTxAttrs down to the IOMMU translate method,
> add MemTxAttrs as an argument to flatview_translate(); all its
> callers now have attrs available.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  include/exec/memory.h |  7 ++++---
>  exec.c                | 17 +++++++++--------
>  2 files changed, 13 insertions(+), 11 deletions(-)
>
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index 444fceac55..3980ab47ed 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -1913,7 +1913,8 @@ IOMMUTLBEntry address_space_get_iotlb_entry(Address=
Space *as, hwaddr addr,
>   */
>  MemoryRegion *flatview_translate(FlatView *fv,
>                                   hwaddr addr, hwaddr *xlat,
> -                                 hwaddr *len, bool is_write);
> +                                 hwaddr *len, bool is_write,
> +                                 MemTxAttrs attrs);
>
>  static inline MemoryRegion *address_space_translate(AddressSpace *as,
>                                                      hwaddr addr, hwaddr =
*xlat,
> @@ -1921,7 +1922,7 @@ static inline MemoryRegion *address_space_translate=
(AddressSpace *as,
>                                                      MemTxAttrs attrs)
>  {
>      return flatview_translate(address_space_to_flatview(as),
> -                              addr, xlat, len, is_write);
> +                              addr, xlat, len, is_write, attrs);
>  }
>
>  /* address_space_access_valid: check for validity of accessing an address
> @@ -2030,7 +2031,7 @@ MemTxResult address_space_read(AddressSpace *as, hw=
addr addr,
>              rcu_read_lock();
>              fv =3D address_space_to_flatview(as);
>              l =3D len;
> -            mr =3D flatview_translate(fv, addr, &addr1, &l, false);
> +            mr =3D flatview_translate(fv, addr, &addr1, &l, false, attrs=
);
>              if (len =3D=3D l && memory_access_is_direct(mr, false)) {
>                  ptr =3D qemu_map_ram_ptr(mr->ram_block, addr1);
>                  memcpy(buf, ptr, len);
> diff --git a/exec.c b/exec.c
> index 9229fb4058..b818ba87f4 100644
> --- a/exec.c
> +++ b/exec.c
> @@ -618,7 +618,8 @@ iotlb_fail:
>
>  /* Called from RCU critical section */
>  MemoryRegion *flatview_translate(FlatView *fv, hwaddr addr, hwaddr *xlat,
> -                                 hwaddr *plen, bool is_write)
> +                                 hwaddr *plen, bool is_write,
> +                                 MemTxAttrs attrs)
>  {
>      MemoryRegion *mr;
>      MemoryRegionSection section;
> @@ -3152,7 +3153,7 @@ static MemTxResult flatview_write_continue(FlatView=
 *fv, hwaddr addr,
>          }
>
>          l =3D len;
> -        mr =3D flatview_translate(fv, addr, &addr1, &l, true);
> +        mr =3D flatview_translate(fv, addr, &addr1, &l, true, attrs);
>      }
>
>      return result;
> @@ -3168,7 +3169,7 @@ static MemTxResult flatview_write(FlatView *fv, hwa=
ddr addr, MemTxAttrs attrs,
>      MemTxResult result =3D MEMTX_OK;
>
>      l =3D len;
> -    mr =3D flatview_translate(fv, addr, &addr1, &l, true);
> +    mr =3D flatview_translate(fv, addr, &addr1, &l, true, attrs);
>      result =3D flatview_write_continue(fv, addr, attrs, buf, len,
>                                       addr1, l, mr);
>
> @@ -3239,7 +3240,7 @@ MemTxResult flatview_read_continue(FlatView *fv, hw=
addr addr,
>          }
>
>          l =3D len;
> -        mr =3D flatview_translate(fv, addr, &addr1, &l, false);
> +        mr =3D flatview_translate(fv, addr, &addr1, &l, false, attrs);
>      }
>
>      return result;
> @@ -3254,7 +3255,7 @@ static MemTxResult flatview_read(FlatView *fv, hwad=
dr addr,
>      MemoryRegion *mr;
>
>      l =3D len;
> -    mr =3D flatview_translate(fv, addr, &addr1, &l, false);
> +    mr =3D flatview_translate(fv, addr, &addr1, &l, false, attrs);
>      return flatview_read_continue(fv, addr, attrs, buf, len,
>                                    addr1, l, mr);
>  }
> @@ -3468,7 +3469,7 @@ static bool flatview_access_valid(FlatView *fv, hwa=
ddr addr, int len,
>
>      while (len > 0) {
>          l =3D len;
> -        mr =3D flatview_translate(fv, addr, &xlat, &l, is_write);
> +        mr =3D flatview_translate(fv, addr, &xlat, &l, is_write, attrs);
>          if (!memory_access_is_direct(mr, is_write)) {
>              l =3D memory_access_size(mr, l, addr);
>              /* When our callers all have attrs we'll pass them through h=
ere */
> @@ -3517,7 +3518,7 @@ flatview_extend_translation(FlatView *fv, hwaddr ad=
dr,
>
>          len =3D target_len;
>          this_mr =3D flatview_translate(fv, addr, &xlat,
> -                                                   &len, is_write);
> +                                     &len, is_write, attrs);
>          if (this_mr !=3D mr || xlat !=3D base + done) {
>              return done;
>          }
> @@ -3550,7 +3551,7 @@ void *address_space_map(AddressSpace *as,
>      l =3D len;
>      rcu_read_lock();
>      fv =3D address_space_to_flatview(as);
> -    mr =3D flatview_translate(fv, addr, &xlat, &l, is_write);
> +    mr =3D flatview_translate(fv, addr, &xlat, &l, is_write, attrs);
>
>      if (!memory_access_is_direct(mr, is_write)) {
>          if (atomic_xchg(&bounce.in_use, true)) {


--
Alex Benn=C3=A9e

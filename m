Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id w40-v6sm28682866wrc.69.2018.05.22.03.56.42
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 May 2018 03:56:43 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 81A403E01DB;
	Tue, 22 May 2018 11:56:41 +0100 (BST)
References: <20180521140402.23318-1-peter.maydell@linaro.org> <20180521140402.23318-7-peter.maydell@linaro.org>
User-agent: mu4e 1.1.0; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org, Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Subject: Re: [PATCH 06/27] Make flatview_extend_translation() take a MemTxAttrs argument
In-reply-to: <20180521140402.23318-7-peter.maydell@linaro.org>
Date: Tue, 22 May 2018 11:56:41 +0100
Message-ID: <87h8n0uffa.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: MbdX6ti3nEa1


Peter Maydell <peter.maydell@linaro.org> writes:

> As part of plumbing MemTxAttrs down to the IOMMU translate method,
> add MemTxAttrs as an argument to flatview_extend_translation().
> Its callers either have an attrs value to hand, or don't care
> and can use MEMTXATTRS_UNSPECIFIED.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  exec.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
>
> diff --git a/exec.c b/exec.c
> index 22af4e8cb9..718b33921b 100644
> --- a/exec.c
> +++ b/exec.c
> @@ -3495,9 +3495,9 @@ bool address_space_access_valid(AddressSpace *as, h=
waddr addr,
>
>  static hwaddr
>  flatview_extend_translation(FlatView *fv, hwaddr addr,
> -                                 hwaddr target_len,
> -                                 MemoryRegion *mr, hwaddr base, hwaddr l=
en,
> -                                 bool is_write)
> +                            hwaddr target_len,
> +                            MemoryRegion *mr, hwaddr base, hwaddr len,
> +                            bool is_write, MemTxAttrs attrs)
>  {
>      hwaddr done =3D 0;
>      hwaddr xlat;
> @@ -3574,7 +3574,7 @@ void *address_space_map(AddressSpace *as,
>
>      memory_region_ref(mr);
>      *plen =3D flatview_extend_translation(fv, addr, len, mr, xlat,
> -                                             l, is_write);
> +                                        l, is_write, attrs);
>      ptr =3D qemu_ram_ptr_length(mr->ram_block, xlat, plen, true);
>      rcu_read_unlock();
>
> @@ -3659,8 +3659,13 @@ int64_t address_space_cache_init(MemoryRegionCache=
 *cache,
>      mr =3D cache->mrs.mr;
>      memory_region_ref(mr);
>      if (memory_access_is_direct(mr, is_write)) {
> +        /* We don't care about the memory attributes here as we're only
> +         * doing this if we found actual RAM, which behaves the same
> +         * regardless of attributes; so UNSPECIFIED is fine.
> +         */
>          l =3D flatview_extend_translation(cache->fv, addr, len, mr,
> -                                        cache->xlat, l, is_write);
> +                                        cache->xlat, l, is_write,
> +                                        MEMTXATTRS_UNSPECIFIED);
>          cache->ptr =3D qemu_ram_ptr_length(mr->ram_block, cache->xlat, &=
l, true);
>      } else {
>          cache->ptr =3D NULL;


--
Alex Benn=C3=A9e

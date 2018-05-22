Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id d9-v6sm13177127wrn.71.2018.05.22.03.58.33
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 May 2018 03:58:33 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 69F1D3E01DB;
	Tue, 22 May 2018 11:58:33 +0100 (BST)
References: <20180521140402.23318-1-peter.maydell@linaro.org> <20180521140402.23318-10-peter.maydell@linaro.org>
User-agent: mu4e 1.1.0; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org, Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Subject: Re: [PATCH 09/27] Make flatview_access_valid() take a MemTxAttrs argument
In-reply-to: <20180521140402.23318-10-peter.maydell@linaro.org>
Date: Tue, 22 May 2018 11:58:33 +0100
Message-ID: <87d0xoufc6.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: X1QSQI8mHSVc


Peter Maydell <peter.maydell@linaro.org> writes:

> As part of plumbing MemTxAttrs down to the IOMMU translate method,
> add MemTxAttrs as an argument to flatview_access_valid().
> Its callers now all have an attrs value to hand, so we can
> correct our earlier temporary use of MEMTXATTRS_UNSPECIFIED.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  exec.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
>
> diff --git a/exec.c b/exec.c
> index b58eb0fedd..9229fb4058 100644
> --- a/exec.c
> +++ b/exec.c
> @@ -2697,7 +2697,7 @@ static MemTxResult flatview_read(FlatView *fv, hwad=
dr addr,
>  static MemTxResult flatview_write(FlatView *fv, hwaddr addr, MemTxAttrs =
attrs,
>                                    const uint8_t *buf, int len);
>  static bool flatview_access_valid(FlatView *fv, hwaddr addr, int len,
> -                                  bool is_write);
> +                                  bool is_write, MemTxAttrs attrs);
>
>  static MemTxResult subpage_read(void *opaque, hwaddr addr, uint64_t *dat=
a,
>                                  unsigned len, MemTxAttrs attrs)
> @@ -2773,7 +2773,7 @@ static bool subpage_accepts(void *opaque, hwaddr ad=
dr,
>  #endif
>
>      return flatview_access_valid(subpage->fv, addr + subpage->base,
> -                                 len, is_write);
> +                                 len, is_write, attrs);
>  }
>
>  static const MemoryRegionOps subpage_ops =3D {
> @@ -3461,7 +3461,7 @@ static void cpu_notify_map_clients(void)
>  }
>
>  static bool flatview_access_valid(FlatView *fv, hwaddr addr, int len,
> -                                  bool is_write)
> +                                  bool is_write, MemTxAttrs attrs)
>  {
>      MemoryRegion *mr;
>      hwaddr l, xlat;
> @@ -3472,8 +3472,7 @@ static bool flatview_access_valid(FlatView *fv, hwa=
ddr addr, int len,
>          if (!memory_access_is_direct(mr, is_write)) {
>              l =3D memory_access_size(mr, l, addr);
>              /* When our callers all have attrs we'll pass them through h=
ere */
> -            if (!memory_region_access_valid(mr, xlat, l, is_write,
> -                                            MEMTXATTRS_UNSPECIFIED)) {
> +            if (!memory_region_access_valid(mr, xlat, l, is_write, attrs=
)) {
>                  return false;
>              }
>          }
> @@ -3493,7 +3492,7 @@ bool address_space_access_valid(AddressSpace *as, h=
waddr addr,
>
>      rcu_read_lock();
>      fv =3D address_space_to_flatview(as);
> -    result =3D flatview_access_valid(fv, addr, len, is_write);
> +    result =3D flatview_access_valid(fv, addr, len, is_write, attrs);
>      rcu_read_unlock();
>      return result;
>  }


--
Alex Benn=C3=A9e

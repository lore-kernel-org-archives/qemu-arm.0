Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id k23-v6sm23594818wrc.59.2018.05.23.03.49.44
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 May 2018 03:49:44 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id F0CC23E006A;
	Wed, 23 May 2018 11:49:43 +0100 (BST)
References: <20180521140402.23318-1-peter.maydell@linaro.org> <20180521140402.23318-21-peter.maydell@linaro.org>
User-agent: mu4e 1.1.0; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org, Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Subject: Re: [PATCH 20/27] hw/misc/tz-mpc.c: Implement correct blocked-access behaviour
In-reply-to: <20180521140402.23318-21-peter.maydell@linaro.org>
Date: Wed, 23 May 2018 11:49:43 +0100
Message-ID: <87y3gatznc.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: cswkiumoq0KV


Peter Maydell <peter.maydell@linaro.org> writes:

> The MPC is guest-configurable for whether blocked accesses:
>  * should be RAZ/WI or cause a bus error
>  * should generate an interrupt or not
>
> Implement this behaviour in the blocked-access handlers.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/misc/tz-mpc.c | 50 ++++++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 48 insertions(+), 2 deletions(-)
>
> diff --git a/hw/misc/tz-mpc.c b/hw/misc/tz-mpc.c
> index 93453cbef2..39a72563b7 100644
> --- a/hw/misc/tz-mpc.c
> +++ b/hw/misc/tz-mpc.c
> @@ -43,6 +43,9 @@ REG32(INT_EN, 0x28)
>      FIELD(INT_EN, IRQ, 0, 1)
>  REG32(INT_INFO1, 0x2c)
>  REG32(INT_INFO2, 0x30)
> +    FIELD(INT_INFO2, HMASTER, 0, 16)
> +    FIELD(INT_INFO2, HNONSEC, 16, 1)
> +    FIELD(INT_INFO2, CFG_NS, 17, 1)
>  REG32(INT_SET, 0x34)
>      FIELD(INT_SET, IRQ, 0, 1)
>  REG32(PIDR4, 0xfd0)
> @@ -266,6 +269,45 @@ static const MemoryRegionOps tz_mpc_reg_ops =3D {
>      .impl.max_access_size =3D 4,
>  };
>
> +static inline bool tz_mpc_cfg_ns(TZMPC *s, hwaddr addr)
> +{
> +    /* Return the cfg_ns bit from the LUT for the specified address */
> +    hwaddr blknum =3D addr / s->blocksize;
> +    hwaddr blkword =3D blknum / 32;
> +    uint32_t blkbit =3D 1U << (blknum % 32);
> +
> +    /* This would imply the address was larger than the size we
> +     * defined this memory region to be, so it can't happen.
> +     */
> +    assert(blkword < s->blk_max);
> +    return s->blk_lut[blkword] & blkbit;
> +}
> +
> +static MemTxResult tz_mpc_handle_block(TZMPC *s, hwaddr addr, MemTxAttrs=
 attrs)
> +{
> +    /* Handle a blocked transaction: raise IRQ, capture info, etc */
> +    if (!s->int_stat) {
> +        /* First blocked transfer: capture information into INT_INFO1 and
> +         * INT_INFO2. Subsequent transfers are still blocked but don't
> +         * capture information until the guest clears the interrupt.
> +         */
> +
> +        s->int_info1 =3D addr;
> +        s->int_info2 =3D 0;
> +        s->int_info2 =3D FIELD_DP32(s->int_info2, INT_INFO2, HMASTER,
> +                                  attrs.requester_id & 0xffff);

Does this actually need masking given the source is a 16 bit wide bitfield?

> +        s->int_info2 =3D FIELD_DP32(s->int_info2, INT_INFO2, HNONSEC,
> +                                  ~attrs.secure);
> +        s->int_info2 =3D FIELD_DP32(s->int_info2, INT_INFO2, CFG_NS,
> +                                  tz_mpc_cfg_ns(s, addr));
> +        s->int_stat |=3D R_INT_STAT_IRQ_MASK;
> +        tz_mpc_irq_update(s);
> +    }
> +
> +    /* Generate bus error if desired; otherwise RAZ/WI */
> +    return (s->ctrl & R_CTRL_SEC_RESP_MASK) ? MEMTX_ERROR : MEMTX_OK;
> +}
> +
>  /* Accesses only reach these read and write functions if the MPC is
>   * blocking them; non-blocked accesses go directly to the downstream
>   * memory region without passing through this code.
> @@ -274,19 +316,23 @@ static MemTxResult tz_mpc_mem_blocked_read(void *op=
aque, hwaddr addr,
>                                             uint64_t *pdata,
>                                             unsigned size, MemTxAttrs att=
rs)
>  {
> +    TZMPC *s =3D TZ_MPC(opaque);
> +
>      trace_tz_mpc_mem_blocked_read(addr, size, attrs.secure);
>
>      *pdata =3D 0;
> -    return MEMTX_OK;
> +    return tz_mpc_handle_block(s, addr, attrs);
>  }
>
>  static MemTxResult tz_mpc_mem_blocked_write(void *opaque, hwaddr addr,
>                                              uint64_t value,
>                                              unsigned size, MemTxAttrs at=
trs)
>  {
> +    TZMPC *s =3D TZ_MPC(opaque);
> +
>      trace_tz_mpc_mem_blocked_write(addr, value, size, attrs.secure);
>
> -    return MEMTX_OK;
> +    return tz_mpc_handle_block(s, addr, attrs);
>  }
>
>  static const MemoryRegionOps tz_mpc_mem_blocked_ops =3D {


--
Alex Benn=C3=A9e

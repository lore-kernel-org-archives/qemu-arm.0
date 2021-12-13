Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id j40sm7570431wms.16.2021.12.13.07.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 07:00:06 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 7F9AB1FF96;
	Mon, 13 Dec 2021 15:00:05 +0000 (GMT)
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-27-peter.maydell@linaro.org>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Shashi Mallela
 <shashi.mallela@linaro.org>
Subject: Re: [PATCH 26/26] hw/intc/arm_gicv3_its: Factor out "find address
 of table entry" code
Date: Mon, 13 Dec 2021 14:53:26 +0000
In-reply-to: <20211211191135.1764649-27-peter.maydell@linaro.org>
Message-ID: <871r2gk0sq.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 8zBPG66GF7sV


Peter Maydell <peter.maydell@linaro.org> writes:

> The ITS has several tables which all share a similar format,
> described by the TableDesc struct: the guest may configure them
> to be a single-level table or a two-level table. Currently we
> open-code the process of finding the table entry in all the
> functions which read or write the device table or the collection
> table. Factor out the "get the address of the table entry"
> logic into a new function, so that the code which needs to
> read or write a table entry only needs to call table_entry_addr()
> and then perform a suitable load or store to that address.
>
> Note that the error handling is slightly complicated because
> we want to handle two cases differently:
>  * failure to read the L1 table entry should end up causing
>    a command stall, like other kinds of DMA error
>  * an L1 table entry that says there is no L2 table for this
>    index (ie whose valid bit is 0) must result in us treating
>    the table entry as not-valid on read, and discarding
>    writes (this is mandated by the spec)
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> This is a worthwhile refactoring on its own, but still more
> so given that GICv4 adds another table in this format.
> ---
>  hw/intc/arm_gicv3_its.c | 212 +++++++++++++---------------------------
>  1 file changed, 70 insertions(+), 142 deletions(-)
>
> diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
> index 3bcc4c3db85..90a9fd3b3d4 100644
> --- a/hw/intc/arm_gicv3_its.c
> +++ b/hw/intc/arm_gicv3_its.c
> @@ -83,44 +83,62 @@ static uint64_t baser_base_addr(uint64_t value, uint3=
2_t page_sz)
>      return result;
>  }
>=20=20
> +static uint64_t table_entry_addr(GICv3ITSState *s, TableDesc *td,
> +                                 uint32_t idx, MemTxResult *res)
> +{

It seems odd to have a uint64_t return type when....

> +    /*
> +     * Given a TableDesc describing one of the ITS in-guest-memory
> +     * tables and an index into it, return the guest address
> +     * corresponding to that table entry.
> +     * If there was a memory error reading the L1 table of an
> +     * indirect table, *res is set accordingly, and we return -1.
> +     * If the L1 table entry is marked not valid, we return -1 with
> +     * *res set to MEMTX_OK.
> +     *
> +     * The specification defines the format of level 1 entries of a
> +     * 2-level table, but the format of level 2 entries and the format
> +     * of flat-mapped tables is IMPDEF.
> +     */
> +    AddressSpace *as =3D &s->gicv3->dma_as;
> +    uint32_t l2idx;
> +    uint64_t l2;
> +    uint32_t num_l2_entries;
> +
> +    *res =3D MEMTX_OK;
> +
> +    if (!td->indirect) {
> +        /* Single level table */
> +        return td->base_addr + idx * td->entry_sz;
> +    }
> +
> +    /* Two level table */
> +    l2idx =3D idx / (td->page_sz / L1TABLE_ENTRY_SIZE);
> +
> +    l2 =3D address_space_ldq_le(as,
> +                              td->base_addr + (l2idx * L1TABLE_ENTRY_SIZ=
E),
> +                              MEMTXATTRS_UNSPECIFIED, res);
> +    if (*res !=3D MEMTX_OK) {
> +        return -1;
> +    }
> +    if (!(l2 & L2_TABLE_VALID_MASK)) {
> +        return -1;
> +    }

We can return signed results. I guess implicit conversion takes care of
it but I wonder if it would be cleaner to return an int (or maybe
compare against UNINT64_MAX =3D=3D INVALID_TABLE_ENTRY)?

--=20
Alex Benn=C3=A9e

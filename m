Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp4240490lfk;
        Mon, 13 Dec 2021 07:48:33 -0800 (PST)
X-Received: by 2002:a05:6000:154b:: with SMTP id 11mr32975222wry.394.1639410513571;
        Mon, 13 Dec 2021 07:48:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639410513; cv=none;
        d=google.com; s=arc-20160816;
        b=b0FuA2FEah1N6Xes9XuBoxkvqw3ofQdufXQ6FcpVzZAbvjPbAKRJq/4GOEE//JqVXz
         eQxTwxzTyXzPu8DydvZxN8ot3cvLJSE4nDhDsFH+uRaRLYhZ0STtt0BvkTDKnT0SR6DC
         kre5vI4ekcAG6VTOGp87wsF4Y7V0uyA55PcT0TQbgOr5CujiTBxWd/5PPSfGlQfqQb7X
         b3/N5GwkW2kUf43q6jGI1NT01HkLS9GGbFnfE9QggAKy2DjntR6Fx665CZJ0SjkcGMkH
         xRy2AGr5LDDDFFuh9HNA6wWuSG1dtr4sp9uMki+Izn0GRxeZyHsAfRzSSoMOix5yU9YN
         +81A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uFOb//suq8hHcDGeC6dx/+f14Nrn5k+ZlOf6eBQBe9A=;
        b=hapjozY39m4O5mMY1GIT9IZyC0Dmwl0qo5IVjXg9F8mDT0rHRchiVjKosT8Us0sp1W
         NwsrBvr+4GGa06jHPqH/z5yXFh4o64vF4NOA46NMv9EGNVl4OGb1VTiPK3wq1ZqlMdB6
         Oa05N0y8lYdiQcsUit+nciQOabtzNHzyLC4/LG/BK7a3p+dLUMfRXXmSbJMg9MSOpYx+
         3cQ5wVDGef35ArtQyCGBhKwb6zPYD3tghYd9JHzkngNU+mLl3JuFVdTF5b+BlgwvKD9x
         1t5e0qoHwkTLI3vW1gU32kbC8ogb2OZlHUMYDx5UMbKkoC+VQOaFw+24xOsCgJdJczoP
         FXiw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QdpNZM2+;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id z3sor3463756wmp.12.2021.12.13.07.48.33
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 13 Dec 2021 07:48:33 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QdpNZM2+;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=uFOb//suq8hHcDGeC6dx/+f14Nrn5k+ZlOf6eBQBe9A=;
        b=QdpNZM2+WZ7/yY6cjeqj7U1LGMD//Y0OCA/z/DDkrYN7oSUKL6pbatgAZELKPLTUWE
         aygdU667YCpxB+4c11TOX5W0gO/AANtIw1crA8NQFvJT9G1xVNDIDmBC2fpJdEytYVre
         KU9+2IOw/LQh6q8gvswqZc7NDEExuwUXOUgQEbYGE7c+2F3dEQ06s4ErdEy4KhA/oISQ
         fhEeNkWCSEGNu23TEYAFPsrxnwr19XwdplhZLm2e5ec3jS2Mz+C0A2zhCq3vqU5x5l6E
         ryIm8uMsOVZPaWy05Yu+2xsgrJ9obutXaysfGmGTc9bu9YzaUXStIX8/e21sYR5ci7Ws
         UksQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=uFOb//suq8hHcDGeC6dx/+f14Nrn5k+ZlOf6eBQBe9A=;
        b=1wLjTOyRD6y8Yi7BSqTq/gjwmpwQo5rfdjUgMaEIauGm9VssrhfIyF63FwaKiq21s2
         RA3wbZAuKNzPTfS13aHeH/CH9gLSrQqjU89henEq5f5VSwIHdJrvDgSxBuiuEVHwDQra
         W8xalgRJWnLleT9bBjoqLMAM1t1yZiws/I+JCyS6+J3dzLWj9VtWmBr7Wk38jVw5f4Mp
         eNjPC2RlIb8jdaJDI1vjddVr8CVy/qt0J6iUznvkrYnnTmipzOD3vYvAlKl4OUOR2g6L
         +KIyUvfpXqYx/IZ4qwiGmzNHxXlYY9QHsBVdJq4qA12hD4Wa09Q7+bFPqBTBIEdQBw9G
         RimA==
X-Gm-Message-State: AOAM533v+O1e9LsV7OnRCUVbltZQKmvM/s2k7a7A7tp3ucswNihfriq2
	88tiBzk1CJNiwC2wg2Uq0JocZ3sTmOmA+3idAU8V+bt9x1Wyrw==
X-Google-Smtp-Source: ABdhPJyQhYraBNEbXwyoqWuNNSb/sJX2mMwlPVxM4jcDcQXnQimGa5WCNIN9JB6bU3J0TLoLt/PKmZij6Is4ugX8450=
X-Received: by 2002:a05:600c:3486:: with SMTP id a6mr38114473wmq.32.1639410513243;
 Mon, 13 Dec 2021 07:48:33 -0800 (PST)
MIME-Version: 1.0
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-27-peter.maydell@linaro.org> <871r2gk0sq.fsf@linaro.org>
In-Reply-To: <871r2gk0sq.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Dec 2021 15:48:21 +0000
Message-ID: <CAFEAcA8bbi1s-fNv73ZGy9KYPaoM2WjZFW=hF0+ZcRsY7Nvf9w@mail.gmail.com>
Subject: Re: [PATCH 26/26] hw/intc/arm_gicv3_its: Factor out "find address of
 table entry" code
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
	Shashi Mallela <shashi.mallela@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: GwAqL7FsOV2a

On Mon, 13 Dec 2021 at 15:00, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > The ITS has several tables which all share a similar format,
> > described by the TableDesc struct: the guest may configure them
> > to be a single-level table or a two-level table. Currently we
> > open-code the process of finding the table entry in all the
> > functions which read or write the device table or the collection
> > table. Factor out the "get the address of the table entry"
> > logic into a new function, so that the code which needs to
> > read or write a table entry only needs to call table_entry_addr()
> > and then perform a suitable load or store to that address.
> >
> > Note that the error handling is slightly complicated because
> > we want to handle two cases differently:
> >  * failure to read the L1 table entry should end up causing
> >    a command stall, like other kinds of DMA error
> >  * an L1 table entry that says there is no L2 table for this
> >    index (ie whose valid bit is 0) must result in us treating
> >    the table entry as not-valid on read, and discarding
> >    writes (this is mandated by the spec)
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> > This is a worthwhile refactoring on its own, but still more
> > so given that GICv4 adds another table in this format.
> > ---
> >  hw/intc/arm_gicv3_its.c | 212 +++++++++++++---------------------------
> >  1 file changed, 70 insertions(+), 142 deletions(-)
> >
> > diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
> > index 3bcc4c3db85..90a9fd3b3d4 100644
> > --- a/hw/intc/arm_gicv3_its.c
> > +++ b/hw/intc/arm_gicv3_its.c
> > @@ -83,44 +83,62 @@ static uint64_t baser_base_addr(uint64_t value, uin=
t32_t page_sz)
> >      return result;
> >  }
> >
> > +static uint64_t table_entry_addr(GICv3ITSState *s, TableDesc *td,
> > +                                 uint32_t idx, MemTxResult *res)
> > +{
>
> It seems odd to have a uint64_t return type when....
>
> > +    /*
> > +     * Given a TableDesc describing one of the ITS in-guest-memory
> > +     * tables and an index into it, return the guest address
> > +     * corresponding to that table entry.
> > +     * If there was a memory error reading the L1 table of an
> > +     * indirect table, *res is set accordingly, and we return -1.
> > +     * If the L1 table entry is marked not valid, we return -1 with
> > +     * *res set to MEMTX_OK.
> > +     *
> > +     * The specification defines the format of level 1 entries of a
> > +     * 2-level table, but the format of level 2 entries and the format
> > +     * of flat-mapped tables is IMPDEF.
> > +     */
> > +    AddressSpace *as =3D &s->gicv3->dma_as;
> > +    uint32_t l2idx;
> > +    uint64_t l2;
> > +    uint32_t num_l2_entries;
> > +
> > +    *res =3D MEMTX_OK;
> > +
> > +    if (!td->indirect) {
> > +        /* Single level table */
> > +        return td->base_addr + idx * td->entry_sz;
> > +    }
> > +
> > +    /* Two level table */
> > +    l2idx =3D idx / (td->page_sz / L1TABLE_ENTRY_SIZE);
> > +
> > +    l2 =3D address_space_ldq_le(as,
> > +                              td->base_addr + (l2idx * L1TABLE_ENTRY_S=
IZE),
> > +                              MEMTXATTRS_UNSPECIFIED, res);
> > +    if (*res !=3D MEMTX_OK) {
> > +        return -1;
> > +    }
> > +    if (!(l2 & L2_TABLE_VALID_MASK)) {
> > +        return -1;
> > +    }
>
> We can return signed results. I guess implicit conversion takes care of
> it but I wonder if it would be cleaner to return an int (or maybe
> compare against UNINT64_MAX =3D=3D INVALID_TABLE_ENTRY)?

-1 is only there to be a "definitely not a valid address" value,
and it's less typing than UINT64_MAX.

-- PMM

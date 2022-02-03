Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp1756890lfk;
        Thu, 3 Feb 2022 02:45:32 -0800 (PST)
X-Received: by 2002:adf:f582:: with SMTP id f2mr29157869wro.161.1643885132208;
        Thu, 03 Feb 2022 02:45:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643885132; cv=none;
        d=google.com; s=arc-20160816;
        b=GeywuUqkxgZguypxJTONvX8kzfrMw3LUmfqprmPjPt6HnMCEnA2ph/BqMtE3khlA4t
         AFiTl8YnTJ2+J1GY5kh+P6cXyLUDo0rlAi3aD3B08QlonTOn0aBRIh45g9/rSYlHulLQ
         O2k8QvElqT0OwLrrHbNXmfRgTfr5lnWSYAuf77kELdBqQ1xJcD2CMOXAoZbGAsz7KcB3
         49HY4eRRn8Q/EctAxPYyOJH1ewdTKBbZ1wl+YpmQOwA99WC8PFzgfOmGoHthtyGagzyb
         uWGk9sVWOk2T1u2bAsFxcq4qZMejl1xSh2eU7UIrEeRIjGQ5dvfwnqmkLtbJ4vL3kX6A
         nx4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=BCn/bBH/9rDiq4cqAadL0VdAEadNPEIEhhF2HZJ4TO0=;
        b=vd0TjmpWInv7cRgE4LmToqGcbQ8JJkogtIcpEzKfjsJOJVPmELZivMsI7XdZQuroEb
         kfbfm1xgMtaZl8zfIJ9HlqH81e768M5dVgQDQwOZyqRMMgQ1YtYYKQA+GUoLMS1zIs91
         ItY0wOD58FxsoDmGGvHLQYsBi2+vh4Xunm9XyWTAUL00etRyv8Ox1Ivq31gCUkCs26E6
         YaNbjJzIYfOzR45h1hMJ5ELtgIz6xAawhD/LcDewPwxHIe5K9HoNuNjL6R5/RqcdjOaO
         gHvq3z7Ni/3zgC4tKSooOxjwAZiOtHZA+/JQ5j8n89Fi/lb0Cbybf0pXUZP7Uky0h8xD
         erpg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rhgLG1bt;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id g17sor26011635wrv.76.2022.02.03.02.45.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 03 Feb 2022 02:45:32 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rhgLG1bt;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BCn/bBH/9rDiq4cqAadL0VdAEadNPEIEhhF2HZJ4TO0=;
        b=rhgLG1btCNuXGP2638V46xfUaCF3dmy7TCcoikko3FBxrFRz9xUpUxVLFxuHwtunnp
         5+ZaCT/x2gE98Fu8RyfMaNKuA+NaSyV7DIpP+TiKT8KHc6e7rnf06TOgS6X4QW4iXSmZ
         GyQBPf2DHRuCRZnJnS2//uFrxN2WCfR09XmmJWw5aK3jBXQZfvMQoUD3mey1v/ZqvntZ
         v1RHiXHyph+7InFrSl7ZEevXFMxH96E533sp3uOaoDigjEut0E5GIQFjLDaW9fjAQhDw
         e3+RB4hkkDHpkbciLgzO/y0JKrmRwSajP67QlFgxqfr3RTVt7PQKkDyqDwxd1JLfRNHO
         j/gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BCn/bBH/9rDiq4cqAadL0VdAEadNPEIEhhF2HZJ4TO0=;
        b=A2UNoKGSGuh8vU2scYIvS/OH1hxsWchtWX/x5dMCtRBJCRKQYZn2ZEke9prVnDL26w
         ai27dbYwJUb2FWuCQB7UGh9yUqIY2YoMxdaoiaGXHmlYS5i+orK53akoIw3mLK+QpaJH
         lBG2gig1h2M6Q+XkxWYE6zsa/+ZCTJYpxVTjGc6LpSap98l3Db4/XL8f/2TWP0pbXsvh
         5EGWxcYADT2yudvafm5FqFktmDzEzznPpDIreahDpiuaPshpMnTNHUZvhMQ1nyEIkRBe
         czFpC9CQ5PtVQLILZgHqsy5a6WShg+4x4smOHtQyBKKM+YkPi4U/6p5T2BfzXfcse71H
         8AKQ==
X-Gm-Message-State: AOAM5314lei6ns4aUwReJTCd0SRSGMeJjQmMlkh7iVcHJSMw5fhR1Hjb
	No/U9sFKErOyQ1UJfT2n42HcR01PqZy6oBXj3sEPznap
X-Google-Smtp-Source: ABdhPJzIETsTVyzHDV4S/CheMuhDu5lAV+4M5e/nnf/uX/Q7gRuTRfn/C2ACmiChu/1epuJ2LUFrATp+3KvNAMWdTKs=
X-Received: by 2002:a05:6000:258:: with SMTP id m24mr29663952wrz.2.1643885131879;
 Thu, 03 Feb 2022 02:45:31 -0800 (PST)
MIME-Version: 1.0
References: <20220201193207.2771604-1-peter.maydell@linaro.org>
 <20220201193207.2771604-7-peter.maydell@linaro.org> <afbbee74-b6fc-7b55-f7e4-c5ae926f7519@linaro.org>
In-Reply-To: <afbbee74-b6fc-7b55-f7e4-c5ae926f7519@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Feb 2022 10:45:20 +0000
Message-ID: <CAFEAcA9Dj0K5T677__5wBA5=T5c1qOxNxwW5hkZU9-vDCP-76Q@mail.gmail.com>
Subject: Re: [PATCH 06/13] hw/intc/arm_gicv3_its: Fix address calculation in
 get_ite() and update_ite()
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Shashi Mallela <shashi.mallela@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: 6IyY5+IA2G+a

On Thu, 3 Feb 2022 at 03:59, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 2/2/22 06:32, Peter Maydell wrote:
> > In get_ite() and update_ite() we work with a 12-byte in-guest-memory
> > table entry, which we intend to handle as an 8-byte value followed by
> > a 4-byte value.  Unfortunately the calculation of the address of the
> > 4-byte value is wrong, because we write it as:
> >
> >   table_base_address + (index * entrysize) + 4
> > (obfuscated by the way the expression has been written)
> >
> > when it should be + 8.  This bug meant that we overwrote the top
> > bytes of the 8-byte value with the 4-byte value.  There are no
> > guest-visible effects because the top half of the 8-byte value
> > contains only the doorbell interrupt field, which is used only in
> > GICv4, and the two bugs in the "write ITE" and "read ITE" codepaths
> > cancel each other out.
> >
> > We can't simply change the calculation, because this would break
> > migration of a (TCG) guest from the old version of QEMU which had
> > in-guest-memory interrupt tables written using the buggy version of
> > update_ite().  We must also at the same time change the layout of the
> > fields within the ITE_L and ITE_H values so that the in-memory
> > locations of the fields we care about (VALID, INTTYPE, INTID and
> > ICID) stay the same.

> This is confusing: 5-3 is titled "example of the number of bits that might be stored in an
> ITE"?  Surely there must be a true architected format for this table, the one real
> hardware uses.  Surely tcg will simply have to suck it up and break migration to fix this
> properly.

No, the ITE format is implementation-defined, like that of the other
in-guest-memory tables the ITS uses. It's UNPREDICTABLE for a guest
to try to directly access the tables in memory -- they are only ever
written or read by the ITS itself in response to incoming commands,
so it's not a problem for the format in memory to be impdef. This
flexibility in the spec allows implementations to minimize the size
of their data tables based on how large an ID size they support and
other potentially-configurable parameters. For instance if you look
at the values for the GITS_BASER* for the GIC-700 in its TRM you
can see that its Collection Table entry size is only 2 bytes, since
it uses the "rdbase is a CPU number" format; an ITS that used the
"rdbase is a physical address" implementation choice would need
more bytes there. (QEMU also uses "rdbase is a CPU number", but
we have rather profligately opted to use 8 bytes per collection
table entry.)

thanks
-- PMM

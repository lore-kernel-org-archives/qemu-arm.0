Received: by 2002:a17:504:6454:b0:1be9:327d:8ee3 with SMTP id g20csp926448njh;
        Mon, 12 Aug 2024 14:14:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVXotBxHWQu8Zwu3H4JQRTuhfv9IcDPnw892uX1+KP2qf+S7mgsc43I/gsBk+2HquURea++FMQviLuPIw==@linaro.org
X-Received: by 2002:a2e:7a1a:0:b0:2f2:9f39:3e58 with SMTP id 38308e7fff4ca-2f2b717f104mr9272191fa.48.1723497277171;
        Mon, 12 Aug 2024 14:14:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723497277; cv=none;
        d=google.com; s=arc-20160816;
        b=o7msOlAppssYGKFktJ4q0XSvSqjgHZluaVGNlO08gIILMjbxmr12KaScSy6J5hU9Qd
         W87rjtKALUR9O0gzsPCARdune9iVkgq3XRavbkOcACTymkdVn13c9wW85k0MSxWoE8lh
         SWv5X+CCzVADYiI64saWneiIJpT8usdsshlgSDX+YByOTFqW0lcTDmj81xmyFoZFkFpn
         sUKzxB3u8R42nnstRS2WGsRH/tKJn3Joay6VlMgHAJ2K/HCZoUvgrDNmziwLTOSXGQfC
         oqWSV5uQkDwH4Zi6ekbMbon3PO1jbVo1xX35vcMc4A2R/LTd0UfRp7n1yUJOpg1hqBdj
         TabQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mMvb+UqDsd/Tku1WIghTxYcMI1Pxj9JCY1dloGvUNN4=;
        fh=X57SQT6hxYhvuXBb53M9i4duCzoCGLa0paiZxDdf95Q=;
        b=yPDe6v603T5fnobm0p0h7WIxtmSYCRvXL21XlCoJqqLT5+CW51pREsTt9qdcvniumM
         Lh4DMIojL5VRJstExpWCRH0AfOYmPoUCXCk01wDlef3SuhaSxc4OCcmwwgu5T4CI0A9u
         Iq0tmQaUdTwf1fG5MubwEIrvmUEH/7tqN+ObOFIrkKRheK+aBGWwqaY6Uu/X0e7A7Eox
         vPX+Gzwhl28414bErjdS9XYebKStfXk8Wmqqg3LaJY1dF33AoeI1PDbljM7ebaF1XVkI
         K4Bz0hCqeSiGXcUAWdOpCcuZSy06lFviTqCrKYM4KLL092vCGlapXZXtnGEIY3vJEF0O
         0MYg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=Pfa5kDpJ;
       spf=pass (google.com: domain of tavip@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=tavip@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <tavip@google.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-429c7d7bd01sor15563035e9.5.2024.08.12.14.14.36
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 12 Aug 2024 14:14:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of tavip@google.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=Pfa5kDpJ;
       spf=pass (google.com: domain of tavip@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=tavip@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723497276; x=1724102076; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mMvb+UqDsd/Tku1WIghTxYcMI1Pxj9JCY1dloGvUNN4=;
        b=Pfa5kDpJxECm1hM4KCTpuRdIjXHd4kig/+WrKm7vuJw95xFJ5+UYQZucY+LLcarq0G
         ptdv83upUnG+qIITDBWiGznVAMiwTlIJWbEaQe9gBDp43zMbuVGtDQE82D0hUAafMjz2
         vwd6uFlbZVHQmca8CeGx3JktuhqTorxDoXtwoNFmitOBqqQt34xWXy7DTP2DBSbHZiTl
         wZJXwN9K67ec0Z4ddLkoxXWtvFIQrrqHShUone+8DCtjEqq943DIPjtQMKUbXwUg3pFi
         tEeex6p8gM2OC/U1CP1EcKZKnNOSCwbja2V+1w6Ujh80CCTa/p3soa314xhFewotJSiK
         h7YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723497276; x=1724102076;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mMvb+UqDsd/Tku1WIghTxYcMI1Pxj9JCY1dloGvUNN4=;
        b=bWX5OwA4+rhKXlvJ6kHoXqrvsmV8wBdiD2VVKR7VjApmY2F59CBcvbfVdBVwaXqOMS
         F23kM42L7N1QqAXBPsGtn24n23tEeONsh/uHceGXJUjBUFQU3FwOxu7kHe5WzHjeaBN6
         18z7acivRv5Q2q/HNNPkdF7zYqT07+yg/P7w/SA+ZjgX+H/El7wUyBzd9VF3oJME1nEs
         9wOspbxxNXfNvSCOueOeoz+4+0hxsM4fQSsJDtVpXv1rEniburnxScTdpih3Fozmohm1
         idUuVM0Ehupizb8Ud8PDBiYvMApqrHbYqF9vXqH+Mgtvgv4PA+lTKF1whWQGT7Q5CX7k
         9+Hg==
X-Forwarded-Encrypted: i=1; AJvYcCXWwm9zwFBkfPj0+l8baol7WDIX+H7MGEoJsXjXj8hMNtowfhT7xeH/yBaIFgQqWGirKemfvT7PGY0AIw==@linaro.org
X-Gm-Message-State: AOJu0YzBCZRgNNFugVWGGrBy/c1E4dOBPIf7iHIUSlX99rwGvYkNoOLW
	YdPd3J8+7S2k5+NmG/FRpdWvOJADH4gdEZK9OwLsLLforcwJgjhMsDtEry2Kqmn6OX4LcCiNxSI
	PrdiiOsYv7lVmR67dTni/h/RS8lUcJDcHkdZp
X-Google-Smtp-Source: AGHT+IEI/lb3441nKg8VrlmQXZ7GlntoNFJyPGTMbczV9Khc1nhlnD+RGCJQxF9Ns6orFxbnzfY1Y37Ki02HqQmRNBE=
X-Received: by 2002:a05:6000:1803:b0:368:6620:20ec with SMTP id
 ffacd0b85a97d-3716cd23cc6mr1128697f8f.43.1723497276284; Mon, 12 Aug 2024
 14:14:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240805201719.2345596-1-tavip@google.com> <20240805201719.2345596-6-tavip@google.com>
 <CAFEAcA8w47gZYV8GBQa3fNf1cBWNtm_k4DAdnOVt4RWBdSrghg@mail.gmail.com>
In-Reply-To: <CAFEAcA8w47gZYV8GBQa3fNf1cBWNtm_k4DAdnOVt4RWBdSrghg@mail.gmail.com>
From: Octavian Purdila <tavip@google.com>
Date: Mon, 12 Aug 2024 14:14:24 -0700
Message-ID: <CAGWr4cSwJPMngzA7DAHRHu7eJkWGhzxuAMB2fbGRnNAx-7AR7g@mail.gmail.com>
Subject: Re: [RFC PATCH 05/23] hw: add register access utility functions
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, stefanst@google.com, 
	pbonzini@redhat.com, alex.bennee@linaro.org, thuth@redhat.com, 
	marcandre.lureau@redhat.com, alistair@alistair23.me, berrange@redhat.com, 
	philmd@linaro.org, jsnow@redhat.com, crosa@redhat.com, bleal@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: V1kowULgq0Bv

On Mon, Aug 12, 2024 at 8:33=E2=80=AFAM Peter Maydell <peter.maydell@linaro=
.org> wrote:
>
> On Mon, 5 Aug 2024 at 21:17, Octavian Purdila <tavip@google.com> wrote:
> >
> > Add register access utility functions for device models, like checking
> > aligned access and reading and writing to a register backstore.
>
>
> > Signed-off-by: Octavian Purdila <tavip@google.com>
> > ---
> >  include/hw/regs.h | 89 +++++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 89 insertions(+)
> >  create mode 100644 include/hw/regs.h
> >
> > diff --git a/include/hw/regs.h b/include/hw/regs.h
> > new file mode 100644
> > index 0000000000..8d0da0629d
> > --- /dev/null
> > +++ b/include/hw/regs.h
> > @@ -0,0 +1,89 @@
> > +/*
> > + * Useful macros/functions for register handling.
> > + *
> > + * Copyright (c) 2021 Google LLC
> > + *
> > + * SPDX-License-Identifier: GPL-2.0-or-later
> > + *
> > + * This work is licensed under the terms of the GNU GPL, version 2 or =
later.
> > + * See the COPYING file in the top-level directory.
> > + */
> > +
> > +#ifndef HW_REGS_H
> > +#define HW_REGS_H
> > +
> > +#include "exec/hwaddr.h"
> > +#include "exec/memattrs.h"
> > +
> > +#define BITS(hi, lo)       (BIT(hi + 1) - BIT(lo))
> > +#define BIT_IS_SET(v, b)   (((v) & BIT(b)) !=3D 0)
>
> To the extent we need these we should be putting them in
> bits.h with the other bit-related operations. (But
> prefer the existing MAKE_64BIT_MASK over adding a
> second macro that evaluates to a mask with a given
> run of bits set).
>

BITS is useful when defining masks from datasheets. Specifically, in
this patch set they are used to define writable bits. While it is
possible to use MAKE_64BIT_MASK, I find it less error prone to use
BITS.

However, it just occurred to me that we might be able to use the SVD
information to derive this. If possible I'll just remove it in v2
(otherwise I will move it to include/qemu/bitops.h).

> > +
> > +/*
> > + * reg32_aligned_access
> > + * @addr: address to check
> > + * @size: size of access
> > + *
> > + * Check if access to a hardware address is 32bit aligned.
> > + *
> > + * Returns: true if access is 32bit aligned, false otherwise
> > + */
> > +static inline bool reg32_aligned_access(hwaddr addr, unsigned size)
> > +{
> > +    if (size !=3D 4 || addr % 4 !=3D 0) {
> > +        return false;
> > +    }
> > +    return true;
> > +}
> > +
> > +/*
> > + * reg32_write
> > + * @base: base address
> > + * @addr: register offset in bytes
> > + * @val: value to write
> > + * @wr_bits_array: RW bitmask array
> > + *
> > + * Update the RW/WO bits of a 32bit register backstore with a given va=
lue
> > + * (discarding updats to the RO bits). The RW/WO bits are encoded in t=
he
> > + * @wr_bits_array with bits set being RW and bits unset being RO.
> > + *
> > + * Usage example:
> > + *
> > + * wr_bits_array[] =3D {
> > + *    [REG1_ADDR/4] =3D 0xFF000000, // MSB byte writable
> > + *    [REG2_ADDR/4] =3D 0xFF,       // LSB byte writable
> > + *    // all other registers are read-only
> > + * };
> > + *
> > + * // backstore is updated to 0x12000000
> > + * reg32_write(&backstore, REG1_ADDR, 0x12345678, wr_bits_array);
> > + * // backstore is updated to 0x78
> > + * reg32_write(&backstore, REG2_ADDR, 0x12345678, wr_bits_array);
> > + */
>
> This seems like it's reimplementing include/hw/register.h
> functionality. I'm not personally a super-fan of that API,
> but I definitely would prefer it if we didn't have more than
> one way to do this.
>

Interesting, I was not aware of this thanks for pointing it out!

It seems a bit heavy to be used just for the write masking part, but
I'll take a closer look at it.

> > +static inline uint32_t reg32_write(void *base, uint32_t off, uint32_t =
val,
> > +                                   const uint32_t *rw_bits_array)
> > +{
> > +    uint32_t *ptr =3D base + addr;
> > +    uint32_t old_value =3D *ptr;
> > +    uint32_t mask =3D rw_bits_array ? rw_bits_array[addr / 4] : 0xFFFF=
FFFF;
> > +
> > +    /* set WO/RW bits */
> > +    *ptr |=3D val & mask;
> > +    /* clear RO bits */
> > +    *ptr &=3D val | ~mask;
> > +
> > +    return old_value;
> > +}
> > +
> > +/*
> > + * reg32_read
> > + * @base: base address
> > + * @addr: register offset in bytes
> > + *
> > + * Returns: 32bit value from register backstore
> > + */
> > +static inline uint32_t reg32_read(void *base, uint32_t addr)
> > +{
> > +    return *(uint32_t *)(base + addr);
> > +}
>
> Pointer type handling looks suspicious here -- if
> the thing we're accessing is really a uint32_t* then
> we should take that; if it isn't then casting it to
> one and dereferencing might be reading unaligned memory.
>

It is used for performing generic accesses to generated structs (patch
3/23) which should be aligned in the way that are used in the patch
set. If we decide to keep it, I'll add a note regarding alignment.

> thanks
> -- PMM

Received: by 2002:a17:504:6454:b0:1be9:327d:8ee3 with SMTP id g20csp823426njh;
        Mon, 12 Aug 2024 08:32:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWLyzfRmyJk78dPYwYAq/MW6SNBoQOMcHqaBiLszMAHgxrabQWyyu9hkv9utxTqelEnKgfT1mBNHqs5V7ghcUJLxrCIswlT
X-Received: by 2002:a05:6402:51ca:b0:5b4:ec9d:d66a with SMTP id 4fb4d7f45d1cf-5bd461c9a9dmr17689a12.15.1723476778397;
        Mon, 12 Aug 2024 08:32:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723476778; cv=none;
        d=google.com; s=arc-20160816;
        b=Y8NetQ+K3ejxhFvVGqNhTuW0/d8p43Tz4Lo8DkbnLTFKCvWpNm1EBUXw4Ml678hPWM
         QZQxGi/EOYAxYNWW9ghe6uPVtFTe96EKFN7gond0NSpjOGwj1FwrwnHALU5f83IDIBed
         z41D9BXBbaoZNaIXWDFD1LVcDga81cTmLdHiaHSPIbq5n6tEzbbrKwx5fSo1vLx/Wgxr
         FtCeGY8Ll+WMtCWaUkLvNJBKbfWdWLMLUxA7B6TgcPqFhvxfAn6W+DxrhNdklcYSFdGd
         MfFGOpEJhs0yyA7XG6PxggoSypH3AO67rr9jTqRYJB42CGZUb48EbR/Ze2n+y2NX/PMy
         lBBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zh+tcHdNJStvkyZi7SCX0p4WIPRkVyIGm6MjrcYoKk0=;
        fh=iEkHGeWN81YdYjNJvHEZ8MkOyk2PGE3m038IKQFOlH8=;
        b=dS4DFKhrinEA79rLgdc+Wdh4IPm87b08hgsqzB0GTs4/W2F3G78EwHYR9Z56XQrwF6
         ESktjFFtqqxPZDmZqnQKKRbiedwx7Rx3vaweB8RizPbp/KmjFhJFmGSLfSuOZ+13FM91
         ydHQk5mKdbolJcbFlfieVW/+y5Ijp5dw2LG/q/V3gMde7/iwnw+2UmEpzxFxYJw9BAkC
         VhBpzc6s64Q+9A43mW55vbCpWUQ8skLvVW4EInCk4SoEiXS52+4SpwpoqduO1CzP2dvB
         QHjHSIdWg0UCTn6BXpKwojP6M8ryx/eXoUsZAQjHsnogUurYGRMqQDIsU+a7yIV7cMsi
         smHg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aSNXjsT8;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 4fb4d7f45d1cf-5bd1452b123sor1749740a12.0.2024.08.12.08.32.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 12 Aug 2024 08:32:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aSNXjsT8;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723476778; x=1724081578; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zh+tcHdNJStvkyZi7SCX0p4WIPRkVyIGm6MjrcYoKk0=;
        b=aSNXjsT8xalxrSnUTJvGtiILrbuuDmu7DnQXlQ6EdSJPoehNa5OzU5bANhDTnin2zx
         hrhju2vaRpa5P0q3an+shwiP0elz1nJ0ZLlCONxHADnwSUL5yiaDwCzsHSfG2Owv5WFz
         T+p/IKtxURUGXjjGmHA6OG85Dh/E2+6gwaO7710UOOhN/CzMy5vjPtob8KzakSkeq1ib
         nZSa/aCNQUl2anuwiXzEQ74WNZ/V/5IcNFmMc3MrL6JpNg6OgrGN1QFwZe4ciUZlfkNN
         4NoandyqQ5Hejoj+vICkA6xN3EamgugbYyvwVrgsfDrFYv3ZiWzeIKEz7WcoW8aZyZ5W
         aWvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723476778; x=1724081578;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zh+tcHdNJStvkyZi7SCX0p4WIPRkVyIGm6MjrcYoKk0=;
        b=INn9BQYTZrgNERzPs/S0HZtZAFGehsvan+erISknCueQCH5MiUc2hq9sVmYsDGVLnL
         nLWfw+PlzGUHMt+Oh/3lBjL5zARpvCPE1yjl5UBGll01V53WUATZNnzFyaAEdZquoK5l
         KG9nMPwFDhUPTlfwjjihf3xiSxjBC5RD64W6cJU7KCK8tETeHyxKl6nLlJrJFRX+75D/
         I7q7XAJGWDXwjxlKOderSpMpEirBuvW0PGbfPyPYTyOOXnwQT6Z5aqxv2APQJrdaLpsh
         jyt5RITGoN2md/OeeBmqXLjU7Rh2c2Hq27Wnp68JltXvHw7O9qQNhdOAwlNNE7ayiaW5
         CDdw==
X-Forwarded-Encrypted: i=1; AJvYcCV96WTgHA5w21IsKYbvd1r76vwMpe+19ymR9LOtEnQuqGgsTxuuTvgp63yVOgda4czwxxKX5b5hJcfm3ZrJWTTMq7ksAuiQ
X-Gm-Message-State: AOJu0YyHEfRk1eTY8etf7tHFpuotcDBKRuPYFoTfMQm2uGmQf11YfcGp
	CbsTp2mPVbNsflv/K2HJDK8+zekXJyYL9Mi5g1NFk3WsFHqwi1jGoo++NzDJh3KkLkMlbkqrvFs
	rcSBupQFJq8CetlB46dJGryIyjK7YBRGlD3hfcb+s
X-Google-Smtp-Source: AGHT+IEdX+pzzAuuzCSkxd4huzXwbL3Jd14+XATfxnuAQOBhZagp/wcphaR16mQ9LmjE/yEzIelzvsilJCnN5ehsGX0=
X-Received: by 2002:a05:6402:5246:b0:5b8:4a95:2fe7 with SMTP id
 4fb4d7f45d1cf-5bd46176b0bmr34501a12.1.1723476777666; Mon, 12 Aug 2024
 08:32:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240805201719.2345596-1-tavip@google.com> <20240805201719.2345596-6-tavip@google.com>
In-Reply-To: <20240805201719.2345596-6-tavip@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 12 Aug 2024 16:32:46 +0100
Message-ID: <CAFEAcA8w47gZYV8GBQa3fNf1cBWNtm_k4DAdnOVt4RWBdSrghg@mail.gmail.com>
Subject: Re: [RFC PATCH 05/23] hw: add register access utility functions
To: Octavian Purdila <tavip@google.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, stefanst@google.com, 
	pbonzini@redhat.com, alex.bennee@linaro.org, thuth@redhat.com, 
	marcandre.lureau@redhat.com, alistair@alistair23.me, berrange@redhat.com, 
	philmd@linaro.org, jsnow@redhat.com, crosa@redhat.com, bleal@redhat.com
Content-Type: text/plain; charset="UTF-8"
X-TUID: kLnh+mjd8sU+

On Mon, 5 Aug 2024 at 21:17, Octavian Purdila <tavip@google.com> wrote:
>
> Add register access utility functions for device models, like checking
> aligned access and reading and writing to a register backstore.


> Signed-off-by: Octavian Purdila <tavip@google.com>
> ---
>  include/hw/regs.h | 89 +++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 89 insertions(+)
>  create mode 100644 include/hw/regs.h
>
> diff --git a/include/hw/regs.h b/include/hw/regs.h
> new file mode 100644
> index 0000000000..8d0da0629d
> --- /dev/null
> +++ b/include/hw/regs.h
> @@ -0,0 +1,89 @@
> +/*
> + * Useful macros/functions for register handling.
> + *
> + * Copyright (c) 2021 Google LLC
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#ifndef HW_REGS_H
> +#define HW_REGS_H
> +
> +#include "exec/hwaddr.h"
> +#include "exec/memattrs.h"
> +
> +#define BITS(hi, lo)       (BIT(hi + 1) - BIT(lo))
> +#define BIT_IS_SET(v, b)   (((v) & BIT(b)) != 0)

To the extent we need these we should be putting them in
bits.h with the other bit-related operations. (But
prefer the existing MAKE_64BIT_MASK over adding a
second macro that evaluates to a mask with a given
run of bits set).

> +
> +/*
> + * reg32_aligned_access
> + * @addr: address to check
> + * @size: size of access
> + *
> + * Check if access to a hardware address is 32bit aligned.
> + *
> + * Returns: true if access is 32bit aligned, false otherwise
> + */
> +static inline bool reg32_aligned_access(hwaddr addr, unsigned size)
> +{
> +    if (size != 4 || addr % 4 != 0) {
> +        return false;
> +    }
> +    return true;
> +}
> +
> +/*
> + * reg32_write
> + * @base: base address
> + * @addr: register offset in bytes
> + * @val: value to write
> + * @wr_bits_array: RW bitmask array
> + *
> + * Update the RW/WO bits of a 32bit register backstore with a given value
> + * (discarding updats to the RO bits). The RW/WO bits are encoded in the
> + * @wr_bits_array with bits set being RW and bits unset being RO.
> + *
> + * Usage example:
> + *
> + * wr_bits_array[] = {
> + *    [REG1_ADDR/4] = 0xFF000000, // MSB byte writable
> + *    [REG2_ADDR/4] = 0xFF,       // LSB byte writable
> + *    // all other registers are read-only
> + * };
> + *
> + * // backstore is updated to 0x12000000
> + * reg32_write(&backstore, REG1_ADDR, 0x12345678, wr_bits_array);
> + * // backstore is updated to 0x78
> + * reg32_write(&backstore, REG2_ADDR, 0x12345678, wr_bits_array);
> + */

This seems like it's reimplementing include/hw/register.h
functionality. I'm not personally a super-fan of that API,
but I definitely would prefer it if we didn't have more than
one way to do this.

> +static inline uint32_t reg32_write(void *base, uint32_t off, uint32_t val,
> +                                   const uint32_t *rw_bits_array)
> +{
> +    uint32_t *ptr = base + addr;
> +    uint32_t old_value = *ptr;
> +    uint32_t mask = rw_bits_array ? rw_bits_array[addr / 4] : 0xFFFFFFFF;
> +
> +    /* set WO/RW bits */
> +    *ptr |= val & mask;
> +    /* clear RO bits */
> +    *ptr &= val | ~mask;
> +
> +    return old_value;
> +}
> +
> +/*
> + * reg32_read
> + * @base: base address
> + * @addr: register offset in bytes
> + *
> + * Returns: 32bit value from register backstore
> + */
> +static inline uint32_t reg32_read(void *base, uint32_t addr)
> +{
> +    return *(uint32_t *)(base + addr);
> +}

Pointer type handling looks suspicious here -- if
the thing we're accessing is really a uint32_t* then
we should take that; if it isn't then casting it to
one and dereferencing might be reading unaligned memory.

thanks
-- PMM

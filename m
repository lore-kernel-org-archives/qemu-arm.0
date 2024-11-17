Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp1973784njc;
        Sun, 17 Nov 2024 02:14:40 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVV43QWjRFIqjHwWDl/t+RunBb12SaUEzZN48LARnchYnTaFNKkRO56Ds5VZ1oHuhuXBRKbwPvsv7wQ8w==@linaro.org
X-Received: by 2002:a17:906:7952:b0:a9a:c57f:9666 with SMTP id a640c23a62f3a-aa4833e9b01mr777131666b.2.1731838480474;
        Sun, 17 Nov 2024 02:14:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731838480; cv=none;
        d=google.com; s=arc-20240605;
        b=Jgn/VGb8Cvd0lvkZ5JAZyanqFvN+vnkhfbS851tlZxbjBUyw4Mo6V0/lSCKA7Sh6ld
         n3vcaIeY/oZXQdDrvQ+16jlTKOHRm/XsVJVrCUXfbvmjNnsoRGTGWJcU1dDY8+5iedm+
         sGFP81oqeTM9PR3LzsKYP3VV8+cRvnM6KH7AG2Ujiaz2LO3pVy5ZWtZ4TQtV7B3r8h0b
         YiWhdvcW0X/+3xGJuba9l1Md6MyzionqGMSjWzgxZC+fyV0tmpieptPNaijnV3BFGHl9
         IpZpReQ4yvBdnfcGOWVkvqj9RmbIYFFnlYY6WAdcNTAeCYAwigR7ubn+czj8WQCBVNom
         3GbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=mHeEnxj6FSVQ9gUgCmwZgAJaHnlsmHPOgpH2cS45R5c=;
        fh=y8hn6DjuCwM0CJLk+ZVnE09okEXrQxogPiX/gB7B+3k=;
        b=DyWBIH6F/K8YZJ7r5r61jibMBjAENaH9V26y5/1i8GKIzeYdBEIzyP8KIXse3MYXTC
         KkgfxGkQIgf8w7Ks4TRkyIwYyCGAi756HOl411IcGb53KihmkY6xPeh7ASDwXlR1/2B2
         CJG5eg79vtcSlnzgVfoB2T05RKXJwm+m8SXNUCKKHsz7j8GQhHajXV/ewpbUT5wXCJOB
         N7qoLJZdfZCVp2Vm3bGsjlxa0wawK6g4rHX7YyIANFeMt3FqGxan8DtKJRmBczUkxrYl
         69Xg/SH4rKYedNCyAh2xNQoNnzNhQN5gTTeOi0FeUbpau7jsbpwEYbZwke7i9Iu7viIb
         eFkw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YlIsr7T1;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a640c23a62f3a-aa20df7e74bsor265764466b.9.2024.11.17.02.14.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 17 Nov 2024 02:14:40 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YlIsr7T1;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731838480; x=1732443280; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mHeEnxj6FSVQ9gUgCmwZgAJaHnlsmHPOgpH2cS45R5c=;
        b=YlIsr7T1cuj2zjURl3CQf6RzR2rMeiy9eyf53V81J8PLLd9m7KKiEISV5RgWiWAZX9
         E9LHXJPbVYVgZZ0g6T6ZXyhJOzAMhaA5+jbM8Inpq9SVYzOzDJYXWlKkD/IbxqF53GRM
         jE3nk3q7+wW1NOKyDZ13thU2I+YDBI6uTVlxuT53PrkJPEybP74Thfh1fvHQKoxJlnTV
         DrwLc/5udmDf8bQ3QfencDX7SmMBkLLxbBfy/kanGp8G80VnkifK9i3TNQzSTb2i23+2
         zCYaRJhc1iV1gz0aseL9IalEJbgQHyiuilYuSsrxzTEL8IBUTdlGuVGFEufcriPWM9bj
         659g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731838480; x=1732443280;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mHeEnxj6FSVQ9gUgCmwZgAJaHnlsmHPOgpH2cS45R5c=;
        b=I/FcMGRV7sn8Jeg4PSyuFtSerj4aVoDcD0phIgV9mCZ2Zb5CA+xyF/+cHEEjXBvxYy
         6uy9ucJ0WQxUIFTDOexxNDt8HhxmCw4QvAjgZJu6rojm+8EmlNPA4FQrAHJ8BfuWrgbF
         HIDN/UuhFksDE8RlWSiKQmpJFV/KvU75KsocveTcggLue4dLtfS9u01pqiPrnAmbS70P
         Aej+mj8NEt7ariGHXtuzoUAPpd0yCCrJEG8BT4teP4aj3eWw2WtwlQ8jhH91mAERfD7R
         oWb2a81rCLoRmNPekA+fWlkJkqR1tiMrt8uSlzJzZ5/6mkUmpbQwD3deN4fnRri6lEJK
         lssA==
X-Forwarded-Encrypted: i=1; AJvYcCUTAVLupDBvO+Gi0IYxYnSaWuCniq3zEsYnxspjlwAWhMly4J74xrZiV7m0zenENbEljjofkN98U7grhg==@linaro.org
X-Gm-Message-State: AOJu0YzZiVb//A9CQ9DzBO/9KtLwDbeqZYc7gxYgzWKoVZtmQpoVD68T
	oDZDh4QNPGFKYtqiPpmxCWHk6PIiciLriXbRwytrRT1LvWBEUhhHkge/v5djma8lnBfehRGGnRh
	j5A4bAlgJoyi+U7HTre0josA8KNqbJsS4nuXWDQKt
X-Google-Smtp-Source: AGHT+IF4++eWbTfA40zWMpS3vmibIp4IDq+JiEvZyxqVV7nQY+5tBZ+0tdFgcye7beqVKwh/xEIzBEetZgq4lTEq++w=
X-Received: by 2002:a17:907:1b2a:b0:a9d:e1d6:41fc with SMTP id
 a640c23a62f3a-aa48354d137mr846122666b.53.1731838479814; Sun, 17 Nov 2024
 02:14:39 -0800 (PST)
MIME-Version: 1.0
References: <20241116221757.3501603-1-manos.pitsidianakis@linaro.org>
In-Reply-To: <20241116221757.3501603-1-manos.pitsidianakis@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 17 Nov 2024 10:14:29 +0000
Message-ID: <CAFEAcA9m7EnMX+=T0TL2R_NCJqaPUPCUcoYzAo4P2oRUZbM6Kg@mail.gmail.com>
Subject: Re: [PATCH v2] rust/pl011: Fix DeviceID reads
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-rust@nongnu.org, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Gustavo Romero <gustavo.romero@linaro.org>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Pierrick Bouvier <pierrick.bouvier@linaro.org>, 
	Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: 27T1jKgGqoie

On Sat, 16 Nov 2024 at 22:18, Manos Pitsidianakis
<manos.pitsidianakis@linaro.org> wrote:
>
> DeviceId, which maps the peripheral and PCell registers of a PL011
> device, was not treating each register value as a 32 bit value.
>
> Change DeviceId enum to return register values via constified getter
> functions instead of leveraging the std::ops::Index<_> trait.
>
> While at it, print errors when guest attempts to write to other RO
> registers as well.
>
> Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>



>  rust/hw/char/pl011/src/device.rs | 93 ++++++++++++++++++++++++--------
>  rust/hw/char/pl011/src/lib.rs    | 22 +++++++-
>  2 files changed, 93 insertions(+), 22 deletions(-)
>
> diff --git a/rust/hw/char/pl011/src/device.rs b/rust/hw/char/pl011/src/device.rs
> index 2a85960b81..fc6f3f394d 100644
> --- a/rust/hw/char/pl011/src/device.rs
> +++ b/rust/hw/char/pl011/src/device.rs
> @@ -5,7 +5,7 @@
>  use core::ptr::{addr_of, addr_of_mut, NonNull};
>  use std::{
>      ffi::CStr,
> -    os::raw::{c_int, c_uchar, c_uint, c_void},
> +    os::raw::{c_int, c_uint, c_void},
>  };
>
>  use qemu_api::{
> @@ -32,6 +32,7 @@
>  /// QEMU sourced constant.
>  pub const PL011_FIFO_DEPTH: usize = 16_usize;
>
> +/// State enum that represents the values of the peripheral and PCell registers of a PL011 device.
>  #[derive(Clone, Copy, Debug)]
>  enum DeviceId {
>      #[allow(dead_code)]
> @@ -39,20 +40,55 @@ enum DeviceId {
>      Luminary,
>  }
>
> -impl std::ops::Index<hwaddr> for DeviceId {
> -    type Output = c_uchar;
> -
> -    fn index(&self, idx: hwaddr) -> &Self::Output {
> -        match self {
> -            Self::Arm => &Self::PL011_ID_ARM[idx as usize],
> -            Self::Luminary => &Self::PL011_ID_LUMINARY[idx as usize],
> -        }
> -    }
> -}
> -
>  impl DeviceId {
> -    const PL011_ID_ARM: [c_uchar; 8] = [0x11, 0x10, 0x14, 0x00, 0x0d, 0xf0, 0x05, 0xb1];
> -    const PL011_ID_LUMINARY: [c_uchar; 8] = [0x11, 0x00, 0x18, 0x01, 0x0d, 0xf0, 0x05, 0xb1];
> +    /// Value of `UARTPeriphID0` register, which contains the `PartNumber0` value.
> +    const fn uart_periph_id0(self) -> u64 {
> +        0x11
> +    }
> +
> +    /// Value of `UARTPeriphID1` register, which contains the `Designer0` and `PartNumber1` values.
> +    const fn uart_periph_id1(self) -> u64 {
> +        (match self {
> +            Self::Arm => 0x10,
> +            Self::Luminary => 0x00,
> +        }) as u64
> +    }
> +
> +    /// Value of `UARTPeriphID2` register, which contains the `Revision` and `Designer1` values.
> +    const fn uart_periph_id2(self) -> u64 {
> +        (match self {
> +            Self::Arm => 0x14,
> +            Self::Luminary => 0x18,
> +        }) as u64
> +    }
> +
> +    /// Value of `UARTPeriphID3` register, which contains the `Configuration` value.
> +    const fn uart_periph_id3(self) -> u64 {
> +        (match self {
> +            Self::Arm => 0x0,
> +            Self::Luminary => 0x1,
> +        }) as u64
> +    }
> +
> +    /// Value of `UARTPCellID0` register.
> +    const fn uart_pcell_id0(self) -> u64 {
> +        0x0d
> +    }
> +
> +    /// Value of `UARTPCellID1` register.
> +    const fn uart_pcell_id1(self) -> u64 {
> +        0xf0
> +    }
> +
> +    /// Value of `UARTPCellID2` register.
> +    const fn uart_pcell_id2(self) -> u64 {
> +        0x05
> +    }
> +
> +    /// Value of `UARTPCellID3` register.
> +    const fn uart_pcell_id3(self) -> u64 {
> +        0xb1
> +    }

This seems extremely verbose and rather obscures the fact that these
registers are a set of adjacent simple ID registers, compared to
the previous code which defined them as an array of values.

Isn't there some way to write this that doesn't need so much code to do it?
All the PLxxx devices and various others have this set of standard
ID registers, because it's part of a standardized scheme, so we're
going to end up with similar code in multiple device models. I would
hope that Rust offers us ways to avoid having boilerplate code
where you need to write dozens of lines to express this.

thanks
-- PMM

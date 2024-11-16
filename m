Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp1786241njc;
        Sat, 16 Nov 2024 13:49:29 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVloW40cCAPkizPwsCuYDl3du7R01zkt6MMBAlOGreUPnrqb+iJxaAlfHZtZGqukvxP7+z2sAJQQSWBFg==@linaro.org
X-Received: by 2002:a17:907:3e10:b0:a99:368d:dad3 with SMTP id a640c23a62f3a-aa483480c6cmr646400766b.30.1731793769534;
        Sat, 16 Nov 2024 13:49:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731793769; cv=none;
        d=google.com; s=arc-20240605;
        b=FT4BBTU9gIG64KFFHXe1RYIA82K+LG8c4QINvpyHKm5JahO2ahSf9fyoz4PigXDGpk
         AlG94DojFvduwiNYayJ7v5i2wZlg86EAdW0g38q9fCaSvXv7X5sjp0VTqx7GPOlqhJDy
         1YAjjyTT1oLFfFEeWvj+Nz++qFGQo/KGxxxXlMZw2zctSfKddrpP7V1KeH/xyRvlHW/l
         1aHDUMQyUbKYZ57UDEI6JuCMqT+lNhgapZuxknOJO5UIGmYOP/cumJdn8TAS+FZBYOLq
         VRzHMFJBvRhxcuvELGFNrU8OgmKy7g5lbUi1UaWYGFO3ZmP9Irx+Z0fgZUTswN52+KTH
         FuRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1F9zdRoKsUu5zPMH8J+dMjv84QztGXv+9RWvY9Lye2s=;
        fh=ZyjUWUBg3iW8mCuRWouDPxluX9H1O81bUJSvgxmfMes=;
        b=iDtHyzDQyfPiHCifbUdz++NfkVm/KGsk91tAMLACZ/A/Nu3pidfjTxr+uL4BVAmwQZ
         MPy0+Xu74/9+doB63U/hb4X7EPGdtCdOnUEquQYeE2b/BNbOE4/3RmbQ8utpuoHk+CWF
         kwfNCcd5E2yuB44JY+Tx5qEo/xANAzpAbprztUEunG5ipogNmKaJEj/X2Vkw0lJodxZb
         UiePQj/1xNvUvovsD5jfxQLjOs8P1sYgeAQJ5eClYety0E+EEddfKGhyHrDgVXaB0XbZ
         UXubCJ4OF5GKb+Od2GLyqTJcWYVxZPYUDS3U2HrvKkvFQQ1OCoKJdku8V3cIp5FDzqoC
         Q/Ug==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Bc6COsoh;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a640c23a62f3a-aa20df263edsor231550466b.2.2024.11.16.13.49.29
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 16 Nov 2024 13:49:29 -0800 (PST)
Received-SPF: pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Bc6COsoh;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731793769; x=1732398569; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1F9zdRoKsUu5zPMH8J+dMjv84QztGXv+9RWvY9Lye2s=;
        b=Bc6COsohgvll+kbBTofR2RM7mmg5exiCNxTMjgAUFv5EFi/SqycRf9J+ToVX9eTA9y
         KZEfAEEKkpcAqQ6jCqOTMRO69AHFa8qMmm8YpFYRL6J9dMJW9zzO9B5y0elSi49WczWZ
         dDaboqzXTqZb1dSXMmqQfyv/hEDGLFYF3EDrWMSojfs69N6sparz3JXcrWKQS3oZHSOa
         x1ixKTSsAbPFnIejc3j1LDQLPE/2x3nXa6HcbD7DgSHoiuSzFBXvqLUdn5uKNbIY2HWb
         2fdU5PkzL2zy7+NrFN/OZEVOFKy7oagXgB1WYqvPR3WXfppMvEn7WvZsYLPQxrKiR4nQ
         nqNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731793769; x=1732398569;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1F9zdRoKsUu5zPMH8J+dMjv84QztGXv+9RWvY9Lye2s=;
        b=ftEv/yafQZx1GiKXIdMdCA+14CokXSd5BwfLTspxXz93ipTgEaep5YS+mvJMcj6DKj
         0FGCiMNOm/dOJvSMajXPTFH3IgZCMu11yixkK0mbdMPcpdsS/cgmm1quUQYZZP9N2l27
         qt/cdcqUHF2uggpI1HqzjS3k5w2d254JgSWlgUu1zzmurLG+vwKfrMukVhe5OjVMx87H
         kuwDKpDAA8UWEeoGmlXF8ai8dJ03KBW+CywJUl7xn6DMWBikLRhlIHDcRKnAWaYj2hlI
         7rmomO+yaflgmNOe/9fFGCQofNRB7AJK98+xXr7H/VdzoJooALJg++2PWlvhFBtW7FLl
         9XnA==
X-Forwarded-Encrypted: i=1; AJvYcCW4f0PiM6k9dKZXJm5ZlUfhWK7JDHyhU5ItjAHdPB0V/+kzb2olUrTTtmAD3LMBDfw8aBP3jfAZ3fdyxQ==@linaro.org
X-Gm-Message-State: AOJu0YwSDZhbHJhvayaA4ApvL0E9NVpNxBn9JBQfSKstepJa6qbR+fkT
	xC/lMBMypBCB3rXEsU6OMrXJK+hbarvO8/iZdE6nru+ijdCff6z/WrZKAL21bCNefVu2Cq2YT4s
	1jlgZGvDpKhlz5bxIaeVWu8gyslXkFfw1eXzzft9TZWppXq6WPHcETA==
X-Google-Smtp-Source: AGHT+IGWpcdmm6OgXJahFIA8EpOPwogqZ0PduvIjW+BkVl7pq6Ur3ZXhnj2JOkaOiJYLxwQNW1DuYMZKYxYOzuy11Zk=
X-Received: by 2002:a17:906:1c0e:b0:aa4:9ab1:19d5 with SMTP id
 a640c23a62f3a-aa49ab11b5dmr212192866b.42.1731793768916; Sat, 16 Nov 2024
 13:49:28 -0800 (PST)
MIME-Version: 1.0
References: <20241116181549.3430225-1-manos.pitsidianakis@linaro.org> <7d835e14-c3d4-4aba-b4a9-eeb06f56fdde@redhat.com>
In-Reply-To: <7d835e14-c3d4-4aba-b4a9-eeb06f56fdde@redhat.com>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Sat, 16 Nov 2024 23:49:03 +0200
Message-ID: <CAAjaMXZxcT-+iJDpbSbFWuTF_Ci1iAgOUHLSbngR8rB9w2W5qQ@mail.gmail.com>
Subject: Re: [PATCH v1] rust/pl011: Fix DeviceID reads
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-rust@nongnu.org, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Gustavo Romero <gustavo.romero@linaro.org>, Peter Maydell <peter.maydell@linaro.org>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Pierrick Bouvier <pierrick.bouvier@linaro.org>, 
	Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 3Cm+1HgDwthP

On Sat, Nov 16, 2024 at 10:24=E2=80=AFPM Paolo Bonzini <pbonzini@redhat.com=
> wrote:
>
> On 11/16/24 19:15, Manos Pitsidianakis wrote:
> >   impl DeviceId {
> > -    const PL011_ID_ARM: [c_uchar; 8] =3D [0x11, 0x10, 0x14, 0x00, 0x0d=
, 0xf0, 0x05, 0xb1];
> > -    const PL011_ID_LUMINARY: [c_uchar; 8] =3D [0x11, 0x00, 0x18, 0x01,=
 0x0d, 0xf0, 0x05, 0xb1];
> > +    /// Value of `UARTPeriphID0` register, which contains the `PartNum=
ber0` value.
> > +    const fn uart_periph_id0(self) -> u64 {
> > +        0x11
> > +    }
> > +
> > +    /// Value of `UARTPeriphID1` register, which contains the `Designe=
r0` and `PartNumber1` values.
> > +    const fn uart_periph_id1(self) -> u64 {
> > +        (match self {
> > +            Self::Arm =3D> 0x10,
> > +            Self::Luminary =3D> 0x00,
> > +        }) as u64
> > +    }
> >
> > +
> > +    /// Value of `UARTPeriphID2` register, which contains the `Revisio=
n` and `Designer1` values.
> > +    const fn uart_periph_id2(self) -> u64 {
> > +        (match self {
> > +            Self::Arm =3D> 0x14,
> > +            Self::Luminary =3D> 0x18,
> > +        }) as u64
> > +    }
> > +
> > +    /// Value of `UARTPeriphID3` register, which contains the `Configu=
ration` value.
> > +    const fn uart_periph_id3(self) -> u64 {
> > +        (match self {
> > +            Self::Arm =3D> 0x0,
> > +            Self::Luminary =3D> 0x1,
> > +        }) as u64
> > +    }
>
> If I understand correctly, these are two reasons why you did not go with
> the simple adjustment to the Err(v) pattern:
>
> * the separate registers match the datasheet more
>
> * given the bug that you are fixing in the write function, you want to
> avoid duplicating "Err(v) if (0xfe0..=3D0xffc).contains(&v)" between read
> and write; instead, you rely on exhaustive enums for error checking.
>
> I wonder if we can keep these improvements while making the
> implementation a bit more concise...  The eight const getter functions
> are quite verbose, and having the device type match inside each function
> is repetitive and hard to verify.  Maybe something like
>
>      const UART_PCELL_ID: [u8; 4] =3D [0x0d, 0xf0, 0x05, 0xb1];
>      const ARM_UART_PERIPH_ID: [u8; 4] =3D [0x11, 0x10, 0x14, 0x00];
>      const LUMINARY_UART_PERIPH_ID: [u8; 4] =3D [0x11, 0x00, 0x18, 0x01];
>
>      /// Value of `UARTPeriphID0` through `UARTPeriphID3` registers
>      const fn uart_periph_id(&self, idx: usize) -> u8 {
>          match self {
>              Self::Arm =3D> ARM_UART_PERIPH_ID,
>              Self::Luminary =3D> LUMINARY_UART_PERIPH_ID,
>          }[idx]
>      }
>
>      /// Value of `UARTPCellID0` through `UARTPCellID3` registers
>      const fn uart_pcell_id(idx: usize) -> u8 {
>          Self::UART_PCELL_ID[idx]
>      }
>
> could be the best of both worlds?

Eh, there's no real reason to do that though. I prefer verbosity and
static checking with symbols rather than indexing; we're not writing C
here.

>
> >           match RegisterOffset::try_from(offset) {
> > +            Ok(PeriphID0) | Ok(PeriphID1) | Ok(PeriphID2) | Ok(PeriphI=
D3) | Ok(PCellID0)
> > +            | Ok(PCellID1) | Ok(PCellID2) | Ok(PCellID3) =3D> {
> > +                // Ignore writes to read-only registers.
> > +            }
>
> This is indeed an improvement over the patches that Junjie and I had
> sent, because the writes would have gone down the eprintln! path.

I will send a v2 to print them anyway as guest errors like Peter requested.

--=20
Manos Pitsidianakis
Emulation and Virtualization Engineer at Linaro Ltd

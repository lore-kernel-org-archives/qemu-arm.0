Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp1969839njc;
        Sun, 17 Nov 2024 02:04:04 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUi3GLz4QZHweWNIlhXmDKDacys1fmCXlyi9B6y+Ovh2jNZmpPczJnKOnpqM5jRMhMWTmJZyzfQAoJqyA==@linaro.org
X-Received: by 2002:a17:906:6a20:b0:a99:e4db:4909 with SMTP id a640c23a62f3a-aa48340fc2dmr875328166b.15.1731837843918;
        Sun, 17 Nov 2024 02:04:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731837843; cv=none;
        d=google.com; s=arc-20240605;
        b=iubFArhEyh2LAljxA5j++ANBMPsKG3aakvI5oKaCwGN5Qpgwd3Ldm/Ri/JfLWvHT6N
         QBK5+YWSk5YkK7NHulgusw4jPBDY9XVHvalGko+Im3Lv19fXOcTRaYYnoNFxREgjEX8Z
         PS+jKyWMC6wg1Qixl7T2Vvbt4uzqYhnqeNYN/AkulIncCnYXWhv3zhLKXfWuM43pQEOy
         zK9skwYfWYjxi/5hQ9Q45GRK5QOaNFeZI5viQ0hyTOE7oZPWGOixiXxYZfZJDvpmBdyH
         Xj3Rh9vMUFBKs0sSZi3lOfP33GVNHg63qh2H7YiIYq7v8pxN0Foe8bsMx3BfScoQqBGd
         LUbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2L58zJzLrmBSxgjVBQyhgv0wYDJTdgfsrTPcv1081sE=;
        fh=BzHXCVMYG7EBapNOVAoj/XeQAqoqwtez3ORR+lvxq8c=;
        b=OzdXYEMd7tJpUVHHMvpEHGBVJIld8DCfs6MXyKG0KN2bTstfuj4/lNa6hPcyFdOaPE
         c4f7Gmkb5y1YhLvIl0jKFMZKb7UKinLP7dKaFU/YklIhb5z22K3DeZLXB1wvotPTUS1c
         UvkhwWyksRgKW1+l35oyM/IiClaHLxIe2QazMAfV56JL57wXLux4U/9cK1r0CCSKxoqW
         OhHIPbNVSQwP8zFjCO8cRNghT5+kd+mG9ex3C0ytWhOi+Cu9rIVFGZz9VeDPCWV/qW80
         jHd6aBWU0nttrtMJ9mQGUBRi8J31RoZK3SWX3sZEbkfPbi2adubRe/JvRSVAqlpoJcpC
         VttA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oWTu3LOE;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a640c23a62f3a-aa20df7f7dcsor256903366b.11.2024.11.17.02.04.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 17 Nov 2024 02:04:03 -0800 (PST)
Received-SPF: pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oWTu3LOE;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731837843; x=1732442643; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2L58zJzLrmBSxgjVBQyhgv0wYDJTdgfsrTPcv1081sE=;
        b=oWTu3LOEvcyBZSCkLDt1ohFeCvPuCsCGafp+K35Pf5rDMz5jyJPThvtaGVmEVNyKIt
         DQYHSYOBBoS7SKj8vtuPyXF248YPL/2kdxGM7VeDMJ4J2YlSpkYVs0iEH13yMBweGevZ
         aVdI2jIO3dcWtlSrzfGujDVDLMEGCRd48owa2QhQnnf4p1hlN2JpKjRVyWbXKxOm8me+
         yxvWYmS7jAtZQBLh/xk1YLDzM5bc35+TE/MmBM+8BXaG/bpaexid5pA9Q5ocERsYdSWX
         1FduHPJz2TjnHATnDqWuXmedVvjEWcd1eanHxpmjyF1kMGNDO8y9i7UseCs6rlGCADeA
         MEHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731837843; x=1732442643;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2L58zJzLrmBSxgjVBQyhgv0wYDJTdgfsrTPcv1081sE=;
        b=LaZx3Xn3JK1RLoE37wxRBptYDV/VwySn46X3+rTh07v0MsQ2N4se4uBPQPLss45y3m
         Rt1D713fZ3OtFoZuKHaVSFBcldyPV0CXpGR/rn1KAwiLExd9xULcriqw64T2bG0GDkic
         VAjzVB19AflDPDdyS2vkNfNAakECJfLBFI1004ZleT3P2nLPjpZsGnrns07xbbEkZ09s
         1sJdIh2iZyml3dNPmBZIiYckK32+JpRNMV562QlA9+5HBvKOJtpH2tsWBmAi5+sfB5Ri
         b7109GZWkpfc2gGAzrg55pGVlupB1kdodwb0u/jSaJx8S08kfq1B2iwt1JcYym4KxQtU
         lM7w==
X-Forwarded-Encrypted: i=1; AJvYcCW837s+fqg2UfX9Gdce7IGz79zXxZz27Q8GEzFHyVybJICIGMyb81dKMty0tZKsT/cu8kH5ZzXaQO6/LA==@linaro.org
X-Gm-Message-State: AOJu0Yyj3XfzlYQfGc+p0m6xnFQaaBH+P61eWzoU6eB0cSUSH+Y3nWny
	cJ6PLrpY54NULOUhcRv5TzwgGIS8UBd59JbQ2bGsPQkd8Fo9bc0fkpbGdutZHmXhUHg6baq+IKk
	zJot3nRTDzomXJpNPgDMiJ6u+2LItZjwLDAuFHr4tA0ZKFzSSZG3pDg==
X-Google-Smtp-Source: AGHT+IH2wfXxpLdJxHRz9ANpN672+lNx3dMq5ieC+NJ0Zh4PRw9oxV5eUvoMuVAz1q9BRA+rrbEc70SiNSXw8/gWWSQ=
X-Received: by 2002:a17:906:dc8f:b0:a9a:3e33:8d9e with SMTP id
 a640c23a62f3a-aa48344ea5dmr708659066b.28.1731837843192; Sun, 17 Nov 2024
 02:04:03 -0800 (PST)
MIME-Version: 1.0
References: <20241116221757.3501603-1-manos.pitsidianakis@linaro.org> <CABgObfa8Qx7RzZK=VLFmsiEM=ExDb4T1WS4WzYc6D3ACuwc3fw@mail.gmail.com>
In-Reply-To: <CABgObfa8Qx7RzZK=VLFmsiEM=ExDb4T1WS4WzYc6D3ACuwc3fw@mail.gmail.com>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Sun, 17 Nov 2024 12:03:37 +0200
Message-ID: <CAAjaMXZ2GscKdUNrtP_YU0Lq49xzKmNCozYW-NMhBgw3eEmFYw@mail.gmail.com>
Subject: Re: [PATCH v2] rust/pl011: Fix DeviceID reads
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, qemu-rust@nongnu.org, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Gustavo Romero <gustavo.romero@linaro.org>, Peter Maydell <peter.maydell@linaro.org>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Pierrick Bouvier <pierrick.bouvier@linaro.org>, 
	Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: fFYSYGp2yxti

On Sun, Nov 17, 2024 at 9:40=E2=80=AFAM Paolo Bonzini <pbonzini@redhat.com>=
 wrote:
>
>
>
> Il sab 16 nov 2024, 23:18 Manos Pitsidianakis <manos.pitsidianakis@linaro=
.org> ha scritto:
>>
>> -    const PL011_ID_ARM: [c_uchar; 8] =3D [0x11, 0x10, 0x14, 0x00, 0x0d,=
 0xf0, 0x05, 0xb1];
>> -    const PL011_ID_LUMINARY: [c_uchar; 8] =3D [0x11, 0x00, 0x18, 0x01, =
0x0d, 0xf0, 0x05, 0xb1];
>> +    /// Value of `UARTPeriphID0` register, which contains the `PartNumb=
er0` value.
>> +    const fn uart_periph_id0(self) -> u64 {
>> +        0x11
>> +    }
>> +
>> +    /// Value of `UARTPeriphID1` register, which contains the `Designer=
0` and `PartNumber1` values.
>> +    const fn uart_periph_id1(self) -> u64 {
>> +        (match self {
>> +            Self::Arm =3D> 0x10,
>> +            Self::Luminary =3D> 0x00,
>> +        }) as u64
>> +    }
>> +
>> +    /// Value of `UARTPeriphID2` register, which contains the `Revision=
` and `Designer1` values.
>> +    const fn uart_periph_id2(self) -> u64 {
>> +        (match self {
>> +            Self::Arm =3D> 0x14,
>> +            Self::Luminary =3D> 0x18,
>> +        }) as u64
>> +    }
>> +
>> +    /// Value of `UARTPeriphID3` register, which contains the `Configur=
ation` value.
>> +    const fn uart_periph_id3(self) -> u64 {
>> +        (match self {
>> +            Self::Arm =3D> 0x0,
>> +            Self::Luminary =3D> 0x1,
>> +        }) as u64
>> +    }
>> +
>> +    /// Value of `UARTPCellID0` register.
>> +    const fn uart_pcell_id0(self) -> u64 {
>> +        0x0d
>> +    }
>> +
>> +    /// Value of `UARTPCellID1` register.
>> +    const fn uart_pcell_id1(self) -> u64 {
>> +        0xf0
>> +    }
>> +
>> +    /// Value of `UARTPCellID2` register.
>> +    const fn uart_pcell_id2(self) -> u64 {
>> +        0x05
>> +    }
>> +
>> +    /// Value of `UARTPCellID3` register.
>> +    const fn uart_pcell_id3(self) -> u64 {
>> +        0xb1
>> +    }
>>  }
>
>
> In your reply to V1 you wrote:
>
> > Eh, there's no real reason to do that though. I prefer verbosity and
> > static checking with symbols rather than indexing; we're not writing C
> > here.
>
> I don't see what C has to do with it. Of the three extant options for Dev=
iceId, you can write them in both C and Rust and they would look pretty muc=
h the same.
>
> I explained the real reason: it's much harder to verify/review the correc=
tness of independent functions instead of two arrays of four elements, beca=
use consecutive elements are four-five lines apart. There is also a lot mor=
e repetition in writing four match expressions instead of one.
>
> Given Peter's remark on rejecting writes, personally I see no reason to s=
witch away from Index; but I understand that you felt it was an important c=
hange, so I am trying very hard to find a middle ground that is more readab=
le than both the old code and your proposal here, and combines the advantag=
es of both. Please try to listen.

I very much prefer it this way; the only reason it was Index before
was because the DEVICE_ID arrays were lifted verbatim from C code. I
disagree that these are reasonable requests for code change, sorry.

>
>>          match RegisterOffset::try_from(offset) {
>> -            Err(_bad_offset) =3D> {
>> +            Err(_) =3D> {
>>                  eprintln!("write bad offset {offset} value {value}");
>>              }
>> +            Ok(
>> +                dev_id @ (PeriphID0 | PeriphID1 | PeriphID2 | PeriphID3=
 | PCellID0 | PCellID1
>> +                | PCellID2 | PCellID3),
>> +            ) =3D> {
>> +                eprintln!("write bad offset {offset} at RO register {de=
v_id:?} value {value}");
>> +            }
>>              Ok(FR) =3D> {
>> -                // flag writes are ignored
>> +                eprintln!("write bad offset {offset} at RO register UAR=
TFR value {value}");
>>              }
>> -            Ok(RIS) =3D> {}
>> -            Ok(MIS) =3D> {}
>> +            Ok(RIS) =3D> {
>> +                eprintln!("write bad offset {offset} at RO register UAR=
TRIS value {value}");
>> +            }
>> +            Ok(MIS) =3D> {
>> +                eprintln!("write bad offset {offset} at RO register UAR=
TMIS value {value}");
>> +            }
>
>
> Please use a single "dev_id @ (...)" pattern instead of duplicating code.
>
> Paolo
>
>>              Ok(ICR) =3D> {
>>                  self.int_level &=3D !value;
>>                  self.update();
>> diff --git a/rust/hw/char/pl011/src/lib.rs b/rust/hw/char/pl011/src/lib.=
rs
>> index cd0a49acb9..1f305aa13f 100644
>> --- a/rust/hw/char/pl011/src/lib.rs
>> +++ b/rust/hw/char/pl011/src/lib.rs
>> @@ -111,6 +111,22 @@ pub enum RegisterOffset {
>>      /// DMA control Register
>>      #[doc(alias =3D "UARTDMACR")]
>>      DMACR =3D 0x048,
>> +    #[doc(alias =3D "UARTPeriphID0")]
>> +    PeriphID0 =3D 0xFE0,
>> +    #[doc(alias =3D "UARTPeriphID1")]
>> +    PeriphID1 =3D 0xFE4,
>> +    #[doc(alias =3D "UARTPeriphID2")]
>> +    PeriphID2 =3D 0xFE8,
>> +    #[doc(alias =3D "UARTPeriphID3")]
>> +    PeriphID3 =3D 0xFEC,
>> +    #[doc(alias =3D "UARTPCellID0")]
>> +    PCellID0 =3D 0xFF0,
>> +    #[doc(alias =3D "UARTPCellID1")]
>> +    PCellID1 =3D 0xFF4,
>> +    #[doc(alias =3D "UARTPCellID2")]
>> +    PCellID2 =3D 0xFF8,
>> +    #[doc(alias =3D "UARTPCellID3")]
>> +    PCellID3 =3D 0xFFC,
>>      ///// Reserved, offsets `0x04C` to `0x07C`.
>>      //Reserved =3D 0x04C,
>>  }
>> @@ -137,7 +153,11 @@ const fn _assert_exhaustive(val: RegisterOffset) {
>>                  }
>>              }
>>          }
>> -        case! { DR, RSR, FR, FBRD, ILPR, IBRD, LCR_H, CR, FLS, IMSC, RI=
S, MIS, ICR, DMACR }
>> +        case! {
>> +            DR, RSR, FR, FBRD, ILPR, IBRD, LCR_H, CR, FLS, IMSC, RIS, M=
IS, ICR, DMACR,
>> +            PeriphID0, PeriphID1, PeriphID2, PeriphID3,
>> +            PCellID0, PCellID1, PCellID2, PCellID3,
>> +        }
>>      }
>>  }
>>
>>
>> base-commit: 43f2def68476697deb0d119cbae51b20019c6c86
>> --
>> =CE=B3=CE=B1=E1=BF=96=CE=B1 =CF=80=CF=85=CF=81=CE=AF =CE=BC=CE=B9=CF=87=
=CE=B8=CE=AE=CF=84=CF=89
>>
>>

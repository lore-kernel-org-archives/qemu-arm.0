Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp1929385njc;
        Sat, 16 Nov 2024 23:40:32 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXPD7HeIhbYAY41n1XZVE4lT8gYNpqRmXPd9LZbGPTlV7Xy64vhe4lJDtfEhAEy644yTTFjE2F8N80JfA==@linaro.org
X-Google-Smtp-Source: AGHT+IENrOid1bN8+qp8IqxyfoyNZlD4X/O05iq2ZEyH9imww5xybpjs+TZ2Bg8zIpM4cp81HNqN
X-Received: by 2002:a05:620a:2914:b0:7b1:7f5b:72c7 with SMTP id af79cd13be357-7b36229f115mr1384573885a.1.1731829231848;
        Sat, 16 Nov 2024 23:40:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731829231; cv=none;
        d=google.com; s=arc-20240605;
        b=S3eauPcuWiE07dU3ICsVlol6m6wThY4FClYPEoeo89uaernWmz7FkonCNwernQaLJ/
         kzBGJ8s+AuaH6pelzboj1Ovp7temZ/2+qWcHWYOu19/GocXM4p/nRVDl+c+SqayMPnBj
         3k5s7HScnIACxwlazh00VjYu9tUXi9fzbdNDscD1rrQQgAxym5/ijH/M2kEpfKBl15M1
         tBOMzRPquoavkhbwgKjDbWnBI+pn2YZMKcHQt/Pt14OLof9y7kok+SGmBvByQLZzxHC/
         wLgbAO/m6mBR2tLyEuiYglVo/m6Z7alZuna3bMI0uk+FCVwN7HnXNeZ+dFANfX+fCjVi
         SqHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=A47I1OwfzW9N5sRdtj6GdpVl3AjZq2JzQ8BrETv9PSc=;
        fh=400HrbT/5UBpM99aCkdSLWf9pIKSc1s0YX4nNVcKb2s=;
        b=kwwD0O8RfPy027oS9h1+PbAbm6WtZnXbt4gkJpZPyUNl2biENPfacEvu/WwNsC0zC8
         IJuwOrSif6zsLUOfQmr5D5z9HFT8YeERmLePK8/dsCreih+mc5oweVYRrE2vzUQhIuSq
         2yR7CZd6GFdRZ6LpW6rj8Lp1p3/g/+I7ABPo9AMw+lUZDyfLSRzEJnAXEhTH7SN1kkGt
         +F13S1sxLTOGrW/XGoj8DbyTk0bmGM9PaB3ibpOLhw6yvZBqiJwG+DvNR7ylx16YG13U
         n0i9uEqQBOyGZRX0I0L5XCRh5lesXHisTYkhUI2I2jtRSh3z2Vog4DGtHtyXNGYpIpwP
         ameg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DI25VNEK;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <pbonzini@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7b35ca93985si753936785a.428.2024.11.16.23.40.31
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Nov 2024 23:40:31 -0800 (PST)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DI25VNEK;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731829231;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=A47I1OwfzW9N5sRdtj6GdpVl3AjZq2JzQ8BrETv9PSc=;
	b=DI25VNEKgbYGhGOzzNi+DjzoET/a6YADsr+bzJ5wUWchdlOI79tx5UngIJVRQJGFJ3GFvu
	/r6DiitAVk9s0AdZbm5v5PKrdVUp625/uHAY9xc5eP3kAsvfrubef3Ut+KMMNP9CJK7WGM
	QhlMtsVUzL2GFLfQEa/nFmukPW+OVIw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-132-6vpHOD-fPJOrQFC9SOYrwA-1; Sun, 17 Nov 2024 02:40:27 -0500
X-MC-Unique: 6vpHOD-fPJOrQFC9SOYrwA-1
X-Mimecast-MFC-AGG-ID: 6vpHOD-fPJOrQFC9SOYrwA
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3824395a677so104583f8f.0
        for <alex.bennee@linaro.org>; Sat, 16 Nov 2024 23:40:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731829226; x=1732434026;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A47I1OwfzW9N5sRdtj6GdpVl3AjZq2JzQ8BrETv9PSc=;
        b=s0poWdr/Wqfyn0ytf4B2373WvcyvhqiuqbY97YaTzxv7dyYSkiktBZi8c2F2XB19ay
         3bKtC3gshZyFKeC1HVcxy5T8xH/zh35dt4PS1FnDOiW3+5eW9lGLWwm4QTo4g76cLi49
         2EEpLGhJykS9GkxMjPd0n9ZUrlDQ6IL+ROxA6SGDeFsxipIx89TTnCAerZ0f3Fv4uCIG
         h8T5jOESaGI/Xa9CtsyS0YQN+AupLlvWxR4FvTXq3rneWpsAJDTZVJyLGAgfiRPn5sZp
         oOz4MuAh3RjyeVF30SPLCksrLEEi7JTqwsS5GLCQ1Ew2YwWOsnbWql8MfXYK7JNFXQIJ
         XZnA==
X-Forwarded-Encrypted: i=1; AJvYcCV7eUxs0mTaR2fyRfMhC7FHcHfmS0cRQ9j7zg/HqR98AshLn3a1ZrKHINumaF8LrZfvXhpEcSBrc1kl7A==@linaro.org
X-Gm-Message-State: AOJu0Yx9w2LyYAqLIi2j6vC459eLmQ2Z8F8gwzTiHP/pwJez8cgOI+WF
	/yeMbjFVyiNrgGjJoWmW5P0IVxNNgQqkzZXoRi7DHfAnOzoQ48ypbiw/zrZ4677oVlu4pBds0Tz
	Oi4ADR1NPqgihADQCclMr6N490wx6L/RyM5ze3+1WQZLl6TmoQgltKBUzwRDxbKfI8o9PlbJle7
	dQWBwXkAoSwlNJj1WGqaJvkugqkWdE
X-Received: by 2002:a5d:6d82:0:b0:37d:51b9:7f3b with SMTP id ffacd0b85a97d-3822590b6e9mr6977899f8f.11.1731829226626;
        Sat, 16 Nov 2024 23:40:26 -0800 (PST)
X-Received: by 2002:a5d:6d82:0:b0:37d:51b9:7f3b with SMTP id
 ffacd0b85a97d-3822590b6e9mr6977875f8f.11.1731829226254; Sat, 16 Nov 2024
 23:40:26 -0800 (PST)
MIME-Version: 1.0
References: <20241116221757.3501603-1-manos.pitsidianakis@linaro.org>
In-Reply-To: <20241116221757.3501603-1-manos.pitsidianakis@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Sun, 17 Nov 2024 08:40:00 +0100
Message-ID: <CABgObfa8Qx7RzZK=VLFmsiEM=ExDb4T1WS4WzYc6D3ACuwc3fw@mail.gmail.com>
Subject: Re: [PATCH v2] rust/pl011: Fix DeviceID reads
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: qemu-devel <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, qemu-rust@nongnu.org, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Gustavo Romero <gustavo.romero@linaro.org>, Peter Maydell <peter.maydell@linaro.org>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Pierrick Bouvier <pierrick.bouvier@linaro.org>, 
	Richard Henderson <richard.henderson@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Kx9y4aVGGQFuRF6lPvnAYYrnzT_INWFUQ0WhubYa_fQ_1731829227
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000d7cfd2062716e90b"
X-TUID: FTcOCGxFNutP

--000000000000d7cfd2062716e90b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Il sab 16 nov 2024, 23:18 Manos Pitsidianakis <
manos.pitsidianakis@linaro.org> ha scritto:

> -    const PL011_ID_ARM: [c_uchar; 8] =3D [0x11, 0x10, 0x14, 0x00, 0x0d,
> 0xf0, 0x05, 0xb1];
> -    const PL011_ID_LUMINARY: [c_uchar; 8] =3D [0x11, 0x00, 0x18, 0x01,
> 0x0d, 0xf0, 0x05, 0xb1];
> +    /// Value of `UARTPeriphID0` register, which contains the
> `PartNumber0` value.
> +    const fn uart_periph_id0(self) -> u64 {
> +        0x11
> +    }
> +
> +    /// Value of `UARTPeriphID1` register, which contains the `Designer0=
`
> and `PartNumber1` values.
> +    const fn uart_periph_id1(self) -> u64 {
> +        (match self {
> +            Self::Arm =3D> 0x10,
> +            Self::Luminary =3D> 0x00,
> +        }) as u64
> +    }
> +
> +    /// Value of `UARTPeriphID2` register, which contains the `Revision`
> and `Designer1` values.
> +    const fn uart_periph_id2(self) -> u64 {
> +        (match self {
> +            Self::Arm =3D> 0x14,
> +            Self::Luminary =3D> 0x18,
> +        }) as u64
> +    }
> +
> +    /// Value of `UARTPeriphID3` register, which contains the
> `Configuration` value.
> +    const fn uart_periph_id3(self) -> u64 {
> +        (match self {
> +            Self::Arm =3D> 0x0,
> +            Self::Luminary =3D> 0x1,
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
>  }
>

In your reply to V1 you wrote:

> Eh, there's no real reason to do that though. I prefer verbosity and
> static checking with symbols rather than indexing; we're not writing C
> here.

I don't see what C has to do with it. Of the three extant options for
DeviceId, you can write them in both C and Rust and they would look pretty
much the same.

I explained the real reason: it's much harder to verify/review the
correctness of independent functions instead of two arrays of four
elements, because consecutive elements are four-five lines apart. There is
also a lot more repetition in writing four match expressions instead of one=
.

Given Peter's remark on rejecting writes, personally I see no reason to
switch away from Index; but I understand that you felt it was an important
change, so I am trying very hard to find a middle ground that is more
readable than both the old code and your proposal here, and combines the
advantages of both. Please try to listen.

         match RegisterOffset::try_from(offset) {
> -            Err(_bad_offset) =3D> {
> +            Err(_) =3D> {
>                  eprintln!("write bad offset {offset} value {value}");
>              }
> +            Ok(
> +                dev_id @ (PeriphID0 | PeriphID1 | PeriphID2 | PeriphID3 =
|
> PCellID0 | PCellID1
> +                | PCellID2 | PCellID3),
> +            ) =3D> {
> +                eprintln!("write bad offset {offset} at RO register
> {dev_id:?} value {value}");
> +            }
>              Ok(FR) =3D> {
> -                // flag writes are ignored
> +                eprintln!("write bad offset {offset} at RO register
> UARTFR value {value}");
>              }
> -            Ok(RIS) =3D> {}
> -            Ok(MIS) =3D> {}
> +            Ok(RIS) =3D> {
> +                eprintln!("write bad offset {offset} at RO register
> UARTRIS value {value}");
> +            }
> +            Ok(MIS) =3D> {
> +                eprintln!("write bad offset {offset} at RO register
> UARTMIS value {value}");
> +            }
>

Please use a single "dev_id @ (...)" pattern instead of duplicating code.

Paolo

             Ok(ICR) =3D> {
>                  self.int_level &=3D !value;
>                  self.update();
> diff --git a/rust/hw/char/pl011/src/lib.rs b/rust/hw/char/pl011/src/lib.r=
s
> index cd0a49acb9..1f305aa13f 100644
> --- a/rust/hw/char/pl011/src/lib.rs
> +++ b/rust/hw/char/pl011/src/lib.rs
> @@ -111,6 +111,22 @@ pub enum RegisterOffset {
>      /// DMA control Register
>      #[doc(alias =3D "UARTDMACR")]
>      DMACR =3D 0x048,
> +    #[doc(alias =3D "UARTPeriphID0")]
> +    PeriphID0 =3D 0xFE0,
> +    #[doc(alias =3D "UARTPeriphID1")]
> +    PeriphID1 =3D 0xFE4,
> +    #[doc(alias =3D "UARTPeriphID2")]
> +    PeriphID2 =3D 0xFE8,
> +    #[doc(alias =3D "UARTPeriphID3")]
> +    PeriphID3 =3D 0xFEC,
> +    #[doc(alias =3D "UARTPCellID0")]
> +    PCellID0 =3D 0xFF0,
> +    #[doc(alias =3D "UARTPCellID1")]
> +    PCellID1 =3D 0xFF4,
> +    #[doc(alias =3D "UARTPCellID2")]
> +    PCellID2 =3D 0xFF8,
> +    #[doc(alias =3D "UARTPCellID3")]
> +    PCellID3 =3D 0xFFC,
>      ///// Reserved, offsets `0x04C` to `0x07C`.
>      //Reserved =3D 0x04C,
>  }
> @@ -137,7 +153,11 @@ const fn _assert_exhaustive(val: RegisterOffset) {
>                  }
>              }
>          }
> -        case! { DR, RSR, FR, FBRD, ILPR, IBRD, LCR_H, CR, FLS, IMSC, RIS=
,
> MIS, ICR, DMACR }
> +        case! {
> +            DR, RSR, FR, FBRD, ILPR, IBRD, LCR_H, CR, FLS, IMSC, RIS,
> MIS, ICR, DMACR,
> +            PeriphID0, PeriphID1, PeriphID2, PeriphID3,
> +            PCellID0, PCellID1, PCellID2, PCellID3,
> +        }
>      }
>  }
>
>
> base-commit: 43f2def68476697deb0d119cbae51b20019c6c86
> --
> =CE=B3=CE=B1=E1=BF=96=CE=B1 =CF=80=CF=85=CF=81=CE=AF =CE=BC=CE=B9=CF=87=
=CE=B8=CE=AE=CF=84=CF=89
>
>
>

--000000000000d7cfd2062716e90b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il sab 16 nov 2024, 23:18 Manos Pitsidianakis &lt;<a h=
ref=3D"mailto:manos.pitsidianakis@linaro.org">manos.pitsidianakis@linaro.or=
g</a>&gt; ha scritto:</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">-=C2=A0 =C2=A0 const PL011_ID_ARM: [c_uchar; 8] =3D [0x11, 0x10, 0x14, 0x=
00, 0x0d, 0xf0, 0x05, 0xb1];<br>
-=C2=A0 =C2=A0 const PL011_ID_LUMINARY: [c_uchar; 8] =3D [0x11, 0x00, 0x18,=
 0x01, 0x0d, 0xf0, 0x05, 0xb1];<br>
+=C2=A0 =C2=A0 /// Value of `UARTPeriphID0` register, which contains the `P=
artNumber0` value.<br>
+=C2=A0 =C2=A0 const fn uart_periph_id0(self) -&gt; u64 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x11<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /// Value of `UARTPeriphID1` register, which contains the `D=
esigner0` and `PartNumber1` values.<br>
+=C2=A0 =C2=A0 const fn uart_periph_id1(self) -&gt; u64 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (match self {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Self::Arm =3D&gt; 0x10,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Self::Luminary =3D&gt; 0x00,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }) as u64<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /// Value of `UARTPeriphID2` register, which contains the `R=
evision` and `Designer1` values.<br>
+=C2=A0 =C2=A0 const fn uart_periph_id2(self) -&gt; u64 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (match self {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Self::Arm =3D&gt; 0x14,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Self::Luminary =3D&gt; 0x18,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }) as u64<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /// Value of `UARTPeriphID3` register, which contains the `C=
onfiguration` value.<br>
+=C2=A0 =C2=A0 const fn uart_periph_id3(self) -&gt; u64 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (match self {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Self::Arm =3D&gt; 0x0,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Self::Luminary =3D&gt; 0x1,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }) as u64<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /// Value of `UARTPCellID0` register.<br>
+=C2=A0 =C2=A0 const fn uart_pcell_id0(self) -&gt; u64 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x0d<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /// Value of `UARTPCellID1` register.<br>
+=C2=A0 =C2=A0 const fn uart_pcell_id1(self) -&gt; u64 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 0xf0<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /// Value of `UARTPCellID2` register.<br>
+=C2=A0 =C2=A0 const fn uart_pcell_id2(self) -&gt; u64 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x05<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /// Value of `UARTPCellID3` register.<br>
+=C2=A0 =C2=A0 const fn uart_pcell_id3(self) -&gt; u64 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 0xb1<br>
+=C2=A0 =C2=A0 }<br>
=C2=A0}<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D=
"auto">In your reply to V1 you wrote:</div><div dir=3D"auto"><br></div><div=
 dir=3D"auto">&gt; Eh, there&#39;s no real reason to do that though. I pref=
er verbosity and</div><div dir=3D"auto">&gt; static checking with symbols r=
ather than indexing; we&#39;re not writing C</div><div dir=3D"auto">&gt; he=
re.</div><div dir=3D"auto"><br></div><div dir=3D"auto">I don&#39;t see what=
 C has to do with it. Of the three extant options for DeviceId, you can wri=
te them in both C and Rust and they would look pretty much the same.</div><=
div dir=3D"auto"><br></div><div dir=3D"auto">I explained the real reason: i=
t&#39;s much harder to verify/review the correctness of independent functio=
ns instead of two arrays of four elements, because consecutive elements are=
 four-five lines apart. There is also a lot more repetition in writing four=
 match expressions instead of one.</div><div dir=3D"auto"><br></div><div di=
r=3D"auto">Given Peter&#39;s remark on rejecting writes, personally I see n=
o reason to switch away from Index; but I understand that you felt it was a=
n important change, so I am trying very hard to find a middle ground that i=
s more readable than both the old code and your proposal here, and combines=
 the advantages of both. Please try to listen.</div><div dir=3D"auto"><br><=
/div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0match RegisterOf=
fset::try_from(offset) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Err(_bad_offset) =3D&gt; {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Err(_) =3D&gt; {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0eprintln!(&qu=
ot;write bad offset {offset} value {value}&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Ok(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_id @ (PeriphID=
0 | PeriphID1 | PeriphID2 | PeriphID3 | PCellID0 | PCellID1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | PCellID2 | PCell=
ID3),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ) =3D&gt; {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 eprintln!(&quot;wr=
ite bad offset {offset} at RO register {dev_id:?} value {value}&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }=C2=A0<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Ok(FR) =3D&gt; {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // flag writes are=
 ignored<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 eprintln!(&quot;wr=
ite bad offset {offset} at RO register UARTFR value {value}&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}=C2=A0<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Ok(RIS) =3D&gt; {}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Ok(MIS) =3D&gt; {}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Ok(RIS) =3D&gt; {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 eprintln!(&quot;wr=
ite bad offset {offset} at RO register UARTRIS value {value}&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Ok(MIS) =3D&gt; {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 eprintln!(&quot;wr=
ite bad offset {offset} at RO register UARTMIS value {value}&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br></blockquote></div></div><d=
iv dir=3D"auto"><br></div><div dir=3D"auto">Please use a single &quot;dev_i=
d @ (...)&quot; pattern instead of duplicating code.</div><div dir=3D"auto"=
><br></div><div dir=3D"auto">Paolo</div><div dir=3D"auto"><br></div><div di=
r=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Ok(ICR) =3D&gt; {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.int_leve=
l &amp;=3D !value;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.update()=
;<br>
diff --git a/rust/hw/char/pl011/src/<a href=3D"http://lib.rs" rel=3D"norefe=
rrer noreferrer" target=3D"_blank">lib.rs</a> b/rust/hw/char/pl011/src/<a h=
ref=3D"http://lib.rs" rel=3D"noreferrer noreferrer" target=3D"_blank">lib.r=
s</a><br>
index cd0a49acb9..1f305aa13f 100644<br>
--- a/rust/hw/char/pl011/src/<a href=3D"http://lib.rs" rel=3D"noreferrer no=
referrer" target=3D"_blank">lib.rs</a><br>
+++ b/rust/hw/char/pl011/src/<a href=3D"http://lib.rs" rel=3D"noreferrer no=
referrer" target=3D"_blank">lib.rs</a><br>
@@ -111,6 +111,22 @@ pub enum RegisterOffset {<br>
=C2=A0 =C2=A0 =C2=A0/// DMA control Register<br>
=C2=A0 =C2=A0 =C2=A0#[doc(alias =3D &quot;UARTDMACR&quot;)]<br>
=C2=A0 =C2=A0 =C2=A0DMACR =3D 0x048,<br>
+=C2=A0 =C2=A0 #[doc(alias =3D &quot;UARTPeriphID0&quot;)]<br>
+=C2=A0 =C2=A0 PeriphID0 =3D 0xFE0,<br>
+=C2=A0 =C2=A0 #[doc(alias =3D &quot;UARTPeriphID1&quot;)]<br>
+=C2=A0 =C2=A0 PeriphID1 =3D 0xFE4,<br>
+=C2=A0 =C2=A0 #[doc(alias =3D &quot;UARTPeriphID2&quot;)]<br>
+=C2=A0 =C2=A0 PeriphID2 =3D 0xFE8,<br>
+=C2=A0 =C2=A0 #[doc(alias =3D &quot;UARTPeriphID3&quot;)]<br>
+=C2=A0 =C2=A0 PeriphID3 =3D 0xFEC,<br>
+=C2=A0 =C2=A0 #[doc(alias =3D &quot;UARTPCellID0&quot;)]<br>
+=C2=A0 =C2=A0 PCellID0 =3D 0xFF0,<br>
+=C2=A0 =C2=A0 #[doc(alias =3D &quot;UARTPCellID1&quot;)]<br>
+=C2=A0 =C2=A0 PCellID1 =3D 0xFF4,<br>
+=C2=A0 =C2=A0 #[doc(alias =3D &quot;UARTPCellID2&quot;)]<br>
+=C2=A0 =C2=A0 PCellID2 =3D 0xFF8,<br>
+=C2=A0 =C2=A0 #[doc(alias =3D &quot;UARTPCellID3&quot;)]<br>
+=C2=A0 =C2=A0 PCellID3 =3D 0xFFC,<br>
=C2=A0 =C2=A0 =C2=A0///// Reserved, offsets `0x04C` to `0x07C`.<br>
=C2=A0 =C2=A0 =C2=A0//Reserved =3D 0x04C,<br>
=C2=A0}<br>
@@ -137,7 +153,11 @@ const fn _assert_exhaustive(val: RegisterOffset) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case! { DR, RSR, FR, FBRD, ILPR, IBRD, LCR_H, =
CR, FLS, IMSC, RIS, MIS, ICR, DMACR }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case! {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DR, RSR, FR, FBRD, ILPR, IBRD, L=
CR_H, CR, FLS, IMSC, RIS, MIS, ICR, DMACR,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PeriphID0, PeriphID1, PeriphID2,=
 PeriphID3,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PCellID0, PCellID1, PCellID2, PC=
ellID3,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
<br>
base-commit: 43f2def68476697deb0d119cbae51b20019c6c86<br>
-- <br>
=CE=B3=CE=B1=E1=BF=96=CE=B1 =CF=80=CF=85=CF=81=CE=AF =CE=BC=CE=B9=CF=87=CE=
=B8=CE=AE=CF=84=CF=89<br>
<br>
<br>
</blockquote></div></div></div>

--000000000000d7cfd2062716e90b--

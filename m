Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp2108471njc;
        Sun, 17 Nov 2024 07:46:05 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXHm1wmXDhHShpVU1xbk8QqaP+r1UhjJkv0t711lXLHZP8o9nLAhLQ2xf7xAhtSSgmekwx8cP09FH73rg==@linaro.org
X-Received: by 2002:a17:907:9621:b0:a99:4780:1af with SMTP id a640c23a62f3a-aa483482425mr759797566b.31.1731858365639;
        Sun, 17 Nov 2024 07:46:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731858365; cv=none;
        d=google.com; s=arc-20240605;
        b=HTeur1uerfgGa4+VLdgepmqINYz3K/Fv+jCPevfYd0UVR1cKkgthIvgEhMZRnxdtDW
         KLm35WqlwegW+TmHvqpRBKVSL1A/iqh/ij3MzBMbKjY1pbTnbGBTWYRoOJFN2RsKwnj6
         +y0leeknBUC7rZqNYlp+22TSLwTRHBFsoz2dv4Ghc5rnM3gVpVJ0IGUMaWfWdzGngSIt
         +69EmfsGQhntbUQQ+z020ev2FhJCYdOMuxiSDxTc9mBw+fNFk3y/MtL6NpwV1WH2/Vz9
         qkf3b9PvWeO3Mn4JptixbWANyPln3ekiUjubmKf8ejIt9yJfWzLIO1UeC9WuG5B96SxN
         bzmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Qt/fMxc6dzaFHqdOGIprWloj5gANdSerbQx5+PbZzHo=;
        fh=zeYLjf/88MdPR1m5lw+Z5rGKvTl5bs4DDKxjPvAfeyk=;
        b=HRqKd4OnEkeSqhPTAZX1JV/ItYlk1jDEawk/deSDoQIkIMTqN88cnsuUO8iTcx9Ofw
         Mcm/0lxL4dImRXJcrlJFrJ8MWObgH73DXm1+Xv/FozXXCmiHxoNBg/3JTahLB8YoFjx4
         G8zR38pHKC7XRVVHgflTLNER6gXezRk2KxQ8LpjcFlPjJEuIFzkb/dk1zbcbbpZH2P4Y
         BZ/4esAYsPgCO71/ChJVMxC33n1MH1dkIdaQ4LZdMQrNldwoCNn03BSrGqRcMZe7K/R+
         aDgEGWE0/A7imhrGztsE4vtF7a1VQoxJzD9JocysL56aKz1UcUtVq7EvsguMJoiUhe/r
         Fdbg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Yb3hYDPL;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a640c23a62f3a-aa20dfefd8bsor297091866b.13.2024.11.17.07.46.05
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 17 Nov 2024 07:46:05 -0800 (PST)
Received-SPF: pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Yb3hYDPL;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731858365; x=1732463165; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qt/fMxc6dzaFHqdOGIprWloj5gANdSerbQx5+PbZzHo=;
        b=Yb3hYDPL5TBmGZ+pO5PUS8X9i8ypw7yc0em24ZYJkfYL2Upvrl3PE7uxtvR5ommuIP
         TVUJOmaXh8eOwG8qmKupxbqLCO1mMjOdQgk1NG11u2QZRPWpeALwRdRXUQ2/zrc2elcI
         UHcJw6xb+eh6X1BdciIeUMqtbUYMZvxVcMqG+8yEo2SPWUn5gnZ3wjc4V8oOxK7UA/0G
         9iN583EnrqgWSnL4MG4NZtH+48VLjO6ynBTgF8IAchLsBTm21xv10r05/At/6g5XCUB3
         70znGz+Mf4fLLMyq7HW2gKHcjSf1x3FY7qH2jgQ4FWBGBW/7JkrxrrSCdzgv5SaxPasm
         6JYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731858365; x=1732463165;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qt/fMxc6dzaFHqdOGIprWloj5gANdSerbQx5+PbZzHo=;
        b=csUXkvhiqi+D1XdY+2DdEEPy7SMI6NTW6+hTio0GwlZgrfbkCaAdHN/l95mbKVATw3
         LN15CQjnRPe14f+OsDFqHPi9npndSe/pnLVRKKP0E38rS8DzSBPG4WcZ0gB8sd7rV2IC
         BCeBLGqTknoUs+/FnFuOLzdSfKpe4014Si5fcoKub6XEXKiMQaziQ8bgoUhTaIYDXwKC
         NFcAg4VC7SpbaH12c/pYtqKwp+VNkkx0a+qAgdTNXrmy49Rk4qheuT5CeJs6GmaAUsAj
         5JCgJjG7fs+zZ1JSyxyCOJ27Vp1wunFnV1tXpkHHIvQMcJcB5yTDoeeGQNaZfSb1GHjV
         1cRw==
X-Forwarded-Encrypted: i=1; AJvYcCWv4MqKdYVSIxXGSBkicgfHBnc4+UtHNu0g/Cq+E+MtFpXqvwrlD1MiDmjQ04pymJ943rJ5JWB/w37Ing==@linaro.org
X-Gm-Message-State: AOJu0Yw2yEH692/asMlTLrFiIEbeiM7MyWvW/uf2Ghbm8wDH2U4WCCD0
	pl08ItWBGFrGbO0qdH744hAQoTrYIxaHqeAapBoCr4nEOLJjmXoxygR/33YhjXhKhgRotRZFa4n
	gH/QtVymxKe8FKg131d/nTXQbxPxS+7JnSAbguRpZ
X-Google-Smtp-Source: AGHT+IE7UgFA1Lg9VieAvw9s0U+CVancl2jMf6S+VYWksBOKQIFdFI3OtC+3WKyAe0+BpsY5dkVzUJmYp2EC945omZM=
X-Received: by 2002:a17:907:608a:b0:a9e:c947:8c5e with SMTP id
 a640c23a62f3a-aa483552958mr901831466b.57.1731858364956; Sun, 17 Nov 2024
 07:46:04 -0800 (PST)
MIME-Version: 1.0
References: <20241116221757.3501603-1-manos.pitsidianakis@linaro.org>
 <CAFEAcA9m7EnMX+=T0TL2R_NCJqaPUPCUcoYzAo4P2oRUZbM6Kg@mail.gmail.com>
 <CAAjaMXZE+KKJnvcMpmpaH+dmO7MQVmJm7pD+i1yo_5Wb9-ERcQ@mail.gmail.com> <CABgObfadfaohQNf5AheVAUSL5G8i9+zeTOwXRPhOwC_6NpTvmQ@mail.gmail.com>
In-Reply-To: <CABgObfadfaohQNf5AheVAUSL5G8i9+zeTOwXRPhOwC_6NpTvmQ@mail.gmail.com>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Sun, 17 Nov 2024 17:45:39 +0200
Message-ID: <CAAjaMXZboQ-4yxtUVtTWsweT0QXfS4FT5JgLMMr-2XjZ9uBWvw@mail.gmail.com>
Subject: Re: [PATCH v2] rust/pl011: Fix DeviceID reads
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, 
	"open list:ARM SMMU <qemu-arm@nongnu.org>," <qemu-devel@nongnu.org>, "open list:ARM SMMU" <qemu-arm@nongnu.org>, qemu-rust@nongnu.org, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Gustavo Romero <gustavo.romero@linaro.org>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Pierrick Bouvier <pierrick.bouvier@linaro.org>, 
	Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: wxMuDg5yYlYb

On Sun, Nov 17, 2024 at 1:16=E2=80=AFPM Paolo Bonzini <pbonzini@redhat.com>=
 wrote:
>
>
>
> Il dom 17 nov 2024, 11:21 Manos Pitsidianakis <manos.pitsidianakis@linaro=
.org> ha scritto:
>>>
>>> This seems extremely verbose and rather obscures the fact that these
>>> registers are a set of adjacent simple ID registers, compared to
>>> the previous code which defined them as an array of values.
>>
>>
>> One could abstract them with declarative macros to reduce the line count=
. WDYT about that approach?
>
>
> No, this is just overcomplicating things. Like Peter said, just use array=
s. Copying from the V1 review for reference:
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
> Paolo


Nope, it's not overcomplicating things. `idx` is usize where we have
just 4 registers.

I will submit a new version

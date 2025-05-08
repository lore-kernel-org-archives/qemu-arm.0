Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp320092njb;
        Thu, 8 May 2025 03:33:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUb+2IliO9+kKq5Yigw4h6ov5Okix5dhRTi4AfUANg2cHtCed8c/am+Yd0ayy7b9WZmWK18AIMOBt3eGQ==@linaro.org
X-Received: by 2002:a05:690c:46c9:b0:709:1529:c22a with SMTP id 00721157ae682-70a2ce86562mr40644347b3.3.1746700385061;
        Thu, 08 May 2025 03:33:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746700385; cv=none;
        d=google.com; s=arc-20240605;
        b=ZN+hvxsc8Jz1BBhEhlQKQK/oq7nLT9UaWVlD/zb5nYyqFLGPKSJE0UA2W6LsI68zJp
         uiXUPg65FT6A3Q/4OD3tuztQyNVx/Yoe3tq3Nfrr+kZJpd1gSIZ3RRepR/9PLmkOCJ7p
         Gbmc2TeB4ZuMdhqghI+wXq+aYA4XC0aEAc3b2nAO42Ye7quQ5Vw0vLUdBiXe+Xx1S1ht
         2z4n+9B8RwDOmb+mjJtnrtiCRdfxEL+7T9JB9aGxSnMQYXQKL5bioF8GuB9OTrS75yH3
         /m0zxZUeVnV1dohfT99QfYN1fhnxZxBMLxVHJbOvM6gw0tAzYuza/qYfp/GMyBLqY3Gg
         JFdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KMtOUDyAwjpqecoun8+xjSclmRlj4tmUuc9dTCbiEV8=;
        fh=U6rZx0jQJcGDFmz53xeYSivxwPXT/2Lrehskd3PIzcg=;
        b=eMpTLEacWFpS2VtN190Ykpt0emTU+PcUtjzN+mqNeBwPHjygiYXgy6QxPEpG7KhQVy
         GJO0Tp1TDaDf2MZLfFsjHksWhxVHQvE6fVZXdXkdyN6rFE/cCz273uHRs7+/WVGhxnA8
         ZsQCVuJNzGL7vNigFkglL/EtvZxUkmJ2D0glmtCd231RLqCXOw8wWPtgHhvY5YB//fYR
         jM1B6tAnazMgZGc5dPZ6YW4Epk+6nRtaWQBfMHh13++bJVBlte/WED4lQ5XsR+PIrdI/
         ePppvo1rN31CW1SUmPIV2Q3B5EevnE2dpHtICSjt8esyA9YuYtOuPrshC3/PyAhiYqBV
         8xdQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fTZCSbEb;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 00721157ae682-70a21de5248sor21319017b3.4.2025.05.08.03.33.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 08 May 2025 03:33:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fTZCSbEb;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746700384; x=1747305184; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KMtOUDyAwjpqecoun8+xjSclmRlj4tmUuc9dTCbiEV8=;
        b=fTZCSbEbw7xgfv7PY/Eta5uIcc3pDd7sg+dLOmDQatZGQUynqnCcziOn6tLBZFU291
         KOJhbHP8tjlA74CGRVv/h8w1H0SvJG20MLh5SSKjq+13IqD8KTbrUVqqNervtlqL7iXY
         73WyxPy+Djl50rMYScfi4K6vc6H1gwLC2TxhPX+65E7T8th2xXqgPFn+bOdaUPlJ/Qyo
         C/JBn4/glgkHZ5uI2RIXTIaDxE8hHhB6vCrHbc/Rz3WaOTFD/c5R69zF0BSi9n/rT1MC
         azTX/UBoXDuVzg76S1u6L/LF9S724j0z863T1b3GZcxP0mX+08/kFw0GHZh95OiPCUF1
         o3lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746700384; x=1747305184;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KMtOUDyAwjpqecoun8+xjSclmRlj4tmUuc9dTCbiEV8=;
        b=Pfsz1sL49LxRe3Nd9XgzCyPVOLrY15sMkYKSlFxUCofF1T03oWacDvY2x0eh6J5NIX
         tcAwptgSXPbcaeSDEmu13SGAOILqj3OHYUAr5RvxgdfzRux0P3FTMOcSekznSSiDURzn
         RP6plT6RzpZv/3KaQIdCPO7ooBOkBglxospcNHKTs1Fcgr14I2sSA9MM63ldCfNykbPP
         Ss6/zkRwgHk5XCgjzGUSC7z4k2pFnJzctB+ExxNSkC2xpdwoCUbUUsRzngiaZ/DY8MgD
         inOt7eZUGIeKPdSKxKDIYA1G/DzhaVpCy6ygvXVs7vnPquAqFjq6rMcUSJ73EePqF8yd
         Owdw==
X-Forwarded-Encrypted: i=1; AJvYcCVUHuiwZjnMQ1P+NUMu2fnQrAuudwQZG/HkVMn+Ze61YkWpkPLl6M9yRK2XOK8DpvbUeHV1BARYn+CJDQ==@linaro.org
X-Gm-Message-State: AOJu0YwQyCXK4j3faS7WMIZun/v3O8zMiwK/uXp3+bYdw6HYkO6j8j4V
	DBuzTfPvUeQ14fM8b0SOyjxy7EFnC2CxThkBJZnhf76W2FD+jMQfYN29Q1VOkkEKQDlIZxHc3tQ
	IuPLw5Zs0gy3fXaWRkjlEvZoB5ZeW0RCFkRR1Vj08
X-Gm-Gg: ASbGncvfCNGtupD9CyrGeMFxdwkmy6wqj41g+GNsq6ZviysBkjkbpUGdvJuXs8q7M2c
	fFZO1eOPdGjlVkMYo6uA+CxXvDyH763/HoSZKXlLgw/uRq/7rf5y/co2jRXfD1sqkxLYmpFMZ6E
	Wp3e3Ve/3360c/DOsa2PMIuFM=
X-Google-Smtp-Source: AGHT+IGftwn4e/xnN3j6P31cm8Yf/u0yUcP4RFH7pgWCyb3qFVhXMHM7d5lZEz3AnQXFN+6mL0SXOp1EDzElTrOvo80=
X-Received: by 2002:a05:6902:6112:b0:e78:effa:714 with SMTP id
 3f1490d57ef6-e78effa155amr2291036276.31.1746700384509; Thu, 08 May 2025
 03:33:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250502132441.64723-1-philmd@linaro.org> <aBnCk2WE_SNkRgSH@redhat.com>
 <20250506040903-mutt-send-email-mst@kernel.org> <59c4d557-2f73-4b56-8650-f16ed3cd7bb2@linaro.org>
 <6af5a9ec-a197-49d8-880f-cdd88621e180@daynix.com>
In-Reply-To: <6af5a9ec-a197-49d8-880f-cdd88621e180@daynix.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 May 2025 11:32:53 +0100
X-Gm-Features: ATxdqUHp7jirf2HcolIcpMHLpg4XXjrUi-k12MNNu9eYjKtF6HK2NVemzIMK9bU
Message-ID: <CAFEAcA8FR8LmvOSoFjrNBexa4UnC43r21gwxQLO6TJfA-A-JPw@mail.gmail.com>
Subject: Re: [RFC PATCH] hw/virtio: Introduce CONFIG_VIRTIO_LEGACY to disable
 legacy support
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	"Michael S. Tsirkin" <mst@redhat.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	qemu-devel@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>, 
	Stefano Garzarella <sgarzare@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Nicholas Piggin <npiggin@gmail.com>, David Hildenbrand <david@redhat.com>, 
	=?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	Jonah Palmer <jonah.palmer@oracle.com>, Raphael Norwitz <raphael.norwitz@nutanix.com>, 
	Jason Wang <jasowang@redhat.com>, =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	qemu-ppc@nongnu.org, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Stefan Hajnoczi <stefanha@redhat.com>, Cornelia Huck <cohuck@redhat.com>, Anton Johansson <anjo@rev.ng>, 
	Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-arm@nongnu.org, 
	Mark Cave-Ayland <mark.caveayland@nutanix.com>, 
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: +6pLZqLID61c

On Thu, 8 May 2025 at 09:37, Akihiko Odaki <akihiko.odaki@daynix.com> wrote=
:
>
> On 2025/05/06 17:55, Philippe Mathieu-Daud=C3=A9 wrote:
> > VirtIO 0.9 needs knowledge of the vCPU architecture to get its
> > endianness. So we need to somehow propagate that at creation
> > time, guarantying which vCPU (or set of vCPUs) will access a
> > virtio device.

> It may not be too early as QEMU may already support heterogeneous
> endianness.
>
> An Arm CPU have a register to switch the endianness, which depends on
> the current Exception level, and QEMU already implements it at least
> enough to switch the endianness for virtio if I read the code correctly.
>
> This means QEMU should already be able to handle cases where the
> endianness changes depending on:
> - timing (due to writes to SCLR or switches among Exception levels) or
> - vCPUs (as each vCPU has its own register instance).

Mmm -- the virtio code uses 'current_cpu' to get the CPU which
did the device access to it, and then queries that CPU for
which endianness it should be assuming the data to be.
That ought to also work in a fully heterogenous setup with
e.g. multiple Arm and microblaze cores, I think ?

There is however also a function virtio_default_endian()
which seems to get used in contexts where the device
isn't being directly accessed by a CPU, such as system reset,
and which looks at target_big_endian(). That I think will
need attention for a heterogenous setup. (For runtime-endian
change setups like Arm it doesn't matter, because when the
OS resets the virtio device it will set the endianness that
way. But AIUI target_big_endian() becomes kind of meaningless
in the heterogenous single binary setup?)

Note that in practice nobody's going to be actively flipping
endianness and expecting the virtio device to keep up: the
use cases are "the OS sets things up once at bootup before
it touches any virtio device", and "the CPU boots up in
big-endian mode (i.e. the opposite of the target_big_endian()
compile time value) because the board/SoC model configures it
that way".

thanks
-- PMM

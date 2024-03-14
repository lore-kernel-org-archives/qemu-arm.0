Received: by 2002:a17:906:4a0b:b0:a45:b507:d90a with SMTP id w11csp285550eju;
        Thu, 14 Mar 2024 05:14:15 -0700 (PDT)
X-Received: by 2002:a17:906:36cb:b0:a46:47d5:284d with SMTP id b11-20020a17090636cb00b00a4647d5284dmr1067436ejc.5.1710418455406;
        Thu, 14 Mar 2024 05:14:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710418455; cv=none;
        d=google.com; s=arc-20160816;
        b=x9QRvpfMNDs8bmdaemwfswDGPJ3ORgNXUFYr7Lzz1qPBzZB7NuB/A8mh6s5kC5aSx9
         xUWAJVsV5lZKHEND7EUKwRKvtRM7fzT994yyantb3eY9NUNyIItnuryEOH70/THvdfc1
         DAJdpMUFNchJFAmDUQMzoozWjSVZZgv6TCzMzTrfe7fgVLsV/NJ2aC32KYBzF7GNrCui
         yoG+u0XzrjubqPI2Kl7qEZBEjECL6eHz7/2bqy+l1D9j0DImUt7gBkYQg2uIhOj7IiaH
         2HR6M12J3WvihitUevUWD9twLgt7fkAW1juZ9X9YnpS4qTVVS5EVHkV279GAeu9Z4jqZ
         vtBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Wb7r6wXWTS7RyS9+BQDEBfMOErDR6CZ/DZcU/ghg5mw=;
        fh=V6uUhM5y0stzxY/GrKKaaV3L4pYu8dIdPnMjh/CHGAM=;
        b=tRBZDT9xOn2fmgnPeQT+VHfCKCW+TASR9wO2cjjX0qm7xIXJ1QzkXQk5BRen806B6+
         ieu7Ofgn2oCI/IuQXh4mmp88ok3Xzv9/Po00J1WBcuWelsVm9EsKWg/Va7OAfejzvIvu
         7C5ImZ6sTLgv2E0i1KyGi8t8nBaJtO4QyVykBfiN6xBAuivYKyWAWHBIxjF7nWoUdCml
         ZoXtzEnepB1lSLk3VNHlsOhUT/MgYFKVfT+KMRyIj6JZXCjhNSZdQ9d+B9NQ86cwTLpc
         E+l3ZpWI4cwktaN5yc2wBubADRVjK8XfbJwW0gNT+NrSGpENmYkPIPvUP7uumvjVMFon
         0hKA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=izo+uqeB;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id gg6-20020a170906e28600b00a46241c5eb0sor431929ejb.0.2024.03.14.05.14.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 14 Mar 2024 05:14:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=izo+uqeB;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710418455; x=1711023255; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wb7r6wXWTS7RyS9+BQDEBfMOErDR6CZ/DZcU/ghg5mw=;
        b=izo+uqeBu5DXyaHPjNQKMCVSF310XM6UO4zwoJYni2Emao/EKB/E1TxDQTgyYwnzo3
         JYnH/ufyjVHoW/o7S1OuFqztuAWtjgou+eiaYZgszyzCO821/vuEQ0ds+zPTgGBIY5mU
         SkNVKfEXZKLXR3pOvU8bjPmHODZgxP/TTySoNZ+yBr8JqCMUTeK7bIAGN0e0kSXx8EsR
         kBxy7/gyUTv7odOEcBAfXRx7VSy7ywwyWIW73uwXaj/yIK8PVZ0URtz0Kqjts6bURlbh
         TKJUnPrdhK+n3c9f8XTer8+1ZbZLgeW3/1vcq+7Nh6OGR6dN4BkSbHI1wLp0SmXn9KmW
         Nx0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710418455; x=1711023255;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wb7r6wXWTS7RyS9+BQDEBfMOErDR6CZ/DZcU/ghg5mw=;
        b=n3sCWzheCtzV3lFRbmkUV8zO66kS9vtRaeTb4qz4yVZQPRI99M+GbewCCN465abmCY
         qq/xZ1jGtqyl7Ts0fqZ7qto+nAyqHhV6R5n4vL/T6wcJuiRbsdeEKhshVbSoreQ3crnC
         numgbEsneshBOfnIWhNCd9/djoVYnePYKlpXxn+6TQIat+e6+BuCUZLRE+FQqO9rTF53
         7Wip+ksy5xegp9k9tEKnbCyoaP/hS237d7b7IIPzsRLP72wuOMBQ8kx3zf3aTrYev/HE
         Gy90EmK495LeE0UAe3zE5h656lZUaMRJvknYkLzMFTdbK4sLaLsYExVkgtGfg88MhvyB
         3Ffg==
X-Gm-Message-State: AOJu0YwoKUI1YkeISkxeqAaYLj9qJuCqdNbuCDGu6EVX6nFmBmdO1jT/
	35axFPtOM8B9RdkTJBbjkg7uTR+cwnsVjMldrZ/mgxVWSnzlpGsQXfGRwNyioyyjjSB/d+avJ8q
	JCf6/rKsK7vXp9r8OS+8drB3J3Q3keruxjx1sWMBF7S2pT1hnd88=
X-Google-Smtp-Source: AGHT+IHkBhjMMmCXEbzLQ1J7re5yL2jTyJ3P/i9Ko5pmypFlXtkVBiKtwQyUx5XewnCXV3dxUgY3EtRkCKrDPSgL2FA=
X-Received: by 2002:a05:6402:1f8c:b0:566:1794:7b2 with SMTP id
 c12-20020a0564021f8c00b00566179407b2mr1144005edc.13.1710418455004; Thu, 14
 Mar 2024 05:14:15 -0700 (PDT)
MIME-Version: 1.0
References: <20240314-sbsa-ref-firmware-update-v2-0-b557c56559cd@linaro.org>
 <20240314-sbsa-ref-firmware-update-v2-2-b557c56559cd@linaro.org> <87h6h9gghs.fsf@draig.linaro.org>
In-Reply-To: <87h6h9gghs.fsf@draig.linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Mar 2024 12:14:03 +0000
Message-ID: <CAFEAcA8GhAMtvsRE71fybuY90hXBavbXwCrb=-fWGqg8JebTEQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] tests/avocado: drop virtio-rng from sbsa-ref tests
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, qemu-devel@nongnu.org, 
	Radoslaw Biernacki <rad@semihalf.com>, Leif Lindholm <quic_llindhol@quicinc.com>, 
	Cleber Rosa <crosa@redhat.com>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Wainer dos Santos Moschetta <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>, Brad Smith <brad@comstyle.com>, 
	qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 2Rf3ATHrQAEH

On Thu, 14 Mar 2024 at 12:11, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org> writes:
>
> > sbsa-ref is supposed to emulate real hardware so virtio-rng-pci
> > does not fit here
>
> What is real anyway ;-)
>
> VirtIO devices exist in real life and I would argue for PCI the device
> appears very much like a normal PCI device. I could see the argument for
> avoiding virtio-mmio devices which are a lot more VM-only in flavour.

But our platform for testing virtio-rng-pci should be the 'virt'
board (and our avocado test for virt does indeed have that device).
What exactly are we adding by testing it also in sbsa-ref,
where the typical user will *not* be using it (if they wanted
a virtio setup they would be using 'virt')?

thanks
-- PMM

Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp2170609njb;
        Mon, 3 Feb 2025 07:05:19 -0800 (PST)
X-Received: by 2002:a05:690c:317:b0:6f9:45de:408f with SMTP id 00721157ae682-6f945de4938mr69421827b3.35.1738595119010;
        Mon, 03 Feb 2025 07:05:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738595118; cv=none;
        d=google.com; s=arc-20240605;
        b=YjstSKSBxXEO2fpLhj2hmI/kkhIaqPR515aSB2YGaYo7v7Wr3xhpmGQzozgucTQDBS
         2Nr6jVJs5WX+sOiLgGPF/9/wIGs8v2PENpxf6h1O0dGAslyykGabWdboQDln7Pp8Kmbm
         GzVWMaBHHD/nZfP8OnuiXKh2q5coxOVqEfd9KVLPsYpI9B5/GPGq3dvjndbdnCuBPxGw
         dFc02nU4erPjJT0yD2rMYR/MwLMoZWe1saThxsvRGKYpyHM/wgDkrpkIIr8OF3aNqS8D
         q1/qiSj2oQhNtBWQnpYt/ZFxvDM2bxhLFYrqLBS90oCtDkMABw6UqZ/DoEOpLNnDn3Te
         k5GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QVXkE69ZSFKoAYdDsoCLmLnjfkJC0UwvVD2SPxozagY=;
        fh=Dlk7gkMC73W1gtFOXWylCm8Q2mwuHPmf1cRl28++9ho=;
        b=SS7nw57t6liJykmOoRn4D3uavoX8PQu4nrTPwljALfZHnmKqgB/aAaiJIonrTebgG6
         5Cvrwycc0LjBhvF7c8s4QcOHhfTHvrSw/SAKKNovpazaG32XTIxW720q+cqQZ/VICDOr
         JyxrV+bDV2urFecgUF8YckfNpUbruw+YMXqINREWJuN6kwEs7qp/2XBmxTpFiDZHITnr
         G6Uto7qCd1GzxVIcclQdGWvYoaYcXLwxCWYHaeUs80Qn6xRj8NSp2MxL+IfnmbnD6Whs
         ira07dseG3Puu6W2DmHa+HnMAElXVJRTHJh+NPnuJ0szef6MttXHOPemM5UhWBFyI1kU
         bo4Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="FSVzWQe/";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 00721157ae682-6f8c487e22dsor54999647b3.15.2025.02.03.07.05.18
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 03 Feb 2025 07:05:18 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="FSVzWQe/";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738595118; x=1739199918; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QVXkE69ZSFKoAYdDsoCLmLnjfkJC0UwvVD2SPxozagY=;
        b=FSVzWQe/AOMLXB4PQVMMH2PPJPaZ/b4hLTsxGtNB+trN0nc0M7xZ7BXh7RN3pCJYlq
         ASApy2CP3dkYKb1+W5EReLQKGxW+wXtOH/bfHMnEpurOOQ/xYy5COOx1NvnguSj6KmLD
         UjkrbUn0ONnwMFEIYyytRNmfsgR886dmJPXVg1jf7u+CxL03Px0Bxskujnf+dSczLm4k
         sKKti/3DY+eJSJgtQVmPAxN6XwF5DGs9+HCekrN9dTkV2j9kuWT3rTd/nkSjmw/h5VYF
         lPymPd9xkwz00ATlt0iyCLfJDTcntkQ/VcDer9Rc2a6OUba9H0lKmzJ9osFlDrLV2PPz
         KPTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738595118; x=1739199918;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QVXkE69ZSFKoAYdDsoCLmLnjfkJC0UwvVD2SPxozagY=;
        b=vE4Akh16VTPFUduoFEigiHudnJGT8KYX5zDUEKEIMrIGdUv3utxUm+fYSHkzYvPnfS
         RsHxGd2NFrQht714p+KA+DHxYICQGyF0nHCTnAZBPrvltC7ofhdLt4k8N+Ob66hWuFxE
         HcFwV/0cTkA3/SrxfKWnE5QBuQ81bvPqM9QGwUgN2YpMx+yC+ZsY6NnDvVz2M+nZeVFc
         Ghs0wSx9zstrsQkmNiVwQ9pj6sofuw6NbVQchdA2HvYWNU7bxlHcZptQIzdSbcTo1lZI
         1RN/oKA1ABX+l9bVu0G2H2iZ1x7L1Dvd6P8idmbJnV2O62xuSY6CMAGT4z5yhFbq4IU2
         bpfw==
X-Gm-Message-State: AOJu0YwDNDJ8Hwko5pgztpSh2tmH1kyNuH8p4FyzwX7izxcs5NGayUcc
	UBF6hud6aljwfAicSh+peuiJyt/Nz+ekQsO+XKeXzFnSKVjfjG3y54LPiuOtisrlC2qh2xeu9hp
	hHGG/r4E6HHNcj1Np+gb+36yJcqazKocdWCThinuntSyIpTons9I=
X-Gm-Gg: ASbGncsxD9iYsGpnpzGQCSAFCYE6kDg78iryZf66QDDiwRKqXcXoNwRK5H20V4HFsh1
	l3n/kYm8sA2hUaI5mVFkmwG7dzBISQYEdWR+cRR6uAndUS+nJXLOdyVqe/HsvT0qjSfrkY8RnKg
	==
X-Google-Smtp-Source: AGHT+IGUyveJDajUyI1gSDnHBzFD+4nn9H9kvz9gc8lritIZ4JOP+GysQ8H2YyG0Gah0lF2b7b+rSDbj876DICK/aoI=
X-Received: by 2002:a05:6902:13cb:b0:e58:33d2:6a12 with SMTP id
 3f1490d57ef6-e58ac03aa9bmr13820114276.31.1738595118473; Mon, 03 Feb 2025
 07:05:18 -0800 (PST)
MIME-Version: 1.0
References: <20250201091528.1177-1-philmd@linaro.org> <90d87f0e-56a3-8966-614c-364f3e726d61@eik.bme.hu>
 <CAFEAcA_mBXO20NhYRHJCgkB0h8uYQQhBMdwVW376R4u-qh51nA@mail.gmail.com>
 <87ed0fayoy.fsf@draig.linaro.org> <Z6DTsdf35ApQ0qLU@redhat.com>
 <CAFEAcA8Qigt1EBVgz1D4hon0x4ukLZbZ-jS_KB+ZBH0yi+QCXw@mail.gmail.com> <Z6DXmN-ROswsaDAi@redhat.com>
In-Reply-To: <Z6DXmN-ROswsaDAi@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 3 Feb 2025 15:05:07 +0000
X-Gm-Features: AWEUYZn4HL6DM65HU2Td3KGGhWBaoWo3z4Hvn1BXN9lGTlWIFT9wRml89dN4xy8
Message-ID: <CAFEAcA8mCt_hPHxDLaOwJUkvk2o9=-20Oy=+eSPFduh0X6Ru7g@mail.gmail.com>
Subject: Re: [PATCH 0/7] hw/arm/raspi4b: Add models with 4GB and 8GB of DRAM
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	BALATON Zoltan <balaton@eik.bme.hu>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	qemu-devel@nongnu.org, Jared Mauch <jared+home@puck.nether.net>, qemu-arm@nongnu.org, 
	devel@lists.libvirt.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: TDh0Sz/NEPhu

On Mon, 3 Feb 2025 at 14:50, Daniel P. Berrang=C3=A9 <berrange@redhat.com> =
wrote:
>
> On Mon, Feb 03, 2025 at 02:45:06PM +0000, Peter Maydell wrote:
> > For Arm embedded boards we mostly tend to "restrict the user
> > to what you can actually do", except for older boards where
> > we tended not to write any kind of sanity checking on CPU
> > type, memory size, etc.
>
> If we're going to strictly limit memory size that's accepted I wonder
> how we could information users/mgmt apps about what's permitted?

For users, we inform them by exiting with a hopefully informative
error message. Management apps presumably need to know already
because they would want to avoid presenting the guest with
weird configs that the guest OS might or might not cope with,
even if QEMU accepted them.

-- PMM

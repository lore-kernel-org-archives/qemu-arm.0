Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp2156100njb;
        Mon, 3 Feb 2025 06:45:20 -0800 (PST)
X-Received: by 2002:a05:6902:13cd:b0:e57:fd98:533f with SMTP id 3f1490d57ef6-e5ad8daed35mr11441637276.3.1738593919872;
        Mon, 03 Feb 2025 06:45:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738593919; cv=none;
        d=google.com; s=arc-20240605;
        b=Fy2BY7jX5PuQYXw59Y5/aoaBT9peaq0TIqfGDCaQ35zhB8xcwTknWZpuoURqI0j2gx
         aqyJZLIFxU9qSfy/aAZbw4zQz62xEy3gI2JrW9HZml17OVowczhfUzJU2u3DpeXBKjHi
         jG+LzmAcHggjUNUc1R3hRypr6z3MSkLIis6MCjsj3AYF4V/Qdh+3BoaQXOjagyxFjnS9
         wZhBuNSaA+b/e5LJTh0nEfKEIaw23exPqU05mNCt7KCrn7oN9G7Wueppm09gazSGG4v6
         SzsIU1U/+Wo81VtCfV9UpWgS4b0VPwuR2QMfOuyKwRsOOZKSgMEY85w9Wjas9O0qjYct
         OlXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wRQby+/AMmtw/cfXqrX1L291GtS4VEHF49TlvBYGG8w=;
        fh=Dlk7gkMC73W1gtFOXWylCm8Q2mwuHPmf1cRl28++9ho=;
        b=Lcag4BD4A15IL21uZCQ5OJaJRjJi2EuZRjXj129HBamNL8stAFFwv1XZO4rSlpcryj
         GqrEM2W1N/Jo+JEQeIFpx2mX4pFAiI+Lm208xVoS6AhnEUXEV8LkSweCwc23Tlt4m6iz
         pUUb3WVwFtokOqU/lZIq7vgpOqNTXOo7+j1Xuz0k7/Ag2/bZujrhMC7wmOGRc9VDL0Cz
         lYOxyBqfez6J4hX91j6rsqUTCGdF7Kw41dmieD4z0DBkRpordG7/47BfDi/fdNSrHWLf
         /VpYBCl2qSh9VMNu/8CdcDdO+wfMZ5YYbip68G6zPlby0mp4T5Kx7sivwD+LXJr59XGJ
         3Weg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dPcQGENi;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 3f1490d57ef6-e58a6cca4cbsor5957921276.6.2025.02.03.06.45.19
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 03 Feb 2025 06:45:19 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dPcQGENi;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738593919; x=1739198719; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wRQby+/AMmtw/cfXqrX1L291GtS4VEHF49TlvBYGG8w=;
        b=dPcQGENir61WAVbEodvHmo1Lo6KmWIiLIkYlHHClfCLeE27BPZz/hK+GMDivm9OTQO
         AW2ydTAEzOJ/H9oSEL4bWZ5ideQtRQSCjhDrVzsa0K3lzsw6AySJQp5w+t+iYrLxP2UZ
         91hVTKYUOwjvxN2D94HZEkmPIG0z313trwqlkTFIEuzd76KCWlB8e+Mr2BMBIV3DroMI
         R2hteB75VuGeaPYpjnbryq6c33tlOCWLRW7A88brOeJJOoFtBl/2p3IYFk3BBtnOLt2Z
         CK0BtanHITTwfYzlXne0IcEEcq3gpNSrFSWls+GUyRryDXoBgVpN7sZBqTG4XO/yR/B/
         23Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738593919; x=1739198719;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wRQby+/AMmtw/cfXqrX1L291GtS4VEHF49TlvBYGG8w=;
        b=fp2/punkl9jEkOrxESuqacgunCAxKQqjuQZ3S9GNc34lxR7TTKgPc+71//Ylx6PGmo
         /408fNppLQ7hi4ag7PZ3DFkLdmqhW/C6D5/2+9vshzbKYHqCrlb77erFgCuRZYwCE97k
         iIs1IBvfs/ImfPj66mjUO5DpbdJlA3wSqTJcmLaPP8FuZB2JSPMWahdwVWjRWqjGHEZI
         gXBWO5nJDo13rDeD8/kVNpiBh6R9ol0uVERuZE2FkBnhMR3/HqB0Fp5FkcukDuym/OSO
         UX4Pa6vml+iTBMeexm0tA7iRQUhiqsTLJicvaP8/CIJ87+JGjD/htI1U/On4k8xyvFd5
         m18w==
X-Gm-Message-State: AOJu0YwoMIZFgR+nd1wBB5bz8sn+qc8qtYiontElR/nMMTmS7TBlJ1UC
	A/XnWQyEcVVRdCBw6f3jza7DD7jrpqGNnIo23Vf3zH4dEbn5hzDOwWhrjssTs0jrxouezTfjh4m
	xJyVvB7SHxZxX5rl0iEX3xyG3ibjDY8WG4fvYYaId/Q4xVkFlvzA=
X-Gm-Gg: ASbGnctXVDk/xj16vkp8DW+B8HcpSM9Om928jSs/Zk3L2AN+le8Wx42i0c56nHCLR8q
	u6g0iPoNz5FUrVP/b2gtorDLUq1cMYVkljadAXaQNNuALlAZ9FzLJu2PYxSnxDYQOjnBVjK2xiw
	==
X-Google-Smtp-Source: AGHT+IFaVV4uQcgTS6i69pIZpKQ17Zxnp+3d1624oclFGgWbbcJSVQB2qUm3ITxk3QIZOKBaR3ZLqN+FnFfRO//WQts=
X-Received: by 2002:a25:dcd1:0:b0:e58:16b0:3798 with SMTP id
 3f1490d57ef6-e5ac89567ccmr10460254276.24.1738593917962; Mon, 03 Feb 2025
 06:45:17 -0800 (PST)
MIME-Version: 1.0
References: <20250201091528.1177-1-philmd@linaro.org> <90d87f0e-56a3-8966-614c-364f3e726d61@eik.bme.hu>
 <CAFEAcA_mBXO20NhYRHJCgkB0h8uYQQhBMdwVW376R4u-qh51nA@mail.gmail.com>
 <87ed0fayoy.fsf@draig.linaro.org> <Z6DTsdf35ApQ0qLU@redhat.com>
In-Reply-To: <Z6DTsdf35ApQ0qLU@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 3 Feb 2025 14:45:06 +0000
X-Gm-Features: AWEUYZmacHCS6PQYUkMX9OKHszLEzvKRz95YjA1VR1GyKmgnZeVAvxybu0jIWXw
Message-ID: <CAFEAcA8Qigt1EBVgz1D4hon0x4ukLZbZ-jS_KB+ZBH0yi+QCXw@mail.gmail.com>
Subject: Re: [PATCH 0/7] hw/arm/raspi4b: Add models with 4GB and 8GB of DRAM
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	BALATON Zoltan <balaton@eik.bme.hu>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	qemu-devel@nongnu.org, Jared Mauch <jared+home@puck.nether.net>, qemu-arm@nongnu.org, 
	devel@lists.libvirt.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: wn2uk7hVsF46

On Mon, 3 Feb 2025 at 14:33, Daniel P. Berrang=C3=A9 <berrange@redhat.com> =
wrote:
>
> On Mon, Feb 03, 2025 at 02:29:49PM +0000, Alex Benn=C3=A9e wrote:
> > Peter Maydell <peter.maydell@linaro.org> writes:
> >
> > > On Sat, 1 Feb 2025 at 12:57, BALATON Zoltan <balaton@eik.bme.hu> wrot=
e:
> > >>
> > >> On Sat, 1 Feb 2025, Philippe Mathieu-Daud=C3=A9 wrote:
> > >> > - Deprecate the 'raspi4b' machine name, renaming it as
> > >> >  'raspi4b-1g' on 32-bit hosts, 'raspi4b-2g' otherwise.
> > >> > - Add the 'raspi4b-4g' and 'raspi4b-8g' machines, with
> > >> >  respectively 4GB and 8GB of DRAM.
> > >>
> > >> IMHO (meaning you can ignore it, just my opinion) if the only differ=
ence
> > >> is the memory size -machine raspi4b -memory 4g would be better user
> > >> experience than having a lot of different machines.
> > >
> > > Yes, I think I agree. We have a way for users to specify
> > > how much memory they want, and I think it makes more sense
> > > to use that than to have lots of different machine types.
> >
> > I guess for the Pi we should validate the -memory supplied is on of the
> > supported grid of devices rather than an arbitrary value?
>
> If the user wants to create a rpi4 with 6 GB RAM why should we stop
> them ? It is their choice if they want to precisely replicate RAM
> size from a physical model, or use something different when virtualized.

The board revision code (reported to the guest via the emulated
firmware interface) only supports reporting 256MB, 512MB,
1GB, 2GB, 4GB or 8GB:

https://www.raspberrypi.com/documentation/computers/raspberry-pi.html#new-s=
tyle-revision-codes

For Arm embedded boards we mostly tend to "restrict the user
to what you can actually do", except for older boards where
we tended not to write any kind of sanity checking on CPU
type, memory size, etc.

thanks
-- PMM

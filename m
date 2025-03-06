Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp1376162njm;
        Thu, 6 Mar 2025 02:13:29 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXwaVXYHryWMS0+dYSpFOc4kxeFrgZ/7G8EA2Inj7oUt4ENF2bNJwm9ddNm0wBvlWOFYxAIfLMCEojhxw==@linaro.org
X-Received: by 2002:a05:690c:5a81:b0:6f9:c6e2:89a8 with SMTP id 00721157ae682-6feaee5e07emr29592527b3.6.1741256009236;
        Thu, 06 Mar 2025 02:13:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741256009; cv=none;
        d=google.com; s=arc-20240605;
        b=hzRe8s1OA7yWJ1E9c9MKV/Kd+me7tVgAqhFlyMzX+tWZrU0hANxWt/7Ex2Fqhb+qxO
         vIgH9h5+Ksqpqq2B3bBlh+xOhPKVG6KEP3sMBLXTwo//28fwD1xblVsw77OudaxF2LGE
         rv3obA1zu4WeRiWknxOlgfk+2AzCUvMqZEMWS0VJiCv3mELC/jCTy3hc1kzhy+eQL4DZ
         lnydGyvIl3iSRD5gSSbzHaRQg4MOUMDcqzn/b5BA9XYLAULUG4XZ5tzx+DNyqNKppyaG
         msaSrhx/k0ebGUnReeqOGoLIf9psSmb6wcZwITGqncOXLph8XJPfmGrKhSyBgeLSBlFO
         /tgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5lJXKZf5zcYw5ohzoA4hRxGVuZ41Pla04bRM8TI0aM4=;
        fh=X44DfZV54H7+rIgeK9PTMot/9y4aq4p2wFoLVY8BZ+0=;
        b=C6urlB18dWeuKZTPuR5banTOBiVp4tTff+SlomiDsIvBkLfBpqACYf6VACV9BB+ixZ
         UOL2w5Ex0UZU9kobbmpoxwvoTMZG9ZxWZL7emm3nROLYTFu9fuJVzpRp/Lx4WcGoLr0y
         CxjY0LQaRDnw9B3KBGQHBVNb6YJ9ldvEDwiah1WllcbbwsHE1Isr1bC1fkymhwV2SEw7
         OULuz3RNtoIDZ4JSGZd02ua7ltcSrX0MVJh9xROGYvBwxvgQpQkd/1IvkHwE6sSQbm46
         WF8+wCA9rAr2zmyNrhIpTQjrZYXGghYjH9W3Olz9EdtlELbyQ+hY/cFSHP+kiqgSDF0I
         NxDw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RQKb+zY1;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 00721157ae682-6feb2b97ee3sor4122917b3.7.2025.03.06.02.13.29
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 06 Mar 2025 02:13:29 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RQKb+zY1;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741256009; x=1741860809; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5lJXKZf5zcYw5ohzoA4hRxGVuZ41Pla04bRM8TI0aM4=;
        b=RQKb+zY17PsJ+/f3EBF2R6RJeCuahPFvqpSawlUJXNz5wI50MiLRIa+Pdk4L+X+e15
         q6Z4sr91wwYCmcjkxfBtV3OEGozasEq560eCs8M5wZQ8CyBMrOYVo+RizyAKz/bzTsur
         0xAu1wCMVazRAJjWl+1r08IhNEsMd6phi8wQjy4KYezgXTv7fbssi8JnreTpSf2427tj
         nubz7PAHMJtJBiZ7W90GCAmAUebsQgAwZ8gfWYPnfTP6z6THfXEpV23Vn1UTrzrwET1+
         t+iP8aQiLXfTWi82BMe0P2XBwu7cuAs/btbLIKfuyyEhfznKPFBss5l4qFaBL+93kntM
         SD1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741256009; x=1741860809;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5lJXKZf5zcYw5ohzoA4hRxGVuZ41Pla04bRM8TI0aM4=;
        b=PghsHQvf6hiJXBXEoLWr2f2N/h+auFxT80WIApCU8IT+J22ebr9qk49GN9ZIKKguk9
         tdaErnCmhwhO1QEf7aPi2J52ilop5FiB1wtHyu+FgQh/jCW5xZ09Y6Zssi7cCfYxlPX4
         o/GT+KOAJc4Aneq3UNKPNV2yGaQmUmGbRMWlzFpDh6BC0tquzrtx8mRyCxydIXa5f0M1
         rcj78fFI8xIz5g+vli2MqqpmjVpvljT2Eh04RCvQEC8nqJWwZHNlrNq+lDM+Yx8enqX3
         LFZsZEDcJBbtvXFqxynV9oyvIluM/3dx19oj7zv/nEjULEsq/sOm4ub0TzxH/ho6wR9g
         3rPg==
X-Forwarded-Encrypted: i=1; AJvYcCVsyXj+cfV5+k851JOTH9TwcioEKWZHEwWKMSpLzigtXBS91D1bn+q4uKSrfFEMrpd1UDzinuEyk5kOAA==@linaro.org
X-Gm-Message-State: AOJu0YzZyIi1BVzJuNxlnM4X50m+prOXGLQLoXFfjwLREq9FWHLd1TSA
	q705fJGV/GWrJh5dkPNCufgPNaV1axtWwaaj131rR/TLMybuogNJha6Vu5XciPmO0wGTftABlXC
	WYjExCVn7KK+jDe3Z9lhF9S8TdC7vbFriqyAeGeHG
X-Gm-Gg: ASbGncuTX8Dej9jQvAasdT+o2nq78/M8nyx/O148X6xxehnrwcTg/azQsN2t0xHGv2J
	ll50eymP9A7gN6DUSQn2k67Vz21PjM8rgUf9TqWxnn4sZvVTdc2xY3hBFqfsnd8uUJRnCQBa9zd
	NEOzikalnZ0AvpC0gcp2pWXe7fevg=
X-Google-Smtp-Source: AGHT+IGAkHtVrhbM0rUIE+VF0q/zYEaQvPttC/adGGYQuG8e/lqVdReWfCOxNKL4LxUj14JV08rUtstqnYBbEZ++ko0=
X-Received: by 2002:a05:690c:64c5:b0:6fa:fd85:a2b6 with SMTP id
 00721157ae682-6feaeeda024mr37834847b3.13.1741256008805; Thu, 06 Mar 2025
 02:13:28 -0800 (PST)
MIME-Version: 1.0
References: <20250305161248.54901-1-philmd@linaro.org> <20250305161248.54901-3-philmd@linaro.org>
 <Z8lpB6XdNPT8zyTa@redhat.com>
In-Reply-To: <Z8lpB6XdNPT8zyTa@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Mar 2025 10:13:16 +0000
X-Gm-Features: AQ5f1JrjmBIvYLT_jqvL_Q04vutWHCYlIcEFcz_IjkUx64YHVNTExNWlQGns4ZU
Message-ID: <CAFEAcA9FuNJZwQ2NyJdBicoMMF=3Ua+qokrHu+-_uwnF9_tDNQ@mail.gmail.com>
Subject: Re: [RFC PATCH 2/4] hw/arm/raspi: Replace TARGET_AARCH64 by legacy_binary_is_64bit()
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
	Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-arm@nongnu.org, 
	Thomas Huth <thuth@redhat.com>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 4FusqMH0fOXM

On Thu, 6 Mar 2025 at 09:21, Daniel P. Berrang=C3=A9 <berrange@redhat.com> =
wrote:
>
> On Wed, Mar 05, 2025 at 05:12:46PM +0100, Philippe Mathieu-Daud=C3=A9 wro=
te:
> > For legacy ARM binaries, legacy_binary_is_64bit() is
> > equivalent of the compile time TARGET_AARCH64 definition.
> >
> > Use it as TypeInfo::registerable() callback to dynamically
> > add Aarch64 specific types in qemu-system-aarch64 binary,
> > removing the need of TARGET_AARCH64 #ifdef'ry.
> >
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> > ---
> >  hw/arm/bcm2836.c | 6 ++----
> >  hw/arm/raspi.c   | 7 +++----
> >  2 files changed, 5 insertions(+), 8 deletions(-)
> >
> > diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
> > index 95e16806fa1..88a32e5fc20 100644
> > --- a/hw/arm/bcm2836.c
> > +++ b/hw/arm/bcm2836.c
>
>
> > @@ -219,12 +218,11 @@ static const TypeInfo bcm283x_types[] =3D {
> >          .name           =3D TYPE_BCM2836,
> >          .parent         =3D TYPE_BCM283X,
> >          .class_init     =3D bcm2836_class_init,
> > -#ifdef TARGET_AARCH64
> >      }, {
> >          .name           =3D TYPE_BCM2837,
> >          .parent         =3D TYPE_BCM283X,
> > +        .registerable   =3D legacy_binary_is_64bit,
> >          .class_init     =3D bcm2837_class_init,
> > -#endif
> >      }, {
> >          .name           =3D TYPE_BCM283X,
> >          .parent         =3D TYPE_BCM283X_BASE,
>
> So historically we have a subset of machines that are only exposed in
> the qemu-system-aarch64 binary, and not qemu-system-arm.
>
> You're attempting to build a single binary to cover both 32 & 64 bit
> arm, so need to be able to filter what machines are available to
> create when the symlink indicates invokation of the 32-bit binary.

What machines are there that we don't want to provide, though?
We don't provide for instance raspi4b in today's qemu-system-arm,
but that's because it wouldn't work there: qemu-system-arm
doesn't have the 64-bit CPUs. But if we have a single binary
that has both 32 and 64 bit arm in it, then the 64-bit CPUs
will be in that combined binary. Do we actually need to explicitly
forbid the user from saying 'qemu-system-arm -M raspi4b' when
qemu-system-arm is a symlink and the command would work fine
if it wasn't forbidden?

I had assumed that the motivation here was that we'd like to
be able to build this C file only once. Currently we have to
build it once for the aarch64 target and once for the arm target;
to avoid that we would need to determine "does the binary I'm
in have the AArch64 CPU types this type depends on" at runtime,
not at compile time (which is what the ifdef is doing, effectively).

thanks
-- PMM

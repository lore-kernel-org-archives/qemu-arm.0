Received: by 2002:a17:504:82cc:b0:1be9:327d:8ee3 with SMTP id m12csp1649341njj;
        Thu, 31 Oct 2024 05:59:50 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXK20akFTLmaGpbA+TxkOq9uO9vGkV6ihnjATZ51v1kyT9tc7krwlhul54gfpk5xTXb3YXkIitpMwg2Eg==@linaro.org
X-Received: by 2002:a05:6402:4022:b0:5c9:816e:45d with SMTP id 4fb4d7f45d1cf-5cbbf8ca1aamr19516066a12.17.1730379590427;
        Thu, 31 Oct 2024 05:59:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730379590; cv=none;
        d=google.com; s=arc-20240605;
        b=SbkfTeuUAjrnHLDABeJQkZpdeeh8sfA+6PyZWQjxuBp5aB0NVuFxN0jKkM5bms6kIe
         VmadUCM7HzQUJouUBvkJqwXJnQQd/GVUNdcEOApD/82c6csQ59+0mWV0KndpjmDsG9y5
         jd9fNfutICAVd2CWq51GZnTVFCqagqqqHIX1ta9G4nh2whQXTDLDXDFiuUddEwGFzuQq
         DHGns59PNv6Vo2aYbhwDRNbq+DtYLN1xCP6iJvcQsb++UlX0SLoUjzEvmT1aZzXdvhxW
         1K5Nd8R2/T06owyiEqIEj2gwIWEjIqNJvmyIh/1AgSlgXyU1EbnHvBBfU4XHXCX+zSO/
         yDjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+cjV12eTgGM/W6VxKSYtL5Nw4UUw/HSAOYX1se12Zig=;
        fh=22PLgRLmtcx2xEpgN3kPt+NXxXR6V8jUVrwFw1km6i4=;
        b=jDfCmXYUUtghKPjCTpTRGwiEu5pEpaWcoJUgZevgSm8chaOksvwB4yGceZh+btFfw8
         xlgXFykeAGeNhZ5xfKf9OB/ZzelFjrlP5LPqRYXTRRjX1hH905YeVLCTBCPqtM7ZSmkT
         +4LOG4tK1yR/BoExNkj7COvnp9Mmex/NhWX3TNDIiKmqkZIKgIp5b6jbh2qnDB9ND3Zl
         YRFNjG0cYsW8EHCK3nv6mzvPvDtFTWl7HVfUTS+BE3uPPmC1rxlb3Rgtr9V3RzPHbmsG
         3m3u7nKzRnnTX/UCxIOAYfIxKOpJ2ctTOVoiEvXFTG/1y+dhXotfAzRGFzmgbluKSDpo
         PR5Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="e/4UH62U";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 4fb4d7f45d1cf-5ceac7fa790sor457523a12.11.2024.10.31.05.59.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 31 Oct 2024 05:59:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="e/4UH62U";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730379590; x=1730984390; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+cjV12eTgGM/W6VxKSYtL5Nw4UUw/HSAOYX1se12Zig=;
        b=e/4UH62UqQ9+5dALfcayCwd2bBE+E/kHk39E5MlEx6kpWqbbcnoRJFVRLliHZMfvDB
         aZs2molAtBfvBlyVvLOvOx6uGGnHtDDBS+F3suAliQZXnp0UJpcbroccMFbY7eWHaLIC
         5OILzbQJBrLsPhB1n1q20fNLHDbUcUWnOcq73Vs1QKoiSO474JBe1rPIlHMcia6ZQyDS
         IddagJxLPJxn5oyqY1XWEaFxkZ/BU8nG+Tdzysd7YiuEDgaSAwm3VJIV+IE3LoQjGHgz
         ialOU6B49NJGdSrRkXo8sVPmUjWxnKsxkQsSeCMvXCc6gyj8KZg72c5DVROYTALpPddE
         JV+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730379590; x=1730984390;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+cjV12eTgGM/W6VxKSYtL5Nw4UUw/HSAOYX1se12Zig=;
        b=SqSZVF4auH5G8sbi4b315++ya1CYXCm0j8NwfTT+N+/9NIF7a4ROSjUIt2pMmHz6P1
         uWGZNd+YNko69Lwf/ZBg80XkICRBH41Q+6LxMQbYz5/RvoFeQ9ozKsJM23UMSEKJ3+vQ
         ReZh2yltaZAdBL8lYJdOjxiIcRQYLNYXKUGblspruMAsxelimyti4BUVbXzDpKf+gyeS
         kITngCLyuB1PEoVjVkOvvNfKKNMCuKSrAplaIf17Kq0YVPeML4TEHX099Tgfyfj2Or+R
         edOXky+4B70/3cGqXCPzpV3vuJaTsl8vKGtSazdOYLY/cmZTdUEmadx1RdfJjrwTHE1W
         XB/w==
X-Forwarded-Encrypted: i=1; AJvYcCWsA2k2fHGgjDBp9JJbUEqM2rEkB6x90PdZ0DeJyzHCNOhx7BepLn4IrILOwhj8aSlzf808ftupv8VdiQ==@linaro.org
X-Gm-Message-State: AOJu0YybW9Ai8aw4PCEq+331O48wtdip6oXD4q/+NcKlIvUIN7nh5itk
	xp3cAoBHYojcme1JGV7/x3w5l9yzAYZtMvJn+Qlh1i7VQVrRCUtSqdb0rZSZypY4Skjtly4Ua6J
	4TmwZYHIawHkTGFdBgFcnFyCW4fILb95HDgaUYb1oanU6Ze5vWFY=
X-Google-Smtp-Source: AGHT+IERALXckroa9H9wtBfFLwXEcQL525RIETUMpbqoyMAnjF9yZNCHsaFTftdbxaN4KRPpPN9q1vw89+BTyseQZR0=
X-Received: by 2002:a05:6402:4022:b0:5c9:816e:45d with SMTP id
 4fb4d7f45d1cf-5cbbf8ca1aamr19516036a12.17.1730379589860; Thu, 31 Oct 2024
 05:59:49 -0700 (PDT)
MIME-Version: 1.0
References: <20241025101959.601048-1-eric.auger@redhat.com>
 <20241025101959.601048-22-eric.auger@redhat.com> <ZxuZkUFz_bwAA1pf@redhat.com>
 <0700af51-a1a6-4b11-a4bf-0eaf6e279c6d@redhat.com> <Zxudl5-fZV1vIaEL@redhat.com>
 <87y128nrfr.fsf@redhat.com> <Zx-3OUioG1l47hW3@redhat.com> <87plnknqco.fsf@redhat.com>
 <ZyN3A6dAEDkx51yb@pinwheel>
In-Reply-To: <ZyN3A6dAEDkx51yb@pinwheel>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 31 Oct 2024 12:59:38 +0000
Message-ID: <CAFEAcA_1R+xf-nBKCM7JDuNj7sLCA4KUjen6kPAng+1yjwHRrw@mail.gmail.com>
Subject: Re: [RFC 21/21] arm/cpu-features: Document custom vcpu model
To: Kashyap Chamarthy <kchamart@redhat.com>
Cc: Cornelia Huck <cohuck@redhat.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com, qemu-devel@nongnu.org, 
	qemu-arm@nongnu.org, kvmarm@lists.linux.dev, richard.henderson@linaro.org, 
	alex.bennee@linaro.org, maz@kernel.org, oliver.upton@linux.dev, 
	sebott@redhat.com, shameerali.kolothum.thodi@huawei.com, armbru@redhat.com, 
	abologna@redhat.com, jdenemar@redhat.com, shahuang@redhat.com, 
	mark.rutland@arm.com, philmd@linaro.org, pbonzini@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: mUyQr1IOc3EI

On Thu, 31 Oct 2024 at 12:24, Kashyap Chamarthy <kchamart@redhat.com> wrote=
:
>
> On Mon, Oct 28, 2024 at 05:29:11PM +0100, Cornelia Huck wrote:
> > On Mon, Oct 28 2024, Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrot=
e:
>
> [...]
>
> > >> We could consolidate that to the current "host" model, once we figur=
e
> > >> out how to handle the currently already existing properties. Models
> > >> based on the different architecture extensions would probably be mor=
e
> > >> useable in the long run; maybe "custom" has a place for testing.
> > >
> > > If you can set the features against "host", then any testing could
> > > be done with "host" surely, making 'custom' pointless ?
> >
> > We might differentiate between "do some consistency checks" and "allow
> > a completely weird wolpertinger"; if we agree that we don't need it,
> > then we surely could drop it again.
>
> Yeah, FWIW, I agree that it's best to drop "custom" if all the
> meaningful tests can be handled by being able to add/remove CPU flags
> from `-cpu host`.
>
>
> Related: I don't see any mention of `-cpu max` here.  Is it not
> relevant?  It is currently defined as: "enables all features supported
> by the accelerator in the current host".  Does it make sense for `max`
> to allow disabling features?  Or is the idea that, why would you choose
> `-cpu max` if you want to disable features?

Ideally, disabling features would work with any '-cpu' option
(including our existing TCG CPUs). (The main reason for 'max'
is as an option that works whether you're using TCG or KVM.)

-- PMM

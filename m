Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp548141lfa;
        Thu, 10 Jun 2021 07:26:18 -0700 (PDT)
X-Received: by 2002:aa7:c7c7:: with SMTP id o7mr5194034eds.231.1623335178158;
        Thu, 10 Jun 2021 07:26:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623335178; cv=none;
        d=google.com; s=arc-20160816;
        b=gaz4hg5+iSpyFakapbBB7E0KeolHZHWbBuEOqVu1NnI/SXprmxy91eLlKGeEyjlkwh
         5Gxa4Sqt1s30+aIwwXDZUA0vY3wQTlq8GNm90W+8x3baUYaFCZbvrJfAdSQEi4FEMysn
         WlxZvMMgj6htwvTfMl4ztpvRoqOAE/SzDVql301BedmtTaTXptsiaTDmR2zGfI1F8+hU
         Z5hnfhWpyoTrTtdSK8jsxxOSnuDW+uBxBiXfxihH1EQ1yB+s4SbFt8shoD0TVrJpy0AQ
         X3ktjGCyAUO+QcyLTK7uTlpKfiYzVh3uEGYAVoFe/dxG1tFlUATpGRhcRSZJiEgR9RgN
         0j2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=81SMQU+t0cJZ1cQ8798i8DpIPvrCW27Vrxe7wfzWkMo=;
        b=MYgz4Z/8l3jk6zPvDAeUsDaGatxjo4w3+Lp76DySeyrEWkjbrEcjgsYK3XSh2x051/
         YDV5HPOVHJe/jlXLUjcipMRrwPsfiM0UVml3ab09WwM79NP+Bea6yg3gjO02IKs1ltzn
         RgJkVnxIF05zqxX1dSJj+v6K2QztQ5KwSv2pSXW0kXg4q+YuW2rtelFWkLi8jlwe006H
         QGOI2oXSjZViYMm/g7XBhG0ja7Kc8XKQj8VOq4/WxRPwsrwgW9jIH38rvYQmGapd4/uS
         NqVU8/efDKRTlWR1FfnIaP3mitACrz1JNebsPliVexIKSAmqFIkJTeD/IwRptzYh5lMf
         9spA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PHAd2CLn;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id jg15sor1923727ejc.19.2021.06.10.07.26.18
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 10 Jun 2021 07:26:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PHAd2CLn;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=81SMQU+t0cJZ1cQ8798i8DpIPvrCW27Vrxe7wfzWkMo=;
        b=PHAd2CLnh3mLSIcyUEWKJh3G8ublAVD8hdoyPEIrfzBXZrBgNCJss07uBr+NFQoX8m
         Mq1TzF00O6efmR8+Tz7ez7ISutdU58CTEvNTIBGTHTOhmvkj3XF82oamXSOjd0VEGS6u
         CkFRAIVeKSv+B/G6K7891JHZ6ipU+VuNibFqigDSxOMTma58ssJ6o7yLzv8Ez8cQyv5S
         8fvf1DzlV3HD21Vf/aGcx707ey305eof7pOnps252Eby9gBYQhBs+8ebG80e9zwSPA/I
         FOGrC7gOVVaArmI5z022cf6iApy0FWUFV0QW2Q2A9diu8IuIihftrYukDnLYpYB3UOVp
         /9DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=81SMQU+t0cJZ1cQ8798i8DpIPvrCW27Vrxe7wfzWkMo=;
        b=Sfy0XOBP1FMH+zSR6wxkTLbtY3Fc4K0Kj1CRTa0PTBfX7eWMGjRbxaGUwntecoOCUS
         KIb8FzqDEqQasZil8eL3sb5olY7dL//EJRkgopsZz0Qj1eFHKF4Pb+iuIBm8fKomi1wh
         luTLnLkzvhw+cA3GQTKf4SrUz79JrYCa+6xwmNgDHWev9gRngxHwBreGC2bTWoa3uT0f
         zkwjCeFiN31+EsiE6cRngcbO3t4qw+dejqKKQA3LZKgRzgWrBCS+/JmcwIWQ/6OGpJSS
         dTZ49ILsf/nN0FHH0Q9lhXsBq10zFTn5ds5fP9YUvt31/6aXpDr8xOEeON59azXjg7Ie
         HWow==
X-Gm-Message-State: AOAM531+dLozwKRShEKX0RZTq2MCjRNBdmm8GvNgSsxyv1lnqlnoYeC8
	dk1p0sU7DHmdVeqJj8FdqBliVNIL/AVK6xsVKWlk/Sl+frfZSQ==
X-Google-Smtp-Source: ABdhPJyHu3dZC+3iLTzCERGod8IDbvpT/w1e6ILS3mz7jPe4f3Cb6wrCsVIJvzKTAhdanMZwNlCasXf2BFrjGBvTPfg=
X-Received: by 2002:a17:906:a108:: with SMTP id t8mr4762519ejy.407.1623335177856;
 Thu, 10 Jun 2021 07:26:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210610102617.17281-1-alex.bennee@linaro.org>
 <CAFEAcA9yhRS_=zr+76HdDN=iYU=ghDjLPfSaFUA9fzmJ5p3vCA@mail.gmail.com> <87im2liz4x.fsf@linaro.org>
In-Reply-To: <87im2liz4x.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Jun 2021 15:25:44 +0100
Message-ID: <CAFEAcA9NYv1GdA+2P_7hbqgBwRTv6JFgfp1mS_PzURY-aafkeA@mail.gmail.com>
Subject: Re: [PATCH v2] semihosting/arm-compat: remove heuristic softmmu SYS_HEAPINFO
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	Andrew Strauss <astrauss11@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: CnmN7XnKyBOA

On Thu, 10 Jun 2021 at 15:16, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
> > I'm told that the Arm C compiler C library always assumes that
> > the "stack base" value is what it should set SP to, so reporting 0
> > for that will break binaries that were built with it.
> >
> > As the TODO comment notes, the "heap base" is a bit of a guess,
> > but putting stackbase at top-of-RAM seems generally sensible.
> >
> > What bug are we trying to fix here?
>
> Having newlib use a value that's wrong and therefor plant it's heap in
> the middle of the loaded code.
>
> > I think one possible implementation that might not be too
> > hard to make work would be:
> >
> >  (1) find the guest physical address of the main machine
> >      RAM (machine->ram). You can do this with flatview_for_each_range()
> >      similar to what rom_ptr_for_as() does. (It might be mapped
> >      more than once, we could just pick the first one.)
>
> Currently this is done by common_semi_find_region_base which pokes
> around get_system_memory()->subregions to find a region containing an
> initialised register pointer.

Yes. I am suggesting we throw that code away, since (a) assuming
any register happens to point in to the main RAM is dubious and
(b) iterating through the subregions of get_system_memory() is
not guaranteed to work either (consider the case where the system
memory is inside a container MR rather than a direct child of the
system memory MR).

> >  (2) find the largest contiguous extent of that RAM which
> >      is not covered by a ROM blob, by iterating through the
> >      ROM blob data. (This sounds like one of those slightly
> >      irritating but entirely tractable algorithms questions :-))
>
> Does that assume that any rom blob (so anything from -kernel, -pflash or
> -generic-loader?) will have also included space for guest data and bss?

Yes; the elf loader code creates rom blobs whose rom->romsize
covers both initialized data from the ELF file and space to
be zeroed.

thanks
-- PMM

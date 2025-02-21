Received: by 2002:a17:504:5c6a:b0:1be9:327d:8ee3 with SMTP id dm10csp479435njc;
        Fri, 21 Feb 2025 10:25:31 -0800 (PST)
X-Received: by 2002:a05:690c:6306:b0:6ef:92e0:a989 with SMTP id 00721157ae682-6fbcc38b77cmr39551047b3.23.1740162331576;
        Fri, 21 Feb 2025 10:25:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740162331; cv=none;
        d=google.com; s=arc-20240605;
        b=V1dkp04jKHK4kDr7RirwSwAnen6IfuxAcSsmcNACJG9MApMeziG9aV0zuBAaNol+Gq
         6ZX/CSU4zvnS8yKQ+kiEH1KY3iLq0IOiVXKXwP/gTOTMr47haEHXLAEktUrDpJJ4tXwn
         XBUWBRD741Ij9gh326uWgjRlk3b/sEqVxEWzu5beGPjVpSdOlqDwY98KU9xNRZ48l0eb
         d8EOEO5YMF9ZcKY98+0gj0YxEBCawdKdqpNor3JotMB+m7WCOINaXzaHXl96BNNACH6U
         hQ1OYoFqWwdDiPF/8UuCF2RyUPQ3XRENETy4GZ35pmX7Fv9s1Hf87by4l7VHsyhkLXCc
         zvLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aGhca+FtKWVAOMd7qYj10v0KdJR1NfirrXY/isbPnrA=;
        fh=1gFsNVOkCaFtF0s4XFuQFGkH67ymas30vbUqz+gqXv4=;
        b=lc5dz7vGEr8AEJyg6RwbP3AV82svghWQL3vLekdrEp9Xbp2LxWH37ZQP0TsjPCa9JC
         xEIdkmgGkXQKwWY38quMJpCAMqSHG6fg6DVxV6qVlrbFzmUjeEBZ3X+kvOz6w06JGtEQ
         ULqkhVPYhh79MIgfuPQvRIeCT3QKtaZTMqrR5+B1/lbfo9bsnzYKh+vGpvkSkc83RIII
         /GUMFnacGOSvUxdiSHKP/o0mAQnn7DcX4x2Y8KCCi7xV9n2nscCtGmqYidQHMQv4qDrT
         T5GsZj7td+clu+eEOPSSOWjpBnuNfbB3dww+Qt1XiSaDpWSJdaNRTbfbdw06ZhgRTl4g
         QKeQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=I5Ghfk5Z;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 00721157ae682-6fb35d5f761sor116102877b3.4.2025.02.21.10.25.31
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 21 Feb 2025 10:25:31 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=I5Ghfk5Z;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740162331; x=1740767131; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aGhca+FtKWVAOMd7qYj10v0KdJR1NfirrXY/isbPnrA=;
        b=I5Ghfk5Z9H5Z6tCoPGma3mKHCdQtmHjcQ3qpLLc2X31masKNPnolIWy+T19nDNkEW+
         H7bs2W0IBBf8KP+l0kDTsC7QdQv4JVDxG1giug7rbotqhbC7UH6pxTuxGbU+VqDn7+np
         SKljh3y1wnOCBwrhdFw5dHt51JwWeXNO8GyQXbFGIryls5un32JhMQ3+u3Z/Xw+sm0Wg
         6hzoajxuv4eefiOlnb5/vqo7q+M34YoNFJpRNd2fa3gwZuKByT5IOWKdRwJnpdDgDmDC
         xg6pwbH+rERvTJw8p0WGt2Fn72e05w0jqnCJowIddo7v/M7JkkJh5Nxq38mhyMc10CXB
         gOIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740162331; x=1740767131;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aGhca+FtKWVAOMd7qYj10v0KdJR1NfirrXY/isbPnrA=;
        b=FfVOI/SkVdI+NOeJtxMkDZ/JCVNWfZYVfiZP42n53WnwTgvZQIx+nlJY5dj86N/Smx
         dcb0xpZt1xjhGq5W7qN4DM3o3qYT3Dgevk8yprOf1QtpJND/2vhNa/01NfJpFRC5crCg
         k/VD5749IcSGrMIDwtKjccg+w3WwA78rOS8SdjRPnfBAF6JRfxebWg1zO3JsuYGDr9ip
         76DG7iIQu1nKtxBQKHd+cRLPQ6lT+y8pQJtQq+t4N2u7ur3ycAsy/MkLfTArPl2WePyU
         h90Jbiwhm8xkEJrnKmOf2VHOgt3E1t2ZFXzP31as4zukXMbPeujRASC/pnq9mWv7vrpp
         BPdg==
X-Gm-Message-State: AOJu0YwuvoDMFGWU+NLu+8rCUrkjQfqwsioUIIdddDonyenlFm3qUtnJ
	wN8yYaKTadKs+mGSkcdvadc0mIztrLfO24VUqx7p7+Dzx4fh853rbmR5SzJTmjl3XeRiphCKiya
	L5CTOEfgp9bEc6sww3xCiojxnJHqC5xSFBhmRd+r25evLrrWUx80=
X-Gm-Gg: ASbGncsezwXLhCwaQaSOUI77JQIQPCpjxSQHp09ljbSdShZceQfxmRV2I1weAjv9yoT
	8ZxT+IxxmuccFfbjMw7lT6neDOfIQTkUdVDc4WB9k9gwHQpSuf4tgB6WvtK/6rDAvxZ9+qCaCAA
	Ptg8ylXpPK
X-Google-Smtp-Source: AGHT+IHS6Q7iuU3S2eVklWSsBu42hijBhcZV71sMaYmfo+Hua8Ko7uugsQY7LfkjQJYssYhtPvElunzM0cMBHphQoZ0=
X-Received: by 2002:a05:6902:2484:b0:e5d:df2b:3b13 with SMTP id
 3f1490d57ef6-e5e2466eeddmr3263002276.32.1740162331081; Fri, 21 Feb 2025
 10:25:31 -0800 (PST)
MIME-Version: 1.0
References: <20250204125009.2281315-1-peter.maydell@linaro.org>
 <20250204125009.2281315-4-peter.maydell@linaro.org> <87wmdjgor4.fsf@draig.linaro.org>
In-Reply-To: <87wmdjgor4.fsf@draig.linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 21 Feb 2025 18:25:19 +0000
X-Gm-Features: AWEUYZnGh1x1lMuI20asvT9Pcg8yCg1___Vm2MlNcBFXwueu9Gknb7oYMleXZX4
Message-ID: <CAFEAcA_UsSNGWUE8uzScepxQoPydd-=s2UpUeRxiN_WSdd11XA@mail.gmail.com>
Subject: Re: [PATCH v3 3/9] target/arm: Make CNTPS_* UNDEF from Secure EL1
 when Secure EL2 is enabled
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-stable@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: Uw7wvllCI9Ov

On Fri, 21 Feb 2025 at 18:02, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > When we added Secure EL2 support, we missed that this needs an update
> > to the access code for the EL3 physical timer registers.  These are
> > supposed to UNDEF from Secure EL1 when Secure EL2 is enabled.
> >
> > Cc: qemu-stable@nongnu.org
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >  target/arm/helper.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/target/arm/helper.c b/target/arm/helper.c
> > index ac8cb428925..7ec1e6cfaab 100644
> > --- a/target/arm/helper.c
> > +++ b/target/arm/helper.c
> > @@ -2387,6 +2387,9 @@ static CPAccessResult gt_stimer_access(CPUARMStat=
e *env,
> >          if (!arm_is_secure(env)) {
> >              return CP_ACCESS_UNDEFINED;
> >          }
>
> Hmm this failed to apply as b4d3978c2f (target-arm: Add the AArch64 view
> of the Secure physical timer) has the above as CP_ACCESS_TRAP. I guess
> because I didn't apply 20250130182309.717346-1-peter.maydell@linaro.org.
> I guess this needs fixing up for stable.

There is a Based-on: tag in the cover letter which will tell you
what this series should be based on if you want to apply it.

Yes, we'll need to either tweak this commit for stable
(i.e. use CP_ACCESS_TRAP_UNCATEGORIZED instead of UNDEFINED)
or else pull in the refactoring patches it depends on.

thanks
-- PMM

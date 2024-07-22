Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp1800805njc;
        Mon, 22 Jul 2024 02:35:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXXmMBNl3+iK4tp+qJnskgsdIIGcNwcjto2rSUFu5lO3oOf44PMMC7jl2mJVMCjJj7Q/6YyBEz/p+GWK+XEndbXM7cvg31J
X-Received: by 2002:a17:906:7955:b0:a77:e58d:d8db with SMTP id a640c23a62f3a-a7a4c11a0e9mr480640266b.32.1721640951401;
        Mon, 22 Jul 2024 02:35:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721640951; cv=none;
        d=google.com; s=arc-20160816;
        b=ECo5awAkXvFkJe+qI2GIOeGXdz1fKQBnDasv6IAnuq9DWLbCesX6mL95p2oQiciRSC
         UY825RgVDNv+vmLcmjdKcuMxmTGLooZsaNjbRK0U0baz4G1q0wdy231+AhnNcwBZZH/N
         /BB50UlAfe+QiZm0tnHSKXrnNNfdVnXU1v/3YN+cJNoi54bZ3iDYU/5iL2G4EDjTfXXZ
         bCTd98c9sSk1orfNGL1XJQ2+qx9LjlYznFxXJE8iVkHyI0chA8rLB+ZMKHWdb3Zk7uGH
         839GLs345WLop1OwPT4btZ0YNJMpwcUDU+5RZSYis3Si+U5ejBk6UflJxFVS7y4fgHzU
         cfNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eM4bYlLIsa6qOQFNtj/1SgGY18SzVeAM45woCRGVDOQ=;
        fh=g57m0dzb6XjHTQ4al9vBSkUQuau0KwmagqNT9edVXw8=;
        b=gFnn0nm4ZB7y/DVw04tbWQzK57uv8bpE1I8AMLzphcYf2ARfDnO5x/D4p4EC3TQxWf
         z+LDfNgL0yxcCO1130RIqruu1iwfltc0OJf779VhnMVEPqAlEwCr9LNRqMJKTxzjV0qW
         7w6w6GFsbjh7vZdQ+mwibH5vbUyDcnwW6/9SMBltJCaBdZqHJKYWtBlII7ONZFyqoDIS
         9/v4OhJixrugocg+ZP1Ct9Qk4sXmF2Yt7mVwboKgOI0PWzAPKQKYcuf96c+DvhGxHs5s
         c6rg57MwDHnK/A+NjTxTGI/XJoNTpbTOlZ6gp+oXuMBZI2NmqZ1jRqDPCV2n1shqTKi3
         Fh2A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TetCJZvB;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a640c23a62f3a-a7a3c7b66aesor105454066b.5.2024.07.22.02.35.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 22 Jul 2024 02:35:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TetCJZvB;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721640951; x=1722245751; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eM4bYlLIsa6qOQFNtj/1SgGY18SzVeAM45woCRGVDOQ=;
        b=TetCJZvBH+kk6ie4hNhCtX4B+a4pXX6U2rT5a10DxnffDjGTygaia4cyCbz7vE9qjP
         l9KQWz5b4+LODLWZXZi796o8phzn8pxmJPh8btQ+/0Pvv1gdF98w+t1urNrBUSaf+kEj
         5Xz80L2QxfVuvqNpUGQHA7jG8v93yop0sCF0h//z/W0dQfyLclJ8A6asw2bM2sgB7liX
         eM+2LZGD7j/Z9i2n5RGC7rW7niXvPxdLS2MYKzG4Fo5eLT/He47Yn/1zjrjinWPNDu4P
         8cHC5VGOq0NZfxMInqURn+b9zeH4RUsLGN+OhlyLR2lLXUSPj+gQPx3gAtwWnKlfHLt1
         cUXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721640951; x=1722245751;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eM4bYlLIsa6qOQFNtj/1SgGY18SzVeAM45woCRGVDOQ=;
        b=YFH7QKaPRvpDFnnknCcPpViipsZRrNCs3/BQcVwpyAL5iiivIr920HOImlysbBPb3H
         tUnI8/eUhkGTJ7Tvr3MMrprCII7QublwN+e0IBV+NHI/1wOI8XeWXWLmB0r2uCEaK6o+
         b+0huC2jVuFIkdFF0Svwpq7Yj59IoXPpQD1Xa8lKBaU5ylq0X21cHBEYOqhozYWYTx7P
         0hOozt56fotWJYyW/aIVfLZ2l7rvDsDbtJUuVK3gdSiKvGk3Vb/3rI1jYS5n8KL/Hg3D
         4j2/bzDkbX4l3dcNGfOoak5LbxRdgU7HWs5Q54Z87MNgY/p2Rjce2F/zXmzEdnC/uz1y
         3y8w==
X-Forwarded-Encrypted: i=1; AJvYcCU5zQsMwFLbsclS9Al27bpKXERC/queG8GGD8sPSy8DGCRVB7JiaN9JR3mRRQJU2jGxU7hQ1fwAsDIjHK9DPfzvyw70LXU2
X-Gm-Message-State: AOJu0Yw1OyvcOQv9+6jRdalCAoxMLM+cu/BMYK4rH9zxGWZVuwigO4p/
	wY/MR+9xQZzL0ql2k+iOyMXvYp4SoaEq40a1GtKVL8BOC8gUCdQAwEwuYzTITSLE1QLD0ItoBvR
	DwiAjI0lU+EU5NHFU9dvUBgrxFQvEg1t4Vt008d3P
X-Google-Smtp-Source: AGHT+IFDB52tm7aud7zWQ0LoLaQEqIhpcVNFlt3QMtZYb+eqULUWqIjkbpfZbZSoET5rMrjFXqT/uCMWnBQayDZWkXo=
X-Received: by 2002:a05:6402:358d:b0:57c:c3aa:6c68 with SMTP id
 4fb4d7f45d1cf-5a479a6a16bmr4605978a12.20.1721640950753; Mon, 22 Jul 2024
 02:35:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240715084519.1189624-1-smostafa@google.com> <20240717150931.GA3988597@myrica>
 <1e7e750b-61bd-4822-8742-124bdf66a7c4@redhat.com> <5684927d-d890-42be-841c-ece681502503@xen.org>
 <a0ee8ba3-174f-4d00-807f-31584cba42d4@xen.org> <CAFEAcA8T3Yrj_R-B2oUW_Uu3u5HZs4RY1P+A7zF+8xWJnmtpQA@mail.gmail.com>
 <Zpw2I2ATUqDt19qv@google.com>
In-Reply-To: <Zpw2I2ATUqDt19qv@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 22 Jul 2024 10:35:39 +0100
Message-ID: <CAFEAcA9zBE6qk5fgRrck_i34NETMU44frQhFJ74iv81+BEvOpw@mail.gmail.com>
Subject: Re: [PATCH v5 00/18] SMMUv3 nested translation support
To: Mostafa Saleh <smostafa@google.com>
Cc: Julien Grall <julien@xen.org>, eric.auger@redhat.com, 
	Jean-Philippe Brucker <jean-philippe@linaro.org>, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
	alex.bennee@linaro.org, maz@kernel.org, nicolinc@nvidia.com, 
	richard.henderson@linaro.org, marcin.juszkiewicz@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: lRI+uwTiMHh3

On Sat, 20 Jul 2024 at 23:11, Mostafa Saleh <smostafa@google.com> wrote:
>
> Hi Peter,
>
> On Fri, Jul 19, 2024 at 04:57:18PM +0100, Peter Maydell wrote:
> > On Fri, 19 Jul 2024 at 16:36, Julien Grall <julien@xen.org> wrote:
> > >
> > > Hi,
> > >
> > > On 18/07/2024 10:43, Julien Grall wrote:
> > > > Hi Eric,
> > > >
> > > > On 17/07/2024 18:43, Eric Auger wrote:
> > > >> Hi Peter, Richard,
> > > >>
> > > >> On 7/17/24 17:09, Jean-Philippe Brucker wrote:
> > > >>> On Mon, Jul 15, 2024 at 08:45:00AM +0000, Mostafa Saleh wrote:
> > > >>>> Currently, QEMU supports emulating either stage-1 or stage-2 SMM=
Us
> > > >>>> but not nested instances.
> > > >>>> This patch series adds support for nested translation in SMMUv3,
> > > >>>> this is controlled by property =E2=80=9Carm-smmuv3.stage=3Dneste=
d=E2=80=9D, and
> > > >>>> advertised to guests as (IDR0.S1P =3D=3D 1 && IDR0.S2P =3D=3D 2)
> > > >>> For the whole series (3-9, 11, 12, 15, 16, 18):
> > > >>>
> > > >>> Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > > >>>
> > > >>> (and I think patch 16 is missing Eric's R-b)
> > > >>
> > > >> Jean-Philippe and I have followed up the progress of this series,
> > > >> Mostafa took into account all our comments and all the patches wer=
e
> > > >> reviewed. It seems to be in a pretty decent state so if you don't =
have
> > > >> any objection, please consider pulling it for 9.1.
> > > >>
> > > >> On my end I did some testing in non nesting mode with virtio-net/v=
host
> > > >> and I have not noticed any regression.
> > > >> Would be nice if someone could send his T-b for the nested part th=
ough
> > > >> (Julien?).
> > > >
> > > > I haven't yet tried the latest version. I will do that in the next
> > > > couple of days.
> > > I see this is already merged. If this still matters:
> > >
> > > Tested-by: Julien Grall <jgrall@amazon.com>
> >
> > We can't retrospectively add the tag, but the testing itself
> > is still important -- thanks for doing it.
> >
> > Q: is there any reason not to:
> >  (a) change the default to "nested" rather than "1"
> >  (b) make the virt board (for new virt machine versions) use
> >      "nested"?
> >
> > AIUI "nested" should be a superset of "stage-1 only", the guest
> > can just ignore stage-2 if it doesn't care about it. Or is
> > there a performance hit from having stage-2 around even if the
> > guest doesn't enable it?
>
> I didn=E2=80=99t do benchmarks, but from the code, I don=E2=80=99t think =
there
> would be a difference from using stage-1 only or nested stages
> with stage-1 config.
> I didn=E2=80=99t make =E2=80=9Cnested=E2=80=9D the default stage or used =
it for the virt
> board, as I was worried about compatibility issues (I think that
> breaks backward migration), but otherwise I don=E2=80=99t see issues.
>
> But if I understand correctly, setting that for virt board 9.1
> (virt_machine_9_1_options) would be fine?

Yes, we would need to retain the old stage-1-only config on
the older machine version types, but we could switch to
nested by default on the newer ones. It's a little late
I think to make that change for the virt board at this
point in the 9.1 release cycle, but we could do it for 9.2.

thanks
-- PMM

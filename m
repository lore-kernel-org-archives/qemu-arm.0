Received: by 2002:a17:906:faca:b0:92b:dcda:f23e with SMTP id lu10csp483258ejb;
        Mon, 13 Mar 2023 10:03:20 -0700 (PDT)
X-Received: by 2002:a17:90a:c218:b0:23d:1143:1e3c with SMTP id e24-20020a17090ac21800b0023d11431e3cmr3053398pjt.44.1678727000670;
        Mon, 13 Mar 2023 10:03:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1678727000; cv=none;
        d=google.com; s=arc-20160816;
        b=Cj2Sn/X4+xzuCm8m8NM+Q3kXwXg4ad9h2vf6fAKwKG2+8MTesM72XWf1snpJdoTfZ/
         FwC/f4mnB29GL3Qqygfn49+wlH7upFnXjg8o6SS4iBUZJqVEUGx8yG1BuD2OErvJDjp2
         BGsGtUgGcvKbWd/2smVbGN0dpaDnaF3QQLL3+OmAbUl/SxULk4Q/kXc2RXeXrsPobIB6
         Lh6uUWBayKRSDLR8J8qtptyZq2m5QQ8ULflHG5dHFCBF0vFtrEQliz+pLpOmLdVjdqgt
         k156WYeuo8C3Y9fje/GErr+PjJ2z2eO5hNFNnrAsMDtV30q2/fijW+OQAheNeJ6QLMJY
         oPcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9A4VG1yBsYex5nOTA4gFK3TUgwE2wOw9iF2IMNEylVY=;
        b=Tmh8iEJiAV7MBhVbdF/J9gn6tCvydSlv9njfDFZrsaEDfDYhVXOwh8ugguM3gABXzy
         Tp+ow+3BScuxkTgUP5k29hJI4iZur4ZFXe8aK/OhDqQXkuibBmDf6STqlmGRK0+UbJ6N
         7npyoT688sgu/N8SBFZj47od2uDArlNOazmvmNS7xEXWj0KodowQqGog0HQS12wHgQk/
         QAMaYzvK2Je3KPLqWiQ6Q16r1iviIk1q/NmGUQ4RZPsdpMhiqpOzCt7w58JOMo/rdzTW
         fhpfkTqhvbB7G3XfSp5ZW854CAt748jo06sgeBN6FSVwFebqfdCx5ExclWHdWDav2KRC
         hAWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JHZBBW6D;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l1-20020a17090a72c100b0023d059fa83asor86837pjk.43.2023.03.13.10.03.20
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 13 Mar 2023 10:03:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JHZBBW6D;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678727000;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9A4VG1yBsYex5nOTA4gFK3TUgwE2wOw9iF2IMNEylVY=;
        b=JHZBBW6DDm+xsN/yzcjHr1we4dIeB9+QjNbJAf+NyWRw2hzNzdlzHR6MWC89l+3UVl
         rrOaE/rv8E0mWez6QqRWd78HYdXIxngzqZlWrs2Cl1dIb5rq1jpgrNXtYT3tEWcQAZEf
         3MNeXzxc1ARpZU3FNJXW5DFnA5UNON8zbQA77VIEckR5tN65/7dZ0AtB6zn/VAC7nnFV
         XgpJhDfGGPPcui1h1rxTvn4Ryauc2ggt7OXQ8v8/Kv7O/riv3jnS2+Z1SjAXPXAT1Dvs
         nbxjdEBPyT3iOtng9o0lRutC3V51NAHk9iRa++ze2Z2AZrgtpl7iLLhyhk1gD7ZJPhhh
         LZeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678727000;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9A4VG1yBsYex5nOTA4gFK3TUgwE2wOw9iF2IMNEylVY=;
        b=wgLBMtZLGZpx4Tq458mr1OgkTHO/eypwRi2rg5b/rbewcItUiAXz7UdummHC9saBe2
         EaM/AkNEsAZtqfF4c0vTc9+/hnVLqasUbhpQTvEXH6ZdXHJF1WclQkaPNXeQQWuAjoWM
         lq9M2BNShTmwlI6ReCbxWXJ6KDIqaibuj+fOKFHrvbhE795RwT1z+UncexCQM+mSxrai
         z3tpfVIADh2V/2frzhHxJEt9cAXnfzklLLlIXojdC8Tj3cgZu8yo3IuvHreJDlHsTGrN
         8BALTFvK0I09bHeps46RUkmjQVyply+rpYoNFxwp0+tTqu+hm1TdUo/sVqsIA9SNzEXu
         gy6A==
X-Gm-Message-State: AO0yUKWG8z4OvGqm/duKLiQiUcd6EaepZBB5jFCF+0a6/WDMiMXIPBaR
	YgeYTs+N9xBlrh1qzeo9VdaWoa7NSbobt5co6ESr3WDT
X-Google-Smtp-Source: AK7set+/DX2wljqRUN7vSYNOtpgXecZrTGpExHPS/JDlLBLjyUy4riZFdDctw/rkb/angUHA0q7G+nWYJ8x6dl1cO5s=
X-Received: by 2002:a17:90a:dd86:b0:233:be3d:8a42 with SMTP id
 l6-20020a17090add8600b00233be3d8a42mr12520900pjv.0.1678727000188; Mon, 13 Mar
 2023 10:03:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230310103123.2118519-1-alex.bennee@linaro.org>
 <20230310103123.2118519-11-alex.bennee@linaro.org> <c57c82bf-1b05-f29b-80fa-04a7279b5d39@redhat.com>
In-Reply-To: <c57c82bf-1b05-f29b-80fa-04a7279b5d39@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Mar 2023 17:03:08 +0000
Message-ID: <CAFEAcA94DQ9rhCwhXHUKQQG6QdWTVOLNEUcKk12t=_WVMtG--A@mail.gmail.com>
Subject: Re: [PATCH 10/11] include/exec: fix kerneldoc definition
To: Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>, 
	Wainer dos Santos Moschetta <wainersm@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, 
	Peter Xu <peterx@redhat.com>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Beraldo Leal <bleal@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: yyGDrbrvopZB

On Mon, 13 Mar 2023 at 17:00, Thomas Huth <thuth@redhat.com> wrote:
>
> On 10/03/2023 11.31, Alex Benn=C3=A9e wrote:
> > The kerneldoc processor complains about the mismatched variable name.
> > Fix it.
> >
> > Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> > ---
> >   include/exec/memory.h | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/include/exec/memory.h b/include/exec/memory.h
> > index 6fa0b071f0..15ade918ba 100644
> > --- a/include/exec/memory.h
> > +++ b/include/exec/memory.h
> > @@ -1738,7 +1738,7 @@ void memory_region_notify_iommu_one(IOMMUNotifier=
 *notifier,
> >    *
> >    * @notifier: the notifier to be notified
> >    */
> > -void memory_region_unmap_iommu_notifier_range(IOMMUNotifier *n);
> > +void memory_region_unmap_iommu_notifier_range(IOMMUNotifier *notifier)=
;
>
> I also keep running into this problem ... I wonder whether we should run
> sphinx with "-W" to turn warnings into errors when configure has been run
> with --enable-werror ...?

We certainly try to do that: docs/meson.build says:

  # If we're making warnings fatal, apply this to Sphinx runs as well
  if get_option('werror')
    SPHINX_ARGS +=3D [ '-W' ]
  endif

Has that broken ?

-- PMM

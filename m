Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp137036njb;
        Tue, 4 Feb 2025 03:14:05 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXhd1AIvwPEZBD2ZOFl+cRTyLUuyrnmV1uz6feP76DlayXBM7PtP6Z4yUt/zRmXHB/BReluBKw0d1k4Yw==@linaro.org
X-Received: by 2002:a05:690c:708d:b0:6f9:77ff:7c08 with SMTP id 00721157ae682-6f977ff82fbmr24167287b3.19.1738667644890;
        Tue, 04 Feb 2025 03:14:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738667644; cv=none;
        d=google.com; s=arc-20240605;
        b=gxuMDZDAp1jRphbv8XLvxiQ4EZjuBzXvIF4xLoyQmOrM1QRG8dzeoyfuDyQDU2G3Ma
         npvDMeitTOthRPUtTWDSrXqMDsd3KUAnZmk6WmRvQHanzSSYnVVCn4W85/o6owC9krb1
         dmt85cY7s6X0hOQSDi9Dz4sSz5SurLBE73SNE026mZc+c+MjgNs292HeW8J1hQEFJRWI
         XUxVdSqz+JKfVBSL9wd8etd0K9nxuSoYIuZ7Bu7ZSWhK1gyPzUsaa9A4c25b53VImR7v
         CoJNjirDJqmRNIjlV9wMerVdT/SkfZwgZUE1A5jCjcBYIzb1uCJ5uaDKwCWJC7iEfEjy
         Bafw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=thiD4j80Mv7xsDwugV4l2c1tMBplcXNdWyHZacUZvWE=;
        fh=AwiBmS+QhUbPERtng4wGoc1pZw/yphna3HvihoNZ2G4=;
        b=fWT99W/DRK7moCTdI6NmWDDAEFUcEMBZZvh9QWekwqZY4QN8JX2sZ8wRKE2BKevm46
         w7mozvQfIzN9iJB6LDKArz23eTbaIIHjIiNAZ7B5olSYnGf1JFtHtmcZS007v8hudLnG
         HhSyTkJQdQqyAh66RZjbRrMoEsHupCvF7hsYtFWZ+QuvPpUL+Zv6ww7+aZcUlitrdHw8
         pmS4+W0WjWJNaUYc5KfNtjoRv/kX6W2ENRRdByIQ9dg1uPV8VnXBup3wuwlFhmQZyE73
         0LgvDDltA/VCzG0zBUw1eDWAB4a+pZbGueeg9nvcqmDQLYkWEqF88Mag73OCUOr6pc6N
         5ZWw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=smRrgGq3;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 00721157ae682-6f97b4aa8dbsor6732027b3.10.2025.02.04.03.14.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 04 Feb 2025 03:14:04 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=smRrgGq3;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738667644; x=1739272444; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=thiD4j80Mv7xsDwugV4l2c1tMBplcXNdWyHZacUZvWE=;
        b=smRrgGq31t9TSls0M96lxtRa0PfPp2pRo1S+WMDFU3R+c4mXX7pJiJUAeOHMegyO16
         xBSAESbOLChJ/SYjD49M9Ac0Ivq7TfqR0RaF7o9+YKFHIq0zQ0NqC7jFmBRFAF56Cile
         KiVcvo0HokBsu0ITiiRgdTNVngcChp/PkKZNgtC04VBEW0n0ecgEwUPbCbJbwyLi2aZ+
         JCHqhv8hQJI0e0B5sEmRwMUWPaRaJI+QY2W/mdCykG1JlupXwN9hfuApE6bMUeqe0YQv
         UJAWZ8VXw9UrztaKRj45z51eN9kwCmxjQTyhGpRF1GUCU1ktlhanxTLWPst7N4mBGDpU
         8gVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738667644; x=1739272444;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=thiD4j80Mv7xsDwugV4l2c1tMBplcXNdWyHZacUZvWE=;
        b=DMOaQIdz5PZ3L3Nc7totiVMpuyq854hPC6f3qAL8UmNGJpfvZSPeyFDLc/AesFV7ti
         lcQLjArNiIaKeNQfelQ8XKUvDqHuDqvDuhXY023MkG1p4NewLhxTEM074on3mwG69Xv/
         kUHHUsSHEr1LKc/Z6V7C/moq5IcH9CvbAGoK8vb3RkbF+6Bp+EOENHSpL/ISYWco7jp1
         52KRwhNnAj9SqW0nCv4etKbwOdple7P/xG8Ry2ym9mmqp8OtP0O5xTM0Clms2H0Jho7H
         z8f5s5r7jALOiJfqTPWpRsLJLlm01yLAu1haBgtubMFlWoHbUzFlf1sbKmvz7B9ERqmO
         eayw==
X-Forwarded-Encrypted: i=1; AJvYcCVijU5eMEAV0BIBUnFpTb/vduDlbVYb3mWPNEb/mj0efoYV6Ay0QCMKeRC+tM0O7tAVNEH8/WnXlQ7igg==@linaro.org
X-Gm-Message-State: AOJu0Yzp90cO9oC+UXRASqIT20nXVb/cPtjdgZlq5FRIHGji7uAbztRf
	EBFWjapviIXlZFUToSRPw+uMKW2sw93MiFyfPtGCqqv+TpQo7f46XthSv4J3kMnYcipiuS4vXgO
	y4jG53jTGx46ZjS6Ua1xGTMfkvzxTmdN6hGwnIshVRB1qwnBGtlU=
X-Gm-Gg: ASbGncsAAwPknQrgV4DQQbNwvRcJPNz6UaJeE4ZBjpYch58WdgMBsubaDAtx1XF2BSa
	eia9QN+dm81jlNQPEpU2KgNNTHnCUTg/hPbWtxY/sJRWeJFJmirFyiOHlssCmrrFba3N/Hbxpxw
	==
X-Google-Smtp-Source: AGHT+IGKAxDPYAn2Q94DK/SSOg6Jy3Gb9mjRvvbtWorg28x3CPpX3c6Vhv8DfJrUh5p8nEIPKbx0D9ffY5AS9bNUKKY=
X-Received: by 2002:a05:6902:32a4:b0:e58:98d3:34c5 with SMTP id
 3f1490d57ef6-e58a4b7d841mr15497188276.37.1738667644406; Tue, 04 Feb 2025
 03:14:04 -0800 (PST)
MIME-Version: 1.0
References: <20250204002240.97830-1-philmd@linaro.org> <20250204002240.97830-12-philmd@linaro.org>
 <CAFEAcA-3JJ1tZAXsik5hAonuSO9sCqDF1xqPQVhAeN-XwAAhDw@mail.gmail.com>
 <e32a54f2-ef46-4964-89d4-a8969b6d1b05@linaro.org> <Z6HklNsu0Mzgh7bC@redhat.com>
In-Reply-To: <Z6HklNsu0Mzgh7bC@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Feb 2025 11:13:53 +0000
X-Gm-Features: AWEUYZl_B3Bj1KsctcUsgZ3kChxP7iL1n1klQlbOVCUPjF0vVDI27NqqpCnoLMY
Message-ID: <CAFEAcA9m8g=K-0RU31kswbNSKWnUqA78KxNkcXEAqR=BhWc9bA@mail.gmail.com>
Subject: Re: [PATCH v2 11/12] hw/arm/raspi: Deprecate old raspiX machine names
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	qemu-devel@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>, 
	Laurent Vivier <lvivier@redhat.com>, Ovchinnikov Vitalii <vitalii.ovchinnikov@auriga.com>, 
	Jared Mauch <jared+home@puck.nether.net>, Fabiano Rosas <farosas@suse.de>, 
	Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	devel@lists.libvirt.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: D30MvdGwqdYr

On Tue, 4 Feb 2025 at 09:57, Daniel P. Berrang=C3=A9 <berrange@redhat.com> =
wrote:
>
> On Tue, Feb 04, 2025 at 10:51:04AM +0100, Philippe Mathieu-Daud=C3=A9 wro=
te:
> > On 4/2/25 10:22, Peter Maydell wrote:
> > > On Tue, 4 Feb 2025 at 00:23, Philippe Mathieu-Daud=C3=A9 <philmd@lina=
ro.org> wrote:
> > > >
> > > > All previous raspi machines can be created using the
> > > > generic machine. Deprecate the old names to maintain
> > > > a single one. Update the tests.
> > > >
> > > > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> > >
> > > > diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> > > > index 4a3c302962a..c9a11a52f78 100644
> > > > --- a/docs/about/deprecated.rst
> > > > +++ b/docs/about/deprecated.rst
> > > > @@ -257,6 +257,19 @@ Big-Endian variants of MicroBlaze ``petalogix-=
ml605`` and ``xlnx-zynqmp-pmu`` ma
> > > >   Both ``petalogix-ml605`` and ``xlnx-zynqmp-pmu`` were added for l=
ittle endian
> > > >   CPUs. Big endian support is not tested.
> > > >
> > > > +ARM ``raspi0``, ``raspi1ap``, ``raspi2b``, ``raspi3ap``, ``raspi3b=
`` and ``raspi4b`` machines (since 10.0)
> > > > +''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''=
''''''''''''''''''''''''''''''''''''''''
> > > > +
> > > > +The Raspberry Pi machines have been unified under the generic ``ra=
spi`` machine,
> > > > +which takes the model as argument.
> > > > +
> > > > +    - `raspi0`` is now an alias for ``raspi,model=3DZero``
> > > > +    - `raspi1ap`` is now an alias for ``raspi,model=3D1A+``
> > > > +    - `raspi2b`` is now an alias for ``raspi,model=3D2B``
> > > > +    - `raspi3ap`` is now an alias for ``raspi,model=3D3A+``
> > > > +    - `raspi3b`` is now an alias for ``raspi,model=3D3B``
> > > > +    - `raspi4b`` is now an alias for ``raspi,model=3D4B``
> > >
> > > This is not how we typically handle "we have a bunch
> > > of different devboards in one family". What's wrong with the
> > > existing set of machine names?
> >
> > Zoltan and you don't want to add more machine names, then you
> > don't want a generic machine. This is very confusing.
>
> IMHO we can have distinct machines for each model, but
> *NOT* have further machines for each RAM size within a
> model.

Yes, this was what I was intending to suggest. Apologies
if I was confusing with what I said the previous time round.

thanks
-- PMM

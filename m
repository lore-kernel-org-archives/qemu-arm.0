Received: by 2002:a17:504:6454:b0:1be9:327d:8ee3 with SMTP id g20csp68669njh;
        Fri, 9 Aug 2024 15:41:09 -0700 (PDT)
X-Received: by 2002:a5d:64a1:0:b0:36b:a9e8:6b5 with SMTP id ffacd0b85a97d-36d68890f15mr2839578f8f.10.1723243269105;
        Fri, 09 Aug 2024 15:41:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723243269; cv=none;
        d=google.com; s=arc-20160816;
        b=l3Pk3TzJn0sFIPIcmOY4R4i0ceEMzGrNXUmDwh+vGzhCYUkcYogzk3UfVOdlpAtrIW
         xk7ACiPZeP+VsCbPas4FfDzC3Rw0Vtimjeh9ZzETOypZhh/STVHHpfk4aROfiWgbf6kX
         gw8Id/oXbZ5BoQ07h6r2GZmPbuS5+aM4nu5ILaHbf21d2XCYcwa8sVNhT2iBSn4TAgzw
         8GBFHV2hysftEF/bQmjN3oz3p82iJLULi/0/EEh6h0WGS2GIgmbcvbLpV/Z3pplJO2e+
         Twpl4xqjrrLxwos2Y0/uOz7oQAZ74KF0vBzc8N9io+pwd24uYIDae+719hZUvhumxVFi
         2Kgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bUgArTUxkUr/gdGActB6xpXbU7KtEufqpylBuW/nwaQ=;
        fh=dMAHBPH+34W6K6SR8suxCCtZSBcgvbV7ZKwLQNkftbk=;
        b=D5XZumvCjKwefcSi5w85ECkjJWWV4DF63jizF4G7TESQZutCm6f5hGvcTdA4Dx6rSN
         9J887ieTGencG8tosZvMOKB4ZVGOTZnStBXqdQoRtZ8+x+5nGmqCz96Qy7L21zRAUupm
         328ChXvJ0xSbNfE09Fa2amUHt3qutuW3i9pTjxQvnH6asGon8n/x7aSU8kqbcEWgUPUq
         DEmnzoOjsS5iZ9ke9O9H6kyGumNv/XfZJl+urp98TKPZSYtsqQmQpAnvanyZ0DqZkRvf
         Hzgxrj+uv/8amKeEeKZ4SfSNbo0NO7sO7IPKKBOEytRBHUYCZ9OVjM0KjqxEGu1+3EF4
         /66A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=19RcEoR5;
       spf=pass (google.com: domain of tavip@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=tavip@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <tavip@google.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-36d29119849sor552127f8f.1.2024.08.09.15.41.08
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 09 Aug 2024 15:41:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of tavip@google.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=19RcEoR5;
       spf=pass (google.com: domain of tavip@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=tavip@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723243268; x=1723848068; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bUgArTUxkUr/gdGActB6xpXbU7KtEufqpylBuW/nwaQ=;
        b=19RcEoR5LVcJFP0IYPZUZDd7gkojm5RBA6/GKaKgsTMyPY4yzg0W7P8flpwXNt22YB
         YvWV+I3aORBTIsEdp/YOKDFoj3nXhWtLvJR+WfQJ3AEPHDPyqtMFpRiAlXs6Gd2uKbEu
         2YjJZqPNJ3joaQ/5NIp4ESd3BBvswCI8f/3dgXIVT4qfB53I+wZpK9G4hcmdRnvUobgr
         FAbJWny/XM/8vdf3zV0T3aQecn/IA5Hi8xxRU3oh2g+G/+YNDvLvIxNtCe7JLlR3Yh+F
         PrrS6xkRuCpxNBjs6pz6oCZztPP+u2wwLEX9dhlAfj5ARAmI7aw85MxndQUacBbVTLEI
         omCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723243268; x=1723848068;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bUgArTUxkUr/gdGActB6xpXbU7KtEufqpylBuW/nwaQ=;
        b=jdZDKc6vl5lxHH41/t0jaO2vDB7hBJz4zS8szi/R2bGeqFfku+rNY7Nka2WiGO3+Zm
         zGSFUgqgagnENILFz50F/LWDkjST82DVXchTYZdedR8xZPsXzTgFfAPRZQ8X274r3FfC
         7SlWptXAHIWJex1gGL4uo0peipZ5WtGGPyl5SzNrjz6+1OmLl6HngFlGvXY6phZ1fJ9A
         Pk6BAu9OaunmMSf+jqDmRvawJK9BKOl+5iYqsUrJSahfrP+8rC+Sv+IkHzJww5a+lcUG
         Wc8mU4kn5z+7ifUGbQAz2gm9HQzhYDAon5wpoHyPF75zrDVE5HuV/xIxD7ahe2fGFmre
         4wfA==
X-Gm-Message-State: AOJu0YxM7IN/R4CxPsj6NdKsRzTmLVt5saQLMY1pdP/JQTjQBYgI+55D
	ABrBsr8x6jR3q8RsbWtig8usxow2FJtuP4Hqn/d8jqgUL4hr/clR0EQ73ToRuIlhCRq7I0GqdHM
	QN28lTs7jiSjh0G1j/DZzXju/SvSaw0fNuyEi
X-Google-Smtp-Source: AGHT+IF5oEe3RjKF12yqz6+lvsGPXAuFpNInmch4ARUIyceiSNT9zLtiGPOfixPsb8rHZhyspY3R5lT3sfMDHNcps4o=
X-Received: by 2002:adf:eeca:0:b0:366:f455:e7c1 with SMTP id
 ffacd0b85a97d-36d6a226689mr2265059f8f.27.1723243268124; Fri, 09 Aug 2024
 15:41:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240805201719.2345596-1-tavip@google.com> <20240805201719.2345596-5-tavip@google.com>
 <87sevhrbjm.fsf@draig.linaro.org> <CAGWr4cTPqtzEvbd5s7xfMOzid90Gje6NSTGw1qR7r=Ao0xeAcw@mail.gmail.com>
 <ZrXdyEIFLulMN-gE@redhat.com>
In-Reply-To: <ZrXdyEIFLulMN-gE@redhat.com>
From: Octavian Purdila <tavip@google.com>
Date: Fri, 9 Aug 2024 15:40:57 -0700
Message-ID: <CAGWr4cTj2uZakF9bkjGFR1PMvyPirvNz-vwWo+oD72YwkDXA2g@mail.gmail.com>
Subject: Re: [RFC PATCH 04/23] hw/arm: add SVD file for NXP i.MX RT595
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	peter.maydell@linaro.org
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, stefanst@google.com, 
	pbonzini@redhat.com, thuth@redhat.com, marcandre.lureau@redhat.com, 
	alistair@alistair23.me, philmd@linaro.org, jsnow@redhat.com, crosa@redhat.com, 
	bleal@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: NsII4fNmjmjN

On Fri, Aug 9, 2024 at 2:13=E2=80=AFAM Daniel P. Berrang=C3=A9 <berrange@re=
dhat.com> wrote:
>
> On Tue, Aug 06, 2024 at 01:31:51PM -0700, Octavian Purdila wrote:
> > On Tue, Aug 6, 2024 at 7:06=E2=80=AFAM Alex Benn=C3=A9e <alex.bennee@li=
naro.org> wrote:
> > >
> > > Octavian Purdila <tavip@google.com> writes:
> > >
> > > > Picked from:
> > > >
> > > > https://github.com/nxp-mcuxpresso/mcux-soc-svd/blob/main/MIMXRT595S=
/MIMXRT595S_cm33.xml
> > > >
> > > > NOTE: the file is truncated to keep the email size reasonable. Plea=
se
> > > > use the link above and download the full file if you want to try ou=
t
> > > > the patch.
>
> "the file is truncated" wins understatement of the week.
>
> The full XML file that would need to be in QEMU git for this is 8.6 MB in
> size.
>
> The overall generated headers that we get from it are ~16k lines,
> or ~0.5 MB
>
> $ wc -l build/hw/arm/svd/*.h
>    135 build/hw/arm/svd/flexcomm.h
>   1227 build/hw/arm/svd/flexcomm_i2c.h
>   1161 build/hw/arm/svd/flexcomm_spi.h
>   1231 build/hw/arm/svd/flexcomm_usart.h
>   2243 build/hw/arm/svd/flexspi.h
>   3100 build/hw/arm/svd/rt500_clkctl0.h
>   4022 build/hw/arm/svd/rt500_clkctl1.h
>     64 build/hw/arm/svd/rt500.h
>   1073 build/hw/arm/svd/rt500_rstctl0.h
>   1697 build/hw/arm/svd/rt500_rstctl1.h
>  15953 total
>
> $ wc -c build/hw/arm/svd/*.h
>   4349 build/hw/arm/svd/flexcomm.h
>  51135 build/hw/arm/svd/flexcomm_i2c.h
>  43822 build/hw/arm/svd/flexcomm_spi.h
>  46331 build/hw/arm/svd/flexcomm_usart.h
>  89224 build/hw/arm/svd/flexspi.h
> 113952 build/hw/arm/svd/rt500_clkctl0.h
> 141885 build/hw/arm/svd/rt500_clkctl1.h
>   1881 build/hw/arm/svd/rt500.h
>  38881 build/hw/arm/svd/rt500_rstctl0.h
>  61449 build/hw/arm/svd/rt500_rstctl1.h
> 592909 total
>
>
>
> > > >
> > > > Signed-off-by: Octavian Purdila <tavip@google.com>
> > > > ---
> > > >  hw/arm/svd/MIMXRT595S_cm33.xml | 224052
> > > > ++++++++++++++++++++++++++++++
> > >
> > > I guess one thing we need to decide is if the source XML should live =
in
> > > the repository as the preferred method of making changes or just the
> > > translations generated by the tool.
> > >
> >
> > I think we might want to store the XML in the qemu repo, even if we
> > don't use it to generate the header files at compile time. This avoids
> > issues with the original XML moving, going away, changed in
> > incompatible ways, etc.
> >
> > As for generating the headers at compile time, I don't have a strong
> > preference. I like it because there is slightly less work to do and it
> > avoids dealing with resolving changes on both the SVD and the
> > generated headers. For example, the initial headers are committed,
> > then some changes are done directly to the headers and then we want to
> > pick up a new SVD from the vendor to support a new hardware revision.
>
> IIUC the structs/enums/etc are defining guest ABI. So if we want to
> preserve guest ABI for these devices across QEMU releases, we don't
> want the generated output to be arbitrarily changing. If there are
> different revisions of a device, we might need separate structs for
> each maintained in parallel.
>

I think we can review changes to prevent ABI breakages both for XML
and generated headers - unless we use meson git-wrap submodules.

>
>
> >
> > There are disadvantages as well: pysvd dependency for building qemu,
> > hard to review if the vendor dumps a new version with lots of changes
> > and we want to update to it for a new hardware revision, slight
> > increase in build time.
> >
> > > >  1 file changed, 224052 insertions(+)
> > > >  create mode 100644 hw/arm/svd/MIMXRT595S_cm33.xml
> > > >
> > > > diff --git a/hw/arm/svd/MIMXRT595S_cm33.xml b/hw/arm/svd/MIMXRT595S=
_cm33.xml
> > > > new file mode 100644
> > > > index 0000000000..8943aa3555
> > > > --- /dev/null
> > > > +++ b/hw/arm/svd/MIMXRT595S_cm33.xml
> > > > @@ -0,0 +1,1725 @@
> > > > +<?xml version=3D"1.0" encoding=3D"UTF-8"?>
> > > > +<device schemaVersion=3D"1.3" xmlns:xs=3D"http://www.w3.org/2001/X=
MLSchema-instance" xs:noNamespaceSchemaLocation=3D"CMSIS-SVD.xsd">
> > > > +  <vendor>nxp.com</vendor>
> > > > +  <name>MIMXRT595S_cm33</name>
> > > > +  <version>1.0</version>
> > > > +  <description>MIMXRT595SFAWC,MIMXRT595SFFOC</description>
> > > > +  <licenseText>
> > > > +Copyright 2016-2023 NXP
> > > > +SPDX-License-Identifier: BSD-3-Clause
> > > > +  </licenseText>
> > >
> > > This certainly seems compatible. XML is not the medium I personally
> > > would have chosen as a register specification language but I guess th=
ere
> > > are no other alternatives?
> > >
> >
> > I agree that the choice of XML is unfortunate but I am not aware of
> > alternatives, this is what vendors will provide.
>
> Given the size of the XML I'm inclined to say that we should just be
> committing the generated header files to qemu.git
>

Fine with me. I think we can also reconsider later with minimal effort
if this gets widely used and there is lots of churn.

Peter, what do you think?

> Then add https://github.com/nxp-mcuxpresso/mcux-soc-svd as a git
> submodule, and provide some meson rules for triggering re-generation
> that are off-by-default.
>

Sounds good. I was thinking of adding mcux-soc-svd as a meson
subproject via git-wrap as suggested by Philippe.



> With regards,
> Daniel
> --
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
>

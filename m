Received: by 2002:a17:505:1e8b:b0:1be9:327d:8ee3 with SMTP id mw11csp1351590njb;
        Tue, 6 Aug 2024 13:32:03 -0700 (PDT)
X-Received: by 2002:ac2:4e0b:0:b0:52c:db76:2a7a with SMTP id 2adb3069b0e04-530bb393e72mr14608891e87.34.1722976323402;
        Tue, 06 Aug 2024 13:32:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722976323; cv=none;
        d=google.com; s=arc-20160816;
        b=FI2lkeT+6fisipgnVeva8T483Se8HXHPYm1I1lDGIP7/SJUZHMAOlzDadWC7v6E/b4
         0BDAW+Obajvgl1FZQODJTvhU4jeIb8n7/bUd0WW7OkMvvL7ucX2q8In/1TqPqlirwkXq
         i02STXfu2VjJiT9oujAP3OJ6D1GIWx2vJl9JxDDgIinbw3SPUl+/jrW/rxDO+d8YB32F
         kOQ5rws4aAZhTFqdYjz4mbBgQi5fNaqvd8eTPwypU2HnIm3/i5HCBZ1jpCpOtYSB6Jzt
         VXFxhHleXQ7FH0LR+9m2CHKDmH23VGJNJXNkybyLwERe5cpB0HNHP98HVmyQbbfwPsyx
         rA8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4cVX+vdtRbjKRnJ8k+xGFwZU4CJUyuoBcJvY/3P8diM=;
        fh=z+da3h1dS3QDx14SI/zDnhCLoh8iY5ZS9gw+UGaZiKI=;
        b=zkn6RLrgs7C2J4JFxwClx+k0dpi2+Ohs0RVRuvPlrOCDDGv265cKjAPgFAl3X5wVoJ
         VhFwnk28LwK8zWT18KIRGMyrPoqJNCs3Fu1pkS+vyHs2BBfj8n2/AhAuWscMbUkQjCFJ
         N3D2Efxs5eN1BVfJvNJoEqitScP3GKQ0Ip9lKYYVlHQYH0RaIXVaa8Cskeny3Z9ktXVk
         IGWxt+qud+zBhZrqyfC9Pvv081XXoAwArP+QnoIPOu985r0Kcbe6Er+YXWbEl+eHPUH0
         Ragcc7mL8wAqFzxf+FC8ot27yLXUvfhR+HPX6S3ApuUjL7YdV7PykmDMPzF443a9WYdv
         6aEA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="17NC/Nwv";
       spf=pass (google.com: domain of tavip@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=tavip@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <tavip@google.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 2adb3069b0e04-530bba28868sor3108868e87.23.2024.08.06.13.32.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 06 Aug 2024 13:32:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of tavip@google.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="17NC/Nwv";
       spf=pass (google.com: domain of tavip@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=tavip@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722976323; x=1723581123; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4cVX+vdtRbjKRnJ8k+xGFwZU4CJUyuoBcJvY/3P8diM=;
        b=17NC/Nwv2fR3G+EMBylKIT4XgXwCLVo9BCn0DGKUp8jFYY5urgBkgvudbtYzyNyBDM
         UflHk7bYq/zXy2JvFD1EnFA9VpP8jiT61I9Sn7QpqZOKaw+8XURsDbcROo88gh0cY0Ha
         yZ3ezcv/VNzyTppDk26DVKwB5IPEjm8BEwOAA1NO0dVzrQaaWZB3RWYMGTD37onkQ58p
         yqpIRkkzxivK/6Q+qHcuf2MbxLjyv2EUaNryUTm0JvT/LNVl82poLqs99rOTkZv5Mdmk
         tX0bt/71kgtRO6aBZwa1uwwfPdTIJT+AeVlisRYlXurqCotnCzJkd7wzfpT2dDqyYrN9
         fg3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722976323; x=1723581123;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4cVX+vdtRbjKRnJ8k+xGFwZU4CJUyuoBcJvY/3P8diM=;
        b=s06Ui3ZZzNQX1KzMzg3hoOOBNjpi0/3EDyr2pprGDF9VCu0xC2Exl1s0pq04lNUrsK
         sUoNi54IuRDj3TltjPgWF8lXet+OKG2wEaMALqSUW0h24IM+ZQRAtvc8YVSiyJ2WI5i1
         WlARu8QR5jJRJJKRJlyU89bDo1wkys74aKyEXlxu1kjB9YEe51igOlM3GZatGsaQwSNt
         OqHayMz/iCIn6WJkC4Fq0N121nKpG/7o8oL0dEa31ETm3kw1M6d9l2mcv+K//6oOw1i7
         kSZ1/hQFNcRTJLyzQ1AMw73XApUQBczxDfqcP5u53lFrcf6BgTdbji9ka4rje2nvGXGc
         JlRA==
X-Gm-Message-State: AOJu0YzDwKBAnkNS+elNgy6EU+EOKgmEoYB499XLYhrHBEZXvx9JsZLa
	e/KJy8ndlXCrqkJtOwi3bgX24FeZdEWTiW/G2kTgje0fncTkbMGw5jjqIG3N+GgZjWrUde5VndF
	AbkT5V3SKEkqNXlBq9n4NTa5oHDBCfkEc53UhpIYjAUBEpXTROg==
X-Google-Smtp-Source: AGHT+IGnaA2iJo21TLuQQMRpw/lGKh4VDKXnI1LoFE9yLK0XuGW7Sg5g1oyL4c4KmcXrnnQfkU3+DiiAw2g09qKmb34=
X-Received: by 2002:a2e:b790:0:b0:2ef:2c3c:512a with SMTP id
 38308e7fff4ca-2f15ab5cce3mr134231271fa.42.1722976322307; Tue, 06 Aug 2024
 13:32:02 -0700 (PDT)
MIME-Version: 1.0
References: <20240805201719.2345596-1-tavip@google.com> <20240805201719.2345596-5-tavip@google.com>
 <87sevhrbjm.fsf@draig.linaro.org>
In-Reply-To: <87sevhrbjm.fsf@draig.linaro.org>
From: Octavian Purdila <tavip@google.com>
Date: Tue, 6 Aug 2024 13:31:51 -0700
Message-ID: <CAGWr4cTPqtzEvbd5s7xfMOzid90Gje6NSTGw1qR7r=Ao0xeAcw@mail.gmail.com>
Subject: Re: [RFC PATCH 04/23] hw/arm: add SVD file for NXP i.MX RT595
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, stefanst@google.com, 
	pbonzini@redhat.com, thuth@redhat.com, peter.maydell@linaro.org, 
	marcandre.lureau@redhat.com, alistair@alistair23.me, berrange@redhat.com, 
	philmd@linaro.org, jsnow@redhat.com, crosa@redhat.com, bleal@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: Rh/czRdOLxcM

On Tue, Aug 6, 2024 at 7:06=E2=80=AFAM Alex Benn=C3=A9e <alex.bennee@linaro=
.org> wrote:
>
> Octavian Purdila <tavip@google.com> writes:
>
> > Picked from:
> >
> > https://github.com/nxp-mcuxpresso/mcux-soc-svd/blob/main/MIMXRT595S/MIM=
XRT595S_cm33.xml
> >
> > NOTE: the file is truncated to keep the email size reasonable. Please
> > use the link above and download the full file if you want to try out
> > the patch.
> >
> > Signed-off-by: Octavian Purdila <tavip@google.com>
> > ---
> >  hw/arm/svd/MIMXRT595S_cm33.xml | 224052
> > ++++++++++++++++++++++++++++++
>
> I guess one thing we need to decide is if the source XML should live in
> the repository as the preferred method of making changes or just the
> translations generated by the tool.
>

I think we might want to store the XML in the qemu repo, even if we
don't use it to generate the header files at compile time. This avoids
issues with the original XML moving, going away, changed in
incompatible ways, etc.

As for generating the headers at compile time, I don't have a strong
preference. I like it because there is slightly less work to do and it
avoids dealing with resolving changes on both the SVD and the
generated headers. For example, the initial headers are committed,
then some changes are done directly to the headers and then we want to
pick up a new SVD from the vendor to support a new hardware revision.

There are disadvantages as well: pysvd dependency for building qemu,
hard to review if the vendor dumps a new version with lots of changes
and we want to update to it for a new hardware revision, slight
increase in build time.

> >  1 file changed, 224052 insertions(+)
> >  create mode 100644 hw/arm/svd/MIMXRT595S_cm33.xml
> >
> > diff --git a/hw/arm/svd/MIMXRT595S_cm33.xml b/hw/arm/svd/MIMXRT595S_cm3=
3.xml
> > new file mode 100644
> > index 0000000000..8943aa3555
> > --- /dev/null
> > +++ b/hw/arm/svd/MIMXRT595S_cm33.xml
> > @@ -0,0 +1,1725 @@
> > +<?xml version=3D"1.0" encoding=3D"UTF-8"?>
> > +<device schemaVersion=3D"1.3" xmlns:xs=3D"http://www.w3.org/2001/XMLSc=
hema-instance" xs:noNamespaceSchemaLocation=3D"CMSIS-SVD.xsd">
> > +  <vendor>nxp.com</vendor>
> > +  <name>MIMXRT595S_cm33</name>
> > +  <version>1.0</version>
> > +  <description>MIMXRT595SFAWC,MIMXRT595SFFOC</description>
> > +  <licenseText>
> > +Copyright 2016-2023 NXP
> > +SPDX-License-Identifier: BSD-3-Clause
> > +  </licenseText>
>
> This certainly seems compatible. XML is not the medium I personally
> would have chosen as a register specification language but I guess there
> are no other alternatives?
>

I agree that the choice of XML is unfortunate but I am not aware of
alternatives, this is what vendors will provide.
